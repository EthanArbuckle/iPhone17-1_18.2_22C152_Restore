@interface NSKeyValueUnnestedProperty
- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3;
- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7;
- (Class)_isaForAutonotifying;
- (Class)isaForAutonotifying;
- (id)_initWithContainerClass:(id)a3 key:(id)a4 propertiesBeingInitialized:(__CFSet *)a5;
- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4;
- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3;
- (id)description;
- (id)keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4;
- (id)keyPathIfAffectedByValueForMemberOfKeys:(id)a3;
- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4;
- (void)dealloc;
- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5;
- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5;
- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7;
@end

@implementation NSKeyValueUnnestedProperty

- (id)keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id result = -[NSKeyValueUnnestedProperty _keyPathIfAffectedByValueForKey:exactMatch:](self, "_keyPathIfAffectedByValueForKey:exactMatch:");
  if (!result)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    affectingProperties = self->_affectingProperties;
    id result = (id)[(NSArray *)affectingProperties countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (result)
    {
      id v9 = result;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(affectingProperties);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) _keyPathIfAffectedByValueForKey:a3 exactMatch:0])
          {
            id result = self->super._keyPath;
            if (a4) {
              *a4 = 0;
            }
            return result;
          }
        }
        id v9 = (id)[(NSArray *)affectingProperties countByEnumeratingWithState:&v13 objects:v12 count:16];
        id result = 0;
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (id)_keyPathIfAffectedByValueForKey:(id)a3 exactMatch:(BOOL *)a4
{
  keyPath = self->super._keyPath;
  if (keyPath != a3 && !CFEqual(a3, keyPath)) {
    return 0;
  }
  if (a4) {
    *a4 = 1;
  }
  return self->super._keyPath;
}

- (BOOL)object:(id)a3 withObservance:(id)a4 willChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id *)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    if (self->_affectingProperties)
    {
      int v11 = _NSIsNSSet();
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      affectingProperties = self->_affectingProperties;
      uint64_t v13 = [(NSArray *)affectingProperties countByEnumeratingWithState:&v24 objects:v23 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        long long v15 = 0;
        uint64_t v16 = *(void *)v25;
        while (1)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(affectingProperties);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (v11)
            {
              if (![v18 keyPathIfAffectedByValueForMemberOfKeys:a5]) {
                continue;
              }
            }
            else if (![v18 keyPathIfAffectedByValueForKey:a5 exactMatch:0])
            {
              continue;
            }
            uint64_t v21 = 0;
            v22 = 0;
            if ([v18 object:a3 withObservance:a4 willChangeValueForKeyOrKeys:a5 recurse:0 forwardingValues:&v21])
            {
              if (v21)
              {
                if (v15) {
                  objc_msgSend(v15, "setObject:forKey:");
                }
                else {
                  long long v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:");
                }
              }
              if (v22)
              {
                if (v15) {
                  objc_msgSend(v15, "addEntriesFromDictionary:");
                }
                else {
                  long long v15 = v22;
                }
              }
            }
          }
          uint64_t v14 = [(NSArray *)affectingProperties countByEnumeratingWithState:&v24 objects:v23 count:16];
          if (!v14) {
            goto LABEL_25;
          }
        }
      }
    }
  }
  long long v15 = 0;
LABEL_25:
  a7->var0 = 0;
  a7->var1 = v15;
  return 1;
}

- (void)object:(id)a3 withObservance:(id)a4 didChangeValueForKeyOrKeys:(id)a5 recurse:(BOOL)a6 forwardingValues:(id)a7
{
  id var1 = a7.var1;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = objc_msgSend(a7.var1, "countByEnumeratingWithState:objects:count:", &v16, v15, 16, a6, a7.var0);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(var1);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "object:withObservance:didChangeValueForKeyOrKeys:recurse:forwardingValues:", a3, a4, a5, 0, objc_msgSend(var1, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v14)), 0);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [var1 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }
    while (v12);
  }
}

- (Class)isaForAutonotifying
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_cachedIsaForAutonotifyingIsValid)
  {
    self->_cachedIsaForAutonotifying = [(NSKeyValueUnnestedProperty *)self _isaForAutonotifying];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    affectingProperties = self->_affectingProperties;
    uint64_t v4 = [(NSArray *)affectingProperties countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(affectingProperties);
          }
          v8 = (objc_class *)[*(id *)(*((void *)&v11 + 1) + 8 * i) _isaForAutonotifying];
          if (v8) {
            self->_cachedIsaForAutonotifying = v8;
          }
        }
        uint64_t v5 = [(NSArray *)affectingProperties countByEnumeratingWithState:&v11 objects:v10 count:16];
      }
      while (v5);
    }
    self->_cachedIsaForAutonotifyingIsValid = 1;
  }
  return self->_cachedIsaForAutonotifying;
}

- (void)object:(id)a3 didAddObservance:(id)a4 recurse:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    affectingProperties = self->_affectingProperties;
    if (affectingProperties)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v8 = [(NSArray *)affectingProperties countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(affectingProperties);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) object:a3 didAddObservance:a4 recurse:0];
          }
          uint64_t v9 = [(NSArray *)affectingProperties countByEnumeratingWithState:&v13 objects:v12 count:16];
        }
        while (v9);
      }
    }
  }
}

- (Class)_isaForAutonotifying
{
  if (![(objc_class *)self->super._containerClass->_originalClass automaticallyNotifiesObserversForKey:self->super._keyPath])return 0; {
  Class result = (Class)_NSKeyValueContainerClassGetNotifyingInfo((uint64_t)self->super._containerClass);
  }
  if (result)
  {
    Class v4 = result;
    _NSKVONotifyingEnableForInfoAndKey((uint64_t)result, self->super._keyPath);
    return (Class)*((void *)v4 + 1);
  }
  return result;
}

- (id)_initWithContainerClass:(id)a3 key:(id)a4 propertiesBeingInitialized:(__CFSet *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)NSKeyValueUnnestedProperty;
  uint64_t v6 = -[NSKeyValueProperty _initWithContainerClass:keyPath:propertiesBeingInitialized:](&v14, sel__initWithContainerClass_keyPath_propertiesBeingInitialized_, a3, a4);
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v6 _givenPropertiesBeingInitialized:a5 getAffectingProperties:v7];
    [v7 removeObject:v6];
    uint64_t v8 = [v7 count];
    if (v8) {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "allObjects"), "copy");
    }
    v6[3] = v8;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = (void *)v6[3];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v12++) _addDependentValueKey:v6[2]];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v15 count:16];
      }
      while (v10);
    }
  }
  return v6;
}

- (void)_givenPropertiesBeingInitialized:(__CFSet *)a3 getAffectingProperties:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_affectingProperties)
  {
    id v7 = (void *)[(objc_class *)self->super._containerClass->_originalClass keyPathsForValuesAffectingValueForKey:self->super._keyPath];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (!v8) {
      return;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 isEqualToString:self->super._keyPath])
        {
          objc_super v14 = +[NSString stringWithFormat:@"%@: A +keyPathsForValuesAffectingValueForKey: message returned a set that includes the same key that was passed in, which is not valid.\nPassed-in key: %@\nReturned key path set: %@", self->super._containerClass->_originalClass, self->super._keyPath, v7];
          goto LABEL_19;
        }
        if (objc_msgSend(v12, "hasPrefix:", -[NSString stringByAppendingString:](self->super._keyPath, "stringByAppendingString:", @".")))
        {
          objc_super v14 = +[NSString stringWithFormat:@"%@: A +keyPathsForValuesAffectingValueForKey: message returned a set that includes a key path that starts with the same key that was passed in, which is not valid. The property identified by the key path already depends on the property identified by the key, never vice versa.\nPassed-in key: %@\nReturned key path set: %@", self->super._containerClass->_originalClass, self->super._keyPath, v7];
LABEL_19:
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v14 userInfo:0]);
        }
        long long v13 = NSKeyValuePropertyForIsaAndKeyPathInner(self->super._containerClass->_originalClass, v12, a3);
        if (([a4 containsObject:v13] & 1) == 0)
        {
          [a4 addObject:v13];
          [v13 _givenPropertiesBeingInitialized:a3 getAffectingProperties:a4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (!v9) {
        return;
      }
    }
  }

  objc_msgSend(a4, "addObjectsFromArray:");
}

- (id)keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id result = -[NSKeyValueUnnestedProperty _keyPathIfAffectedByValueForMemberOfKeys:](self, "_keyPathIfAffectedByValueForMemberOfKeys:");
  if (!result)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    affectingProperties = self->_affectingProperties;
    id result = (id)[(NSArray *)affectingProperties countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (result)
    {
      id v7 = result;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(affectingProperties);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) _keyPathIfAffectedByValueForMemberOfKeys:a3])
          {
            return self->super._keyPath;
          }
        }
        id v7 = (id)[(NSArray *)affectingProperties countByEnumeratingWithState:&v11 objects:v10 count:16];
        id result = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (id)_keyPathIfAffectedByValueForMemberOfKeys:(id)a3
{
  if ([a3 containsObject:self->super._keyPath]) {
    return self->super._keyPath;
  }
  else {
    return 0;
  }
}

- (void)object:(id)a3 didRemoveObservance:(id)a4 recurse:(BOOL)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    affectingProperties = self->_affectingProperties;
    if (affectingProperties)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v8 = [(NSArray *)affectingProperties countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(affectingProperties);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) object:a3 didRemoveObservance:a4 recurse:0];
          }
          uint64_t v9 = [(NSArray *)affectingProperties countByEnumeratingWithState:&v13 objects:v12 count:16];
        }
        while (v9);
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSKeyValueUnnestedProperty;
  [(NSKeyValueProperty *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (__CFString *)[(id)objc_msgSend(-[NSArray valueForKey:](self->_affectingProperties valueForKey:@"keyPath", "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_), "componentsJoinedByString:", @", "];
  uint64_t v4 = objc_opt_class();
  keyPath = self->super._keyPath;
  Class originalClass = self->super._containerClass->_originalClass;
  if (self->_cachedIsaForAutonotifyingIsValid) {
    Class cachedIsaForAutonotifying = self->_cachedIsaForAutonotifying;
  }
  else {
    Class cachedIsaForAutonotifying = (Class)@"not cached yet";
  }
  uint64_t v8 = [(__CFString *)v3 length];
  uint64_t v9 = @"none";
  if (v8) {
    uint64_t v9 = v3;
  }
  return +[NSString stringWithFormat:@"<%@: Container class: %@, Key: %@, isa for autonotifying: %@, Key paths of directly and indirectly affecting properties: %@>", v4, originalClass, keyPath, cachedIsaForAutonotifying, v9];
}

- (BOOL)matchesWithoutOperatorComponentsKeyPath:(id)a3
{
  keyPath = self->super._keyPath;
  return keyPath == a3 || CFEqual(a3, keyPath) != 0;
}

@end