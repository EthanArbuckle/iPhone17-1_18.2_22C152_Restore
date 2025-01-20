@interface BBButton
+ (BOOL)supportsSecureCoding;
+ (id)buttonWithTitle:(id)a3 action:(id)a4;
+ (id)buttonWithTitle:(id)a3 action:(id)a4 identifier:(id)a5;
+ (id)buttonWithTitle:(id)a3 glyphData:(id)a4 action:(id)a5 identifier:(id)a6;
+ (id)buttonWithTitle:(id)a3 image:(id)a4 action:(id)a5 identifier:(id)a6;
- (BBAction)action;
- (BBButton)initWithCoder:(id)a3;
- (BBButton)initWithTitle:(id)a3 image:(id)a4 action:(id)a5 identifier:(id)a6;
- (BBImage)image;
- (BOOL)isEqual:(id)a3;
- (NSData)glyphData;
- (NSString)identifier;
- (NSString)title;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)description;
- (id)replacementObjectForCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BBButton

+ (id)buttonWithTitle:(id)a3 action:(id)a4
{
  return (id)[a1 buttonWithTitle:a3 action:a4 identifier:0];
}

+ (id)buttonWithTitle:(id)a3 action:(id)a4 identifier:(id)a5
{
  return (id)[a1 buttonWithTitle:a3 image:0 action:a4 identifier:a5];
}

+ (id)buttonWithTitle:(id)a3 glyphData:(id)a4 action:(id)a5 identifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = +[BBImage imageWithData:a4];
  v14 = [a1 buttonWithTitle:v12 image:v13 action:v11 identifier:v10];

  return v14;
}

+ (id)buttonWithTitle:(id)a3 image:(id)a4 action:(id)a5 identifier:(id)a6
{
  unint64_t v11 = (unint64_t)a3;
  unint64_t v12 = (unint64_t)a4;
  id v13 = a5;
  id v14 = a6;
  if (!(v11 | v12))
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"BBButton.m", 45, @"%@-buttonWithTitle:action: requires a title or image (or both)", a1 object file lineNumber description];
  }
  v15 = (void *)[objc_alloc((Class)a1) initWithTitle:v11 image:v12 action:v13 identifier:v14];

  return v15;
}

- (BBButton)initWithTitle:(id)a3 image:(id)a4 action:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BBButton;
  id v14 = [(BBButton *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(BBButton *)v14 setTitle:v10];
    [(BBButton *)v15 setImage:v11];
    [(BBButton *)v15 setAction:v12];
    [(BBButton *)v15 setIdentifier:v13];
  }

  return v15;
}

- (NSData)glyphData
{
  v2 = [(BBButton *)self image];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BBButton *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      v6 = [(BBButton *)self title];
      v7 = [(BBButton *)v5 title];
      if (BSEqualStrings())
      {
        v8 = [(BBButton *)self image];
        v9 = [(BBButton *)v5 image];
        if (BSEqualObjects())
        {
          id v10 = [(BBButton *)self action];
          id v11 = [(BBButton *)v5 action];
          if (BSEqualObjects())
          {
            v15 = [(BBButton *)self identifier];
            id v12 = [(BBButton *)v5 identifier];
            char v13 = BSEqualObjects();
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(BBButton *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(BBButton *)self image];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(BBButton *)self action];
  uint64_t v8 = [v7 hash];
  v9 = [(BBButton *)self identifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(BBButton *)self title];
  uint64_t v6 = [(BBButton *)self action];
  v7 = [v3 stringWithFormat:@"<%@: %p; title: \"%@\"; action: %@>", v4, self, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  v9 = [(BBButton *)self initWithTitle:v5 image:v6 action:v7 identifier:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BBButton *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  uint64_t v6 = [(BBButton *)self image];
  [v4 encodeObject:v6 forKey:@"image"];

  v7 = [(BBButton *)self action];
  [v4 encodeObject:v7 forKey:@"action"];

  id v8 = [(BBButton *)self identifier];
  [v4 encodeObject:v8 forKey:@"identifier"];
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  v5 = [v4 cacheObject:self];

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  v5 = [v4 cacheObject:self];

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

- (BBAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end