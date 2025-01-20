@interface PDUserDefaults
+ (BOOL)isInternalOSVariant;
+ (id)configurationDictionary;
+ (id)sharedDefaults;
+ (void)removeSharedDefaults;
- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (BOOL)enableResponseStreaming;
- (BOOL)enableVerboseLogging;
- (BOOL)restoreCurrentDefaults;
- (BOOL)setValue:(id)a3 forDefaultNamed:(id)a4 error:(id *)a5;
- (BOOL)unprotected_BOOLForKey:(id)a3 defaultValue:(BOOL)a4;
- (PDUserDefaults)init;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueForDefaultNamed:(id)a3;
- (void)resetUserDefaultsIfAllowed;
- (void)restoreFromDictionaryRepresentation:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setEnableResponseStreaming:(BOOL)a3;
- (void)setEnableVerboseLogging:(BOOL)a3;
- (void)setRestoreCurrentDefaults:(BOOL)a3;
- (void)unprotected_setBool:(BOOL)a3 forKey:(id)a4;
- (void)unprotected_writeToBackingStore;
- (void)updateFromBackingStore;
@end

@implementation PDUserDefaults

+ (id)sharedDefaults
{
  os_unfair_lock_lock(&stru_10023E594);
  if ((byte_10023E590 & 1) == 0)
  {
    v2 = objc_alloc_init(PDUserDefaults);
    v3 = (void *)qword_10023E598;
    qword_10023E598 = (uint64_t)v2;

    byte_10023E590 = 1;
  }
  os_unfair_lock_unlock(&stru_10023E594);
  v4 = (void *)qword_10023E598;

  return v4;
}

- (BOOL)enableVerboseLogging
{
  return self->_enableVerboseLogging;
}

+ (id)configurationDictionary
{
  if (qword_10023E5A8 != -1) {
    dispatch_once(&qword_10023E5A8, &stru_1001F40C0);
  }
  v2 = (void *)qword_10023E5A0;

  return v2;
}

+ (void)removeSharedDefaults
{
  os_unfair_lock_lock(&stru_10023E594);
  v2 = (void *)qword_10023E598;
  qword_10023E598 = 0;

  byte_10023E590 = 0;

  os_unfair_lock_unlock(&stru_10023E594);
}

- (PDUserDefaults)init
{
  v47.receiver = self;
  v47.super_class = (Class)PDUserDefaults;
  v2 = [(PDUserDefaults *)&v47 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_16;
  }
  v2->_lock._os_unfair_lock_opaque = 0;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  backingStoreDictionary = v3->_backingStoreDictionary;
  v3->_backingStoreDictionary = (NSMutableDictionary *)v4;

  v6 = sub_1000D0CEC();
  uint64_t v7 = sub_1000D1450((uint64_t)v6);
  defaultsFileURL = v3->_defaultsFileURL;
  v3->_defaultsFileURL = (NSURL *)v7;

  v9 = +[NSData dataWithContentsOfURL:v3->_defaultsFileURL];
  if (v9)
  {
    v10 = +[NSPropertyListSerialization propertyListWithData:v9 options:2 format:0 error:0];
    if ([v10 count])
    {
      v11 = +[PDUserDefaults configurationDictionary];
      v12 = [v11 keysOfEntriesPassingTest:&stru_1001F4100];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v13 = v12;
      id v14 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v42;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
            v19 = objc_msgSend(v10, "objectForKeyedSubscript:", v18, (void)v41);
            if (v19) {
              [(NSMutableDictionary *)v3->_backingStoreDictionary setObject:v19 forKeyedSubscript:v18];
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v41 objects:v52 count:16];
        }
        while (v15);
      }
    }
    id v20 = 0;
    goto LABEL_15;
  }
  v30 = v3->_backingStoreDictionary;
  id v46 = 0;
  v9 = +[NSPropertyListSerialization dataWithPropertyList:v30 format:200 options:0 error:&v46];
  id v31 = v46;
  v32 = v31;
  if (!v9)
  {
    CLSInitLog();
    v36 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v37 = v3->_backingStoreDictionary;
      *(_DWORD *)buf = 138412546;
      v54 = v37;
      __int16 v55 = 2112;
      id v56 = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to create backing store data for: %@. Cannot init PDUserDefaults. Error: %@", buf, 0x16u);
    }
    goto LABEL_25;
  }
  v33 = v3->_defaultsFileURL;
  id v45 = v31;
  unsigned __int8 v34 = [v9 writeToURL:v33 options:1 error:&v45];
  id v20 = v45;

  if ((v34 & 1) == 0)
  {
    CLSInitLog();
    v35 = (void *)CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
    {
      v38 = v3->_defaultsFileURL;
      v39 = v35;
      v40 = [(NSURL *)v38 path];
      *(_DWORD *)buf = 138412546;
      v54 = v40;
      __int16 v55 = 2112;
      id v56 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to write backing store data to: %@. Cannot init PDUserDefaults. Error: %@", buf, 0x16u);
    }
    v32 = v20;
LABEL_25:

    v28 = 0;
    goto LABEL_17;
  }
LABEL_15:
  [(PDUserDefaults *)v3 updateFromBackingStore];
  uint64_t v21 = CLSUserDefaultRestoreCurrentDefaults;
  uint64_t v22 = CLSUserDefaultEnableVerboseLogging;
  v50[0] = CLSUserDefaultRestoreCurrentDefaults;
  v50[1] = CLSUserDefaultEnableVerboseLogging;
  v51[0] = @"setRestoreCurrentDefaults:";
  v51[1] = @"setEnableVerboseLogging:";
  uint64_t v23 = CLSUserDefaultEnableResponseStreaming;
  v50[2] = CLSUserDefaultEnableResponseStreaming;
  v51[2] = @"setEnableResponseStreaming:";
  uint64_t v24 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:3];
  setterNames = v3->_setterNames;
  v3->_setterNames = (NSDictionary *)v24;

  v48[0] = v21;
  v48[1] = v22;
  v49[0] = @"restoreCurrentDefaults";
  v49[1] = @"enableVerboseLogging";
  v48[2] = v23;
  v49[2] = @"enableResponseStreaming";
  uint64_t v26 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:3];
  getterNames = v3->_getterNames;
  v3->_getterNames = (NSDictionary *)v26;

LABEL_16:
  v28 = v3;
LABEL_17:

  return v28;
}

- (void)resetUserDefaultsIfAllowed
{
  if (!self->_restoreCurrentDefaults)
  {
    CLSInitLog();
    v3 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "resetting user defaults", v4, 2u);
    }
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_backingStoreDictionary removeAllObjects];
    [(PDUserDefaults *)self unprotected_writeToBackingStore];
    os_unfair_lock_unlock(&self->_lock);
    [(PDUserDefaults *)self updateFromBackingStore];
  }
}

- (void)updateFromBackingStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_defaultsFileURL) {
    [(NSMutableDictionary *)self->_backingStoreDictionary removeAllObjects];
  }
  self->_restoreCurrentDefaults = [(PDUserDefaults *)self unprotected_BOOLForKey:CLSUserDefaultRestoreCurrentDefaults defaultValue:1];
  self->_enableVerboseLogging = [(PDUserDefaults *)self unprotected_BOOLForKey:CLSUserDefaultEnableVerboseLogging defaultValue:0];
  self->_enableResponseStreaming = [(PDUserDefaults *)self unprotected_BOOLForKey:CLSUserDefaultEnableResponseStreaming defaultValue:0];

  os_unfair_lock_unlock(p_lock);
}

- (void)restoreFromDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = +[PDUserDefaults configurationDictionary];
  os_unfair_lock_lock(&self->_lock);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [v4 keyEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [v5 objectForKeyedSubscript:v11];
        unsigned int v13 = [v12 BOOLValue];

        if (v13)
        {
          id v14 = [v4 objectForKeyedSubscript:v11];
          -[PDUserDefaults unprotected_setBool:forKey:](self, "unprotected_setBool:forKey:", [v14 BOOLValue], v11);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)unprotected_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  backingStoreDictionary = self->_backingStoreDictionary;
  if (backingStoreDictionary)
  {
    v6 = [(NSMutableDictionary *)backingStoreDictionary objectForKeyedSubscript:a3];
    id v7 = v6;
    if (v6) {
      a4 = [v6 BOOLValue];
    }
  }
  return a4;
}

- (BOOL)BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v4) = [(PDUserDefaults *)self unprotected_BOOLForKey:v7 defaultValue:v4];

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)unprotected_writeToBackingStore
{
  if (self->_defaultsFileURL)
  {
    backingStoreDictionary = self->_backingStoreDictionary;
    id v17 = 0;
    BOOL v4 = +[NSPropertyListSerialization dataWithPropertyList:backingStoreDictionary format:200 options:0 error:&v17];
    id v5 = v17;
    v6 = v5;
    if (v4)
    {
      defaultsFileURL = self->_defaultsFileURL;
      id v16 = v5;
      unsigned __int8 v8 = [v4 writeToURL:defaultsFileURL options:1 error:&v16];
      id v9 = v16;

      if ((v8 & 1) == 0)
      {
        CLSInitLog();
        v10 = (void *)CLSLogDefault;
        if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          unsigned int v13 = self->_defaultsFileURL;
          id v14 = v10;
          long long v15 = [(NSURL *)v13 path];
          *(_DWORD *)buf = 138412546;
          v19 = v15;
          __int16 v20 = 2112;
          id v21 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to write backing store data to: %@. Error: %@", buf, 0x16u);
        }
      }
      v6 = v9;
    }
    else
    {
      CLSInitLog();
      uint64_t v11 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_backingStoreDictionary;
        *(_DWORD *)buf = 138412546;
        v19 = v12;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to serialize user defaults %@. Error: %@", buf, 0x16u);
      }
    }
  }
}

- (void)unprotected_setBool:(BOOL)a3 forKey:(id)a4
{
  if (self->_backingStoreDictionary)
  {
    BOOL v4 = a3;
    id v6 = a4;
    id v7 = +[NSNumber numberWithBool:v4];
    [(NSMutableDictionary *)self->_backingStoreDictionary setObject:v7 forKeyedSubscript:v6];

    [(PDUserDefaults *)self unprotected_writeToBackingStore];
  }
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  [(PDUserDefaults *)self unprotected_setBool:v4 forKey:v7];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)restoreCurrentDefaults
{
  return self->_restoreCurrentDefaults;
}

- (void)setRestoreCurrentDefaults:(BOOL)a3
{
  if (self->_restoreCurrentDefaults != a3)
  {
    self->_restoreCurrentDefaults = a3;
    -[PDUserDefaults setBool:forKey:](self, "setBool:forKey:");
  }
}

- (void)setEnableVerboseLogging:(BOOL)a3
{
  if (self->_enableVerboseLogging != a3)
  {
    self->_enableVerboseLogging = a3;
    -[PDUserDefaults setBool:forKey:](self, "setBool:forKey:");
  }
}

- (BOOL)enableResponseStreaming
{
  return self->_enableResponseStreaming;
}

- (void)setEnableResponseStreaming:(BOOL)a3
{
  if (self->_enableResponseStreaming != a3)
  {
    self->_enableResponseStreaming = a3;
    -[PDUserDefaults setBool:forKey:](self, "setBool:forKey:");
  }
}

+ (BOOL)isInternalOSVariant
{
  if (qword_10023E5B0 != -1) {
    dispatch_once(&qword_10023E5B0, &stru_1001F4120);
  }
  return byte_10023E591;
}

- (id)description
{
  v3 = +[NSMutableString stringWithString:@"{\n"];
  uint64_t v4 = CLSUserDefaultRestoreCurrentDefaults;
  if ([(PDUserDefaults *)self restoreCurrentDefaults]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"  %@ : %@\n", v4, v5];
  uint64_t v6 = CLSUserDefaultEnableVerboseLogging;
  if ([(PDUserDefaults *)self enableVerboseLogging]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  [v3 appendFormat:@"  %@ : %@\n", v6, v7];
  uint64_t v8 = CLSUserDefaultEnableResponseStreaming;
  if ([(PDUserDefaults *)self enableResponseStreaming]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v3 appendFormat:@"  %@ : %@\n", v8, v9];
  [v3 appendString:@"}"];
  id v10 = [v3 copy];

  return v10;
}

- (id)dictionaryRepresentation
{
  v8[0] = CLSUserDefaultRestoreCurrentDefaults;
  v3 = +[NSNumber numberWithBool:[(PDUserDefaults *)self restoreCurrentDefaults]];
  v9[0] = v3;
  v8[1] = CLSUserDefaultEnableVerboseLogging;
  uint64_t v4 = +[NSNumber numberWithBool:[(PDUserDefaults *)self enableVerboseLogging]];
  v9[1] = v4;
  v8[2] = CLSUserDefaultEnableResponseStreaming;
  CFStringRef v5 = +[NSNumber numberWithBool:[(PDUserDefaults *)self enableResponseStreaming]];
  v9[2] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (BOOL)setValue:(id)a3 forDefaultNamed:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(id)objc_opt_class() configurationDictionary];
  uint64_t v11 = [v10 valueForKey:v9];
  v12 = v11;
  if (!v11)
  {
    if (a5)
    {
      CFStringRef v16 = @"invalid key";
LABEL_11:
      uint64_t v17 = 2;
      goto LABEL_12;
    }
LABEL_13:
    BOOL v15 = 0;
    goto LABEL_14;
  }
  if (([v11 BOOLValue] & 1) == 0)
  {
    if (a5)
    {
      CFStringRef v16 = @"value for key is not mutable";
      uint64_t v17 = 3;
LABEL_12:
      +[NSError cls_createErrorWithCode:v17 description:v16];
      BOOL v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unsigned int v13 = [(NSDictionary *)self->_setterNames objectForKeyedSubscript:v9];
  id v14 = NSSelectorFromString(v13);

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (a5)
    {
      CFStringRef v16 = @"cannot find setter for key";
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  objc_msgSend(self, v14, objc_msgSend(v8, "BOOLValue"));
  BOOL v15 = 1;
LABEL_14:

  return v15;
}

- (id)valueForDefaultNamed:(id)a3
{
  uint64_t v4 = [(NSDictionary *)self->_getterNames objectForKeyedSubscript:a3];
  CFStringRef v5 = NSSelectorFromString(v4);

  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [self v5]);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getterNames, 0);
  objc_storeStrong((id *)&self->_setterNames, 0);
  objc_storeStrong((id *)&self->_backingStoreDictionary, 0);

  objc_storeStrong((id *)&self->_defaultsFileURL, 0);
}

@end