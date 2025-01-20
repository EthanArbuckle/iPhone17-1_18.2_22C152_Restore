@interface CRApplicationIcon
+ (BOOL)_isApplicationEditableWithBundleIdentifier:(id)a3;
- (BOOL)hasCustomImage;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsBorder;
- (CRApplicationIcon)initWithBundleIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (UIImage)iconImage;
- (id)description;
- (unint64_t)hash;
- (void)loadIconImageIfNeeded;
- (void)setDisplayName:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setNeedsBorder:(BOOL)a3;
@end

@implementation CRApplicationIcon

- (CRApplicationIcon)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRApplicationIcon;
  v6 = [(CRApplicationIcon *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    v7->_editable = [(id)objc_opt_class() _isApplicationEditableWithBundleIdentifier:v5];
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 bundleIdentifier];
    v6 = [(CRApplicationIcon *)self bundleIdentifier];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(CRApplicationIcon *)self bundleIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)CRApplicationIcon;
  id v3 = [(CRApplicationIcon *)&v8 description];
  id v4 = [(CRApplicationIcon *)self displayName];
  id v5 = [(CRApplicationIcon *)self bundleIdentifier];
  v6 = [v3 stringByAppendingFormat:@" %@ (%@)", v4, v5];

  return v6;
}

- (BOOL)hasCustomImage
{
  id v3 = [(CRApplicationIcon *)self bundleIdentifier];
  if ([v3 isEqualToString:CRSOEMIdentifier])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    id v5 = [(CRApplicationIcon *)self bundleIdentifier];
    if ([v5 isEqualToString:CRSNowPlayingIdentifier])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      v6 = [(CRApplicationIcon *)self bundleIdentifier];
      if ([v6 isEqualToString:CRSCalendarIdentifier])
      {
        unsigned __int8 v4 = 1;
      }
      else
      {
        unsigned __int8 v7 = [(CRApplicationIcon *)self bundleIdentifier];
        unsigned __int8 v4 = [v7 isEqualToString:CRSVehicleSettingsIdentifier];
      }
    }
  }
  return v4;
}

- (void)setNeedsBorder:(BOOL)a3
{
  if (self->_needsBorder != a3)
  {
    self->_needsBorder = a3;
    self->_iconImage = 0;
    _objc_release_x1();
  }
}

- (void)setIconImage:(id)a3
{
  id v5 = a3;
  v6 = [(CRApplicationIcon *)self bundleIdentifier];
  unsigned int v7 = [v6 isEqualToString:CRSNowPlayingIdentifier];

  if (v7)
  {
    id v8 = objc_alloc((Class)IFImage);
    id v9 = [v5 CGImage];
    v10 = +[UIScreen mainScreen];
    [v10 scale];
    id v11 = objc_msgSend(v8, "initWithCGImage:scale:", v9);

    id v12 = objc_alloc((Class)ISIcon);
    id v17 = v11;
    v13 = +[NSArray arrayWithObjects:&v17 count:1];
    id v14 = [v12 initWithImages:v13];

    sub_2FD8(v14, 1);
    v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
    iconImage = self->_iconImage;
    self->_iconImage = v15;
  }
  else
  {
    objc_storeStrong((id *)&self->_iconImage, a3);
  }
}

- (void)loadIconImageIfNeeded
{
  id v3 = [(CRApplicationIcon *)self iconImage];

  if (!v3)
  {
    id v4 = objc_alloc((Class)ISIcon);
    id v5 = [(CRApplicationIcon *)self bundleIdentifier];
    id v8 = [v4 initWithBundleIdentifier:v5];

    sub_2FD8(v8, [(CRApplicationIcon *)self needsBorder]);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    iconImage = self->_iconImage;
    self->_iconImage = v6;
  }
}

+ (BOOL)_isApplicationEditableWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  if (qword_2DFF0 != -1) {
    dispatch_once(&qword_2DFF0, &stru_24778);
  }
  if ([(id)qword_2DFE8 containsObject:v3])
  {
    unsigned __int8 v4 = 1;
  }
  else if (([v3 isEqualToString:CRSOEMIdentifier] & 1) != 0 {
         || ([v3 isEqualToString:CRSNowPlayingIdentifier] & 1) != 0)
  }
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    id v5 = +[LSApplicationProxy applicationProxyForIdentifier:v3];
    v6 = [v5 bundleType];
    if ([v6 isEqualToString:LSUserApplicationType])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      unsigned int v7 = [v5 bundleType];
      unsigned __int8 v4 = [v7 isEqualToString:LSInternalApplicationType];
    }
  }

  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (BOOL)needsBorder
{
  return self->_needsBorder;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end