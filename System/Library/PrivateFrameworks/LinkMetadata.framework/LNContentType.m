@interface LNContentType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNContentType)initWithCoder:(id)a3;
- (LNContentType)initWithContentType:(id)a3;
- (NSString)contentType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNContentType

- (void).cxx_destruct
{
}

- (LNContentType)initWithContentType:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNContentType;
  v6 = [(LNContentType *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentType, a3);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNContentType *)self contentType];
  [v4 encodeObject:v5 forKey:@"contentType"];
}

- (NSString)contentType
{
  return self->_contentType;
}

- (LNContentType)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];

  v6 = [(LNContentType *)self initWithContentType:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNContentType *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNContentType *)self contentType];
      v8 = [(LNContentType *)v6 contentType];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqualToString:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v2 = [(LNContentType *)self contentType];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end