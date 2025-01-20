@interface SFCustomActivityProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (SFCustomActivityProxy)initWithActivity:(id)a3;
- (SFCustomActivityProxy)initWithCoder:(id)a3;
- (UIImage)activityImage;
- (id)_initWithActivityType:(id)a3 title:(id)a4 image:(id)a5 proxyID:(unint64_t)a6;
- (id)activityTypeWithActivity:(id)a3;
- (unint64_t)activityProxyID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFCustomActivityProxy

- (SFCustomActivityProxy)initWithActivity:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFCustomActivityProxy;
  v5 = [(SFCustomActivityProxy *)&v16 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(SFCustomActivityProxy *)v5 activityTypeWithActivity:v4];
    activityType = v6->_activityType;
    v6->_activityType = (NSString *)v7;

    uint64_t v9 = [v4 activityTitle];
    activityTitle = v6->_activityTitle;
    v6->_activityTitle = (NSString *)v9;

    uint64_t v11 = [v4 activityImage];
    activityImage = v6->_activityImage;
    v6->_activityImage = (UIImage *)v11;

    uint64_t v13 = initWithActivity__activityProxyID++;
    v6->_activityProxyID = v13;
    v14 = v6;
  }

  return v6;
}

- (id)_initWithActivityType:(id)a3 title:(id)a4 image:(id)a5 proxyID:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFCustomActivityProxy;
  v14 = [(SFCustomActivityProxy *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_activityType, a3);
    objc_storeStrong((id *)&v15->_activityTitle, a4);
    objc_storeStrong((id *)&v15->_activityImage, a5);
    v15->_activityProxyID = a6;
    objc_super v16 = v15;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_activityProxyID == v4[4];

  return v5;
}

- (unint64_t)hash
{
  return self->_activityProxyID;
}

- (id)activityTypeWithActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 activityType];
  BOOL v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v4, "safari_stringByRemovingCharactersInSet:", v5),
        v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 length],
        v6,
        !v7))
  {
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v9 = [v8 bundleIdentifier];
    v10 = objc_msgSend(v9, "safari_stringByRemovingCharactersInSet:", v5);

    id v11 = [v3 activityTitle];
    id v12 = objc_msgSend(v11, "safari_stringByRemovingCharactersInSet:", v5);

    uint64_t v13 = [NSString stringWithFormat:@"com.apple.SafariServices.hostApplicationActivity.%@.%@", v10, v12];

    id v4 = (void *)v13;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCustomActivityProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityTitle"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityImage"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"activityProxyID"];

  uint64_t v9 = [(SFCustomActivityProxy *)self _initWithActivityType:v5 title:v6 image:v7 proxyID:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  activityType = self->_activityType;
  id v5 = a3;
  [v5 encodeObject:activityType forKey:@"activityType"];
  [v5 encodeObject:self->_activityTitle forKey:@"activityTitle"];
  [v5 encodeObject:self->_activityImage forKey:@"activityImage"];
  [v5 encodeInteger:self->_activityProxyID forKey:@"activityProxyID"];
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (UIImage)activityImage
{
  return self->_activityImage;
}

- (unint64_t)activityProxyID
{
  return self->_activityProxyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityImage, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

@end