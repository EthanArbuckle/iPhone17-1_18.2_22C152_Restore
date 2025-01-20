@interface JavaNioSelectorImpl
+ (const)__metadata;
- (JavaNioSelectorImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)checkClosed;
- (id)ensurePollFdsCapacity;
- (id)keys;
- (id)register__WithJavaNioChannelsSpiAbstractSelectableChannel:(id)a3 withInt:(int)a4 withId:(id)a5;
- (id)selectedKeys;
- (id)wakeup;
- (int)select;
- (int)selectInternalWithLong:(int64_t)a3;
- (int)selectNow;
- (int)selectWithLong:(int64_t)a3;
- (uint64_t)doCancel;
- (void)dealloc;
- (void)implCloseSelector;
- (void)setPollFdWithInt:(int)a3 withJavaIoFileDescriptor:(id)a4 withInt:(int)a5 withId:(id)a6;
@end

@implementation JavaNioSelectorImpl

- (JavaNioSelectorImpl)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

- (void)implCloseSelector
{
  [(JavaNioSelectorImpl *)self wakeup];
  objc_sync_enter(self);
  unmodifiableKeys = self->unmodifiableKeys_;
  objc_sync_enter(unmodifiableKeys);
  selectedKeys = self->selectedKeys_;
  objc_sync_enter(selectedKeys);
  LibcoreIoIoUtils_closeWithJavaIoFileDescriptor_(self->wakeupIn_);
  LibcoreIoIoUtils_closeWithJavaIoFileDescriptor_(self->wakeupOut_);
  -[JavaNioSelectorImpl doCancel]_0(self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mutableKeys = self->mutableKeys_;
  if (!mutableKeys) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaUtilSet *)self->mutableKeys_ countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(mutableKeys);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (v9 && (objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        -[JavaNioChannelsSpiAbstractSelector deregisterWithJavaNioChannelsSpiAbstractSelectionKey:](self, "deregisterWithJavaNioChannelsSpiAbstractSelectionKey:", v9, (void)v10);
      }
      id v6 = [(JavaUtilSet *)mutableKeys countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  objc_sync_exit(selectedKeys);
  objc_sync_exit(unmodifiableKeys);
  objc_sync_exit(self);
}

- (uint64_t)doCancel
{
  id v2 = [a1 cancelledKeys];
  objc_sync_enter(v2);
  if (!v2) {
    JreThrowNullPointerException();
  }
  if ((int)[v2 size] < 1)
  {
    uint64_t v3 = 0;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = 0;
    id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v12;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = (void *)a1[6];
          if (!v7) {
            goto LABEL_17;
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          [v7 removeWithId:v8];
          objc_opt_class();
          if (v8 && (objc_opt_isKindOfClass() & 1) == 0) {
            JreThrowClassCastException();
          }
          [a1 deregisterWithJavaNioChannelsSpiAbstractSelectionKey:v8];
          uint64_t v9 = (void *)a1[8];
          if (!v9) {
LABEL_17:
          }
            JreThrowNullPointerException();
          uint64_t v3 = v3 + [v9 removeWithId:v8];
        }
        id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
    [v2 clear];
  }
  objc_sync_exit(v2);
  return v3;
}

- (id)register__WithJavaNioChannelsSpiAbstractSelectableChannel:(id)a3 withInt:(int)a4 withId:(id)a5
{
  id v9 = [(JavaNioChannelsSpiAbstractSelector *)self provider];
  if (!v9 || !a3) {
    JreThrowNullPointerException();
  }
  if ((objc_msgSend(v9, "isEqual:", objc_msgSend(a3, "provider")) & 1) == 0)
  {
    long long v14 = new_JavaNioChannelsIllegalSelectorException_init();
    objc_exception_throw(v14);
  }
  objc_sync_enter(self);
  unmodifiableKeys = self->unmodifiableKeys_;
  objc_sync_enter(unmodifiableKeys);
  long long v11 = new_JavaNioSelectionKeyImpl_initWithJavaNioChannelsSpiAbstractSelectableChannel_withInt_withId_withJavaNioSelectorImpl_(a3, a4, (uint64_t)a5, self);
  mutableKeys = self->mutableKeys_;
  if (!mutableKeys) {
    JreThrowNullPointerException();
  }
  [(JavaUtilSet *)mutableKeys addWithId:v11];
  -[JavaNioSelectorImpl ensurePollFdsCapacity]_0((uint64_t)self);
  objc_sync_exit(unmodifiableKeys);
  objc_sync_exit(self);
  return v11;
}

- (id)ensurePollFdsCapacity
{
  id v2 = *(void **)(a1 + 96);
  if (!v2) {
LABEL_5:
  }
    JreThrowNullPointerException();
  while (1)
  {
    int v3 = [v2 size];
    id v4 = *(void **)(a1 + 48);
    if (!v4) {
      goto LABEL_5;
    }
    id result = [v4 size];
    if (v3 >= (int)result + 1) {
      return result;
    }
    [*(id *)(a1 + 96) addWithId:new_LibcoreIoStructPollfd_init()];
    id v2 = *(void **)(a1 + 96);
    if (!v2) {
      goto LABEL_5;
    }
  }
}

- (id)keys
{
  objc_sync_enter(self);
  -[JavaNioSelectorImpl checkClosed]_0(self);
  unmodifiableKeys = self->unmodifiableKeys_;
  objc_sync_exit(self);
  return unmodifiableKeys;
}

- (id)checkClosed
{
  id result = [a1 isOpen];
  if ((result & 1) == 0)
  {
    id v2 = new_JavaNioChannelsClosedSelectorException_init();
    objc_exception_throw(v2);
  }
  return result;
}

- (int)select
{
  return sub_1001B2A58(self, -1);
}

- (int)selectWithLong:(int64_t)a3
{
  if (a3 < 0)
  {
    CFStringRef v11 = JreStrcat("$J", (uint64_t)a2, a3, v3, v4, v5, v6, v7, @"timeout < 0: ");
    long long v12 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v11);
    objc_exception_throw(v12);
  }
  if (a3) {
    int64_t v9 = a3;
  }
  else {
    int64_t v9 = -1;
  }
  return sub_1001B2A58(self, v9);
}

- (int)selectNow
{
  return sub_1001B2A58(self, 0);
}

- (int)selectInternalWithLong:(int64_t)a3
{
  return sub_1001B2A58(self, a3);
}

- (void)setPollFdWithInt:(int)a3 withJavaIoFileDescriptor:(id)a4 withInt:(int)a5 withId:(id)a6
{
}

- (id)selectedKeys
{
  objc_sync_enter(self);
  -[JavaNioSelectorImpl checkClosed]_0(self);
  selectedKeys = self->selectedKeys_;
  objc_sync_exit(self);
  return selectedKeys;
}

- (id)wakeup
{
  if ((atomic_load_explicit(LibcoreIoLibcore__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!LibcoreIoLibcore_os_) {
    JreThrowNullPointerException();
  }
  wakeupOut = self->wakeupOut_;
  char v5 = 1;
  objc_msgSend((id)LibcoreIoLibcore_os_, "writeWithJavaIoFileDescriptor:withByteArray:withInt:withInt:", wakeupOut, +[IOSByteArray arrayWithBytes:count:](IOSByteArray, "arrayWithBytes:count:", &v5, 1), 0, 1);
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioSelectorImpl;
  [(JavaNioChannelsSpiAbstractSelector *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10041A4D8;
}

@end