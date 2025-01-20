@interface AGXG17FamilyResourceGroup
- (AGXG17FamilyResourceGroup)initWithDevice:(void *)a3 resources:(const void *)a4 count:(unint64_t)a5;
- (BOOL)containsResource:(id)a3;
- (void)dealloc;
@end

@implementation AGXG17FamilyResourceGroup

- (void)dealloc
{
  if (resource_group_queue(void)::onceToken != -1) {
    dispatch_once(&resource_group_queue(void)::onceToken, &__block_literal_global_1686);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__AGXG17FamilyResourceGroup_dealloc__block_invoke;
  block[3] = &unk_265170D78;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)resource_group_queue(void)::_resourceGroupQueue, block);
  self->_device = 0;
  v3.receiver = self;
  v3.super_class = (Class)AGXG17FamilyResourceGroup;
  [(AGXG17FamilyResourceGroup *)&v3 dealloc];
}

void __36__AGXG17FamilyResourceGroup_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    *(void *)(*(void *)(v1 + 24) + (((unint64_t)*(unsigned __int16 *)(v1 + 8) >> 3) & 0x1FF8) + 5112) &= ~(1 << *(_WORD *)(v1 + 8));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v3 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      v7 = (int *)MEMORY[0x263F4B188];
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) backingResource];
          unint64_t v10 = *(unsigned __int16 *)(*(void *)(a1 + 32) + 8);
          *(void *)(*(void *)(v9 + *v7) + ((v10 >> 3) & 0x1FF8)) &= ~(1 << v10);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

- (BOOL)containsResource:(id)a3
{
  uint64_t v3 = *(void *)((char *)a3 + (int)*MEMORY[0x263F4B188]);
  if (v3) {
    return (*(void *)(v3 + (((unint64_t)self->_resourceGroup >> 3) & 0x1FF8)) >> self->_resourceGroup) & 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (AGXG17FamilyResourceGroup)initWithDevice:(void *)a3 resources:(const void *)a4 count:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AGXG17FamilyResourceGroup;
  v8 = [(AGXG17FamilyResourceGroup *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_initedResourceGroup = 0;
    if (!a5) {
      goto LABEL_6;
    }
    if (resource_group_queue(void)::onceToken != -1) {
      dispatch_once(&resource_group_queue(void)::onceToken, &__block_literal_global_1686);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__AGXG17FamilyResourceGroup_initWithDevice_resources_count___block_invoke;
    v11[3] = &unk_26516EA78;
    v11[4] = v9;
    v11[5] = a3;
    v11[6] = a4;
    v11[7] = a5;
    dispatch_sync((dispatch_queue_t)resource_group_queue(void)::_resourceGroupQueue, v11);
    if (!v9->_initedResourceGroup)
    {
LABEL_6:

      return 0;
    }
  }
  return v9;
}

void *__60__AGXG17FamilyResourceGroup_initWithDevice_resources_count___block_invoke(void *result)
{
  uint64_t v1 = result;
  uint64_t v22 = *MEMORY[0x263EF8340];
  *(void *)(result[4] + 24) = result[5];
  uint64_t v2 = result[4];
  uint64_t v3 = (void *)result[5];
  uint64_t v4 = v3[639];
  if (v4 == -1)
  {
    uint64_t v4 = v3[640];
    if (v4 == -1)
    {
      uint64_t v4 = v3[641];
      if (v4 == -1)
      {
        uint64_t v4 = v3[642];
        if (v4 == -1)
        {
          char v8 = 0;
          goto LABEL_10;
        }
        int v5 = 192;
      }
      else
      {
        int v5 = 128;
      }
    }
    else
    {
      int v5 = 64;
    }
  }
  else
  {
    int v5 = 0;
  }
  uint64_t v6 = v3 + 639;
  unint64_t v7 = v5 + __clz(__rbit64(~v4));
  char v8 = 1;
  *(void *)((char *)v6 + ((v7 >> 3) & 0x38)) |= 1 << v7;
  *(_WORD *)(v2 + 8) = v7;
  uint64_t v2 = result[4];
LABEL_10:
  *(unsigned char *)(v2 + 32) = v8;
  if (*(unsigned char *)(result[4] + 32))
  {
    result = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithObjects:result[6] count:result[7]];
    *(void *)(v1[4] + 16) = result;
    if (v1[7])
    {
      unint64_t v9 = 0;
      unint64_t v10 = (int *)MEMORY[0x263F4B188];
      unsigned int v11 = 1;
      do
      {
        result = (void *)[*(id *)(v1[6] + 8 * v9) backingResource];
        objc_super v12 = (char *)result + *v10;
        if ((*((void *)v12 + 5) & 0xFFFFFFFFFFFFFFuLL) >= 0x81)
        {
          unint64_t v13 = *(unsigned __int16 *)(v1[4] + 8);
          result = *(void **)v12;
          if (!*(void *)v12)
          {
            result = malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
            *(void *)objc_super v12 = result;
            if (!result)
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: !!! %s: calloc failed!\n", "agxa_resource_group_template.hpp", 26, "void AGX::ResourceGroupMembershipList::set(AGXMDSID)", "void AGX::ResourceGroupMembershipList::set(AGXMDSID)");
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v15 = "agxa_resource_group_template.hpp";
                __int16 v16 = 1024;
                int v17 = 26;
                __int16 v18 = 2080;
                v19 = "void AGX::ResourceGroupMembershipList::set(AGXMDSID)";
                __int16 v20 = 2080;
                v21 = "void AGX::ResourceGroupMembershipList::set(AGXMDSID)";
                _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: !!! %s: calloc failed!\n", buf, 0x26u);
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315906;
                v15 = "agxa_resource_group_template.hpp";
                __int16 v16 = 1024;
                int v17 = 26;
                __int16 v18 = 2080;
                v19 = "void AGX::ResourceGroupMembershipList::set(AGXMDSID)";
                __int16 v20 = 2080;
                v21 = "void AGX::ResourceGroupMembershipList::set(AGXMDSID)";
                _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: !!! %s: calloc failed!\n", buf, 0x26u);
              }
              abort();
            }
            *(_OWORD *)result = 0u;
            *((_OWORD *)result + 1) = 0u;
          }
          *(void *)((char *)result + ((v13 >> 3) & 0x1FF8)) |= 1 << v13;
        }
        unint64_t v9 = v11++;
      }
      while (v1[7] > v9);
    }
  }
  return result;
}

@end