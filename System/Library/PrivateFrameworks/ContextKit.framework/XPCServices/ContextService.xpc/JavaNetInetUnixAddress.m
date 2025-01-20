@interface JavaNetInetUnixAddress
+ (const)__metadata;
- (JavaNetInetUnixAddress)initWithByteArray:(id)a3;
- (JavaNetInetUnixAddress)initWithNSString:(id)a3;
- (id)description;
@end

@implementation JavaNetInetUnixAddress

- (JavaNetInetUnixAddress)initWithNSString:(id)a3
{
  return self;
}

- (JavaNetInetUnixAddress)initWithByteArray:(id)a3
{
  return self;
}

- (id)description
{
  ipaddress = self->super.ipaddress_;
  if ((atomic_load_explicit(JavaNioCharsetStandardCharsets__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  +[NSString stringWithBytes:ipaddress charset:JavaNioCharsetStandardCharsets_UTF_8_];
  return (id)JreStrcat("$$C", v3, v4, v5, v6, v7, v8, v9, @"InetUnixAddress[");
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10045DF80;
}

@end