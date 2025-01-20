@interface MPModelObject
+ (BOOL)_lookupPropertyForSelector:(SEL)a3 result:(id)a4;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsKeepLocalStatusObservation;
+ (BOOL)supportsLibraryAddStatusObservation;
+ (BOOL)supportsLibraryRemoval;
+ (BOOL)supportsSecureCoding;
+ (NSArray)classesForSecureCoding;
+ (id)_modelKeyForPropertySelector:(SEL)a3;
+ (id)requiredKeepLocalStatusObservationProperties;
+ (id)requiredLibraryAddStatusObservationProperties;
+ (id)requiredLibraryRemovalProperties;
+ (int64_t)genericObjectType;
+ (void)_indexProperties;
+ (void)initialize;
+ (void)performWithoutEnforcement:(id)a3;
- (BOOL)_isModelKey:(id)a3;
- (BOOL)hasLoadedValueForKey:(id)a3;
- (BOOL)hasLoadedValuesForPropertySet:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MPIdentifierSet)identifiers;
- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration;
- (MPModelObject)initWithCoder:(id)a3;
- (MPModelObject)initWithIdentifiers:(id)a3;
- (MPModelObject)initWithIdentifiers:(id)a3 block:(id)a4;
- (NSString)description;
- (NSString)humanDescription;
- (id)_sanitizedStorage;
- (id)_stateDumpObject;
- (id)contentItemCollectionInfo;
- (id)copyWithIdentifiers:(id)a3;
- (id)copyWithIdentifiers:(id)a3 block:(id)a4;
- (id)copyWithIdentifiers:(id)a3 propertySet:(id)a4;
- (id)copyWithPropertySet:(id)a3;
- (id)mediaItemPropertyValues;
- (id)mergeWithObject:(id)a3;
- (id)newKeepLocalStatusObserverConfiguration;
- (id)valueForModelKey:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)libraryRemovalSupportedOptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3 forModelKey:(id)a4;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation MPModelObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_storage, 0);
}

+ (void)_indexProperties
{
  v17 = [MEMORY[0x1E4F779B8] bidirectionalDictionary];
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v15 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v3 = MEMORY[0x1E4F143A8];
  id object = Superclass;
  do
  {
    v18[0] = v3;
    v18[1] = 3221225472;
    v19 = __33__MPModelObject__indexProperties__block_invoke;
    v20 = &unk_1E57F4AE0;
    id v24 = Superclass;
    id v4 = v17;
    id v21 = v4;
    id v5 = v16;
    id v22 = v5;
    id v6 = v15;
    id v23 = v6;
    v7 = v18;
    unsigned int outCount = 0;
    v8 = class_copyPropertyList((Class)Superclass, &outCount);
    char v25 = 0;
    if (outCount)
    {
      unint64_t v9 = 0;
      do
      {
        ((void (*)(void *, objc_property_t, char *))v19)(v7, v8[v9++], &v25);
        if (v25) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = v9 >= outCount;
        }
      }
      while (!v10);
    }
    free(v8);

    Superclass = class_getSuperclass((Class)Superclass);
  }
  while (Superclass != (id)objc_opt_class());
  v11 = [v4 allKeys];
  objc_setAssociatedObject(object, (const void *)_MPModelObjectPropertySelectorIndexKey, v5, (void *)3);
  objc_setAssociatedObject(object, (const void *)_MPModelObjectModelKeyPropertyIndexKey, v4, (void *)3);
  v12 = (const void *)_MPModelObjectSharedKeySetKey;
  v13 = [MEMORY[0x1E4F1CA60] sharedKeySetForKeys:v11];
  objc_setAssociatedObject(object, v12, v13, (void *)1);

  objc_setAssociatedObject(object, (const void *)_MPModelObjectPropertyClassesKey, v6, (void *)3);
}

void __33__MPModelObject__indexProperties__block_invoke(uint64_t a1, objc_property_t property)
{
  id v28 = [NSString stringWithUTF8String:property_getName(property)];
  id v4 = [NSString stringWithFormat:@"__%@_KEY", v28];
  id v5 = NSSelectorFromString(v4);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [*(id *)(a1 + 56) v5];
    if (!v6) {
      goto LABEL_18;
    }
    v7 = (void *)v6;
    [*(id *)(a1 + 32) setObject:v28 forKey:v6];
  }
  v8 = *(void **)(a1 + 40);
  Name = property_getName(property);
  BOOL v10 = property_copyAttributeValue(property, "G");
  v11 = v10;
  if (!v10) {
    BOOL v10 = (char *)Name;
  }
  Uid = sel_getUid(v10);
  free(v11);
  v13 = NSStringFromSelector(Uid);
  [v8 setObject:v28 forKeyedSubscript:v13];

  v14 = property_copyAttributeValue(property, "R");
  if (v14)
  {
    free(v14);
    goto LABEL_11;
  }
  v15 = property_copyAttributeValue(property, "S");
  if (v15)
  {
    v16 = v15;
    v17 = sel_getUid(v15);
    free(v16);
    if (!v17) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v24 = [MEMORY[0x1E4F28E78] stringWithUTF8String:property_getName(property)];
  char v25 = [v24 substringToIndex:1];
  v26 = [v25 uppercaseString];
  objc_msgSend(v24, "replaceCharactersInRange:withString:", 0, 1, v26);

  [v24 insertString:@"set" atIndex:0];
  [v24 appendString:@":"];
  id v27 = v24;
  v17 = sel_getUid((const char *)[v27 UTF8String]);

  if (v17)
  {
LABEL_10:
    v18 = *(void **)(a1 + 40);
    v19 = NSStringFromSelector(v17);
    [v18 setObject:v28 forKeyedSubscript:v19];
  }
LABEL_11:
  v20 = property_copyAttributeValue(property, "T");
  if (v20)
  {
    id v21 = v20;
    if (*v20 == 64)
    {
      id v22 = [NSString stringWithUTF8String:v20];
      if ([v22 hasPrefix:@"@\""]
        && [v22 hasSuffix:@"\""])
      {
        id v23 = objc_msgSend(v22, "substringWithRange:", 2, objc_msgSend(v22, "length") - 3);
        [*(id *)(a1 + 48) addObject:v23];
      }
    }
    free(v21);
  }
LABEL_18:
}

- (void)setValue:(id)a3 forModelKey:(id)a4
{
  id v18 = a3;
  id v7 = a4;
  if (MSVDeviceOSIsInternalInstall())
  {
    if (_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken != -1) {
      dispatch_once(&_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken, &__block_literal_global_293);
    }
    if (!pthread_getspecific(_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey) && self->_isFinalized)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"MPModelObject.m", 461, @"Attempt to set enforced property after initialization: %@", v7 object file lineNumber description];
    }
  }
  v8 = objc_opt_class();
  unint64_t v9 = objc_getAssociatedObject(v8, (const void *)_MPModelObjectModelKeyPropertyIndexKey);
  id v10 = [v9 objectForKey:v7];
  Property = class_getProperty((Class)v8, (const char *)[v10 UTF8String]);

  v12 = property_copyAttributeValue(Property, "C");
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = [v18 copy];

    free(v13);
    id v15 = (id)v14;
  }
  else
  {
    id v15 = v18;
  }
  id v19 = v15;
  if (v15)
  {
    [(NSMutableDictionary *)self->_storage setObject:v15 forKeyedSubscript:v7];
  }
  else
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)self->_storage setObject:v16 forKeyedSubscript:v7];
  }
}

- (id)valueForModelKey:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:v5];
  if (!v6 && MSVDeviceOSIsInternalInstall())
  {
    if (_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken != -1) {
      dispatch_once(&_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken, &__block_literal_global_293);
    }
    if (!pthread_getspecific(_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey))
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"MPModelObject.m", 451, @"Attempt to retrieve enforced uninitialized property: %@", v5 object file lineNumber description];
    }
  }
  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v6 == v7) {
    v8 = 0;
  }
  else {
    v8 = v6;
  }
  id v9 = v8;

  return v9;
}

+ (id)_modelKeyForPropertySelector:(SEL)a3
{
  id v5 = objc_getAssociatedObject(a1, (const void *)_MPModelObjectPropertySelectorIndexKey);
  uint64_t v6 = objc_getAssociatedObject(a1, (const void *)_MPModelObjectModelKeyPropertyIndexKey);
  id v7 = NSStringFromSelector(a3);
  v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    id v9 = [v6 keyForObject:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (void)performWithoutEnforcement:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (!MSVDeviceOSIsInternalInstall()) {
    goto LABEL_5;
  }
  if (_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken != -1) {
    dispatch_once(&_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken, &__block_literal_global_293);
  }
  if (!pthread_getspecific(_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey))
  {
    if (_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken != -1) {
      dispatch_once(&_MPModelObjectEnforcementDisabledPThreadKey_sOnceToken, &__block_literal_global_293);
    }
    pthread_key_t v3 = _MPModelObjectEnforcementDisabledPThreadKey_sThreadKey;
    pthread_setspecific(_MPModelObjectEnforcementDisabledPThreadKey_sThreadKey, (const void *)1);
    v4[2]();
    pthread_setspecific(v3, 0);
  }
  else
  {
LABEL_5:
    v4[2]();
  }
}

- (id)copyWithIdentifiers:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)objc_opt_class());
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__MPModelObject_copyWithIdentifiers_block___block_invoke;
  v12[3] = &unk_1E57F4A40;
  v12[4] = self;
  id v13 = v6;
  id v9 = v6;
  id v10 = (void *)[v8 initWithIdentifiers:v7 block:v12];

  return v10;
}

- (MPModelObject)initWithIdentifiers:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, MPModelObject *))a4;
  v16.receiver = self;
  v16.super_class = (Class)MPModelObject;
  id v8 = [(MPModelObject *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifiers = v8->_identifiers;
    v8->_identifiers = (MPIdentifierSet *)v9;

    v11 = objc_opt_class();
    v12 = objc_getAssociatedObject(v11, (const void *)_MPModelObjectSharedKeySetKey);
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:v12];
    storage = v8->_storage;
    v8->_storage = (NSMutableDictionary *)v13;

    v7[2](v7, v8);
    v8->_isFinalized = 1;
  }
  return v8;
}

void __43__MPModelObject_copyWithIdentifiers_block___block_invoke(uint64_t a1, void *a2)
{
  pthread_key_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a2;
  uint64_t v4 = [v3 mutableCopy];
  id v5 = (void *)v6[1];
  v6[1] = v4;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)initialize
{
  pthread_key_t v3 = (void *)MEMORY[0x19971DE60](a1, a2);
  [a1 _indexProperties];
}

- (MPIdentifierSet)identifiers
{
  return self->_identifiers;
}

void __47__MPModelObject_hasLoadedValuesForPropertySet___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) hasLoadedValueForKey:v10];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    goto LABEL_5;
  }
  id v8 = [*(id *)(a1 + 32) valueForModelKey:v10];
  uint64_t v9 = v8;
  if (v8) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 hasLoadedValuesForPropertySet:v7];
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
LABEL_5:
  }
    *a4 = 1;
}

- (BOOL)hasLoadedValuesForPropertySet:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 properties];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        if (![(MPModelObject *)self hasLoadedValueForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)])
        {

          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  uint64_t v9 = [v4 relationships];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__MPModelObject_hasLoadedValuesForPropertySet___block_invoke;
  v12[3] = &unk_1E57F7928;
  v12[4] = self;
  void v12[5] = &v13;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
  BOOL v10 = *((unsigned char *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
LABEL_11:

  return v10;
}

- (BOOL)hasLoadedValueForKey:(id)a3
{
  pthread_key_t v3 = [(NSMutableDictionary *)self->_storage objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  BOOL v10 = __39__MPModelObject_resolveInstanceMethod___block_invoke;
  v11 = &unk_1E57F4A18;
  v12 = &v15;
  SEL v13 = a3;
  id v14 = a1;
  objc_msgSend(a1, "_lookupPropertyForSelector:result:");
  if (*((unsigned char *)v16 + 24))
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___MPModelObject;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_resolveInstanceMethod_, a3);
  }
  _Block_object_dispose(&v15, 8);
  return v5;
}

+ (BOOL)_lookupPropertyForSelector:(SEL)a3 result:(id)a4
{
  uint64_t v6 = (void (**)(id, objc_property *, SEL, SEL))a4;
  objc_super v7 = objc_getAssociatedObject(a1, (const void *)_MPModelObjectPropertySelectorIndexKey);
  uint64_t v8 = NSStringFromSelector(a3);
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  id v10 = v9;
  Property = class_getProperty((Class)a1, (const char *)[v10 UTF8String]);
  v12 = Property;
  if (Property)
  {
    Name = property_getName(Property);
    id v14 = property_copyAttributeValue(v12, "G");
    uint64_t v15 = v14;
    if (!v14) {
      id v14 = (char *)Name;
    }
    SEL Uid = sel_getUid(v14);
    free(v15);
    uint64_t v17 = property_copyAttributeValue(v12, "R");
    if (v17)
    {
      free(v17);
      SEL v18 = 0;
    }
    else
    {
      long long v19 = property_copyAttributeValue(v12, "S");
      if (v19)
      {
        long long v20 = v19;
        SEL v18 = sel_getUid(v19);
        free(v20);
      }
      else
      {
        id v21 = [MEMORY[0x1E4F28E78] stringWithUTF8String:property_getName(v12)];
        uint64_t v22 = [v21 substringToIndex:1];
        id v23 = [v22 uppercaseString];
        objc_msgSend(v21, "replaceCharactersInRange:withString:", 0, 1, v23);

        [v21 insertString:@"set" atIndex:0];
        [v21 appendString:@":"];
        id v24 = v21;
        SEL v18 = sel_getUid((const char *)[v24 UTF8String]);
      }
    }
    v6[2](v6, v12, Uid, v18);
  }

  return v12 != 0;
}

void __39__MPModelObject_resolveInstanceMethod___block_invoke(uint64_t a1, objc_property_t property, const char *a3, const char *a4)
{
  objc_super v7 = property_copyAttributeValue(property, "T");
  if (sel_isEqual(*(SEL *)(a1 + 40), a3))
  {
    int v8 = *v7;
    if (v8 > 82)
    {
      switch(*v7)
      {
        case 'c':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "c@:";
          v12 = (void (*)(void))_MPModelObject_c_getterIMP;
          break;
        case 'd':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "d@:";
          v12 = (void (*)(void))_MPModelObject_d_getterIMP;
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_23;
        case 'f':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "f@:";
          v12 = (void (*)(void))_MPModelObject_f_getterIMP;
          break;
        case 'i':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "i@:";
          v12 = (void (*)(void))_MPModelObject_i_getterIMP;
          break;
        case 'l':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "l@:";
          v12 = (void (*)(void))_MPModelObject_l_getterIMP;
          break;
        case 'q':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "q@:";
          v12 = (void (*)(void))_MPModelObject_q_getterIMP;
          break;
        case 's':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "s@:";
          v12 = (void (*)(void))_MPModelObject_s_getterIMP;
          break;
        default:
          if (v8 != 83) {
            goto LABEL_23;
          }
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "S@:";
          v12 = (void (*)(void))_MPModelObject_S_getterIMP;
          break;
      }
    }
    else
    {
      switch(*v7)
      {
        case '@':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "@@:";
          v12 = (void (*)(void))_MPModelObject__getterIMP;
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_23;
        case 'B':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "B@:";
          v12 = (void (*)(void))_MPModelObject_B_getterIMP;
          break;
        case 'C':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "C@:";
          v12 = (void (*)(void))_MPModelObject_C_getterIMP;
          break;
        case 'I':
          id v10 = *(const char **)(a1 + 40);
          uint64_t v9 = *(objc_class **)(a1 + 48);
          v11 = "I@:";
          v12 = (void (*)(void))_MPModelObject_I_getterIMP;
          break;
        default:
          if (v8 == 76)
          {
            id v10 = *(const char **)(a1 + 40);
            uint64_t v9 = *(objc_class **)(a1 + 48);
            v11 = "L@:";
            v12 = (void (*)(void))_MPModelObject_L_getterIMP;
          }
          else
          {
            if (v8 != 81) {
              goto LABEL_23;
            }
            id v10 = *(const char **)(a1 + 40);
            uint64_t v9 = *(objc_class **)(a1 + 48);
            v11 = "Q@:";
            v12 = (void (*)(void))_MPModelObject_Q_getterIMP;
          }
          break;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = class_addMethod(v9, v10, v12, v11);
  }
LABEL_23:
  if (sel_isEqual(*(SEL *)(a1 + 40), a4))
  {
    int v13 = *v7;
    if (v13 > 82)
    {
      switch(*v7)
      {
        case 'c':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:c";
          uint64_t v17 = (void (*)(void))_MPModelObject_c_setterIMP;
          break;
        case 'd':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:d";
          uint64_t v17 = (void (*)(void))_MPModelObject_d_setterIMP;
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_45;
        case 'f':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:f";
          uint64_t v17 = (void (*)(void))_MPModelObject_f_setterIMP;
          break;
        case 'i':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:i";
          uint64_t v17 = (void (*)(void))_MPModelObject_i_setterIMP;
          break;
        case 'l':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:l";
          uint64_t v17 = (void (*)(void))_MPModelObject_l_setterIMP;
          break;
        case 'q':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:q";
          uint64_t v17 = (void (*)(void))_MPModelObject_q_setterIMP;
          break;
        case 's':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:s";
          uint64_t v17 = (void (*)(void))_MPModelObject_s_setterIMP;
          break;
        default:
          if (v13 != 83) {
            goto LABEL_45;
          }
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:S";
          uint64_t v17 = (void (*)(void))_MPModelObject_S_setterIMP;
          break;
      }
    }
    else
    {
      switch(*v7)
      {
        case '@':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:@";
          uint64_t v17 = (void (*)(void))_MPModelObject__setterIMP;
          break;
        case 'A':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
          goto LABEL_45;
        case 'B':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:B";
          uint64_t v17 = (void (*)(void))_MPModelObject_B_setterIMP;
          break;
        case 'C':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:C";
          uint64_t v17 = (void (*)(void))_MPModelObject_C_setterIMP;
          break;
        case 'I':
          uint64_t v15 = *(const char **)(a1 + 40);
          id v14 = *(objc_class **)(a1 + 48);
          char v16 = "v@:I";
          uint64_t v17 = (void (*)(void))_MPModelObject_I_setterIMP;
          break;
        default:
          if (v13 == 76)
          {
            uint64_t v15 = *(const char **)(a1 + 40);
            id v14 = *(objc_class **)(a1 + 48);
            char v16 = "v@:L";
            uint64_t v17 = (void (*)(void))_MPModelObject_L_setterIMP;
          }
          else
          {
            if (v13 != 81) {
              goto LABEL_45;
            }
            uint64_t v15 = *(const char **)(a1 + 40);
            id v14 = *(objc_class **)(a1 + 48);
            char v16 = "v@:Q";
            uint64_t v17 = (void (*)(void))_MPModelObject_Q_setterIMP;
          }
          break;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = class_addMethod(v14, v15, v17, v16);
  }
LABEL_45:

  free(v7);
}

- (id)contentItemCollectionInfo
{
  return 0;
}

- (id)mediaItemPropertyValues
{
  return 0;
}

- (MPLibraryAddStatusObserverConfiguration)libraryAddStatusObserverConfiguration
{
  return (MPLibraryAddStatusObserverConfiguration)0;
}

+ (id)requiredLibraryAddStatusObservationProperties
{
  return 0;
}

+ (BOOL)supportsLibraryAddStatusObservation
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSArray)classesForSecureCoding
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)_sanitizedStorage
{
  pthread_key_t v3 = (void *)[(NSMutableDictionary *)self->_storage mutableCopy];
  storage = self->_storage;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__MPModelObject__sanitizedStorage__block_invoke;
  v7[3] = &unk_1E57F5FB0;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)storage enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __34__MPModelObject__sanitizedStorage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([(id)objc_opt_class() supportsSecureCoding] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

- (BOOL)_isModelKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_class();
  id v5 = objc_getAssociatedObject(v4, (const void *)_MPModelObjectModelKeyPropertyIndexKey);
  uint64_t v6 = [v5 objectForKey:v3];

  return v6 != 0;
}

- (id)_stateDumpObject
{
  v8[3] = *MEMORY[0x1E4F143B8];
  storage = self->_storage;
  v7[0] = @"data";
  v7[1] = @"identifiers";
  identifiers = self->_identifiers;
  v8[0] = storage;
  v8[1] = identifiers;
  v7[2] = @"_obj";
  BOOL v4 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (id)mergeWithObject:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_6;
            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_6;
          }
        }
LABEL_13:

        uint64_t v9 = v6;
        goto LABEL_14;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_13;
  }
LABEL_6:
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_15;
  }
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v10 = objc_opt_class();
  [v9 handleFailureInMethod:a2, v6, @"MPModelObject.m", 425, @"MPModelObject mergeWithObject: cannot merge objects [] self.class=%@ object.class%@", v10, objc_opt_class() object file lineNumber description];
LABEL_14:

LABEL_15:
  v11 = [(MPModelObject *)v6 identifiers];
  v12 = [v7 identifiers];
  int v13 = [v11 unionSet:v12];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __33__MPModelObject_mergeWithObject___block_invoke;
  v17[3] = &unk_1E57F4AB8;
  id v18 = v7;
  id v14 = v7;
  id v15 = [(MPModelObject *)v6 copyWithIdentifiers:v13 block:v17];

  return v15;
}

void __33__MPModelObject_mergeWithObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MPModelObject_mergeWithObject___block_invoke_2;
  v6[3] = &unk_1E57F5FB0;
  id v7 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __33__MPModelObject_mergeWithObject___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v10];
  id v7 = [MEMORY[0x1E4F1CA98] null];

  if (v7 != v5 || v6 == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v9 = [v6 mergeWithObject:v5];
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v9 forKeyedSubscript:v10];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:v10];
    }
  }
}

- (id)copyWithIdentifiers:(id)a3 propertySet:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke;
  v10[3] = &unk_1E57F4A90;
  id v11 = v6;
  v12 = self;
  id v7 = v6;
  id v8 = [(MPModelObject *)self copyWithIdentifiers:a3 block:v10];

  return v8;
}

void __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3[1] removeAllObjects];
  BOOL v4 = [*(id *)(a1 + 32) properties];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke_2;
  v11[3] = &unk_1E57F4A68;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 40);
  v12 = v5;
  uint64_t v13 = v6;
  [v4 enumerateObjectsUsingBlock:v11];

  id v7 = [*(id *)(a1 + 32) relationships];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke_3;
  v9[3] = &unk_1E57F7950;
  v9[4] = *(void *)(a1 + 40);
  id v10 = v5;
  id v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

void __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "objectForKeyedSubscript:");
  if (v3)
  {
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v3 forKeyedSubscript:v5];
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F1CA98] null];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v4 forKeyedSubscript:v5];
  }
}

void __49__MPModelObject_copyWithIdentifiers_propertySet___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 copyWithPropertySet:v5];

    uint64_t v6 = (void *)v7;
  }
  if (v6)
  {
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v6 forKeyedSubscript:v9];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
    [*(id *)(*(void *)(a1 + 40) + 8) setObject:v8 forKeyedSubscript:v9];
  }
}

- (id)copyWithPropertySet:(id)a3
{
  id v4 = a3;
  id v5 = [(MPModelObject *)self identifiers];
  id v6 = [(MPModelObject *)self copyWithIdentifiers:v5 propertySet:v4];

  return v6;
}

- (id)copyWithIdentifiers:(id)a3
{
  return [(MPModelObject *)self copyWithIdentifiers:a3 block:&__block_literal_global_73_32975];
}

- (void)encodeWithCoder:(id)a3
{
  identifiers = self->_identifiers;
  id v5 = a3;
  [v5 encodeObject:identifiers forKey:@"identifiers"];
  id v6 = [(MPModelObject *)self _sanitizedStorage];
  [v5 encodeObject:v6 forKey:@"storage"];
}

- (MPModelObject)initWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MPModelObject;
  id v6 = [(MPModelObject *)&v32 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = objc_getAssociatedObject(v7, (const void *)_MPModelObjectPropertyClassesKey);
    id v9 = [(id)objc_opt_class() classesForSecureCoding];
    if ([v9 containsObject:objc_opt_class()])
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:v6 file:@"MPModelObject.m" lineNumber:290 description:@"classesForSecureCoding cannot contain NSObject"];
    }
    id v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count") + objc_msgSend(v9, "count") + 4);
    id v27 = v9;
    [v10 addObjectsFromArray:v9];
    [v10 addObject:objc_opt_class()];
    [v10 addObject:objc_opt_class()];
    [v10 addObject:objc_opt_class()];
    [v10 addObject:objc_opt_class()];
    [v10 addObject:objc_opt_class()];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          Class v16 = NSClassFromString(*(NSString **)(*((void *)&v28 + 1) + 8 * v15));
          if ((objc_opt_respondsToSelector() & 1) != 0
            && [(objc_class *)v16 supportsSecureCoding])
          {
            [v10 addObject:v16];
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"identifiers"];
    identifiers = v6->_identifiers;
    v6->_identifiers = (MPIdentifierSet *)v17;

    uint64_t v19 = [v5 decodeObjectOfClasses:v10 forKey:@"storage"];
    storage = v6->_storage;
    v6->_storage = (NSMutableDictionary *)v19;

    uint64_t v21 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"original"];
    uint64_t v22 = (void *)v21;
    if (v21)
    {
      id v23 = (NSMutableDictionary *)[*(id *)(v21 + 8) mutableCopy];
      [(NSMutableDictionary *)v23 addEntriesFromDictionary:v6->_storage];
      id v24 = v6->_storage;
      v6->_storage = v23;
    }
    v6->_isFinalized = 1;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      identifiers = self->_identifiers;
      uint64_t v7 = [v5 identifiers];
      if (identifiers == v7)
      {
      }
      else
      {
        BOOL v8 = [(MPIdentifierSet *)identifiers isEqual:v7];

        if (!v8)
        {
          char v9 = 0;
LABEL_12:

          goto LABEL_13;
        }
      }
      id v10 = [(MPModelObject *)self _sanitizedStorage];
      id v11 = [v5 _sanitizedStorage];
      if (v10 == v11) {
        char v9 = 1;
      }
      else {
        char v9 = [v10 isEqual:v11];
      }

      goto LABEL_12;
    }
  }
  char v9 = 0;
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MPIdentifierSet *)self->_identifiers hash];
  return [(NSMutableDictionary *)self->_storage hash] ^ v3;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MPModelObject *)self _isModelKey:v7]) {
    [(MPModelObject *)self setValue:v6 forModelKey:v7];
  }
  v8.receiver = self;
  v8.super_class = (Class)MPModelObject;
  [(MPModelObject *)&v8 setValue:v6 forUndefinedKey:v7];
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  if ([(MPModelObject *)self _isModelKey:v4])
  {
    uint64_t v5 = [(MPModelObject *)self valueForModelKey:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MPModelObject;
    uint64_t v5 = [(MPModelObject *)&v8 valueForUndefinedKey:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (NSString)humanDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MPModelObject *)self identifiers];
  if ([(NSMutableDictionary *)self->_storage count]) {
    storage = self->_storage;
  }
  else {
    storage = (NSMutableDictionary *)@"{}";
  }
  id v7 = [v3 stringWithFormat:@"<%@: %p identifiers=%@ properties=%@>", v4, self, v5, storage];

  return (NSString *)v7;
}

- (MPModelObject)initWithIdentifiers:(id)a3
{
  return [(MPModelObject *)self initWithIdentifiers:a3 block:&__block_literal_global_32998];
}

- (int64_t)libraryRemovalSupportedOptions
{
  return 0;
}

+ (BOOL)supportsLibraryRemoval
{
  return 0;
}

+ (id)requiredLibraryRemovalProperties
{
  return 0;
}

- (id)newKeepLocalStatusObserverConfiguration
{
  return 0;
}

+ (BOOL)supportsKeepLocalStatusObservation
{
  return 0;
}

+ (id)requiredKeepLocalStatusObservationProperties
{
  return 0;
}

+ (int64_t)genericObjectType
{
  return 0;
}

@end