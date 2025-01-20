@interface CTCellularData
- (CTCellularData)init;
- (CTCellularDataRestrictedState)restrictedState;
- (CellularDataRestrictionDidUpdateNotifier)cellularDataRestrictionDidUpdateNotifier;
- (id).cxx_construct;
- (void)dealloc;
- (void)setCellularDataRestrictionDidUpdateNotifier:(CellularDataRestrictionDidUpdateNotifier)cellularDataRestrictionDidUpdateNotifier;
- (void)setCellularDataRestrictionStateFromPolicies:(void *)a3;
@end

@implementation CTCellularData

uint64_t __33__CTCellularData_restrictedState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)setCellularDataRestrictionDidUpdateNotifier:(CellularDataRestrictionDidUpdateNotifier)cellularDataRestrictionDidUpdateNotifier
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

void __22__CTCellularData_init__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cellularDataRestrictionDidUpdateNotifier];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) cellularDataRestrictionDidUpdateNotifier];
    v3[2](v3, [*(id *)(a1 + 32) restrictedState]);
  }
}

- (CTCellularDataRestrictedState)restrictedState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  fObj = self->_cuPolicyClientQueue.fObj.fObj;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CTCellularData_restrictedState__block_invoke;
  v5[3] = &unk_1E5267620;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(fObj, v5);
  CTCellularDataRestrictedState v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CellularDataRestrictionDidUpdateNotifier)cellularDataRestrictionDidUpdateNotifier
{
  return objc_getProperty(self, a2, 32, 1);
}

void __22__CTCellularData_init__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setCellularDataRestrictionStateFromPolicies:a2];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__CTCellularData_init__block_invoke_2;
  block[3] = &unk_1E52675D0;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(global_queue, block);
}

- (void)setCellularDataRestrictionStateFromPolicies:(void *)a3
{
  uint64_t v4 = MEMORY[0x1E4F14568];
  if (a3)
  {
    id v5 = a3;
    xpc_retain(a3);
  }
  else
  {
    id v5 = xpc_null_create();
    if (!v5) {
      goto LABEL_5;
    }
  }
  if (MEMORY[0x1853203E0](v5) == v4)
  {
    xpc_retain(v5);
    xpc_object_t v6 = v5;
    goto LABEL_7;
  }
LABEL_5:
  xpc_object_t v6 = xpc_null_create();
LABEL_7:
  xpc_release(v5);
  if (MEMORY[0x1853203E0](v6) != v4 || MEMORY[0x1853203E0](v6) != v4 || !xpc_array_get_count(v6))
  {
    self->_restrictedState = 2;
    goto LABEL_10;
  }
  xpc_object_t v13 = 0;
  xpc_object_t value = xpc_array_get_value(v6, 0);
  xpc_object_t v8 = value;
  if (value)
  {
    xpc_retain(value);
    xpc_object_t v13 = v8;
  }
  else
  {
    xpc_object_t v8 = xpc_null_create();
    xpc_object_t v13 = v8;
    if (!v8) {
      goto LABEL_16;
    }
  }
  if (MEMORY[0x1853203E0](v8) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v8);
    goto LABEL_18;
  }
LABEL_16:
  xpc_object_t v13 = xpc_null_create();
LABEL_18:
  xpc_release(v8);
  v11[0] = &v13;
  v11[1] = "kCUPolicyKeyDataAllowed";
  xpc::dict::object_proxy::operator xpc::object((uint64_t)v11, &object);
  int v9 = xpc::dyn_cast_or_default((xpc *)&object, 0);
  xpc_release(object);
  unint64_t v10 = 1;
  if (v9) {
    unint64_t v10 = 2;
  }
  self->_restrictedState = v10;
  xpc_release(v13);
LABEL_10:
  xpc_release(v6);
}

- (CTCellularData)init
{
  v7.receiver = self;
  v7.super_class = (Class)CTCellularData;
  v2 = [(CTCellularData *)&v7 init];
  if (v2)
  {
    v2->_cuPolicyClient = (network_usage_policy_client_s *)network_usage_policy_create_client();
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CTCellularData", 0);
    fObj = v2->_cuPolicyClientQueue.fObj.fObj;
    v2->_cuPolicyClientQueue.fObj.fObj = (dispatch_object_s *)v3;
    if (fObj) {
      dispatch_release(fObj);
    }
    v2->_restrictedState = 0;
    xpc_object_t v6 = v2;
    network_usage_policy_set_changed_handler();
  }
  return v2;
}

- (void)dealloc
{
  network_usage_policy_destroy_client();
  v3.receiver = self;
  v3.super_class = (Class)CTCellularData;
  [(CTCellularData *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cellularDataRestrictionDidUpdateNotifier, 0);
  fObj = self->_cuPolicyClientQueue.fObj.fObj;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

@end