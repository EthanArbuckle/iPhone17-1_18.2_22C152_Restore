@interface HDIDSDestination
+ (id)initWithAllowedDeviceTypes:(id)a3;
+ (id)validHealthSoftwareDeviceTypes;
- (HDIDSDestination)initWithDeviceFilterBlock:(id)a3;
- (id)deviceFilterBlock;
@end

@implementation HDIDSDestination

- (HDIDSDestination)initWithDeviceFilterBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDIDSDestination;
  v5 = [(HDIDSDestination *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id deviceFilterBlock = v5->_deviceFilterBlock;
    v5->_id deviceFilterBlock = (id)v6;
  }
  return v5;
}

+ (id)initWithAllowedDeviceTypes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__HDIDSDestination_initWithAllowedDeviceTypes___block_invoke;
  v8[3] = &unk_1E630D628;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = (void *)[v4 initWithDeviceFilterBlock:v8];

  return v6;
}

uint64_t __47__HDIDSDestination_initWithAllowedDeviceTypes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 deviceType];
  id v4 = *(void **)(a1 + 32);

  return [v4 containsInteger:v3];
}

+ (id)validHealthSoftwareDeviceTypes
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [NSNumber numberWithInteger:2];
  v10[0] = v3;
  id v4 = [NSNumber numberWithInteger:4];
  v10[1] = v4;
  id v5 = [NSNumber numberWithInteger:1];
  v10[2] = v5;
  uint64_t v6 = [NSNumber numberWithInteger:6];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8 = [v2 setWithArray:v7];

  return v8;
}

- (id)deviceFilterBlock
{
  return self->_deviceFilterBlock;
}

- (void).cxx_destruct
{
}

@end