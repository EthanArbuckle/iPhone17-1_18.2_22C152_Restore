@interface JavaNetPlainServerSocketImpl
+ (const)__metadata;
- (JavaNetPlainServerSocketImpl)init;
- (JavaNetPlainServerSocketImpl)initWithJavaIoFileDescriptor:(id)a3;
- (void)createWithBoolean:(BOOL)a3;
@end

@implementation JavaNetPlainServerSocketImpl

- (JavaNetPlainServerSocketImpl)init
{
  return self;
}

- (JavaNetPlainServerSocketImpl)initWithJavaIoFileDescriptor:(id)a3
{
  return self;
}

- (void)createWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)JavaNetPlainServerSocketImpl;
  -[JavaNetPlainSocketImpl createWithBoolean:](&v5, "createWithBoolean:");
  if (v3)
  {
    if ((atomic_load_explicit(JavaLangBoolean__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    [(JavaNetPlainSocketImpl *)self setOptionWithInt:4 withId:JavaLangBoolean_TRUE__];
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004795E8;
}

@end