@interface CKSettingsMeCardSharingNicknameAvatarProvider
- (CKSettingsMeCardSharingNicknameAvatarProvider)initWithImageData:(id)a3;
- (NSData)imageData;
- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4;
@end

@implementation CKSettingsMeCardSharingNicknameAvatarProvider

- (CKSettingsMeCardSharingNicknameAvatarProvider)initWithImageData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKSettingsMeCardSharingNicknameAvatarProvider;
  v6 = [(CKSettingsMeCardSharingNicknameAvatarProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_imageData, a3);
  }

  return v7;
}

- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v14 = (void (**)(id, void *, void))a4;
  v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  double v9 = v8;

  v10 = (void *)MEMORY[0x263F827E8];
  v11 = [(CKSettingsMeCardSharingNicknameAvatarProvider *)self imageData];
  v12 = [v10 imageWithData:v11 scale:v9];

  if (v12)
  {
    if (width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      double height = 100.0;
      double width = 100.0;
    }
    v16.double width = width;
    v16.double height = height;
    UIGraphicsBeginImageContextWithOptions(v16, 0, v9);
    objc_msgSend(v12, "drawInRect:", 0.0, 0.0, width, height);
    v13 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    v13 = 0;
  }
  v14[2](v14, v13, 0);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
}

@end