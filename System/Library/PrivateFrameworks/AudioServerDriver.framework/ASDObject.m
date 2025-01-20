@interface ASDObject
- (ASDObject)init;
- (ASDObject)initWithPlugin:(id)a3;
- (ASDObject)owner;
- (ASDPlugin)plugin;
- (ASDPropertyChangedDelegate)propertyChangedDelegate;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isKindOfAudioClass:(unsigned int)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (NSArray)customProperties;
- (NSString)driverClassName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (unsigned)baseClass;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)objectClass;
- (unsigned)objectID;
- (void)addCustomProperty:(id)a3;
- (void)dealloc;
- (void)removeCustomProperty:(id)a3;
- (void)setObjectID:(unsigned int)a3;
- (void)setOwner:(id)a3;
- (void)setPlugin:(id)a3;
- (void)setPropertyChangedDelegate:(id)a3;
- (void)setupDiagnosticStateDumpHandlerWithTreeWalk:(BOOL)a3;
@end

@implementation ASDObject

- (ASDObject)init
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    return [(ASDObject *)self initWithPlugin:0];
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFF940];
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    v6 = [NSString stringWithUTF8String:"-[ASDObject init]"];
    [v4 raise:v5, @"Do not call %@", v6 format];

    return 0;
  }
}

- (ASDObject)initWithPlugin:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASDObject;
  uint64_t v5 = [(ASDObject *)&v14 init];
  if (v5)
  {
    [v4 addCAObject:v5];
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 bundleIdentifier];
    objc_storeWeak((id *)&v5->_propertyChangedDelegate, v4);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    customProperties = v5->_customProperties;
    v5->_customProperties = v8;

    id v10 = [NSString stringWithFormat:@"%@.object.%u.customProperties", v7, -[ASDObject objectID](v5, "objectID")];
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    customPropertyQueue = v5->_customPropertyQueue;
    v5->_customPropertyQueue = (OS_dispatch_queue *)v11;
  }
  return v5;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  if (a3)
  {
    AudioObjectPropertySelector mSelector = a3->mSelector;
    if ((int)a3->mSelector <= 1668641651)
    {
      BOOL v5 = mSelector == 1650682995;
      int v6 = 1668047219;
    }
    else
    {
      if (mSelector == 1668641652)
      {
        customPropertyQueue = self->_customPropertyQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __25__ASDObject_hasProperty___block_invoke;
        block[3] = &unk_264773158;
        block[4] = self;
        block[5] = &v25;
        dispatch_sync(customPropertyQueue, block);
        goto LABEL_12;
      }
      BOOL v5 = mSelector == 1937007734;
      int v6 = 1870098020;
    }
    if (v5 || mSelector == v6)
    {
      char v28 = 1;
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      dispatch_queue_t v11 = [(ASDObject *)self customProperties];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
      uint64_t v13 = v12;
      if (v12)
      {
        uint64_t v14 = *(void *)v21;
        while (2)
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
            AudioObjectPropertySelector v17 = a3->mSelector;
            if (v17 == [v16 selector])
            {
              AudioObjectPropertyScope mScope = a3->mScope;
              if (mScope == [v16 scope])
              {
                AudioObjectPropertyElement mElement = a3->mElement;
                if (mElement == [v16 element])
                {
                  *((unsigned char *)v26 + 24) = 1;

                  goto LABEL_12;
                }
              }
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_12:
  char v8 = *((unsigned char *)v26 + 24);
  _Block_object_dispose(&v25, 8);
  return v8;
}

uint64_t __25__ASDObject_hasProperty___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a3)
  {
    LOBYTE(v4) = 0;
    AudioObjectPropertySelector mSelector = a3->mSelector;
    if ((int)a3->mSelector <= 1668641651)
    {
      BOOL v6 = mSelector == 1650682995;
      int v7 = 1668047219;
    }
    else
    {
      BOOL v6 = mSelector == 1668641652 || mSelector == 1870098020;
      int v7 = 1937007734;
    }
    if (!v6 && mSelector != v7)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = [(ASDObject *)self customProperties];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v4 = v11;
      if (v11)
      {
        uint64_t v12 = *(void *)v19;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
            AudioObjectPropertySelector v15 = a3->mSelector;
            if (v15 == [v14 selector])
            {
              AudioObjectPropertyScope mScope = a3->mScope;
              if (mScope == [v14 scope])
              {
                AudioObjectPropertyElement mElement = a3->mElement;
                if (mElement == [v14 element])
                {
                  LOBYTE(v4) = [v14 isSettable];
                  goto LABEL_27;
                }
              }
            }
            ++v13;
          }
          while (v4 != v13);
          uint64_t v4 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v4) {
            continue;
          }
          break;
        }
      }
LABEL_27:
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v30 = 0;
  if (!a3) {
    goto LABEL_23;
  }
  uint64_t v6 = *(void *)&a4;
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1668641651)
  {
    if (mSelector == 1650682995)
    {
LABEL_9:
      int v30 = 4;
      goto LABEL_23;
    }
    int v9 = 1668047219;
  }
  else
  {
    if (mSelector == 1668641652)
    {
      customPropertyQueue = self->_customPropertyQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__ASDObject_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
      block[3] = &unk_264773158;
      block[4] = self;
      block[5] = &v27;
      dispatch_sync(customPropertyQueue, block);
      goto LABEL_23;
    }
    if (mSelector == 1870098020) {
      goto LABEL_23;
    }
    int v9 = 1937007734;
  }
  if (mSelector == v9) {
    goto LABEL_9;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = [(ASDObject *)self customProperties];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        AudioObjectPropertySelector v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        AudioObjectPropertySelector v16 = a3->mSelector;
        if (v16 == [v15 selector])
        {
          AudioObjectPropertyScope mScope = a3->mScope;
          if (mScope == [v15 scope])
          {
            AudioObjectPropertyElement mElement = a3->mElement;
            if (mElement == [v15 element])
            {
              int v19 = [v15 dataSizeWithQualifierSize:v6 andQualifierData:a5];
              *((_DWORD *)v28 + 6) = v19;

              goto LABEL_23;
            }
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

LABEL_23:
  unsigned int v20 = *((_DWORD *)v28 + 6);
  _Block_object_dispose(&v27, 8);
  return v20;
}

uint64_t __68__ASDObject_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 12 * result;
  return result;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  LOBYTE(v8) = 0;
  uint64_t v55 = *MEMORY[0x263EF8340];
  if (!a3 || !a6 || !a7) {
    return v8;
  }
  uint64_t v13 = *(void *)&a4;
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1668641651)
  {
    switch(mSelector)
    {
      case 0x63757374u:
        unsigned int v20 = *a6;
        if (*a6 >= 0xC)
        {
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id obja = [(ASDObject *)self customProperties];
          uint64_t v29 = [obja countByEnumeratingWithState:&v49 objects:v54 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            int v31 = 0;
            uint64_t v32 = *(void *)v50;
            unsigned int v33 = 1 - v20 / 0xC;
            unsigned int v40 = v33;
            unsigned int v42 = v20 / 0xC;
            while (2)
            {
              uint64_t v34 = 0;
              int v35 = v31;
              int v36 = v33 + v31;
              do
              {
                if (*(void *)v50 != v32) {
                  objc_enumerationMutation(obja);
                }
                v37 = *(void **)(*((void *)&v49 + 1) + 8 * v34);
                v38 = (char *)a7 + 12 * (v35 + v34);
                _DWORD *v38 = [v37 selector];
                v38[1] = [v37 propertyDataType];
                v38[2] = [v37 qualifierDataType];
                if (!(v36 + v34))
                {
                  unsigned int v21 = v42;
                  goto LABEL_46;
                }
                ++v34;
              }
              while (v30 != v34);
              uint64_t v30 = [obja countByEnumeratingWithState:&v49 objects:v54 count:16];
              int v31 = v35 + v34;
              unsigned int v33 = v40;
              if (v30) {
                continue;
              }
              break;
            }
            unsigned int v21 = v35 + v34;
          }
          else
          {
            unsigned int v21 = 0;
          }
LABEL_46:
        }
        else
        {
          unsigned int v21 = 0;
        }
        *a6 = 12 * v21;
        goto LABEL_48;
      case 0x6F776E64u:
        *a6 = 0;
        goto LABEL_48;
      case 0x73746476u:
        if (*a6 >= 4)
        {
          *a6 = 4;
          id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

          if (WeakRetained)
          {
            long long v18 = [(ASDObject *)self owner];
            *(_DWORD *)a7 = [v18 objectID];

LABEL_48:
            LOBYTE(v8) = 1;
            return v8;
          }
        }
        goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (mSelector == 1650682995)
  {
    if (*a6 >= 4)
    {
      *a6 = 4;
      unsigned int v19 = [(ASDObject *)self baseClass];
      goto LABEL_20;
    }
LABEL_21:
    LOBYTE(v8) = 0;
    return v8;
  }
  if (mSelector == 1668047219)
  {
    if (*a6 >= 4)
    {
      *a6 = 4;
      unsigned int v19 = [(ASDObject *)self objectClass];
LABEL_20:
      *(_DWORD *)a7 = v19;
      goto LABEL_48;
    }
    goto LABEL_21;
  }
LABEL_22:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v22 = [(ASDObject *)self customProperties];
  uint64_t v8 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v8)
  {
    v41 = a5;
    unsigned int obj = a8;
    uint64_t v23 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v46 != v23) {
          objc_enumerationMutation(v22);
        }
        long long v25 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        AudioObjectPropertySelector v26 = a3->mSelector;
        if (v26 == [v25 selector])
        {
          AudioObjectPropertyScope mScope = a3->mScope;
          if (mScope == [v25 scope])
          {
            AudioObjectPropertyElement mElement = a3->mElement;
            if (mElement == [v25 element])
            {
              LOBYTE(v8) = [v25 getPropertyWithQualifierSize:v13 qualifierData:v41 dataSize:a6 andData:a7 forClient:obj];
              goto LABEL_34;
            }
          }
        }
      }
      uint64_t v8 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_34:

  return v8;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v10 = *(void *)&a6;
    uint64_t v12 = *(void *)&a4;
    LOBYTE(v14) = 0;
    AudioObjectPropertySelector mSelector = a3->mSelector;
    if ((int)a3->mSelector <= 1668641651)
    {
      BOOL v16 = mSelector == 1650682995;
      int v17 = 1668047219;
    }
    else
    {
      BOOL v16 = mSelector == 1668641652 || mSelector == 1870098020;
      int v17 = 1937007734;
    }
    if (!v16 && mSelector != v17)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      unsigned int v20 = [(ASDObject *)self customProperties];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v14 = v21;
      if (v21)
      {
        char v28 = a7;
        unsigned int v29 = a8;
        uint64_t v22 = *(void *)v31;
        while (2)
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v20);
            }
            long long v24 = *(void **)(*((void *)&v30 + 1) + 8 * v23);
            AudioObjectPropertySelector v25 = a3->mSelector;
            if (v25 == objc_msgSend(v24, "selector", v28))
            {
              AudioObjectPropertyScope mScope = a3->mScope;
              if (mScope == [v24 scope])
              {
                AudioObjectPropertyElement mElement = a3->mElement;
                if (mElement == [v24 element])
                {
                  if ([v24 isSettable]) {
                    LOBYTE(v14) = [v24 setPropertyWithQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:v28 forClient:v29];
                  }
                  else {
                    LOBYTE(v14) = 0;
                  }
                  goto LABEL_29;
                }
              }
            }
            ++v23;
          }
          while (v14 != v23);
          uint64_t v14 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_29:
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (unsigned)baseClass
{
  return 1634689642;
}

- (unsigned)objectClass
{
  return 1634689642;
}

- (BOOL)isKindOfAudioClass:(unsigned int)a3
{
  return a3 == 1634689642
      || [(ASDObject *)self baseClass] == a3
      || [(ASDObject *)self objectClass] == a3;
}

- (void)addCustomProperty:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    if (![v5 selector])
    {
      uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"ASDObject.m" lineNumber:344 description:@"Custom property has 0 selector"];
    }
    int v7 = [v6 owner];

    if (v7)
    {
      uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"ASDObject.m" lineNumber:345 description:@"Custom property is already attached to an object"];
    }
    if ([v6 propertyDataType] != 1667658612
      && [v6 propertyDataType] != 1886155636
      && [v6 propertyDataType] != 1918990199)
    {
      uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"ASDObject.m" lineNumber:346 description:@"Unsupported property data type"];
    }
    if ([v6 qualifierDataType] != 1667658612
      && [v6 qualifierDataType] != 1886155636
      && [v6 qualifierDataType] != 1918990199
      && [v6 qualifierDataType])
    {
      uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"ASDObject.m" lineNumber:347 description:@"Unsupported qualifier data type"];
    }
    [v6 setOwner:self];
    customPropertyQueue = self->_customPropertyQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__ASDObject_addCustomProperty___block_invoke;
    block[3] = &unk_2647731A8;
    block[4] = self;
    id v17 = v6;
    SEL v18 = a2;
    dispatch_sync(customPropertyQueue, block);
    int v15 = 0;
    uint64_t v14 = 0x676C6F6263757374;
    int v9 = [(ASDObject *)self propertyChangedDelegate];
    [v9 changedProperty:&v14 forObject:self];
  }
}

uint64_t __31__ASDObject_addCustomProperty___block_invoke(void *a1)
{
  if ([*(id *)(a1[4] + 8) containsObject:a1[5]])
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a1[6] object:a1[4] file:@"ASDObject.m" lineNumber:352 description:@"Custom property already exists."];
  }
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  return [v3 addObject:v2];
}

- (void)removeCustomProperty:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    customPropertyQueue = self->_customPropertyQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__ASDObject_removeCustomProperty___block_invoke;
    block[3] = &unk_2647731A8;
    block[4] = self;
    id v8 = v5;
    id v13 = v8;
    SEL v14 = a2;
    dispatch_sync(customPropertyQueue, block);
    [v8 setOwner:0];
    int v11 = 0;
    uint64_t v10 = 0x676C6F6263757374;
    int v9 = [(ASDObject *)self propertyChangedDelegate];
    [v9 changedProperty:&v10 forObject:self];
  }
}

uint64_t __34__ASDObject_removeCustomProperty___block_invoke(void *a1)
{
  if (([*(id *)(a1[4] + 8) containsObject:a1[5]] & 1) == 0)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a1[6] object:a1[4] file:@"ASDObject.m" lineNumber:370 description:@"Custom property doesn't exist."];
  }
  uint64_t v2 = a1[5];
  v3 = *(void **)(a1[4] + 8);
  return [v3 removeObject:v2];
}

- (NSArray)customProperties
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  customPropertyQueue = self->_customPropertyQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__ASDObject_customProperties__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(customPropertyQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __29__ASDObject_customProperties__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 8)];
  return MEMORY[0x270F9A758]();
}

- (void)setupDiagnosticStateDumpHandlerWithTreeWalk:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = dispatch_get_global_queue(0, 0);
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  self->_stateDumpHandler = os_state_add_handler();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

_DWORD *__57__ASDObject_setupDiagnosticStateDumpHandlerWithTreeWalk___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    id v6 = [WeakRetained diagnosticDescriptionWithIndent:&stru_26D970628 walkTree:*(unsigned __int8 *)(a1 + 40)];
    BOOL v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:200 options:0 error:0];
    uint64_t v8 = v7;
    if (v7)
    {
      size_t v9 = [v7 length];
      uint64_t v10 = malloc_type_calloc(1uLL, v9 + 200, 0x566C1BF9uLL);
      if (v10)
      {
        id v11 = NSString;
        uint64_t v12 = [v5 driverClassName];
        id v13 = [v11 stringWithFormat:@"AudioServerDriver %@ State:", v12];

        *uint64_t v10 = 1;
        v10[1] = v9;
        id v14 = v13;
        [v14 UTF8String];
        __strlcpy_chk();
        memcpy(v10 + 50, (const void *)[v8 bytes], v9);
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  id v5 = (void *)MEMORY[0x263F089D8];
  id v6 = a3;
  BOOL v7 = [v5 string];
  id v8 = [(ASDObject *)self driverClassName];
  [v7 appendFormat:@"%@+%s\n", v6, objc_msgSend(v8, "UTF8String")];

  [v7 appendFormat:@"%@|    Object ID: %u\n", v6, -[ASDObject objectID](self, "objectID")];
  int v9 = [(ASDObject *)self baseClass];
  LODWORD(v10) = v9 >> 24;
  if ((v9 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v10 = 32;
  }
  else {
    uint64_t v10 = v10;
  }
  LODWORD(v11) = v9 << 8 >> 24;
  if (((v9 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v11 = 32;
  }
  else {
    uint64_t v11 = v11;
  }
  LODWORD(v12) = (__int16)v9 >> 8;
  if (((v9 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v12 = 32;
  }
  else {
    uint64_t v12 = v12;
  }
  if (v9 << 24 == 2130706432 || v9 << 24 < 520093697) {
    uint64_t v14 = 32;
  }
  else {
    uint64_t v14 = (char)v9;
  }
  [v7 appendFormat:@"%@|    Base Class: %c%c%c%c\n", v6, v10, v11, v12, v14];
  int v15 = [(ASDObject *)self objectClass];
  LODWORD(v16) = v15 >> 24;
  if ((v15 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = v16;
  }
  LODWORD(v17) = v15 << 8 >> 24;
  if (((v15 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = v17;
  }
  LODWORD(v18) = (__int16)v15 >> 8;
  if (((v15 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v18 = 32;
  }
  else {
    uint64_t v18 = v18;
  }
  if (v15 << 24 == 2130706432 || v15 << 24 < 520093697) {
    uint64_t v20 = 32;
  }
  else {
    uint64_t v20 = (char)v15;
  }
  [v7 appendFormat:@"%@|    Object Class: %c%c%c%c\n", v6, v16, v17, v18, v20];
  uint64_t v21 = [(ASDObject *)self owner];
  [v7 appendFormat:@"%@|    Owner ID: %u\n", v6, objc_msgSend(v21, "objectID")];

  return v7;
}

- (NSString)driverClassName
{
  return (NSString *)@"AudioObject";
}

- (void)dealloc
{
  if (self->_stateDumpHandler) {
    os_state_remove_handler();
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);
  [WeakRetained removeCAObject:self];

  v4.receiver = self;
  v4.super_class = (Class)ASDObject;
  [(ASDObject *)&v4 dealloc];
}

- (unsigned)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(unsigned int)a3
{
  self->_objectID = a3;
}

- (ASDObject)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (ASDObject *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (ASDPlugin)plugin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);
  return (ASDPlugin *)WeakRetained;
}

- (void)setPlugin:(id)a3
{
}

- (ASDPropertyChangedDelegate)propertyChangedDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_propertyChangedDelegate);
  return (ASDPropertyChangedDelegate *)WeakRetained;
}

- (void)setPropertyChangedDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_propertyChangedDelegate);
  objc_destroyWeak((id *)&self->_plugin);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_customPropertyQueue, 0);
  objc_storeStrong((id *)&self->_customProperties, 0);
}

@end