@interface GEOAPSequencesManager
+ (id)sharedManager;
- (GEOAPSequencesManager)init;
- (void)processUserAction:(uint64_t)a3 target:(double)a4 atTime:;
@end

@implementation GEOAPSequencesManager

uint64_t __57__GEOAPSequencesManager_processUserAction_target_atTime___block_invoke(uint64_t result, double a2, double a3)
{
  if (*(double *)&processUserAction_target_atTime__sessionCreateTimeInUse != a3)
  {
    processUserAction_target_atTime__sessionCreateTimeInUse = *(void *)&a3;
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (void)processUserAction:(uint64_t)a3 target:(double)a4 atTime:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v8 = [MEMORY[0x263F41C70] sharedInstance];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __57__GEOAPSequencesManager_processUserAction_target_atTime___block_invoke;
    v23[3] = &unk_2653458A8;
    v23[4] = &v24;
    [v8 shortSessionValues:v23];

    if (*((unsigned char *)v25 + 24))
    {
      v9 = *(void **)(a1 + 8);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v10);
            }
            -[GEOAPSequence reset](*(void *)(*((void *)&v28 + 1) + 8 * i));
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v11);
      }
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = *(id *)(a1 + 8);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v19 + 1) + 8 * j);
          if (-[GEOAPSequence processUserAction:target:atTime:](v18, a2, a3, a4)) {
            -[GEOAPSequence reset](v18);
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v32 count:16];
      }
      while (v15);
    }

    _Block_object_dispose(&v24, 8);
  }
}

+ (id)sharedManager
{
  self;
  if (qword_26B201B60 != -1) {
    dispatch_once(&qword_26B201B60, &__block_literal_global_8);
  }
  v0 = (void *)_MergedGlobals_10;
  return v0;
}

uint64_t __38__GEOAPSequencesManager_sharedManager__block_invoke()
{
  _MergedGlobals_10 = objc_alloc_init(GEOAPSequencesManager);
  return MEMORY[0x270F9A758]();
}

- (GEOAPSequencesManager)init
{
  v12[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)GEOAPSequencesManager;
  v2 = [(GEOAPSequencesManager *)&v11 init];
  if (v2)
  {
    id v3 = -[GEOAPSequenceState initWithAdmissionUserAction:target:]([GEOAPSequenceState alloc], 2015, 101);
    v4 = v3;
    if (v3) {
      *((void *)v3 + 3) = 0x408C200000000000;
    }
    -[GEOAPSequenceState setName:]((uint64_t)v3, @"awaiting search results");
    -[GEOAPSequenceState addAbortingUserAction:target:]((uint64_t)v4, 4, 201);
    v5 = -[GEOAPSequence initWithStartingState:]((id *)[GEOAPSequence alloc], v4);
    -[GEOAPSequence setName:]((uint64_t)v5, @"search conversion");
    v6 = -[GEOAPSequenceState initWithAdmissionUserAction:target:]([GEOAPSequenceState alloc], 2007, 101);

    if (v6) {
      v6[3] = 0x408C200000000000;
    }
    -[GEOAPSequenceState setName:]((uint64_t)v6, @"awaiting tap list item");
    -[GEOAPSequenceState addAbortingUserAction:target:]((uint64_t)v6, 4, 201);
    if (v5) {
      [v5[1] addObject:v6];
    }
    v7 = -[GEOAPSequenceState initWithAdmissionUserAction:target:]([GEOAPSequenceState alloc], 6003, 201);

    if (v7)
    {
      v7[3] = 0x408C200000000000;
      -[GEOAPSequenceState setName:]((uint64_t)v7, @"awaiting placecard interaction");
      -[GEOAPSequenceState addAdmissionUserAction:target:]((uint64_t)v7, 6009, 201);
      -[GEOAPSequenceState addAdmissionUserAction:target:]((uint64_t)v7, 6010, 201);
      -[GEOAPSequenceState addAbortingUserAction:target:]((uint64_t)v7, 4, 201);
      *((_DWORD *)v7 + 8) = 1;
      if (!v5)
      {
LABEL_11:
        v12[0] = v5;
        uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
        sequences = v2->_sequences;
        v2->_sequences = (NSArray *)v8;

        return v2;
      }
    }
    else
    {
      -[GEOAPSequenceState setName:](0, @"awaiting placecard interaction");
      -[GEOAPSequenceState addAdmissionUserAction:target:](0, 6009, 201);
      -[GEOAPSequenceState addAdmissionUserAction:target:](0, 6010, 201);
      -[GEOAPSequenceState addAbortingUserAction:target:](0, 4, 201);
      if (!v5) {
        goto LABEL_11;
      }
    }
    [v5[1] addObject:v7];
    goto LABEL_11;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end