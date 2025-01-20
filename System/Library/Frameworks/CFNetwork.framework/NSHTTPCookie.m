@interface NSHTTPCookie
+ (NSArray)cookiesWithResponseHeaderFields:(NSDictionary *)headerFields forURL:(NSURL *)URL;
+ (NSDictionary)requestHeaderFieldsWithCookies:(NSArray *)cookies;
+ (NSHTTPCookie)cookieWithCFHTTPCookie:(OpaqueCFHTTPCookie *)a3;
+ (NSHTTPCookie)cookieWithProperties:(NSDictionary *)properties;
+ (__CFArray)_ns2cfCookies:(id)a3;
+ (id)_cf2nsCookies:(__CFArray *)a3;
+ (id)_cookieForSetCookieString:(id)a3 forURL:(id)a4 partition:(id)a5;
+ (id)_parsedCookiesWithResponseHeaderFields:(id)a3 forURL:(id)a4;
+ (uint64_t)_cookiesWithResponseHeaderFields:(const __CFURL *)a3 forURL:(int)a4 singleCookie:;
- (BOOL)_isExpired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHTTPOnly;
- (BOOL)isSecure;
- (BOOL)isSessionOnly;
- (HTTPCookie)_inner;
- (NSArray)portList;
- (NSDate)expiresDate;
- (NSDictionary)properties;
- (NSHTTPCookie)init;
- (NSHTTPCookie)initWithCFHTTPCookie:(OpaqueCFHTTPCookie *)a3;
- (NSHTTPCookie)initWithCoder:(id)a3;
- (NSHTTPCookie)initWithProperties:(NSDictionary *)properties;
- (NSHTTPCookieStringPolicy)sameSitePolicy;
- (NSString)comment;
- (NSString)domain;
- (NSString)name;
- (NSString)path;
- (NSString)value;
- (NSUInteger)version;
- (NSURL)commentURL;
- (id)Discard;
- (id)MaxAge;
- (id)OriginURL;
- (id)Port;
- (id)Secure;
- (id)Version;
- (id)_initWithCookie:(id)a3 partition:(id)a4;
- (id)_initWithHeader:(const CompactCookieHeader *)a3;
- (id)_initWithInternal:(id)a3;
- (id)_initWithProperties:(id)a3 fromString:(BOOL)a4;
- (id)_initWithReference:(const CompactCookieArray *)a3 index:(int64_t)a4;
- (id)_key;
- (id)_storagePartition;
- (id)description;
- (id)ensureCookieValid;
- (int64_t)_compareForHeaderOrder:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSHTTPCookie

- (BOOL)isHTTPOnly
{
  v2 = [(NSHTTPCookie *)self _inner];
  v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu) {
    return (v3[2] >> 2) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isSecure
{
  v2 = [(NSHTTPCookie *)self _inner];
  v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu) {
    return v3[2] & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (NSDate)expiresDate
{
  if ([(NSHTTPCookie *)self isSessionOnly]) {
    return 0;
  }
  BOOL v4 = [(NSHTTPCookie *)self _inner];
  uint64_t v5 = (*((uint64_t (**)(HTTPCookie *))v4->var0 + 2))(v4);
  if (*(_DWORD *)v5 >= 0xCu && (*(_DWORD *)(v5 + 8) & 2) != 0) {
    return 0;
  }
  double v6 = 0.0;
  if (*(_DWORD *)v5 >= 0x30u) {
    double v6 = floor(*(double *)(v5 + 40));
  }
  CFAllocatorRef v7 = CFGetAllocator(self);
  CFDateRef v8 = CFDateCreate(v7, v6);

  return (NSDate *)v8;
}

- (BOOL)isSessionOnly
{
  v2 = [(NSHTTPCookie *)self _inner];
  v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu) {
    return (v3[2] >> 1) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (HTTPCookie)_inner
{
  return (HTTPCookie *)[(NSHTTPCookieInternal *)self->_cookiePrivate _inner];
}

- (id)ensureCookieValid
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    if (!v2
      || ![v2 _inner]
      || (uint64_t v3 = [v1[1] _inner], !(*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3)))
    {

      return 0;
    }
  }
  return v1;
}

- (NSURL)commentURL
{
  uint64_t v3 = [(NSHTTPCookie *)self _inner];
  BOOL v4 = (unsigned int *)(*((uint64_t (**)(HTTPCookie *))v3->var0 + 2))(v3);
  if (*v4 >= 0x28 && (uint64_t v5 = v4[9], v5) && (v6 = *v4, v6 > v5))
  {
    CFAllocatorRef v7 = (char *)v4 + v5;
    CFDateRef v8 = (char *)v4 + v6;
    v9 = v7;
    while (*v9)
    {
      if (++v9 >= v8) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    CFAllocatorRef v7 = 0;
  }
  CFStringRef CookieString = createCookieString(self, v7);
  if (CookieString)
  {
    CFStringRef v11 = CookieString;
    CFAllocatorRef v12 = CFGetAllocator(self);
    CFURLRef v13 = CFURLCreateWithString(v12, v11, 0);
    CFRelease(v11);
  }
  else
  {
    CFURLRef v13 = 0;
  }

  return (NSURL *)v13;
}

- (NSString)comment
{
  uint64_t v3 = [(NSHTTPCookie *)self _inner];
  BOOL v4 = (unsigned int *)(*((uint64_t (**)(HTTPCookie *))v3->var0 + 2))(v3);
  if (*v4 >= 0x24 && (uint64_t v5 = v4[8], v5) && (v6 = *v4, v6 > v5))
  {
    CFAllocatorRef v7 = (char *)v4 + v5;
    CFDateRef v8 = (char *)v4 + v6;
    v9 = v7;
    while (*v9)
    {
      if (++v9 >= v8) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    CFAllocatorRef v7 = 0;
  }
  CFStringRef CookieString = (__CFString *)createCookieString(self, v7);

  return (NSString *)CookieString;
}

- (NSString)value
{
  v2 = (__CFString *)CFHTTPCookieCopyValue(self);

  return (NSString *)v2;
}

- (NSString)domain
{
  v2 = (__CFString *)CFHTTPCookieCopyDomain(self);

  return (NSString *)v2;
}

- (NSString)path
{
  v2 = (__CFString *)CFHTTPCookieCopyPath(self);

  return (NSString *)v2;
}

- (NSString)name
{
  v2 = (__CFString *)CFHTTPCookieCopyName(self);

  return (NSString *)v2;
}

- (NSHTTPCookie)initWithProperties:(NSDictionary *)properties
{
  id v4 = [[NSHTTPCookieInternal_Data alloc] _initWithProperties:properties fromString:0];
  id v5 = [(NSHTTPCookie *)self _initWithInternal:v4];

  return (NSHTTPCookie *)-[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
}

- (id)_initWithInternal:(id)a3
{
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NSHTTPCookie;
    id result = [(NSHTTPCookie *)&v6 init];
    if (result)
    {
      id v5 = result;
      *((void *)result + 1) = a3;
      return -[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
    }
  }
  else
  {

    return 0;
  }
  return result;
}

- (void)dealloc
{
  self->_cookiePrivate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookie;
  [(NSHTTPCookie *)&v3 dealloc];
}

+ (NSArray)cookiesWithResponseHeaderFields:(NSDictionary *)headerFields forURL:(NSURL *)URL
{
  return (NSArray *)+[NSHTTPCookie _cookiesWithResponseHeaderFields:forURL:singleCookie:]((uint64_t)NSHTTPCookie, (const __CFDictionary *)headerFields, (const __CFURL *)URL, 0);
}

+ (NSDictionary)requestHeaderFieldsWithCookies:(NSArray *)cookies
{
  objc_super v3 = +[NSHTTPCookie _ns2cfCookies:cookies];
  if (v3 && (id v4 = v3, v5 = CFHTTPCookieCopyRequestHeaderFields(0, v3), CFRelease(v4), v5))
  {
    return (NSDictionary *)v5;
  }
  else
  {
    CFAllocatorRef v7 = (void *)MEMORY[0x1E4F1C9E8];
    return (NSDictionary *)[v7 dictionary];
  }
}

+ (__CFArray)_ns2cfCookies:(id)a3
{
  if (a3) {
    return CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFArrayRef)a3);
  }
  else {
    return 0;
  }
}

+ (NSHTTPCookie)cookieWithProperties:(NSDictionary *)properties
{
  objc_super v3 = [[NSHTTPCookie alloc] initWithProperties:properties];

  return v3;
}

+ (uint64_t)_cookiesWithResponseHeaderFields:(const __CFURL *)a3 forURL:(int)a4 singleCookie:
{
  self;
  if (a2 && a3)
  {
    CFArrayRef v7 = a4
       ? _CFHTTPParsedCookiesWithResponseHeaderFields(0, a2, a3)
       : CFHTTPCookieCreateWithResponseHeaderFields(0, a2, a3);
    CFArrayRef v8 = v7;
    if (v7)
    {
      id v9 = +[NSHTTPCookie _cf2nsCookies:v7];
      CFRelease(v8);
      if (v9) {
        return (uint64_t)v9;
      }
    }
  }
  CFStringRef v11 = (void *)MEMORY[0x1E4F1C978];

  return [v11 array];
}

+ (id)_cf2nsCookies:(__CFArray *)a3
{
  if (!a3) {
    return 0;
  }
  CFArrayRef Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3);

  return Copy;
}

- (NSDictionary)properties
{
  id result = (NSDictionary *)self->_cookiePrivate;
  if (result)
  {
    uint64_t v3 = [(NSDictionary *)result _inner];
    id v4 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
    return (NSDictionary *)v4;
  }
  return result;
}

- (id)_initWithProperties:(id)a3 fromString:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)NSHTTPCookie;
  id result = [(NSHTTPCookie *)&v8 init];
  if (result)
  {
    id v7 = result;
    *((void *)result + 1) = [[NSHTTPCookieInternal_Data alloc] _initWithProperties:a3 fromString:v4];
    return -[NSHTTPCookie ensureCookieValid]((uint64_t)v7);
  }
  return result;
}

- (NSArray)portList
{
  CFArrayRef v2 = CFHTTPCookieCopyPortArray((OpaqueCFHTTPCookie *)self);

  return (NSArray *)v2;
}

- (NSHTTPCookie)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeObject];

  return [(NSHTTPCookie *)self initWithProperties:v4];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = [(NSHTTPCookie *)self properties];

  [a3 encodeObject:v4];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(NSHTTPCookie *)self path] hash];
  uint64_t v4 = (16 * v3) ^ (v3 >> 28);
  NSUInteger v5 = [(NSString *)[(NSHTTPCookie *)self name] hash];
  NSUInteger v6 = (16 * (v4 ^ v5)) ^ ((v4 ^ v5) >> 28) ^ [(NSString *)[(NSHTTPCookie *)self value] hash];
  return [(NSString *)[(NSHTTPCookie *)self domain] hash] ^ (v6 >> 28) ^ (16 * v6);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      cookiePrivate = self->_cookiePrivate;
      uint64_t v7 = *((void *)a3 + 1);
      LOBYTE(v5) = [(NSHTTPCookieInternal *)cookiePrivate isEqual:v7];
    }
  }
  return v5;
}

- (id)description
{
  NSUInteger v3 = (void *)[@"<NSHTTPCookie\n" mutableCopy];
  objc_msgSend(v3, "appendFormat:", @"\tversion:%ld\n", -[NSHTTPCookie version](self, "version"));
  [v3 appendFormat:@"\tname:%@\n", quoteMaybe(-[NSHTTPCookie name](self, "name"))];
  [v3 appendFormat:@"\tvalue:%@\n", quoteMaybe(-[NSHTTPCookie value](self, "value"))];
  [v3 appendFormat:@"\texpiresDate:%@\n", quoteMaybe(-[NSDate description](-[NSHTTPCookie expiresDate](self, "expiresDate"), "description"))];
  uint64_t v4 = [(NSHTTPCookie *)self _inner];
  uint64_t v5 = (*((uint64_t (**)(HTTPCookie *))v4->var0 + 2))(v4);
  if (*(_DWORD *)v5 >= 0x38u)
  {
    double v6 = floor(*(double *)(v5 + 48));
    if (v6 != 0.0)
    {
      CFDateRef v7 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6);
      [v3 appendFormat:@"\tcreated:%@\n", quoteMaybe((NSString *)-[__CFDate description](v7, "description"))];
      CFRelease(v7);
    }
  }
  if ([(NSHTTPCookie *)self isSessionOnly]) {
    objc_super v8 = @"TRUE";
  }
  else {
    objc_super v8 = @"FALSE";
  }
  [v3 appendFormat:@"\tsessionOnly:%@\n", v8];
  [v3 appendFormat:@"\tdomain:%@\n", quoteMaybe(-[NSHTTPCookie domain](self, "domain"))];
  id v9 = [(NSHTTPCookie *)self _storagePartition];
  if ([(NSString *)v9 length]) {
    v10 = (__CFString *)quoteMaybe(v9);
  }
  else {
    v10 = @"none";
  }
  [v3 appendFormat:@"\tpartition:%@\n", v10];
  CFStringRef v11 = [(NSHTTPCookie *)self sameSitePolicy];
  if ([(NSString *)v11 length]) {
    CFAllocatorRef v12 = (__CFString *)quoteMaybe(v11);
  }
  else {
    CFAllocatorRef v12 = @"none";
  }
  [v3 appendFormat:@"\tsameSite:%@\n", v12];
  [v3 appendFormat:@"\tpath:%@\n", quoteMaybe(-[NSHTTPCookie path](self, "path"))];
  if ([(NSHTTPCookie *)self isSecure]) {
    CFURLRef v13 = @"TRUE";
  }
  else {
    CFURLRef v13 = @"FALSE";
  }
  [v3 appendFormat:@"\tisSecure:%@\n", v13];
  if ([(NSHTTPCookie *)self isHTTPOnly]) {
    [v3 appendFormat:@"\tisHTTPOnly: %@\n", @"YES"];
  }
  [v3 appendFormat:@" path:\"%@\", -[NSHTTPCookie path](self, "path"")];
  if ([(NSHTTPCookie *)self isSecure]) {
    v14 = @"TRUE";
  }
  else {
    v14 = @"FALSE";
  }
  [v3 appendFormat:@" isSecure:%@", v14];
  if ([(NSHTTPCookie *)self isHTTPOnly]) {
    [v3 appendFormat:@" isHTTPOnly: %@", @"YES"];
  }
  v15 = [(NSHTTPCookie *)self comment];
  if ([(NSString *)v15 length]) {
    [v3 appendFormat:@"\tcomment:%@\n", quoteMaybe(v15)];
  }
  v16 = [(NSHTTPCookie *)self commentURL];
  if (v16)
  {
    v17 = v16;
    if (objc_msgSend((id)-[NSURL description](v16, "description"), "length")) {
      [v3 appendFormat:@"\tcommentURL:%@\n", quoteMaybe((NSString *)-[NSURL description](v17, "description"))];
    }
  }
  v18 = [(NSHTTPCookie *)self portList];
  if (v18)
  {
    v19 = v18;
    if ([(NSArray *)v18 count]) {
      [v3 appendFormat:@"\tports:{ %@ }\n", -[NSArray componentsJoinedByString:](v19, "componentsJoinedByString:", @","];
    }
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)_isExpired
{
  double ExpirationTime = CFHTTPCookieGetExpirationTime(self);
  return ExpirationTime != 0.0 && ExpirationTime <= CFAbsoluteTimeGetCurrent();
}

- (id)_key
{
  return (id)[NSString stringWithFormat:@"%@ %@%@", -[NSHTTPCookie name](self, "name"), -[NSHTTPCookie domain](self, "domain"), -[NSHTTPCookie path](self, "path")];
}

- (int64_t)_compareForHeaderOrder:(id)a3
{
  NSUInteger v5 = [(NSString *)[(NSHTTPCookie *)self path] length];
  unint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "path"), "length");
  if (v5 > v6) {
    return -1;
  }
  if (v5 < v6) {
    return 1;
  }
  objc_super v8 = [(NSHTTPCookie *)self _inner];
  uint64_t v9 = (*((uint64_t (**)(HTTPCookie *))v8->var0 + 2))(v8);
  double v10 = 0.0;
  double v11 = 0.0;
  if (*(_DWORD *)v9 >= 0x38u) {
    double v11 = floor(*(double *)(v9 + 48));
  }
  uint64_t v12 = [a3 _inner];
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 16))(v12);
  if (*(_DWORD *)v13 >= 0x38u) {
    double v10 = floor(*(double *)(v13 + 48));
  }
  if (v11 - v10 < 0.0) {
    return -1;
  }
  if (v11 - v10 > 0.0) {
    return 1;
  }
  int64_t result = -[NSString compare:](-[NSHTTPCookie domain](self, "domain", v11 - v10), "compare:", [a3 domain]);
  if (!result)
  {
    v14 = [(NSHTTPCookie *)self name];
    uint64_t v15 = [a3 name];
    return [(NSString *)v14 compare:v15];
  }
  return result;
}

- (id)MaxAge
{
  if ([(NSHTTPCookie *)self isSessionOnly]) {
    return @"0";
  }
  double ExpirationTime = CFHTTPCookieGetExpirationTime(self);
  double Current = CFAbsoluteTimeGetCurrent();
  if (ExpirationTime <= Current) {
    return @"0";
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%f", ExpirationTime - Current);
  }
}

- (id)Port
{
  CFArrayRef v2 = [(NSHTTPCookie *)self portList];

  return [(NSArray *)v2 componentsJoinedByString:@","];
}

- (id)Discard
{
  if ([(NSHTTPCookie *)self isSessionOnly]) {
    return @"TRUE";
  }
  else {
    return @"FALSE";
  }
}

- (id)Secure
{
  if ([(NSHTTPCookie *)self isSecure]) {
    return @"TRUE";
  }
  else {
    return @"FALSE";
  }
}

- (id)Version
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NSHTTPCookie version](self, "version"));
}

- (id)OriginURL
{
  if ([(NSHTTPCookie *)self isSecure]) {
    NSUInteger v3 = @"https://";
  }
  else {
    NSUInteger v3 = @"http://";
  }
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = [(__CFString *)v3 stringByAppendingString:[(NSHTTPCookie *)self domain]];

  return (id)[v4 URLWithString:v5];
}

- (NSHTTPCookieStringPolicy)sameSitePolicy
{
  if (!self->_cookiePrivate) {
    return 0;
  }
  CFArrayRef v2 = [(NSHTTPCookie *)self _inner];
  NSUInteger v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 0xCu) {
    char v4 = v3[2] & 0x7F;
  }
  else {
    char v4 = 0;
  }
  if ((v4 & 0x10) != 0) {
    int v5 = 3;
  }
  else {
    int v5 = 1;
  }
  if ((v4 & 8) != 0) {
    int v6 = v5;
  }
  else {
    int v6 = ((v4 & 0x10) >> 3) ^ 2;
  }
  if (v6 == 3)
  {
    CFDateRef v7 = &_kCFHTTPCookieSameSiteStrict;
    return (NSHTTPCookieStringPolicy)*v7;
  }
  if (v6 != 1) {
    return 0;
  }
  CFDateRef v7 = &_kCFHTTPCookieSameSiteLax;
  return (NSHTTPCookieStringPolicy)*v7;
}

- (id)_storagePartition
{
  if (!self->_cookiePrivate) {
    return 0;
  }
  CFArrayRef v2 = [(NSHTTPCookie *)self _inner];
  NSUInteger v3 = (CompactCookieHeader *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  EnumeratedString = CompactCookieHeader::getEnumeratedString(v3, 15, 0);
  if (!EnumeratedString) {
    return 0;
  }
  int v5 = EnumeratedString;
  int v6 = NSString;

  return (id)[v6 stringWithUTF8String:v5];
}

- (NSUInteger)version
{
  CFArrayRef v2 = [(NSHTTPCookie *)self _inner];
  NSUInteger v3 = (_DWORD *)(*((uint64_t (**)(HTTPCookie *))v2->var0 + 2))(v2);
  if (*v3 >= 8u) {
    return v3[1];
  }
  else {
    return 0;
  }
}

- (NSHTTPCookie)init
{
  return 0;
}

- (NSHTTPCookie)initWithCFHTTPCookie:(OpaqueCFHTTPCookie *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookie;
  int64_t result = [(NSHTTPCookie *)&v6 init];
  if (result)
  {
    int v5 = result;
    result->_cookiePrivate = (NSHTTPCookieInternal *)*((id *)a3 + 1);
    return (NSHTTPCookie *)-[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
  }
  return result;
}

- (id)_initWithReference:(const CompactCookieArray *)a3 index:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NSHTTPCookie;
  id result = [(NSHTTPCookie *)&v8 init];
  if (result)
  {
    id v7 = result;
    *((void *)result + 1) = [[NSHTTPCookieInternal_Ref alloc] _initWithReference:a3 index:a4];
    return -[NSHTTPCookie ensureCookieValid]((uint64_t)v7);
  }
  return result;
}

- (id)_initWithCookie:(id)a3 partition:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NSHTTPCookie;
  id result = [(NSHTTPCookie *)&v8 init];
  if (result)
  {
    id v7 = result;
    *((void *)result + 1) = [[NSHTTPCookieInternal_Data alloc] _initWithCookie:a3 partition:a4];
    return -[NSHTTPCookie ensureCookieValid]((uint64_t)v7);
  }
  return result;
}

- (id)_initWithHeader:(const CompactCookieHeader *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSHTTPCookie;
  id result = [(NSHTTPCookie *)&v6 init];
  if (result)
  {
    id v5 = result;
    *((void *)result + 1) = [[NSHTTPCookieInternal_Data alloc] _initWithHeader:a3];
    return -[NSHTTPCookie ensureCookieValid]((uint64_t)v5);
  }
  return result;
}

+ (id)_cookieForSetCookieString:(id)a3 forURL:(id)a4 partition:(id)a5
{
  id v5 = (void *)_CFHTTPCookieCreateWithStringAndPartition((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)a3, (const __CFURL *)a4, (uint64_t)a5);

  return v5;
}

+ (id)_parsedCookiesWithResponseHeaderFields:(id)a3 forURL:(id)a4
{
  return (id)+[NSHTTPCookie _cookiesWithResponseHeaderFields:forURL:singleCookie:]((uint64_t)NSHTTPCookie, (const __CFDictionary *)a3, (const __CFURL *)a4, 1);
}

+ (NSHTTPCookie)cookieWithCFHTTPCookie:(OpaqueCFHTTPCookie *)a3
{
  return (NSHTTPCookie *)a3;
}

@end