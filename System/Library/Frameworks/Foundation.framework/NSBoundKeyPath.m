@interface NSBoundKeyPath
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)keyPathWithRootObject:(id)a3 path:(const char *)a4;
+ (id)newKeyPathWithRootObject:(id)a3 keyPathString:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateValue:(id *)a3 error:(id *)a4;
- (NSString)keyPath;
- (id)mutableArrayValue;
- (id)mutableOrderedSetValue;
- (id)mutableSetValue;
- (id)rootObject;
- (id)value;
- (unint64_t)hash;
- (void)dealloc;
- (void)setRootObject:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NSBoundKeyPath

- (id)rootObject
{
  return objc_loadWeak(&self->_rootObject);
}

+ (id)keyPathWithRootObject:(id)a3 path:(const char *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = [[NSString alloc] initWithUTF8String:a4];
  uint64_t v7 = objc_opt_class();
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v12 = v8;
  id v13 = a3;
  v14 = v6;
  os_unfair_lock_lock_with_options();
  CFSetRef Mutable = (const __CFSet *)qword_1EB1EC990;
  if (!qword_1EB1EC990)
  {
    CFSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &keyPathWithRootObject_path__callbacks);
    qword_1EB1EC990 = (uint64_t)Mutable;
  }
  v10 = (id)CFSetGetValue(Mutable, &v12);
  if (!v10)
  {
    v10 = objc_msgSend(a1, "newKeyPathWithRootObject:keyPathString:", a3, v6, v12, v13, v14, v15);
    if (v10) {
      CFSetAddValue((CFMutableSetRef)qword_1EB1EC990, v10);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_19_0);

  return v10;
}

+ (id)newKeyPathWithRootObject:(id)a3 keyPathString:(id)a4
{
  Instance = class_createInstance((Class)a1, 0);
  Instance[2] = a4;
  [Instance setRootObject:a3];
  return Instance;
}

- (void)setRootObject:(id)a3
{
}

- (NSString)keyPath
{
  v2 = (void *)[(NSString *)self->_keyPath copy];

  return (NSString *)v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock_with_options();
  if (qword_1EB1EC990) {
    CFSetRemoveValue((CFMutableSetRef)qword_1EB1EC990, self);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_19_0);
  objc_storeWeak(&self->_rootObject, 0);

  v3.receiver = self;
  v3.super_class = (Class)NSBoundKeyPath;
  [(NSBoundKeyPath *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v5 = (void *)[a3 rootObject];
  return v5 == [(NSBoundKeyPath *)self rootObject];
}

- (unint64_t)hash
{
  return [(NSString *)self->_keyPath hash];
}

- (BOOL)validateValue:(id *)a3 error:(id *)a4
{
  id v7 = [(NSBoundKeyPath *)self rootObject];
  keyPath = self->_keyPath;

  return [v7 validateValue:a3 forKeyPath:keyPath error:a4];
}

- (id)value
{
  id v3 = [(NSBoundKeyPath *)self rootObject];
  keyPath = self->_keyPath;

  return (id)[v3 valueForKeyPath:keyPath];
}

- (void)setValue:(id)a3
{
  id v5 = [(NSBoundKeyPath *)self rootObject];
  keyPath = self->_keyPath;

  [v5 setValue:a3 forKeyPath:keyPath];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)mutableArrayValue
{
  id v3 = [(NSBoundKeyPath *)self rootObject];
  keyPath = self->_keyPath;

  return (id)[v3 mutableArrayValueForKeyPath:keyPath];
}

- (id)mutableOrderedSetValue
{
  id v3 = [(NSBoundKeyPath *)self rootObject];
  keyPath = self->_keyPath;

  return (id)[v3 mutableOrderedSetValueForKeyPath:keyPath];
}

- (id)mutableSetValue
{
  id v3 = [(NSBoundKeyPath *)self rootObject];
  keyPath = self->_keyPath;

  return (id)[v3 mutableSetValueForKeyPath:keyPath];
}

- (void).cxx_destruct
{
}

@end