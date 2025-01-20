@interface UNCSectionIconVariant(BBPrivate)
- (id)initWithSectionIconVariant:()BBPrivate;
@end

@implementation UNCSectionIconVariant(BBPrivate)

- (id)initWithSectionIconVariant:()BBPrivate
{
  id v4 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&off_26C7BEE08;
  id v5 = objc_msgSendSuper2(&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v5, "setFormat:", objc_msgSend(v4, "format"));
    v6 = [v4 bundlePath];
    [v5 setBundlePath:v6];

    objc_msgSend(v5, "setPrecomposed:", objc_msgSend(v4, "isPrecomposed"));
    v7 = [v4 imageData];
    if (v7) {
      [v5 setImageData:v7];
    }
    v8 = [v4 imagePath];
    if (v8) {
      [v5 setImagePath:v8];
    }
    v9 = [v4 imageName];
    if (v9) {
      [v5 setImageName:v9];
    }
    v10 = [v4 applicationIdentifier];
    if (v10) {
      [v5 setApplicationIdentifier:v10];
    }
    v11 = [v4 systemImageName];
    if (v11) {
      [v5 setSystemImageName:v11];
    }
    id v12 = v5;
  }
  return v5;
}

@end