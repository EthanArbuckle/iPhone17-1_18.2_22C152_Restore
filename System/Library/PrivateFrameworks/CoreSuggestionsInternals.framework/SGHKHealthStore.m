@interface SGHKHealthStore
- (SGHKHealthStore)init;
- (id)dateOfBirthComponentsWithError:(id *)a3;
@end

@implementation SGHKHealthStore

- (void).cxx_destruct
{
}

- (id)dateOfBirthComponentsWithError:(id *)a3
{
  return [(HKHealthStore *)self->_healthStore dateOfBirthComponentsWithError:a3];
}

- (SGHKHealthStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGHKHealthStore;
  v2 = [(SGHKHealthStore *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getHKHealthStoreClass_softClass;
    uint64_t v13 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getHKHealthStoreClass_block_invoke;
      v9[3] = &unk_1E65C0148;
      v9[4] = &v10;
      __getHKHealthStoreClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = objc_opt_new();
    healthStore = v2->_healthStore;
    v2->_healthStore = (HKHealthStore *)v5;
  }
  return v2;
}

@end