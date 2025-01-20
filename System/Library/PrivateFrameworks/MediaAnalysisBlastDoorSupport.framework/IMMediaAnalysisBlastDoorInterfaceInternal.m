@interface IMMediaAnalysisBlastDoorInterfaceInternal
+ (BOOL)supportsFeature:(id)a3;
- (IMMediaAnalysisBlastDoorInterfaceInternal)init;
- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6;
- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4;
- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10;
- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7;
@end

@implementation IMMediaAnalysisBlastDoorInterfaceInternal

- (IMMediaAnalysisBlastDoorInterfaceInternal)init
{
  return (IMMediaAnalysisBlastDoorInterfaceInternal *)MediaAnalysisBlastDoorInterface.init()();
}

+ (BOOL)supportsFeature:(id)a3
{
  uint64_t v4 = sub_25594EEA0();
  uint64_t v5 = v3;
  if (v4 == 0x6572506567616D69 && v3 == 0xED00007377656976
    || (sub_25594EF30() & 1) != 0
    || v4 == 0x6572506F65646976 && v5 == 0xED00007377656976)
  {
    swift_bridgeObjectRelease();
    char v6 = 1;
  }
  else
  {
    char v6 = sub_25594EF30();
    swift_bridgeObjectRelease();
  }
  return v6 & 1;
}

- (void)generateMetadataforAttachmentWithfileURL:(id)a3 resultHandler:(id)a4
{
  uint64_t v6 = sub_25594EC50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_25594EC30();
  _Block_copy(v10);
  v11 = self;
  sub_25594E018((uint64_t)v9, (uint64_t)v11, v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)generateImagePreviewForFileURL:(id)a3 maxPixelDimension:(float)a4 scale:(float)a5 error:(id *)a6
{
  uint64_t v9 = sub_25594EC50();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25594EC30();
  v13 = self;
  v14 = (void *)sub_25594C828((uint64_t)v12, a4, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v14;
}

- (void)generateMoviePreviewForAttachmentWithFileURL:(id)a3 maxPixelDimension:(float)a4 minThumbnailPxSize:(CGSize)a5 scale:(float)a6 resultHandler:(id)a7
{
  uint64_t v10 = sub_25594EC50();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a7);
  sub_25594EC30();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  uint64_t v16 = self;
  sub_25594CEE8(a4, (uint64_t)v13, (uint64_t)sub_25594E010, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)generateMovieFramesForAttachmentWithFileURL:(id)a3 targetPixelWidth:(int64_t)a4 targetPixelHeight:(int64_t)a5 frameLimit:(int64_t)a6 uniformSampling:(BOOL)a7 framesPerSync:(int64_t)a8 appliesPreferredTrackTransform:(BOOL)a9 resultHandler:(id)a10
{
  uint64_t v22 = a8;
  HIDWORD(v21) = a7;
  uint64_t v14 = sub_25594EC50();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a10);
  sub_25594EC30();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  v20 = self;
  sub_25594D638((uint64_t)v17, a4, a5, a6, SHIDWORD(v21), v22, a9, (uint64_t)sub_25594E008, v19);

  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void).cxx_destruct
{
}

@end