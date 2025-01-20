@interface PHRecentsItem
+ (BOOL)supportsSecureCoding;
- (BOOL)verified;
- (NSDate)date;
- (NSString)localizedCount;
- (NSString)localizedSenderIdentityTitle;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)localizedValidHandlesTitle;
- (PHRecentsItem)initWithCoder:(id)a3;
- (PHRecentsItem)initWithItem:(id)a3;
- (UIImage)image;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setImage:(id)a3;
- (void)setLocalizedCount:(id)a3;
- (void)setLocalizedSenderIdentityTitle:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setLocalizedValidHandlesTitle:(id)a3;
- (void)setVerified:(BOOL)a3;
@end

@implementation PHRecentsItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_localizedSenderIdentityTitle, 0);
  objc_storeStrong((id *)&self->_localizedValidHandlesTitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedCount, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

- (void)setVerified:(BOOL)a3
{
  self->_verified = a3;
}

- (void)setLocalizedValidHandlesTitle:(id)a3
{
}

- (void)setLocalizedTitle:(id)a3
{
}

- (void)setLocalizedCount:(id)a3
{
}

- (void)setImage:(id)a3
{
}

- (void)setDate:(id)a3
{
}

- (PHRecentsItem)initWithItem:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PHRecentsItem;
  v5 = [(PHRecentsItem *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 image];
    image = v5->_image;
    v5->_image = (UIImage *)v6;

    v8 = [v4 localizedCount];
    v9 = (NSString *)[v8 copy];
    localizedCount = v5->_localizedCount;
    v5->_localizedCount = v9;

    v11 = [v4 localizedSubtitle];
    v12 = (NSString *)[v11 copy];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = v12;

    v14 = [v4 localizedTitle];
    v15 = (NSString *)[v14 copy];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = v15;

    v17 = [v4 localizedValidHandlesTitle];
    v18 = (NSString *)[v17 copy];
    localizedValidHandlesTitle = v5->_localizedValidHandlesTitle;
    v5->_localizedValidHandlesTitle = v18;

    v20 = [v4 localizedSenderIdentityTitle];
    v21 = (NSString *)[v20 copy];
    localizedSenderIdentityTitle = v5->_localizedSenderIdentityTitle;
    v5->_localizedSenderIdentityTitle = v21;

    v5->_verified = [v4 verified];
    uint64_t v23 = [v4 date];
    date = v5->_date;
    v5->_date = (NSDate *)v23;
  }
  return v5;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)localizedCount
{
  return self->_localizedCount;
}

- (BOOL)verified
{
  return self->_verified;
}

- (NSString)localizedSenderIdentityTitle
{
  return self->_localizedSenderIdentityTitle;
}

- (NSString)localizedValidHandlesTitle
{
  return self->_localizedValidHandlesTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PHRecentsItem allocWithZone:a3];

  return [(PHRecentsItem *)v4 initWithItem:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  image = self->_image;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector("image");
  [v5 encodeObject:image forKey:v6];

  localizedCount = self->_localizedCount;
  v8 = NSStringFromSelector("localizedCount");
  [v5 encodeObject:localizedCount forKey:v8];

  localizedSubtitle = self->_localizedSubtitle;
  v10 = NSStringFromSelector("localizedSubtitle");
  [v5 encodeObject:localizedSubtitle forKey:v10];

  localizedTitle = self->_localizedTitle;
  v12 = NSStringFromSelector("localizedTitle");
  [v5 encodeObject:localizedTitle forKey:v12];

  localizedValidHandlesTitle = self->_localizedValidHandlesTitle;
  v14 = NSStringFromSelector("localizedValidHandlesTitle");
  [v5 encodeObject:localizedValidHandlesTitle forKey:v14];

  date = self->_date;
  v16 = NSStringFromSelector("date");
  [v5 encodeObject:date forKey:v16];

  localizedSenderIdentityTitle = self->_localizedSenderIdentityTitle;
  v18 = NSStringFromSelector("localizedSenderIdentityTitle");
  [v5 encodeObject:localizedSenderIdentityTitle forKey:v18];

  BOOL verified = self->_verified;
  NSStringFromSelector("verified");
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeBool:verified forKey:v20];
}

- (PHRecentsItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PHRecentsItem;
  id v5 = [(PHRecentsItem *)&v36 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("image");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    image = v5->_image;
    v5->_image = (UIImage *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector("localizedCount");
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    localizedCount = v5->_localizedCount;
    v5->_localizedCount = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector("localizedSubtitle");
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector("localizedTitle");
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    uint64_t v23 = NSStringFromSelector("localizedValidHandlesTitle");
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    localizedValidHandlesTitle = v5->_localizedValidHandlesTitle;
    v5->_localizedValidHandlesTitle = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector("date");
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    date = v5->_date;
    v5->_date = (NSDate *)v28;

    uint64_t v30 = objc_opt_class();
    v31 = NSStringFromSelector("localizedSenderIdentityTitle");
    uint64_t v32 = [v4 decodeObjectOfClass:v30 forKey:v31];
    localizedSenderIdentityTitle = v5->_localizedSenderIdentityTitle;
    v5->_localizedSenderIdentityTitle = (NSString *)v32;

    v34 = NSStringFromSelector("verified");
    v5->_BOOL verified = [v4 decodeBoolForKey:v34];
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PHMutableRecentsItem allocWithZone:a3];

  return [(PHRecentsItem *)v4 initWithItem:self];
}

- (void)setLocalizedSenderIdentityTitle:(id)a3
{
}

@end