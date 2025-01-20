@interface BRShareLinkPresentationPropertyProvider
- (BRShareLinkPresentationPropertyProvider)initWithDocumentName:(id)a3 appName:(id)a4 bundleIdentifier:(id)a5;
- (BRShareLinkPresentationPropertyProvider)initWithItemName:(id)a3 appName:(id)a4 bundleIdentifier:(id)a5;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)appIcon;
- (id)captionBar;
- (id)icon;
- (int64_t)style;
- (void)_commonInitWithTitle:(id)a3 appName:(id)a4 resolvedAppIdentifier:(id)a5;
- (void)setAppIcon:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BRShareLinkPresentationPropertyProvider

- (void)_commonInitWithTitle:(id)a3 appName:(id)a4 resolvedAppIdentifier:(id)a5
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a4;
    [(BRShareLinkPresentationPropertyProvider *)self setTitle:a3];
    [(BRShareLinkPresentationPropertyProvider *)self setSubtitle:v10];
  }
  else
  {
    id v11 = a5;
    id v12 = a4;
    id v10 = +[NSBundle bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v13 = [v10 localizedStringForKey:@"Shared from %@" value:@"Shared from %@" table:@"Localizable"];
    v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v12);

    [(BRShareLinkPresentationPropertyProvider *)self setTitle:v14];
  }

  id v16 = +[LSApplicationProxy applicationProxyForIdentifier:a5];

  v15 = +[UIImage _iconForResourceProxy:v16 format:1];
  [(BRShareLinkPresentationPropertyProvider *)self setAppIcon:v15];
}

- (BRShareLinkPresentationPropertyProvider)initWithDocumentName:(id)a3 appName:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = (__CFString *)a5;
  v15.receiver = self;
  v15.super_class = (Class)BRShareLinkPresentationPropertyProvider;
  id v11 = [(BRShareLinkPresentationPropertyProvider *)&v15 init];
  if (v11)
  {
    id v12 = [(__CFString *)v10 lowercaseString];
    unsigned __int8 v13 = [&off_100050EF0 containsObject:v12];

    if ((v13 & 1) == 0)
    {

      id v10 = @"com.apple.iCloudDriveApp";
      id v9 = @"iCloud Drive";
    }
    [(BRShareLinkPresentationPropertyProvider *)v11 _commonInitWithTitle:v8 appName:v9 resolvedAppIdentifier:v10];
  }

  return v11;
}

- (BRShareLinkPresentationPropertyProvider)initWithItemName:(id)a3 appName:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BRShareLinkPresentationPropertyProvider;
  id v11 = [(BRShareLinkPresentationPropertyProvider *)&v14 init];
  id v12 = v11;
  if (v11) {
    [(BRShareLinkPresentationPropertyProvider *)v11 _commonInitWithTitle:v8 appName:v9 resolvedAppIdentifier:v10];
  }

  return v12;
}

- (int64_t)style
{
  return 16;
}

- (id)captionBar
{
  id v3 = objc_alloc_init((Class)LPCaptionBarPresentationProperties);
  title = self->_title;
  v5 = [v3 top];
  v6 = [v5 leading];
  [v6 setText:title];

  subtitle = self->_subtitle;
  id v8 = [v3 bottom];
  id v9 = [v8 leading];
  [v9 setText:subtitle];

  return v3;
}

- (id)icon
{
  id v2 = [objc_alloc((Class)LPImage) initWithPlatformImage:self->_appIcon];

  return v2;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (void)setAppIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end