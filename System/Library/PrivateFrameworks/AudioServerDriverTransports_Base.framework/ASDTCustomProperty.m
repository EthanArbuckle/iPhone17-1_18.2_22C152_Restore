@interface ASDTCustomProperty
+ (BOOL)automaticallyNotifiesObserversOfPropertyValue;
+ (BOOL)automaticallyNotifiesObserversOfValue;
+ (id)consolidatePList:(id)a3;
+ (id)customPropertyForConfig:(id)a3;
- (ASDTCustomProperty)initWithConfig:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5;
- (BOOL)checkAndSetPropertyValue:(id)a3;
- (BOOL)checkPropertyValue:(id)a3;
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (BOOL)includeValueInDescription;
- (BOOL)plistDeepCopyOnSet;
- (BOOL)propertyValueWasCached;
- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7;
- (BOOL)storePropertyValue:(id)a3;
- (BOOL)useCache;
- (NSData)dataNoCopy;
- (NSString)name;
- (id)cachedPropertyValue;
- (id)propertyName;
- (id)propertyValue;
- (id)retrievePropertyValue;
- (int)cacheMode;
- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4;
- (unsigned)propertyValueSize;
- (void)cachePropertyValue:(id)a3;
- (void)doCachePropertyValue:(id)a3;
- (void)releasePropertyValueCache;
- (void)setCacheMode:(int)a3;
- (void)setDataNoCopy:(id)a3;
- (void)setName:(id)a3;
- (void)setPlistDeepCopyOnSet:(BOOL)a3;
- (void)setPropertyValueSize:(unsigned int)a3;
- (void)setPropertyValueWasCached:(BOOL)a3;
- (void)setUseCache:(BOOL)a3;
@end

@implementation ASDTCustomProperty

+ (id)customPropertyForConfig:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)[v3 asdtSubclass];
  if ([(objc_class *)v4 isSubclassOfClass:objc_opt_class()]
    && ([(objc_class *)v4 conformsToProtocol:&unk_26FCAE808] & 1) != 0)
  {
    v5 = (void *)[[v4 alloc] initWithConfig:v3];
  }
  else
  {
    v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[ASDTCustomProperty customPropertyForConfig:](v3);
    }

    v5 = 0;
  }

  return v5;
}

- (ASDTCustomProperty)initWithConfig:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [v8 asdtPropertyAddress];
  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ASDTCustomProperty;
    v10 = [(ASDCustomProperty *)&v13 initWithAddress:v9 propertyDataType:v6 qualifierDataType:v5];
    if (v10)
    {
      -[ASDCustomProperty setSettable:](v10, "setSettable:", [v8 asdtIsSettable]);
      -[ASDTCustomProperty setCacheMode:](v10, "setCacheMode:", [v8 asdtPropertyCacheMode]);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)propertyName
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  if ([(ASDCustomProperty *)self selector] >> 29
    && [(ASDCustomProperty *)self selector] >> 24 <= 0x7E)
  {
    uint64_t v6 = [(ASDCustomProperty *)self selector] >> 24;
  }
  else
  {
    uint64_t v6 = 32;
  }
  if (([(ASDCustomProperty *)self selector] & 0xE00000) != 0
    && ([(ASDCustomProperty *)self selector] >> 16) <= 0x7Eu)
  {
    uint64_t v7 = ([(ASDCustomProperty *)self selector] >> 16);
  }
  else
  {
    uint64_t v7 = 32;
  }
  if (([(ASDCustomProperty *)self selector] & 0xE000) != 0
    && ((unsigned __int16)[(ASDCustomProperty *)self selector] >> 8) <= 0x7Eu)
  {
    uint64_t v8 = ((unsigned __int16)[(ASDCustomProperty *)self selector] >> 8);
  }
  else
  {
    uint64_t v8 = 32;
  }
  if (([(ASDCustomProperty *)self selector] & 0xE0) != 0
    && [(ASDCustomProperty *)self selector] <= 0x7Eu)
  {
    uint64_t v9 = [(ASDCustomProperty *)self selector];
  }
  else
  {
    uint64_t v9 = 32;
  }
  v10 = [v3 stringWithFormat:@"%@(%c%c%c%c)", v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)name
{
  name = self->_name;
  if (!name)
  {
    v4 = [(ASDTCustomProperty *)self propertyName];
    uint64_t v5 = self->_name;
    self->_name = v4;

    name = self->_name;
  }
  return name;
}

- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4
{
  unsigned int v5 = [(ASDCustomProperty *)self propertyDataType];
  unsigned int result = 8;
  if (v5 != 1667658612 && v5 != 1886155636)
  {
    if (v5 == 1918990199)
    {
      return [(ASDTCustomProperty *)self propertyValueSize];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  unsigned int v11 = [(ASDCustomProperty *)self propertyDataType];
  v12 = [(ASDTCustomProperty *)self propertyValue];
  objc_super v13 = v12;
  if (!v12) {
    goto LABEL_10;
  }
  switch(v11)
  {
    case 0x63667374u:
      goto LABEL_5;
    case 0x72617777u:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = ASDTBaseLogType();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[ASDTCustomProperty getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:]();
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = [MEMORY[0x263F08690] currentHandler];
          [v21 handleFailureInMethod:a2 object:self file:@"ASDTCustomProperty.m" lineNumber:130 description:@"inPropertyValue must be an NSData object"];
        }
      }
      id v18 = v13;
      unsigned int v19 = [v18 length];
      if (a5 && *a5 >= v19)
      {
        if (v19)
        {
          *a5 = v19;
          memcpy(a6, (const void *)[v18 bytes], v19);
          BOOL v15 = 1;
          goto LABEL_23;
        }
      }
      else
      {
        v20 = ASDTBaseLogType();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[ASDTCustomProperty getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:]();
        }
      }
      BOOL v15 = 0;
LABEL_23:

      goto LABEL_11;
    case 0x706C7374u:
LABEL_5:
      if (a5 && *a5 > 7)
      {
        *(void *)a6 = CFRetain(v12);
        *a5 = 8;
        BOOL v15 = 1;
        goto LABEL_11;
      }
      v14 = ASDTBaseLogType();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ASDTCustomProperty getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:]();
      }

      break;
  }
LABEL_10:
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  unsigned int v10 = [(ASDCustomProperty *)self propertyDataType];
  if (![(ASDCustomProperty *)self isSettable])
  {
    DeepCopy = ASDTBaseLogType();
    if (os_log_type_enabled(DeepCopy, OS_LOG_TYPE_ERROR)) {
      -[ASDTCustomProperty setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:].cold.4(self);
    }
    goto LABEL_13;
  }
  switch(v10)
  {
    case 0x63667374u:
      goto LABEL_5;
    case 0x72617777u:
      DeepCopy = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a6 length:a5 freeWhenDone:0];
      [(ASDTCustomProperty *)self setDataNoCopy:DeepCopy];
      goto LABEL_21;
    case 0x706C7374u:
LABEL_5:
      if (a5 != 8)
      {
        DeepCopy = ASDTBaseLogType();
        if (os_log_type_enabled(DeepCopy, OS_LOG_TYPE_ERROR)) {
          -[ASDTCustomProperty setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:](self);
        }
        goto LABEL_13;
      }
      unsigned int v11 = *(void **)a6;
      if (!*(void *)a6)
      {
        DeepCopy = ASDTBaseLogType();
        if (os_log_type_enabled(DeepCopy, OS_LOG_TYPE_ERROR)) {
          -[ASDTCustomProperty setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:](self);
        }
        goto LABEL_13;
      }
      if ([(ASDTCustomProperty *)self plistDeepCopyOnSet])
      {
        DeepCopy = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFPropertyListRef *)a6, 0);
        if (!DeepCopy)
        {
          DeepCopy = ASDTBaseLogType();
          if (os_log_type_enabled(DeepCopy, OS_LOG_TYPE_ERROR)) {
            -[ASDTCustomProperty setPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:](self);
          }
LABEL_13:
          BOOL v13 = 0;
LABEL_22:

          return v13;
        }
      }
      else
      {
        DeepCopy = v11;
      }
LABEL_21:
      BOOL v13 = [(ASDTCustomProperty *)self checkAndSetPropertyValue:DeepCopy];
      goto LABEL_22;
  }
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfPropertyValue
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversOfValue
{
  return 0;
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ASDCustomProperty *)self propertyDataType];
  if (v5 != 1667658612 && v5 != 1918990199)
  {
    if (v5 != 1886155636) {
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_10;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_10:
    BOOL v6 = 1;
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v7 = ASDTBaseLogType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[ASDTCustomProperty checkPropertyValue:]();
  }

  BOOL v6 = 0;
LABEL_14:

  return v6;
}

- (void)doCachePropertyValue:(id)a3
{
  id v4 = a3;
  [(ASDTCustomProperty *)self setPropertyValueWasCached:1];
  id propertyValue = self->_propertyValue;
  self->_id propertyValue = v4;
}

- (void)cachePropertyValue:(id)a3
{
  id v4 = a3;
  if ([(ASDTCustomProperty *)self cacheMode] == 2
    || [(ASDTCustomProperty *)self cacheMode] == 1 && [(ASDTCustomProperty *)self useCache])
  {
    if (v4)
    {
      id v5 = [(ASDTCustomProperty *)self dataNoCopy];

      if (v5 == v4)
      {
        uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithData:v4];

        if (!v6)
        {
          uint64_t v7 = ASDTBaseLogType();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            -[ASDTCustomProperty cachePropertyValue:](self);
          }
        }
        [(ASDTCustomProperty *)self setDataNoCopy:0];
        id v4 = (id)v6;
      }
    }
    [(ASDTCustomProperty *)self doCachePropertyValue:v4];
  }
}

- (void)releasePropertyValueCache
{
  if ([(ASDTCustomProperty *)self propertyValueWasCached])
  {
    id propertyValue = self->_propertyValue;
    self->_id propertyValue = 0;

    [(ASDTCustomProperty *)self setPropertyValueWasCached:0];
  }
}

- (BOOL)storePropertyValue:(id)a3
{
  return 1;
}

- (BOOL)checkAndSetPropertyValue:(id)a3
{
  id v4 = a3;
  if (![(ASDTCustomProperty *)self checkPropertyValue:v4])
  {
    unsigned int v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASDTCustomProperty checkAndSetPropertyValue:]();
    }

    goto LABEL_7;
  }
  id v5 = NSStringFromSelector(sel_value);
  [(ASDTCustomProperty *)self willChangeValueForKey:v5];

  uint64_t v6 = NSStringFromSelector(sel_propertyValue);
  [(ASDTCustomProperty *)self willChangeValueForKey:v6];

  LODWORD(v6) = [(ASDTCustomProperty *)self storePropertyValue:v4];
  uint64_t v7 = NSStringFromSelector(sel_value);
  [(ASDTCustomProperty *)self didChangeValueForKey:v7];

  uint64_t v8 = NSStringFromSelector(sel_propertyValue);
  [(ASDTCustomProperty *)self didChangeValueForKey:v8];

  if (!v6)
  {
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  [(ASDCustomProperty *)self sendPropertyChangeNotification];
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (id)retrievePropertyValue
{
  return 0;
}

- (id)propertyValue
{
  int v3 = [(ASDTCustomProperty *)self cacheMode];
  if (v3 == 1)
  {
    if (![(ASDTCustomProperty *)self useCache]) {
      goto LABEL_3;
    }
  }
  else if (!v3)
  {
LABEL_3:
    uint64_t v4 = [(ASDTCustomProperty *)self retrievePropertyValue];
LABEL_7:
    id v5 = (void *)v4;
    goto LABEL_9;
  }
  if ([(ASDTCustomProperty *)self propertyValueWasCached])
  {
    uint64_t v4 = [(ASDTCustomProperty *)self cachedPropertyValue];
    goto LABEL_7;
  }
  id v5 = [(ASDTCustomProperty *)self retrievePropertyValue];
  [(ASDTCustomProperty *)self cachePropertyValue:v5];
LABEL_9:
  return v5;
}

- (BOOL)includeValueInDescription
{
  return 1;
}

- (id)cachedPropertyValue
{
  return self->_propertyValue;
}

- (void)setUseCache:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ASDTCustomProperty *)self cacheMode] == 1)
  {
    if (v3)
    {
      id v5 = [(ASDTCustomProperty *)self retrievePropertyValue];
      [(ASDTCustomProperty *)self doCachePropertyValue:v5];
    }
    else
    {
      [(ASDTCustomProperty *)self releasePropertyValueCache];
    }
  }
  self->_useCache = v3;
}

+ (id)consolidatePList:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = v3;
    if ([v3 count])
    {
      uint64_t v4 = [v3 objectAtIndexedSubscript:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        uint64_t v6 = objc_msgSend(MEMORY[0x263EFF990], "dataWithCapacity:", -[NSObject count](v3, "count") * -[NSObject length](v5, "length"));
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        uint64_t v7 = v3;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          unsigned int v10 = v4;
          uint64_t v11 = *(void *)v53;
          while (2)
          {
            uint64_t v12 = 0;
            BOOL v13 = v5;
            do
            {
              if (*(void *)v53 != v11) {
                objc_enumerationMutation(v7);
              }
              id v5 = *(id *)(*((void *)&v52 + 1) + 8 * v12);

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v27 = ASDTBaseLogType();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                  +[ASDTCustomProperty consolidatePList:]();
                }

                uint64_t v4 = v10;
                goto LABEL_61;
              }
              [v6 appendData:v5];
              ++v12;
              BOOL v13 = v5;
            }
            while (v9 != v12);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v59 count:16];
            if (v9) {
              continue;
            }
            break;
          }
          v14 = v5;
          uint64_t v4 = v10;
        }
        else
        {
          v14 = v5;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v5 = v3;
          uint64_t v28 = [v5 countByEnumeratingWithState:&v40 objects:v56 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v41;
            while (2)
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v41 != v30) {
                  objc_enumerationMutation(v5);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v6 = ASDTBaseLogType();
                  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
                    +[ASDTCustomProperty consolidatePList:].cold.5();
                  }
LABEL_61:

                  goto LABEL_62;
                }
              }
              uint64_t v29 = [v5 countByEnumeratingWithState:&v40 objects:v56 count:16];
              if (v29) {
                continue;
              }
              break;
            }
          }
          goto LABEL_53;
        }
        v14 = v4;
        uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSObject count](v3, "count") * -[NSObject count](v14, "count"));
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        v17 = v3;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v49;
          v38 = v17;
          v39 = v4;
          uint64_t v35 = *(void *)v49;
          while (2)
          {
            uint64_t v21 = 0;
            uint64_t v36 = v19;
            do
            {
              if (*(void *)v49 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v37 = v21;
              id v5 = *(id *)(*((void *)&v48 + 1) + 8 * v21);

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v14 = ASDTBaseLogType();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
                  +[ASDTCustomProperty consolidatePList:].cold.4();
                }
LABEL_60:

                goto LABEL_61;
              }
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              v14 = v5;
              uint64_t v22 = [v14 countByEnumeratingWithState:&v44 objects:v57 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v45;
                while (2)
                {
                  for (uint64_t j = 0; j != v23; ++j)
                  {
                    if (*(void *)v45 != v24) {
                      objc_enumerationMutation(v14);
                    }
                    uint64_t v26 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v33 = ASDTBaseLogType();
                      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                        +[ASDTCustomProperty consolidatePList:]();
                      }

                      v17 = v38;
                      uint64_t v4 = v39;
                      goto LABEL_60;
                    }
                    [v6 addObject:v26];
                  }
                  uint64_t v23 = [v14 countByEnumeratingWithState:&v44 objects:v57 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v21 = v37 + 1;
              v17 = v38;
              uint64_t v4 = v39;
              uint64_t v20 = v35;
            }
            while (v37 + 1 != v36);
            uint64_t v19 = [v38 countByEnumeratingWithState:&v48 objects:v58 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
      }

      id v5 = v6;
LABEL_53:

      BOOL v3 = v5;
LABEL_54:
      BOOL v3 = v3;
      v32 = v3;
      goto LABEL_64;
    }
    v16 = ASDTBaseLogType();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[ASDTCustomProperty consolidatePList:]();
    }

LABEL_62:
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_54;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_54;
    }
    BOOL v15 = ASDTBaseLogType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ASDTCustomProperty consolidatePList:].cold.6();
    }
  }
  v32 = 0;
LABEL_64:

  return v32;
}

- (void)setName:(id)a3
{
}

- (unsigned)propertyValueSize
{
  return self->_propertyValueSize;
}

- (void)setPropertyValueSize:(unsigned int)a3
{
  self->_propertyValueSize = a3;
}

- (int)cacheMode
{
  return self->_cacheMode;
}

- (void)setCacheMode:(int)a3
{
  self->_cacheMode = a3;
}

- (BOOL)useCache
{
  return self->_useCache;
}

- (BOOL)propertyValueWasCached
{
  return self->_propertyValueWasCached;
}

- (void)setPropertyValueWasCached:(BOOL)a3
{
  self->_propertyValueWasCached = a3;
}

- (BOOL)plistDeepCopyOnSet
{
  return self->_plistDeepCopyOnSet;
}

- (void)setPlistDeepCopyOnSet:(BOOL)a3
{
  self->_plistDeepCopyOnSet = a3;
}

- (NSData)dataNoCopy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataNoCopy);
  return (NSData *)WeakRetained;
}

- (void)setDataNoCopy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataNoCopy);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_propertyValue, 0);
}

+ (void)customPropertyForConfig:(void *)a1 .cold.1(void *a1)
{
  uint64_t v7 = [a1 objectForKeyedSubscript:@"Subclass"];
  OUTLINED_FUNCTION_4_1(&dword_2489BC000, v1, v2, "%s: Invalid subclass name: %@", v3, v4, v5, v6, 2u);
}

- (void)getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 name];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_2489BC000, v2, v3, "%@: get: Incoming data size invalid: %u", v4, v5, v6, v7, v8);
}

- (void)getPropertyWithQualifierSize:qualifierData:dataSize:andData:forClient:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "inPropertyValue must be an NSData object", v2, v3, v4, v5, v6);
}

- (void)setPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: set: Bad argument.", v4, v5, v6, v7, v8);
}

- (void)setPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.2(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: set: Property list copy failed.", v4, v5, v6, v7, v8);
}

- (void)setPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.3(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_3(&dword_2489BC000, v2, v3, "%@: set: Incoming data size invalid: %u", v4, v5, v6, v7, v8);
}

- (void)setPropertyWithQualifierSize:(void *)a1 qualifierData:dataSize:andData:forClient:.cold.4(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Attempt to set value to unsettable property.", v4, v5, v6, v7, v8);
}

- (void)checkPropertyValue:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 name];
  id v2 = (id)objc_opt_class();
  OUTLINED_FUNCTION_4_1(&dword_2489BC000, v3, v4, "%@: set: Bad property data type: %@", v5, v6, v7, v8, 2u);
}

- (void)cachePropertyValue:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "%@: Failed to cache property data (out of memory).", v4, v5, v6, v7, v8);
}

- (void)checkAndSetPropertyValue:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 name];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_1(&dword_2489BC000, v2, v3, "%@: set: Failed property value check: %@", v4, v5, v6, v7, v8);
}

+ (void)consolidatePList:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "Empty array found.", v2, v3, v4, v5, v6);
}

+ (void)consolidatePList:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "Objects in array for must be all Data", v2, v3, v4, v5, v6);
}

+ (void)consolidatePList:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "Objects in sub-array must be all Number", v2, v3, v4, v5, v6);
}

+ (void)consolidatePList:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "Array must contain only arrays.", v2, v3, v4, v5, v6);
}

+ (void)consolidatePList:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_2489BC000, v0, v1, "Objects in array must be all Number", v2, v3, v4, v5, v6);
}

+ (void)consolidatePList:.cold.6()
{
  id v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2489BC000, v2, v3, "Object of type %@ is not supported.", v4, v5, v6, v7, v8);
}

@end