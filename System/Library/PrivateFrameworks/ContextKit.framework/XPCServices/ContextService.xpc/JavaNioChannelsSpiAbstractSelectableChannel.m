@interface JavaNioChannelsSpiAbstractSelectableChannel
+ (const)__metadata;
- (BOOL)isBlocking;
- (BOOL)isRegistered;
- (JavaNioChannelsSpiAbstractSelectableChannel)initWithJavaNioChannelsSpiSelectorProvider:(id)a3;
- (id)blockingLock;
- (id)configureBlockingWithBoolean:(BOOL)a3;
- (id)keyForWithJavaNioChannelsSelector:(id)a3;
- (id)provider;
- (id)register__WithJavaNioChannelsSelector:(id)a3 withInt:(int)a4 withId:(id)a5;
- (uint64_t)containsValidKeys;
- (void)dealloc;
- (void)deregisterWithJavaNioChannelsSelectionKey:(id)a3;
- (void)implCloseChannel;
- (void)implCloseSelectableChannel;
- (void)implConfigureBlockingWithBoolean:(BOOL)a3;
@end

@implementation JavaNioChannelsSpiAbstractSelectableChannel

- (JavaNioChannelsSpiAbstractSelectableChannel)initWithJavaNioChannelsSpiSelectorProvider:(id)a3
{
  return self;
}

- (id)provider
{
  return *(id *)(&self->isBlocking_ + 7);
}

- (BOOL)isRegistered
{
  objc_sync_enter(self);
  v3 = *(JavaNioChannelsSpiSelectorProvider **)((char *)&self->provider_ + 7);
  if (!v3) {
    JreThrowNullPointerException();
  }
  char v4 = [v3 isEmpty] ^ 1;
  objc_sync_exit(self);
  return v4;
}

- (id)keyForWithJavaNioChannelsSelector:(id)a3
{
  return (id)sub_1002807C8((uint64_t)self, a3);
}

- (id)register__WithJavaNioChannelsSelector:(id)a3 withInt:(int)a4 withId:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  if (![(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    v21 = new_JavaNioChannelsClosedChannelException_init();
    goto LABEL_18;
  }
  if ((v6 & ~[(JavaNioChannelsSelectableChannel *)self validOps]) != 0)
  {
    CFStringRef v22 = JreStrcat("$I", v9, v10, v11, v12, v13, v14, v15, @"no valid ops in interest set: ");
    v21 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v22);
LABEL_18:
    objc_exception_throw(v21);
  }
  v16 = *(JavaUtilList **)((char *)&self->keyList_ + 7);
  objc_sync_enter(v16);
  if (self->isBlocking_)
  {
    v23 = new_JavaNioChannelsIllegalBlockingModeException_init();
    goto LABEL_24;
  }
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (([a3 isOpen] & 1) == 0)
  {
    if (v6) {
      v23 = new_JavaLangNullPointerException_initWithNSString_(@"selector not open");
    }
    else {
      v23 = new_JavaNioChannelsIllegalSelectorException_init();
    }
LABEL_24:
    objc_exception_throw(v23);
  }
  v17 = (void *)sub_1002807C8((uint64_t)self, a3);
  id v18 = v17;
  if (v17)
  {
    if (([v17 isValid] & 1) == 0)
    {
      v24 = new_JavaNioChannelsCancelledKeyException_init();
      objc_exception_throw(v24);
    }
    [v18 interestOpsWithInt:v6];
    [v18 attachWithId:a5];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    id v18 = objc_msgSend(a3, "register__WithJavaNioChannelsSpiAbstractSelectableChannel:withInt:withId:", self, v6, a5);
    v19 = *(JavaNioChannelsSpiSelectorProvider **)((char *)&self->provider_ + 7);
    if (!v19) {
      JreThrowNullPointerException();
    }
    [v19 addWithId:v18];
  }
  objc_sync_exit(v16);
  return v18;
}

- (void)implCloseChannel
{
  objc_sync_enter(self);
  [(JavaNioChannelsSpiAbstractSelectableChannel *)self implCloseSelectableChannel];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = *(JavaNioChannelsSpiSelectorProvider **)((char *)&self->provider_ + 7);
  if (!v3) {
    JreThrowNullPointerException();
  }
  id v4 = [*(id *)((char *)&self->provider_ + 7) countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (v7) {
          objc_msgSend(v7, "cancel", (void)v8);
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  objc_sync_exit(self);
}

- (void)implCloseSelectableChannel
{
}

- (BOOL)isBlocking
{
  v2 = self;
  v3 = *(JavaUtilList **)((char *)&self->keyList_ + 7);
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->isBlocking_;
  objc_sync_exit(v3);
  return (char)v2;
}

- (id)blockingLock
{
  return *(JavaUtilList **)((char *)&self->keyList_ + 7);
}

- (id)configureBlockingWithBoolean:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(JavaNioChannelsSpiAbstractInterruptibleChannel *)self isOpen])
  {
    v7 = new_JavaNioChannelsClosedChannelException_init();
    objc_exception_throw(v7);
  }
  uint64_t v5 = *(JavaUtilList **)((char *)&self->keyList_ + 7);
  objc_sync_enter(v5);
  if (self->isBlocking_ != v3)
  {
    if (v3 && -[JavaNioChannelsSpiAbstractSelectableChannel containsValidKeys]_0((uint64_t)self))
    {
      long long v8 = new_JavaNioChannelsIllegalBlockingModeException_init();
      objc_exception_throw(v8);
    }
    [(JavaNioChannelsSpiAbstractSelectableChannel *)self implConfigureBlockingWithBoolean:v3];
    self->isBlocking_ = v3;
  }
  objc_sync_exit(v5);
  return self;
}

- (uint64_t)containsValidKeys
{
  objc_sync_enter((id)a1);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = *(void **)(a1 + 39);
  if (!v2) {
    JreThrowNullPointerException();
  }
  id v3 = [*(id *)(a1 + 39) countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (v6 && (objc_msgSend(v6, "isValid", (void)v9) & 1) != 0)
        {
          uint64_t v7 = 1;
          goto LABEL_13;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 0;
LABEL_13:
  objc_sync_exit((id)a1);
  return v7;
}

- (void)implConfigureBlockingWithBoolean:(BOOL)a3
{
}

- (void)deregisterWithJavaNioChannelsSelectionKey:(id)a3
{
  objc_sync_enter(self);
  uint64_t v5 = *(JavaNioChannelsSpiSelectorProvider **)((char *)&self->provider_ + 7);
  if (v5) {
    [v5 removeWithId:a3];
  }
  objc_sync_exit(self);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaNioChannelsSpiAbstractSelectableChannel;
  [(JavaNioChannelsSpiAbstractInterruptibleChannel *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10047B818;
}

@end