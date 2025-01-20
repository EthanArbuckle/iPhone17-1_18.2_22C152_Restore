@interface BMBookmarkClasses
+ (id)sharedInstance;
- (BMBookmarkClasses)init;
- (id)allowedClassesForSecureCodingBMBookmark;
- (void)allowClassesForSecureCodingBMBookmark:(id)a3;
@end

@implementation BMBookmarkClasses

- (id)allowedClassesForSecureCodingBMBookmark
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_addedBiomeStorageClasses)
  {
    Class v4 = NSClassFromString(&cfstr_Bmstorebookmar.isa);
    Class v5 = NSClassFromString(&cfstr_Bmstoreevent.isa);
    if (v4)
    {
      Class v6 = v5;
      if (v5)
      {
        [(NSMutableSet *)self->_allowed addObject:v4];
        [(NSMutableSet *)self->_allowed addObject:v6];
        self->_addedBiomeStorageClasses = 1;
      }
    }
  }
  if (!self->_addedBiomeStreamsClasses)
  {
    Class v7 = NSClassFromString(&cfstr_Bmeventsession.isa);
    if (v7)
    {
      [(NSMutableSet *)self->_allowed addObject:v7];
      self->_addedBiomeStreamsClasses = 1;
    }
  }
  if (!self->_addedCascadeSetsClasses)
  {
    Class v8 = NSClassFromString(&cfstr_Ccsetchangeboo.isa);
    Class v9 = NSClassFromString(&cfstr_Ccreplicateden.isa);
    if (v8)
    {
      Class v10 = v9;
      if (v9)
      {
        [(NSMutableSet *)self->_allowed addObject:v8];
        [(NSMutableSet *)self->_allowed addObject:v10];
        self->_addedCascadeSetsClasses = 1;
      }
    }
  }
  v11 = (void *)[(NSMutableSet *)self->_allowed copy];
  os_unfair_lock_unlock(p_lock);
  return v11;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_bookmarkClasses;
  return v2;
}

uint64_t __35__BMBookmarkClasses_sharedInstance__block_invoke()
{
  sharedInstance_bookmarkClasses = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (BMBookmarkClasses)init
{
  v10[14] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)BMBookmarkClasses;
  v2 = [(BMBookmarkClasses *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    *(_WORD *)&v2->_addedBiomeStorageClasses = 0;
    v2->_addedCascadeSetsClasses = 0;
    Class v4 = (void *)MEMORY[0x1E4F1CA80];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v10[2] = objc_opt_class();
    v10[3] = objc_opt_class();
    v10[4] = objc_opt_class();
    v10[5] = objc_opt_class();
    v10[6] = objc_opt_class();
    v10[7] = objc_opt_class();
    v10[8] = objc_opt_class();
    v10[9] = objc_opt_class();
    v10[10] = objc_opt_class();
    v10[11] = objc_opt_class();
    v10[12] = objc_opt_class();
    v10[13] = objc_opt_class();
    Class v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:14];
    uint64_t v6 = [v4 setWithArray:v5];
    allowed = v3->_allowed;
    v3->_allowed = (NSMutableSet *)v6;
  }
  return v3;
}

- (void)allowClassesForSecureCodingBMBookmark:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_allowed addObjectsFromArray:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
}

@end