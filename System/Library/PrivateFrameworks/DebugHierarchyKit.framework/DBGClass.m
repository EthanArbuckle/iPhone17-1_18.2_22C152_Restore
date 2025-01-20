@interface DBGClass
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withName:(id)a3;
- (DBGClass)initWithClassName:(id)a3;
- (NSString)className;
- (NSString)debugDescription;
- (NSString)description;
- (void)setClassName:(id)a3;
@end

@implementation DBGClass

+ (id)withName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithClassName:v4];

  return v5;
}

- (DBGClass)initWithClassName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DBGClass;
  v6 = [(DBGClass *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_className, a3);
  }

  return v7;
}

- (NSString)description
{
  v2 = [(DBGClass *)self objectValue];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(DBGClass *)self description];
  v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)className
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClassName:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"public.plain-text"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v9 = [a1 withName:v8];
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