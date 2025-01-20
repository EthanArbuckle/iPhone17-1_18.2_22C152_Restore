@interface JavaEnclosingMethodMetadata
- (JavaEnclosingMethodMetadata)initWithMetadata:(const J2ObjCEnclosingMethodInfo *)a3;
- (NSString)selector;
- (NSString)typeName;
- (void)dealloc;
@end

@implementation JavaEnclosingMethodMetadata

- (JavaEnclosingMethodMetadata)initWithMetadata:(const J2ObjCEnclosingMethodInfo *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JavaEnclosingMethodMetadata;
  v4 = [(JavaEnclosingMethodMetadata *)&v6 init];
  if (v4)
  {
    v4->typeName = (NSString *)[objc_alloc((Class)NSString) initWithCString:a3->var0 encoding:4];
    v4->selector = (NSString *)[objc_alloc((Class)NSString) initWithCString:a3->var1 encoding:4];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaEnclosingMethodMetadata;
  [(JavaEnclosingMethodMetadata *)&v3 dealloc];
}

- (NSString)typeName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)selector
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end