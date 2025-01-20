@interface _NSObserverList
+ (void)_copyObserversOfObject:(int)a3 creatingIfAbsent:;
+ (void)destroyObserverListForObject:(uint64_t)a1;
- (NSObservation)addBlockSink:(uint64_t)a3 toObservableObject:(uint64_t)a4 forTag:;
- (NSObservation)addObserver:(void *)a3 toObservableObject:;
- (_NSObserverList)init;
- (id)description;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
- (void)finishObserving;
- (void)removeObservation:(id)a3;
@end

@implementation _NSObserverList

+ (void)_copyObserversOfObject:(int)a3 creatingIfAbsent:
{
  v5 = (objc_class *)self;
  if (qword_1EB1EDED8 != -1) {
    dispatch_once(&qword_1EB1EDED8, &__block_literal_global_84);
  }
  uint64_t v6 = [a2 _observerStorageOfSize:qword_1EB1EDEC8];
  if (v6)
  {
    v7 = (void *)v6;
    os_unfair_lock_lock_with_options();
    if (!*v7)
    {
      objc_constructInstance((Class)qword_1EB1EDED0, v7);
      v7[1] = a2;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
    return v7;
  }
  else
  {
    v9 = (void **)[a2 _observerStorage];
    os_unfair_lock_lock_with_options();
    if (v9)
    {
      v10 = *v9;
      if (!*v9 && a3)
      {
        v11 = objc_alloc_init(v5);
        *v9 = v11;
        v11[1] = a2;
        v10 = *v9;
      }
      id v12 = v10;
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
      return v12;
    }
    else
    {
      v13 = objc_getAssociatedObject(a2, "_NSObserverListInternalKey");
      if (!v13 && a3)
      {
        v13 = objc_alloc_init(v5);
        v13[1] = a2;
        objc_setAssociatedObject(a2, "_NSObserverListInternalKey", v13, (void *)0x301);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
      return v13;
    }
  }
}

+ (void)destroyObserverListForObject:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __48___NSObserverList_destroyObserverListForObject___block_invoke;
  v11 = &unk_1E51F71D0;
  uint64_t v12 = v3;
  if (qword_1EB1EDEE8 != -1) {
    dispatch_once(&qword_1EB1EDEE8, &v8);
  }
  uint64_t v4 = objc_msgSend(a2, "_observerStorageOfSize:", qword_1EB1EDEE0, v8, v9, v10, v11, v12, v13);
  if (v4)
  {
    v5 = (void *)v4;
    if (*(void **)(v4 + 8) == a2)
    {
      clearAllObservers(v4);
      objc_destructInstance(v5);
    }
  }
  else
  {
    uint64_t v6 = (void **)[a2 _observerStorage];
    if (!v6)
    {
      NSLog((NSString *)@"Using +destroyObserverListForObject: on an object without inline observer storage is invalid");
      abort();
    }
    v7 = *v6;
    if (v7) {
  }
    }
}

- (_NSObserverList)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)_NSObserverList;
  result = [(_NSObserverList *)&v3 init];
  if (result) {
    result->_observersLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (NSObservation)addBlockSink:(uint64_t)a3 toObservableObject:(uint64_t)a4 forTag:
{
  if (result)
  {
    uint64_t v4 = (uint64_t)result;
    v5 = [[NSObservation alloc] initWithObservable:a3 blockSink:a2 tag:a4];
    addObserver(v4, v5);
    return v5;
  }
  return result;
}

- (NSObservation)addObserver:(void *)a3 toObservableObject:
{
  if (!result) {
    return result;
  }
  uint64_t v5 = (uint64_t)result;
  if (([a2 conformsToProtocol:&unk_1ECACB5F0] & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = +[NSString stringWithFormat:@"Attempt to add non-NSObserver object %@ as an observer of %@", a2, a3];
    goto LABEL_10;
  }
  if (([a3 conformsToProtocol:&unk_1ECACB590] & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = +[NSString stringWithFormat:@"Attempt to add %@ as an observer of non-NSObservable object %@", a2, a3];
LABEL_10:
    objc_exception_throw((id)[v7 exceptionWithName:v8 reason:v9 userInfo:0]);
  }
  uint64_t v6 = [[NSObservation alloc] initWithObservable:a3 observer:a2];
  addObserver(v5, a2);

  return v6;
}

- (void)finishObserving
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id owner = self->_owner;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  uint64_t v9 = __34___NSObserverList_finishObserving__block_invoke;
  v10 = &unk_1E51F76A8;
  v11 = self;
  v12[0] = 0;
  uint64_t StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v12);
  MEMORY[0x1F4188790](StackObservedValueClassAndBoxSize);
  uint64_t v6 = objc_constructInstance(v5, (char *)&v8[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6[6] = 3;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = owner;
  v9((uint64_t)v8, (uint64_t)v6);
}

- (void)removeObservation:(id)a3
{
}

- (void)_receiveBox:(id)a3
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31___NSObserverList__receiveBox___block_invoke;
  v5[3] = &unk_1E51FE568;
  v5[4] = a3;
  v5[5] = self;
  withUnlockedObservers((uint64_t)self, (uint64_t)v5);
  if (*((_DWORD *)a3 + 6) == 3) {
    clearAllObservers((uint64_t)self);
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  clearAllObservers((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_NSObserverList;
  [(_NSObserverList *)&v3 dealloc];
}

- (id)description
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__32;
  uint64_t v9 = __Block_byref_object_dispose__32;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30___NSObserverList_description__block_invoke;
  v4[3] = &unk_1E51FE590;
  v4[4] = self;
  v4[5] = &v5;
  withUnlockedObservers((uint64_t)self, (uint64_t)v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void).cxx_destruct
{
}

@end