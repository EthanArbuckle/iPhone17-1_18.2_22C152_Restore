@interface AVAssetInspectorLoader
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVAssetInspectorLoader)init;
- (AVWeakReference)_weakReference;
- (BOOL)_isStreaming;
- (BOOL)_prefersNominalDurations;
- (BOOL)hasProtectedContent;
- (BOOL)isAssociatedWithFragmentMinder;
- (BOOL)isCompatibleWithSavedPhotosAlbum;
- (BOOL)isComposable;
- (BOOL)isExportable;
- (BOOL)isPlayable;
- (BOOL)isReadable;
- (Class)_classForTrackInspectors;
- (NSArray)contentKeySpecifiersEligibleForPreloading;
- (NSArray)figChapterGroupInfo;
- (NSArray)figChapters;
- (NSArray)variants;
- (NSString)lyrics;
- (NSURL)URL;
- (NSURL)originalNetworkContentURL;
- (NSURL)resolvedURL;
- (OpaqueFigAsset)_figAsset;
- (OpaqueFigFormatReader)_copyFormatReader;
- (OpaqueFigPlaybackItem)_playbackItem;
- (double)_fragmentMindingInterval;
- (id)_createAVErrorForError:(id)a3 andFigErrorCode:(int)a4;
- (id)assetInspector;
- (int64_t)firstFragmentSequenceNumber;
- (int64_t)fragmentCount;
- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4;
- (unint64_t)downloadToken;
- (void)dealloc;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4;
- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5;
@end

@implementation AVAssetInspectorLoader

- (OpaqueFigPlaybackItem)_playbackItem
{
  return 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVAssetInspectorLoader)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVAssetInspectorLoader;
  v2 = [(AVAssetInspectorLoader *)&v4 init];
  if (v2) {
    v2->_weakReference = [[AVWeakReference alloc] initWithReferencedObject:v2];
  }
  return v2;
}

- (AVWeakReference)_weakReference
{
  return self->_weakReference;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetInspectorLoader;
  [(AVAssetInspectorLoader *)&v3 dealloc];
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
  return 0;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  v6 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v6);
}

- (id)assetInspector
{
  return 0;
}

- (NSURL)URL
{
  return 0;
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return 0;
}

- (OpaqueFigAsset)_figAsset
{
  return 0;
}

- (Class)_classForTrackInspectors
{
  objc_super v4 = (objc_class *)objc_opt_class();
  AVRequestConcreteImplementation((objc_class *)self, a2, v4);
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- (NSArray)variants
{
  return 0;
}

- (NSString)lyrics
{
  return 0;
}

- (BOOL)isPlayable
{
  return 0;
}

- (BOOL)isExportable
{
  return 0;
}

- (BOOL)isReadable
{
  return 0;
}

- (BOOL)isComposable
{
  return 0;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return 0;
}

- (NSArray)figChapterGroupInfo
{
  return 0;
}

- (NSArray)figChapters
{
  return 0;
}

- (NSURL)resolvedURL
{
  return 0;
}

- (NSURL)originalNetworkContentURL
{
  return 0;
}

- (unint64_t)downloadToken
{
  return 0;
}

- (NSArray)contentKeySpecifiersEligibleForPreloading
{
  return 0;
}

- (BOOL)hasProtectedContent
{
  return 0;
}

- (BOOL)_isStreaming
{
  return 0;
}

- (BOOL)_prefersNominalDurations
{
  return 1;
}

- (int64_t)firstFragmentSequenceNumber
{
  return 0;
}

- (int64_t)fragmentCount
{
  return 0;
}

- (double)_fragmentMindingInterval
{
  return 0.0;
}

- (BOOL)isAssociatedWithFragmentMinder
{
  return 0;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5
{
}

- (id)_createAVErrorForError:(id)a3 andFigErrorCode:(int)a4
{
  v6 = [(AVAssetInspectorLoader *)self URL];
  if (v6) {
    v6 = (NSURL *)[MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F289D0]];
  }
  return (id)AVErrorWithNSErrorAndOSStatus((uint64_t)a3, a4, v6);
}

@end