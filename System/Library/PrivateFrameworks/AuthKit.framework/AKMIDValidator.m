@interface AKMIDValidator
+ (id)_anisetteValidationQueue;
+ (id)sharedValidator;
- (AKMIDValidator)init;
- (BOOL)_isMatchingMIDDriftedErrorDictionary:(id)a3 ttrConfigMIDDriftedErrors:(id)a4;
- (BOOL)_isTTRConfigMatchingMIDDriftedErrors:(id)a3;
- (BOOL)_isTTREligibleForMIDDriftedError:(id)a3;
- (BOOL)_setLastKnownMID:(id)a3 keychainError:(id *)a4;
- (BOOL)resetKeychainCacheWithError:(id *)a3;
- (NSString)lastKnownMID;
- (id)_createErrorWithMIDDriftUnderlyingError:(id)a3 anisetteFetchError:(id)a4;
- (id)_defaultMIDInvalidatedTTRConfig;
- (id)_initWithKeychain:(id)a3;
- (id)_lastKnownMIDWithKeychainError:(id *)a3;
- (id)_normalizedMIDDriftedError:(id)a3 underlyingLevel:(unint64_t)a4 midDriftedErrorDict:(id)a5;
- (int64_t)_calculateAndPersistDriftStatusForMID:(id)a3 anisetteFetchError:(id)a4 error:(id *)a5;
- (void)_triggerTTRForMIDDriftedError:(id)a3;
- (void)setLastKnownMID:(id)a3;
- (void)validateMID:(id)a3 anisetteFetchError:(id)a4;
@end

@implementation AKMIDValidator

- (int64_t)_calculateAndPersistDriftStatusForMID:(id)a3 anisetteFetchError:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v27 = 0;
  v10 = [(AKMIDValidator *)self _lastKnownMIDWithKeychainError:&v27];
  id v11 = v27;
  if (!v11)
  {
    v14 = [v9 userInfo];
    v15 = [v14 objectForKeyedSubscript:NSUnderlyingErrorKey];

    if ([v15 isAccountNotProvisioned])
    {
      if (v10)
      {
        id v26 = 0;
        unsigned __int8 v16 = [(AKMIDValidator *)self _setLastKnownMID:v8 keychainError:&v26];
        v17 = v26;
        v18 = _AKLogSystem();
        v19 = v18;
        if (v16)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_10018BFB8();
          }

LABEL_21:
          int64_t v13 = 2;
LABEL_39:

          goto LABEL_40;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10018C02C();
        }
LABEL_28:

        if (a5)
        {
          v17 = v17;
          int64_t v13 = 0;
          *a5 = v17;
        }
        else
        {
          int64_t v13 = 0;
        }
        goto LABEL_39;
      }
      v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_10018BF84();
      }
    }
    else
    {
      if ([v8 isEqualToString:v10])
      {
        int64_t v13 = 1;
LABEL_40:

        goto LABEL_41;
      }
      id v25 = 0;
      unsigned __int8 v20 = [(AKMIDValidator *)self _setLastKnownMID:v8 keychainError:&v25];
      v17 = v25;
      if ((v20 & 1) == 0)
      {
        v19 = _AKLogSystem();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10018C170();
        }
        goto LABEL_28;
      }
      if (v8 && v10)
      {
        v21 = _AKLogSystem();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          sub_10018C094();
        }

        goto LABEL_21;
      }
      v22 = _AKLogSystem();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
      if (v8 || !v10)
      {
        if (v23) {
          sub_10018C13C();
        }
      }
      else if (v23)
      {
        sub_10018C108();
      }
    }
    int64_t v13 = 1;
    goto LABEL_39;
  }
  v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10018C1D8();
  }

  int64_t v13 = 0;
  if (a5) {
    *a5 = v11;
  }
LABEL_41:

  return v13;
}

- (id)_lastKnownMIDWithKeychainError:(id *)a3
{
  lastKnownMID = self->_lastKnownMID;
  if (!lastKnownMID)
  {
    v5 = [(AKMIDKeychain *)self->_midKeychain lastKnownMID:a3];
    v6 = self->_lastKnownMID;
    self->_lastKnownMID = v5;

    lastKnownMID = self->_lastKnownMID;
  }

  return lastKnownMID;
}

- (void)validateMID:(id)a3 anisetteFetchError:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    a3 = [a3 machineID];
  }
  v7 = (void *)os_transaction_create();
  id v8 = [(id)objc_opt_class() _anisetteValidationQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005AB4;
  v12[3] = &unk_10022A4D0;
  v12[4] = self;
  id v13 = a3;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = a3;
  dispatch_async(v8, v12);
}

+ (id)_anisetteValidationQueue
{
  if (qword_100272538 != -1) {
    dispatch_once(&qword_100272538, &stru_10022A538);
  }
  v2 = (void *)qword_100272530;

  return v2;
}

+ (id)sharedValidator
{
  if (qword_100272528 != -1) {
    dispatch_once(&qword_100272528, &stru_10022A518);
  }
  v2 = (void *)qword_100272520;

  return v2;
}

- (AKMIDValidator)init
{
  v3 = objc_opt_new();
  v4 = [[AKMIDValidator alloc] _initWithKeychain:v3];

  return v4;
}

- (id)_initWithKeychain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKMIDValidator;
  id v6 = [(AKMIDValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_midKeychain, a3);
  }

  return v7;
}

- (BOOL)resetKeychainCacheWithError:(id *)a3
{
  return [(AKMIDValidator *)self _setLastKnownMID:0 keychainError:a3];
}

- (void)_triggerTTRForMIDDriftedError:(id)a3
{
  id v3 = a3;
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"MID drifted with error code - %ld", [v3 code]);
  id v5 = [v3 description];

  id v6 = +[NSString stringWithFormat:@"MID drifted with error - \n\terror: %@", v5];

  v7 = +[AKTTRController sharedController];
  CFStringRef v9 = @"1756944";
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v7 requestSilentTTRWithTitle:v4 message:v6 keywords:v8 completion:&stru_10022A558];
}

- (BOOL)_isTTREligibleForMIDDriftedError:(id)a3
{
  id v3 = self;
  v4 = [(AKMIDValidator *)self _normalizedMIDDriftedError:a3 underlyingLevel:0 midDriftedErrorDict:&__NSDictionary0__struct];
  LOBYTE(v3) = [(AKMIDValidator *)v3 _isTTRConfigMatchingMIDDriftedErrors:v4];

  return (char)v3;
}

- (BOOL)_isTTRConfigMatchingMIDDriftedErrors:(id)a3
{
  id v4 = a3;
  id v5 = +[AKURLBag sharedBag];
  id v6 = [v5 ttrConfigurationAtKey:@"com.apple.authkit.midInvalidated"];

  if (!v6)
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10018BEDC();
    }

    id v6 = [(AKMIDValidator *)self _defaultMIDInvalidatedTTRConfig];
  }
  objc_opt_class();
  id v8 = [v6 objectForKeyedSubscript:@"iOS"];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        if (-[AKMIDValidator _isMatchingMIDDriftedErrorDictionary:ttrConfigMIDDriftedErrors:](self, "_isMatchingMIDDriftedErrorDictionary:ttrConfigMIDDriftedErrors:", *(void *)(*((void *)&v17 + 1) + 8 * i), v9, (void)v17))
        {
          BOOL v15 = 1;
          goto LABEL_18;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_18:

  return v15;
}

- (id)_defaultMIDInvalidatedTTRConfig
{
  return &off_10023B620;
}

- (BOOL)_isMatchingMIDDriftedErrorDictionary:(id)a3 ttrConfigMIDDriftedErrors:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100097CC4;
  v9[3] = &unk_10022A580;
  id v10 = a3;
  id v5 = v10;
  id v6 = objc_msgSend(a4, "aaf_filter:", v9);
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (id)_normalizedMIDDriftedError:(id)a3 underlyingLevel:(unint64_t)a4 midDriftedErrorDict:(id)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a4)
  {
    id v10 = v8;
    id v11 = a5;
    id v12 = +[NSString stringWithFormat:@"uec%lu", a4];
    id v9 = v10;
    uint64_t v13 = +[NSString stringWithFormat:@"ued%lu", a4];
    v42[0] = v12;
    id v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 code]);
    BOOL v15 = [v14 stringValue];
    v42[1] = v13;
    v43[0] = v15;
    unsigned __int8 v16 = [v9 domain];
    v43[1] = v16;
    long long v17 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  }
  else
  {
    v44[0] = @"ec";
    id v18 = a5;
    id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 code]);
    uint64_t v13 = [v12 stringValue];
    v44[1] = @"ed";
    v45[0] = v13;
    id v14 = [v9 domain];
    v45[1] = v14;
    long long v17 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  }

  long long v19 = objc_msgSend(a5, "aaf_dictionaryByAddingEntriesFromDictionary:", v17);

  long long v20 = [v9 underlyingErrors];
  id v21 = [v20 count];

  if (a4 <= 1 && v21)
  {
    v34 = v17;
    v35 = v9;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v22 = [v9 underlyingErrors];
    id v23 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v37;
      unint64_t v26 = a4 + 1;
      id v27 = &__NSArray0__struct;
      do
      {
        v28 = 0;
        v29 = v27;
        do
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          v30 = [(AKMIDValidator *)self _normalizedMIDDriftedError:*(void *)(*((void *)&v36 + 1) + 8 * (void)v28) underlyingLevel:v26 midDriftedErrorDict:v19];
          id v27 = [v29 arrayByAddingObjectsFromArray:v30];

          v28 = (char *)v28 + 1;
          v29 = v27;
        }
        while (v24 != v28);
        id v24 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v24);
    }
    else
    {
      id v27 = &__NSArray0__struct;
    }

    id v32 = v27;
    v31 = v32;
    long long v17 = v34;
    id v9 = v35;
  }
  else
  {
    v40 = v19;
    v31 = +[NSArray arrayWithObjects:&v40 count:1];
    id v32 = &__NSArray0__struct;
  }

  return v31;
}

- (BOOL)_setLastKnownMID:(id)a3 keychainError:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(AKMIDKeychain *)self->_midKeychain updateLastKnownMID:v6 error:a4];
  if (v7)
  {
    id v8 = (NSString *)[v6 copy];
    lastKnownMID = self->_lastKnownMID;
    self->_lastKnownMID = v8;
  }
  return v7;
}

- (id)_createErrorWithMIDDriftUnderlyingError:(id)a3 anisetteFetchError:(id)a4
{
  id v5 = a3;
  id v6 = [a4 userInfo];
  BOOL v7 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if ([v7 isAccountNotProvisioned])
  {
    id v8 = v5;
  }
  else
  {
    id v8 = +[NSError ak_generalErrorWithCode:-8023 errorDomain:AKAnisetteErrorDomain underlyingError:v5];
  }
  id v9 = v8;

  return v9;
}

- (NSString)lastKnownMID
{
  return self->_lastKnownMID;
}

- (void)setLastKnownMID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownMID, 0);

  objc_storeStrong((id *)&self->_midKeychain, 0);
}

@end