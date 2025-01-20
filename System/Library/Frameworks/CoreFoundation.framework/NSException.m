@interface NSException
+ (BOOL)supportsSecureCoding;
+ (NSException)exceptionWithName:(NSExceptionName)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo;
+ (NSException)exceptionWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7;
+ (void)raise:(NSExceptionName)name format:(NSString *)format;
+ (void)raise:(NSExceptionName)name format:(NSString *)format arguments:(va_list)argList;
- (BOOL)_installStackTraceKeyIfNeeded;
- (BOOL)_isUnarchived;
- (BOOL)isEqual:(id)a3;
- (NSArray)callStackReturnAddresses;
- (NSArray)callStackSymbols;
- (NSDictionary)userInfo;
- (NSException)init;
- (NSException)initWithCoder:(id)a3;
- (NSException)initWithName:(NSExceptionName)aName reason:(NSString *)aReason userInfo:(NSDictionary *)aUserInfo;
- (NSException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7;
- (NSExceptionName)name;
- (NSString)reason;
- (id)description;
- (unint64_t)hash;
- (void)_markAsUnarchived;
- (void)dealloc;
- (void)raise;
@end

@implementation NSException

- (NSDictionary)userInfo
{
  v2 = self->userInfo;

  return v2;
}

+ (NSException)exceptionWithName:(NSExceptionName)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo
{
  v5 = (void *)[objc_alloc((Class)a1) initWithName:name reason:reason userInfo:userInfo];

  return (NSException *)v5;
}

- (NSException)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7
{
  v19[1] = *(void *)off_1ECE0A5B0;
  self->name = (NSString *)[a3 copy];
  self->CFStringRef reason = (NSString *)[a4 copy];
  self->userInfo = (NSDictionary *)a5;
  v12 = (char *)v19 - ((_os_log_pack_size() + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6) {
    goto LABEL_4;
  }
  if (_NSIsNSCFConstantString((uint64_t)self->reason))
  {
    CFStringRef reason = (const __CFString *)self->reason;
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    CStringPtr = CFStringGetCStringPtr(reason, SystemEncoding);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315138;
    *(void *)(v16 + 4) = CStringPtr;
    a6 = v12;
LABEL_4:
    __CFLookUpClass("NSMutableDictionary");
    self->reserved = (id)objc_opt_new();
    CFDataRef v17 = CFDataCreate((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const UInt8 *)a6, a7);
    [self->reserved setObject:v17 forKey:@"osLogPack"];
  }
  return self;
}

- (NSException)initWithName:(NSExceptionName)aName reason:(NSString *)aReason userInfo:(NSDictionary *)aUserInfo
{
  return [(NSException *)self initWithName:aName reason:aReason userInfo:aUserInfo osLogPack:0 size:0];
}

- (NSArray)callStackSymbols
{
  return (NSArray *)[self->reserved objectForKey:@"callStackSymbols"];
}

- (id)description
{
  id result = self->reason;
  if (!result) {
    return self->name;
  }
  return result;
}

- (void)raise
{
}

- (BOOL)_isUnarchived
{
  return [self->reserved objectForKey:@"_NSExceptionWasUnarchived"] != 0;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)NSException;
  [(NSException *)&v3 dealloc];
}

- (NSString)reason
{
  v2 = self->reason;

  return v2;
}

- (NSExceptionName)name
{
  v2 = self->name;

  return v2;
}

- (NSArray)callStackReturnAddresses
{
  return (NSArray *)[self->reserved objectForKey:@"callStackReturnAddresses"];
}

- (void)_markAsUnarchived
{
  if (!self->reserved)
  {
    __CFLookUpClass("NSMutableDictionary");
    objc_super v3 = objc_opt_new();
    self->reserved = v3;
    [v3 setObject:@"SENTINEL" forKey:@"_NSExceptionWasUnarchived"];
  }
}

- (BOOL)_installStackTraceKeyIfNeeded
{
  userInfo = self->userInfo;
  if (!userInfo) {
    goto LABEL_6;
  }
  if ([(NSDictionary *)userInfo objectForKey:@"NSStackTraceKey"])
  {
    LOBYTE(v4) = 0;
    return v4;
  }
  v5 = self->userInfo;
  if (v5)
  {
    v6 = (NSDictionary *)[(NSDictionary *)v5 mutableCopy];
  }
  else
  {
LABEL_6:
    __CFLookUpClass("NSMutableDictionary");
    v6 = (NSDictionary *)objc_opt_new();
  }
  self->userInfo = v6;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(self->reserved, "objectForKey:", @"callStackReturnAddresses"), "description");
  if (v4)
  {
    [(NSDictionary *)self->userInfo setObject:v4 forKey:@"NSStackTraceKey"];
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  name = self->name;
  uint64_t v8 = *((void *)a3 + 1);

  return [(NSString *)name isEqual:v8];
}

- (unint64_t)hash
{
  return [(NSString *)self->name hash];
}

- (NSException)init
{
  return 0;
}

+ (NSException)exceptionWithName:(id)a3 reason:(id)a4 userInfo:(id)a5 osLogPack:(void *)a6 size:(unint64_t)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initWithName:a3 reason:a4 userInfo:a5 osLogPack:a6 size:a7];

  return (NSException *)v7;
}

+ (void)raise:(NSExceptionName)name format:(NSString *)format arguments:(va_list)argList
{
  if (format) {
    CFStringRef v7 = (id)CFStringCreateWithFormatAndArguments((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, (CFStringRef)format, argList);
  }
  else {
    CFStringRef v7 = &stru_1ECE10768;
  }
  objc_exception_throw((id)[a1 exceptionWithName:name reason:v7 userInfo:0]);
}

+ (void)raise:(NSExceptionName)name format:(NSString *)format
{
  va_start(va, format);
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if (format)
  {
    va_copy(v7, va);
    CFStringRef v6 = (id)CFStringCreateWithFormatAndArguments((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, (CFStringRef)format, va);
  }
  else
  {
    CFStringRef v6 = &stru_1ECE10768;
  }
  objc_exception_throw((id)objc_msgSend(a1, "exceptionWithName:reason:userInfo:", name, v6, 0, v7, v8));
}

- (NSException)initWithCoder:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end