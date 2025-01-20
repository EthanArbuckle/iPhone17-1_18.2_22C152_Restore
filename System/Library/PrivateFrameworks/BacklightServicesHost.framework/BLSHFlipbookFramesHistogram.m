@interface BLSHFlipbookFramesHistogram
+ (BLSHFlipbookFramesHistogram)histogramWithReferenceDate:(id)a3 flipbookFrames:(id)a4;
+ (BLSHFlipbookFramesHistogram)histogramWithReferenceDate:(id)a3 iteratePresentationDatesBlock:(id)a4;
- (NSArray)memoryUsageHistogram;
- (NSArray)presentationTimeHistogram;
- (double)averagePresentationTimeFromNow;
- (double)intervalUntilFirstFrame;
- (double)medianPresentationTimeFromNow;
- (double)presentationDuration;
- (float)averageAPL;
- (float)averageAPLDimming;
- (float)highestAPL;
- (float)highestAPLDimming;
- (float)lowestAPL;
- (float)lowestAPLDimming;
- (float)medianAPL;
- (float)medianAPLDimming;
- (id)description;
- (uint64_t)initWithTotalCount:(void *)a3 averagePresentationTimeFromNow:(uint64_t)a4 medianPresentationTimeFromNow:(uint64_t)a5 presentationTimeHistogram:(uint64_t)a6 intervalUntilFirstFrame:(void *)a7 presentationDuration:(double)a8 memoryUsage:(double)a9 averageMemoryUsage:(double)a10 medianMemoryUsage:(double)a11 memoryUsageHistogram:(float)a12 lowestAPL:(float)a13 averageAPL:(float)a14 medianAPL:(float)a15 highestAPL:(uint64_t)a16 lowestAPLDimming:(int)a17 averageAPLDimming:(int)a18 medianAPLDimming:(int)a19 highestAPLDimming:(int)a20;
- (unint64_t)averageMemoryUsage;
- (unint64_t)medianMemoryUsage;
- (unint64_t)memoryUsage;
- (unint64_t)totalCount;
- (unsigned)count1to2Min;
- (unsigned)count2to3Min;
- (unsigned)count3to4Min;
- (unsigned)count4to5Min;
- (unsigned)count5to6Min;
- (unsigned)countLessThan1Min;
- (unsigned)countMoreThan6Min;
- (void)stream:(void *)a3 appendRawHistogram:(void *)a4 withLabel:(void *)a5 headingBlock:;
@end

@implementation BLSHFlipbookFramesHistogram

+ (BLSHFlipbookFramesHistogram)histogramWithReferenceDate:(id)a3 flipbookFrames:(id)a4
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v81 = a3;
  id v5 = a4;
  unint64_t v72 = [v5 count];
  v6 = [MEMORY[0x263EFF910] distantFuture];
  v7 = [MEMORY[0x263EFF910] distantPast];
  v80 = [MEMORY[0x263EFF980] array];
  memset(v92, 0, sizeof(v92));
  v79 = [MEMORY[0x263EFF980] array];
  memset(v91, 0, sizeof(v91));
  v78 = [MEMORY[0x263EFF980] array];
  v77 = [MEMORY[0x263EFF980] array];
  v76 = [MEMORY[0x263EFF8F0] autoupdatingCurrentCalendar];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v5;
  uint64_t v82 = [obj countByEnumeratingWithState:&v86 objects:v90 count:16];
  if (v82)
  {
    unint64_t v8 = 0;
    uint64_t v74 = *(void *)v87;
    double v9 = 0.0;
    float v10 = 0.0;
    unint64_t v84 = 6;
    unint64_t v85 = 0;
    float v11 = 3.4028e38;
    float v83 = 0.0;
    float v12 = 0.0;
    float v13 = 3.4028e38;
    float v14 = 0.0;
    do
    {
      uint64_t v15 = 0;
      v16 = v7;
      v17 = v6;
      do
      {
        if (*(void *)v87 != v74) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v86 + 1) + 8 * v15);
        v19 = objc_msgSend(v18, "bls_specifier");
        v20 = [v19 presentationDate];

        v6 = [v17 earlierDate:v20];

        v7 = [v16 laterDate:v20];

        [v20 timeIntervalSinceDate:v81];
        double v21 = 0.0;
        if (v22 > 0.0)
        {
          [v20 timeIntervalSinceDate:v81];
          double v21 = v23;
        }
        v24 = [NSNumber numberWithDouble:v21];
        [v80 addObject:v24];

        v25 = [v76 components:64 fromDate:v81 toDate:v20 options:0];
        if ([v25 minute] < 0 || objc_msgSend(v25, "minute") <= 14)
        {
          unint64_t v26 = v84;
          if ([v25 minute] < 0) {
            unint64_t v27 = 0;
          }
          else {
            unint64_t v27 = [v25 minute];
          }
          unint64_t v28 = 0x263F08000uLL;
        }
        else
        {
          unint64_t v27 = 15;
          unint64_t v28 = 0x263F08000;
          unint64_t v26 = v84;
        }
        ++*((void *)v92 + v27);
        if (v27 > v26) {
          unint64_t v26 = v27;
        }
        unint64_t v84 = v26;
        uint64_t v29 = [v18 memoryUsage];
        v30 = [*(id *)(v28 + 2584) numberWithUnsignedInteger:v29];
        [v79 addObject:v30];

        int v31 = __clz(v29 | 1) ^ 0x3F;
        if (v31 <= 10) {
          int v31 = 10;
        }
        if (v31 >= 0x19) {
          unint64_t v32 = 15;
        }
        else {
          unint64_t v32 = (v31 - 10);
        }
        ++*((void *)v91 + v32);
        unint64_t v33 = v85;
        if (v85 <= v32) {
          unint64_t v33 = v32;
        }
        unint64_t v85 = v33;
        [v18 apl];
        float v35 = v34;
        v36 = objc_msgSend(*(id *)(v28 + 2584), "numberWithFloat:");
        [v78 addObject:v36];

        float v14 = v14 + v35;
        if (v35 < v13) {
          float v13 = v35;
        }
        if (v35 > v12) {
          float v12 = v35;
        }
        [v18 aplDimming];
        float v38 = v37;
        v39 = objc_msgSend(NSNumber, "numberWithFloat:");
        [v77 addObject:v39];

        float v83 = v83 + v38;
        if (v38 < v11) {
          float v11 = v38;
        }
        if (v38 > v10) {
          float v10 = v38;
        }
        double v9 = v9 + v21;
        v8 += v29;

        ++v15;
        v16 = v7;
        v17 = v6;
      }
      while (v82 != v15);
      uint64_t v82 = [obj countByEnumeratingWithState:&v86 objects:v90 count:16];
    }
    while (v82);
  }
  else
  {
    unint64_t v8 = 0;
    float v10 = 0.0;
    unint64_t v84 = 6;
    unint64_t v85 = 0;
    float v11 = 3.4028e38;
    float v83 = 0.0;
    float v12 = 0.0;
    float v13 = 3.4028e38;
    float v14 = 0.0;
    double v9 = 0.0;
  }

  [v7 timeIntervalSinceDate:v6];
  double v75 = v40;
  [v6 timeIntervalSinceDate:v81];
  double v71 = v41;
  v42 = [v80 sortedArrayUsingSelector:sel_compare_];
  objc_msgSend(v42, "bls_doubleMedian");
  double v70 = v43;
  double v44 = v9 / (double)v72;
  if (!v72) {
    double v44 = 0.0;
  }
  double v68 = v44;
  v45 = [v79 sortedArrayUsingSelector:sel_compare_];
  uint64_t v69 = objc_msgSend(v45, "bls_unsignedIntegerMedian");
  uint64_t v46 = [v78 count];
  if (v46)
  {
    unint64_t v47 = v46;
    v48 = [v78 sortedArrayUsingSelector:sel_compare_];
    objc_msgSend(v48, "bls_doubleMedian");
    float v50 = v49;
    float v51 = v14 / (float)v47;
  }
  else
  {
    float v12 = NAN;
    float v13 = NAN;
    float v51 = NAN;
    float v50 = NAN;
  }
  uint64_t v52 = [v77 count];
  if (v52)
  {
    unint64_t v53 = v52;
    v54 = [v77 sortedArrayUsingSelector:sel_compare_];
    objc_msgSend(v54, "bls_doubleMedian");
    float v56 = v55;
    float v57 = v83 / (float)v53;
  }
  else
  {
    float v11 = NAN;
    float v10 = NAN;
    float v57 = NAN;
    float v56 = NAN;
  }
  v58 = [MEMORY[0x263EFF980] arrayWithCapacity:v84];
  unint64_t v59 = 0;
  do
  {
    v60 = [NSNumber numberWithUnsignedInteger:*((void *)v92 + v59)];
    [v58 addObject:v60];

    ++v59;
  }
  while (v59 <= v84);
  v61 = [MEMORY[0x263EFF980] arrayWithCapacity:v85];
  for (unint64_t i = 0; i <= v85; ++i)
  {
    v63 = [NSNumber numberWithUnsignedInteger:*((void *)v91 + i)];
    [v61 addObject:v63];
  }
  v64 = [BLSHFlipbookFramesHistogram alloc];
  v66 = (void *)-[BLSHFlipbookFramesHistogram initWithTotalCount:averagePresentationTimeFromNow:medianPresentationTimeFromNow:presentationTimeHistogram:intervalUntilFirstFrame:presentationDuration:memoryUsage:averageMemoryUsage:medianMemoryUsage:memoryUsageHistogram:lowestAPL:averageAPL:medianAPL:highestAPL:lowestAPLDimming:averageAPLDimming:medianAPLDimming:highestAPLDimming:]((uint64_t)v64, v72, v58, v8, v8 / v72, v69, v61, v68, v70, v71, v75, v13, v51, v50, v12, v65, SLODWORD(v11), SLODWORD(v57), SLODWORD(v56),
                  SLODWORD(v10));

  return (BLSHFlipbookFramesHistogram *)v66;
}

- (uint64_t)initWithTotalCount:(void *)a3 averagePresentationTimeFromNow:(uint64_t)a4 medianPresentationTimeFromNow:(uint64_t)a5 presentationTimeHistogram:(uint64_t)a6 intervalUntilFirstFrame:(void *)a7 presentationDuration:(double)a8 memoryUsage:(double)a9 averageMemoryUsage:(double)a10 medianMemoryUsage:(double)a11 memoryUsageHistogram:(float)a12 lowestAPL:(float)a13 averageAPL:(float)a14 medianAPL:(float)a15 highestAPL:(uint64_t)a16 lowestAPLDimming:(int)a17 averageAPLDimming:(int)a18 medianAPLDimming:(int)a19 highestAPLDimming:(int)a20
{
  id v35 = a3;
  id v36 = a7;
  if (!a1) {
    goto LABEL_5;
  }
  if ((unint64_t)[v35 count] > 6)
  {
    v40.receiver = (id)a1;
    v40.super_class = (Class)BLSHFlipbookFramesHistogram;
    id v37 = objc_msgSendSuper2(&v40, sel_init);
    a1 = (uint64_t)v37;
    if (v37)
    {
      *((void *)v37 + 5) = a2;
      *((double *)v37 + 6) = a8;
      *((double *)v37 + 7) = a9;
      objc_storeStrong((id *)v37 + 8, a3);
      *(double *)(a1 + 72) = a10;
      *(double *)(a1 + 80) = a11;
      *(void *)(a1 + 88) = a4;
      *(void *)(a1 + 96) = a5;
      *(void *)(a1 + 104) = a6;
      objc_storeStrong((id *)(a1 + 112), a7);
      *(float *)(a1 + 8) = a12;
      *(float *)(a1 + 12) = a13;
      *(float *)(a1 + 16) = a14;
      *(float *)(a1 + 20) = a15;
      *(_DWORD *)(a1 + 24) = a17;
      *(_DWORD *)(a1 + 28) = a18;
      *(_DWORD *)(a1 + 32) = a19;
      *(_DWORD *)(a1 + 36) = a20;
    }
LABEL_5:

    return a1;
  }
  v39 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[presentationTimeHistogram count] > 6"];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BLSHFlipbookFramesHistogram initWithTotalCount:averagePresentationTimeFromNow:medianPresentationTimeFromNow:presentationTimeHistogram:intervalUntilFirstFrame:presentationDuration:memoryUsage:averageMemoryUsage:medianMemoryUsage:memoryUsageHistogram:lowestAPL:averageAPL:medianAPL:highestAPL:lowestAPLDimming:averageAPLDimming:medianAPLDimming:highestAPLDimming:](sel_initWithTotalCount_averagePresentationTimeFromNow_medianPresentationTimeFromNow_presentationTimeHistogram_intervalUntilFirstFrame_presentationDuration_memoryUsage_averageMemoryUsage_medianMemoryUsage_memoryUsageHistogram_lowestAPL_averageAPL_medianAPL_highestAPL_lowestAPLDimming_averageAPLDimming_medianAPLDimming_highestAPLDimming_, a1, (uint64_t)v39);
  }
  [v39 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BLSHFlipbookFramesHistogram)histogramWithReferenceDate:(id)a3 iteratePresentationDatesBlock:(id)a4
{
  v4 = [BLSHFlipbookFramesHistogram alloc];
  v6 = (void *)-[BLSHFlipbookFramesHistogram initWithTotalCount:averagePresentationTimeFromNow:medianPresentationTimeFromNow:presentationTimeHistogram:intervalUntilFirstFrame:presentationDuration:memoryUsage:averageMemoryUsage:medianMemoryUsage:memoryUsageHistogram:lowestAPL:averageAPL:medianAPL:highestAPL:lowestAPLDimming:averageAPLDimming:medianAPLDimming:highestAPLDimming:]((uint64_t)v4, 0, &unk_26D191658, 0, 0, 0, MEMORY[0x263EFFA68], 0.0, 0.0, 0.0, 0.0, NAN, NAN, NAN, NAN, v5, 2143289344, 2143289344, 2143289344,
                 2143289344);

  return (BLSHFlipbookFramesHistogram *)v6;
}

- (unsigned)countLessThan1Min
{
  v2 = [(NSArray *)self->_presentationTimeHistogram objectAtIndex:0];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)count1to2Min
{
  v2 = [(NSArray *)self->_presentationTimeHistogram objectAtIndex:1];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)count2to3Min
{
  v2 = [(NSArray *)self->_presentationTimeHistogram objectAtIndex:2];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)count3to4Min
{
  v2 = [(NSArray *)self->_presentationTimeHistogram objectAtIndex:3];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)count4to5Min
{
  v2 = [(NSArray *)self->_presentationTimeHistogram objectAtIndex:4];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)count5to6Min
{
  v2 = [(NSArray *)self->_presentationTimeHistogram objectAtIndex:5];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)countMoreThan6Min
{
  v2 = [(NSArray *)self->_presentationTimeHistogram objectAtIndex:6];
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)description
{
  unsigned int v3 = objc_opt_new();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__BLSHFlipbookFramesHistogram_description__block_invoke;
  v14[3] = &unk_2645322D0;
  id v4 = v3;
  id v15 = v4;
  v16 = self;
  [v4 appendProem:self block:v14];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  float v10 = __42__BLSHFlipbookFramesHistogram_description__block_invoke_2;
  float v11 = &unk_2645322D0;
  float v12 = self;
  id v13 = v4;
  id v5 = v4;
  [v5 appendBodySectionWithName:0 openDelimiter:&stru_26D1758B0 closeDelimiter:&stru_26D1758B0 block:&v8];
  v6 = objc_msgSend(v5, "description", v8, v9, v10, v11, v12);

  return v6;
}

id __42__BLSHFlipbookFramesHistogram_description__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 40) withName:@"count"];
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", @"avg∆now", 0, *(double *)(*(void *)(a1 + 40) + 48));
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", @"median∆now", 0, *(double *)(*(void *)(a1 + 40) + 56));
  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", @"time∆1st", 0, *(double *)(*(void *)(a1 + 40) + 72));
  id v6 = (id)objc_msgSend(*(id *)(a1 + 32), "bls_appendTimeInterval:withName:decomposeUnits:", @"interval", 1, *(double *)(*(void *)(a1 + 40) + 80));
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = [MEMORY[0x263F29A70] sharedFormatter];
  uint64_t v9 = [v8 stringFromByteCount:*(void *)(*(void *)(a1 + 40) + 88)];
  id v10 = (id)[v7 appendObject:v9 withName:@"totalMem"];

  float v11 = *(void **)(a1 + 32);
  float v12 = [MEMORY[0x263F29A70] sharedFormatter];
  id v13 = [v12 stringFromByteCount:*(void *)(*(void *)(a1 + 40) + 96)];
  id v14 = (id)[v11 appendObject:v13 withName:@"avgMem"];

  id v15 = *(void **)(a1 + 32);
  v16 = [MEMORY[0x263F29A70] sharedFormatter];
  v17 = [v16 stringFromByteCount:*(void *)(*(void *)(a1 + 40) + 104)];
  id v18 = (id)[v15 appendObject:v17 withName:@"medianMem"];

  id v19 = (id)[*(id *)(a1 + 32) appendFloat:@"maxAPL" withName:3 decimalPrecision:*(float *)(*(void *)(a1 + 40) + 20)];
  id v20 = (id)[*(id *)(a1 + 32) appendFloat:@"avgAPL" withName:3 decimalPrecision:*(float *)(*(void *)(a1 + 40) + 12)];
  id v21 = (id)[*(id *)(a1 + 32) appendFloat:@"medianAPL" withName:3 decimalPrecision:*(float *)(*(void *)(a1 + 40) + 16)];
  id v22 = (id)[*(id *)(a1 + 32) appendFloat:@"maxDim" withName:3 decimalPrecision:*(float *)(*(void *)(a1 + 40) + 36)];
  id v23 = (id)[*(id *)(a1 + 32) appendFloat:@"avgDim" withName:3 decimalPrecision:*(float *)(*(void *)(a1 + 40) + 28)];
  return (id)[*(id *)(a1 + 32) appendFloat:@"medianDim" withName:3 decimalPrecision:*(float *)(*(void *)(a1 + 40) + 32)];
}

void __42__BLSHFlipbookFramesHistogram_description__block_invoke_2(uint64_t a1)
{
  -[BLSHFlipbookFramesHistogram stream:appendRawHistogram:withLabel:headingBlock:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(void **)(*(void *)(a1 + 32) + 64), @"minutes", &__block_literal_global_12);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = *(void **)(v2 + 112);

  -[BLSHFlipbookFramesHistogram stream:appendRawHistogram:withLabel:headingBlock:](v2, v3, v4, @"memory", &__block_literal_global_76);
}

uint64_t __42__BLSHFlipbookFramesHistogram_description__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%u", a3);
}

- (void)stream:(void *)a3 appendRawHistogram:(void *)a4 withLabel:(void *)a5 headingBlock:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v19 = a5;
  if (a1)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    v36[3] = 0;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke;
    v35[3] = &unk_264533828;
    v35[4] = v36;
    [v10 enumerateObjectsUsingBlock:v35];
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    uint64_t v34 = 0;
    uint64_t v34 = [v10 count] - 1;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_2;
    v32[3] = &unk_264533828;
    v32[4] = v33;
    [v10 enumerateObjectsWithOptions:2 usingBlock:v32];
    unint64_t v12 = [v11 length];
    if (v12 <= [@"count" length]) {
      uint64_t v13 = [@"count" length];
    }
    else {
      uint64_t v13 = [v11 length];
    }
    uint64_t v14 = v13;
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%*s", v13, objc_msgSend(v11, "UTF8String"));
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_4;
    v26[3] = &unk_264533898;
    id v16 = v10;
    id v27 = v16;
    v30 = v36;
    int v31 = v33;
    id v17 = v19;
    id v28 = v17;
    id v29 = &__block_literal_global_88;
    [v9 appendCustomFormatWithName:v15 block:v26];

    id v18 = [NSString stringWithFormat:@"%*s", v14, objc_msgSend(@"count", "UTF8String")];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_6;
    v20[3] = &unk_264533898;
    v24 = v36;
    v25 = v33;
    id v21 = v16;
    id v22 = &__block_literal_global_88;
    id v23 = v17;
    [v9 appendCustomFormatWithName:v18 block:v20];

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v36, 8);
  }
}

id __42__BLSHFlipbookFramesHistogram_description__block_invoke_4(uint64_t a1, uint64_t a2, char a3)
{
  id v4 = [MEMORY[0x263F29A70] sharedFormatter];
  id v5 = [v4 stringFromByteCount:1 << (a3 + 10)];

  return v5;
}

uint64_t __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 unsignedIntegerValue];
  if (result) {
    *a4 = 1;
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  return result;
}

uint64_t __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 unsignedIntegerValue];
  if (result) {
    *a4 = 1;
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  }
  return result;
}

unint64_t __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v4 = a2;
  unint64_t v5 = (unint64_t)(log10((double)a3) + 1.0);
  if ([v4 length] >= v5) {
    unint64_t v5 = [v4 length];
  }

  return v5;
}

void __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 appendFormat:@"|"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_5;
  v7[3] = &unk_264533870;
  long long v11 = *(_OWORD *)(a1 + 56);
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  [v4 enumerateObjectsUsingBlock:v7];
}

uint64_t __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_5(void *a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (*(void *)(*(void *)(a1[7] + 8) + 24) <= a3 && *(void *)(*(void *)(a1[8] + 8) + 24) >= a3)
  {
    unint64_t v12 = v5;
    v7 = (*(void (**)(void))(a1[5] + 16))();
    id v8 = (void *)a1[4];
    uint64_t v9 = (*(uint64_t (**)(void, void *, uint64_t))(a1[6] + 16))(a1[6], v7, [v12 unsignedIntegerValue]);
    id v10 = v7;
    objc_msgSend(v8, "appendFormat:", @" %*s |", v9, objc_msgSend(v10, "UTF8String"));

    id v6 = v12;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

void __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 appendFormat:@"|"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_7;
  v6[3] = &unk_2645338C0;
  long long v10 = *(_OWORD *)(a1 + 56);
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __80__BLSHFlipbookFramesHistogram_stream_appendRawHistogram_withLabel_headingBlock___block_invoke_7(void *a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (*(void *)(*(void *)(a1[7] + 8) + 24) <= a3 && *(void *)(*(void *)(a1[8] + 8) + 24) >= a3)
  {
    id v10 = v5;
    uint64_t v6 = [v5 unsignedIntegerValue];
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = (*(void (**)(void))(a1[6] + 16))();
    objc_msgSend(v7, "appendFormat:", @" %*u |", (*(uint64_t (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v9, v6), v6);

    id v5 = v10;
  }
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (double)averagePresentationTimeFromNow
{
  return self->_averagePresentationTimeFromNow;
}

- (double)medianPresentationTimeFromNow
{
  return self->_medianPresentationTimeFromNow;
}

- (NSArray)presentationTimeHistogram
{
  return self->_presentationTimeHistogram;
}

- (double)intervalUntilFirstFrame
{
  return self->_intervalUntilFirstFrame;
}

- (double)presentationDuration
{
  return self->_presentationDuration;
}

- (unint64_t)memoryUsage
{
  return self->_memoryUsage;
}

- (unint64_t)averageMemoryUsage
{
  return self->_averageMemoryUsage;
}

- (unint64_t)medianMemoryUsage
{
  return self->_medianMemoryUsage;
}

- (NSArray)memoryUsageHistogram
{
  return self->_memoryUsageHistogram;
}

- (float)lowestAPL
{
  return self->_lowestAPL;
}

- (float)averageAPL
{
  return self->_averageAPL;
}

- (float)medianAPL
{
  return self->_medianAPL;
}

- (float)highestAPL
{
  return self->_highestAPL;
}

- (float)lowestAPLDimming
{
  return self->_lowestAPLDimming;
}

- (float)averageAPLDimming
{
  return self->_averageAPLDimming;
}

- (float)medianAPLDimming
{
  return self->_medianAPLDimming;
}

- (float)highestAPLDimming
{
  return self->_highestAPLDimming;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryUsageHistogram, 0);

  objc_storeStrong((id *)&self->_presentationTimeHistogram, 0);
}

- (void)initWithTotalCount:(uint64_t)a3 averagePresentationTimeFromNow:medianPresentationTimeFromNow:presentationTimeHistogram:intervalUntilFirstFrame:presentationDuration:memoryUsage:averageMemoryUsage:medianMemoryUsage:memoryUsageHistogram:lowestAPL:averageAPL:medianAPL:highestAPL:lowestAPLDimming:averageAPLDimming:medianAPLDimming:highestAPLDimming:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"BLSHFlipbookFramesHistogram.m";
  __int16 v16 = 1024;
  int v17 = 178;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end