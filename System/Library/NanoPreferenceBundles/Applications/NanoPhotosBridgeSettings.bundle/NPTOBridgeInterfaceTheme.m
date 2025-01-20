@interface NPTOBridgeInterfaceTheme
+ (id)sharedInstance;
+ (void)configure;
- (UIColor)albumListBackgroundColor;
- (UIColor)photoCollectionViewBackgroundColor;
- (id)methodSignatureForSelector:(SEL)a3;
- (int)photoCollectionViewBackgroundColorValue;
- (void)configureAlbumListStackViewPhonePhotoDecoration:(id)a3;
- (void)configureAlbumListSubtitleLabel:(id)a3 asOpaque:(BOOL)a4;
- (void)configureAlbumListTitleLabel:(id)a3 asOpaque:(BOOL)a4;
- (void)configureAlbumListTitleTextField:(id)a3 asOpaque:(BOOL)a4;
- (void)forwardInvocation:(id)a3;
@end

@implementation NPTOBridgeInterfaceTheme

+ (id)sharedInstance
{
  if (qword_13D40 != -1) {
    dispatch_once(&qword_13D40, &stru_C440);
  }
  v2 = (void *)qword_13D38;

  return v2;
}

+ (void)configure
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_53E4;
  block[3] = &unk_C460;
  block[4] = a1;
  if (qword_13D30 != -1) {
    dispatch_once(&qword_13D30, block);
  }
}

- (void)forwardInvocation:(id)a3
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector())
  {
    v7.receiver = self;
    v7.super_class = (Class)NPTOBridgeInterfaceTheme;
    v5 = [(NPTOBridgeInterfaceTheme *)&v7 methodSignatureForSelector:a3];
  }
  else
  {
    v5 = [(id)qword_13D28 methodSignatureForSelector:a3];
  }

  return v5;
}

- (UIColor)photoCollectionViewBackgroundColor
{
  return (UIColor *)_BPSBackgroundColor(self, a2);
}

- (int)photoCollectionViewBackgroundColorValue
{
  return 0;
}

- (UIColor)albumListBackgroundColor
{
  return (UIColor *)_BPSBackgroundColor(self, a2);
}

- (void)configureAlbumListTitleTextField:(id)a3 asOpaque:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (void *)qword_13D28;
  id v6 = a3;
  [v5 configureAlbumListTitleTextField:v6 asOpaque:v4];
  objc_super v7 = BPSTextColor();
  [v6 setTextColor:v7];

  id v8 = +[UIColor clearColor];
  [v6 setBackgroundColor:v8];
}

- (void)configureAlbumListTitleLabel:(id)a3 asOpaque:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (void *)qword_13D28;
  id v6 = a3;
  [v5 configureAlbumListTitleLabel:v6 asOpaque:v4];
  objc_super v7 = BPSTextColor();
  [v6 setTextColor:v7];

  id v8 = +[UIColor clearColor];
  [v6 setBackgroundColor:v8];
}

- (void)configureAlbumListSubtitleLabel:(id)a3 asOpaque:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (void *)qword_13D28;
  id v6 = a3;
  [v5 configureAlbumListSubtitleLabel:v6 asOpaque:v4];
  objc_super v7 = +[UIColor clearColor];
  [v6 setBackgroundColor:v7];

  BPSDetailTextColor();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setTextColor:v8];
}

- (void)configureAlbumListStackViewPhonePhotoDecoration:(id)a3
{
  v3 = (void *)qword_13D28;
  id v4 = a3;
  [v3 configureAlbumListStackViewPhonePhotoDecoration:v4];
  BPSSeparatorColor();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setBorderColor:v5];
}

@end