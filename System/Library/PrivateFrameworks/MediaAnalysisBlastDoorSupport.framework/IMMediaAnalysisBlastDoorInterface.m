@interface IMMediaAnalysisBlastDoorInterface
- (IMMediaAnalysisBlastDoorInterface)init;
- (IMMediaAnalysisBlastDoorInterfaceInternal)interface;
- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6;
- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4;
- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10;
- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7;
- (void)setInterface:(id)a3;
@end

@implementation IMMediaAnalysisBlastDoorInterface

- (IMMediaAnalysisBlastDoorInterface)init
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)IMMediaAnalysisBlastDoorInterface;
  v2 = [(IMMediaAnalysisBlastDoorInterface *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IMMediaAnalysisBlastDoorInterfaceInternal);
    interface = v2->_interface;
    v2->_interface = v3;
  }
  return v2;
}

- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  id v10 = a3;
  v11 = [(IMMediaAnalysisBlastDoorInterface *)self interface];
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  v14 = [v11 generateImagePreviewForFileURL:v10 maxPixelDimension:a6 scale:v12 error:v13];

  return v14;
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  id v13 = a7;
  id v14 = a3;
  id v17 = [(IMMediaAnalysisBlastDoorInterface *)self interface];
  *(float *)&double v15 = a4;
  *(float *)&double v16 = a6;
  objc_msgSend(v17, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:", v14, v13, v15, width, height, v16);
}

- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10
{
  BOOL v11 = a7;
  id v17 = a10;
  id v18 = a3;
  id v20 = [(IMMediaAnalysisBlastDoorInterface *)self interface];
  LOBYTE(v19) = a9;
  [v20 generateMovieFramesForAttachmentWithFileURL:v18 targetPixelWidth:a4 targetPixelHeight:a5 frameLimit:a6 uniformSampling:v11 framesPerSync:a8 appliesPreferredTrackTransform:v19 resultHandler:v17];
}

- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMMediaAnalysisBlastDoorInterface *)self interface];
  [v8 generateMetadataforAttachmentWithfileURL:v7 resultHandler:v6];
}

- (IMMediaAnalysisBlastDoorInterfaceInternal)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end