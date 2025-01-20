@interface XRVMState
+ (BOOL)supportsSecureCoding;
+ (id)currentStateForTask:(unsigned int)a3 pid:(int)a4 previousState:(id)a5 dehydratedDiffVersion:(BOOL)a6;
+ (id)stateFrom:(id)a3;
+ (void)initialize;
- (XRVMState)init;
- (XRVMState)initWithCoder:(id)a3;
- (id)_annotationForRegion:(id)a3;
- (id)description;
- (id)detailsForRegion:(id)a3;
- (id)regionForAddress:(unint64_t)a3;
- (id)regions;
- (id)regionsWithOptions:(int)a3;
- (id)summaryRegionsWithOptions:(int)a3;
- (unint64_t)dirtySize;
- (unint64_t)machAbsoluteTimestamp;
- (unint64_t)residentSize;
- (unint64_t)swappedSize;
- (unint64_t)traceRelativeTimestamp;
- (unint64_t)virtualSize;
- (void)_addRegion:(id)a3 annotation:(id)a4 new:(BOOL)a5;
- (void)_annotateRange:(_CSRange)a3 withPath:(id)a4 type:(id)a5;
- (void)_recalculateSizes;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)hydrateWithPreviousState:(id)a3;
- (void)setPageSize:(unint64_t)a3;
- (void)setSyntheticMachAbsoluteTimestamp:(unint64_t)a3;
@end

@implementation XRVMState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x270F9A6D0](a1, sel_setVersion_);
  }
}

- (XRVMState)init
{
  v6.receiver = self;
  v6.super_class = (Class)XRVMState;
  v2 = [(XRVMState *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    regions = v2->_regions;
    v2->_regions = v3;

    v2->_pageAnnotationsByRegion = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    v2->_machAbsolute = mach_absolute_time();
  }
  return v2;
}

- (void)dealloc
{
  pageAnnotationsByRegion = self->_pageAnnotationsByRegion;
  if (pageAnnotationsByRegion) {
    CFRelease(pageAnnotationsByRegion);
  }
  v4.receiver = self;
  v4.super_class = (Class)XRVMState;
  [(XRVMState *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    [v4 encodeInteger:5 forKey:@"VMStateVersion"];
    [v4 encodeInt64:self->_machAbsolute forKey:@"VMStateMachAbsolute"];
    [v4 encodeInt64:self->_totalSize forKey:@"VMStateTotalSize"];
    [v4 encodeInt64:self->_sharedRegionStart forKey:@"VMStateSharedStart"];
    [v4 encodeInt64:self->_sharedRegionLength forKey:@"VMStateSharedLength"];
    [v4 encodeObject:self->_regions forKey:@"VMStateRegions"];
    CFIndex Count = CFDictionaryGetCount(self->_pageAnnotationsByRegion);
    objc_super v6 = [NSNumber numberWithUnsignedInt:Count];
    [v4 encodeObject:v6 forKey:@"VMStateAnnotationCount"];

    uint64_t v7 = Count;
    v8 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v9 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(self->_pageAnnotationsByRegion, v8, v9);
    v10 = [MEMORY[0x263EFF980] array];
    v11 = [MEMORY[0x263EFF980] arrayWithCapacity:Count];
    if (Count)
    {
      v12 = (void **)v9;
      v13 = v8;
      do
      {
        v15 = (void *)*v13++;
        v14 = v15;
        v16 = *v12++;
        id v17 = v16;
        id v18 = v14;
        [v10 addObject:v18];
        [v11 addObject:v17];

        --v7;
      }
      while (v7);
    }
    [v4 encodeObject:v10 forKey:@"VMStateAnnotationRegionsKeys"];
    [v4 encodeObject:v11 forKey:@"VMSTateAnnotations"];
    if (v8) {
      free(v8);
    }
    if (v9) {
      free(v9);
    }

    goto LABEL_18;
  }
  [v4 encodeValueOfObjCType:"Q" at:&self->_machAbsolute];
  [v4 encodeObject:self->_regions];
  [v4 encodeValueOfObjCType:"Q" at:&self->_totalSize];
  [v4 encodeValueOfObjCType:"Q" at:&self->_sharedRegionStart];
  [v4 encodeValueOfObjCType:"Q" at:&self->_sharedRegionLength];
  unsigned int v22 = CFDictionaryGetCount(self->_pageAnnotationsByRegion);
  [v4 encodeValueOfObjCType:"I" at:&v22];
  v19 = (const void **)malloc_type_malloc(8 * v22, 0x80040B8603338uLL);
  v20 = (const void **)malloc_type_malloc(8 * v22, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->_pageAnnotationsByRegion, v19, v20);
  if (v22)
  {
    for (unint64_t i = 0; i < v22; [v4 encodeObject:v20[i++]])
      [v4 encodeObject:v19[i]];
  }
  else if (!v19)
  {
    goto LABEL_16;
  }
  free(v19);
LABEL_16:
  if (v20) {
    free(v20);
  }
LABEL_18:
}

- (XRVMState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self)
  {
    if ([v4 allowsKeyedCoding]) {
      uint64_t v6 = [v5 decodeIntegerForKey:@"VMStateVersion"];
    }
    else {
      uint64_t v6 = [v5 versionForClassName:@"XRVMState"];
    }
    uint64_t v7 = v6;
    self->_pageAnnotationsByRegion = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    if (v7 > 4)
    {
      self->_machAbsolute = [v5 decodeInt64ForKey:@"VMStateMachAbsolute"];
      self->_totalSize = [v5 decodeInt64ForKey:@"VMStateTotalSize"];
      self->_sharedRegionStart = [v5 decodeInt64ForKey:@"VMStateSharedStart"];
      self->_sharedRegionLength = [v5 decodeInt64ForKey:@"VMStateSharedLength"];
      v10 = (void *)MEMORY[0x263EFFA08];
      uint64_t v11 = objc_opt_class();
      v12 = [v10 setWithObjects:v11, nil];
      v13 = [v5 decodeObjectOfClasses:v12 forKey:@"VMStateRegions"];
      v14 = (NSMutableArray *)[v13 mutableCopy];
      regions = self->_regions;
      self->_regions = v14;

      v16 = (void *)MEMORY[0x263EFFA08];
      uint64_t v17 = objc_opt_class();
      id v18 = [v16 setWithObjects:v17, nil];
      v19 = [v5 decodeObjectOfClasses:v18 forKey:@"VMStateAnnotationRegionsKeys"];

      v20 = (void *)MEMORY[0x263EFFA08];
      uint64_t v21 = objc_opt_class();
      unsigned int v22 = [v20 setWithObjects:v21, nil];
      v23 = [v5 decodeObjectOfClasses:v22 forKey:@"VMSTateAnnotations"];

      if ([v23 count])
      {
        uint64_t v24 = 0;
        unsigned int v25 = 1;
        do
        {
          pageAnnotationsByRegion = self->_pageAnnotationsByRegion;
          v27 = [v19 objectAtIndexedSubscript:v24];
          v28 = [v23 objectAtIndexedSubscript:v24];
          CFDictionarySetValue(pageAnnotationsByRegion, v27, v28);

          uint64_t v24 = v25;
        }
        while ([v23 count] > (unint64_t)v25++);
      }
    }
    else
    {
      v37 = 0;
      [v5 decodeValueOfObjCType:"Q" at:&v37 size:8];
      if (v7 > 1)
      {
        v8 = v37;
        uint64_t v9 = 8;
        if (v7 == 2) {
          uint64_t v9 = 16;
        }
      }
      else
      {
        v8 = (objc_class *)(1000 * (void)v37);
        uint64_t v9 = 16;
      }
      *(Class *)((char *)&self->super.isa + v9) = v8;
      v30 = [v5 decodeObject];
      v31 = self->_regions;
      self->_regions = v30;

      if (v7 <= 3)
      {
        unsigned int v36 = 0;
        [v5 decodeValueOfObjCType:"I" at:&v36 size:4];
        [v5 decodeValueOfObjCType:"I" at:&v36 size:4];
        [v5 decodeValueOfObjCType:"I" at:&v36 size:4];
      }
      [v5 decodeValueOfObjCType:"Q" at:&self->_totalSize size:8];
      [v5 decodeValueOfObjCType:"Q" at:&self->_sharedRegionStart size:8];
      [v5 decodeValueOfObjCType:"Q" at:&self->_sharedRegionLength size:8];
      unsigned int v36 = 0;
      [v5 decodeValueOfObjCType:"I" at:&v36 size:4];
      if (v36)
      {
        for (unsigned int i = 0; i < v36; ++i)
        {
          v33 = [v5 decodeObject];
          v34 = [v5 decodeObject];
          CFDictionarySetValue(self->_pageAnnotationsByRegion, v33, v34);
        }
      }
    }
    [(XRVMState *)self _recalculateSizes];
  }

  return self;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)XRVMState;
  id v4 = [(XRVMState *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@\nRegions: %@", v4, self->_regions];

  return v5;
}

+ (id)currentStateForTask:(unsigned int)a3 pid:(int)a4 previousState:(id)a5 dehydratedDiffVersion:(BOOL)a6
{
  kern_return_t v12;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t shared_cache;
  uint64_t v18;
  char v19;
  BOOL v20;
  kern_return_t v21;
  void *v22;
  void *v23;
  XRVMRegion *v24;
  XRVMRegion *v25;
  XRVMRegion *v26;
  int v27;
  void *v28;
  unint64_t i;
  thread_read_t v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  void *v34;
  char v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  ipc_space_t *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  BOOL v46;
  id v47;
  NSMutableArray *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  id v53;
  XRVMState *v54;
  void *context;
  CFDictionaryRef *v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  long long v62;
  long long v63;
  long long v64;
  long long v65;
  mach_msg_type_number_t act_listCnt;
  mach_msg_type_number_t task_info_outCnt[2];
  task_suspension_token_t suspend_token;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t);
  void *v72;
  XRVMState *v73;
  void *v74;
  uint64_t v75;
  void v76[3];
  char v77;
  int info[4];
  long long v79;
  long long v80;
  _DWORD v81[8];
  natural_t nesting_depth;
  mach_msg_type_number_t infoCnt;
  mach_vm_size_t size;
  mach_vm_address_t address;
  mach_msg_type_number_t old_stateCnt;
  unsigned char v87[128];
  unsigned char v88[128];
  integer_t task_info_out[4];
  long long v90;
  long long v91;
  long long v92;
  long long v93;
  long long v94;
  long long v95;
  long long v96;
  long long v97;
  long long v98;
  long long v99;
  long long v100;
  long long v101;
  long long v102;
  long long v103;
  long long v104;
  long long v105;
  uint64_t v106;
  uint64_t vars8;

  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  v106 = *MEMORY[0x263EF8340];
  v57 = (CFDictionaryRef *)a5;
  uint64_t v9 = objc_alloc_init(XRVMState);
  context = (void *)MEMORY[0x230FC2180]();
  size = 0;
  address = 0;
  infoCnt = 19;
  nesting_depth = 0;
  v80 = 0u;
  memset(v81, 0, 28);
  *(_OWORD *)info = 0u;
  v79 = 0u;
  if (!mach_vm_region_recurse(v8, &address, &size, &nesting_depth, info, &infoCnt))
  {
    v19 = 0;
    v20 = !v6;
    do
    {
      if (v81[0])
      {
        ++nesting_depth;
        uint64_t v21 = mach_vm_region_recurse(v8, &address, &size, &nesting_depth, info, &infoCnt);
      }
      else
      {
        unsigned int v22 = [(CFDictionaryRef *)v57 regionForAddress:address];
        v23 = v22;
        if (v22 && [v22 matchesAddr:address size:size regionInfo:info])
        {
          [(XRVMState *)v9 _addRegion:v23 annotation:CFDictionaryGetValue(v57[10], v23) new:v20];
        }
        else
        {
          uint64_t v24 = [XRVMRegion alloc];
          unsigned int v25 = [(XRVMRegion *)v24 initWithAddress:address size:size regionInfo:info];
          v26 = v25;
          if (BYTE14(v80))
          {
            v27 = proc_regionfilename(a4, address, task_info_out, 0x400u);
            if (v27 < 1)
            {
              [NSString stringWithFormat:@"Object_id=%x", v81[2]];
            }
            else
            {
              *((unsigned char *)task_info_out + v27) = 0;
              [NSString stringWithUTF8String:task_info_out];
            v28 = };
            [(XRVMRegion *)v26 setPath:v28 type:0];
          }
          else if ([(XRVMRegion *)v25 isNullRegion])
          {
            if (v19) {
              [(XRVMRegion *)v26 setPath:@"GPU Carveout (reserved)" type:0];
            }
            else {
              [(XRVMRegion *)v26 setPath:@"Commpage (reserved)" type:0];
            }
            v19 = 1;
          }
          [(XRVMState *)v9 _addRegion:v26 annotation:0 new:1];
        }
        if (!v81[0]) {
          address += size;
        }

        uint64_t v21 = mach_vm_region_recurse(v8, &address, &size, &nesting_depth, info, &infoCnt);
      }
    }
    while (!v21);
  }
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v77 = 0;
  CSSymbolicatorGetFlagsForNListOnlyData();
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  v69 = MEMORY[0x263EF8330];
  v70 = 3221225472;
  v71 = sub_230911338;
  v72 = &unk_264B906C0;
  v74 = v76;
  v75 = 10;
  v10 = v9;
  v73 = v10;
  CSSymbolicatorForeachSymbolOwnerAtTime();
  CSRelease();
  suspend_token = 0;
  int v11 = 1;
  if (!task_suspend2(v8, &suspend_token))
  {
    task_info_out[0] = 0;
    task_info_outCnt[0] = 1;
    v12 = task_info(v8, 0x1Cu, task_info_out, task_info_outCnt);
    v14 = (task_info_out[0] & 2) == 0 || v12 != 0;
    task_info_out[0] = 0;
    v15 = dyld_process_create_for_task();
    if (!v15) {
      goto LABEL_14;
    }
    task_info_out[0] = 0;
    v16 = dyld_process_snapshot_create_for_process();
    dyld_process_dispose();
    if (v16)
    {
      shared_cache = dyld_process_snapshot_get_shared_cache();
      id v18 = shared_cache;
      if (shared_cache)
      {
        if (MEMORY[0x230FC1660](shared_cache)) {
          goto LABEL_13;
        }
        v15 = MEMORY[0x230FC1640](v18);
        id v18 = MEMORY[0x230FC1650](v18);
        dyld_process_snapshot_dispose();
      }
      else
      {
        v15 = 0;
      }
LABEL_15:
      v10->_sharedRegionStart = v15;
      v10->_sharedRegionLength = v18;
      *(void *)task_info_outCnt = 0;
      act_listCnt = 0;
      if (task_threads(v8, (thread_act_array_t *)task_info_outCnt, &act_listCnt))
      {
        task_resume2(suspend_token);
      }
      else
      {
        if (act_listCnt)
        {
          for (unsigned int i = 0; i < act_listCnt; ++i)
          {
            v30 = *(_DWORD *)(*(void *)task_info_outCnt + 4 * i);
            if (v14)
            {
              LODWORD(v93) = 0;
              v91 = 0u;
              v92 = 0u;
              *(_OWORD *)task_info_out = 0u;
              v90 = 0u;
              old_stateCnt = 17;
              if (thread_get_state(v30, 1, (thread_state_t)task_info_out, &old_stateCnt)) {
                v31 = 0;
              }
              else {
                v31 = DWORD1(v92);
              }
            }
            else
            {
              v104 = 0u;
              v105 = 0u;
              v102 = 0u;
              v103 = 0u;
              v100 = 0u;
              v101 = 0u;
              v98 = 0u;
              v99 = 0u;
              v96 = 0u;
              v97 = 0u;
              v94 = 0u;
              v95 = 0u;
              v92 = 0u;
              v93 = 0u;
              v90 = 0u;
              v91 = 0u;
              *(_OWORD *)task_info_out = 0u;
              old_stateCnt = 68;
              if (thread_get_state(v30, 6, (thread_state_t)task_info_out, &old_stateCnt)) {
                v31 = 0;
              }
              else {
                v31 = *((void *)&v104 + 1);
              }
            }
            if (v31)
            {
              v32 = [(XRVMState *)v10 regionForAddress:v31];
              if (v32)
              {
                memset(task_info_out, 0, sizeof(task_info_out));
                *(void *)&v90 = 0;
                old_stateCnt = 6;
                if (thread_info(*(_DWORD *)(*(void *)task_info_outCnt + 4 * i), 4u, task_info_out, &old_stateCnt))
                {
                  NSLog(&cfstr_UnableToObtain.isa, *(unsigned int *)(*(void *)task_info_outCnt + 4 * i), v32, context);
                  v33 = @"unknown thread";
                }
                else
                {
                  [NSString stringWithFormat:@"thread %qx", *(void *)task_info_out];
                  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                v34 = [v32 path];
                v35 = [v34 isEqualToString:v33];

                if (v35)
                {
                  unsigned int v36 = v32;
                }
                else
                {
                  v37 = +[XRVMRegion regionIndexInArray:v10->_regions forAddress:v31];
                  unsigned int v36 = (void *)[v32 copy];
                  [(NSMutableArray *)v10->_regions replaceObjectAtIndex:v37 withObject:v36];
                }
                [v36 setPath:v33 type:0];
              }
            }
          }
          if (act_listCnt)
          {
            v38 = 0;
            v39 = (ipc_space_t *)MEMORY[0x263EF8960];
            do
              mach_port_deallocate(*v39, *(_DWORD *)(*(void *)task_info_outCnt + 4 * v38++));
            while (v38 < act_listCnt);
            mach_vm_deallocate(*v39, *(mach_vm_address_t *)task_info_outCnt, 4 * act_listCnt);
          }
        }
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v40 = v10->_regions;
        v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v62 objects:v88 count:16];
        if (v41)
        {
          v42 = *(void *)v63;
          do
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(void *)v63 != v42) {
                objc_enumerationMutation(v40);
              }
              v44 = *(void **)(*((void *)&v62 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                [v44 location];
                [v44 virtualSize];
                if (CSRangeContainsRange())
                {
                  v45 = [v44 type];
                  v46 = v45 == 0;

                  if (v46) {
                    [v44 setPath:@"unused shared library" type:0];
                  }
                  v47 = [[XRVMRegionAnnotation alloc] initSamplingRegion:v44 inTask:v8];
                  CFDictionarySetValue(v10->_pageAnnotationsByRegion, v44, v47);
                }
              }
            }
            v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v62 objects:v88 count:16];
          }
          while (v41);
        }

        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v48 = v10->_regions;
        v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v58 objects:v87 count:16];
        if (v49)
        {
          v50 = *(void *)v59;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(void *)v59 != v50) {
                objc_enumerationMutation(v48);
              }
              v52 = *(void **)(*((void *)&v58 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                && !CFDictionaryContainsKey(v10->_pageAnnotationsByRegion, v52)
                && [v52 location]
                && ([v52 residentSize] || [v52 swappedSize])
              {
                v53 = [[XRVMRegionAnnotation alloc] initSamplingRegion:v52 inTask:v8];
                CFDictionarySetValue(v10->_pageAnnotationsByRegion, v52, v53);
              }
            }
            v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v58 objects:v87 count:16];
          }
          while (v49);
        }

        task_resume2(suspend_token);
        v10->_task = v8;
        [(XRVMState *)v10 _recalculateSizes];
        int v11 = 0;
      }
      goto LABEL_88;
    }
LABEL_13:
    v15 = 0;
LABEL_14:
    id v18 = 0;
    goto LABEL_15;
  }
LABEL_88:

  _Block_object_dispose(v76, 8);
  if (v11) {
    v54 = 0;
  }
  else {
    v54 = v10;
  }

  return v54;
}

+ (id)stateFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(XRVMState);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[XRVMState _addRegion:annotation:new:](v4, "_addRegion:annotation:new:", *(void *)(*((void *)&v11 + 1) + 8 * i), 0, 1, (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)_recalculateSizes
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(_OWORD *)&self->_residentSize = 0u;
  *(_OWORD *)&self->_dirtySize = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = self->_regions;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = [v8 path];
          char v10 = [v9 isEqualToString:@"unused shared library"];

          if ((v10 & 1) == 0
            && ([v8 isSubmapRegion] & 1) == 0
            && ([v8 isNullRegion] & 1) == 0)
          {
            self->_totalSize += [v8 virtualSize];
            self->_residentSize += [v8 residentSize];
            self->_dirtySize += [v8 dirtySize];
            self->_swapSize += [v8 swappedSize];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)detailsForRegion:(id)a3
{
  if (a3)
  {
    uint64_t v4 = CFDictionaryGetValue(self->_pageAnnotationsByRegion, a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)setPageSize:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_regions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 pageSize:v12] == a3)
        {

          return;
        }
        [v10 setPageSize:a3];
        long long v11 = [(XRVMState *)self _annotationForRegion:v10];
        [v11 setPageSize:a3];
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  [(XRVMState *)self _recalculateSizes];
}

- (void)hydrateWithPreviousState:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v15 = self;
    uint64_t v6 = self->_regions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(NSMutableArray *)v5 addObject:v11];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v12 = [v4 regionForAddress:[v11 unsignedLongLongValue]];
              if (v12)
              {
                [(NSMutableArray *)v5 addObject:v12];
                long long v13 = [v4 _annotationForRegion:v12];
                if (v13) {
                  CFDictionarySetValue(v15->_pageAnnotationsByRegion, v12, v13);
                }
              }
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    regions = v15->_regions;
    v15->_regions = v5;

    [(XRVMState *)v15 _recalculateSizes];
  }
}

- (id)regionForAddress:(unint64_t)a3
{
  unint64_t v4 = +[XRVMRegion regionIndexInArray:self->_regions forAddress:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_regions objectAtIndex:v4];
  }
  return v5;
}

- (unint64_t)virtualSize
{
  return self->_totalSize;
}

- (unint64_t)residentSize
{
  return self->_residentSize;
}

- (unint64_t)dirtySize
{
  return self->_dirtySize;
}

- (unint64_t)swappedSize
{
  return self->_swapSize;
}

- (id)regions
{
  return self->_regions;
}

- (unint64_t)machAbsoluteTimestamp
{
  return self->_machAbsolute;
}

- (void)setSyntheticMachAbsoluteTimestamp:(unint64_t)a3
{
  self->_machAbsolute = a3;
  [(XRVMState *)self _recalculateSizes];
}

- (unint64_t)traceRelativeTimestamp
{
  return self->_traceRelative;
}

- (void)_addRegion:(id)a3 annotation:(id)a4 new:(BOOL)a5
{
  BOOL v5 = a5;
  id key = a3;
  id v8 = a4;
  if (key)
  {
    if (v5)
    {
      id v9 = key;
      if (v8)
      {
        CFDictionarySetValue(self->_pageAnnotationsByRegion, key, v8);
        id v9 = key;
      }
      [(NSMutableArray *)self->_regions addObject:v9];
    }
    else
    {
      regions = self->_regions;
      long long v11 = [NSNumber numberWithUnsignedLongLong:[key location]];
      [(NSMutableArray *)regions addObject:v11];
    }
  }
}

- (id)_annotationForRegion:(id)a3
{
  if (a3)
  {
    unint64_t v4 = CFDictionaryGetValue(self->_pageAnnotationsByRegion, a3);
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

- (void)_annotateRange:(_CSRange)a3 withPath:(id)a4 type:(id)a5
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  id v28 = a4;
  id v9 = a5;
  unint64_t v10 = +[XRVMRegion regionIndexInArray:self->_regions forAddress:var0];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = v10;
    long long v12 = [(NSMutableArray *)self->_regions objectAtIndex:v10];
    unint64_t v13 = [v12 location];
    unint64_t v14 = var0 - v13;
    if (var0 > v13)
    {
      unint64_t v15 = v13;
      long long v16 = (void *)[v12 copy];
      [v16 setAddress:v15 size:v14];
      [(NSMutableArray *)self->_regions insertObject:v16 atIndex:v11++];
    }
    unint64_t v17 = var0 + var1;
    unint64_t v18 = +[XRVMRegion regionIndexInArray:self->_regions forAddress:var0 + var1];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v19 = v18;
      v20 = [(NSMutableArray *)self->_regions objectAtIndex:v18];
      uint64_t v21 = [v20 location];
      uint64_t v22 = [v20 virtualSize];
      if (v22 + v21 > v17)
      {
        if (v20 == v12)
        {
          unint64_t v27 = v22 + v21 - v17;
          id v26 = (id)[v12 copy];
          [(NSMutableArray *)self->_regions insertObject:v26 atIndex:v11 + 1];
          unint64_t v25 = v27;
        }
        else
        {
          unint64_t v23 = v22 + v21 - v17;
          id v24 = v20;
          unint64_t v25 = v23;
          id v26 = v24;
          --v19;
        }
        [v26 setAddress:var0 + var1 size:v25];
      }
      if (v19 > v11) {
        -[NSMutableArray removeObjectsInRange:](self->_regions, "removeObjectsInRange:", v11 + 1, v19 - v11);
      }
    }
    [v12 setAddress:var0 size:var1];
    [v12 setPath:v28 type:v9];
  }
}

- (id)regionsWithOptions:(int)a3
{
  char v19 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v20 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v4 = self->_regions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v5)
  {
    id v8 = 0;
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v22;
  do
  {
    uint64_t v10 = 0;
    do
    {
      unint64_t v11 = v7;
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v4);
      }
      long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
      unint64_t v13 = [v12 path];
      int v14 = [v13 isEqualToString:@"unused shared library"];

      if (v14)
      {
        if (v11) {
          [v20 addObject:v11];
        }
        uint64_t v7 = 0;
      }
      else if ((v19 & 1) != 0 {
             && v11
      }
             && [v12 typeMatches:v11]
             && [v12 isAdjacentTo:v11])
      {
        if (v8)
        {
          [v8 addObject:v12];
        }
        else
        {
          id v8 = [MEMORY[0x263EFF980] arrayWithObjects:v11, v12, nil];
        }
        uint64_t v7 = v12;
      }
      else
      {
        if (v8)
        {
          unint64_t v15 = [[XRVMCoalescedRegion alloc] initWithRegions:v8 groupName:0];
          [v20 addObject:v15];
        }
        else if (v11)
        {
          [v20 addObject:v11];
        }
        uint64_t v7 = v12;
        id v8 = 0;
      }

      ++v10;
    }
    while (v6 != v10);
    uint64_t v16 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    uint64_t v6 = v16;
  }
  while (v16);

  if (v8)
  {
    unint64_t v17 = [[XRVMCoalescedRegion alloc] initWithRegions:v8 groupName:0];
    [v20 addObject:v17];

LABEL_31:
    unint64_t v4 = v7;
    goto LABEL_32;
  }
  if (v7)
  {
    [v20 addObject:v7];
    id v8 = 0;
    goto LABEL_31;
  }
  id v8 = 0;
LABEL_33:

  return v20;
}

- (id)summaryRegionsWithOptions:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  context = (void *)MEMORY[0x230FC2180]();
  [(XRVMState *)self regionsWithOptions:v3];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v13 = [v12 displayType];
        if ([v12 location])
        {
          if (v9)
          {
            [(XRVMCoalescedRegion *)v9 addRegion:v12];
          }
          else
          {
            int v14 = [XRVMCoalescedRegion alloc];
            unint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObject:v12];
            uint64_t v9 = [(XRVMCoalescedRegion *)v14 initWithRegions:v15 groupName:XRVMAllRegionAggregateName];

            [v5 setObject:v9 forKey:XRVMAllRegionAggregateName];
          }
          if ([v12 dirtySize])
          {
            if (v8)
            {
              [v8 addRegion:v12];
            }
            else
            {
              uint64_t v16 = [XRVMCoalescedRegion alloc];
              unint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObject:v12];
              uint64_t v18 = [(XRVMCoalescedRegion *)v16 initWithRegions:v17 groupName:XRVMDirtyRegionAggregateName];

              id v8 = (void *)v18;
              [v5 setObject:v18 forKey:XRVMDirtyRegionAggregateName];
            }
          }
          char v19 = [v5 objectForKey:v13];
          if (v19)
          {
            id v20 = v19;
            [(XRVMCoalescedRegion *)v19 addRegion:v12];
          }
          else
          {
            long long v21 = [XRVMCoalescedRegion alloc];
            long long v22 = [MEMORY[0x263EFF8C0] arrayWithObject:v12];
            id v20 = [(XRVMCoalescedRegion *)v21 initWithRegions:v22 groupName:v13];

            [v5 setObject:v20 forKey:v13];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
    uint64_t v9 = 0;
  }

  long long v23 = [v5 allValues];

  return v23;
}

- (void).cxx_destruct
{
}

@end