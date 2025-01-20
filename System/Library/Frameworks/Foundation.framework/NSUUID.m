@interface NSUUID
+ (BOOL)_compatibilityBehavior;
+ (BOOL)supportsSecureCoding;
+ (NSUUID)UUID;
+ (NSUUID)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSComparisonResult)compare:(NSUUID *)otherUUID;
- (NSString)UUIDString;
- (NSUUID)init;
- (NSUUID)initWithCoder:(id)a3;
- (NSUUID)initWithUUIDBytes:(const unsigned __int8 *)bytes;
- (NSUUID)initWithUUIDString:(NSString *)string;
- (__CFString)_cfUUIDString;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)getUUIDBytes:(unsigned __int8 *)uuid;
@end

@implementation NSUUID

- (unint64_t)hash
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [(NSUUID *)self getUUIDBytes:v3];
  return CFHashBytes();
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self == a3) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  [(NSUUID *)self getUUIDBytes:&v9];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  [a3 getUUIDBytes:&v7];
  return v9 == v7 && v10 == v8;
}

+ (NSUUID)allocWithZone:(_NSZone *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (NSUUID == a1 || (id)objc_opt_class() == a1)
  {
    v6 = (objc_class *)self;
    return (NSUUID *)NSAllocateObject(v6, 0, a3);
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NSUUID;
    return (NSUUID *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_compatibilityBehavior
{
  return dyld_program_sdk_at_least() ^ 1;
}

+ (NSUUID)UUID
{
  id v2 = objc_alloc_init((Class)a1);

  return (NSUUID *)v2;
}

- (NSUUID)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSUUID;
  return [(NSUUID *)&v3 init];
}

- (NSUUID)initWithUUIDString:(NSString *)string
{
  return 0;
}

- (NSUUID)initWithUUIDBytes:(const unsigned __int8 *)bytes
{
  return 0;
}

- (NSComparisonResult)compare:(NSUUID *)otherUUID
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self == otherUUID) {
    return 0;
  }
  long long v11 = 0uLL;
  [(NSUUID *)self getUUIDBytes:&v11];
  long long v10 = 0uLL;
  [(NSUUID *)otherUUID getUUIDBytes:&v10];
  int v4 = 0;
  long long v12 = v10;
  long long v13 = v11;
  for (uint64_t i = 15; i != -1; --i)
  {
    int v6 = *((unsigned __int8 *)&v13 + i) - *((unsigned __int8 *)&v12 + i);
    int v4 = v4 & (((v6 - 1) & ~v6) >> 8) | v6;
  }
  BOOL v7 = v4 < 0;
  NSComparisonResult v8 = (unint64_t)(v4 != 0);
  if (v7) {
    return -1;
  }
  else {
    return v8;
  }
}

- (void)getUUIDBytes:(unsigned __int8 *)uuid
{
  *(void *)uuid = 0;
  *((void *)uuid + 1) = 0;
}

- (NSString)UUIDString
{
  return (NSString *)&stru_1ECA5C228;
}

- (__CFString)_cfUUIDString
{
  id v2 = [(NSUUID *)self UUIDString];
  objc_super v3 = (__CFString *)v2;
  if (v2) {
    CFRetain(v2);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  [(NSUUID *)self getUUIDBytes:v5];
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithUUIDBytes:", v5);
}

- (void)encodeWithCoder:(id)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"-[NSUUID encodeWithCoder]: NSUUIDs cannot be encoded by non-keyed coders" userInfo:0]);
  }
  v5[0] = 0;
  v5[1] = 0;
  [(NSUUID *)self getUUIDBytes:v5];
  [a3 encodeBytes:v5 length:16 forKey:@"NS.uuidbytes"];
}

- (NSUUID)initWithCoder:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"-[NSUUID initWithCoder]: NSUUIDs cannot be decoded by non-keyed coders" userInfo:0]);
  }
  uint64_t v9 = 0;
  uint64_t v5 = [a3 decodeBytesForKey:@"NS.uuidbytes" returnedLength:&v9];
  if (v5)
  {
    if (v9 == 16) {
      return [(NSUUID *)self initWithUUIDBytes:v5];
    }
    if (dyld_program_sdk_at_least())
    {
      long long v10 = @"NSLocalizedDescription";
      long long v11 = @"UUID bytes were not the expected length";
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      uint64_t v8 = 4864;
      goto LABEL_9;
    }
    return [(NSUUID *)self init];
  }
  if (!dyld_program_sdk_at_least()) {
    return [(NSUUID *)self init];
  }
  long long v12 = @"NSLocalizedDescription";
  v13[0] = @"UUID bytes not found in archive";
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v8 = 4865;
LABEL_9:
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", v8, v7));

  return 0;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end