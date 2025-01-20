@interface JFXThermalPolicyManager
- (JFXThermalPolicy)highestPriorityPolicy;
- (JFXThermalPolicyManager)init;
- (JFXThermalPolicyManager)initWithDefaultPolicy:(id)a3;
- (JFXThreadSafeArray)activePolicies;
- (id)description;
- (void)setPolicyType:(Class)a3 active:(BOOL)a4;
@end

@implementation JFXThermalPolicyManager

- (JFXThermalPolicyManager)init
{
  return 0;
}

- (JFXThermalPolicyManager)initWithDefaultPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)JFXThermalPolicyManager;
  id v3 = a3;
  v4 = [(JFXThermalPolicyManager *)&v8 init];
  v5 = objc_alloc_init(JFXThreadSafeArray);
  activePolicies = v4->_activePolicies;
  v4->_activePolicies = v5;

  -[JFXThreadSafeArray addObject:](v4->_activePolicies, "addObject:", v3, v8.receiver, v8.super_class);
  return v4;
}

- (JFXThermalPolicy)highestPriorityPolicy
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  id v11 = 0;
  v2 = [(JFXThermalPolicyManager *)self activePolicies];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__JFXThermalPolicyManager_highestPriorityPolicy__block_invoke;
  v5[3] = &unk_264C0C838;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (JFXThermalPolicy *)v3;
}

void __48__JFXThermalPolicyManager_highestPriorityPolicy__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = v4;
  if (*(void *)(v5 + 40))
  {
    unint64_t v6 = [v4 priority];
    if (v6 > [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) priority]) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v5 + 40), a2);
LABEL_5:
}

- (void)setPolicyType:(Class)a3 active:(BOOL)a4
{
  if (a4)
  {
    id v9 = objc_alloc_init(a3);
    unint64_t v6 = [(JFXThermalPolicyManager *)self activePolicies];
    [v6 addObject:v9];
  }
  else
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__22;
    v15 = __Block_byref_object_dispose__22;
    id v16 = 0;
    id v7 = [(JFXThermalPolicyManager *)self activePolicies];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__JFXThermalPolicyManager_setPolicyType_active___block_invoke;
    v10[3] = &unk_264C0C860;
    v10[4] = &v11;
    v10[5] = a3;
    [v7 enumerateObjectsUsingBlock:v10];

    if (v12[5])
    {
      uint64_t v8 = [(JFXThermalPolicyManager *)self activePolicies];
      [v8 removeObject:v12[5]];
    }
    _Block_object_dispose(&v11, 8);
  }
}

void __48__JFXThermalPolicyManager_setPolicyType_active___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(JFXThermalPolicyManager *)self highestPriorityPolicy];
  uint64_t v5 = [(JFXThermalPolicyManager *)self activePolicies];
  unint64_t v6 = [v3 stringWithFormat:@"Highest Priority: %@\n\nActive Policy List:\n%@\n", v4, v5];

  return v6;
}

- (JFXThreadSafeArray)activePolicies
{
  return self->_activePolicies;
}

- (void).cxx_destruct
{
}

@end