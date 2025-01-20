@interface PDCRemoteRenderedContentPreviewController
- (NSArray)renderedContentURLs;
- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5;
- (void)setRenderedContentURLs:(id)a3;
@end

@implementation PDCRemoteRenderedContentPreviewController

- (void).cxx_destruct
{
}

- (void)setRenderedContentURLs:(id)a3
{
}

- (NSArray)renderedContentURLs
{
  return self->_renderedContentURLs;
}

- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = +[NSMutableArray arrayWithCapacity:a5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = [(PDCRemoteRenderedContentPreviewController *)self renderedContentURLs];
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v20 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
      if ([v15 isFileURL]
        && ([v15 path],
            v16 = objc_claimAutoreleasedReturnValue(),
            v17 = (void *)PLCreateImageFromFileWithFormat(),
            v16,
            v17)
        || (+[PLVideoTranscoder generatePosterFrameForVideoAtURL:maxSize:error:](PLVideoTranscoder, "generatePosterFrameForVideoAtURL:maxSize:error:", v15, 0, width, height), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        [v9 addObject:v17];
      }
      if ((unint64_t)[v9 count] >= a5) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v9;
}

@end