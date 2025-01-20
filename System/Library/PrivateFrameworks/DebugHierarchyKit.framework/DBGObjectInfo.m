@interface DBGObjectInfo
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withInfo:(id)a3;
- (DBGObjectInfo)initWithInfo:(id)a3;
- (NSDictionary)objectInfo;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayString;
- (id)objectClassName;
- (id)objectPointer;
- (void)setObjectInfo:(id)a3;
@end

@implementation DBGObjectInfo

+ (id)withInfo:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithInfo:v4];

  return v5;
}

- (DBGObjectInfo)initWithInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBGObjectInfo;
  v6 = [(DBGObjectInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_objectInfo, a3);
  }

  return v7;
}

- (NSString)displayString
{
  v3 = [(DBGObjectInfo *)self objectInfo];

  if (v3)
  {
    id v4 = [(DBGObjectInfo *)self objectClassName];
    uint64_t v5 = [(DBGObjectInfo *)self objectPointer];
    v6 = (void *)v5;
    v7 = 0;
    if (v4 && v5)
    {
      v7 = +[NSString stringWithFormat:@"<%@: %@>", v4, v5];
    }
  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (id)objectClassName
{
  v2 = [(DBGObjectInfo *)self objectInfo];
  v3 = [v2 objectForKeyedSubscript:@"className"];

  return v3;
}

- (id)objectPointer
{
  v2 = [(DBGObjectInfo *)self objectInfo];
  v3 = [v2 objectForKeyedSubscript:@"memoryAddress"];

  return v3;
}

- (NSString)description
{
  v2 = [(DBGObjectInfo *)self objectValue];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(DBGObjectInfo *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSDictionary)objectInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setObjectInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"objectInfo"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v9 = [a1 withInfo:v8];
  }
  else
  {
    objc_super v9 = 0;
    if (!v8 && a5)
    {
      objc_super v9 = 0;
      *a5 = 0;
    }
  }

  return v9;
}

@end