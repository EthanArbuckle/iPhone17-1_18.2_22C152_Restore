@interface HMCRedirector
+ (id)logCategory;
- (BOOL)processInserts:(id)a3 updates:(id)a4 deletes:(id)a5;
- (HMCRedirector)initWithLabel:(id)a3 partition:(id)a4;
- (NSString)label;
- (id)addTarget:(id)a3 selector:(SEL)a4 changeMask:(unint64_t)a5 forChangesOfObjectsWithModelType:(id)a6 forChangesOfObjectsWithModelID:(id)a7;
- (id)addTarget:(id)a3 selector:(SEL)a4 changeMask:(unint64_t)a5 forChangesOfObjectsWithModelType:(id)a6 forChangesOfObjectsWithModelID:(id)a7 error:(id *)a8;
- (void)removeRegistrationForChangeOfObjectsOfModelType:(id)a3 forChangesOfObjectsWithModelID:(id)a4;
@end

@implementation HMCRedirector

uint64_t __29__HMCRedirector_removeTuple___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    v6 = *(void **)(a1 + 40);
    return [v6 addObject:a2];
  }
  return result;
}

uint64_t __29__HMCRedirector_removeTuple___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    v6 = *(void **)(a1 + 40);
    return [v6 addObject:a2];
  }
  return result;
}

uint64_t __29__HMCRedirector_removeTuple___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 isEqual:*(void *)(a1 + 32)];
  if (result)
  {
    v6 = *(void **)(a1 + 40);
    return [v6 addObject:a2];
  }
  return result;
}

void __29__HMCRedirector_removeTuple___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __29__HMCRedirector_removeTuple___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_partition);
  objc_storeStrong((id *)&self->_deleteModelID, 0);
  objc_storeStrong((id *)&self->_deleteClass, 0);
  objc_storeStrong((id *)&self->_updateModelID, 0);
  objc_storeStrong((id *)&self->_updateClass, 0);
  objc_storeStrong((id *)&self->_insertClass, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)removeRegistrationForChangeOfObjectsOfModelType:(id)a3 forChangesOfObjectsWithModelID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  v7 = [MEMORY[0x263EFFA08] setWithArray:v9];
  v8 = [MEMORY[0x263EFFA08] setWithArray:v6];
  __removeRegistrations(self, v7, v8);

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (BOOL)processInserts:(id)a3 updates:(id)a4 deletes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v34 = 0;
  unint64_t v32 = 0;
  unint64_t v33 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_partition);
    insertClass = self->_insertClass;
  }
  else
  {
    id WeakRetained = 0;
    insertClass = 0;
  }
  v14 = insertClass;
  _binChanges(WeakRetained, (uint64_t)&v34, v8, v14, 0);

  if (self)
  {
    v15 = self->_updateClass;
    updateModelID = self->_updateModelID;
  }
  else
  {
    v15 = 0;
    updateModelID = 0;
  }
  v17 = updateModelID;
  _binChanges(WeakRetained, (uint64_t)&v33, v9, v15, v17);

  if (self)
  {
    v18 = self->_deleteClass;
    deleteModelID = self->_deleteModelID;
  }
  else
  {
    v18 = 0;
    deleteModelID = 0;
  }
  v20 = deleteModelID;
  _binChanges(WeakRetained, (uint64_t)&v32, v10, v18, v20);

  os_unfair_lock_unlock(&p_lock->lock);
  id v21 = (id)(v34 | v33 | v32);
  BOOL v22 = v21 != 0;
  if (v21)
  {
    v23 = +[HMCContext currentContext];
    v24 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48__HMCRedirector_processInserts_updates_deletes___block_invoke;
    block[3] = &unk_264A2E610;
    id v28 = (id)v34;
    id v29 = (id)v33;
    id v30 = (id)v32;
    id v31 = v23;
    id v25 = v23;
    dispatch_async(v24, block);

    id v21 = (id)v33;
  }

  return v22;
}

void __48__HMCRedirector_processInserts_updates_deletes___block_invoke(id *a1)
{
  v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = a1[4];
  if (v3)
  {
    v4 = [v3 keyEnumerator];
    id v5 = [v4 allObjects];
    [v2 addObjectsFromArray:v5];
  }
  id v6 = a1[5];
  if (v6)
  {
    v7 = [v6 keyEnumerator];
    id v8 = [v7 allObjects];
    [v2 addObjectsFromArray:v8];
  }
  id v9 = a1[6];
  if (v9)
  {
    id v10 = [v9 keyEnumerator];
    v11 = [v10 allObjects];
    [v2 addObjectsFromArray:v11];
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__HMCRedirector_processInserts_updates_deletes___block_invoke_2;
  v12[3] = &unk_264A2D530;
  id v13 = a1[7];
  id v14 = a1[4];
  id v15 = a1[5];
  id v16 = a1[6];
  objc_msgSend(v2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);
}

void __48__HMCRedirector_processInserts_updates_deletes___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v4 = [HMCRedirectorChange alloc];
  id v5 = [a1[4] managedObjectContext];
  id v6 = [a1[5] objectForKey:v3];
  v7 = [a1[6] objectForKey:v3];
  id v8 = [a1[7] objectForKey:v3];
  id v9 = v5;
  id v10 = v6;
  id v11 = v7;
  id v12 = v8;
  if (v4)
  {
    v26.receiver = v4;
    v26.super_class = (Class)HMCRedirectorChange;
    v4 = (HMCRedirectorChange *)objc_msgSendSuper2(&v26, sel_init);
    if (v4)
    {
      id v13 = v10;
      if (!v10)
      {
        id v13 = [MEMORY[0x263EFFA08] set];
      }
      objc_storeStrong((id *)&v4->_inserts, v13);
      if (!v10) {

      }
      id v14 = v11;
      if (!v11)
      {
        id v14 = [MEMORY[0x263EFFA08] set];
      }
      objc_storeStrong((id *)&v4->_updates, v14);
      if (!v11) {

      }
      id v15 = v12;
      if (!v12)
      {
        id v15 = [MEMORY[0x263EFFA08] set];
      }
      objc_storeStrong((id *)&v4->_deletes, v15);
      if (!v12) {

      }
      uint64_t v16 = [v9 transactionAuthor];
      author = v4->_author;
      v4->_author = (NSString *)v16;

      uint64_t v18 = [v9 name];
      context = v4->_context;
      v4->_context = (NSString *)v18;
    }
  }

  v20 = dispatch_get_global_queue(0, 0);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __48__HMCRedirector_processInserts_updates_deletes___block_invoke_3;
  v23[3] = &unk_264A2F820;
  id v24 = v3;
  id v25 = v4;
  id v21 = v4;
  id v22 = v3;
  dispatch_async(v20, v23);
}

void __48__HMCRedirector_processInserts_updates_deletes___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v2 = *(void **)(a1 + 40);
    id v3 = *(const char **)(v1 + 24);
    id v4 = *(id *)(v1 + 16);
    id v7 = v2;
    id v5 = (objc_class *)objc_opt_class();
    IMP MethodImplementation = class_getMethodImplementation(v5, v3);
    ((void (*)(id, const char *, id))MethodImplementation)(v4, v3, v7);
  }
}

- (id)addTarget:(id)a3 selector:(SEL)a4 changeMask:(unint64_t)a5 forChangesOfObjectsWithModelType:(id)a6 forChangesOfObjectsWithModelID:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a6;
  id v32 = a7;
  uint64_t v16 = [HMCRedirectorTuple alloc];
  v17 = self;
  id v18 = v14;
  if (v16)
  {
    v45.receiver = v16;
    v45.super_class = (Class)HMCRedirectorTuple;
    uint64_t v16 = [(HMCRedirector *)&v45 init];
    if (v16)
    {
      if (objc_opt_respondsToSelector())
      {
        v19 = [v18 methodSignatureForSelector:a4];
        if ([v19 numberOfArguments] != 3)
        {
LABEL_27:
          _HMFPreconditionFailure();
          goto LABEL_28;
        }
        id v20 = v19;
        if (*(unsigned char *)[v20 getArgumentTypeAtIndex:0] != 64)
        {
LABEL_28:
          _HMFPreconditionFailure();
          goto LABEL_29;
        }
        id v21 = v20;
        if (*(unsigned char *)[v21 getArgumentTypeAtIndex:1] != 58)
        {
LABEL_29:
          _HMFPreconditionFailure();
LABEL_30:
          id v31 = (_Unwind_Exception *)_HMFPreconditionFailure();
          os_unfair_lock_unlock((os_unfair_lock_t)a4);
          _Unwind_Resume(v31);
        }
        id v22 = v21;
        if (*(unsigned char *)[v22 getArgumentTypeAtIndex:2] != 64) {
          goto LABEL_30;
        }
        id v23 = v22;
        if (*(unsigned char *)[v23 methodReturnType] == 118)
        {
          id v24 = v23;
          if (!*(unsigned char *)([v24 methodReturnType] + 1))
          {
            objc_storeWeak((id *)&v16->_owner, v17);
            v16->_selector = a4;
            objc_storeWeak(&v16->_target, v18);

            goto LABEL_11;
          }
        }
        _HMFPreconditionFailure();
      }
      _HMFPreconditionFailure();
      goto LABEL_27;
    }
  }
LABEL_11:

  os_unfair_lock_lock_with_options();
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke;
  v42[3] = &unk_264A2D4E0;
  unint64_t v44 = a5;
  v42[4] = v17;
  id v25 = v16;
  v43 = v25;
  objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v42);
  if (a8 && *a8)
  {
    int v26 = 1;
  }
  else
  {
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_150;
    v39[3] = &unk_264A2D508;
    unint64_t v41 = a5;
    v39[4] = v17;
    v27 = v25;
    v40 = v27;
    objc_msgSend(v32, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v39);
    if (a8 && *a8)
    {
      int v26 = 1;
    }
    else
    {
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_152;
      v36[3] = &unk_264A2D4E0;
      unint64_t v38 = a5;
      v36[4] = v17;
      id v28 = v27;
      v37 = v28;
      objc_msgSend(v15, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v36);
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_2;
      v33[3] = &unk_264A2D508;
      unint64_t v35 = a5;
      v33[4] = v17;
      unint64_t v34 = v28;
      objc_msgSend(v32, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v33);

      int v26 = 0;
    }
  }
  os_unfair_lock_unlock(&v17->_lock.lock);
  if (v26) {
    id v29 = 0;
  }
  else {
    id v29 = v25;
  }

  return v29;
}

void __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = +[HMCContext managedObjectClassFromProtocol:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      id v6 = (void *)v6[3];
    }
    id v7 = v6;
    id v8 = [v7 objectForKey:v4];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 32);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = NSStringFromProtocol(v3);
        uint64_t v14 = *(void *)(a1 + 40);
        int v22 = 138544130;
        id v23 = v12;
        __int16 v24 = 2112;
        id v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v14;
        __int16 v28 = 2112;
        id v29 = v8;
        id v15 = "%{public}@Unable to register an insertion notification for objects of type %@ by %@ (already registered by %@)";
LABEL_21:
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v22, 0x2Au);

        goto LABEL_22;
      }
      goto LABEL_22;
    }
    uint64_t v5 = *(void *)(a1 + 48);
  }
  if ((v5 & 4) != 0)
  {
    uint64_t v16 = *(void **)(a1 + 32);
    if (v16) {
      uint64_t v16 = (void *)v16[4];
    }
    v17 = v16;
    id v8 = [v17 objectForKey:v4];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 32);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = NSStringFromProtocol(v3);
        uint64_t v18 = *(void *)(a1 + 40);
        int v22 = 138544130;
        id v23 = v12;
        __int16 v24 = 2112;
        id v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        __int16 v28 = 2112;
        id v29 = v8;
        id v15 = "%{public}@Unable to register an update notification for objects of type %@ by %@ (already registered by %@)";
        goto LABEL_21;
      }
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v5 = *(void *)(a1 + 48);
  }
  if ((v5 & 2) != 0)
  {
    v19 = *(void **)(a1 + 32);
    if (v19) {
      v19 = (void *)v19[6];
    }
    id v20 = v19;
    id v8 = [v20 objectForKey:v4];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = *(id *)(a1 + 32);
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = HMFGetLogIdentifier();
        id v13 = NSStringFromProtocol(v3);
        uint64_t v21 = *(void *)(a1 + 40);
        int v22 = 138544130;
        id v23 = v12;
        __int16 v24 = 2112;
        id v25 = v13;
        __int16 v26 = 2112;
        uint64_t v27 = v21;
        __int16 v28 = 2112;
        id v29 = v8;
        id v15 = "%{public}@Unable to register a delete notification for objects of type %@ by %@ (already registered by %@)";
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
LABEL_23:
}

void __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if ((v4 & 4) != 0)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5) {
      uint64_t v5 = (void *)v5[5];
    }
    id v6 = v5;
    id v7 = [v6 objectForKey:v3];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        uint64_t v12 = *(void *)(a1 + 40);
        int v17 = 138544130;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        id v20 = v3;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        __int16 v23 = 2112;
        __int16 v24 = v7;
        id v13 = "%{public}@Unable to register an update notification for object with modelID %@ by %@ (already registered by %@)";
LABEL_14:
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, 0x2Au);

        goto LABEL_15;
      }
      goto LABEL_15;
    }
    uint64_t v4 = *(void *)(a1 + 48);
  }
  if ((v4 & 2) != 0)
  {
    uint64_t v14 = *(void **)(a1 + 32);
    if (v14) {
      uint64_t v14 = (void *)v14[7];
    }
    id v15 = v14;
    id v7 = [v15 objectForKey:v3];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x230FBD990]();
      id v9 = *(id *)(a1 + 32);
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = HMFGetLogIdentifier();
        uint64_t v16 = *(void *)(a1 + 40);
        int v17 = 138544130;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        id v20 = v3;
        __int16 v21 = 2112;
        uint64_t v22 = v16;
        __int16 v23 = 2112;
        __int16 v24 = v7;
        id v13 = "%{public}@Unable to register a delete notification for object with modelID %@ by %@ (already registered by %@)";
        goto LABEL_14;
      }
LABEL_15:
    }
  }
}

objc_class *__117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_152(void *a1, uint64_t a2)
{
  uint64_t result = +[HMCContext managedObjectClassFromProtocol:a2];
  uint64_t v4 = result;
  uint64_t v5 = a1[6];
  if (v5)
  {
    uint64_t v6 = a1[4];
    if (v6) {
      id v7 = *(void **)(v6 + 24);
    }
    else {
      id v7 = 0;
    }
    uint64_t result = (objc_class *)[v7 setObject:a1[5] forKey:v4];
    uint64_t v5 = a1[6];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        return result;
      }
      goto LABEL_11;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v8 = a1[4];
  if (v8) {
    id v9 = *(void **)(v8 + 32);
  }
  else {
    id v9 = 0;
  }
  uint64_t result = (objc_class *)[v9 setObject:a1[5] forKey:v4];
  if ((a1[6] & 2) != 0)
  {
LABEL_11:
    uint64_t v10 = a1[4];
    if (v10) {
      id v11 = *(void **)(v10 + 48);
    }
    else {
      id v11 = 0;
    }
    uint64_t v12 = a1[5];
    return (objc_class *)[v11 setObject:v12 forKey:v4];
  }
  return result;
}

void __117__HMCRedirector_addTarget_selector_changeMask_forChangesOfObjectsWithModelType_forChangesOfObjectsWithModelID_error___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[6];
  id v9 = v3;
  if ((v4 & 4) != 0)
  {
    uint64_t v5 = a1[4];
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 40);
    }
    else {
      uint64_t v6 = 0;
    }
    [v6 setObject:a1[5] forKey:v3];
    id v3 = v9;
    uint64_t v4 = a1[6];
  }
  if ((v4 & 2) != 0)
  {
    uint64_t v7 = a1[4];
    if (v7) {
      uint64_t v8 = *(void **)(v7 + 56);
    }
    else {
      uint64_t v8 = 0;
    }
    [v8 setObject:a1[5] forKey:v9];
    id v3 = v9;
  }
}

- (id)addTarget:(id)a3 selector:(SEL)a4 changeMask:(unint64_t)a5 forChangesOfObjectsWithModelType:(id)a6 forChangesOfObjectsWithModelID:(id)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v24 = 0;
  id v15 = [(HMCRedirector *)self addTarget:v12 selector:a4 changeMask:a5 forChangesOfObjectsWithModelType:v13 forChangesOfObjectsWithModelID:v14 error:&v24];
  id v16 = v24;
  if (!v15)
  {
    id v18 = v16;
    __int16 v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      __int16 v23 = NSStringFromSelector(a4);
      *(_DWORD *)buf = 138544642;
      __int16 v26 = v22;
      __int16 v27 = 2112;
      id v28 = v12;
      __int16 v29 = 2112;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      id v32 = v13;
      __int16 v33 = 2112;
      id v34 = v14;
      __int16 v35 = 2112;
      id v36 = v18;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to register %@ / %@ for changes of objects %@ and IDs %@: %@", buf, 0x3Eu);
    }
    _HMFPreconditionFailure();
  }

  return v15;
}

- (HMCRedirector)initWithLabel:(id)a3 partition:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HMCRedirector;
  id v9 = [(HMCRedirector *)&v22 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_label, a3);
    uint64_t v11 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    insertClass = v10->_insertClass;
    v10->_insertClass = (NSMapTable *)v11;

    uint64_t v13 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    updateClass = v10->_updateClass;
    v10->_updateClass = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    updateModelID = v10->_updateModelID;
    v10->_updateModelID = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    deleteClass = v10->_deleteClass;
    v10->_deleteClass = (NSMapTable *)v17;

    uint64_t v19 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    deleteModelID = v10->_deleteModelID;
    v10->_deleteModelID = (NSMapTable *)v19;

    objc_storeWeak((id *)&v10->_partition, v8);
    v10->_lock.lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_255735 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_255735, &__block_literal_global_255736);
  }
  v2 = (void *)logCategory__hmf_once_v14_255737;
  return v2;
}

void __28__HMCRedirector_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v14_255737;
  logCategory__hmf_once_v14_255737 = v0;
}

@end