@interface FigCaptureProcessHandle
+ (id)handleForAuditToken:(id *)a3 error:(id *)a4;
+ (id)handleForPID:(int)a3 error:(id *)a4;
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (FigCaptureProcessHandle)nonRootSourceProcessHandleForVisibilityEndowment;
- (NSString)bundleIdentifier;
- (NSString)extensionContainingAppBundleIdentifier;
- (NSString)extensionPointIdentifier;
- (RBSProcessHandle)rbsProcessHandle;
- (id)_ancestorPathWithinEndowmentTree:(id)a3 root:(id)a4 visitedLinks:(id)a5;
- (id)_initWithAuditToken:(id *)a3 error:(id *)a4;
- (id)_initWithPID:(int)a3 error:(id *)a4;
- (id)_initWithRBSProcessHandle:(id)a3 bundleRecord:(id)a4;
- (id)debugDescription;
- (id)description;
- (id)rbsProcessMonitorForEndowmentNamespace:(id)a3 serviceClass:(unsigned int)a4 updateHandler:(id)a5;
- (int)_nonRootSourcePIDForVisibilityEndowmentWithTree:(id)a3;
- (int)pid;
- (void)dealloc;
@end

@implementation FigCaptureProcessHandle

+ (id)handleForAuditToken:(id *)a3 error:(id *)a4
{
  id v6 = objc_alloc((Class)a1);
  long long v7 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v7;
  return (id)[v6 _initWithAuditToken:v9 error:a4];
}

- (id)_initWithAuditToken:(id *)a3 error:(id *)a4
{
  v13 = 0;
  long long v7 = *(_OWORD *)&a3->var0[4];
  long long v11 = *(_OWORD *)a3->var0;
  long long v12 = v7;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F963E8], "handleForIdentifier:error:", objc_msgSend(NSNumber, "numberWithInt:", FigCaptureGetPIDFromAuditToken(&v11)), &v13);
  if (v8)
  {
    long long v9 = *(_OWORD *)&a3->var0[4];
    long long v11 = *(_OWORD *)a3->var0;
    long long v12 = v9;
    return -[FigCaptureProcessHandle _initWithRBSProcessHandle:bundleRecord:](self, "_initWithRBSProcessHandle:bundleRecord:", v8, [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:&v11 error:0]);
  }
  else
  {
    FigDebugAssert3();
    if (a4)
    {
      if (v13) {
        *a4 = v13;
      }
    }

    return 0;
  }
}

- (id)_initWithRBSProcessHandle:(id)a3 bundleRecord:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FigCaptureProcessHandle;
  id v6 = [(FigCaptureProcessHandle *)&v8 init];
  if (v6)
  {
    v6->_rbsProcessHandle = (RBSProcessHandle *)a3;
    v6->_bundleRecord = (LSBundleRecord *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureProcessHandle;
  [(FigCaptureProcessHandle *)&v3 dealloc];
}

- (int)pid
{
  return [(RBSProcessHandle *)self->_rbsProcessHandle pid];
}

- (NSString)extensionPointIdentifier
{
  v2 = (void *)[(RBSProcessHandle *)self->_rbsProcessHandle bundle];
  return (NSString *)[v2 extensionPointIdentifier];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (id)handleForPID:(int)a3 error:(id *)a4
{
  v4 = (void *)[objc_alloc((Class)a1) _initWithPID:*(void *)&a3 error:a4];
  return v4;
}

- (id)_initWithPID:(int)a3 error:(id *)a4
{
  long long v11 = 0;
  id v6 = objc_msgSend(MEMORY[0x1E4F963E8], "handleForIdentifier:error:", objc_msgSend(NSNumber, "numberWithInt:", *(void *)&a3), &v11);
  if (v6)
  {
    long long v7 = v6;
    objc_super v8 = (void *)MEMORY[0x1E4F223F8];
    [v6 auditToken];
    return -[FigCaptureProcessHandle _initWithRBSProcessHandle:bundleRecord:](self, "_initWithRBSProcessHandle:bundleRecord:", v7, [v8 bundleRecordForAuditToken:v10 error:0]);
  }
  else
  {
    FigDebugAssert3();
    if (a4)
    {
      if (v11) {
        *a4 = v11;
      }
    }

    return 0;
  }
}

- (id)debugDescription
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"pid: %d", -[FigCaptureProcessHandle pid](self, "pid"));
  v4 = [(FigCaptureProcessHandle *)self bundleIdentifier];
  if (v4) {
    [v3 appendFormat:@", bundleID: %@", v4];
  }
  return v3;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[FigCaptureProcessHandle debugDescription](self, "debugDescription")];
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_rbsProcessHandle;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (NSString)bundleIdentifier
{
  v2 = (void *)[(RBSProcessHandle *)self->_rbsProcessHandle bundle];
  return (NSString *)[v2 identifier];
}

- (NSString)extensionContainingAppBundleIdentifier
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_super v3 = (void *)[(LSBundleRecord *)self->_bundleRecord containingBundleRecord];
  return (NSString *)[v3 bundleIdentifier];
}

- (RBSProcessHandle)rbsProcessHandle
{
  return self->_rbsProcessHandle;
}

- (id)rbsProcessMonitorForEndowmentNamespace:(id)a3 serviceClass:(unsigned int)a4 updateHandler:(id)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __107__FigCaptureProcessHandle_RunningBoard__rbsProcessMonitorForEndowmentNamespace_serviceClass_updateHandler___block_invoke;
  v6[3] = &unk_1E5C2D3C0;
  v6[4] = a3;
  v6[5] = self;
  unsigned int v7 = a4;
  v6[6] = a5;
  return (id)[MEMORY[0x1E4F96418] monitorWithConfiguration:v6];
}

uint64_t __107__FigCaptureProcessHandle_RunningBoard__rbsProcessMonitorForEndowmentNamespace_serviceClass_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F96448] descriptor];
  v7[0] = *(void *)(a1 + 32);
  objc_msgSend(v4, "setEndowmentNamespaces:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1));
  [v4 setValues:32];
  [a2 setStateDescriptor:v4];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F96430], "predicateMatchingIdentifier:", objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "pid")));
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v6, 1));
  [a2 setServiceClass:*(unsigned int *)(a1 + 56)];
  return [a2 setUpdateHandler:*(void *)(a1 + 48)];
}

- (FigCaptureProcessHandle)nonRootSourceProcessHandleForVisibilityEndowment
{
  uint64_t v3 = -[FigCaptureProcessHandle _nonRootSourcePIDForVisibilityEndowmentWithTree:](self, "_nonRootSourcePIDForVisibilityEndowmentWithTree:", [MEMORY[0x1E4F96378] endowmentTreeForNamespace:*MEMORY[0x1E4F62718]]);
  if (v3 == [(FigCaptureProcessHandle *)self pid])
  {
    v4 = self;
    return v4;
  }
  else if (v3 == -1)
  {
    return 0;
  }
  else
  {
    return (FigCaptureProcessHandle *)+[FigCaptureProcessHandle handleForPID:v3 error:0];
  }
}

- (int)_nonRootSourcePIDForVisibilityEndowmentWithTree:(id)a3
{
  id v3 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)[a3 rootLinks];
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (!v5) {
    return -1;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v32;
  int v21 = -1;
  unint64_t v8 = 0x1E4F1C000uLL;
  v23 = self;
  id v24 = v3;
  uint64_t v22 = *(void *)v32;
  do
  {
    uint64_t v9 = 0;
    uint64_t v25 = v6;
    do
    {
      if (*(void *)v32 != v7) {
        objc_enumerationMutation(obj);
      }
      v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
      id v11 = -[FigCaptureProcessHandle _ancestorPathWithinEndowmentTree:root:visitedLinks:](self, "_ancestorPathWithinEndowmentTree:root:visitedLinks:", v3, v10, [*(id *)(v8 + 2768) set]);
      if (v11)
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v12 = (void *)[v11 reverseObjectEnumerator];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v28;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v28 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              [v17 sourcePid];
              v18 = (void *)BSBundleIDForPID();
              int v19 = [v17 sourcePid];
              if (v19 == [v10 sourcePid]
                || [v18 isEqualToString:0x1EFA55C40])
              {
                int v21 = [v17 targetPid];
                goto LABEL_18;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v14) {
              continue;
            }
            break;
          }
LABEL_18:
          self = v23;
          id v3 = v24;
          uint64_t v7 = v22;
          uint64_t v6 = v25;
          unint64_t v8 = 0x1E4F1C000;
        }
      }
      ++v9;
    }
    while (v9 != v6);
    uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  }
  while (v6);
  return v21;
}

- (id)_ancestorPathWithinEndowmentTree:(id)a3 root:(id)a4 visitedLinks:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  int v9 = [a4 targetPid];
  if (v9 == [(FigCaptureProcessHandle *)self pid])
  {
    v24[0] = a4;
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  }
  else
  {
    id v11 = (void *)[a5 setByAddingObject:a4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v12 = objc_msgSend(a3, "childrenLinks:", a4, 0);
    id result = (id)[v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (result)
    {
      id v13 = result;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (([v11 containsObject:v16] & 1) == 0)
          {
            id v17 = [(FigCaptureProcessHandle *)self _ancestorPathWithinEndowmentTree:a3 root:v16 visitedLinks:v11];
            if (v17)
            {
              id v22 = a4;
              return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v22, 1), "arrayByAddingObjectsFromArray:", v17);
            }
          }
        }
        id v13 = (id)[v12 countByEnumeratingWithState:&v18 objects:v23 count:16];
        id result = 0;
        if (v13) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

@end