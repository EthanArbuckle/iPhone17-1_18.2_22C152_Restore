@interface MFNanoBridgeSettingsSharedMailbox
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MFNanoBridgeSettingsSharedMailbox)initWithCoder:(id)a3;
- (MFNanoBridgeSettingsSharedMailbox)initWithType:(unint64_t)a3;
- (id)_includesMeIconImage;
- (id)displayName;
- (id)icon;
- (unint64_t)hash;
- (unint64_t)mailboxFilterType;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MFNanoBridgeSettingsSharedMailbox

- (MFNanoBridgeSettingsSharedMailbox)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFNanoBridgeSettingsSharedMailbox;
  result = [(MFNanoBridgeSettingsSharedMailbox *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (unint64_t)mailboxFilterType
{
  if ((id)[(MFNanoBridgeSettingsSharedMailbox *)self type] == (id)1) {
    return 2;
  }
  if ((id)[(MFNanoBridgeSettingsSharedMailbox *)self type] == (id)2) {
    return 4;
  }
  if ((id)[(MFNanoBridgeSettingsSharedMailbox *)self type] == (id)3) {
    return 8;
  }
  if ((id)[(MFNanoBridgeSettingsSharedMailbox *)self type] == (id)6) {
    return 32;
  }
  if ((id)[(MFNanoBridgeSettingsSharedMailbox *)self type] == (id)4) {
    return 16;
  }
  return (unint64_t)((id)[(MFNanoBridgeSettingsSharedMailbox *)self type] == (id)7) << 6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = +[NSNumber numberWithUnsignedInteger:self->_type];
  [v5 encodeObject:v4 forKey:@"kNSCodingKeyType"];
}

- (MFNanoBridgeSettingsSharedMailbox)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyType"];
  id v6 = [v5 unsignedIntegerValue];

  v7 = [(MFNanoBridgeSettingsSharedMailbox *)self initWithType:v6];
  return v7;
}

- (id)displayName
{
  v2 = 0;
  switch(self->_type)
  {
    case 1uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v4 = [v3 localizedStringForKey:@"VIP" value:&stru_10013ED08 table:@"Main"];
      goto LABEL_8;
    case 2uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v4 = [v3 localizedStringForKey:@"FLAGGED" value:&stru_10013ED08 table:@"Main"];
      goto LABEL_8;
    case 3uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v4 = [v3 localizedStringForKey:@"UNREAD" value:&stru_10013ED08 table:@"Main"];
      goto LABEL_8;
    case 4uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v4 = [v3 localizedStringForKey:@"TO_OR_CC" value:&stru_10013ED08 table:@"Main"];
      goto LABEL_8;
    case 6uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v4 = [v3 localizedStringForKey:@"IMPORTANT_THREADS" value:&stru_10013ED08 table:@"Main"];
      goto LABEL_8;
    case 7uLL:
      v3 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v4 = [v3 localizedStringForKey:@"TODAY" value:&stru_10013ED08 table:@"Main"];
LABEL_8:
      v2 = (void *)v4;

      break;
    default:
      break;
  }

  return v2;
}

- (id)icon
{
  v2 = 0;
  switch(self->_type)
  {
    case 1uLL:
      v3 = +[UIImage mf_systemImageNamed:MFImageGlyphFavoriteVIPMailbox forView:7];
      uint64_t v4 = off_10016AA58();
      uint64_t v5 = [v3 imageWithTintColor:v4];
      goto LABEL_8;
    case 2uLL:
      v3 = +[UIImage mf_systemImageNamed:MFImageGlyphFavoriteFlaggedMailbox forView:7];
      uint64_t v4 = off_10016AA58();
      uint64_t v5 = [v3 imageWithTintColor:v4];
      goto LABEL_8;
    case 3uLL:
      v3 = +[UIImage mf_systemImageNamed:MFImageGlyphFavoriteUnreadMailbox forView:7];
      uint64_t v4 = off_10016AA58();
      uint64_t v5 = [v3 imageWithTintColor:v4];
      goto LABEL_8;
    case 4uLL:
      v3 = [(MFNanoBridgeSettingsSharedMailbox *)self _includesMeIconImage];
      uint64_t v4 = off_10016AA58();
      uint64_t v5 = [v3 imageWithTintColor:v4];
      goto LABEL_8;
    case 6uLL:
      v3 = +[UIImage mf_systemImageNamed:MFImageGlyphFavoriteNotifydMailbox forView:7];
      uint64_t v4 = off_10016AA58();
      uint64_t v5 = [v3 imageWithTintColor:v4];
      goto LABEL_8;
    case 7uLL:
      v3 = +[UIImage mf_systemImageNamed:MFImageGlyphFavoriteTodayMailbox forView:7];
      uint64_t v4 = off_10016AA58();
      uint64_t v5 = [v3 imageWithTintColor:v4];
LABEL_8:
      v2 = (void *)v5;

      break;
    default:
      break;
  }

  return v2;
}

- (unint64_t)hash
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFNanoBridgeSettingsSharedMailbox;
  if ([(MFNanoBridgeSettingsMailbox *)&v7 isEqual:v4]) {
    BOOL v5 = [v4 type] == self->_type;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_includesMeIconImage
{
  v2 = (void *)qword_10016BC30;
  if (!qword_10016BC30)
  {
    v3 = UIContentSizeCategoryLarge;
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    double v5 = sub_10004BD78(2, v3, v4, 35.0);

    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    double v7 = sub_10004BD78(3, v3, v6, 35.0);

    if (v5 < v7) {
      double v5 = v7;
    }
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = +[UIColor systemGrayColor];
    v10 = sub_10004B734(2, v3, v8, v9, 0, v5);

    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = +[UIColor systemGrayColor];
    v13 = sub_10004B734(3, v3, v11, v12, 0, v5);

    [v10 size];
    double v15 = v14;
    [v13 size];
    v27.height = v15 + v16 + 2.0;
    v27.width = v5;
    UIGraphicsBeginImageContextWithOptions(v27, 0, 0.0);
    [v10 size];
    double v18 = v17;
    double v20 = v19;
    double y = CGRectZero.origin.y;
    objc_msgSend(v10, "drawInRect:", CGRectZero.origin.x, y, v17, v19);
    [v10 size];
    objc_msgSend(v13, "drawInRect:", CGRectZero.origin.x, y + v22 + 2.0, v18, v20);
    uint64_t v23 = UIGraphicsGetImageFromCurrentImageContext();
    v24 = (void *)qword_10016BC30;
    qword_10016BC30 = v23;

    UIGraphicsEndImageContext();
    v2 = (void *)qword_10016BC30;
  }

  return v2;
}

- (unint64_t)type
{
  return self->_type;
}

@end