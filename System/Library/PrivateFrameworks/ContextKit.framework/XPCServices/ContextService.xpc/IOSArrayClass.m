@interface IOSArrayClass
- (BOOL)isArray;
- (BOOL)isAssignableFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstance:(id)a3;
- (IOSArrayClass)initWithComponentType:(id)a3;
- (id)binaryName;
- (id)description;
- (id)getCanonicalName;
- (id)getComponentType;
- (id)getInterfacesInternal;
- (id)getSimpleName;
- (id)newInstance;
- (id)objcName;
- (void)dealloc;
@end

@implementation IOSArrayClass

- (IOSArrayClass)initWithComponentType:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IOSArrayClass;
  v4 = [(IOSArrayClass *)&v6 init];
  if (v4) {
    v4->componentType_ = (IOSClass *)a3;
  }
  return v4;
}

- (id)getComponentType
{
  return self->componentType_;
}

- (BOOL)isArray
{
  return 1;
}

- (BOOL)isInstance:(id)a3
{
  id v4 = [a3 getClass];
  unsigned int v5 = [v4 isArray];
  if (v5)
  {
    componentType = self->componentType_;
    id v7 = [v4 getComponentType];
    LOBYTE(v5) = [(IOSClass *)componentType isAssignableFrom:v7];
  }
  return v5;
}

- (BOOL)isAssignableFrom:(id)a3
{
  unsigned int v5 = [a3 isArray];
  if (v5)
  {
    componentType = self->componentType_;
    id v7 = [a3 getComponentType];
    LOBYTE(v5) = [(IOSClass *)componentType isAssignableFrom:v7];
  }
  return v5;
}

- (id)getSimpleName
{
  id v2 = objc_msgSend(-[IOSArrayClass getComponentType](self, "getComponentType"), "getSimpleName");
  return [v2 stringByAppendingString:@"[]"];
}

- (id)binaryName
{
  return +[NSString stringWithFormat:@"[%@", [(IOSClass *)self->componentType_ binaryName]];
}

- (id)objcName
{
  id v2 = objc_msgSend(-[IOSArrayClass getComponentType](self, "getComponentType"), "objcName");
  return [v2 stringByAppendingString:@"Array"];
}

- (id)getCanonicalName
{
  return +[NSString stringWithFormat:@"%@[]", [(IOSClass *)self->componentType_ getCanonicalName]];
}

- (id)getInterfacesInternal
{
  if (qword_1005608A8 != -1) {
    dispatch_once(&qword_1005608A8, &stru_1003FEE98);
  }
  return (id)qword_1005608B0;
}

- (id)newInstance
{
  if (!self->componentType_) {
    objc_exception_throw(objc_alloc_init(JavaLangInstantiationException));
  }
  return +[IOSObjectArray arrayWithLength:type:](IOSObjectArray, "arrayWithLength:type:", 0);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  componentType = self->componentType_;
  id v6 = [a3 getComponentType];
  return [(IOSClass *)componentType isEqual:v6];
}

- (id)description
{
  return +[NSString stringWithFormat:@"class %@", [(IOSArrayClass *)self getName]];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IOSArrayClass;
  [(IOSArrayClass *)&v3 dealloc];
}

@end