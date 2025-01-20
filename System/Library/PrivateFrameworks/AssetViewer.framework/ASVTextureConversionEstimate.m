@interface ASVTextureConversionEstimate
+ (id)conversionEstimatesFromTextureDescriptions:(id)a3 toFitAvailableMemory:(unint64_t)a4 withConverters:(id)a5 preferredMaxTextureSize:(int64_t *)a6 outcome:;
+ (id)conversionEstimatesSortedByPeakMemoryUsage:(id)a3;
+ (id)heaviestConversionEstimate:(id)a3 withMinimumDestinationSize:;
+ (id)textureDescription:(id)a3 downsampledToTryAndFitDestinationWithinSize:;
+ (unint64_t)peakMemoryForConversionEstimates:(id)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)estimatedMemoryDelta;
- (ASVTextureConversionEstimate)initWithTextureDescription:(id)a3 converter:(id)a4;
- (id)debugDescription;
- (int64_t)converterType;
- (unint64_t)peakMemoryUsage;
- (unint64_t)weight;
- (void)setConverterType:(int64_t)a3;
- (void)setEstimatedMemoryDelta:(id)a3;
- (void)updateFromConverter:(id)a3;
@end

@implementation ASVTextureConversionEstimate

- (ASVTextureConversionEstimate)initWithTextureDescription:(id)a3 converter:(id)a4
{
  id v22 = a4;
  id v6 = a3;
  v7 = [v6 name];
  [v6 originalSize];
  double v9 = v8;
  uint64_t v10 = [v6 originalPixelFormat];
  uint64_t v12 = v11;
  uint64_t v13 = [v6 destinationPixelFormat];
  uint64_t v15 = v14;
  uint64_t v16 = [v6 downsamplingFactor];
  uint64_t v17 = [v6 fileType];
  char v18 = [v6 generateMipmaps];

  v23.receiver = self;
  v23.super_class = (Class)ASVTextureConversionEstimate;
  char v21 = v18;
  v19 = -[ASVTextureDescription initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:](&v23, sel_initWithName_originalSize_originalPixelFormat_destinationPixelFormat_downsamplingFactor_fileType_generateMipmaps_, v7, v10, v12, v13, v15, v16, v9, v17, v21);

  if (v19) {
    [(ASVTextureConversionEstimate *)v19 updateFromConverter:v22];
  }

  return v19;
}

- (void)updateFromConverter:(id)a3
{
  id v4 = a3;
  -[ASVTextureConversionEstimate setConverterType:](self, "setConverterType:", [v4 converterType]);
  uint64_t v5 = [v4 estimatedMemoryDeltaForTextureWithDescription:self];
  uint64_t v7 = v6;

  -[ASVTextureConversionEstimate setEstimatedMemoryDelta:](self, "setEstimatedMemoryDelta:", v5, v7);
}

- (unint64_t)peakMemoryUsage
{
  [(ASVTextureConversionEstimate *)self estimatedMemoryDelta];
  return v2;
}

- (unint64_t)weight
{
  [(ASVTextureDescription *)self destinationSize];
  int8x8_t v4 = v3;
  [(ASVTextureDescription *)self destinationSize];
  int8x8_t v6 = vext_s8(v5, v4, 4uLL);
  uint64_t v7 = v6.i32[0] * (uint64_t)v6.i32[1];
  uint64_t v8 = [(ASVTextureDescription *)self destinationPixelFormat];
  return v7
       * +[ASVTextureDescription bytesPerPixelForPixelFormat:](ASVTextureDescription, "bytesPerPixelForPixelFormat:", v8, v9);
}

- (id)debugDescription
{
  int8x8_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)ASVTextureConversionEstimate;
  int8x8_t v4 = [(ASVTextureDescription *)&v9 debugDescription];
  int64_t v5 = [(ASVTextureConversionEstimate *)self converterType];
  [(ASVTextureConversionEstimate *)self estimatedMemoryDelta];
  uint64_t v7 = [v3 stringWithFormat:@"%@ [converterType: %d, estimated: peak %llu / footprint %llu, weight: %lu]", v4, v5, v6, -[ASVTextureConversionEstimate estimatedMemoryDelta](self, "estimatedMemoryDelta"), -[ASVTextureConversionEstimate weight](self, "weight")];

  return v7;
}

+ (id)textureDescription:(id)a3 downsampledToTryAndFitDestinationWithinSize:
{
  int32x2_t v27 = v3;
  id v4 = a3;
  int64_t v5 = v4;
  if (v27.i32[0]
    && v27.i32[1]
    && (([v4 destinationSize], (vcgt_s32(v6, v27).u8[0] & 1) != 0)
     || ([v5 destinationSize], (vcgt_s32(v7, v27).i32[1] & 1) != 0)))
  {
    for (uint64_t i = [v5 downsamplingFactor]; ; i *= 2)
    {
      [v5 originalSize];
      v10.i32[0] = v9 / (int)i;
      v10.i32[1] = v11 / (int)i;
      int32x2_t v12 = vcgt_s32(v10, v27);
      if ((v12.i8[0] & 1) == 0 && (v12.i8[4] & 1) == 0) {
        break;
      }
    }
    uint64_t v14 = [ASVTextureDescription alloc];
    uint64_t v15 = [v5 name];
    [v5 originalSize];
    double v17 = v16;
    uint64_t v18 = [v5 originalPixelFormat];
    uint64_t v20 = v19;
    uint64_t v21 = [v5 destinationPixelFormat];
    uint64_t v23 = v22;
    uint64_t v24 = [v5 fileType];
    LOBYTE(v26) = [v5 generateMipmaps];
    uint64_t v13 = -[ASVTextureDescription initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:](v14, "initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:", v15, v18, v20, v21, v23, i, v17, v24, v26);
  }
  else
  {
    uint64_t v13 = v5;
  }

  return v13;
}

+ (id)conversionEstimatesFromTextureDescriptions:(id)a3 toFitAvailableMemory:(unint64_t)a4 withConverters:(id)a5 preferredMaxTextureSize:(int64_t *)a6 outcome:
{
  int32x2_t v67 = v6;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v70 = a5;
  if (a6) {
    *a6 = 1;
  }
  v69 = a6;
  v60 = v9;
  if ([v9 count])
  {
    if ([v70 count])
    {
      v66 = objc_opt_new();
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v75 objects:v84 count:16];
      int32x2_t v12 = a6;
      if (v11)
      {
        uint64_t v13 = v11;
        uint64_t v14 = *(void *)v76;
        unsigned __int32 v15 = vorr_s8((int8x8_t)vdup_lane_s32(v67, 1), (int8x8_t)v67).u32[0];
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v76 != v14) {
              objc_enumerationMutation(v10);
            }
            double v17 = *(void **)(*((void *)&v75 + 1) + 8 * i);
            if (v15)
            {
              uint64_t v18 = +[ASVTextureConversionEstimate textureDescription:v17 downsampledToTryAndFitDestinationWithinSize:*(double *)&v67];
              id v19 = v18;
              if (v12 && [v18 requiresDownsampling]) {
                *int32x2_t v12 = 2;
              }
            }
            else
            {
              id v19 = v17;
            }
            uint64_t v20 = +[ASVTextureConverter preferredConverterFromConverters:v70 forTextureDescription:v19];
            if (v20)
            {
              uint64_t v21 = [[ASVTextureConversionEstimate alloc] initWithTextureDescription:v19 converter:v20];
              [v66 addObject:v21];

              int32x2_t v12 = v69;
            }
          }
          uint64_t v13 = [v10 countByEnumeratingWithState:&v75 objects:v84 count:16];
        }
        while (v13);
      }

      uint64_t v22 = (void *)[v66 copy];
      uint64_t v23 = [a1 conversionEstimatesSortedByPeakMemoryUsage:v22];

      unint64_t v24 = +[ASVTextureConversionEstimate peakMemoryForConversionEstimates:v23];
      v25 = AssetViewerLogHandleForCategory(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v81 = v24;
        __int16 v82 = 2048;
        unint64_t v83 = a4;
        _os_log_impl(&dword_1E2840000, v25, OS_LOG_TYPE_DEFAULT, "peakMemory: %lu, availableMemory: %lu", buf, 0x16u);
      }

      uint64_t v26 = AssetViewerLogHandleForCategory(1);
      BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      if (a4 && v24 > a4)
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2840000, v26, OS_LOG_TYPE_DEFAULT, "Need to downsample, calculating...", buf, 2u);
        }

        v65 = objc_opt_new();
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        obuint64_t j = v23;
        uint64_t v68 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
        if (v68)
        {
          uint64_t v64 = *(void *)v72;
          do
          {
            for (uint64_t j = 0; j != v68; ++j)
            {
              if (*(void *)v72 != v64) {
                objc_enumerationMutation(obj);
              }
              v29 = *(void **)(*((void *)&v71 + 1) + 8 * j);
              v30 = [ASVTextureDescription alloc];
              v31 = [v29 name];
              [v29 originalSize];
              double v33 = v32;
              uint64_t v34 = [v29 originalPixelFormat];
              uint64_t v36 = v35;
              uint64_t v37 = [v29 destinationPixelFormat];
              uint64_t v39 = v38;
              uint64_t v40 = [v29 downsamplingFactor];
              uint64_t v41 = [v29 fileType];
              LOBYTE(v59) = [v29 generateMipmaps];
              v42 = -[ASVTextureDescription initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:](v30, "initWithName:originalSize:originalPixelFormat:destinationPixelFormat:downsamplingFactor:fileType:generateMipmaps:", v31, v34, v36, v37, v39, v40, v33, v41, v59);

              [(ASVTextureDescription *)v42 destinationSize];
              if (v43 >= 17)
              {
                do
                {
                  [(ASVTextureDescription *)v42 destinationSize];
                  if (v44 < 17) {
                    break;
                  }
                  [(ASVTextureDescription *)v42 setDownsamplingFactor:2 * [(ASVTextureDescription *)v42 downsamplingFactor]];
                  [(ASVTextureDescription *)v42 destinationSize];
                }
                while (v45 > 16);
              }
              v46 = +[ASVTextureConverter preferredConverterFromConverters:v70 forTextureDescription:v42];
              v47 = [[ASVTextureConversionEstimate alloc] initWithTextureDescription:v42 converter:v46];
              [v65 addObject:v47];
            }
            uint64_t v68 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
          }
          while (v68);
        }

        v48 = [a1 conversionEstimatesSortedByPeakMemoryUsage:v65];
        if (+[ASVTextureConversionEstimate peakMemoryForConversionEstimates:v48] > a4)
        {
LABEL_48:
          id v56 = 0;
        }
        else
        {
          id v49 = obj;
          do
          {
            v50 = v49;
            v51 = +[ASVTextureConversionEstimate heaviestConversionEstimate:v49 withMinimumDestinationSize:COERCE_DOUBLE(0x1000000010)];
            if (!v51)
            {
              obuint64_t j = v50;
              goto LABEL_48;
            }
            v52 = v51;
            objc_msgSend(v51, "setDownsamplingFactor:", 2 * objc_msgSend(v51, "downsamplingFactor"));
            v53 = +[ASVTextureConverter preferredConverterFromConverters:v70 forTextureDescription:v52];
            [v52 updateFromConverter:v53];
            v54 = [a1 conversionEstimatesSortedByPeakMemoryUsage:v50];

            unint64_t v55 = +[ASVTextureConversionEstimate peakMemoryForConversionEstimates:v54];
            id v49 = v54;
          }
          while (v55 > a4);
          if (v69) {
            int64_t *v69 = 3;
          }
          id v56 = v54;
          obuint64_t j = v56;
        }

        id v57 = obj;
      }
      else
      {
        if (v27)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E2840000, v26, OS_LOG_TYPE_DEFAULT, "No need to downsample, returning", buf, 2u);
        }

        id v57 = v23;
        id v56 = v57;
      }
    }
    else
    {
      id v56 = 0;
    }
  }
  else
  {
    id v56 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v56;
}

+ (unint64_t)peakMemoryForConversionEstimates:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v10 estimatedMemoryDelta];
        if (v7 <= v11 + v6) {
          unint64_t v7 = v11 + v6;
        }
        v6 += [v10 estimatedMemoryDelta];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (id)heaviestConversionEstimate:(id)a3 withMinimumDestinationSize:
{
  int32x2_t v4 = v3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        int32x2_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v13 = [v12 weight];
        if (v13 > v8)
        {
          unint64_t v14 = v13;
          [v12 destinationSize];
          if ((vcgt_s32(v4, v15).u8[0] & 1) == 0)
          {
            [v12 destinationSize];
            if ((vcgt_s32(v4, v16).i32[1] & 1) == 0)
            {
              id v17 = v12;

              unint64_t v8 = v14;
              id v9 = v17;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)conversionEstimatesSortedByPeakMemoryUsage:(id)a3
{
  return (id)[a3 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_10];
}

uint64_t __75__ASVTextureConversionEstimate_conversionEstimatesSortedByPeakMemoryUsage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 estimatedMemoryDelta];
  float v6 = (float)v5;
  [v4 estimatedMemoryDelta];
  unint64_t v8 = v7;

  if (v6 <= (float)v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v6 < (float)v8) {
    return 1;
  }
  else {
    return v9;
  }
}

- (int64_t)converterType
{
  return self->_converterType;
}

- (void)setConverterType:(int64_t)a3
{
  self->_converterType = a3;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)estimatedMemoryDelta
{
  p_estimatedMemoryDelta = &self->_estimatedMemoryDelta;
  unint64_t footprint = self->_estimatedMemoryDelta.footprint;
  unint64_t peak = p_estimatedMemoryDelta->peak;
  result.var1 = peak;
  result.var0 = footprint;
  return result;
}

- (void)setEstimatedMemoryDelta:(id)a3
{
  self->_estimatedMemoryDelta = ($CF008E7FDE220E2923E69B3034183AF7)a3;
}

@end