@interface SSSScreenshotItemProviderImage
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageDataForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)activityViewControllerSuggestionAssetLocalIdentifier:(id)a3;
- (id)imageData;
- (id)item;
- (id)placeholderItemForScreenshot:(id)a3;
@end

@implementation SSSScreenshotItemProviderImage

- (id)placeholderItemForScreenshot:(id)a3
{
  v3 = [a3 imageProvider];
  v4 = [v3 requestOutputImageForUIBlocking];

  return v4;
}

- (id)item
{
  v2 = [(SSSScreenshotItemProvider *)self screenshot];
  v3 = [v2 imageProvider];
  v4 = [v3 requestOutputImageForSavingBlocking];

  return v4;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2050000000;
  v5 = (void *)qword_1000B56E0;
  uint64_t v44 = qword_1000B56E0;
  if (!qword_1000B56E0)
  {
    v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_100002E00;
    v39 = &unk_100099928;
    v40 = &v41;
    sub_100002E00((uint64_t)&v36);
    v5 = (void *)v42[3];
  }
  v6 = v5;
  _Block_object_dispose(&v41, 8);
  id v7 = objc_alloc_init(v6);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2050000000;
  v8 = (void *)qword_1000B56F0;
  uint64_t v44 = qword_1000B56F0;
  if (!qword_1000B56F0)
  {
    v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_100002FC8;
    v39 = &unk_100099928;
    v40 = &v41;
    sub_100002FC8((uint64_t)&v36);
    v8 = (void *)v42[3];
  }
  v9 = v8;
  _Block_object_dispose(&v41, 8);
  id v10 = objc_alloc_init(v9);
  v11 = [(SSSScreenshotItemProvider *)self screenshot];
  v12 = [v11 imageProvider];
  v13 = [v12 requestOutputImageForUIBlocking];

  v14 = SSCGImageBackedImageFromImage();

  [v14 size];
  double v16 = v15;
  [v14 size];
  double v18 = 128.0 / (v16 / v17);
  id v19 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:128.0, v18];
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_100002C50;
  v32 = &unk_100099900;
  uint64_t v34 = 0x4060000000000000;
  double v35 = v18;
  id v20 = v14;
  id v33 = v20;
  v21 = [v19 imageWithActions:&v29];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2050000000;
  v22 = (void *)qword_1000B56F8;
  uint64_t v44 = qword_1000B56F8;
  if (!qword_1000B56F8)
  {
    v36 = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472;
    v38 = sub_100003020;
    v39 = &unk_100099928;
    v40 = &v41;
    sub_100003020((uint64_t)&v36);
    v22 = (void *)v42[3];
  }
  v23 = v22;
  _Block_object_dispose(&v41, 8);
  id v24 = [v23 alloc];
  id v25 = [v24 initWithPlatformImage:v21, v29, v30, v31, v32];
  [v10 setThumbnail:v25];

  v26 = [(SSSScreenshotItemProvider *)self nameForScreenshot];
  [v10 setName:v26];

  v27 = [UTTypeImage identifier];
  [v10 setType:v27];

  [v7 setSpecialization:v10];

  return v7;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  id v4 = [(SSSScreenshotItemProvider *)self nameForScreenshot];
  v5 = [v4 stringByAppendingPathExtension:@"jpeg"];

  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageDataForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  return [(SSSScreenshotItemProviderImage *)self imageData];
}

- (id)imageData
{
  v2 = [(SSSScreenshotItemProvider *)self screenshot];
  v3 = [v2 imageProvider];
  id v4 = [v3 requestOutputImageForSavingBlocking];

  v5 = UIImageJPEGRepresentation(v4, 1.0);

  return v5;
}

- (id)activityViewControllerSuggestionAssetLocalIdentifier:(id)a3
{
  v3 = [(SSSScreenshotItemProvider *)self screenshot];
  id v4 = [v3 identifier];

  return v4;
}

@end