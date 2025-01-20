@interface JavaNetInetSocketAddress
+ (const)__metadata;
+ (id)createUnresolvedWithNSString:(id)a3 withInt:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnresolved;
- (JavaNetInetSocketAddress)init;
- (JavaNetInetSocketAddress)initWithInt:(int)a3;
- (JavaNetInetSocketAddress)initWithJavaNetInetAddress:(id)a3 withInt:(int)a4;
- (JavaNetInetSocketAddress)initWithNSString:(id)a3 withInt:(int)a4;
- (JavaNetInetSocketAddress)initWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5;
- (id)description;
- (id)getAddress;
- (id)getHostName;
- (id)getHostString;
- (int)getPort;
- (unint64_t)hash;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
@end

@implementation JavaNetInetSocketAddress

- (JavaNetInetSocketAddress)init
{
  return self;
}

- (JavaNetInetSocketAddress)initWithInt:(int)a3
{
  return self;
}

- (JavaNetInetSocketAddress)initWithJavaNetInetAddress:(id)a3 withInt:(int)a4
{
  return self;
}

- (JavaNetInetSocketAddress)initWithNSString:(id)a3 withInt:(int)a4
{
  return self;
}

- (JavaNetInetSocketAddress)initWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5
{
  return self;
}

+ (id)createUnresolvedWithNSString:(id)a3 withInt:(int)a4
{
  return JavaNetInetSocketAddress_createUnresolvedWithNSString_withInt_(a3, a4);
}

- (int)getPort
{
  return self->port_;
}

- (id)getAddress
{
  return self->addr_;
}

- (id)getHostName
{
  if (self->addr_) {
    return [(JavaNetInetAddress *)self->addr_ getHostName];
  }
  else {
    return self->hostname_;
  }
}

- (id)getHostString
{
  if (self->hostname_) {
    return self->hostname_;
  }
  addr = self->addr_;
  if (!addr) {
    JreThrowNullPointerException();
  }
  return [(JavaNetInetAddress *)addr getHostAddress];
}

- (BOOL)isUnresolved
{
  return self->addr_ == 0;
}

- (id)description
{
  addr = self->addr_;
  if (addr) {
    hostname = [(JavaNetInetAddress *)addr description];
  }
  else {
    hostname = self->hostname_;
  }
  return (id)JreStrcat("$CI", (uint64_t)a2, v2, v3, v4, v5, v6, v7, hostname);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (!a3) {
    goto LABEL_16;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->port_ != *((_DWORD *)a3 + 6)) {
    return 0;
  }
  addr = self->addr_;
  uint64_t v6 = *((void *)a3 + 1);
  if (!addr)
  {
    if (v6) {
      return 0;
    }
    addr = (JavaNetInetAddress *)self->hostname_;
    if (addr)
    {
      uint64_t v6 = *((void *)a3 + 2);
      goto LABEL_7;
    }
LABEL_16:
    JreThrowNullPointerException();
  }
LABEL_7:
  return [(JavaNetInetAddress *)addr isEqual:v6];
}

- (unint64_t)hash
{
  addr = self->addr_;
  if (!addr)
  {
    addr = (JavaNetInetAddress *)self->hostname_;
    if (!addr) {
      JreThrowNullPointerException();
    }
  }
  return (int)(self->port_ + [(JavaNetInetAddress *)addr hash]);
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  [a3 defaultReadObject];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetInetSocketAddress;
  [(JavaNetInetSocketAddress *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004690A8;
}

@end