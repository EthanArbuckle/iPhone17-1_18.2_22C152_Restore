@interface AXMTVideoFileReader
+ (BOOL)fileURLContainsSuitablePlayableVideo:(id)a3 error:(id *)a4;
- (AVAsset)_asset;
- (AVAssetReader)_assetReader;
- (AVAssetReaderTrackOutput)_trackOutput;
- (AXMTVideoFileReader)initWithInput:(id)a3;
- (AXMTVideoFileReaderDelegate)delegate;
- (AXSSMotionTrackingVideoFileInput)input;
- (BOOL)isStarted;
- (CGSize)resolution;
- (NSMutableArray)_metadataOutputAdaptors;
- (NSURL)_fileURL;
- (OS_dispatch_queue)_readingQueue;
- (OS_dispatch_source)_timerSource;
- (float)_framerate;
- (os_unfair_lock_s)_lock;
- (unint64_t)status;
- (unsigned)pixelFormatType;
- (void)_bringUp;
- (void)_cancelDispatchSource;
- (void)_pauseNotificationReceived:(id)a3;
- (void)_pausePlayback;
- (void)_playNotificationReceived:(id)a3;
- (void)_playVideoFile;
- (void)_playbackFinished;
- (void)_readTimerFired;
- (void)_resumePlayback;
- (void)_setupDispatchSource;
- (void)_tearDown;
- (void)setDelegate:(id)a3;
- (void)setInput:(id)a3;
- (void)setPixelFormatType:(unsigned int)a3;
- (void)setStatus:(unint64_t)a3;
- (void)set_asset:(id)a3;
- (void)set_assetReader:(id)a3;
- (void)set_fileURL:(id)a3;
- (void)set_framerate:(float)a3;
- (void)set_lock:(os_unfair_lock_s)a3;
- (void)set_metadataOutputAdaptors:(id)a3;
- (void)set_readingQueue:(id)a3;
- (void)set_timerSource:(id)a3;
- (void)set_trackOutput:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation AXMTVideoFileReader

- (AXMTVideoFileReader)initWithInput:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)AXMTVideoFileReader;
    v5 = [(AXMTVideoFileReader *)&v12 init];
    if (v5)
    {
      v6 = (AXSSMotionTrackingVideoFileInput *)[v4 copy];
      input = v5->_input;
      v5->_input = v6;

      v5->__lock._os_unfair_lock_opaque = 0;
      dispatch_queue_t v8 = dispatch_queue_create("AXMTVideoFileReader.readingQueue", 0);
      readingQueue = v5->__readingQueue;
      v5->__readingQueue = (OS_dispatch_queue *)v8;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setInput:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10 = v4;
    if (([(AXSSMotionTrackingVideoFileInput *)self->_input isEqual:v4] & 1) == 0)
    {
      v5 = [(AXMTVideoFileReader *)self _fileURL];

      if (v5) {
        [(AXMTVideoFileReader *)self _tearDown];
      }
      v6 = (AXSSMotionTrackingVideoFileInput *)[v10 copy];
      input = self->_input;
      self->_input = v6;

      dispatch_queue_t v8 = +[AXMTVideoFilePlayManager shared];
      v9 = [v8 fileURLForMotionTrackingVideoFileInput:v10];

      if (v9) {
        [(AXMTVideoFileReader *)self _playVideoFile];
      }
    }
  }

  _objc_release_x1();
}

- (void)start
{
  if ((id)[(AXMTVideoFileReader *)self status] == (id)3)
  {
    [(AXMTVideoFileReader *)self setStatus:2];
    [(AXMTVideoFileReader *)self _resumePlayback];
  }
  else if (![(AXMTVideoFileReader *)self status])
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:self selector:"_playNotificationReceived:" name:@"AXMTVideoFilePlayManagerPlayNotification" object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_pauseNotificationReceived:" name:@"AXMTVideoFilePlayManagerPauseNotification" object:0];

    [(AXMTVideoFileReader *)self setStatus:1];
    [(AXMTVideoFileReader *)self _playVideoFile];
  }
}

- (void)stop
{
  if ([(AXMTVideoFileReader *)self status])
  {
    [(AXMTVideoFileReader *)self setStatus:0];
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self name:@"AXMTVideoFilePlayManagerPlayNotification" object:0];

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self name:@"AXMTVideoFilePlayManagerPauseNotification" object:0];

    v5 = [(AXMTVideoFileReader *)self _fileURL];

    if (v5)
    {
      [(AXMTVideoFileReader *)self _tearDown];
    }
  }
}

- (BOOL)isStarted
{
  unint64_t v3 = [(AXMTVideoFileReader *)self status];
  if (v3 != 1) {
    LOBYTE(v3) = (id)[(AXMTVideoFileReader *)self status] == (id)2
  }
              || (id)[(AXMTVideoFileReader *)self status] == (id)3;
  return v3;
}

- (void)_playNotificationReceived:(id)a3
{
  v6 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(AXMTVideoFileReader *)self input];
    if ([v6 isEqual:v4])
    {
      v5 = [(AXMTVideoFileReader *)self input];

      if (v5)
      {
        if ((id)[(AXMTVideoFileReader *)self status] == (id)3)
        {
          [(AXMTVideoFileReader *)self setStatus:2];
          [(AXMTVideoFileReader *)self _resumePlayback];
        }
        else if ((id)[(AXMTVideoFileReader *)self status] == (id)1)
        {
          [(AXMTVideoFileReader *)self _playVideoFile];
        }
      }
    }
    else
    {
    }
  }

  _objc_release_x1();
}

- (void)_pauseNotificationReceived:(id)a3
{
  if ((id)[(AXMTVideoFileReader *)self status] == (id)2
    && (id)[(AXMTVideoFileReader *)self status] != (id)3)
  {
    [(AXMTVideoFileReader *)self setStatus:3];
    [(AXMTVideoFileReader *)self _pausePlayback];
  }
}

+ (BOOL)fileURLContainsSuitablePlayableVideo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if ([v5 checkResourceIsReachableAndReturnError:a4])
    {
      v7 = +[AVAsset assetWithURL:v6];
      dispatch_queue_t v8 = v7;
      if (v7)
      {
        v9 = [v7 tracksWithMediaType:AVMediaTypeVideo];
        id v10 = [v9 count];
        BOOL v11 = v10 != 0;
        if (!a4 || v10) {
          goto LABEL_13;
        }
        uint64_t v12 = AXSSMotionTrackingErrorDomain;
        v13 = +[NSString stringWithFormat:@"Invalid video tracks in fileURL %@!", v6, NSLocalizedDescriptionKey];
        v19 = v13;
        v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        *a4 = +[NSError errorWithDomain:v12 code:0 userInfo:v14];
      }
      else
      {
        if (!a4)
        {
          BOOL v11 = 0;
          goto LABEL_14;
        }
        uint64_t v16 = AXSSMotionTrackingErrorDomain;
        NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
        v9 = +[NSString stringWithFormat:@"Can't create asset with fileURL %@!", v6];
        v21 = v9;
        v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        *a4 = +[NSError errorWithDomain:v16 code:0 userInfo:v13];
      }

      BOOL v11 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  else if (a4)
  {
    uint64_t v15 = AXSSMotionTrackingErrorDomain;
    NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
    CFStringRef v23 = @"Cannot play a nil fileURL!";
    dispatch_queue_t v8 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    +[NSError errorWithDomain:v15 code:0 userInfo:v8];
    BOOL v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (void)_playVideoFile
{
  unint64_t v3 = +[AXMTVideoFilePlayManager shared];
  id v4 = [(AXMTVideoFileReader *)self input];
  id v6 = [v3 fileURLForMotionTrackingVideoFileInput:v4];

  if (v6)
  {
    id v5 = [(AXMTVideoFileReader *)self _fileURL];

    if (v5) {
      [(AXMTVideoFileReader *)self _tearDown];
    }
    [(AXMTVideoFileReader *)self setStatus:2];
    [(AXMTVideoFileReader *)self _bringUp];
  }
}

- (void)_pausePlayback
{
  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  [(AXMTVideoFileReader *)self _cancelDispatchSource];

  os_unfair_lock_unlock(p_lock);
}

- (void)_resumePlayback
{
  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  [(AXMTVideoFileReader *)self _setupDispatchSource];

  os_unfair_lock_unlock(p_lock);
}

- (void)_playbackFinished
{
}

- (void)_tearDown
{
  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  [(AXMTVideoFileReader *)self _cancelDispatchSource];
  [(AXMTVideoFileReader *)self set_timerSource:0];
  id v4 = [(AXMTVideoFileReader *)self _assetReader];

  if (v4)
  {
    id v5 = [(AXMTVideoFileReader *)self _assetReader];
    [v5 cancelReading];
  }
  [(AXMTVideoFileReader *)self set_trackOutput:0];
  [(AXMTVideoFileReader *)self set_assetReader:0];
  [(AXMTVideoFileReader *)self set_metadataOutputAdaptors:0];
  [(AXMTVideoFileReader *)self set_fileURL:0];
  [(AXMTVideoFileReader *)self set_asset:0];

  os_unfair_lock_unlock(p_lock);
}

- (void)_bringUp
{
  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  [(AXMTVideoFileReader *)self set_fileURL:0];
  id v4 = [(AXMTVideoFileReader *)self input];

  if (v4)
  {
    id v5 = +[AXMTVideoFilePlayManager shared];
    id v6 = [(AXMTVideoFileReader *)self input];
    v7 = [v5 fileURLForMotionTrackingVideoFileInput:v6];
    [(AXMTVideoFileReader *)self set_fileURL:v7];
  }
  dispatch_queue_t v8 = [(AXMTVideoFileReader *)self _fileURL];

  if (v8)
  {
    v9 = [(AXMTVideoFileReader *)self _fileURL];
    id v10 = +[AVAsset assetWithURL:v9];

    if (v10)
    {
      id v86 = 0;
      BOOL v11 = +[AVAssetReader assetReaderWithAsset:v10 error:&v86];
      id v12 = v86;
      [(AXMTVideoFileReader *)self set_assetReader:v11];

      v13 = [(AXMTVideoFileReader *)self _assetReader];

      if (!v13)
      {
        v40 = [(AXMTVideoFileReader *)self _fileURL];
        v14 = +[NSString stringWithFormat:@"Error creating assetReader for %@ %@ %@!", v40, v10, v12];

        os_unfair_lock_unlock(p_lock);
        v41 = AXSSLogForCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          sub_1000162A0();
        }

        v17 = +[AXMTVideoFilePlayManager shared];
        id v21 = [(AXMTVideoFileReader *)self input];
        uint64_t v42 = AXSSMotionTrackingErrorDomain;
        NSErrorUserInfoKey v100 = NSLocalizedDescriptionKey;
        v101 = v14;
        v43 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        v44 = +[NSError errorWithDomain:v42 code:0 userInfo:v43];
        [v17 videoPlayedWithInput:v21 success:0 error:v44];

        goto LABEL_41;
      }
      v14 = [v10 tracksWithMediaType:AVMediaTypeVideo];
      if ([v14 count])
      {
        uint64_t v15 = [v14 lastObject];
        CFStringRef v96 = kCVPixelBufferPixelFormatTypeKey;
        v97 = &off_100049D58;
        uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
        v17 = +[AVAssetReaderTrackOutput assetReaderTrackOutputWithTrack:v15 outputSettings:v16];

        if (v17)
        {
          uint64_t v18 = [(AXMTVideoFileReader *)self _assetReader];
          unsigned __int8 v19 = [v18 canAddOutput:v17];

          if (v19)
          {
            NSErrorUserInfoKey v20 = +[NSMutableArray array];
            [(AXMTVideoFileReader *)self set_metadataOutputAdaptors:v20];

            id v21 = [v10 tracksWithMediaType:AVMediaTypeMetadata];
            if ([v21 count])
            {
              v78 = v17;
              v79 = v14;
              id v80 = v12;
              long long v84 = 0u;
              long long v85 = 0u;
              long long v82 = 0u;
              long long v83 = 0u;
              id v21 = v21;
              id v22 = [v21 countByEnumeratingWithState:&v82 objects:v89 count:16];
              if (v22)
              {
                id v23 = v22;
                uint64_t v24 = *(void *)v83;
                while (2)
                {
                  for (i = 0; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v83 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    id v26 = [objc_alloc((Class)AVAssetReaderTrackOutput) initWithTrack:*(void *)(*((void *)&v82 + 1) + 8 * i) outputSettings:0];
                    [v26 setAlwaysCopiesSampleData:0];
                    v27 = [(AXMTVideoFileReader *)self _assetReader];
                    unsigned __int8 v28 = [v27 canAddOutput:v26];

                    if ((v28 & 1) == 0)
                    {
                      v62 = [(AXMTVideoFileReader *)self _fileURL];
                      v63 = +[NSString stringWithFormat:@"Error reading asset: %@. Error adding metadata track output! %@", v62, v26];

                      os_unfair_lock_unlock(p_lock);
                      v64 = AXSSLogForCategory();
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
                        sub_1000162A0();
                      }

                      v65 = +[AXMTVideoFilePlayManager shared];
                      v66 = [(AXMTVideoFileReader *)self input];
                      uint64_t v67 = AXSSMotionTrackingErrorDomain;
                      NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
                      v88 = v63;
                      v68 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
                      v69 = +[NSError errorWithDomain:v67 code:0 userInfo:v68];
                      [v65 videoPlayedWithInput:v66 success:0 error:v69];

                      v14 = v79;
                      id v12 = v80;
                      v17 = v78;
                      goto LABEL_41;
                    }
                    id v29 = [objc_alloc((Class)AVAssetReaderOutputMetadataAdaptor) initWithAssetReaderTrackOutput:v26];
                    v30 = [(AXMTVideoFileReader *)self _metadataOutputAdaptors];
                    [v30 addObject:v29];

                    v31 = [(AXMTVideoFileReader *)self _assetReader];
                    [v31 addOutput:v26];
                  }
                  id v23 = [v21 countByEnumeratingWithState:&v82 objects:v89 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              v32 = AXSSLogForCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                sub_100016314(self, v32);
              }

              v17 = v78;
              [(AXMTVideoFileReader *)self set_trackOutput:v78];
              v33 = [(AXMTVideoFileReader *)self _assetReader];
              [v33 addOutput:v78];

              [v78 markConfigurationAsFinal];
              v34 = [(AXMTVideoFileReader *)self _assetReader];
              [v34 startReading];

              v14 = v79;
              v35 = [v79 firstObject];
              [v35 nominalFrameRate];
              -[AXMTVideoFileReader set_framerate:](self, "set_framerate:");

              [(AXMTVideoFileReader *)self _setupDispatchSource];
              os_unfair_lock_unlock(p_lock);
              id v12 = v80;
            }
            else
            {
              v70 = [(AXMTVideoFileReader *)self _fileURL];
              uint64_t v71 = +[NSString stringWithFormat:@"Error finding metadata track in asset: %@", v70];

              os_unfair_lock_unlock(p_lock);
              v72 = AXSSLogForCategory();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                sub_1000162A0();
              }

              v73 = +[AXMTVideoFilePlayManager shared];
              v74 = [(AXMTVideoFileReader *)self input];
              uint64_t v75 = AXSSMotionTrackingErrorDomain;
              NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
              uint64_t v91 = v71;
              +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
              v76 = v81 = (void *)v71;
              v77 = +[NSError errorWithDomain:v75 code:0 userInfo:v76];
              [v73 videoPlayedWithInput:v74 success:0 error:v77];
            }
            goto LABEL_41;
          }
          v58 = [(AXMTVideoFileReader *)self _fileURL];
          id v21 = +[NSString stringWithFormat:@"Error reading asset: %@. Error adding track output! %@", v58, v17];

          os_unfair_lock_unlock(p_lock);
          v59 = AXSSLogForCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            sub_1000162A0();
          }

          v53 = +[AXMTVideoFilePlayManager shared];
          v54 = [(AXMTVideoFileReader *)self input];
          uint64_t v55 = AXSSMotionTrackingErrorDomain;
          NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
          id v93 = v21;
          v56 = &v93;
          v57 = &v92;
        }
        else
        {
          v50 = [(AXMTVideoFileReader *)self _fileURL];
          v51 = [v14 firstObject];
          id v21 = +[NSString stringWithFormat:@"Error creating track output %@ %@ %@", v50, v51, v10];

          os_unfair_lock_unlock(p_lock);
          v52 = AXSSLogForCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_1000162A0();
          }

          v53 = +[AXMTVideoFilePlayManager shared];
          v54 = [(AXMTVideoFileReader *)self input];
          uint64_t v55 = AXSSMotionTrackingErrorDomain;
          NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
          id v95 = v21;
          v56 = &v95;
          v57 = &v94;
        }
        v60 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v57 count:1];
        v61 = +[NSError errorWithDomain:v55 code:0 userInfo:v60];
        [v53 videoPlayedWithInput:v54 success:0 error:v61];

LABEL_41:
        return;
      }
      v45 = [(AXMTVideoFileReader *)self _fileURL];
      v17 = +[NSString stringWithFormat:@"Error reading asset %@ %@. No video tracks found!", v45, v10];

      os_unfair_lock_unlock(p_lock);
      v46 = AXSSLogForCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_1000162A0();
      }

      id v21 = +[AXMTVideoFilePlayManager shared];
      v39 = [(AXMTVideoFileReader *)self input];
      uint64_t v47 = AXSSMotionTrackingErrorDomain;
      NSErrorUserInfoKey v98 = NSLocalizedDescriptionKey;
      v99 = v17;
      v48 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
      v49 = +[NSError errorWithDomain:v47 code:0 userInfo:v48];
      [v21 videoPlayedWithInput:v39 success:0 error:v49];
    }
    else
    {
      v36 = [(AXMTVideoFileReader *)self _fileURL];
      id v12 = +[NSString stringWithFormat:@"Error creating asset %@!", v36];

      os_unfair_lock_unlock(p_lock);
      v37 = AXSSLogForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1000162A0();
      }

      v14 = +[AXMTVideoFilePlayManager shared];
      v17 = [(AXMTVideoFileReader *)self input];
      uint64_t v38 = AXSSMotionTrackingErrorDomain;
      NSErrorUserInfoKey v102 = NSLocalizedDescriptionKey;
      id v103 = v12;
      id v21 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
      v39 = +[NSError errorWithDomain:v38 code:0 userInfo:v21];
      [v14 videoPlayedWithInput:v17 success:0 error:v39];
    }

    goto LABEL_41;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)_setupDispatchSource
{
  os_unfair_lock_assert_owner(&self->__lock);
  unint64_t v3 = [(AXMTVideoFileReader *)self _readingQueue];
  dispatch_source_t v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v3);
  [(AXMTVideoFileReader *)self set_timerSource:v4];

  id v5 = [(AXMTVideoFileReader *)self _timerSource];
  [(AXMTVideoFileReader *)self _framerate];
  dispatch_source_set_timer(v5, 0, (unint64_t)(float)((float)(1.0 / v6) * 1000000000.0), 0);

  v7 = [(AXMTVideoFileReader *)self _timerSource];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100015B80;
  handler[3] = &unk_1000488D8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  dispatch_queue_t v8 = [(AXMTVideoFileReader *)self _timerSource];
  dispatch_activate(v8);

  v9 = AXSSLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000163E8(self);
  }
}

- (void)_cancelDispatchSource
{
  os_unfair_lock_assert_owner(&self->__lock);
  unint64_t v3 = [(AXMTVideoFileReader *)self _timerSource];

  if (v3)
  {
    dispatch_source_t v4 = [(AXMTVideoFileReader *)self _timerSource];
    dispatch_source_cancel(v4);
  }
}

- (void)_readTimerFired
{
  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  dispatch_source_t v4 = [(AXMTVideoFileReader *)self _trackOutput];
  id v5 = [v4 copyNextSampleBuffer];

  float v6 = +[NSMutableArray array];
  v7 = [(AXMTVideoFileReader *)self _metadataOutputAdaptors];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100015FDC;
  v40[3] = &unk_100048E48;
  id v8 = v6;
  id v41 = v8;
  [v7 enumerateObjectsUsingBlock:v40];

  os_unfair_lock_unlock(p_lock);
  if (v5 && [v8 count])
  {
    CFTypeRef cf = v5;
    v27 = self;
    v9 = +[NSMutableArray array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v26 = v8;
    id obj = v8;
    id v30 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v37;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v12 = [v11 items];
          id v13 = [v12 countByEnumeratingWithState:&v32 objects:v42 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v33;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(void *)v33 != v15) {
                  objc_enumerationMutation(v12);
                }
                v17 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
                uint64_t v18 = [v17 value];
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();

                if (isKindOfClass)
                {
                  NSErrorUserInfoKey v20 = [v17 value];
                  [v9 addObject:v20];
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v32 objects:v42 count:16];
            }
            while (v14);
          }
        }
        id v30 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v30);
    }

    id v21 = [(AXMTVideoFileReader *)v27 delegate];
    char v22 = objc_opt_respondsToSelector();

    if (v22)
    {
      id v23 = [(AXMTVideoFileReader *)v27 delegate];
      [v23 videoFileReader:v27 didReadSampleBuffer:cf withMetadata:v9];
    }
    CFRelease(cf);

    id v8 = v26;
  }
  else
  {
    uint64_t v24 = AXSSLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      sub_100016478();
    }

    if (v5) {
      CFRelease(v5);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001603C;
    block[3] = &unk_1000488D8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (AXSSMotionTrackingVideoFileInput)input
{
  return self->_input;
}

- (AXMTVideoFileReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTVideoFileReaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)pixelFormatType
{
  return self->_pixelFormatType;
}

- (void)setPixelFormatType:(unsigned int)a3
{
  self->_pixelFormatType = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (os_unfair_lock_s)_lock
{
  return self->__lock;
}

- (void)set_lock:(os_unfair_lock_s)a3
{
  self->__lock = a3;
}

- (AVAssetReader)_assetReader
{
  return self->__assetReader;
}

- (void)set_assetReader:(id)a3
{
}

- (NSURL)_fileURL
{
  return self->__fileURL;
}

- (void)set_fileURL:(id)a3
{
}

- (AVAsset)_asset
{
  return self->__asset;
}

- (void)set_asset:(id)a3
{
}

- (AVAssetReaderTrackOutput)_trackOutput
{
  return self->__trackOutput;
}

- (void)set_trackOutput:(id)a3
{
}

- (NSMutableArray)_metadataOutputAdaptors
{
  return self->__metadataOutputAdaptors;
}

- (void)set_metadataOutputAdaptors:(id)a3
{
}

- (OS_dispatch_source)_timerSource
{
  return self->__timerSource;
}

- (void)set_timerSource:(id)a3
{
}

- (OS_dispatch_queue)_readingQueue
{
  return self->__readingQueue;
}

- (void)set_readingQueue:(id)a3
{
}

- (float)_framerate
{
  return self->__framerate;
}

- (void)set_framerate:(float)a3
{
  self->__framerate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__readingQueue, 0);
  objc_storeStrong((id *)&self->__timerSource, 0);
  objc_storeStrong((id *)&self->__metadataOutputAdaptors, 0);
  objc_storeStrong((id *)&self->__trackOutput, 0);
  objc_storeStrong((id *)&self->__asset, 0);
  objc_storeStrong((id *)&self->__fileURL, 0);
  objc_storeStrong((id *)&self->__assetReader, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_input, 0);
}

@end