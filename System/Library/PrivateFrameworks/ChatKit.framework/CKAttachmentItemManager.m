@interface CKAttachmentItemManager
+ (id)attachmentWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7 shareURL:(id)a8;
@end

@implementation CKAttachmentItemManager

+ (id)attachmentWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7 shareURL:(id)a8
{
  double height = a4.height;
  double width = a4.width;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  v19 = +[CKMediaObjectManager sharedInstance];
  v20 = [v18 lastPathComponent];
  v21 = (void *)[v19 classForFilename:v20];

  v22 = objc_msgSend(objc_alloc((Class)objc_msgSend(v21, "__ck_attachmentItemClass")), "initWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v18, v17, v16, v15, v14, width, height);

  return v22;
}

@end