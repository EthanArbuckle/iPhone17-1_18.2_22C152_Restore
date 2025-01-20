@interface BWMultiCamConfiguration
+ (id)configurationWithCurrentStateFromCaptureDevice:(id)a3;
+ (id)configurationWithUnsynchronizedActiveStreamsPortTypes:(id)a3 synchronizedActiveStreamsGroupsPortTypes:(id)a4 stereoVideoCaptureEnabled:(BOOL)a5;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (id)copyActiveSynchronizedStreamsGroupsForDevice:(id)a3 errorOut:(int *)a4;
- (id)multiCamConfigurationForDevice:(id)a3 errorOut:(int *)a4;
- (void)_initWithUnsynchronizedActiveStreamsPortTypes:(void *)a3 synchronizedActiveStreamsGroupsPortTypes:(void *)a4 withCaptureDevice:(int)a5 readCurrentStateFromCaptureDevice:(char)a6 stereoVideoCaptureEnabled:;
- (void)dealloc;
- (void)sortedStreamsForTNRFeatureBasedRegistration:(char)a3 prioritizePrimaryStream:;
@end

@implementation BWMultiCamConfiguration

uint64_t __67__BWMultiCamConfiguration_multiCamConfigurationForDevice_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "indexOfObject:", objc_msgSend(a2, "portType"));
  uint64_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "indexOfObject:", objc_msgSend(a3, "portType"));
  if (v5 >= v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = -1;
  }
  if (v5 > v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (id)multiCamConfigurationForDevice:(id)a3 errorOut:(int *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int v58 = 0;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_synchronizedActiveStreamsGroupsPortTypes, "count"));
  v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  v39 = a4;
  if ([(NSArray *)self->_unsynchronizedActiveStreamsPortTypes count])
  {
    id v10 = (id)[a3 copyStreamsWithPortTypes:self->_unsynchronizedActiveStreamsPortTypes error:&v58];
    if (v58)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_51;
    }
    v11 = v10;
    [v9 addObjectsFromArray:v10];
  }
  else
  {
    v11 = 0;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v40 = self;
  synchronizedActiveStreamsGroupsPortTypes = self->_synchronizedActiveStreamsGroupsPortTypes;
  uint64_t v13 = [(NSArray *)synchronizedActiveStreamsGroupsPortTypes countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v55;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(synchronizedActiveStreamsGroupsPortTypes);
        }
        v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if ([v17 count])
        {
          id v18 = (id)[a3 copyStreamsWithPortTypes:v17 error:&v58];
          if (v58
            || (id v19 = v18,
                id v20 = (id)[a3 copySynchronizedStreamsGroupForStreams:v18 error:&v58],
                v58))
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            goto LABEL_50;
          }
          if (v20)
          {
            [v8 addObject:v20];
            [v9 addObjectsFromArray:v19];
          }
        }
      }
      uint64_t v14 = [(NSArray *)synchronizedActiveStreamsGroupsPortTypes countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  v21 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v9];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __67__BWMultiCamConfiguration_multiCamConfigurationForDevice_errorOut___block_invoke;
  v53[3] = &unk_1E5C27380;
  v53[4] = v40;
  [v21 sortUsingComparator:v53];
  if (v11)
  {
    v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    if (v8) {
      goto LABEL_19;
    }
LABEL_22:
    v23 = 0;
    if (v21) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  v22 = 0;
  if (!v8) {
    goto LABEL_22;
  }
LABEL_19:
  v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  if (v21)
  {
LABEL_20:
    v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
    goto LABEL_24;
  }
LABEL_23:
  v24 = 0;
LABEL_24:
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v25 = [v11 countByEnumeratingWithState:&v49 objects:v61 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v50 != v27) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(v22, "addObject:", objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * j), "figCaptureStream"));
      }
      uint64_t v26 = [v11 countByEnumeratingWithState:&v49 objects:v61 count:16];
    }
    while (v26);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v29 = [v8 countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v23, "addObject:", objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * k), "figCaptureSynchronizedStreamsGroup"));
      }
      uint64_t v30 = [v8 countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v30);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v33 = [v21 countByEnumeratingWithState:&v41 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v42;
    do
    {
      for (uint64_t m = 0; m != v34; ++m)
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(v24, "addObject:", objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * m), "figCaptureStream"));
      }
      uint64_t v34 = [v21 countByEnumeratingWithState:&v41 objects:v59 count:16];
    }
    while (v34);
  }
  if (v40->_stereoVideoCaptureEnabled && [v8 count]) {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", -[BWMultiCamConfiguration sortedStreamsForTNRFeatureBasedRegistration:prioritizePrimaryStream:]((uint64_t)v40, v8, 0), *MEMORY[0x1E4F52D68]);
  }
  [v7 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F52D58]];
  [v7 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F52D50]];
  [v7 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F52D60]];
LABEL_50:
  a4 = v39;
LABEL_51:
  int v37 = v58;
  if (a4) {
    *a4 = v58;
  }
  if (v37) {
    return 0;
  }
  id result = (id)objc_msgSend((id)objc_msgSend(v7, "allKeys"), "count");
  if (result) {
    return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMultiCamConfiguration;
  [(BWMultiCamConfiguration *)&v3 dealloc];
}

+ (id)configurationWithUnsynchronizedActiveStreamsPortTypes:(id)a3 synchronizedActiveStreamsGroupsPortTypes:(id)a4 stereoVideoCaptureEnabled:(BOOL)a5
{
  uint64_t v5 = -[BWMultiCamConfiguration _initWithUnsynchronizedActiveStreamsPortTypes:synchronizedActiveStreamsGroupsPortTypes:withCaptureDevice:readCurrentStateFromCaptureDevice:stereoVideoCaptureEnabled:]([BWMultiCamConfiguration alloc], a3, a4, 0, 0, a5);
  return v5;
}

- (void)_initWithUnsynchronizedActiveStreamsPortTypes:(void *)a3 synchronizedActiveStreamsGroupsPortTypes:(void *)a4 withCaptureDevice:(int)a5 readCurrentStateFromCaptureDevice:(char)a6 stereoVideoCaptureEnabled:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v41.receiver = a1;
  v41.super_class = (Class)BWMultiCamConfiguration;
  v11 = objc_msgSendSuper2(&v41, sel_init);
  if (!v11) {
    return v11;
  }
  uint64_t v12 = *MEMORY[0x1E4F52DF0];
  v55[0] = *MEMORY[0x1E4F52DD8];
  v55[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F52DF8];
  v55[2] = *MEMORY[0x1E4F52DE8];
  v55[3] = v13;
  v55[4] = *MEMORY[0x1E4F52E10];
  v11[1] = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:5];
  *((unsigned char *)v11 + 32) = a6;
  if (!a5)
  {
    v11[2] = [a2 copy];
    v11[3] = [a3 copy];
    return v11;
  }
  if (!a4) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"device must not be NULL" userInfo:0]);
  }
  int v54 = 0;
  uint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] array];
  v40 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = (void *)[a4 getPropertyIfSupported:*MEMORY[0x1E4F52D90] error:&v54];
  if (v54) {
    goto LABEL_32;
  }
  int v37 = v14;
  v38 = v11;
  v36 = v15;
  v16 = (void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F52D50]];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v51;
    uint64_t v20 = *MEMORY[0x1E4F555D0];
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(obj);
        }
        id v22 = (id)[a4 copySyncGroupForFigCaptureSynchronizedStreamsGroup:*(void *)(*((void *)&v50 + 1) + 8 * i) error:&v54];
        if (v54)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          v11 = v38;
          uint64_t v14 = v37;
          goto LABEL_33;
        }
        v23 = (void *)[v22 getProperty:v20 error:&v54];
        v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v25 = [v23 countByEnumeratingWithState:&v46 objects:v57 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v47 != v27) {
                objc_enumerationMutation(v23);
              }
              objc_msgSend(v24, "addObject:", objc_msgSend((id)objc_msgSend(a4, "copyStreamForFigCaptureStream:error:", *(void *)(*((void *)&v46 + 1) + 8 * j), &v54), "portType"));
            }
            uint64_t v26 = [v23 countByEnumeratingWithState:&v46 objects:v57 count:16];
          }
          while (v26);
        }
        [v40 addObject:v24];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  uint64_t v29 = (void *)[v36 objectForKeyedSubscript:*MEMORY[0x1E4F52D58]];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v56 count:16];
  v11 = v38;
  uint64_t v14 = v37;
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v43;
LABEL_23:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v43 != v32) {
        objc_enumerationMutation(v29);
      }
      id v34 = (id)[a4 copyStreamForFigCaptureStream:*(void *)(*((void *)&v42 + 1) + 8 * v33) error:&v54];
      if (v54) {
        break;
      }
      objc_msgSend(v37, "addObject:", objc_msgSend(v34, "portType"));
      if (v31 == ++v33)
      {
        uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v56 count:16];
        if (v31) {
          goto LABEL_23;
        }
        goto LABEL_33;
      }
    }
LABEL_32:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_33:
  if (v54 || (v11[2] = [v14 copy], v11[3] = objc_msgSend(v40, "copy"), v54))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v11;
}

+ (void)initialize
{
}

+ (id)configurationWithCurrentStateFromCaptureDevice:(id)a3
{
  objc_super v3 = -[BWMultiCamConfiguration _initWithUnsynchronizedActiveStreamsPortTypes:synchronizedActiveStreamsGroupsPortTypes:withCaptureDevice:readCurrentStateFromCaptureDevice:stereoVideoCaptureEnabled:]([BWMultiCamConfiguration alloc], 0, 0, a3, 1, 0);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (NSUInteger v5 = [(NSArray *)self->_unsynchronizedActiveStreamsPortTypes count],
          v5 == [*((id *)a3 + 2) count])
      && (NSUInteger v6 = [(NSArray *)self->_synchronizedActiveStreamsGroupsPortTypes count],
          v6 == [*((id *)a3 + 3) count]))
    {
      uint64_t v7 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:self->_unsynchronizedActiveStreamsPortTypes];
      int v8 = objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", *((void *)a3 + 2)));
      if (v8)
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        obuint64_t j = self->_synchronizedActiveStreamsGroupsPortTypes;
        uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v22 = *(void *)v28;
LABEL_8:
          uint64_t v11 = 0;
          while (1)
          {
            if (*(void *)v28 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            uint64_t v13 = (void *)*((void *)a3 + 3);
            uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v24;
LABEL_13:
              uint64_t v17 = 0;
              while (1)
              {
                if (*(void *)v24 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * v17);
                if (objc_msgSend(v18, "containsObject:", objc_msgSend(v12, "firstObject"))) {
                  break;
                }
                if (v15 == ++v17)
                {
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
                  if (v15) {
                    goto LABEL_13;
                  }
                  goto LABEL_19;
                }
              }
            }
            else
            {
LABEL_19:
              uint64_t v18 = 0;
            }
            uint64_t v19 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v12];
            int v8 = objc_msgSend(v19, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v18));
            if (!v8) {
              break;
            }
            if (++v11 == v10)
            {
              uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_23;
            }
          }
        }
        else
        {
LABEL_23:
          LOBYTE(v8) = self->_stereoVideoCaptureEnabled == *((unsigned __int8 *)a3 + 32);
        }
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (void)sortedStreamsForTNRFeatureBasedRegistration:(char)a3 prioritizePrimaryStream:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  NSUInteger v6 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [a2 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend(v12, "synchronizationMaster"), "portType"));
        objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v12, "activeStreams"));
      }
      uint64_t v9 = [a2 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v9);
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __95__BWMultiCamConfiguration_sortedStreamsForTNRFeatureBasedRegistration_prioritizePrimaryStream___block_invoke;
  v23[3] = &unk_1E5C27358;
  v23[4] = a1;
  v23[5] = v6;
  char v24 = a3;
  [v7 sortUsingComparator:v23];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "figCaptureStream"));
      }
      uint64_t v15 = [v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v15);
  }
  return v13;
}

uint64_t __95__BWMultiCamConfiguration_sortedStreamsForTNRFeatureBasedRegistration_prioritizePrimaryStream___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "indexOfObject:", objc_msgSend(a2, "portType"));
  uint64_t v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "indexOfObject:", objc_msgSend(a3, "portType"));
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "portType")))
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v6 = -1;
    }
    else {
      uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a3, "portType")))
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  if (v6 >= v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
  if (v6 > v7) {
    return 1;
  }
  else {
    return v8;
  }
}

- (id)copyActiveSynchronizedStreamsGroupsForDevice:(id)a3 errorOut:(int *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v22 = 0;
  uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_synchronizedActiveStreamsGroupsPortTypes, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  synchronizedActiveStreamsGroupsPortTypes = self->_synchronizedActiveStreamsGroupsPortTypes;
  uint64_t v9 = [(NSArray *)synchronizedActiveStreamsGroupsPortTypes countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(synchronizedActiveStreamsGroupsPortTypes);
        }
        uint64_t v13 = (void *)[a3 copyStreamsWithPortTypes:*(void *)(*((void *)&v18 + 1) + 8 * i) error:&v22];
        if (v22)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_11;
        }
        uint64_t v14 = (void *)[a3 copySynchronizedStreamsGroupForStreams:v13 error:&v22];
        if (v22)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_12;
        }
        [v7 addObject:v14];
      }
      uint64_t v10 = [(NSArray *)synchronizedActiveStreamsGroupsPortTypes countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:
  uint64_t v14 = 0;
LABEL_12:
  int v15 = v22;
  if (a4) {
    *a4 = v22;
  }
  if (v15 || ![v7 count]) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = (void *)[v7 copy];
  }

  return v16;
}

@end