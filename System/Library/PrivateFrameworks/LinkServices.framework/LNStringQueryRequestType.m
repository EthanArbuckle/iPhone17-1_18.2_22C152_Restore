@interface LNStringQueryRequestType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNStringQueryRequestType)initWithCoder:(id)a3;
- (LNStringQueryRequestType)initWithQueryString:(id)a3;
- (NSString)queryString;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNStringQueryRequestType

- (void).cxx_destruct
{
}

- (NSString)queryString
{
  return self->_queryString;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNStringQueryRequestType *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNStringQueryRequestType *)self queryString];
      v8 = [(LNStringQueryRequestType *)v6 queryString];
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
  return [(NSString *)self->_queryString hash];
}

- (LNStringQueryRequestType)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryString"];

  v6 = [(LNStringQueryRequestType *)self initWithQueryString:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNStringQueryRequestType *)self queryString];
  [v4 encodeObject:v5 forKey:@"queryString"];
}

- (id)description
{
  return @"StringQuery";
}

- (LNStringQueryRequestType)initWithQueryString:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNStringQueryRequestType;
  v6 = [(LNQueryRequestTypeBase *)&v10 _init];
  v7 = (LNStringQueryRequestType *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end