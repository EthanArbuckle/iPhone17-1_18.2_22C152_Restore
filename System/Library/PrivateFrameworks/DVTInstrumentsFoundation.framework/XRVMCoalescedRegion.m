@interface XRVMCoalescedRegion
- (BOOL)isFakeAggregate;
- (XRVMCoalescedRegion)initWithCoder:(id)a3;
- (XRVMCoalescedRegion)initWithRegions:(id)a3 groupName:(id)a4;
- (id)displayPath;
- (id)displayType;
- (id)subRegions;
- (unint64_t)virtualSize;
- (void)addRegion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)sortSubregionsWithComparator:(id)a3;
@end

@implementation XRVMCoalescedRegion

- (XRVMCoalescedRegion)initWithRegions:(id)a3 groupName:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)XRVMCoalescedRegion;
  v8 = [(XRVMCoalescedRegion *)&v30 init];
  if (v8)
  {
    if ([v6 count])
    {
      objc_storeStrong((id *)&v8->_groupName, a4);
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      subRegions = v8->_subRegions;
      v8->_subRegions = v9;

      uint64_t v11 = [v6 objectAtIndex:0];
      uint64_t v12 = [(id)v11 location];
      v13 = (uint64_t *)MEMORY[0x263EF8AD0];
      v14 = (uint64_t *)MEMORY[0x263EF8AE8];
      uint64_t v15 = *MEMORY[0x263EF8AD0];
      if (*MEMORY[0x263EF8AD0] >= *MEMORY[0x263EF8AE8]) {
        uint64_t v15 = *MEMORY[0x263EF8AE8];
      }
      v8->super.start = v12 & ~v15;
      v16 = [v6 lastObject];
      uint64_t v17 = [v16 location];
      uint64_t v18 = [v16 virtualSize];
      uint64_t v19 = *v13;
      if (*v13 >= (unint64_t)*v14) {
        uint64_t v19 = *v14;
      }
      v8->super.length = (v18 + v17 - v8->super.start + v19) & ~v19;
      -[XRVMRegion setPageSize:](v8, "setPageSize:", [(id)v11 pageSize]);
      v8->super.current_prot = *(_DWORD *)(v11 + 24);
      v8->super.max_prot = *(_DWORD *)(v11 + 28);
      v8->super.external_pager = *(unsigned char *)(v11 + 32);
      v8->super.share_mode = *(unsigned char *)(v11 + 33);
      v8->super.user_tag = *(unsigned char *)(v11 + 34);
      objc_storeStrong((id *)&v8->super.path, *(id *)(v11 + 40));
      objc_storeStrong((id *)&v8->super.type, *(id *)(v11 + 48));
      v8->super.region_page_shift = *(_DWORD *)(v11 + 76);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v20 = v6;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v27;
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v27 != v23) {
              objc_enumerationMutation(v20);
            }
            -[XRVMCoalescedRegion addRegion:](v8, "addRegion:", *(void *)(*((void *)&v26 + 1) + 8 * v24++), (void)v26);
          }
          while (v22 != v24);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v22);
      }
    }
    else
    {
      uint64_t v11 = (uint64_t)v8;
      v8 = 0;
    }
  }
  return v8;
}

- (void)addRegion:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  if (!v4[35])
  {
    id v20 = v4;
    [(NSMutableArray *)self->_subRegions addObject:v4];
    char v5 = [v20 isNullRegion];
    id v6 = v20;
    if ((v5 & 1) == 0)
    {
      self->_virtualSize += *((void *)v20 + 2);
      if (self->super.current_prot != *((_DWORD *)v20 + 6)) {
        self->_multiplicityFlags |= 1u;
      }
      if (self->super.max_prot != *((_DWORD *)v20 + 7)) {
        self->_multiplicityFlags |= 2u;
      }
      if (self->super.external_pager != v20[32]) {
        self->_multiplicityFlags |= 4u;
      }
      int share_mode = self->super.share_mode;
      if (share_mode != v20[33])
      {
        self->_multiplicityFlags |= 8u;
        int share_mode = v20[33];
      }
      if (self->super.user_tag != share_mode) {
        self->_multiplicityFlags |= 0x10u;
      }
      p_path = &self->super.path;
      path = self->super.path;
      if (path
        || (uint64_t v12 = (void *)*((void *)v20 + 5)) != 0
        && (objc_storeStrong((id *)&self->super.path, v12), id v6 = v20, (path = *p_path) != 0))
      {
        v10 = (NSString *)*((void *)v6 + 5);
        if (v10)
        {
          if (path != v10)
          {
            BOOL v11 = -[NSString isEqualToString:](path, "isEqualToString:");
            id v6 = v20;
            if (!v11) {
              self->_multiplicityFlags |= 0x20u;
            }
          }
        }
      }
      p_type = &self->super.type;
      type = self->super.type;
      if (type
        || (uint64_t v17 = (void *)*((void *)v6 + 6)) != 0
        && (objc_storeStrong((id *)&self->super.type, v17), id v6 = v20, (type = *p_type) != 0))
      {
        uint64_t v15 = (NSString *)*((void *)v6 + 6);
        if (v15)
        {
          if (type != v15)
          {
            BOOL v16 = -[NSString isEqualToString:](type, "isEqualToString:");
            id v6 = v20;
            if (!v16) {
              self->_multiplicityFlags |= 0x40u;
            }
          }
        }
      }
      unsigned int pages_shared_now_private = self->super.pages_shared_now_private;
      self->super.pages_resident += *((_DWORD *)v6 + 14);
      self->super.unsigned int pages_shared_now_private = pages_shared_now_private + *((_DWORD *)v6 + 15);
      unsigned int pages_dirtied = self->super.pages_dirtied;
      self->super.pages_swapped_out += *((_DWORD *)v6 + 16);
      self->super.unsigned int pages_dirtied = pages_dirtied + *((_DWORD *)v6 + 17);
    }
  }
  MEMORY[0x270F9A828]();
}

- (unint64_t)virtualSize
{
  return self->_virtualSize;
}

- (id)subRegions
{
  return self->_subRegions;
}

- (BOOL)isFakeAggregate
{
  if ([(NSString *)self->_groupName isEqualToString:XRVMDirtyRegionAggregateName]) {
    return 1;
  }
  groupName = self->_groupName;
  char v5 = XRVMAllRegionAggregateName;
  return [(NSString *)groupName isEqualToString:v5];
}

- (void)sortSubregionsWithComparator:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  Name = sel_getName(a2);
  NSLog(&cfstr_SCalledDonT.isa, v6, Name);
}

- (XRVMCoalescedRegion)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  Name = sel_getName(a2);
  NSLog(&cfstr_SCalledDonT.isa, v7, Name);

  v11.receiver = self;
  v11.super_class = (Class)XRVMCoalescedRegion;
  v9 = [(XRVMRegion *)&v11 initWithCoder:v5];

  return v9;
}

- (id)displayType
{
  groupName = self->_groupName;
  if (groupName)
  {
    v3 = groupName;
  }
  else if ((self->_multiplicityFlags & 0x40) != 0)
  {
    v3 = @"< multiple >";
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)XRVMCoalescedRegion;
    v3 = [(XRVMRegion *)&v5 displayType];
  }
  return v3;
}

- (id)displayPath
{
  if ((self->_multiplicityFlags & 0x20) != 0)
  {
    v2 = @"< multiple >";
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)XRVMCoalescedRegion;
    v2 = [(XRVMRegion *)&v4 displayPath];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_subRegions, 0);
}

@end