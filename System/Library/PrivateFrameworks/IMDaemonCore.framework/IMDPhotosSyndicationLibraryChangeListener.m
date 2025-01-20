@interface IMDPhotosSyndicationLibraryChangeListener
+ (id)sharedInstance;
- (IMDPhotosSyndicationLibraryChangeListener)init;
- (OS_dispatch_queue)changeObservationQueue;
- (PHFetchOptions)analysisFetchOptions;
- (PHPhotoLibrary)syndicationLibrary;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation IMDPhotosSyndicationLibraryChangeListener

+ (id)sharedInstance
{
  if (qword_1EBE2B870 != -1) {
    dispatch_once(&qword_1EBE2B870, &unk_1F33914E0);
  }
  v2 = (void *)qword_1EBE2B9A8;

  return v2;
}

- (IMDPhotosSyndicationLibraryChangeListener)init
{
  v12.receiver = self;
  v12.super_class = (Class)IMDPhotosSyndicationLibraryChangeListener;
  v2 = [(IMDPhotosSyndicationLibraryChangeListener *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v4 = [v3 photoAnalysisInSpotlightEnabled];

    if (v4)
    {
      v5 = [MEMORY[0x1E4F39228] wellKnownPhotoLibraryURLForIdentifier:3];
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F39228]) initWithPhotoLibraryURL:v5];
      syndicationLibrary = v2->_syndicationLibrary;
      v2->_syndicationLibrary = (PHPhotoLibrary *)v6;

      v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.imagent.SyndicationLibraryChangeObserver", v8);
      changeObservationQueue = v2->_changeObservationQueue;
      v2->_changeObservationQueue = (OS_dispatch_queue *)v9;
    }
  }
  return v2;
}

- (void)dealloc
{
  [(IMDPhotosSyndicationLibraryChangeListener *)self stopListening];
  v3.receiver = self;
  v3.super_class = (Class)IMDPhotosSyndicationLibraryChangeListener;
  [(IMDPhotosSyndicationLibraryChangeListener *)&v3 dealloc];
}

- (void)startListening
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 photoAnalysisInSpotlightEnabled];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        syndicationLibrary = self->_syndicationLibrary;
        int v7 = 138412290;
        v8 = syndicationLibrary;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Started listening for changes to the syndication library. syndicationLibrary: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [(PHPhotoLibrary *)self->_syndicationLibrary registerChangeObserver:self];
  }
}

- (void)stopListening
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 photoAnalysisInSpotlightEnabled];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        syndicationLibrary = self->_syndicationLibrary;
        int v7 = 138412290;
        v8 = syndicationLibrary;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Stopped listening to changes to the syndication library. syndicationLibrary: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [(PHPhotoLibrary *)self->_syndicationLibrary unregisterChangeObserver:self];
  }
}

- (PHFetchOptions)analysisFetchOptions
{
  v15[1] = *MEMORY[0x1E4F143B8];
  analysisFetchOptions = self->_analysisFetchOptions;
  if (!analysisFetchOptions)
  {
    id v13 = 0;
    objc_initWeak(&v13, self->_syndicationLibrary);
    int v4 = (PHFetchOptions *)objc_alloc_init(MEMORY[0x1E4F390A0]);
    id v5 = objc_loadWeakRetained(&v13);
    [(PHFetchOptions *)v4 setPhotoLibrary:v5];

    uint64_t v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
    v15[0] = v6;
    int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [(PHFetchOptions *)v4 setSortDescriptors:v7];

    uint64_t v8 = *MEMORY[0x1E4F39538];
    v14[0] = *MEMORY[0x1E4F39458];
    v14[1] = v8;
    v14[2] = *MEMORY[0x1E4F394E0];
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
    [(PHFetchOptions *)v4 setFetchPropertySets:v9];

    v11 = self->_analysisFetchOptions;
    p_analysisFetchOptions = &self->_analysisFetchOptions;
    *p_analysisFetchOptions = v4;

    objc_destroyWeak(&v13);
    analysisFetchOptions = *p_analysisFetchOptions;
  }

  return analysisFetchOptions;
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = (uint64_t)v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Syndication library changed. Ingesting new analysis data. change: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v4 totalChangeCount];
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Total change count: %lu.", buf, 0xCu);
    }
  }
  uint64_t v8 = [(IMDPhotosSyndicationLibraryChangeListener *)self changeObservationQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D978A8AC;
  v10[3] = &unk_1E6B73218;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

- (PHPhotoLibrary)syndicationLibrary
{
  return self->_syndicationLibrary;
}

- (OS_dispatch_queue)changeObservationQueue
{
  return self->_changeObservationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeObservationQueue, 0);
  objc_storeStrong((id *)&self->_syndicationLibrary, 0);

  objc_storeStrong((id *)&self->_analysisFetchOptions, 0);
}

@end