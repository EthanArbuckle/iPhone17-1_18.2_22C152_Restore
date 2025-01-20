@interface APSTokenStore
- (APSEnvironment)environment;
- (APSTokenStore)initWithEnvironment:(id)a3 allowInMemoryCache:(BOOL)a4;
- (BOOL)isAppSpecificTokenValidWithDomain:(id)a3 token:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6 error:(id *)a7;
- (BOOL)isAppSpecificTokenValidWithDomain:(id)a3 token:(id)a4 user:(id)a5 error:(id *)a6;
- (BOOL)isMatchingTokenInKeychain:(id)a3 user:(id)a4 error:(id *)a5;
- (NSMutableDictionary)perAppTokensByUserThenService;
- (id)_cachedTokensForUser:(id)a3 andService:(id)a4;
- (id)_copyHashForString:(id)a3;
- (id)_copyTokenForDomain:(id)a3 appSpecificIdentifier:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6;
- (id)copyAppSpecificIdentifierWithTopic:(id)a3 identifier:(id)a4 user:(id)a5;
- (id)copyAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6 returnRef:(BOOL)a7 error:(id *)a8;
- (id)copyAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 user:(id)a5 returnRef:(BOOL)a6 error:(id *)a7;
- (id)copyTokenForDomain:(id)a3 appSpecificIdentifier:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6;
- (id)description;
- (id)deserializedPersistedData:(id)a3 forInfo:(id)a4 outPersistedInfo:(id *)a5;
- (id)deserializedPersistedData:(id)a3 withType:(int64_t)a4 outPersistedInfo:(id *)a5;
- (id)serializeInfo:(id)a3 withToken:(id)a4;
- (id)suffixForInfo:(id)a3;
- (id)systemTokenForUser:(id)a3;
- (id)tokenForInfo:(id)a3 user:(id)a4 persistedInfo:(id *)a5;
- (id)tokenInfoArrayForTopic:(id)a3 user:(id)a4;
- (id)tokensForTopic:(id)a3 user:(id)a4 error:(id *)a5;
- (void)_cacheTokens:(id)a3 forUser:(id)a4 andService:(id)a5;
- (void)_clearCacheForUser:(id)a3 andService:(id)a4;
- (void)deleteAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 user:(id)a5;
- (void)deleteAppSpecificTokensWithDomain:(id)a3 tokenServiceSuffix:(id)a4 user:(id)a5;
- (void)deleteAppSpecificTokensWithRefArray:(id)a3;
- (void)deleteAppTokensForUser:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setPerAppTokensByUserThenService:(id)a3;
- (void)setSystemToken:(id)a3 forUser:(id)a4;
- (void)setToken:(__CFData *)a3 withDomain:(id)a4 appSpecificIdentifier:(id)a5 tokenServiceSuffix:(id)a6 user:(id)a7 topic:(id)a8;
- (void)setToken:(id)a3 forInfo:(id)a4 user:(id)a5;
@end

@implementation APSTokenStore

- (APSTokenStore)initWithEnvironment:(id)a3 allowInMemoryCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)APSTokenStore;
  v8 = [(APSTokenStore *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_environment, a3);
    if (v4)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      perAppTokensByUserThenService = v9->_perAppTokensByUserThenService;
      v9->_perAppTokensByUserThenService = v10;
    }
  }

  return v9;
}

- (void)setSystemToken:(id)a3 forUser:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(APSTokenStore *)self environment];
  v8 = [v9 domain];
  [(APSTokenStore *)self setToken:v7 withDomain:v8 appSpecificIdentifier:0 tokenServiceSuffix:&stru_10012F350 user:v6 topic:0];
}

- (id)systemTokenForUser:(id)a3
{
  id v4 = a3;
  v5 = [(APSTokenStore *)self environment];
  id v6 = [v5 domain];
  id v7 = [(APSTokenStore *)self copyTokenForDomain:v6 appSpecificIdentifier:0 tokenServiceSuffix:&stru_10012F350 user:v4];

  return v7;
}

- (void)deleteAppTokensForUser:(id)a3
{
  id v4 = a3;
  v5 = [(APSTokenStore *)self environment];
  id v6 = [v5 domain];
  [(APSTokenStore *)self deleteAppSpecificTokensWithDomain:v6 tokenServiceSuffix:@",PerAppToken.v0" user:v4];

  id v8 = [(APSTokenStore *)self environment];
  id v7 = [v8 domain];
  [(APSTokenStore *)self deleteAppSpecificTokensWithDomain:v7 tokenServiceSuffix:@",ExtendedAppToken.v1" user:v4];
}

- (void)setToken:(id)a3 forInfo:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ![v9 type])
  {
    v11 = [(APSTokenStore *)self environment];
    v12 = [v11 domain];
    objc_super v13 = [v9 topic];
    [(APSTokenStore *)self deleteAppSpecificTokensWithDomain:v12 forTopic:v13 user:v10];
  }
  v14 = [v9 topic];
  v15 = [v9 identifier];
  id v16 = [(APSTokenStore *)self copyAppSpecificIdentifierWithTopic:v14 identifier:v15 user:v10];

  if (!v8)
  {
    v19 = 0;
LABEL_12:
    v20 = [(APSTokenStore *)self environment];
    v21 = [v20 domain];
    v22 = [(APSTokenStore *)self suffixForInfo:v9];
    v23 = [v9 topic];
    [(APSTokenStore *)self setToken:v19 withDomain:v21 appSpecificIdentifier:v16 tokenServiceSuffix:v22 user:v10 topic:v23];

    goto LABEL_13;
  }
  v17 = [v9 baseToken];

  if (!v17)
  {
    v18 = +[APSLog courier];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_1000C7920((uint64_t)self, v18);
    }
  }
  v19 = [(APSTokenStore *)self serializeInfo:v9 withToken:v8];
  if (v19) {
    goto LABEL_12;
  }
LABEL_13:
}

- (id)tokenForInfo:(id)a3 user:(id)a4 persistedInfo:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 topic];
  v11 = [v8 identifier];
  id v12 = [(APSTokenStore *)self copyAppSpecificIdentifierWithTopic:v10 identifier:v11 user:v9];

  objc_super v13 = [(APSTokenStore *)self environment];
  v14 = [v13 domain];
  v15 = [(APSTokenStore *)self suffixForInfo:v8];
  id v16 = [(APSTokenStore *)self copyTokenForDomain:v14 appSpecificIdentifier:v12 tokenServiceSuffix:v15 user:v9];

  if (v16)
  {
    v17 = [(APSTokenStore *)self deserializedPersistedData:v16 forInfo:v8 outPersistedInfo:a5];
  }
  else
  {
    v17 = 0;
    if (a5) {
      *a5 = v8;
    }
  }

  return v17;
}

- (id)tokensForTopic:(id)a3 user:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(APSEnvironment *)self->_environment domain];
  id v42 = 0;
  id v10 = [(APSTokenStore *)self copyAppSpecificTokensWithDomain:v9 forTopic:v7 user:v8 returnRef:0 error:&v42];
  id v31 = v42;

  v11 = &__NSArray0__struct;
  if (v10) {
    v11 = v10;
  }
  id v12 = v11;

  objc_super v13 = [(APSEnvironment *)self->_environment domain];
  id v41 = 0;
  id v14 = [(APSTokenStore *)self copyAppSpecificTokensWithDomain:v13 forTopic:v7 tokenServiceSuffix:@",ExtendedAppToken.v1" user:v8 returnRef:0 error:&v41];
  id v30 = v41;

  id v15 = [v12 mutableCopy];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v12;
  id v17 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [(APSTokenStore *)self deserializedPersistedData:*(void *)(*((void *)&v37 + 1) + 8 * i) withType:0 outPersistedInfo:0];
        if (v21) {
          [v15 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v18);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v14;
  id v23 = [v22 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = [(APSTokenStore *)self deserializedPersistedData:*(void *)(*((void *)&v33 + 1) + 8 * (void)j) withType:1 outPersistedInfo:0];
        if (v27) {
          [v15 addObject:v27];
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v24);
  }

  if (a5 && v31 && v30) {
    *a5 = v31;
  }
  id v28 = [v15 copy];

  return v28;
}

- (id)tokenInfoArrayForTopic:(id)a3 user:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(APSEnvironment *)self->_environment domain];
  id v9 = [(APSTokenStore *)self copyAppSpecificTokensWithDomain:v8 forTopic:v6 tokenServiceSuffix:@",ExtendedAppToken.v1" user:v7 returnRef:0 error:0];

  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v21 = 0;
        id v17 = [(APSTokenStore *)self deserializedPersistedData:v16 withType:1 outPersistedInfo:&v21];
        id v18 = v21;
        if (v18) {
          [v10 addObject:v18];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  id v19 = [v10 copy];
  return v19;
}

- (BOOL)isMatchingTokenInKeychain:(id)a3 user:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(APSTokenStore *)self environment];
  id v11 = [v10 domain];
  LOBYTE(a5) = [(APSTokenStore *)self isAppSpecificTokenValidWithDomain:v11 token:v9 user:v8 error:a5];

  return (char)a5;
}

- (id)suffixForInfo:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 type];
  if (v3 > 2) {
    return &stru_10012F350;
  }
  else {
    return off_10012A048[v3];
  }
}

- (id)serializeInfo:(id)a3 withToken:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 dictionaryRepresentation];
  id v8 = [v7 mutableCopy];

  [v8 setObject:v5 forKeyedSubscript:@"APSTokenPersistenceKey"];
  id v9 = [v6 type];

  id v10 = +[NSNumber numberWithInteger:v9];
  [v8 setObject:v10 forKeyedSubscript:@"APSTypePersistenceKey"];

  id v11 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

  return v11;
}

- (id)deserializedPersistedData:(id)a3 forInfo:(id)a4 outPersistedInfo:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = -[APSTokenStore deserializedPersistedData:withType:outPersistedInfo:](self, "deserializedPersistedData:withType:outPersistedInfo:", v9, [v8 type], a5);

  if (![v8 type] && !*a5)
  {
    id v11 = objc_alloc((Class)APSAppTokenInfo);
    id v12 = [v8 dictionaryRepresentation];
    *a5 = [v11 initWithDictionary:v12];
  }
  return v10;
}

- (id)deserializedPersistedData:(id)a3 withType:(int64_t)a4 outPersistedInfo:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  id v23 = 0;
  id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v7 error:&v23];
  id v13 = v23;

  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      id v21 = 0;
    }
    else {
      id v21 = v7;
    }
    goto LABEL_20;
  }
  uint64_t v14 = [v12 objectForKeyedSubscript:@"APSTokenPersistenceKey"];
  id v15 = [v12 objectForKeyedSubscript:@"APSTypePersistenceKey"];
  uint64_t v16 = v15;
  if (!v15 || (unsigned int v17 = [v15 intValue], v17 > 2))
  {
    id v19 = 0;
    goto LABEL_17;
  }
  id v18 = [objc_alloc((Class)*off_10012A060[v17]) initWithDictionary:v12];
  id v19 = v18;
  if (v18) {
    BOOL v20 = v14 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
LABEL_17:
    id v21 = 0;
    if (a5) {
      *a5 = 0;
    }
    goto LABEL_19;
  }
  if (a5) {
    *a5 = v18;
  }
  id v21 = v14;
LABEL_19:

LABEL_20:
  return v21;
}

- (BOOL)isAppSpecificTokenValidWithDomain:(id)a3 token:(id)a4 user:(id)a5 error:(id *)a6
{
  id v20 = 0;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  unsigned __int8 v13 = [(APSTokenStore *)self isAppSpecificTokenValidWithDomain:v12 token:v11 tokenServiceSuffix:@",PerAppToken.v0" user:v10 error:&v20];
  id v14 = v20;
  id v19 = 0;
  unsigned __int8 v15 = [(APSTokenStore *)self isAppSpecificTokenValidWithDomain:v12 token:v11 tokenServiceSuffix:@",ExtendedAppToken.v1" user:v10 error:&v19];

  id v16 = v19;
  unsigned int v17 = v16;
  if (a6 && v14 && v16) {
    *a6 = v14;
  }

  return v13 | v15;
}

- (BOOL)isAppSpecificTokenValidWithDomain:(id)a3 token:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6 error:(id *)a7
{
  id v12 = (__CFString *)a3;
  unsigned __int8 v13 = (__CFString *)a4;
  id v14 = a5;
  id v15 = a6;
  if (v13)
  {
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v12, v14];
    unsigned int v17 = [(APSTokenStore *)self _cachedTokensForUser:v15 andService:v16];
    id v18 = +[APSLog courier];
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138413314;
        v50 = self;
        __int16 v51 = 2112;
        v52 = v12;
        __int16 v53 = 2112;
        CFStringRef v54 = v13;
        __int16 v55 = 2112;
        id v56 = v14;
        __int16 v57 = 2048;
        id v58 = [v17 count];
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: isAppSpecificTokenValid %@ %@ %@ - using cache {count: %llu}", buf, 0x34u);
      }

      LOBYTE(v18) = [v17 containsObject:v13];
LABEL_42:

      goto LABEL_43;
    }
    id v41 = a7;
    if (v19)
    {
      *(_DWORD *)buf = 138413058;
      v50 = self;
      __int16 v51 = 2112;
      v52 = v12;
      __int16 v53 = 2112;
      CFStringRef v54 = v13;
      __int16 v55 = 2112;
      id v56 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: isAppSpecificTokenValid %@ %@ %@", buf, 0x2Au);
    }

    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
    CFDictionaryAddValue(Mutable, kSecAttrService, v16);
    CFDictionaryAddValue(Mutable, kSecMatchLimit, kSecMatchLimitAll);
    CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
    if ([v15 isDefaultUser])
    {
      id v21 = +[APSMultiUserMode sharedInstance];
      unsigned int v22 = [v21 isMultiUser];

      if (v22) {
        CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
      }
    }
    CFTypeRef result = 0;
    OSStatus v23 = SecItemCopyMatching(Mutable, &result);
    if (v23 == -25300)
    {
      id v28 = +[APSLog courier];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = self;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%@: SecItemCopyMatching() returned no items found.", buf, 0xCu);
      }

      if (!v41) {
        goto LABEL_23;
      }
      uint64_t v26 = APSErrorDomain;
      uint64_t v27 = -25300;
    }
    else
    {
      OSStatus v24 = v23;
      if (!v23) {
        goto LABEL_23;
      }
      long long v25 = +[APSLog courier];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000C7998();
      }

      CFTypeRef result = 0;
      if (!v41) {
        goto LABEL_23;
      }
      uint64_t v26 = APSErrorDomain;
      uint64_t v27 = v24;
    }
    *id v41 = +[NSError errorWithDomain:v26 code:v27 userInfo:0];
LABEL_23:
    CFRelease(Mutable);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v29 = (id)(id)result;
    id v30 = [v29 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v30)
    {
      id v31 = v30;
      id v39 = v16;
      id v40 = v15;
      id v42 = v12;
      uint64_t v32 = *(void *)v44;
      while (2)
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v29);
          }
          long long v34 = -[APSTokenStore deserializedPersistedData:withType:outPersistedInfo:](self, "deserializedPersistedData:withType:outPersistedInfo:", *(void *)(*((void *)&v43 + 1) + 8 * i), [@",ExtendedAppToken.v1" isEqualToString:v14], 0);
          unsigned __int8 v35 = [v34 isEqualToData:v13];

          if (v35)
          {
            LODWORD(v18) = 1;
            goto LABEL_33;
          }
        }
        id v31 = [v29 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v31) {
          continue;
        }
        break;
      }
      LODWORD(v18) = 0;
LABEL_33:
      id v12 = v42;
      id v16 = v39;
      id v15 = v40;
    }
    else
    {
      LODWORD(v18) = 0;
    }

    long long v36 = +[APSLog courier];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v37 = @"NO";
      *(_DWORD *)buf = 138412802;
      v50 = self;
      __int16 v51 = 2112;
      if (v18) {
        CFStringRef v37 = @"YES";
      }
      v52 = v13;
      __int16 v53 = 2112;
      CFStringRef v54 = v37;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: isAppSpecificTokenValid? %@ found cached token %@", buf, 0x20u);
    }

    if (result) {
      CFRelease(result);
    }

    unsigned int v17 = 0;
    goto LABEL_42;
  }
  LOBYTE(v18) = 0;
LABEL_43:

  return (char)v18;
}

- (id)copyAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 user:(id)a5 returnRef:(BOOL)a6 error:(id *)a7
{
  return [(APSTokenStore *)self copyAppSpecificTokensWithDomain:a3 forTopic:a4 tokenServiceSuffix:@",PerAppToken.v0" user:a5 returnRef:a6 error:a7];
}

- (id)copyAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6 returnRef:(BOOL)a7 error:(id *)a8
{
  BOOL v54 = a7;
  id v12 = a3;
  id v51 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = +[APSLog courier];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v64 = self;
    __int16 v65 = 2112;
    id v66 = v12;
    __int16 v67 = 2112;
    id v68 = v51;
    __int16 v69 = 2112;
    id v70 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: copyAppSpecificTokensWithDomain %@ %@ %@", buf, 0x2Au);
  }

  v48 = v13;
  id v16 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v12, v13];
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  long long v46 = v16;
  CFDictionaryAddValue(Mutable, kSecAttrService, v16);
  CFDictionaryAddValue(Mutable, kSecMatchLimit, kSecMatchLimitAll);
  CFDictionaryAddValue(Mutable, kSecReturnAttributes, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kSecReturnPersistentRef, kCFBooleanTrue);
  if ([v14 isDefaultUser])
  {
    id v18 = +[APSMultiUserMode sharedInstance];
    unsigned int v19 = [v18 isMultiUser];

    if (v19) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
  }
  CFTypeRef result = 0;
  OSStatus v20 = SecItemCopyMatching(Mutable, &result);
  if (v20 == -25300)
  {
    long long v25 = +[APSLog courier];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = self;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: SecItemCopyMatching() returned no items found.", buf, 0xCu);
    }

    if (!a8) {
      goto LABEL_17;
    }
    uint64_t v23 = APSErrorDomain;
    uint64_t v24 = -25300;
  }
  else
  {
    OSStatus v21 = v20;
    if (!v20) {
      goto LABEL_17;
    }
    unsigned int v22 = +[APSLog courier];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v64 = self;
      __int16 v65 = 2048;
      id v66 = (id)v21;
      __int16 v67 = 2112;
      id v68 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@: SecItemCopyMatching() failed: %ld - copyAppSpecificTokensWithDomain %@", buf, 0x20u);
    }

    CFTypeRef result = 0;
    if (!a8) {
      goto LABEL_17;
    }
    uint64_t v23 = APSErrorDomain;
    uint64_t v24 = v21;
  }
  *a8 = +[NSError errorWithDomain:v23 code:v24 userInfo:0];
LABEL_17:
  __int16 v55 = v12;
  cf = Mutable;
  v47 = v14;
  uint64_t v26 = (id)result;
  id v27 = [(APSTokenStore *)self _copyHashForString:v51];
  id v28 = +[NSMutableArray array];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v29 = v26;
  id v30 = [v29 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (!v30) {
    goto LABEL_40;
  }
  id v31 = v30;
  uint64_t v32 = *(void *)v58;
  id v49 = v27;
  id v50 = v29;
  uint64_t v53 = *(void *)v58;
  do
  {
    for (i = 0; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v58 != v32) {
        objc_enumerationMutation(v29);
      }
      long long v34 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      unsigned __int8 v35 = [v34 objectForKeyedSubscript:kSecAttrAccount];
      if ([v35 containsString:v27])
      {
        if (!v28) {
          id v28 = objc_alloc_init((Class)NSMutableArray);
        }
        id v36 = v31;
        CFStringRef v37 = +[APSLog courier];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v64 = self;
          __int16 v65 = 2112;
          id v66 = v55;
          __int16 v67 = 2112;
          id v68 = v51;
          __int16 v69 = 2112;
          id v70 = v35;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@: copyAppSpecificTokensWithDomain - %@ for topic %@ account %@", buf, 0x2Au);
        }

        long long v38 = [v34 objectForKeyedSubscript:kSecValuePersistentRef];
        if (v54)
        {
          [v28 addObject:v38];
LABEL_37:

          uint64_t v32 = v53;
          id v31 = v36;
          goto LABEL_38;
        }
        id v39 = v28;
        CFTypeRef v56 = 0;
        id v40 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionaryAddValue(v40, kSecValuePersistentRef, v38);
        CFDictionaryAddValue(v40, kSecReturnData, kCFBooleanTrue);
        OSStatus v41 = SecItemCopyMatching(v40, &v56);
        if (v41)
        {
          OSStatus v42 = v41;
          long long v43 = +[APSLog courier];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            v64 = self;
            __int16 v65 = 2112;
            id v66 = v38;
            __int16 v67 = 2048;
            id v68 = (id)v42;
            __int16 v69 = 2112;
            id v70 = v55;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@: SecItemCopyMatching() failed for persistenRef %@ with error: %ld - copyAppSpecificTokensWithDomain %@", buf, 0x2Au);
          }
          id v28 = v39;
          id v27 = v49;
          id v29 = v50;
LABEL_35:
        }
        else
        {
          long long v43 = v56;
          id v27 = v49;
          id v29 = v50;
          if (v56)
          {
            [v28 addObject:v56];
            goto LABEL_35;
          }
        }
        CFRelease(v40);
        goto LABEL_37;
      }
LABEL_38:
    }
    id v31 = [v29 countByEnumeratingWithState:&v57 objects:v62 count:16];
  }
  while (v31);
LABEL_40:

  if (result) {
    CFRelease(result);
  }
  CFRelease(cf);

  return v28;
}

- (id)copyAppSpecificIdentifierWithTopic:(id)a3 identifier:(id)a4 user:(id)a5
{
  id v7 = a4;
  id v8 = [(APSTokenStore *)self _copyHashForString:a3];
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%@,%@", v7, v8];

  return v9;
}

- (void)deleteAppSpecificTokensWithRefArray:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 138412802;
    long long v13 = v5;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
        CFStringRef v25 = kSecValuePersistentRef;
        uint64_t v26 = v9;
        +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1, v13);
        CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        OSStatus v11 = SecItemDelete(v10);

        if (v11)
        {
          id v12 = +[APSLog courier];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v13;
            OSStatus v20 = self;
            __int16 v21 = 2048;
            uint64_t v22 = v11;
            __int16 v23 = 2112;
            uint64_t v24 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: SecItemDelete() failed: %ld - deleteAppSpecificTokensWithArray persistentRef %@", buf, 0x20u);
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v6);
  }
}

- (id)_copyHashForString:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)deleteAppSpecificTokensWithDomain:(id)a3 forTopic:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  OSStatus v11 = +[APSLog courier];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    long long v15 = self;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: deleteAppSpecificTokens - %@ for topic %@", buf, 0x20u);
  }

  id v12 = [(APSTokenStore *)self copyAppSpecificTokensWithDomain:v8 forTopic:v9 user:v10 returnRef:1 error:0];
  id v13 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v8, @",PerAppToken.v0"];
  [(APSTokenStore *)self _clearCacheForUser:v10 andService:v13];

  [(APSTokenStore *)self deleteAppSpecificTokensWithRefArray:v12];
}

- (void)setToken:(__CFData *)a3 withDomain:(id)a4 appSpecificIdentifier:(id)a5 tokenServiceSuffix:(id)a6 user:(id)a7 topic:(id)a8
{
  id v13 = a4;
  id v14 = (__CFData *)a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[APSLog courier];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v29 = self;
    __int16 v30 = 2112;
    id v31 = v13;
    __int16 v32 = 2112;
    long long v33 = a3;
    __int16 v34 = 2112;
    unsigned __int8 v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: setTokenForDomain %@ token %@ appSpecificIdentifier %@", buf, 0x2Au);
  }

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  if ([v16 isDefaultUser])
  {
    id v19 = +[APSMultiUserMode sharedInstance];
    unsigned int v20 = [v19 isMultiUser];

    if (v20) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
  }
  if (v14)
  {
    CFDictionaryAddValue(Mutable, kSecAttrAccount, v14);
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v13, v15];
  }
  else
  {
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v13, &stru_10012F350];
  }
  uint64_t v22 = v21;
  [(APSTokenStore *)self _clearCacheForUser:v16 andService:v21];
  CFDictionaryAddValue(Mutable, kSecAttrService, v22);
  if (a3)
  {
    CFDictionaryAddValue(Mutable, kSecAttrAccessible, kSecAttrAccessibleAlwaysThisDeviceOnly);
    CFDictionaryAddValue(Mutable, kSecValueData, a3);
    OSStatus v23 = SecItemAdd(Mutable, 0);
    if (v23 == -25299)
    {
      id v27 = v15;
      uint64_t v24 = +[APSLog courier];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        id v29 = self;
        __int16 v30 = 2112;
        id v31 = v13;
        __int16 v32 = 2112;
        long long v33 = v14;
        __int16 v34 = 2112;
        unsigned __int8 v35 = a3;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@: SecResult shows duplicate item, trying to update it. setTokenForDomain %@ appSpecificIdentifier %@  token %@", buf, 0x2Au);
      }

      CFDictionaryRemoveValue(Mutable, kSecValueData);
      CFStringRef v25 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryAddValue(v25, kSecValueData, a3);
      OSStatus v23 = SecItemUpdate(Mutable, v25);
      CFRelease(v25);
      id v15 = v27;
    }
    if (v23)
    {
      uint64_t v26 = +[APSLog courier];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1000C7A68();
      }
LABEL_20:
    }
  }
  else if (SecItemDelete(Mutable))
  {
    uint64_t v26 = +[APSLog courier];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000C7A00();
    }
    goto LABEL_20;
  }
  CFRelease(Mutable);
}

- (void)deleteAppSpecificTokensWithDomain:(id)a3 tokenServiceSuffix:(id)a4 user:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  OSStatus v11 = +[APSLog courier];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: deleteAppSpecificTokens - domain %@ tokenServiceSuffix %@", buf, 0x20u);
  }

  id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@", v8, v9];
  [(APSTokenStore *)self _clearCacheForUser:v10 andService:v12];
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  CFDictionaryAddValue(Mutable, kSecAttrService, v12);
  unsigned int v14 = [v10 isDefaultUser];

  if (v14)
  {
    id v15 = +[APSMultiUserMode sharedInstance];
    unsigned int v16 = [v15 isMultiUser];

    if (v16) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
  }
  if (SecItemDelete(Mutable))
  {
    id v17 = +[APSLog courier];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000C7AD0();
    }
  }
  CFRelease(Mutable);
}

- (id)copyTokenForDomain:(id)a3 appSpecificIdentifier:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(APSTokenStore *)self _copyTokenForDomain:v10 appSpecificIdentifier:v11 tokenServiceSuffix:v12 user:v13];
  if (!v14) {
    id v14 = [(APSTokenStore *)self _copyTokenForDomain:v10 appSpecificIdentifier:v11 tokenServiceSuffix:v12 user:v13];
  }

  return v14;
}

- (id)_copyTokenForDomain:(id)a3 appSpecificIdentifier:(id)a4 tokenServiceSuffix:(id)a5 user:(id)a6
{
  id v41 = a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = (__CFString *)a5;
  id v42 = a6;
  id v12 = +[APSLog courier];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v50 = self;
    __int16 v51 = 2112;
    id v52 = v41;
    __int16 v53 = 2112;
    unint64_t v54 = v10;
    __int16 v55 = 2112;
    CFTypeRef v56 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: copyTokenForDomain %@ %@ %@", buf, 0x2Au);
  }

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, APSBundleIdentifier);
  if ([v42 isDefaultUser])
  {
    id v14 = +[APSMultiUserMode sharedInstance];
    unsigned int v15 = [v14 isMultiUser];

    if (v15) {
      CFDictionaryAddValue(Mutable, kSecUseSystemKeychain, kCFBooleanTrue);
    }
  }
  if (v10)
  {
    CFDictionaryAddValue(Mutable, kSecAttrAccount, (const void *)v10);
    id v16 = objc_alloc((Class)NSString);
    CFStringRef v36 = v11;
  }
  else
  {
    id v16 = objc_alloc((Class)NSString);
    CFStringRef v36 = &stru_10012F350;
  }
  id v17 = [v16 initWithFormat:@"%@%@", v41, v36];
  CFDictionaryAddValue(Mutable, kSecAttrService, v17);
  CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
  CFTypeRef result = 0;
  OSStatus v18 = SecItemCopyMatching(Mutable, &result);
  if (v18 != -25300 && v18)
  {
    id v19 = +[APSLog courier];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000C7B38();
    }
  }
  CFRelease(Mutable);
  if (!(v10 | (unint64_t)result))
  {
    CFPropertyListRef v20 = sub_10007E420(@"APSPublicTokens", (int)[v42 isDefaultUser]);
    if (v20)
    {
      id v21 = (void *)v20;
      CFTypeID v22 = CFGetTypeID(v20);
      if (v22 == CFDictionaryGetTypeID())
      {
        id v38 = v17;
        id v39 = v11;
        unint64_t v40 = v10;
        id v23 = +[APSLog courier];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = self;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: Migrating tokens to the keychain", buf, 0xCu);
        }

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        CFStringRef v37 = v21;
        id v24 = v21;
        id v25 = [v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v44;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v44 != v27) {
                objc_enumerationMutation(v24);
              }
              id v29 = *(const void **)(*((void *)&v43 + 1) + 8 * i);
              Value = CFDictionaryGetValue((CFDictionaryRef)v24, v29);
              CFTypeRef v31 = result;
              __int16 v32 = [(APSTokenStore *)self environment];
              long long v33 = [v32 domain];
              [(APSTokenStore *)self setToken:v31 withDomain:v33 appSpecificIdentifier:0 tokenServiceSuffix:&stru_10012F350 user:v42 topic:0];

              if (!result && Value && [v41 isEqualToString:v29]) {
                CFTypeRef result = CFRetain(Value);
              }
            }
            id v26 = [v24 countByEnumeratingWithState:&v43 objects:v48 count:16];
          }
          while (v26);
        }

        sub_10007E524(@"APSPublicTokens", 0, (int)[v42 isDefaultUser]);
        sub_10007E648((int)[v42 isDefaultUser]);
        id v11 = v39;
        unint64_t v10 = v40;
        id v21 = v37;
        id v17 = v38;
      }
      CFRelease(v21);
    }
  }
  CFTypeRef v34 = result;

  return (id)v34;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(APSTokenStore *)self environment];
  long long v5 = [v4 name];
  id v6 = +[NSString stringWithFormat:@"<%@:%p; %@>", v3, self, v5];

  return v6;
}

- (void)_clearCacheForUser:(id)a3 andService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_perAppTokensByUserThenService)
  {
    id v8 = +[APSLog courier];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412802;
      id v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: dropping cache {user: %@, service: %@}", (uint8_t *)&v12, 0x20u);
    }

    perAppTokensByUserThenService = self->_perAppTokensByUserThenService;
    unint64_t v10 = [v6 name];
    id v11 = [(NSMutableDictionary *)perAppTokensByUserThenService objectForKeyedSubscript:v10];
    [v11 removeObjectForKey:v7];
  }
}

- (id)_cachedTokensForUser:(id)a3 andService:(id)a4
{
  perAppTokensByUserThenService = self->_perAppTokensByUserThenService;
  if (perAppTokensByUserThenService)
  {
    id v6 = a4;
    id v7 = [a3 name];
    id v8 = [perAppTokensByUserThenService objectForKeyedSubscript:v7];

    perAppTokensByUserThenService = [v8 objectForKeyedSubscript:v6];
  }
  return perAppTokensByUserThenService;
}

- (void)_cacheTokens:(id)a3 forUser:(id)a4 andService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  perAppTokensByUserThenService = self->_perAppTokensByUserThenService;
  if (perAppTokensByUserThenService)
  {
    int v12 = [v9 name];
    id v13 = [(NSMutableDictionary *)perAppTokensByUserThenService objectForKeyedSubscript:v12];

    if (!v13)
    {
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      __int16 v14 = self->_perAppTokensByUserThenService;
      id v15 = [v9 name];
      [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
    }
    __int16 v16 = +[APSLog courier];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138413058;
      OSStatus v18 = self;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2048;
      id v24 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: storing cache {user: %@, service: %@, count: %llu}", (uint8_t *)&v17, 0x2Au);
    }

    [v13 setObject:v8 forKeyedSubscript:v10];
  }
}

- (APSEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (NSMutableDictionary)perAppTokensByUserThenService
{
  return self->_perAppTokensByUserThenService;
}

- (void)setPerAppTokensByUserThenService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAppTokensByUserThenService, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end