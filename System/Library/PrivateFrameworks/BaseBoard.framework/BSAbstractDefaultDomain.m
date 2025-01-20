@interface BSAbstractDefaultDomain
+ (BOOL)__useDynamicMethodResolution;
+ (void)initialize;
- (BSAbstractDefaultDomain)init;
- (id)_defaultKeyFromPropertyName:(id)a1;
- (id)_initWithDefaults:(id)a3;
- (id)_initWithDomain:(id)a3;
- (id)_propertyFromSelector:(uint64_t)a1;
- (id)_store;
- (id)description;
- (id)observeDefault:(id)a3 onQueue:(id)a4 withBlock:(id)a5;
- (id)observeDefaults:(id)a3 onQueue:(id)a4 withBlock:(id)a5;
- (void)_addObserver:(uint64_t)a1;
- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4;
- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4 toDefaultValue:(id)a5;
- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4 toDefaultValue:(id)a5 options:(unint64_t)a6;
- (void)_removeObserver:(uint64_t)a1;
- (void)_setUserDefaults:(id)a3;
- (void)dealloc;
- (void)resetAllDefaults;
- (void)synchronizeDefaults;
@end

@implementation BSAbstractDefaultDomain

- (id)_store
{
  return self->_userDefaults;
}

- (id)_propertyFromSelector:(uint64_t)a1
{
  if (a1)
  {
    if (!aSelector)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:sel__propertyFromSelector_, a1, @"BSAbstractDefaultDomain.m", 334, @"Invalid parameter not satisfying: %@", @"selector" object file lineNumber description];
    }
    v4 = NSStringFromSelector(aSelector);
    if ([v4 hasSuffix:@":"])
    {
      uint64_t v5 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);

      v4 = (void *)v5;
    }
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = __getMetadataForClass(v6);
    v8 = (void *)v7;
    if (v7) {
      v9 = *(void **)(v7 + 24);
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
    v11 = [v10 objectForKey:v4];

    if (!v11)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      [v14 handleFailureInMethod:sel__propertyFromSelector_, a1, @"BSAbstractDefaultDomain.m", 344, @"Unable to resolve property metadata for selector: '%@' on class: %@", v4, v16 object file lineNumber description];
    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (void)initialize
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4 = -[BSAbstractDefaultDomainClassMetadata initWithClass:]([BSAbstractDefaultDomainClassMetadata alloc], v3);
    id v94 = v4;
    if (v4) {
      v4 = (void *)v4[1];
    }
    uint64_t v5 = NSStringFromClass((Class)v4);
    if (v94) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      pthread_mutex_lock(&__classNameToSelectorLock);
      uint64_t v7 = (void *)qword_1EB21B148;
      if (!qword_1EB21B148)
      {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v9 = (void *)qword_1EB21B148;
        qword_1EB21B148 = (uint64_t)v8;

        uint64_t v7 = (void *)qword_1EB21B148;
      }
      [v7 setObject:v94 forKey:v5];
      pthread_mutex_unlock(&__classNameToSelectorLock);
    }

    if (objc_msgSend(a1, "__useDynamicMethodResolution"))
    {
      v96 = v94;
      uint64_t v92 = self;
      if (v94) {
        id v10 = (objc_class *)v96[1];
      }
      else {
        id v10 = 0;
      }
      outCount[0] = 0;
      v95 = class_copyPropertyList(v10, outCount);
      if (outCount[0])
      {
        uint64_t v11 = 0;
        aClass = v10;
        while (1)
        {
          v12 = v95[v11];
          uint64_t v13 = [NSString stringWithUTF8String:property_getName(v12)];
          v100 = (void *)v13;
          self;
          if (qword_1EB21B140 != -1) {
            dispatch_once(&qword_1EB21B140, &__block_literal_global_12);
          }
          id v14 = (id)_MergedGlobals_14;
          char v15 = [v14 containsObject:v13];

          if (v15) {
            goto LABEL_56;
          }
          uint64_t v16 = self;
          v17 = [NSString stringWithUTF8String:property_getName(v12)];
          if (!v17)
          {
            v58 = [MEMORY[0x1E4F28B00] currentHandler];
            [v58 handleFailureInMethod:sel___getPropertyMetadataForProperty_class_ object:v16 file:@"BSAbstractDefaultDomain.m" lineNumber:389 description:@"Property name required."];

            v17 = 0;
          }
          id v18 = v17;
          v19 = property_copyAttributeValue(v12, "G");
          id newValue = v18;
          if (v19)
          {
            id newValue = [NSString stringWithUTF8String:v19];

            free(v19);
          }
          v20 = NSString;
          v21 = [v18 substringToIndex:1];
          v22 = [v21 capitalizedString];
          v23 = [v18 substringFromIndex:1];
          v24 = [v20 stringWithFormat:@"set%@%@", v22, v23];

          v25 = property_copyAttributeValue(v12, "S");
          if (v25)
          {
            v26 = [NSString stringWithUTF8String:v25];
            uint64_t v27 = objc_msgSend(v26, "substringToIndex:", objc_msgSend(v26, "length") - 1);

            free(v25);
            v24 = (void *)v27;
          }
          v28 = property_copyAttributeValue(v12, "T");
          v29 = [NSString stringWithUTF8String:v28];
          if (!v28)
          {
            v59 = [MEMORY[0x1E4F28B00] currentHandler];
            v60 = NSStringFromClass(aClass);
            [v59 handleFailureInMethod:sel___getPropertyMetadataForProperty_class_, v16, @"BSAbstractDefaultDomain.m", 411, @"Property type must be non-nil for property: %@ on class: %@", v18, v60 object file lineNumber description];
          }
          char v30 = [v29 characterAtIndex:0];
          v31 = [v29 substringFromIndex:1];
          if (v30 == 99) {
            break;
          }
          if (v30 != 64 || (unint64_t)[v29 length] < 2) {
            goto LABEL_59;
          }
          id v32 = v31;
          uint64_t v33 = self;
          uint64_t v34 = [v32 length];
          if ([v32 characterAtIndex:0] != 34
            || [v32 characterAtIndex:v34 - 1] != 34
            || (objc_msgSend(v32, "substringWithRange:", 1, v34 - 2),
                v91 = (NSString *)objc_claimAutoreleasedReturnValue(),
                Class v35 = NSClassFromString(v91),
                v91,
                !v35))
          {
            v36 = [MEMORY[0x1E4F28B00] currentHandler];
            [v36 handleFailureInMethod:sel___classFromPropertyType_, v33, @"BSAbstractDefaultDomain.m", 493, @"Expected a class from property type attribute, but found none <propertyType = %@>", v32 object file lineNumber description];

            Class v35 = 0;
          }
          v37 = v35;

          if (!v28) {
            goto LABEL_36;
          }
LABEL_35:
          free(v28);
LABEL_36:
          self;
          uint64_t v38 = 0;
          unsigned int v39 = v30 - 64;
          if (v39 <= 0x33)
          {
            if (((1 << v39) & 0xA1250000A1204) != 0) {
              goto LABEL_38;
            }
            if (v30 == 64)
            {
              if ((objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37)
              {
                if ((objc_class *)objc_opt_class() == v37)
                {
                  v57 = BSLogCommon();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_18AAA8000, v57, OS_LOG_TYPE_ERROR, "Warning: NSObject not explicitly supported because must be a plistable type.", buf, 2u);
                  }
                }
                uint64_t v38 = 0;
                goto LABEL_41;
              }
LABEL_38:
              v40 = objc_alloc_init(BSPropertyMetadata);
              uint64_t v38 = (uint64_t)v40;
              if (v40)
              {
                objc_setProperty_nonatomic_copy(v40, v41, v18, 48);
                objc_setProperty_nonatomic_copy((id)v38, v42, newValue, 32);
                objc_setProperty_nonatomic_copy((id)v38, v43, v24, 40);
                *(unsigned char *)(v38 + 8) = v30;
                objc_setProperty_nonatomic_copy((id)v38, v44, v31, 16);
              }
              -[BSPropertyMetadata setClassType:](v38, v37);
            }
          }
LABEL_41:

          if (!v38)
          {
            v61 = [MEMORY[0x1E4F28B00] currentHandler];
            v62 = NSStringFromClass(aClass);
            [v61 handleFailureInMethod:sel___processPropertyMetadata_, v92, @"BSAbstractDefaultDomain.m", 372, @"Metadata required but not obtained for property with name: %@ [class=%@]", v100, v62 object file lineNumber description];
          }
          if (v94) {
            v45 = (void *)v96[2];
          }
          else {
            v45 = 0;
          }
          id v46 = v45;
          if (v38) {
            v47 = *(void **)(v38 + 48);
          }
          else {
            v47 = 0;
          }
          id v48 = v47;
          [v46 setObject:v38 forKey:v48];

          if (v94) {
            v49 = (void *)v96[3];
          }
          else {
            v49 = 0;
          }
          id v50 = v49;
          if (v38) {
            v51 = *(void **)(v38 + 32);
          }
          else {
            v51 = 0;
          }
          id v52 = v51;
          [v50 setObject:v38 forKey:v52];

          if (v94) {
            v53 = (void *)v96[3];
          }
          else {
            v53 = 0;
          }
          id v54 = v53;
          if (v38) {
            v55 = *(void **)(v38 + 40);
          }
          else {
            v55 = 0;
          }
          id v56 = v55;
          [v54 setObject:v38 forKey:v56];

LABEL_56:
          if (++v11 >= (unint64_t)outCount[0]) {
            goto LABEL_82;
          }
        }
        [MEMORY[0x1E4F1CA00] raise:@"BSUnsupportedTypeException" format:@"Character types are explicitly unsupported in the default domain at this time."];
LABEL_59:
        v37 = 0;
        if (!v28) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      if (v95) {
LABEL_82:
      }
        free(v95);

      v93 = v96;
      uint64_t v97 = self;
      if (v94)
      {
        v64 = (objc_class *)v93[1];
        v63 = (void *)v93[2];
      }
      else
      {
        v64 = 0;
        v63 = 0;
      }
      id v65 = v63;
      v66 = [v65 allValues];

      long long v104 = 0u;
      long long v105 = 0u;
      *(_OWORD *)buf = 0u;
      long long v103 = 0u;
      id newValuea = v66;
      uint64_t v67 = [newValuea countByEnumeratingWithState:buf objects:outCount count:16];
      if (v67)
      {
        uint64_t v101 = *(void *)v103;
        do
        {
          uint64_t v68 = 0;
          do
          {
            if (*(void *)v103 != v101) {
              objc_enumerationMutation(newValuea);
            }
            uint64_t v69 = *(void *)(*(void *)&buf[8] + 8 * v68);
            if (v69) {
              v70 = *(void **)(v69 + 32);
            }
            else {
              v70 = 0;
            }
            v71 = v70;
            v72 = NSSelectorFromString(v71);

            if (v69) {
              v73 = *(void **)(v69 + 40);
            }
            else {
              v73 = 0;
            }
            v74 = NSString;
            id v75 = v73;
            v76 = [v74 stringWithFormat:@"%@:", v75];
            v77 = NSSelectorFromString(v76);

            if (!v69)
            {
LABEL_110:
              v81 = [MEMORY[0x1E4F28B00] currentHandler];
              [v81 handleFailureInMethod:sel___assignPropertyImplementations_ object:v97 file:@"BSAbstractDefaultDomain.m" lineNumber:592 description:@"Should always have a getter and setter available."];

              goto LABEL_126;
            }
            uint64_t v78 = *(char *)(v69 + 8);
            v79 = (void (*)(void))sbDefaults_setBool;
            v80 = (void (*)(void))sbDefaults_getBool;
            if ((int)v78 > 99)
            {
              switch(*(unsigned char *)(v69 + 8))
              {
                case 'd':
                  v79 = (void (*)(void))sbDefaults_setDouble;
                  v80 = (void (*)(void))sbDefaults_getDouble;
                  break;
                case 'e':
                case 'g':
                case 'h':
                case 'j':
                case 'k':
                  goto LABEL_110;
                case 'f':
                  v79 = (void (*)(void))sbDefaults_setFloat;
                  v80 = (void (*)(void))sbDefaults_getFloat;
                  break;
                case 'i':
                  v79 = (void (*)(void))sbDefaults_setInt;
                  v80 = (void (*)(void))sbDefaults_getInt;
                  break;
                case 'l':
                  v79 = (void (*)(void))sbDefaults_setLong;
                  v80 = (void (*)(void))sbDefaults_getLong;
                  break;
                default:
                  if (v78 == 113)
                  {
                    v79 = (void (*)(void))sbDefaults_setLongLong;
                    v80 = (void (*)(void))sbDefaults_getLongLong;
                  }
                  else
                  {
                    if (v78 != 115) {
                      goto LABEL_110;
                    }
                    v79 = (void (*)(void))sbDefaults_setShort;
                    v80 = (void (*)(void))sbDefaults_getShort;
                  }
                  break;
              }
            }
            else if ((int)v78 > 75)
            {
              switch(v78)
              {
                case 'L':
                  v79 = (void (*)(void))sbDefaults_setUnsignedLong;
                  v80 = (void (*)(void))sbDefaults_getUnsignedLong;
                  break;
                case 'Q':
                  v79 = (void (*)(void))sbDefaults_setUnsignedLongLong;
                  v80 = (void (*)(void))sbDefaults_getUnsignedLongLong;
                  break;
                case 'S':
                  v79 = (void (*)(void))sbDefaults_setUnsignedShort;
                  v80 = (void (*)(void))sbDefaults_getUnsignedShort;
                  break;
                default:
                  goto LABEL_110;
              }
            }
            else
            {
              if (v78 == 64)
              {
                uint64_t v82 = *(void *)(v69 + 24);
                uint64_t v83 = objc_opt_class();
                if (v82 == v83) {
                  v84 = (void (*)(void))sbDefaults_getURL;
                }
                else {
                  v84 = (void (*)(void))sbDefaults_getObject;
                }
                if (v82 == v83) {
                  v79 = (void (*)(void))sbDefaults_setURL;
                }
                else {
                  v79 = (void (*)(void))sbDefaults_setObject;
                }
                uint64_t v78 = *(char *)(v69 + 8);
                goto LABEL_125;
              }
              if (v78 != 66)
              {
                if (v78 != 73) {
                  goto LABEL_110;
                }
                v79 = (void (*)(void))sbDefaults_setUnsignedInt;
                v80 = (void (*)(void))sbDefaults_getUnsignedInt;
              }
            }
            v84 = v80;
LABEL_125:
            objc_msgSend(NSString, "stringWithFormat:", @"%c@:", v78);
            id v85 = objc_claimAutoreleasedReturnValue();
            v86 = (const char *)[v85 UTF8String];

            class_addMethod(v64, v72, v84, v86);
            objc_msgSend(NSString, "stringWithFormat:", @"v@:%c", *(char *)(v69 + 8));
            id v87 = objc_claimAutoreleasedReturnValue();
            v88 = (const char *)[v87 UTF8String];

            class_addMethod(v64, v77, v79, v88);
LABEL_126:
            ++v68;
          }
          while (v67 != v68);
          uint64_t v89 = [newValuea countByEnumeratingWithState:buf objects:outCount count:16];
          uint64_t v67 = v89;
        }
        while (v89);
      }
    }
  }
}

- (id)_initWithDefaults:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BSAbstractDefaultDomain;
  BOOL v6 = [(BSAbstractDefaultDomain *)&v32 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    defaultKeyToDefaultValue = v7->_defaultKeyToDefaultValue;
    v7->_defaultKeyToDefaultValue = v8;

    dispatch_queue_t Serial = BSDispatchQueueCreateSerial(@"observerQueue");
    observerQueue = v7->_observerQueue;
    v7->_observerQueue = (OS_dispatch_queue *)Serial;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observerQueue_observers = v7->_observerQueue_observers;
    v7->_observerQueue_observers = v12;

    if (!v7->_boundDefaults)
    {
      if (objc_msgSend((id)objc_opt_class(), "__useDynamicMethodResolution"))
      {
        [(BSAbstractDefaultDomain *)v7 _bindAndRegisterDefaults];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = __getMetadataForClass(v14);
        uint64_t v16 = (void *)v15;
        if (v15) {
          v17 = *(void **)(v15 + 16);
        }
        else {
          v17 = 0;
        }
        id v18 = v17;
        v19 = [v18 allValues];

        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v34;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v34 != v21) {
                objc_enumerationMutation(v19);
              }
              uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * v22);
              if (v23) {
                v24 = *(void **)(v23 + 56);
              }
              else {
                v24 = 0;
              }
              id v25 = v24;
              BOOL v26 = v25 == 0;

              if (v26)
              {
                uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
                if (v23) {
                  v28 = *(void **)(v23 + 48);
                }
                else {
                  v28 = 0;
                }
                id v29 = v28;
                [v27 handleFailureInMethod:sel__bindDefaultsIfNecessary, v7, @"BSAbstractDefaultDomain.m", 315, @"Expected default key specified for property: %@.  Use BIND_DEFAULT_AND_KEY to assign it.", v29 object file lineNumber description];
              }
              ++v22;
            }
            while (v20 != v22);
            uint64_t v30 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
            uint64_t v20 = v30;
          }
          while (v30);
        }

        [(NSUserDefaults *)v7->_userDefaults registerDefaults:v7->_defaultKeyToDefaultValue];
      }
      v7->_boundDefaults = 1;
    }
  }

  return v7;
}

- (BSAbstractDefaultDomain)init
{
  return (BSAbstractDefaultDomain *)[(BSAbstractDefaultDomain *)self _initWithDomain:0];
}

- (id)_initWithDomain:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BSAbstractDefaultDomain.m", 135, @"Invalid parameter not satisfying: %@", @"domain" object file lineNumber description];
  }
  BOOL v6 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v7 = [v6 bundleIdentifier];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v5];
  }
  id v10 = v9;
  objc_msgSend(v9, "bs_setDomain:", v5);
  id v11 = [(BSAbstractDefaultDomain *)self _initWithDefaults:v10];

  return v11;
}

- (void)dealloc
{
  [(NSMutableSet *)self->_observerQueue_observers removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)BSAbstractDefaultDomain;
  [(BSAbstractDefaultDomain *)&v3 dealloc];
}

- (void)synchronizeDefaults
{
}

- (id)observeDefault:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObject:a3];
  id v11 = [(BSAbstractDefaultDomain *)self observeDefaults:v10 onQueue:v8 withBlock:v9];

  return v11;
}

- (id)observeDefaults:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = -[_BSDefaultObserver initWithAbstractDefaultDomain:defaultsToObserve:onQueue:withBlock:]([_BSDefaultObserver alloc], self, v8, v9, v10);

  return v11;
}

- (void)resetAllDefaults
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(BSAbstractDefaultDomain *)self _store];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __getMetadataForClass(v3);
  id v5 = (void *)v4;
  if (v4) {
    BOOL v6 = *(void **)(v4 + 16);
  }
  else {
    BOOL v6 = 0;
  }
  id v7 = v6;
  id v8 = objc_msgSend(v7, "allValues", (void)v14);

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v12) {
          v12 = (void *)v12[7];
        }
        uint64_t v13 = v12;
        [v2 removeObjectForKey:v13];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_addObserver:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && v3)
  {
    id v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__BSAbstractDefaultDomain__addObserver___block_invoke;
    v6[3] = &unk_1E54456B8;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

uint64_t __40__BSAbstractDefaultDomain__addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)_removeObserver:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && v3)
  {
    id v5 = *(NSObject **)(a1 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__BSAbstractDefaultDomain__removeObserver___block_invoke;
    v6[3] = &unk_1E54456B8;
    v6[4] = a1;
    id v7 = v3;
    dispatch_sync(v5, v6);
  }
}

uint64_t __43__BSAbstractDefaultDomain__removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 32);
    return [v4 removeObject:v3];
  }
  return result;
}

- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4
{
}

- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4 toDefaultValue:(id)a5
{
}

- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4 toDefaultValue:(id)a5 options:(unint64_t)a6
{
  id v25 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v25)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BSAbstractDefaultDomain.m", 217, @"Invalid parameter not satisfying: %@", @"propertyName" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"BSAbstractDefaultDomain.m", 218, @"Invalid parameter not satisfying: %@", @"defaultKey" object file lineNumber description];

LABEL_3:
  if (self->_boundDefaults)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"BSAbstractDefaultDomain.m" lineNumber:223 description:@"Cannot bind new defaults after we've registered them."];
    goto LABEL_10;
  }
  long long v14 = (objc_class *)objc_opt_class();
  uint64_t v15 = __getMetadataForClass(v14);
  long long v16 = (void *)v15;
  if (v15) {
    long long v17 = *(void **)(v15 + 16);
  }
  else {
    long long v17 = 0;
  }
  id v18 = v17;
  uint64_t v13 = [v18 objectForKey:v25];

  if (v13)
  {
    objc_setProperty_nonatomic_copy(v13, v19, v11, 56);
    -[BSPropertyMetadata setDefaultValue:]((uint64_t)v13, v12);
    v13[9] = a6;
    if (!v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v23 = (objc_class *)objc_opt_class();
  v24 = NSStringFromClass(v23);
  [v22 handleFailureInMethod:a2, self, @"BSAbstractDefaultDomain.m", 228, @"Must have a property to bind to, but didn't find one for property: %@ [Class=%@]", v25, v24 object file lineNumber description];

  -[BSPropertyMetadata setDefaultValue:](0, v12);
  if (v12) {
LABEL_9:
  }
    [(NSMutableDictionary *)self->_defaultKeyToDefaultValue setObject:v12 forKey:v11];
LABEL_10:
}

- (id)description
{
  uint64_t v3 = @"\t";
  if (self)
  {
    uint64_t v4 = +[BSDescriptionBuilder builderWithObject:self];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __65__BSAbstractDefaultDomain_descriptionBuilderWithMultilinePrefix___block_invoke;
    long long v14 = &unk_1E54456B8;
    uint64_t v15 = self;
    id v5 = v4;
    id v16 = v5;
    id v6 = (id)[v5 modifyBody:&v11];
    id v7 = v16;
    id v8 = v5;

    uint64_t v9 = objc_msgSend(v8, "build", v11, v12, v13, v14, v15);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __65__BSAbstractDefaultDomain_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = __getMetadataForClass(v2);
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = *(void **)(v3 + 16);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = [v6 allValues];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
        if (v12) {
          uint64_t v13 = *(void **)(v12 + 48);
        }
        else {
          uint64_t v13 = 0;
        }
        id v14 = v13;
        uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v14, (void)v24);
        id v16 = v15;
        if (v12 && *(unsigned char *)(v12 + 8) == 66)
        {
          id v17 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(v15, "BOOLValue"), v14);
        }
        else if (v15)
        {
          id v18 = (id)[*(id *)(a1 + 40) appendObject:v15 withName:v14];
        }
        else
        {
          BOOL v19 = -[BSPropertyMetadata isNumber](v12);
          uint64_t v20 = *(void **)(a1 + 40);
          if (v19) {
            id v21 = (id)[v20 appendInt:0 withName:v14];
          }
          else {
            id v22 = (id)[v20 appendObject:@"nil" withName:v14];
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v23 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v9 = v23;
    }
    while (v23);
  }
}

- (void)_setUserDefaults:(id)a3
{
  id v5 = (NSUserDefaults *)a3;
  userDefaults = self->_userDefaults;
  p_userDefaults = &self->_userDefaults;
  if (userDefaults != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_userDefaults, a3);
    id v5 = v8;
  }
}

- (id)_defaultKeyFromPropertyName:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = __getMetadataForClass(v4);
    id v6 = (void *)v5;
    if (v5) {
      id v7 = *(void **)(v5 + 16);
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    uint64_t v9 = [v8 objectForKey:v3];

    if (v9)
    {
      uint64_t v10 = (void *)v9[7];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      [v12 handleFailureInMethod:sel__defaultKeyFromPropertyName_, a1, @"BSAbstractDefaultDomain.m", 328, @"Must have property for default: '%@' on class: %@", v3, v14 object file lineNumber description];

      uint64_t v10 = 0;
    }
    a1 = v10;
  }
  return a1;
}

void __47__BSAbstractDefaultDomain___excludedProperties__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED784938];
  v1 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = v0;
}

+ (BOOL)__useDynamicMethodResolution
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultKeyToDefaultValue, 0);
  objc_storeStrong((id *)&self->_observerQueue_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end