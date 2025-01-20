@interface SSSScreenshotItemProviderPDF
+ (id)_dataTypeIdentifierForActivityType:(id)a3;
+ (id)_sharableItemForActivityType:(id)a3 screenshot:(id)a4;
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)placeholderItemForScreenshot:(id)a3;
@end

@implementation SSSScreenshotItemProviderPDF

- (id)placeholderItemForScreenshot:(id)a3
{
  return +[NSData data];
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if (a4)
  {
    v5 = objc_opt_class();
    v6 = [(SSSScreenshotItemProviderPDF *)self activityType];
    v7 = [(SSSScreenshotItemProvider *)self screenshot];
    v8 = [v5 _sharableItemForActivityType:v6 screenshot:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v4 = a4;
  v5 = [(id)objc_opt_class() _dataTypeIdentifierForActivityType:v4];

  return v5;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v5 = (void *)qword_1000B5710;
  uint64_t v29 = qword_1000B5710;
  if (!qword_1000B5710)
  {
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100003EE8;
    v24 = &unk_100099928;
    v25 = &v26;
    sub_100003EE8((uint64_t)&v21);
    v5 = (void *)v27[3];
  }
  v6 = v5;
  _Block_object_dispose(&v26, 8);
  id v7 = objc_alloc_init(v6);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v8 = (void *)qword_1000B5720;
  uint64_t v29 = qword_1000B5720;
  if (!qword_1000B5720)
  {
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_1000040B0;
    v24 = &unk_100099928;
    v25 = &v26;
    sub_1000040B0((uint64_t)&v21);
    v8 = (void *)v27[3];
  }
  v9 = v8;
  _Block_object_dispose(&v26, 8);
  id v10 = objc_alloc_init(v9);
  v11 = [(SSSScreenshotItemProvider *)self screenshot];
  v12 = [v11 PDFDocument];
  v13 = [v12 pageAtIndex:0];
  v14 = [v13 thumbnailOfSize:1 forBox:300.0, 300.0];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v15 = (void *)qword_1000B5728;
  uint64_t v29 = qword_1000B5728;
  if (!qword_1000B5728)
  {
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100004108;
    v24 = &unk_100099928;
    v25 = &v26;
    sub_100004108((uint64_t)&v21);
    v15 = (void *)v27[3];
  }
  v16 = v15;
  _Block_object_dispose(&v26, 8);
  id v17 = [[v16 alloc] initWithPlatformImage:v14];
  [v10 setThumbnail:v17];

  v18 = [(SSSScreenshotItemProvider *)self nameForScreenshot];
  [v10 setName:v18];

  v19 = [UTTypePDF identifier];
  [v10 setType:v19];

  [v7 setSpecialization:v10];

  return v7;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  id v4 = [(SSSScreenshotItemProvider *)self nameForScreenshot];
  v5 = [v4 stringByAppendingPathExtension:@"pdf"];

  return v5;
}

+ (id)_dataTypeIdentifierForActivityType:(id)a3
{
  return [UTTypePDF identifier];
}

+ (id)_sharableItemForActivityType:(id)a3 screenshot:(id)a4
{
  id v6 = a3;
  id v7 = [a4 editedPDFDataForShareSheet];
  if (v7 && [v6 isEqualToString:UIActivityTypeCopyToPasteboard])
  {
    v8 = [a1 _dataTypeIdentifierForActivityType:v6];
    v11 = v8;
    v12 = v7;
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

@end