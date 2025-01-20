@interface BBAppearance
+ (BBAppearance)appearanceWithTitle:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BBAppearance)initWithCoder:(id)a3;
- (BBImage)image;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)replacementObjectForCoder:(id)a3;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation BBAppearance

+ (BBAppearance)appearanceWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setTitle:v4];

  return (BBAppearance *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BBAppearance *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
      v6 = [(BBAppearance *)self title];
      v7 = [(BBAppearance *)v5 title];
      if (BSEqualObjects())
      {
        v8 = [(BBAppearance *)self image];
        v9 = [(BBAppearance *)v5 image];
        if (BSEqualObjects())
        {
          int64_t v10 = [(BBAppearance *)self style];
          BOOL v11 = v10 == [(BBAppearance *)v5 style];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(BBAppearance *)self title];
  uint64_t v4 = [v3 hash];
  id v5 = [(BBAppearance *)self image];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(BBAppearance *)self style];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(BBAppearance *)self title];
  [v4 setTitle:v5];

  uint64_t v6 = [(BBAppearance *)self image];
  [v4 setImage:v6];

  objc_msgSend(v4, "setStyle:", -[BBAppearance style](self, "style"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBAppearance;
  id v5 = [(BBAppearance *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(BBAppearance *)v5 setTitle:v6];

    unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    [(BBAppearance *)v5 setImage:v7];

    -[BBAppearance setStyle:](v5, "setStyle:", [v4 decodeIntegerForKey:@"style"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(BBAppearance *)self title];
  [v6 encodeObject:v4 forKey:@"title"];

  id v5 = [(BBAppearance *)self image];
  [v6 encodeObject:v5 forKey:@"image"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[BBAppearance style](self, "style"), @"style");
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  id v5 = [v4 cacheObject:self];

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  id v5 = [v4 cacheObject:self];

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BBImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end