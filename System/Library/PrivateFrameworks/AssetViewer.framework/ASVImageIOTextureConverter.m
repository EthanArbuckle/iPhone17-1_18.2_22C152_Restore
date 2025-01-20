@interface ASVImageIOTextureConverter
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)estimatedMemoryDeltaForTextureWithDescription:(id)a3;
- (BOOL)canConvertTextureWithDescription:(id)a3;
- (int64_t)converterType;
- (int64_t)maxNativeDownsamplingFactorForDownsamplingFactor:(int64_t)a3 fileType:(int64_t)a4;
@end

@implementation ASVImageIOTextureConverter

- (int64_t)converterType
{
  return 1;
}

- (BOOL)canConvertTextureWithDescription:(id)a3
{
  return 1;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)estimatedMemoryDeltaForTextureWithDescription:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 originalPixelFormat];
  uint64_t v7 = v6;
  if (v5 == 1)
  {
    if ((unint64_t)[v4 fileType] >= 7) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
  }
  [v4 originalSize];
  uint64_t v40 = v8;
  [v4 destinationSize];
  uint64_t v42 = v9;
  uint64_t v10 = [v4 destinationPixelFormat];
  uint64_t v12 = v11;
  unint64_t v13 = +[ASVTextureDescription bytesPerPixelForPixelFormat:](ASVTextureDescription, "bytesPerPixelForPixelFormat:", v5, v7);
  unint64_t v14 = +[ASVTextureDescription bytesPerPixelForPixelFormat:](ASVTextureDescription, "bytesPerPixelForPixelFormat:", v10, v12);
  int v15 = [v4 generateMipmaps];
  uint64_t v16 = (int)v42 * (uint64_t)SHIDWORD(v42);
  unint64_t v17 = v14 * v16;
  double v18 = 1.33333333;
  if (!v15) {
    double v18 = 1.0;
  }
  unint64_t v19 = [(ASVTextureConverter *)self alignUp:(unint64_t)(v18 * (double)(v14 * v16)) toAlignment:getpagesize()];
  uint64_t v20 = (int)v40 * (uint64_t)SHIDWORD(v40);
  unint64_t v21 = v13 * v20;
  if ([v4 originalPixelFormat] == 6)
  {
    if ([v4 destinationPixelFormat] == 4)
    {
LABEL_9:
      unint64_t v22 = v17 + v21;
      goto LABEL_26;
    }
    if ([v4 destinationPixelFormat] == 2) {
      unint64_t v22 = v14 * (v16 + v20);
    }
    else {
      unint64_t v22 = 0;
    }
  }
  else
  {
    if ([v4 fileType] == 1)
    {
      int64_t v23 = -[ASVImageIOTextureConverter maxNativeDownsamplingFactorForDownsamplingFactor:fileType:](self, "maxNativeDownsamplingFactorForDownsamplingFactor:fileType:", [v4 downsamplingFactor], 1);
      unint64_t v22 = v21 / (v23 * v23) + v17;
      goto LABEL_26;
    }
    if ([v4 fileType] == 4)
    {
      int64_t v24 = -[ASVImageIOTextureConverter maxNativeDownsamplingFactorForDownsamplingFactor:fileType:](self, "maxNativeDownsamplingFactorForDownsamplingFactor:fileType:", [v4 downsamplingFactor], 4);
      unint64_t v25 = v21 / (v24 * v24);
      unint64_t v26 = 2 * v25;
      unint64_t v27 = v25 + v17;
      if (v26 <= v27) {
        unint64_t v22 = v27;
      }
      else {
        unint64_t v22 = v26;
      }
      goto LABEL_26;
    }
    if ([v4 fileType] != 2)
    {
      if ([v4 fileType] == 5)
      {
        if (v17 + v21 <= v21 + v20) {
          unint64_t v22 = v21 + v20;
        }
        else {
          unint64_t v22 = v17 + v21;
        }
        goto LABEL_26;
      }
      if ([v4 fileType] != 3) {
        goto LABEL_9;
      }
    }
    if (![v4 requiresDownsampling]) {
      goto LABEL_9;
    }
    unint64_t v22 = v17 + SHIDWORD(v42) * (uint64_t)(int)v40 * v13;
  }
LABEL_26:
  if ([v4 fileType] == 1)
  {
    v22 += 35968;
  }
  else if ([v4 fileType] == 4)
  {
    v22 += 1572864;
  }
  v28 = AssetViewerLogHandleForCategory(1);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v29 = [v4 fileType];
    uint64_t v30 = [v4 downsamplingFactor];
    [v4 originalSize];
    int v43 = v31;
    [v4 originalSize];
    int v41 = v32;
    [v4 destinationSize];
    int v39 = v33;
    [v4 destinationSize];
    int v38 = v34;
    v35 = [v4 name];
    *(_DWORD *)buf = 134220034;
    uint64_t v45 = v29;
    __int16 v46 = 2048;
    uint64_t v47 = v30;
    __int16 v48 = 2048;
    unint64_t v49 = v22 >> 10;
    __int16 v50 = 2048;
    unint64_t v51 = v19 >> 10;
    __int16 v52 = 1024;
    int v53 = v43;
    __int16 v54 = 1024;
    int v55 = v41;
    __int16 v56 = 1024;
    int v57 = v39;
    __int16 v58 = 1024;
    int v59 = v38;
    __int16 v60 = 2112;
    v61 = v35;
    _os_log_impl(&dword_1E2840000, v28, OS_LOG_TYPE_DEFAULT, "fileType: %lu. factor: %lu,\tpeak: %lluKB,\tfootprint: %lluKB, (%d x %d) -> (%d x %d) - '%@'", buf, 0x4Cu);
  }
  unint64_t v36 = v19;
  unint64_t v37 = v22;
  result.var1 = v37;
  result.var0 = v36;
  return result;
}

- (int64_t)maxNativeDownsamplingFactorForDownsamplingFactor:(int64_t)a3 fileType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 3) {
    int64_t v4 = 1;
  }
  else {
    int64_t v4 = qword_1E29A3CA8[a4 - 1];
  }
  if (v4 >= a3) {
    return a3;
  }
  else {
    return v4;
  }
}

@end