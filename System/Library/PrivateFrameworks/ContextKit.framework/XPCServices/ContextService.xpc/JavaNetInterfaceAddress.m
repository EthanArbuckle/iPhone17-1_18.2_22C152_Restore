@interface JavaNetInterfaceAddress
+ (const)__metadata;
+ (signed)countPrefixLengthWithJavaNetInet4Address:(id)a3;
- (BOOL)isEqual:(id)a3;
- (JavaNetInterfaceAddress)initWithJavaNetInet4Address:(id)a3 withJavaNetInet4Address:(id)a4 withJavaNetInet4Address:(id)a5;
- (JavaNetInterfaceAddress)initWithJavaNetInet6Address:(id)a3 withShort:(signed __int16)a4;
- (id)description;
- (id)getAddress;
- (id)getBroadcast;
- (signed)getNetworkPrefixLength;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaNetInterfaceAddress

- (JavaNetInterfaceAddress)initWithJavaNetInet4Address:(id)a3 withJavaNetInet4Address:(id)a4 withJavaNetInet4Address:(id)a5
{
  self->prefixLength_ = sub_10025C12C((uint64_t)a5);
  return self;
}

- (JavaNetInterfaceAddress)initWithJavaNetInet6Address:(id)a3 withShort:(signed __int16)a4
{
  self->prefixLength_ = a4;
  return self;
}

+ (signed)countPrefixLengthWithJavaNetInet4Address:(id)a3
{
  return sub_10025C12C((uint64_t)a3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  objc_opt_class();
  if (!a3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  address = self->address_;
  uint64_t v6 = *((void *)a3 + 1);
  if (!address)
  {
    if (!v6) {
      goto LABEL_10;
    }
LABEL_15:
    LOBYTE(v7) = 0;
    return v7;
  }
  unsigned int v7 = [(JavaNetInetAddress *)address isEqual:v6];
  if (!v7) {
    return v7;
  }
LABEL_10:
  if (*((unsigned __int16 *)a3 + 12) != (unsigned __int16)self->prefixLength_) {
    goto LABEL_15;
  }
  broadcastAddress = self->broadcastAddress_;
  uint64_t v9 = *((void *)a3 + 2);
  if (broadcastAddress)
  {
    LOBYTE(v7) = [(JavaNetInetAddress *)broadcastAddress isEqual:v9];
  }
  else
  {
    LOBYTE(v7) = v9 == 0;
  }
  return v7;
}

- (unint64_t)hash
{
  address = self->address_;
  if (address) {
    uint64_t v4 = -(uint64_t)[(JavaNetInetAddress *)address hash];
  }
  else {
    LODWORD(v4) = 0;
  }
  broadcastAddress = self->broadcastAddress_;
  if (broadcastAddress) {
    LODWORD(broadcastAddress) = [(JavaNetInetAddress *)broadcastAddress hash];
  }
  return (int)broadcastAddress + (int)v4 + self->prefixLength_;
}

- (id)description
{
  return (id)JreStrcat("@CS$@C", (uint64_t)a2, v2, v3, v4, v5, v6, v7, self->address_);
}

- (id)getAddress
{
  return self->address_;
}

- (id)getBroadcast
{
  return self->broadcastAddress_;
}

- (signed)getNetworkPrefixLength
{
  return self->prefixLength_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNetInterfaceAddress;
  [(JavaNetInterfaceAddress *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10046A4A0;
}

@end