@interface NSKeyValueNestedProperty
- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3;
- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7;
- (Class)_isaForAutonotifying;
- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 firstDotIndex:(unint64_t)a5 propertiesBeingInitialized:(__CFSet *)a6;
- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4;
- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3;
- (id)dependentValueKeyOrKeysIsASet:(BOOL *)a3;
- (id)description;
- (void)_addDependentValueKey:(id)a3;
- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4;
- (void)dealloc;
- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5;
- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5;
- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7;
@end

@implementation NSKeyValueNestedProperty

- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
  id result = [(NSKeyValueUnnestedProperty *)self->_relationshipProperty keyPathIfAffectedByValueForKey:a3 exactMatch:0];
  if (result) {
    return self->super._keyPath;
  }
  return result;
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(_OWORD *)NSKeyValueGetImplicitObservanceAdditionInfo() == __PAIR128__((unint64_t)a4, (unint64_t)a3))return 0; {
  a7->var0 = 0;
  }
  a7->var1 = 0;
  if (self->_isAllowedToResultInForwarding)
  {
    v13 = (void *)[a3 valueForKey:self->_relationshipKey];
    a7->var0 = v13;
    if (!v13) {
      a7->var0 = (id)[MEMORY[0x1E4F1CA98] null];
    }
  }
  uint64_t v15 = 0;
  v16 = 0;
  if ([(NSKeyValueUnnestedProperty *)self->_relationshipProperty object:a3 withObservance:a4 willChangeValueForKeyOrKeys:a5 recurse:v8 forwardingValues:&v15])
  {
    a7->var1 = v16;
  }
  return 1;
}

- (Class)_isaForAutonotifying
{
  return [(NSKeyValueUnnestedProperty *)self->_relationshipProperty isaForAutonotifying];
}

- (void)_addDependentValueKey:(id)a3
{
  v4 = (void *)[a3 copy];
  id dependentValueKeyOrKeys = self->_dependentValueKeyOrKeys;
  if (!dependentValueKeyOrKeys)
  {
    id v7 = v4;
    goto LABEL_5;
  }
  if (self->_dependentValueKeyOrKeysIsASet)
  {
    v6 = (void *)[dependentValueKeyOrKeys setByAddingObject:v4];

    id v7 = v6;
LABEL_5:
    self->_id dependentValueKeyOrKeys = v7;
    goto LABEL_7;
  }
  BOOL v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", self->_dependentValueKeyOrKeys, v4, 0);

  self->_id dependentValueKeyOrKeys = v8;
  self->_dependentValueKeyOrKeysIsASet = 1;
LABEL_7:

  MEMORY[0x1F41817F8]();
}

- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4
{
}

- (id)_initWithContainerClass:(id)a3 keyPath:(id)a4 firstDotIndex:(unint64_t)a5 propertiesBeingInitialized:(__CFSet *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)NSKeyValueNestedProperty;
  id v9 = [(NSKeyValueProperty *)&v19 _initWithContainerClass:a3 keyPath:a4 propertiesBeingInitialized:a6];
  if (v9)
  {
    *((void *)v9 + 3) = objc_msgSend((id)objc_msgSend(a4, "substringToIndex:", a5), "copy");
    *((void *)v9 + 4) = objc_msgSend((id)objc_msgSend(a4, "substringFromIndex:", a5 + 1), "copy");
    *((void *)v9 + 5) = NSKeyValuePropertyForIsaAndKeyPathInner(*(objc_class **)(*((void *)v9 + 1) + 8), *((void **)v9 + 3), a6);
    uint64_t v10 = [a4 rangeOfString:@".@"];
    if (v11)
    {
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      v14 = (void *)[a4 substringToIndex:v10];
      uint64_t v15 = objc_msgSend(a4, "rangeOfString:options:range:", @".", 0, v12 + v13, objc_msgSend(a4, "length") - (v12 + v13));
      if (v16) {
        v14 = objc_msgSend(v14, "stringByAppendingString:", objc_msgSend(a4, "substringFromIndex:", v15));
      }
      *((void *)v9 + 6) = v14;
    }
    int v17 = [*(id *)(*((void *)v9 + 1) + 8) _shouldAddObservationForwardersForKey:*((void *)v9 + 3)];
    *((unsigned char *)v9 + 56) = v17;
    if (v17
      && [*((id *)v9 + 4) hasPrefix:@"@"]
      && [*((id *)v9 + 4) rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
    {
      *((unsigned char *)v9 + 56) = 0;
    }
  }
  return v9;
}

- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  id result = [(NSKeyValueUnnestedProperty *)self->_relationshipProperty keyPathIfAffectedByValueForMemberOfKeys:a3];
  if (result) {
    return self->super._keyPath;
  }
  return result;
}

- (id)dependentValueKeyOrKeysIsASet:(BOOL *)a3
{
  *a3 = self->_dependentValueKeyOrKeysIsASet;
  return self->_dependentValueKeyOrKeys;
}

- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5
{
  BOOL v17 = a5;
  if (self->_isAllowedToResultInForwarding)
  {
    os_unfair_recursive_lock_unlock();
    v6 = (void *)[a3 valueForKey:self->_relationshipKey];
    uint64_t ImplicitObservanceRemovalInfo = NSKeyValueGetImplicitObservanceRemovalInfo();
    uint64_t v8 = ImplicitObservanceRemovalInfo;
    uint64_t v9 = *(void *)ImplicitObservanceRemovalInfo;
    uint64_t v10 = *(void *)(ImplicitObservanceRemovalInfo + 8);
    uint64_t v11 = *(void *)(ImplicitObservanceRemovalInfo + 16);
    uint64_t v12 = *(void *)(ImplicitObservanceRemovalInfo + 24);
    uint64_t v13 = *(void *)(ImplicitObservanceRemovalInfo + 32);
    char v14 = *(unsigned char *)(ImplicitObservanceRemovalInfo + 40);
    *(void *)uint64_t ImplicitObservanceRemovalInfo = v6;
    *(void *)(ImplicitObservanceRemovalInfo + 8) = a4;
    *(void *)(ImplicitObservanceRemovalInfo + 16) = self->_keyPathFromRelatedObject;
    *(void *)(ImplicitObservanceRemovalInfo + 24) = a3;
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = self;
    }
    *(void *)(ImplicitObservanceRemovalInfo + 32) = v15;
    *(unsigned char *)(ImplicitObservanceRemovalInfo + 40) = 1;
    objc_msgSend(v6, "removeObserver:forKeyPath:");
    *(void *)uint64_t v8 = v9;
    *(void *)(v8 + 8) = v10;
    *(void *)(v8 + 16) = v11;
    *(void *)(v8 + 24) = v12;
    *(void *)(v8 + 32) = v13;
    *(unsigned char *)(v8 + 40) = v14;
    os_unfair_recursive_lock_lock_with_options();
  }
  relationshipProperty = self->_relationshipProperty;

  [(NSKeyValueUnnestedProperty *)relationshipProperty object:a3 didRemoveObservance:a4 recurse:v17];
}

- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7
{
  id var1 = a7.var1;
  id var0 = a7.var0;
  BOOL v23 = a6;
  if (self->_isAllowedToResultInForwarding)
  {
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self)
    {
      uint64_t v8 = 0;
      uint64_t v18 = *((unsigned char *)a4 + 40) & 0xF | 0x100;
    }
    else
    {
      uint64_t v18 = 264;
      uint64_t v8 = self;
    }
    if ((id)[MEMORY[0x1E4F1CA98] null] == a7.var0) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = var0;
    }
    uint64_t ImplicitObservanceRemovalInfo = NSKeyValueGetImplicitObservanceRemovalInfo();
    uint64_t v11 = *(void *)(ImplicitObservanceRemovalInfo + 8);
    uint64_t v12 = *(void *)(ImplicitObservanceRemovalInfo + 24);
    uint64_t v19 = *(void *)ImplicitObservanceRemovalInfo;
    uint64_t v20 = *(void *)(ImplicitObservanceRemovalInfo + 16);
    uint64_t v13 = *(void *)(ImplicitObservanceRemovalInfo + 32);
    char v21 = *(unsigned char *)(ImplicitObservanceRemovalInfo + 40);
    *(void *)uint64_t ImplicitObservanceRemovalInfo = v9;
    *(void *)(ImplicitObservanceRemovalInfo + 8) = a4;
    *(void *)(ImplicitObservanceRemovalInfo + 16) = self->_keyPathFromRelatedObject;
    *(void *)(ImplicitObservanceRemovalInfo + 24) = a3;
    *(void *)(ImplicitObservanceRemovalInfo + 32) = v8;
    *(unsigned char *)(ImplicitObservanceRemovalInfo + 40) = 1;
    [v9 removeObserver:a4 forKeyPath:self->_keyPathFromRelatedObject];
    *(void *)uint64_t ImplicitObservanceRemovalInfo = v19;
    *(void *)(ImplicitObservanceRemovalInfo + 8) = v11;
    *(void *)(ImplicitObservanceRemovalInfo + 16) = v20;
    *(void *)(ImplicitObservanceRemovalInfo + 24) = v12;
    *(void *)(ImplicitObservanceRemovalInfo + 32) = v13;
    *(unsigned char *)(ImplicitObservanceRemovalInfo + 40) = v21;
    ImplicitObservanceAdditionInfo = (uint64_t *)NSKeyValueGetImplicitObservanceAdditionInfo();
    uint64_t v15 = *ImplicitObservanceAdditionInfo;
    uint64_t v16 = ImplicitObservanceAdditionInfo[1];
    uint64_t *ImplicitObservanceAdditionInfo = (uint64_t)a3;
    ImplicitObservanceAdditionInfo[1] = (uint64_t)a4;
    objc_msgSend((id)objc_msgSend(a3, "valueForKey:", self->_relationshipKey), "addObserver:forKeyPath:options:context:", a4, self->_keyPathFromRelatedObject, v18, v8);
    uint64_t *ImplicitObservanceAdditionInfo = v15;
    ImplicitObservanceAdditionInfo[1] = v16;
  }
  if (var1)
  {
    relationshipProperty = self->_relationshipProperty;
    [(NSKeyValueUnnestedProperty *)relationshipProperty object:a3 withObservance:a4 didChangeValueForKeyOrKeys:a5 recurse:v23 forwardingValues:var0];
  }
}

- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5
{
  BOOL v5 = a5;
  if (_NSKeyValueObserverRegistrationEnableLockingAssertions) {
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_NSKeyValueObserverRegistrationLock);
  }
  if (self->_isAllowedToResultInForwarding)
  {
    if (*((NSKeyValueNestedProperty **)a4 + 2) == self)
    {
      uint64_t v10 = 0;
      uint64_t v9 = *((unsigned char *)a4 + 40) & 0xF | 0x100;
    }
    else
    {
      uint64_t v9 = 264;
      uint64_t v10 = self;
    }
    uint64_t ImplicitObservanceAdditionInfo = NSKeyValueGetImplicitObservanceAdditionInfo();
    long long v13 = *(_OWORD *)ImplicitObservanceAdditionInfo;
    *(void *)uint64_t ImplicitObservanceAdditionInfo = a3;
    *(void *)(ImplicitObservanceAdditionInfo + 8) = a4;
    os_unfair_recursive_lock_unlock();
    id v12 = (id)[a3 valueForKey:self->_relationshipKey];
    [v12 addObserver:a4 forKeyPath:self->_keyPathFromRelatedObject options:v9 context:v10];

    os_unfair_recursive_lock_lock_with_options();
    *(_OWORD *)uint64_t ImplicitObservanceAdditionInfo = v13;
  }
  -[NSKeyValueUnnestedProperty object:didAddObservance:recurse:](self->_relationshipProperty, "object:didAddObservance:recurse:", a3, a4, v5, v13);
  if (_NSKeyValueObserverRegistrationEnableLockingAssertions)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)&_NSKeyValueObserverRegistrationLock);
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueNestedProperty;
  [(NSKeyValueProperty *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: Container class: %@, Relationship property: %@, Key path from related object: %@>", objc_opt_class(), self->super._containerClass->_originalClass, self->_relationshipProperty, self->_keyPathFromRelatedObject];
}

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  keyPathWithoutOperatorComponents = self->_keyPathWithoutOperatorComponents;
  if (!keyPathWithoutOperatorComponents) {
    keyPathWithoutOperatorComponents = self->super._keyPath;
  }
  return keyPathWithoutOperatorComponents == a3 || CFEqual(a3, keyPathWithoutOperatorComponents) != 0;
}

@end