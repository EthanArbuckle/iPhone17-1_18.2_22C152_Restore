@interface CNKNoticeRecipe
+ (BOOL)supportsSecureCoding;
- (CNKNoticeRecipe)initWithCoder:(id)a3;
- (CNKNoticeRecipe)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 primaryActionTitle:(id)a6 secondaryActionTitle:(id)a7 type:(int64_t)a8;
- (NSString)primaryActionTitle;
- (NSString)secondaryActionTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSUUID)uuid;
- (UIImage)image;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNKNoticeRecipe

- (CNKNoticeRecipe)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 primaryActionTitle:(id)a6 secondaryActionTitle:(id)a7 type:(int64_t)a8
{
  id v24 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CNKNoticeRecipe;
  v18 = [(CNKNoticeRecipe *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_subtitle, a4);
    objc_storeStrong((id *)&v19->_image, a5);
    objc_storeStrong((id *)&v19->_primaryActionTitle, a6);
    objc_storeStrong((id *)&v19->_secondaryActionTitle, a7);
    uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v20;

    v19->_type = a8;
  }

  return v19;
}

- (CNKNoticeRecipe)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CNKNoticeRecipe;
  v5 = [(CNKNoticeRecipe *)&v34 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_title);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_subtitle);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    id v15 = NSStringFromSelector(sel_image);
    id v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

    if (!v16) {
      goto LABEL_9;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F29128]);
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuidString"];
    uint64_t v19 = [v17 initWithUUIDString:v18];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4FB1818]) initWithData:v16];
    image = v5->_image;
    v5->_image = (UIImage *)v21;

    uint64_t v23 = objc_opt_class();
    id v24 = NSStringFromSelector(sel_primaryActionTitle);
    uint64_t v25 = [v4 decodeObjectOfClass:v23 forKey:v24];
    primaryActionTitle = v5->_primaryActionTitle;
    v5->_primaryActionTitle = (NSString *)v25;

    uint64_t v27 = objc_opt_class();
    v28 = NSStringFromSelector(sel_secondaryActionTitle);
    uint64_t v29 = [v4 decodeObjectOfClass:v27 forKey:v28];
    secondaryActionTitle = v5->_secondaryActionTitle;
    v5->_secondaryActionTitle = (NSString *)v29;

    v31 = NSStringFromSelector(sel_type);
    v5->_type = [v4 decodeIntegerForKey:v31];

    if (!v5->_title || !v5->_subtitle || !v5->_uuid || !v5->_image)
    {
LABEL_9:

      v32 = 0;
      goto LABEL_10;
    }
  }
  v32 = v5;
LABEL_10:

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_title);
  [v5 encodeObject:title forKey:v6];

  subtitle = self->_subtitle;
  uint64_t v8 = NSStringFromSelector(sel_subtitle);
  [v5 encodeObject:subtitle forKey:v8];

  primaryActionTitle = self->_primaryActionTitle;
  uint64_t v10 = NSStringFromSelector(sel_primaryActionTitle);
  [v5 encodeObject:primaryActionTitle forKey:v10];

  secondaryActionTitle = self->_secondaryActionTitle;
  uint64_t v12 = NSStringFromSelector(sel_secondaryActionTitle);
  [v5 encodeObject:secondaryActionTitle forKey:v12];

  v13 = [(NSUUID *)self->_uuid UUIDString];
  [v5 encodeObject:v13 forKey:@"uuidString"];

  uint64_t v14 = UIImagePNGRepresentation(self->_image);
  id v15 = NSStringFromSelector(sel_image);
  [v5 encodeObject:v14 forKey:v15];

  int64_t type = self->_type;
  NSStringFromSelector(sel_type);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:type forKey:v17];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end