@interface HMDNetworkActivityWrapper
- (BOOL)completed;
- (BOOL)isActivated;
- (HMDNetworkActivityWrapper)initWithLabel:(unint64_t)a3;
- (HMDNetworkActivityWrapper)parent;
- (NSMutableSet)mutableChildren;
- (NSSet)children;
- (OS_nw_activity)activity;
- (id)childActivityWithLabel:(unint64_t)a3 createIfNeeded:(BOOL)a4;
- (unint64_t)label;
- (void)activate;
- (void)completeWithSuccess:(BOOL)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)submitMetrics:(id)a3 withName:(id)a4;
@end

@implementation HMDNetworkActivityWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableChildren, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSMutableSet)mutableChildren
{
  return self->_mutableChildren;
}

- (HMDNetworkActivityWrapper)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (HMDNetworkActivityWrapper *)WeakRetained;
}

- (OS_nw_activity)activity
{
  return self->_activity;
}

- (id)childActivityWithLabel:(unint64_t)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = [(HMDNetworkActivityWrapper *)self mutableChildren];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v12 label] == a3)
        {
          v13 = v12;

          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    v13 = [[HMDNetworkActivityWrapper alloc] initWithLabel:a3];
    [(HMDNetworkActivityWrapper *)v13 setParent:self];
  }
  else
  {
    v13 = 0;
  }
LABEL_13:
  return v13;
}

- (void)submitMetrics:(id)a3 withName:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_completed)
  {
    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    uint64_t v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v18 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Attempted to submit metrics after completion", buf, 0xCu);
    }
  }
  else
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __52__HMDNetworkActivityWrapper_submitMetrics_withName___block_invoke;
    v15[3] = &unk_264A2BD48;
    id v16 = v12;
    id v13 = v12;
    [v6 enumerateKeysAndObjectsUsingBlock:v15];
    v14 = [(HMDNetworkActivityWrapper *)self activity];
    [v7 UTF8String];
    nw_activity_submit_metrics();
  }
}

void __52__HMDNetworkActivityWrapper_submitMetrics_withName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v7)
  {
    v11 = *(void **)(a1 + 32);
    xpc_object_t v12 = (const char *)[v14 UTF8String];
    [v7 doubleValue];
    xpc_dictionary_set_double(v11, v12, v13);
  }
  else if (v10)
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), (const char *)[v14 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  }
}

- (void)completeWithSuccess:(BOOL)a3
{
  if (!self->_completed)
  {
    self->_completed = 1;
    id v3 = [(HMDNetworkActivityWrapper *)self activity];
    nw_activity_complete_with_reason();
  }
}

- (void)setParent:(id)a3
{
  p_parent = &self->_parent;
  id v5 = a3;
  objc_storeWeak((id *)p_parent, v5);
  id v6 = [(HMDNetworkActivityWrapper *)self activity];
  id v7 = [v5 activity];
  nw_activity_set_parent_activity();

  id v8 = [v5 mutableChildren];

  [v8 addObject:self];
}

- (void)activate
{
  id v2 = [(HMDNetworkActivityWrapper *)self activity];
  nw_activity_activate();
}

- (NSSet)children
{
  id v2 = [(HMDNetworkActivityWrapper *)self mutableChildren];
  id v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (unint64_t)label
{
  id v2 = [(HMDNetworkActivityWrapper *)self activity];
  unint64_t label = nw_activity_get_label();

  return label;
}

- (BOOL)isActivated
{
  id v2 = [(HMDNetworkActivityWrapper *)self activity];
  char is_activated = nw_activity_is_activated();

  return is_activated;
}

- (HMDNetworkActivityWrapper)initWithLabel:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMDNetworkActivityWrapper;
  id v3 = [(HMDNetworkActivityWrapper *)&v9 init];
  if (v3)
  {
    uint64_t v4 = nw_activity_create();
    activity = v3->_activity;
    v3->_activity = (OS_nw_activity *)v4;

    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    mutableChildren = v3->_mutableChildren;
    v3->_mutableChildren = v6;

    v3->_completed = 0;
  }
  return v3;
}

@end