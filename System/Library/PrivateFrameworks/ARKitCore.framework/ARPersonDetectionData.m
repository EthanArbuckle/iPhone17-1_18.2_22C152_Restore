@interface ARPersonDetectionData
- (NSArray)detectedObjects;
- (NSString)description;
- (double)timestamp;
- (id)mergeOverlappingDetectionsWithThreshold:(float)a3;
- (id)transformToCVPixelBuffer:(__CVBuffer *)a3 depthBuffer:(__CVBuffer *)a4;
- (void)setDetectedObjects:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARPersonDetectionData

- (id)transformToCVPixelBuffer:(__CVBuffer *)a3 depthBuffer:(__CVBuffer *)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v7 = [(ARPersonDetectionData *)self detectedObjects];
  uint64_t v8 = [v7 count];

  if (!v8) {
    goto LABEL_48;
  }
  CVPixelBufferLockBaseAddress(a3, 0);
  CVPixelBufferLockBaseAddress(a4, 0);
  memset(v81, 0, sizeof(v81));
  ARWrapCVPixelBufferVImage(a4, (void **)v81);
  memset(v80, 0, sizeof(v80));
  ARWrapCVPixelBufferVImage(a3, (void **)v80);
  if (*(_OWORD *)((char *)v81 + 8) != *(_OWORD *)((char *)v80 + 8)
    || CVPixelBufferGetPixelFormatType(a3) != 1278226488
    || CVPixelBufferGetPixelFormatType(a4) != 1717855600)
  {
    CVPixelBufferUnlockBaseAddress(a4, 0);
    CVPixelBufferUnlockBaseAddress(a3, 0);
LABEL_48:
    v69 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_49;
  }
  CVPixelBufferRef pixelBuffer = a4;
  v9 = objc_opt_new();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v10 = [(ARPersonDetectionData *)self detectedObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v76 objects:v82 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v77 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        v16 = [ARDepthBasedPersonDetectionResult alloc];
        objc_msgSend(v15, "boundingBox", pixelBuffer);
        v17 = -[ARDepthBasedPersonDetectionResult initWithBoundingBox:](v16, "initWithBoundingBox:");
        [v9 addObject:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v76 objects:v82 count:16];
    }
    while (v12);
  }

  unint64_t v18 = *((void *)&v80[0] + 1);
  if (*((void *)&v80[0] + 1))
  {
    unint64_t v19 = 0;
    unint64_t v20 = *(void *)&v80[1];
    unint64_t v21 = *(void *)&v80[1];
    do
    {
      if (v21)
      {
        unint64_t v22 = 0;
        uint64_t v23 = *(void *)&v80[0] + *((void *)&v80[1] + 1) * v19;
        uint64_t v24 = *(void *)&v81[0] + *((void *)&v81[1] + 1) * v19;
        double v25 = (double)(int)v19;
        unint64_t v72 = v19;
        float v75 = (float)(int)v19;
        do
        {
          if (*(unsigned char *)(v23 + v22))
          {
            if ([v9 count])
            {
              uint64_t v26 = 0;
              unint64_t v27 = 0;
              float v74 = (float)(int)v22;
              v28.f32[0] = (float)(int)v22;
              v28.f32[1] = v75;
              float32x2_t v73 = v28;
              int v29 = -1;
              float v30 = 3.4028e38;
              while (1)
              {
                v31 = objc_msgSend(v9, "objectAtIndexedSubscript:", v27, pixelBuffer);
                [v31 rectScaledToSizeOfPixelBuffer:a3];
                double x = v86.origin.x;
                double y = v86.origin.y;
                double width = v86.size.width;
                double height = v86.size.height;
                v85.double x = (double)(int)v22;
                v85.double y = v25;
                if (CGRectContainsPoint(v86, v85)) {
                  break;
                }
                *(float *)&unsigned int v36 = x;
                float v37 = y;
                BOOL v40 = v74 < *(float *)&v36;
                float32x2_t v41 = (float32x2_t)v36;
                v42.f32[0] = (float)(int)v22;
                if (v40) {
                  float32x2_t v42 = v41;
                }
                float v38 = x + width;
                if (v38 < v74)
                {
                  float32_t v43 = x + width;
                  v42.f32[0] = v43;
                }
                float v39 = y + height;
                if (v75 <= v39) {
                  float v44 = v75;
                }
                else {
                  float v44 = y + height;
                }
                if (v37 <= v75) {
                  float v37 = v44;
                }
                v42.f32[1] = v37;
                float32x2_t v45 = vsub_f32(v73, v42);
                float v46 = sqrtf(vaddv_f32(vmul_f32(v45, v45)));
                if (v46 < v30)
                {
                  float v30 = v46;
                  int v29 = v27;
                }

                ++v27;
                v26 += 0x100000000;
                if ([v9 count] <= v27) {
                  goto LABEL_35;
                }
              }

              uint64_t v47 = v26 >> 32;
            }
            else
            {
              int v29 = -1;
              float v30 = 3.4028e38;
LABEL_35:
              uint64_t v47 = v29;
              v48 = objc_msgSend(v9, "objectAtIndexedSubscript:", v29, pixelBuffer);
              [v48 rectScaledToSizeOfPixelBuffer:a3];
              if (v49 >= v50) {
                double v51 = v50;
              }
              else {
                double v51 = v49;
              }
              if (v51 * 0.5 > v30)
              {
                CGFloat v52 = (float)((float)(int)v22 / (float)*(unint64_t *)&v80[1]);
                CGFloat v53 = (float)(v75 / (float)*((unint64_t *)&v80[0] + 1));
                [v48 boundingBox];
                double v55 = v54;
                [v48 boundingBox];
                double v57 = v55 + v56;
                [v48 boundingBox];
                v87.size.double width = v57 - v52;
                v87.size.double height = v58 - v53;
                v87.origin.double x = v52;
                v87.origin.double y = v53;
                CGRect v88 = CGRectStandardize(v87);
                CGFloat v59 = v88.origin.x;
                CGFloat v60 = v88.origin.y;
                CGFloat v61 = v88.size.width;
                CGFloat v62 = v88.size.height;
                [v48 boundingBox];
                v91.origin.double x = v63;
                v91.origin.double y = v64;
                v91.size.double width = v65;
                v91.size.double height = v66;
                v89.origin.double x = v59;
                v89.origin.double y = v60;
                v89.size.double width = v61;
                v89.size.double height = v62;
                CGRect v90 = CGRectUnion(v89, v91);
                objc_msgSend(v48, "setBoundingBox:", v90.origin.x, v90.origin.y, v90.size.width, v90.size.height);
              }
            }
            v67 = [v9 objectAtIndexedSubscript:v47];
            LODWORD(v68) = *(_DWORD *)(v24 + 4 * v22);
            [v67 addSampleValue:v68];

            unint64_t v20 = *(void *)&v80[1];
          }
          ++v22;
        }
        while (v20 > v22);
        unint64_t v18 = *((void *)&v80[0] + 1);
        unint64_t v21 = v20;
        unint64_t v19 = v72;
      }
      ++v19;
    }
    while (v18 > v19);
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  CVPixelBufferUnlockBaseAddress(a3, 0);
  v69 = [v9 sortedArrayUsingComparator:&__block_literal_global_122];

LABEL_49:
  return v69;
}

BOOL __62__ARPersonDetectionData_transformToCVPixelBuffer_depthBuffer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 boundingBox];
  double v6 = v5;
  [v4 boundingBox];
  double v8 = v7;

  return v6 < v8;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(ARPersonDetectionData *)self timestamp];
  double v7 = [v3 stringWithFormat:@"%@(%p): %f", v5, self, v6];

  return (NSString *)v7;
}

- (id)mergeOverlappingDetectionsWithThreshold:(float)a3
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __65__ARPersonDetectionData_mergeOverlappingDetectionsWithThreshold___block_invoke_2;
  v110[3] = &unk_1E61885B8;
  id v111 = &__block_literal_global_72_0;
  v94 = (double (**)(double, double, double, double, double, double, double, double))MEMORY[0x1BA9C63E0](v110, a2);
  double v5 = objc_opt_new();
  uint64_t v6 = [(ARPersonDetectionData *)self detectedObjects];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    obuint64_t j = a3;
    uint64_t v9 = 1;
    do
    {
      v10 = objc_opt_new();
      uint64_t v11 = [(ARPersonDetectionData *)self detectedObjects];
      uint64_t v12 = [v11 objectAtIndexedSubscript:v8];
      [v12 boundingBox];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;

      unint64_t v21 = v8 + 1;
      unint64_t v22 = [(ARPersonDetectionData *)self detectedObjects];
      unint64_t v23 = [v22 count];

      if (v23 > v8 + 1)
      {
        unint64_t v24 = v9;
        do
        {
          double v25 = [(ARPersonDetectionData *)self detectedObjects];
          uint64_t v26 = [v25 objectAtIndexedSubscript:v24];
          [v26 boundingBox];
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;

          if (v94[2](v14, v16, v18, v20, v28, v30, v32, v34) > obj)
          {
            v35 = [NSNumber numberWithInt:v24];
            [v10 addObject:v35];
          }
          ++v24;
          unsigned int v36 = [(ARPersonDetectionData *)self detectedObjects];
          unint64_t v37 = [v36 count];
        }
        while (v37 > v24);
      }
      float v38 = [NSNumber numberWithInt:v8];
      [v5 setObject:v10 forKey:v38];

      float v39 = [(ARPersonDetectionData *)self detectedObjects];
      unint64_t v40 = [v39 count];

      ++v9;
      unint64_t v8 = v21;
    }
    while (v40 > v21);
  }
  float32x2_t v41 = [v5 allKeys];
  float32x2_t v42 = (void *)[v41 copy];

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obja = v42;
  uint64_t v43 = [obja countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v107 != v45) {
          objc_enumerationMutation(obja);
        }
        uint64_t v47 = *(void *)(*((void *)&v106 + 1) + 8 * i);
        v48 = [v5 allKeys];
        int v49 = [v48 containsObject:v47];

        if (v49)
        {
          double v50 = objc_opt_new();
          double v51 = [v5 recursiveObjectForKey:v47 deleteKeys:v50];
          [v5 removeObjectsForKeys:v50];
          [v5 setObject:v51 forKey:v47];
        }
      }
      uint64_t v44 = [obja countByEnumeratingWithState:&v106 objects:v114 count:16];
    }
    while (v44);
  }

  v92 = objc_opt_new();
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v95 = [v5 allKeys];
  uint64_t v52 = [v95 countByEnumeratingWithState:&v102 objects:v113 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v103;
    uint64_t v91 = *(void *)v103;
    do
    {
      uint64_t v55 = 0;
      uint64_t v93 = v53;
      do
      {
        if (*(void *)v103 != v54) {
          objc_enumerationMutation(v95);
        }
        double v56 = *(void **)(*((void *)&v102 + 1) + 8 * v55);
        double v57 = objc_msgSend(v5, "objectForKeyedSubscript:", v56, v91);
        unsigned int v58 = [v56 intValue];
        if ((v58 & 0x80000000) == 0)
        {
          unsigned int v59 = v58;
          CGFloat v60 = [(ARPersonDetectionData *)self detectedObjects];
          unint64_t v61 = [v60 count] - 1;

          if (v61 >= v59)
          {
            CGFloat v62 = [(ARPersonDetectionData *)self detectedObjects];
            CGFloat v63 = [v62 objectAtIndexedSubscript:v59];
            [v63 boundingBox];
            double x = v64;
            double y = v66;
            double width = v68;
            double height = v70;

            long long v100 = 0u;
            long long v101 = 0u;
            long long v98 = 0u;
            long long v99 = 0u;
            id v72 = v57;
            uint64_t v73 = [v72 countByEnumeratingWithState:&v98 objects:v112 count:16];
            if (v73)
            {
              uint64_t v74 = v73;
              uint64_t v75 = *(void *)v99;
              do
              {
                for (uint64_t j = 0; j != v74; ++j)
                {
                  if (*(void *)v99 != v75) {
                    objc_enumerationMutation(v72);
                  }
                  long long v77 = *(void **)(*((void *)&v98 + 1) + 8 * j);
                  long long v78 = [(ARPersonDetectionData *)self detectedObjects];
                  long long v79 = objc_msgSend(v78, "objectAtIndexedSubscript:", (int)objc_msgSend(v77, "intValue"));
                  [v79 boundingBox];
                  CGFloat v81 = v80;
                  CGFloat v83 = v82;
                  CGFloat v85 = v84;
                  CGFloat v87 = v86;

                  v117.origin.double x = x;
                  v117.origin.double y = y;
                  v117.size.double width = width;
                  v117.size.double height = height;
                  v119.origin.double x = v81;
                  v119.origin.double y = v83;
                  v119.size.double width = v85;
                  v119.size.double height = v87;
                  CGRect v118 = CGRectUnion(v117, v119);
                  double x = v118.origin.x;
                  double y = v118.origin.y;
                  double width = v118.size.width;
                  double height = v118.size.height;
                }
                uint64_t v74 = [v72 countByEnumeratingWithState:&v98 objects:v112 count:16];
              }
              while (v74);
            }

            CGRect v88 = -[ARPersonDetectionResult initWithBoundingBox:]([ARPersonDetectionResult alloc], "initWithBoundingBox:", x, y, width, height);
            [v92 addObject:v88];

            uint64_t v54 = v91;
            uint64_t v53 = v93;
          }
        }

        ++v55;
      }
      while (v55 != v53);
      uint64_t v53 = [v95 countByEnumeratingWithState:&v102 objects:v113 count:16];
    }
    while (v53);
  }

  CGRect v89 = objc_opt_new();
  [(ARPersonDetectionData *)self timestamp];
  objc_msgSend(v89, "setTimestamp:");
  [v89 setDetectedObjects:v92];

  return v89;
}

double __65__ARPersonDetectionData_mergeOverlappingDetectionsWithThreshold___block_invoke(double a1, double a2, double a3, double a4)
{
  return a3 * a4;
}

double __65__ARPersonDetectionData_mergeOverlappingDetectionsWithThreshold___block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  uint64_t v18 = *(void *)(a1 + 32);
  CGRect v22 = CGRectIntersection(*(CGRect *)&a2, *(CGRect *)&a6);
  double v21 = (*(double (**)(uint64_t, CGPoint, __n128, CGSize, __n128))(v18 + 16))(v18, v22.origin, *(__n128 *)&v22.origin.y, v22.size, *(__n128 *)&v22.size.height);
  uint64_t v19 = *(void *)(a1 + 32);
  v23.origin.double x = a2;
  v23.origin.double y = a3;
  v23.size.double width = a4;
  v23.size.double height = a5;
  v25.origin.double x = a6;
  v25.origin.double y = a7;
  v25.size.double width = a8;
  v25.size.double height = a9;
  CGRect v24 = CGRectUnion(v23, v25);
  return v21
       / (*(double (**)(uint64_t, CGPoint, __n128, CGSize, __n128))(v19 + 16))(v19, v24.origin, *(__n128 *)&v24.origin.y, v24.size, *(__n128 *)&v24.size.height);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSArray)detectedObjects
{
  return self->_detectedObjects;
}

- (void)setDetectedObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end