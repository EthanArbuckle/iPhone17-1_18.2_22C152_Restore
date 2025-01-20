@interface MKMapItemPhoto(MUPhotoTileProvider)
- (void)configureWithSize:()MUPhotoTileProvider imageProvider:;
@end

@implementation MKMapItemPhoto(MUPhotoTileProvider)

- (void)configureWithSize:()MUPhotoTileProvider imageProvider:
{
  id v8 = a5;
  v9 = [MEMORY[0x1E4F31038] sharedInstance];
  [v9 screenScale];
  double v11 = v10;

  v12 = [MEMORY[0x1E4F646D0] defaultPhotoOptionsWithAllowSmaller:1];
  v13 = [a1 geoMapItemPhoto];
  v14 = objc_msgSend(v13, "bestPhotoForFrameSize:displayScale:options:", v12, a2, a3, v11);

  v15 = [v14 url];
  v16 = [v15 absoluteString];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = [MEMORY[0x1E4F30E38] sharedImageManager];
    v19 = [v14 url];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__MKMapItemPhoto_MUPhotoTileProvider__configureWithSize_imageProvider___block_invoke;
    v20[3] = &unk_1E574F678;
    id v21 = v8;
    double v22 = a2;
    double v23 = a3;
    double v24 = v11;
    [v18 loadAppImageAtURL:v19 completionHandler:v20];
  }
  else
  {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
  }
}

@end