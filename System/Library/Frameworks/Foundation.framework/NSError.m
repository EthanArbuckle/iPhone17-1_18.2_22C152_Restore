@interface NSError
+ (BOOL)supportsSecureCoding;
+ (NSError)errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict;
+ (id)_cocoaErrorWithCode:(int64_t)a3 path:(id)a4 url:(id)a5 underlying:(id)a6 variant:(id)a7 source:(id)a8 destination:(id)a9;
+ (id)_readCorruptErrorWithFormat:(id)a3;
+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 URL:(id)a5;
+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5;
+ (void)_registerBuiltInFormatters;
+ (void)_registerFormatter:(void *)a3 forErrorKey:(id)a4 parameters:(const char *)a5;
+ (void)_setFileNameLocalizationEnabled:(BOOL)a3;
+ (void)_web_addErrorsWithCodesAndDescriptions:(id)a3 inDomain:(id)a4;
+ (void)setUserInfoValueProviderForDomain:(NSErrorDomain)errorDomain provider:(void *)provider;
+ (void)userInfoValueProviderForDomain:(NSErrorDomain)errorDomain;
- (BOOL)_web_errorIsInDomain:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)localizedRecoveryOptions;
- (NSArray)underlyingErrors;
- (NSDictionary)userInfo;
- (NSError)init;
- (NSError)initWithCoder:(id)a3;
- (NSError)initWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict;
- (NSErrorDomain)domain;
- (NSInteger)code;
- (NSString)helpAnchor;
- (NSString)localizedDescription;
- (NSString)localizedFailureReason;
- (NSString)localizedRecoverySuggestion;
- (__CFString)_retainedUserInfoCallBackForKey:(id)a3;
- (id)_cocoaErrorString:(id)a3;
- (id)_cocoaErrorString:(id)a3 fromBundle:(id)a4 tableName:(id)a5;
- (id)_cocoaErrorStringWithKind:(id)a3;
- (id)_cocoaErrorStringWithKind:(id)a3 variant:(id)a4;
- (id)_formatCocoaErrorString:(id)a3 parameters:(const char *)a4 applicableFormatters:(id *)a5 count:(int64_t)a6;
- (id)_web_failingURL;
- (id)_web_initWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5;
- (id)_web_initWithDomain_nowarn:(id)a3 code:(int64_t)a4 URL:(id)a5;
- (id)_web_localizedDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)recoveryAttempter;
- (id)redactedDescription;
- (id)replacementObjectForPortCoder:(id)a3;
- (int64_t)_collectApplicableUserInfoFormatters:(id *)a3 max:(int64_t)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSError

- (id)redactedDescription
{
  RedactedDescription = (void *)_CFErrorCreateRedactedDescription();

  return RedactedDescription;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__CFString)_retainedUserInfoCallBackForKey:(id)a3
{
  _CFAutoreleasePoolPush();
  if ([a3 isEqual:@"NSLocalizedDescription"])
  {
    v5 = [(NSError *)self _cocoaErrorStringWithKind:0];
    if (v5)
    {
LABEL_9:
      CFRetain(v5);
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  if ([a3 isEqual:@"NSLocalizedFailureReason"])
  {
LABEL_5:
    v6 = @"C";
    goto LABEL_8;
  }
  if (![a3 isEqual:@"NSLocalizedRecoverySuggestion"])
  {
    v5 = 0;
    goto LABEL_10;
  }
  v6 = @"R";
LABEL_8:
  v5 = [(NSError *)self _cocoaErrorStringWithKind:v6];
  if (v5) {
    goto LABEL_9;
  }
LABEL_10:
  _CFAutoreleasePoolPop();
  return v5;
}

- (id)_cocoaErrorStringWithKind:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSUserStringVariant"];
  if (!v5) {
    return [(NSError *)self _cocoaErrorStringWithKind:a3 variant:0];
  }
  v6 = v5;
  if (_NSIsNSString() && [v6 containsString:@","]) {
    v6 = _variantPermutations((void *)[v6 componentsSeparatedByString:@","]);
  }
  if (!_NSIsNSArray())
  {
    id result = [(NSError *)self _cocoaErrorStringWithKind:a3 variant:v6];
    if (result) {
      return result;
    }
    return [(NSError *)self _cocoaErrorStringWithKind:a3 variant:0];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (!v7) {
    return [(NSError *)self _cocoaErrorStringWithKind:a3 variant:0];
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v14;
LABEL_8:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(v6);
    }
    id result = [(NSError *)self _cocoaErrorStringWithKind:a3 variant:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
    if (result) {
      return result;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v8) {
        goto LABEL_8;
      }
      return [(NSError *)self _cocoaErrorStringWithKind:a3 variant:0];
    }
  }
}

- (id)_cocoaErrorStringWithKind:(id)a3 variant:(id)a4
{
  uint64_t v7 = [(NSString *)[NSMutableString alloc] initWithFormat:@"Err%ld", [(NSError *)self code]];
  uint64_t v8 = v7;
  if (a3) {
    [(NSMutableString *)v7 appendFormat:@"-%@", a3];
  }
  if (a4) {
    [(NSMutableString *)v8 appendFormat:@"(%@)", a4];
  }
  id v9 = [(NSError *)self _cocoaErrorString:v8];

  return v9;
}

+ (id)_cocoaErrorWithCode:(int64_t)a3 path:(id)a4 url:(id)a5 underlying:(id)a6 variant:(id)a7 source:(id)a8 destination:(id)a9
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = v15;
  if (a4) {
    [v15 setObject:a4 forKeyedSubscript:@"NSFilePath"];
  }
  if (a5) {
    [v16 setObject:a5 forKeyedSubscript:@"NSURL"];
  }
  if (a6) {
    [v16 setObject:a6 forKeyedSubscript:@"NSUnderlyingError"];
  }
  if (a7)
  {
    v19[0] = a7;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 1), @"NSUserStringVariant");
  }
  if (a8) {
    [v16 setObject:a8 forKeyedSubscript:@"NSSourceFilePathErrorKey"];
  }
  if (a9) {
    [v16 setObject:a9 forKeyedSubscript:@"NSDestinationFilePath"];
  }
  uint64_t v17 = [[NSError alloc] initWithDomain:@"NSCocoaErrorDomain" code:a3 userInfo:v16];

  return v17;
}

+ (NSError)errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict
{
  id v5 = (void *)[objc_alloc((Class)a1) initWithDomain:domain code:code userInfo:dict];

  return (NSError *)v5;
}

- (NSError)initWithDomain:(NSErrorDomain)domain code:(NSInteger)code userInfo:(NSDictionary *)dict
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!domain)
  {
    uint64_t v17 = objc_opt_class();
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Invalid domain=nil in -[%@ %s]", v17, sel_getName(a2));

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0]);
  }
  v19.receiver = self;
  v19.super_class = (Class)NSError;
  id v9 = [(NSError *)&v19 init];
  if (v9)
  {
    uint64_t v10 = [(NSString *)domain copy];
    v9->_code = code;
    v9->_domain = (NSString *)v10;
    uint64_t v11 = _CFErrorCreateCallStackReturnAddresses();
    if (v11)
    {
      v12 = (const void *)v11;
      if (dict) {
        long long v13 = (NSDictionary *)[(NSDictionary *)dict mutableCopy];
      }
      else {
        long long v13 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      }
      long long v14 = v13;
      if (v13)
      {
        [(NSDictionary *)v13 setObject:v12 forKeyedSubscript:@"NSCallStackReturnAddresses"];
        dict = v14;
      }
      CFRelease(v12);
    }
    else
    {
      long long v14 = 0;
    }
    v9->_userInfo = (NSDictionary *)[(NSDictionary *)dict copy];
  }
  return v9;
}

- (id)_cocoaErrorString:(id)a3
{
  uint64_t v5 = [(NSError *)self code];
  if (v5 >= 0x10000
    || (id result = [(NSError *)self _cocoaErrorString:a3 fromBundle:_NSFoundationBundle() tableName:@"FoundationErrors"]) == 0)
  {
    if ((v5 & 0xFFFFFFFFFFFF0000) != 0x20000 && (unint64_t)(v5 - 1024) > 0x3FE) {
      return 0;
    }
    id result = [(NSError *)self _cocoaErrorString:a3 fromBundle:+[NSBundle bundleWithIdentifier:@"com.apple.CoreData"] tableName:@"CoreDataErrors"];
    if (!result) {
      return 0;
    }
  }
  return result;
}

- (NSString)localizedDescription
{
  id v3 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSLocalizedDescription"];
  if (v3)
  {
    LocalizedDescription = (void *)[v3 copy];
  }
  else
  {
    LocalizedDescription = (void *)_CFErrorCreateLocalizedDescription();
    if (!LocalizedDescription) {
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)_NSFoundationBundle() localizedStringForKey:@"The operation couldn\\U2019t be completed. (%1$@ error %2$ld.)" value:&stru_1ECA5C228 table:@"FoundationErrors"], -[NSError domain](self, "domain"), -[NSError code](self, "code"));
    }
  }

  return (NSString *)LocalizedDescription;
}

- (void)encodeWithCoder:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSError *)self userInfo];
  v8[0] = v5;
  if (![(NSDictionary *)v5 count])
  {
    uint64_t v5 = 0;
    v8[0] = 0;
  }
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSError code](self, "code"), @"NSCode");
    objc_msgSend(a3, "encodeObject:forKey:", -[NSError domain](self, "domain"), @"NSDomain");
    [a3 encodeObject:v5 forKey:@"NSUserInfo"];
  }
  else
  {
    int v7 = [(NSError *)self code];
    v6 = [(NSError *)self domain];
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "i@@", &v7, &v6, v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(NSError *)self userInfo];
  if (![(NSDictionary *)v5 count]) {
    uint64_t v5 = 0;
  }
  v6 = (__objc2_class *)objc_opt_class();
  if (v6 == NSCFError)
  {
    id v9 = +[NSError allocWithZone:a3];
    uint64_t v10 = [(NSError *)self domain];
    NSInteger v11 = [(NSError *)self code];
    return [(NSError *)v9 initWithDomain:v10 code:v11 userInfo:v5];
  }
  else
  {
    int v7 = [(__objc2_class *)v6 allocWithZone:a3];
    v7->vtable = (void *)[(NSString *)[(NSError *)self domain] copy];
    v7->cache = (void *)[(NSError *)self code];
    v7->info = (__objc2_class_ro *)[(NSDictionary *)v5 copy];
    return v7;
  }
}

- (NSDictionary)userInfo
{
  if (self->_userInfo) {
    return self->_userInfo;
  }
  if (!_CFExecutableLinkedOnOrAfter()) {
    return 0;
  }
  v4 = (void *)MEMORY[0x1E4F1C9E8];

  return (NSDictionary *)[v4 dictionary];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)[(NSError *)self domain] hash];
  return [(NSError *)self code] + v3;
}

- (NSInteger)code
{
  return self->_code;
}

- (id)_cocoaErrorString:(id)a3 fromBundle:(id)a4 tableName:(id)a5
{
  id v37 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  if (!a4) {
    return 0;
  }
  v6 = self;
  memset(v39, 0, sizeof(v39));
  uint64_t v7 = [(NSError *)self _collectApplicableUserInfoFormatters:v39 max:12];
  if (v7)
  {
    uint64_t v33 = v7;
    unsigned int v8 = 0;
    if (v7 >= 1)
    {
      id v9 = (uint64_t *)v39;
      uint64_t v10 = v7;
      do
      {
        uint64_t v11 = *v9++;
        v8 |= *(_DWORD *)(v11 + 16);
        --v10;
      }
      while (v10);
    }
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      if ((v8 >> v12)) {
        v38[v13++] = v12 + 97;
      }
      if (v12 > 0x18) {
        break;
      }
      ++v12;
    }
    while (v13 < 6);
    v34 = v6;
    v32[1] = v32;
    uint64_t v14 = 1 << v13;
    id v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    *id v15 = 0;
    if (1 << v13 >= 2)
    {
      uint64_t v16 = 1;
      do
      {
        if (v16 < 2 * v16)
        {
          uint64_t v17 = 0;
          do
          {
            v15[v16 + v17] = v15[v17] + 1;
            ++v17;
          }
          while (v16 != v17);
          v16 *= 2;
        }
      }
      while (v16 < v14);
    }
    if (v13 >= 1)
    {
      if (v14 <= 1) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = 1 << v13;
      }
      unint64_t v35 = (v13 + 16) & 0xFFFFFFFFFFFFFFF0;
      uint64_t v19 = v13;
      do
      {
        if (v13 != 31)
        {
          for (unint64_t i = 0; i != v18; ++i)
          {
            if (v19 == v15[i])
            {
              v21 = (char *)v32 - v35;
              v22 = (char *)v32 - v35;
              if (i)
              {
                v23 = v38;
                unint64_t v24 = i;
                v22 = (char *)v32 - v35;
                do
                {
                  if (v24) {
                    *v22++ = *v23;
                  }
                  ++v23;
                  BOOL v25 = v24 > 1;
                  v24 >>= 1;
                }
                while (v25);
              }
              unsigned char *v22 = 0;
              id v26 = a3;
              v27 = +[NSString stringWithFormat:@"%@.%s", a3, v21];
              v28 = (void *)[v36 localizedStringForKey:v27 value:0 table:v37];
              if (v28)
              {
                v29 = v28;
                if (([v28 isEqual:v27] & 1) == 0)
                {
                  id result = [(NSError *)v34 _formatCocoaErrorString:v29 parameters:v21 applicableFormatters:v39 count:v33];
                  if (result) {
                    return result;
                  }
                }
              }
              a3 = v26;
            }
          }
        }
        BOOL v25 = v19-- < 2;
      }
      while (!v25);
    }
    v6 = v34;
  }
  id result = (id)[v36 localizedStringForKey:a3 value:0 table:v37];
  if (result)
  {
    id v31 = result;
    if ([result isEqual:a3]) {
      return 0;
    }
    return [(NSError *)v6 _formatCocoaErrorString:v31 parameters:0 applicableFormatters:0 count:0];
  }
  return result;
}

- (id)_formatCocoaErrorString:(id)a3 parameters:(const char *)a4 applicableFormatters:(id *)a5 count:(int64_t)a6
{
  id v6 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      int64_t v10 = strlen(a4);
      if (v10 >= 1)
      {
        int64_t v11 = v10;
        id v21 = v6;
        v22 = a4;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v24 = 0u;
        unint64_t v12 = [(NSError *)self userInfo];
        uint64_t v13 = 0;
        while (1)
        {
          if (a6 >= 1)
          {
            uint64_t v14 = a5;
            uint64_t v15 = v22[v13];
            int v16 = 1 << (v22[v13] - 97);
            int64_t v17 = a6;
            do
            {
              if ((*((_DWORD *)*v14 + 4) & v16) != 0)
              {
                uint64_t v18 = [(NSDictionary *)v12 objectForKey:*((void *)*v14 + 1)];
                if (v18)
                {
                  uint64_t v19 = (*(uint64_t (**)(uint64_t, NSError *, uint64_t))*v14)(v18, self, v15);
                  if (v19) {
                    *((void *)&v24 + v13) = v19;
                  }
                }
              }
              ++v14;
              --v17;
            }
            while (v17);
          }
          if (!*((void *)&v24 + v13)) {
            break;
          }
          if (++v13 == v11) {
            return +[NSString stringWithValidatedFormat:v21, @"%@%@%@%@%@%@", 0, v24, v25, v26 validFormatSpecifiers error];
          }
        }
        return 0;
      }
    }
  }
  return v6;
}

+ (void)_registerFormatter:(void *)a3 forErrorKey:(id)a4 parameters:(const char *)a5
{
  if (!qword_1EB1EC770)
  {
    unsigned int v8 = NSCreateMapTableWithZone((NSMapTableKeyCallBacks *)&NSObjectMapKeyCallBacks, (NSMapTableValueCallBacks *)&NSOwnedPointerMapValueCallBacks, (NSUInteger)a3, (NSZone *)a4);
    uint64_t v9 = 0;
    atomic_compare_exchange_strong(&qword_1EB1EC770, (unint64_t *)&v9, (unint64_t)v8);
    if (v9) {
      NSFreeMapTable(v8);
    }
  }
  int64_t v10 = malloc_type_malloc(0x18uLL, 0x1080040622C3295uLL);
  *int64_t v10 = a3;
  v10[1] = [a4 copy];
  *((_DWORD *)v10 + 4) = 0;
  char v11 = *a5;
  if (*a5)
  {
    int v12 = 0;
    uint64_t v13 = a5 + 1;
    do
    {
      v12 |= 1 << (v11 - 97);
      *((_DWORD *)v10 + 4) = v12;
      int v14 = *(unsigned __int8 *)v13++;
      char v11 = v14;
    }
    while (v14);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_3);
  if (NSMapGet((NSMapTable *)qword_1EB1EC770, a4)) {
    free(v10);
  }
  else {
    NSMapInsert((NSMapTable *)qword_1EB1EC770, a4, v10);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_3);
}

uint64_t __53__NSError_NSErrorPrivate___registerBuiltInFormatters__block_invoke()
{
  +[NSError _registerFormatter:pathComponentFromPath forErrorKey:@"NSDestinationFilePath" parameters:"p"];
  +[NSError _registerFormatter:pathComponentFromPath forErrorKey:@"NSFilePath" parameters:"dfv"];
  +[NSError _registerFormatter:pathComponentFromURL forErrorKey:@"NSURL" parameters:"dfuv"];
  +[NSError _registerFormatter:encodingName forErrorKey:@"NSStringEncoding" parameters:"e"];
  +[NSError _registerFormatter:validationValue forErrorKey:@"NSInvalidValue" parameters:"a"];
  +[NSError _registerFormatter:validationValue forErrorKey:@"NSMinimumValidValue" parameters:"n"];

  return +[NSError _registerFormatter:validationValue forErrorKey:@"NSMaximumValidValue" parameters:"x"];
}

- (int64_t)_collectApplicableUserInfoFormatters:(id *)a3 max:(int64_t)a4
{
  +[NSError _registerBuiltInFormatters];
  if (qword_1EB1EC770)
  {
    uint64_t v7 = [(NSDictionary *)[(NSError *)self userInfo] keyEnumerator];
    uint64_t v8 = [(NSEnumerator *)v7 nextObject];
    if (v8)
    {
      id v9 = (id)v8;
      int64_t v10 = 0;
      while (1)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_3);
        char v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)NSMapGet((NSMapTable *)qword_1EB1EC770, v9);
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_3);
        if (v11)
        {
          if (v10 == a4) {
            return -1;
          }
          a3[v10++] = v11;
        }
        id v9 = [(NSEnumerator *)v7 nextObject];
        if (!v9) {
          return v10;
        }
      }
    }
  }
  return 0;
}

+ (void)_registerBuiltInFormatters
{
  if (_registerBuiltInFormatters_builtInsRegistered != -1) {
    dispatch_once(&_registerBuiltInFormatters_builtInsRegistered, &__block_literal_global_8);
  }
}

- (NSError)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)NSError;
  uint64_t v5 = [(NSError *)&v17 init];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "allowedClasses"), "setByAddingObjectsFromSet:", __NSPropertyListClasses_ForArchival_ErrorAndException());
  if (![a3 allowsKeyedCoding])
  {
    int v16 = 0;
    p_userInfo = (void **)&v5->_userInfo;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "i@@", &v16, &v5->_domain, &v5->_userInfo);
    v5->_code = v16;
    if (!v5->_userInfo) {
      return v5;
    }
    if (_NSIsNSDictionary())
    {
      userInfo = *p_userInfo;
      if (!*p_userInfo) {
        return v5;
      }
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  if (([a3 containsValueForKey:@"NSCode"] & 1) == 0)
  {
    int v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    char v11 = @"%@: missing error code";
LABEL_19:
    id v10 = +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v11, v14, v15);
    goto LABEL_20;
  }
  v5->_code = [a3 decodeIntegerForKey:@"NSCode"];
  if ([a3 error]) {
    goto LABEL_5;
  }
  v5->_domain = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSDomain"];
  if ([a3 error]) {
    goto LABEL_5;
  }
  if (!v5->_domain)
  {
    int v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    char v11 = @"%@: missing domain string";
    goto LABEL_19;
  }
  v5->_userInfo = (NSDictionary *)(id)[a3 decodeObjectOfClasses:v6 forKey:@"NSUserInfo"];
  if ([a3 error])
  {
LABEL_5:

    return 0;
  }
  if (!v5->_userInfo) {
    return v5;
  }
  if ((_NSIsNSDictionary() & 1) == 0)
  {
LABEL_18:
    int v14 = _NSMethodExceptionProem((objc_class *)v5, a2);
    char v11 = @"%@: userInfo dictionary found in archive was not a dictionary";
    goto LABEL_19;
  }
  userInfo = v5->_userInfo;
  if (!userInfo) {
    return v5;
  }
LABEL_9:
  id v9 = _validateKnownUserInfoKeyTypes(userInfo);
  if (v9)
  {
    id v10 = +[NSError _readCorruptErrorWithFormat:@"%@: userInfo dictionary found in archive contained an invalid value type for key %@", _NSMethodExceptionProem((objc_class *)v5, a2), v9];
LABEL_20:
    id v12 = v10;

    [a3 failWithError:v12];
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSError;
  [(NSError *)&v3 dealloc];
}

+ (id)_readCorruptErrorWithFormat:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [[NSString alloc] initWithFormat:a3 arguments:&v9];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v7 = @"NSDebugDescription";
    v8[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return +[NSError errorWithDomain:@"NSCocoaErrorDomain", 4864, v5, &v9 code userInfo];
}

+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 URL:(id)a5
{
  uint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "_web_initWithDomain_nowarn:code:URL:", a3, a4, a5);

  return v5;
}

- (id)_web_initWithDomain_nowarn:(id)a3 code:(int64_t)a4 URL:(id)a5
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = v9;
  if (a5)
  {
    [v9 setObject:a5 forKey:@"NSErrorFailingURLKey"];
    objc_msgSend(v10, "setObject:forKey:", objc_msgSend(a5, "absoluteString"), @"NSErrorFailingURLStringKey");
  }
  [a5 host];
  id v11 = localizedDescriptionForError(a3, a4);
  if (v11) {
    [v10 setObject:v11 forKey:@"NSLocalizedDescription"];
  }
  if ([a3 isEqualToString:@"NSURLErrorDomain"])
  {
    uint64_t LocalizedFailureReason = _CFNetworkErrorGetLocalizedFailureReason();
    if (LocalizedFailureReason) {
      [v10 setObject:LocalizedFailureReason forKey:@"NSLocalizedFailureReason"];
    }
  }
  if ([a3 isEqualToString:@"NSURLErrorDomain"])
  {
    uint64_t LocalizedRecoverySuggestion = _CFNetworkErrorGetLocalizedRecoverySuggestion();
    if (LocalizedRecoverySuggestion) {
      [v10 setObject:LocalizedRecoverySuggestion forKey:@"NSLocalizedRecoverySuggestion"];
    }
  }
  if ([v10 count]) {
    int v14 = v10;
  }
  else {
    int v14 = 0;
  }

  return [(NSError *)self initWithDomain:a3 code:a4 userInfo:v14];
}

- (id)description
{
  DebugDescription = (void *)_CFErrorCreateDebugDescription();

  return DebugDescription;
}

- (NSErrorDomain)domain
{
  v2 = self->_domain;

  return v2;
}

+ (void)userInfoValueProviderForDomain:(NSErrorDomain)errorDomain
{
  objc_super v3 = (void *)CFErrorCopyCallBackBlockForDomain();

  return v3;
}

+ (void)setUserInfoValueProviderForDomain:(NSErrorDomain)errorDomain provider:(void *)provider
{
  if (!errorDomain)
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@: nil domain argument", _NSMethodExceptionProem((objc_class *)a1, a2)];
    goto LABEL_8;
  }
  if ([(NSString *)errorDomain isEqual:@"NSCocoaErrorDomain"])
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@: Cannot replace provider for NSCocoaErrorDomain", _NSMethodExceptionProem((objc_class *)a1, a2)];
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v8 userInfo:0]);
  }

  MEMORY[0x1F40D7AC8](errorDomain, provider);
}

- (NSString)localizedFailureReason
{
  id v2 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSLocalizedFailureReason"];
  if (v2)
  {
    id result = (NSString *)[v2 copy];
  }
  else
  {
    id result = (NSString *)_CFErrorCreateLocalizedFailureReason();
    if (!result) {
      return result;
    }
  }

  return result;
}

- (NSError)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((init_warned & 1) == 0)
  {
    init_warned = 1;
    objc_super v3 = _NSOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_181795000, v3, OS_LOG_TYPE_ERROR, "-[NSError init] called; this results in an invalid NSError instance. It will raise an exception in a future rele"
        "ase. Please call errorWithDomain:code:userInfo: or initWithDomain:code:userInfo:. This message shown only once.",
        buf,
        2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NSError;
  return [(NSError *)&v5 init];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_11;
  }
  if (!a3
    || (objc_opt_isKindOfClass() & 1) == 0
    || (NSInteger v5 = -[NSError code](self, "code"), v5 != [a3 code]))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  int v6 = -[NSString isEqual:](-[NSError domain](self, "domain"), "isEqual:", [a3 domain]);
  if (v6)
  {
    uint64_t v7 = [(NSError *)self userInfo];
    uint64_t v8 = [a3 userInfo];
    if (v7 != (NSDictionary *)v8)
    {
      LOBYTE(v6) = [(NSDictionary *)v7 isEqual:v8];
      return v6;
    }
LABEL_11:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (NSString)localizedRecoverySuggestion
{
  id v2 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSLocalizedRecoverySuggestion"];
  if (v2)
  {
    id result = (NSString *)[v2 copy];
  }
  else
  {
    id result = (NSString *)_CFErrorCreateLocalizedRecoverySuggestion();
    if (!result) {
      return result;
    }
  }

  return result;
}

- (NSArray)localizedRecoveryOptions
{
  id v3 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSLocalizedRecoveryOptions"];
  if (v3)
  {
    id v4 = v3;
    return (NSArray *)v4;
  }
  else
  {
    [(NSError *)self domain];
    uint64_t v6 = CFErrorCopyCallBackBlockForDomain();
    if (!v6) {
      return 0;
    }
    uint64_t v7 = (const void *)v6;
    uint64_t v8 = (NSArray *)(*(uint64_t (**)(uint64_t, NSError *, __CFString *))(v6 + 16))(v6, self, @"NSLocalizedRecoveryOptions");
    CFRelease(v7);
    if (!v8) {
      return 0;
    }
    return v8;
  }
}

- (id)recoveryAttempter
{
  id v3 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSRecoveryAttempter"];
  if (!v3)
  {
    [(NSError *)self domain];
    uint64_t v4 = CFErrorCopyCallBackBlockForDomain();
    if (!v4) {
      return 0;
    }
    NSInteger v5 = (const void *)v4;
    id v3 = (id)(*(uint64_t (**)(uint64_t, NSError *, __CFString *))(v4 + 16))(v4, self, @"NSRecoveryAttempter");
    CFRelease(v5);
    if (!v3) {
      return 0;
    }
  }
  return v3;
}

- (NSString)helpAnchor
{
  id v3 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSHelpAnchor"];
  if (!v3)
  {
    [(NSError *)self domain];
    uint64_t v4 = CFErrorCopyCallBackBlockForDomain();
    if (!v4) {
      return 0;
    }
    NSInteger v5 = (const void *)v4;
    id v3 = (NSString *)(*(uint64_t (**)(uint64_t, NSError *, __CFString *))(v4 + 16))(v4, self, @"NSHelpAnchor");
    CFRelease(v5);
    if (!v3) {
      return 0;
    }
  }
  return v3;
}

- (NSArray)underlyingErrors
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSUnderlyingError"];
  id v4 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSMultipleUnderlyingErrorsKey"];
  id v5 = [(NSDictionary *)[(NSError *)self userInfo] objectForKey:@"NSDetailedErrors"];
  uint64_t v6 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(NSArray *)v6 addObject:v3];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v4 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(NSArray *)v6 addObject:v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v4 countByEnumeratingWithState:&v24 objects:v23 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v5);
        }
        uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(NSArray *)v6 addObject:v16];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v13);
  }
  return v6;
}

+ (void)_web_addErrorsWithCodesAndDescriptions:(id)a3 inDomain:(id)a4
{
  pthread_once(&initControl, WebNSErrorExtrasInit);
  uint64_t v6 = (void *)descriptions;

  [v6 setObject:a3 forKey:a4];
}

+ (id)_web_errorWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5
{
  id v5 = objc_msgSend(objc_alloc((Class)a1), "_web_initWithDomain:code:failingURL:", a3, a4, a5);

  return v5;
}

- (id)_web_initWithDomain:(id)a3 code:(int64_t)a4 failingURL:(id)a5
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = v9;
  if (a5)
  {
    [v9 setObject:a5 forKey:@"NSErrorFailingURLStringKey"];
    a5 = (id)[MEMORY[0x1E4F1CB10] URLWithString:a5];
    if (a5) {
      [v10 setObject:a5 forKey:@"NSErrorFailingURLKey"];
    }
  }
  [a5 host];
  id v11 = localizedDescriptionForError(a3, a4);
  if (v11) {
    [v10 setObject:v11 forKey:@"NSLocalizedDescription"];
  }
  if ([a3 isEqualToString:@"NSURLErrorDomain"])
  {
    uint64_t LocalizedFailureReason = _CFNetworkErrorGetLocalizedFailureReason();
    if (LocalizedFailureReason) {
      [v10 setObject:LocalizedFailureReason forKey:@"NSLocalizedFailureReason"];
    }
  }
  if ([a3 isEqualToString:@"NSURLErrorDomain"])
  {
    uint64_t LocalizedRecoverySuggestion = _CFNetworkErrorGetLocalizedRecoverySuggestion();
    if (LocalizedRecoverySuggestion) {
      [v10 setObject:LocalizedRecoverySuggestion forKey:@"NSLocalizedRecoverySuggestion"];
    }
  }
  if ([v10 count]) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0;
  }

  return [(NSError *)self initWithDomain:a3 code:a4 userInfo:v14];
}

- (BOOL)_web_errorIsInDomain:(id)a3
{
  id v4 = [(NSError *)self domain];

  return [(NSString *)v4 isEqualToString:a3];
}

- (id)_web_localizedDescription
{
  id v3 = [(NSError *)self _web_failingURL];
  if (v3) {
    id v4 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else {
    id v4 = 0;
  }
  id v5 = [(NSError *)self domain];
  uint64_t v6 = [(NSError *)self code];
  [v4 host];
  id result = localizedDescriptionForError(v5, v6);
  if (!result)
  {
    return [(NSError *)self localizedDescription];
  }
  return result;
}

- (id)_web_failingURL
{
  id v2 = objc_msgSend(-[NSDictionary objectForKey:](-[NSError userInfo](self, "userInfo"), "objectForKey:", @"NSErrorFailingURLStringKey"), "copy");

  return v2;
}

+ (void)_setFileNameLocalizationEnabled:(BOOL)a3
{
  fileNameLocalizationDisabled = !a3;
}

- (id)replacementObjectForPortCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([a3 isByref])
  {
    v6.receiver = self;
    v6.super_class = (Class)NSError;
    return [(NSError *)&v6 replacementObjectForPortCoder:a3];
  }
  return self;
}

@end