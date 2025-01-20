@interface FTServerBag
+ (id)_sharedInstance;
+ (id)_sharedInstanceForType:(int64_t)a3;
+ (id)sharedInstance;
+ (id)sharedInstanceForBagType:(int64_t)a3;
- (BOOL)allowSelfSignedCertificates;
- (BOOL)allowUnsignedBags;
- (BOOL)isInDebilitatedMode;
- (BOOL)isLoaded;
- (BOOL)isLoading;
- (BOOL)isServerAvailable;
- (FTServerBag)initWithBagType:(int64_t)a3;
- (NSString)apsEnvironmentName;
- (NSURL)bagURL;
- (id)_bag;
- (id)_cachedBag;
- (id)objectForKey:(id)a3;
- (id)urlWithKey:(id)a3;
- (void)dealloc;
- (void)forceBagLoad;
- (void)startBagLoad;
@end

@implementation FTServerBag

+ (id)sharedInstance
{
  return (id)objc_msgSend_sharedInstanceForBagType_(FTServerBag, a2, 0);
}

+ (id)_sharedInstanceForType:(int64_t)a3
{
  if (a3 <= 1)
  {
    id v5 = a1;
    objc_sync_enter(v5);
    id v8 = qword_1EB47C7C8[a3];
    if (v8)
    {
      if ((objc_msgSend_isLoaded(v8, v6, v7) & 1) == 0) {
        objc_msgSend_startBagLoad(qword_1EB47C7C8[a3], v9, v10);
      }
    }
    else
    {
      v11 = [FTServerBag alloc];
      uint64_t v13 = objc_msgSend_initWithBagType_(v11, v12, a3);
      id v14 = qword_1EB47C7C8[a3];
      qword_1EB47C7C8[a3] = (id)v13;
    }
    objc_sync_exit(v5);

    id v3 = qword_1EB47C7C8[a3];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)_sharedInstance
{
  return (id)MEMORY[0x1F4181798](a1, sel__sharedInstanceForType_, 0);
}

+ (id)sharedInstanceForBagType:(int64_t)a3
{
  return (id)MEMORY[0x1F4181798](a1, sel__sharedInstanceForType_, a3);
}

- (FTServerBag)initWithBagType:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FTServerBag;
  v4 = [(FTServerBag *)&v9 init];
  v6 = v4;
  if (v4)
  {
    v4->_type = a3;
    id v7 = (id)objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], v5, a3);
  }
  return v6;
}

- (void)dealloc
{
  v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)FTServerBag;
  [(FTServerBag *)&v6 dealloc];
}

- (void)startBagLoad
{
  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startBagLoad(v4, v2, v3);
}

- (void)forceBagLoad
{
  objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_forceBagLoad(v4, v2, v3);
}

- (BOOL)isLoading
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  char isLoading = objc_msgSend_isLoading(v2, v3, v4);

  return isLoading;
}

- (BOOL)isLoaded
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  char isLoaded = objc_msgSend_isLoaded(v2, v3, v4);

  return isLoaded;
}

- (id)_cachedBag
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  id v5 = objc_msgSend__cachedBag(v2, v3, v4);

  return v5;
}

- (id)_bag
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  id v5 = objc_msgSend__bag(v2, v3, v4);

  return v5;
}

- (NSURL)bagURL
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  id v5 = objc_msgSend_bagURL(v2, v3, v4);

  return (NSURL *)v5;
}

- (NSString)apsEnvironmentName
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  id v5 = objc_msgSend_apsEnvironmentName(v2, v3, v4);

  return (NSString *)v5;
}

- (BOOL)allowSelfSignedCertificates
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  char v5 = objc_msgSend_allowSelfSignedCertificates(v2, v3, v4);

  return v5;
}

- (BOOL)allowUnsignedBags
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  char v5 = objc_msgSend_allowUnsignedBags(v2, v3, v4);

  return v5;
}

- (BOOL)isInDebilitatedMode
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  char v5 = objc_msgSend_isInDebilitatedMode(v2, v3, v4);

  return v5;
}

- (id)objectForKey:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F6B598];
  int64_t type = self->_type;
  id v5 = a3;
  id v7 = objc_msgSend_sharedInstanceForBagType_(v3, v6, type);
  objc_super v9 = objc_msgSend_objectForKey_(v7, v8, (uint64_t)v5);

  return v9;
}

- (id)urlWithKey:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F6B598];
  int64_t type = self->_type;
  id v5 = a3;
  id v7 = objc_msgSend_sharedInstanceForBagType_(v3, v6, type);
  objc_super v9 = objc_msgSend_urlWithKey_(v7, v8, (uint64_t)v5);

  return v9;
}

- (BOOL)isServerAvailable
{
  uint64_t v2 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, self->_type);
  char isServerAvailable = objc_msgSend_isServerAvailable(v2, v3, v4);

  return isServerAvailable;
}

@end