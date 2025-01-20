@interface GCSettingsAppIcon
+ (id)appIconImageForBundleIdentifier:(id)a3;
+ (void)clearCache;
- (GCSettingsAppIcon)initWithISImage:(id)a3;
- (id)UIImage;
@end

@implementation GCSettingsAppIcon

+ (void)clearCache
{
  sub_10BE8();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeAllObjects];
}

+ (id)appIconImageForBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = sub_10BE8();
  v5 = [v4 objectForKey:v3];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;
  }
  else
  {
    id v8 = [objc_alloc((Class)ISIcon) initWithBundleIdentifier:v3];
    v9 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorTableUIName];
    id v10 = [v8 prepareImageForDescriptor:v9];
    v11 = [v8 imageForDescriptor:v9];
    v12 = [[GCSettingsAppIcon alloc] initWithISImage:v11];
    v13 = sub_10BE8();
    v14 = v13;
    if (v12)
    {
      [v13 setObject:v12 forKey:v3];
    }
    else
    {
      v15 = +[NSNull null];
      [v14 setObject:v15 forKey:v3];
    }
    v7 = v12;
  }

  return v7;
}

- (GCSettingsAppIcon)initWithISImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCSettingsAppIcon;
  v6 = [(GCSettingsAppIcon *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_isImage, a3);
  }

  return v7;
}

- (id)UIImage
{
  uiImage = self->_uiImage;
  if (!uiImage)
  {
    id v4 = objc_alloc((Class)UIImage);
    id v5 = [(IFImage *)self->_isImage CGImage];
    [(IFImage *)self->_isImage scale];
    v6 = (UIImage *)objc_msgSend(v4, "initWithCGImage:scale:orientation:", v5, 0);
    v7 = self->_uiImage;
    self->_uiImage = v6;

    uiImage = self->_uiImage;
  }

  return uiImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiImage, 0);

  objc_storeStrong((id *)&self->_isImage, 0);
}

@end