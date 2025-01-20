@interface HMIObjectDetectionUtils
+ (id)convertObjectDetections:(id)a3 cropRect:(CGRect)a4 originalImageSize:(CGSize)a5;
+ (void)nmsMultiClass:(id)a3 output:(id)a4 nmsConfiguration:(id)a5;
+ (void)nonMaximumSuppression:(id)a3 output:(id)a4 withThreshold:(double)a5 withMetric:(int64_t)a6;
@end

@implementation HMIObjectDetectionUtils

+ (void)nonMaximumSuppression:(id)a3 output:(id)a4 withThreshold:(double)a5 withMetric:(int64_t)a6
{
  id v43 = a4;
  v9 = [a3 sortedArrayUsingComparator:&__block_literal_global_11];
  unint64_t v10 = [v9 count];
  Mutable = CFBitVectorCreateMutable(0, v10);
  CFBitVectorSetCount(Mutable, v10);
  CFBitVectorSetAllBits(Mutable, 1u);
  v12 = CFBitVectorCreateMutable(0, v10);
  CFBitVectorSetCount(v12, v10);
  v44 = malloc_type_malloc(32 * v10, 0x1000040E0EAB150uLL);
  if (v10)
  {
    uint64_t v13 = 0;
    v14 = v44 + 2;
    do
    {
      v15 = [v9 objectAtIndexedSubscript:v13];
      [v15 boundingBox];
      *(v14 - 2) = v16;
      *(v14 - 1) = v17;
      void *v14 = v18;
      v14[1] = v19;
      v14 += 4;

      ++v13;
    }
    while (v10 != v13);
  }
  if (a6 == 2)
  {
    v20 = (float *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
    v21 = (float *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v23 = [v9 objectAtIndexedSubscript:i];
        [v23 confidence];
        *(float *)&double v24 = v24;
        v20[i] = *(float *)&v24;

        v25 = [v9 objectAtIndexedSubscript:i];
        [v25 boundingBox];
        float v30 = HMICGRectArea(v26, v27, v28, v29);
        v21[i] = v30;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v20 = 0;
    v21 = 0;
    if (v10)
    {
LABEL_10:
      CFIndex v31 = 0;
      v45 = v9;
      v46 = v21;
      do
      {
        if (CFBitVectorGetBitAtIndex(Mutable, v31))
        {
          v32 = v20;
          CFBitVectorSetAllBits(v12, 0);
          unint64_t v33 = v31 + 1;
          if (v31 + 1 < v10)
          {
            v34 = (double *)&v44[4 * v31];
            CFIndex v35 = v31 + 1;
            v36 = (double *)&v44[4 * v31 + 7];
            while (!CFBitVectorGetBitAtIndex(Mutable, v35))
            {
LABEL_30:
              ++v35;
              v36 += 4;
              if (v10 == v35) {
                goto LABEL_31;
              }
            }
            if (a6 == 2)
            {
              HMICGRectIntersectionOverMinArea(*v34, v34[1], v34[2], v34[3], *(v36 - 3), *(v36 - 2), *(v36 - 1), *v36);
              float v37 = v39;
              if (v39 > a5 && v32[v31] * 0.95 < v32[v35] && v46[v31] > v46[v35]) {
                CFBitVectorSetBitAtIndex(v12, v31, 1u);
              }
            }
            else if (a6 == 1)
            {
              HMICGRectIntersectionOverMinArea(*v34, v34[1], v34[2], v34[3], *(v36 - 3), *(v36 - 2), *(v36 - 1), *v36);
LABEL_26:
              float v37 = v38;
            }
            else
            {
              float v37 = 0.0;
              if (!a6)
              {
                HMICGRectIntersectionOverUnion(*v34, v34[1], v34[2], v34[3], *(v36 - 3), *(v36 - 2), *(v36 - 1), *v36);
                goto LABEL_26;
              }
            }
            if (CFBitVectorGetBitAtIndex(v12, v31)) {
              goto LABEL_31;
            }
            if (v37 > a5) {
              CFBitVectorSetBitAtIndex(v12, v35, 1u);
            }
            goto LABEL_30;
          }
LABEL_31:
          if (CFBitVectorGetBitAtIndex(v12, v31)
            || ([v45 objectAtIndexedSubscript:v31],
                v41 = objc_claimAutoreleasedReturnValue(),
                [v43 addObject:v41],
                v41,
                v33 >= v10))
          {
            v20 = v32;
            v9 = v45;
            v21 = v46;
          }
          else
          {
            CFIndex v42 = v33;
            v20 = v32;
            v9 = v45;
            v21 = v46;
            do
            {
              if (CFBitVectorGetBitAtIndex(v12, v42)) {
                CFBitVectorSetBitAtIndex(Mutable, v42, 0);
              }
              ++v42;
            }
            while (v10 != v42);
          }
        }
        else
        {
          unint64_t v33 = v31 + 1;
        }
        CFIndex v31 = v33;
      }
      while (v33 != v10);
    }
  }
  CFRelease(Mutable);
  CFRelease(v12);
  free(v44);
  free(v20);
  free(v21);
}

BOOL __81__HMIObjectDetectionUtils_nonMaximumSuppression_output_withThreshold_withMetric___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 confidence];
  double v6 = v5;
  [v4 confidence];
  double v8 = v7;

  return v6 < v8;
}

+ (void)nmsMultiClass:(id)a3 output:(id)a4 nmsConfiguration:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v30 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "labelIndex", v30));
        uint64_t v16 = [v9 objectForKeyedSubscript:v15];

        if (!v16)
        {
          id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v9 setObject:v17 forKeyedSubscript:v15];
        }
        uint64_t v18 = [v9 objectForKeyedSubscript:v15];
        [v18 addObject:v14];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v11);
  }

  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v9;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * j);
        double v26 = objc_msgSend(v8, "thresholdForLabel:", v25, v30);
        uint64_t v27 = [v8 metricForLabel:v25];
        double v28 = [v20 objectForKeyedSubscript:v25];
        [v26 doubleValue];
        +[HMIObjectDetectionUtils nonMaximumSuppression:output:withThreshold:withMetric:](HMIObjectDetectionUtils, "nonMaximumSuppression:output:withThreshold:withMetric:", v28, v19, v27);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v22);
  }

  double v29 = [v19 sortedArrayUsingComparator:&__block_literal_global_99];
  [v30 addObjectsFromArray:v29];
}

BOOL __65__HMIObjectDetectionUtils_nmsMultiClass_output_nmsConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 confidence];
  double v6 = v5;
  [v4 confidence];
  double v8 = v7;

  return v6 < v8;
}

+ (id)convertObjectDetections:(id)a3 cropRect:(CGRect)a4 originalImageSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  CGFloat v7 = a4.size.height;
  CGFloat v8 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = v8;
  v21.size.double height = v7;
  if (CGRectIsNull(v21))
  {
    id v12 = v11;
  }
  else
  {
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, 1.0 / width, 1.0 / height);
    CGAffineTransform v17 = v19;
    CGAffineTransformTranslate(&v18, &v17, x, y);
    CGAffineTransform v19 = v18;
    CGAffineTransform v17 = v18;
    CGAffineTransformScale(&v18, &v17, v8, v7);
    CGAffineTransform v19 = v18;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __78__HMIObjectDetectionUtils_convertObjectDetections_cropRect_originalImageSize___block_invoke;
    v15[3] = &__block_descriptor_80_e28__16__0__HMIObjectDetection_8l;
    CGAffineTransform v16 = v18;
    objc_msgSend(v11, "na_map:", v15);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v13 = v12;

  return v13;
}

HMIObjectDetection *__78__HMIObjectDetectionUtils_convertObjectDetections_cropRect_originalImageSize___block_invoke(_OWORD *a1, void *a2)
{
  id v3 = a2;
  id v4 = [HMIObjectDetection alloc];
  uint64_t v5 = [v3 labelIndex];
  [v3 confidence];
  double v7 = v6;
  [v3 boundingBox];
  long long v8 = a1[3];
  *(_OWORD *)&v17.a = a1[2];
  *(_OWORD *)&v17.c = v8;
  *(_OWORD *)&v17.tdouble x = a1[4];
  CGRect v20 = CGRectApplyAffineTransform(v19, &v17);
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  uint64_t v13 = [v3 yaw];
  v14 = [v3 roll];

  v15 = -[HMIObjectDetection initWithLabelIndex:confidence:boundingBox:yaw:roll:](v4, "initWithLabelIndex:confidence:boundingBox:yaw:roll:", v5, v13, v14, v7, x, y, width, height);
  return v15;
}

@end