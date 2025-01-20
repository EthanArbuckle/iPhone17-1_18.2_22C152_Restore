@interface LNISIconImage
+ (BOOL)supportsSecureCoding;
- (LNISIconImage)initWithAppBundleIdentifier:(id)a3;
- (LNISIconImage)initWithCoder:(id)a3;
- (LNISIconImage)initWithIconType:(int64_t)a3 identifier:(id)a4;
- (LNISIconImage)initWithUTType:(id)a3;
- (NSString)identifier;
- (int64_t)iconType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNISIconImage

- (void).cxx_destruct
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)iconType
{
  return self->_iconType;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LNISIconImage;
  id v4 = a3;
  [(LNImage *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNISIconImage iconType](self, "iconType", v6.receiver, v6.super_class), @"iconType");
  v5 = [(LNISIconImage *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

- (LNISIconImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"iconType"];
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  if (v6)
  {
    self = [(LNISIconImage *)self initWithIconType:v5 identifier:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (LNISIconImage)initWithIconType:(int64_t)a3 identifier:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LNISIconImage.m", 35, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)LNISIconImage;
  v9 = [(LNImage *)&v13 initWithSystemImageNamed:&stru_1EEDBEA90];
  v10 = v9;
  if (v9)
  {
    v9->_iconType = a3;
    objc_storeStrong((id *)&v9->_identifier, a4);
  }

  return v10;
}

- (LNISIconImage)initWithAppBundleIdentifier:(id)a3
{
  return [(LNISIconImage *)self initWithIconType:0 identifier:a3];
}

- (LNISIconImage)initWithUTType:(id)a3
{
  return [(LNISIconImage *)self initWithIconType:1 identifier:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end