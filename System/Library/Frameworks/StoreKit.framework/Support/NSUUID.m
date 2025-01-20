@interface NSUUID
+ (id)lib_UUIDWithLegacyJobID:(int64_t)a3;
+ (id)lib_shortLogKey;
+ (id)lib_shortLogKeyWithAPIVersion:(int64_t)a3;
- (NSString)lib_logUUID;
- (int64_t)lib_legacyJobID;
- (unint64_t)lib_signpostId;
- (void)_lib_getBytes:(void *)a3 count:(unint64_t)a4;
@end

@implementation NSUUID

+ (id)lib_shortLogKey
{
  v2 = +[NSUUID UUID];
  v3 = [v2 UUIDString];
  v4 = [v3 componentsSeparatedByString:@"-"];
  v5 = [v4 firstObject];

  return v5;
}

+ (id)lib_UUIDWithLegacyJobID:(int64_t)a3
{
  v5[0] = a3;
  v5[1] = 0;
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v5];

  return v3;
}

- (int64_t)lib_legacyJobID
{
  int64_t v3 = 0;
  [(NSUUID *)self _lib_getBytes:&v3 count:8];
  return v3;
}

- (NSString)lib_logUUID
{
  unsigned int v4 = 0;
  [(NSUUID *)self _lib_getBytes:&v4 count:4];
  v2 = +[NSString stringWithFormat:@"%08X", v4];

  return (NSString *)v2;
}

- (unint64_t)lib_signpostId
{
  unint64_t v3 = 0;
  [(NSUUID *)self _lib_getBytes:&v3 count:4];
  return v3;
}

+ (id)lib_shortLogKeyWithAPIVersion:(int64_t)a3
{
  unsigned int v4 = objc_msgSend(a1, "lib_shortLogKey");
  v5 = +[NSString stringWithFormat:@"%@_SK%ld", v4, a3];

  return v5;
}

- (void)_lib_getBytes:(void *)a3 count:(unint64_t)a4
{
  __src[0] = 0;
  __src[1] = 0;
  [(NSUUID *)self getUUIDBytes:__src];
  if (a4 >= 0x11) {
    +[NSException raise:NSRangeException, @"%@: count %lu exceeds available length: %lu", self, a4, 16 format];
  }
  memcpy(a3, __src, a4);
}

@end