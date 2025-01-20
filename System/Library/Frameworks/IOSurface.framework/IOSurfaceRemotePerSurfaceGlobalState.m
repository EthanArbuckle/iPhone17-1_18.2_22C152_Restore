@interface IOSurfaceRemotePerSurfaceGlobalState
+ (id)globalStateForSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6;
- (IOSurfaceRemotePerSurfaceGlobalState)initWithSurfaceID:(unsigned int)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6;
- (id)mergeExtraData:(id)a3;
- (void)dealloc;
@end

@implementation IOSurfaceRemotePerSurfaceGlobalState

+ (id)globalStateForSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  id v9 = a6;
  if (globalStateForSurface_mappedAddress_mappedSize_extraData__onceToken != -1) {
    dispatch_once(&globalStateForSurface_mappedAddress_mappedSize_extraData__onceToken, &__block_literal_global_1);
  }
  uint64_t ID = IOSurfaceClientGetID((uint64_t)a3);
  v11 = [NSNumber numberWithUnsignedInt:ID];
  os_unfair_lock_lock((os_unfair_lock_t)globalStateForSurface_mappedAddress_mappedSize_extraData__lock);
  v12 = [(id)globalStateForSurface_mappedAddress_mappedSize_extraData__table objectForKey:v11];
  if (!v12)
  {
    v12 = [[IOSurfaceRemotePerSurfaceGlobalState alloc] initWithSurfaceID:ID mappedAddress:a4 mappedSize:a5 extraData:v9];
    [(id)globalStateForSurface_mappedAddress_mappedSize_extraData__table setObject:v12 forKey:v11];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)globalStateForSurface_mappedAddress_mappedSize_extraData__lock);

  return v12;
}

uint64_t __97__IOSurfaceRemotePerSurfaceGlobalState_globalStateForSurface_mappedAddress_mappedSize_extraData___block_invoke()
{
  globalStateForSurface_mappedAddress_mappedSize_extraData__lock = (uint64_t)malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  globalStateForSurface_mappedAddress_mappedSize_extraData__table = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];

  return MEMORY[0x1F41817F8]();
}

- (IOSurfaceRemotePerSurfaceGlobalState)initWithSurfaceID:(unsigned int)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)IOSurfaceRemotePerSurfaceGlobalState;
  result = [(IOSurfaceRemotePerSurfaceGlobalState *)&v10 init];
  result->_csid = a3;
  result->_mapped_address = a4;
  result->_mapped_size = a5;
  return result;
}

- (id)mergeExtraData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  extraData = self->_extraData;
  p_extraData = &self->_extraData;
  id v9 = extraData;
  if (v9)
  {
    objc_super v10 = v9;
    if (v5)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __55__IOSurfaceRemotePerSurfaceGlobalState_mergeExtraData___block_invoke;
      v12[3] = &unk_1E5D1E080;
      objc_super v10 = v9;
      v13 = v10;
      xpc_dictionary_apply(v5, v12);
    }
  }
  else
  {
    objc_super v10 = (OS_xpc_object *)v5;
    objc_storeStrong((id *)p_extraData, a3);
  }
  os_unfair_lock_unlock(p_lock);

  return v10;
}

uint64_t __55__IOSurfaceRemotePerSurfaceGlobalState_mergeExtraData___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  mapped_address = self->_mapped_address;
  if (mapped_address) {
    munmap(mapped_address, self->_mapped_size);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceRemotePerSurfaceGlobalState;
  [(IOSurfaceRemotePerSurfaceGlobalState *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end