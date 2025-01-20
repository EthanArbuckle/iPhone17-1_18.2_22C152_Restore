@interface SRDatastore
+ (void)initialize;
- (BOOL)writeSampleBytes:(z_size_t)a3 length:(SRError *)a4 timestamp:(double)a5 error:;
- (double)startTimeOfCurrentSegment;
- (void)dealloc;
- (void)fetchSamplesFrom:(double)a3 to:(double)a4 callback:;
- (void)initWithSampleFile:(void *)a3 metadataFile:(void *)a4 configurationFile:(uint64_t)a5 permission:(uint64_t)a6 defaults:;
- (void)removeSamplesFrom:(double)a3 to:(double)a4 callback:;
- (void)syncMappedFiles;
@end

@implementation SRDatastore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogDatastore = (uint64_t)os_log_create("com.apple.SensorKit", "Datastore");
  }
}

- (void)initWithSampleFile:(void *)a3 metadataFile:(void *)a4 configurationFile:(uint64_t)a5 permission:(uint64_t)a6 defaults:
{
  if (!a1) {
    return 0;
  }
  v20.receiver = a1;
  v20.super_class = (Class)SRDatastore;
  v11 = objc_msgSendSuper2(&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11[1] = a5;
    if (a6) {
      unint64_t v13 = (unint64_t)((double)*(unint64_t *)(a6 + 16) * *(float *)(a6 + 44));
    }
    else {
      unint64_t v13 = 0;
    }
    NSUInteger v14 = NSPageSize();
    if (v14 > v13) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = v13 / v14;
    }
    unint64_t v16 = v15 * NSPageSize();
    if (a6)
    {
      v12[2] = *(void *)(a6 + 32);
      int v17 = *(_DWORD *)(a6 + 40);
      unint64_t v18 = *(void *)(a6 + 24);
    }
    else
    {
      unint64_t v18 = 0;
      v12[2] = 0;
      int v17 = 0;
    }
    *((_DWORD *)v12 + 6) = v17;
    v12[4] = (id)a6;
    v12[5] = -[SRFrameStore initWithFileHandle:maxSize:permission:defaults:]([SRFrameStore alloc], a2, v16, v12[1], a6);
    if (a3) {
      v12[6] = -[SRFrameStore initWithFileHandle:maxSize:permission:defaults:]([SRFrameStore alloc], a3, v18, v12[1], a6);
    }
    if (a4) {
      v12[7] = -[SRFrameStore initWithFileHandle:maxSize:permission:defaults:]([SRFrameStore alloc], a4, v18, v12[1], a6);
    }
  }
  return v12;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_atomic(self, a2, 0, 40);
    objc_setProperty_atomic(self, v3, 0, 48);
    objc_setProperty_atomic(self, v4, 0, 56);
  }

  self->_defaults = 0;
  v5.receiver = self;
  v5.super_class = (Class)SRDatastore;
  [(SRDatastore *)&v5 dealloc];
}

- (BOOL)writeSampleBytes:(z_size_t)a3 length:(SRError *)a4 timestamp:(double)a5 error:
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  Property = objc_getProperty((id)result, a2, 40, 1);
  if (!Property)
  {
    uint64_t v20 = SRLogDatastore;
    if (!os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_INFO)) {
      goto LABEL_43;
    }
    LOWORD(v41) = 0;
    v21 = "No disk space available, dropping data";
    v22 = v20;
    os_log_type_t v23 = OS_LOG_TYPE_INFO;
    uint32_t v24 = 2;
LABEL_42:
    _os_log_impl(&dword_21FCA3000, v22, v23, v21, (uint8_t *)&v41, v24);
    goto LABEL_43;
  }
  uint64_t v11 = (uint64_t)Property;
  v12 = (void *)Property[2];
  if (v12) {
    unint64_t v13 = v12[6] - v12[3] + v12[2];
  }
  else {
    unint64_t v13 = 0;
  }
  if (v13 >= a3 + 20) {
    goto LABEL_21;
  }
  NSUInteger v14 = SRLogDatastore;
  if (os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_INFO))
  {
    if (v12) {
      z_size_t v15 = v12[6] - v12[3] + v12[2];
    }
    else {
      z_size_t v15 = 0;
    }
    int v41 = 134349312;
    z_size_t v42 = v15;
    __int16 v43 = 2050;
    z_size_t v44 = a3 + 20;
    _os_log_impl(&dword_21FCA3000, v14, OS_LOG_TYPE_INFO, "Not enough free space (%{public}zu) to write %{public}zu. Attempting to expand the mapped region", (uint8_t *)&v41, 0x16u);
  }
  NSUInteger v16 = *(void *)(v9 + 16) * NSPageSize();
  uint64_t v17 = *(void *)(v11 + 24);
  if (v17 && (uint64_t v18 = *(void *)(v17 + 16)) != 0)
  {
    uint64_t v19 = *(void *)(v18 + 4);
  }
  else
  {
    uint64_t v25 = *(void *)(v11 + 16);
    if (v25) {
      uint64_t v19 = *(void *)(v25 + 24) - *(void *)(v25 + 16) + 56;
    }
    else {
      uint64_t v19 = 56;
    }
  }
  NSUInteger v26 = (unint64_t)((double)(v19 + a3) * *(float *)(v9 + 24));
  v27 = SRLogDatastore;
  if (v16 <= v26)
  {
    if (!os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_43;
    }
    if (v17 && (uint64_t v31 = *(void *)(v17 + 16)) != 0)
    {
      uint64_t v32 = *(void *)(v31 + 4);
    }
    else
    {
      uint64_t v39 = *(void *)(v11 + 16);
      if (v39) {
        uint64_t v32 = *(void *)(v39 + 24) - *(void *)(v39 + 16) + 56;
      }
      else {
        uint64_t v32 = 56;
      }
    }
    int v41 = 134349312;
    z_size_t v42 = a3;
    __int16 v43 = 2050;
    z_size_t v44 = v16 - v32;
    v21 = "Trying to write %{public}zd but only have %{public}llul available. Dropping the data.";
    v22 = v27;
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    uint32_t v24 = 22;
    goto LABEL_42;
  }
  if (os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_INFO))
  {
    int v41 = 134217984;
    z_size_t v42 = v26;
    _os_log_impl(&dword_21FCA3000, v27, OS_LOG_TYPE_INFO, "Expanding the mapped region to %llu bytes while a new segment is fetched", (uint8_t *)&v41, 0xCu);
  }
  if ((-[SRFrameStore resizeMappedRegionTo:](v11, v26) & 1) == 0)
  {
LABEL_43:
    if (a4)
    {
      v40 = +[SRError errorWithCode:12291];
      result = 0;
      *a4 = v40;
      return result;
    }
    return 0;
  }
LABEL_21:
  uint64_t v28 = *(void *)(v11 + 24);
  if (v28 && (uint64_t v29 = *(void *)(v28 + 16)) != 0)
  {
    uint64_t v30 = *(void *)(v29 + 4);
  }
  else
  {
    uint64_t v33 = *(void *)(v11 + 16);
    if (v33) {
      uint64_t v30 = *(void *)(v33 + 24) - *(void *)(v33 + 16) + 56;
    }
    else {
      uint64_t v30 = 56;
    }
  }
  -[SRFrameStore writeFrameForBytes:length:timestamp:error:](v11, (const Bytef *)a2, a3, a4, a5);
  uint64_t v34 = *(void *)(v11 + 24);
  if (v34 && (uint64_t v35 = *(void *)(v34 + 16)) != 0)
  {
    unint64_t v36 = *(void *)(v35 + 4);
  }
  else
  {
    uint64_t v37 = *(void *)(v11 + 16);
    if (v37) {
      unint64_t v36 = *(void *)(v37 + 24) - *(void *)(v37 + 16) + 56;
    }
    else {
      unint64_t v36 = 56;
    }
  }
  if (v36 >= v30 + a3) {
    return 1;
  }
  v38 = SRLogDatastore;
  result = os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_INFO);
  if (result)
  {
    LOWORD(v41) = 0;
    _os_log_impl(&dword_21FCA3000, v38, OS_LOG_TYPE_INFO, "Failed to write frames", (uint8_t *)&v41, 2u);
    return 0;
  }
  return result;
}

- (void)fetchSamplesFrom:(double)a3 to:(double)a4 callback:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v31 = 0;
    uint64_t v29 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    Property = (SRFramesStoreOffsetEnumerator *)objc_getProperty(a1, (SEL)a2, 40, 1);
    uint64_t v9 = -[SRFrameStore enumerateFromOffset:](Property, 0);
    uint64_t v10 = [(SRFramesStoreOffsetEnumerator *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          double v15 = *(double *)v14;
          if (*(double *)v14 <= a3 || v15 > a4)
          {
            if (v15 > a4) {
              return;
            }
          }
          else
          {
            uint64_t v17 = (SRFramesStoreOffsetEnumerator *)a1[6];
            if (v17)
            {
              fetchMetadataFromFrameStore(v17, &v31, &v30, v15);
              if (v31) {
                uint64_t v18 = *(unsigned int *)(v31 + 16);
              }
              else {
                uint64_t v18 = 0;
              }
              uint64_t v19 = v31 + 20;
            }
            else
            {
              uint64_t v18 = 0;
              uint64_t v19 = 0;
            }
            uint64_t v20 = (SRFramesStoreOffsetEnumerator *)a1[7];
            if (v20)
            {
              fetchMetadataFromFrameStore(v20, &v29, &v28, v15);
              if (v29) {
                uint64_t v21 = *(unsigned int *)(v29 + 16);
              }
              else {
                uint64_t v21 = 0;
              }
              uint64_t v22 = v29 + 20;
            }
            else
            {
              uint64_t v21 = 0;
              uint64_t v22 = 0;
            }
            char v23 = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t, double))(a2 + 16))(a2, v14 + 20, *(unsigned int *)(v14 + 16), v19, v18, v22, v21, v15);
            if (v15 > a4 || (v23 & 1) == 0) {
              return;
            }
          }
        }
        uint64_t v11 = [(SRFramesStoreOffsetEnumerator *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v11);
    }
  }
}

- (void)removeSamplesFrom:(double)a3 to:(double)a4 callback:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    Property = (SRFramesStoreOffsetEnumerator *)objc_getProperty(a1, (SEL)a2, 40, 1);
    uint64_t v9 = -[SRFrameStore enumerateFromOffset:](Property, 0);
    uint64_t v10 = [(SRFramesStoreOffsetEnumerator *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(double **)(*((void *)&v17 + 1) + 8 * v13);
        double v15 = *v14;
        if (*v14 >= a3 && v15 <= a4)
        {
          -[SRFrameStore markFrameAsRemoved:](a1[5], (uint64_t)v14);
          (*(void (**)(uint64_t, double))(a2 + 16))(a2, v15);
        }
        if (v15 > a4) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [(SRFramesStoreOffsetEnumerator *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11) {
            goto LABEL_4;
          }
          return;
        }
      }
    }
  }
}

- (double)startTimeOfCurrentSegment
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0.0;
  }
  memset(v4, 0, sizeof(v4));
  Property = (SRFramesStoreOffsetEnumerator *)objc_getProperty(a1, a2, 40, 1);
  if (-[SRFramesStoreOffsetEnumerator countByEnumeratingWithState:objects:count:](-[SRFrameStore enumerateFromOffset:](Property, 0), "countByEnumeratingWithState:objects:count:", v4, v5, 16))
  {
    return ***((double ***)&v4[0] + 1);
  }
  else
  {
    return nan((const char *)&str_6);
  }
}

- (void)syncMappedFiles
{
  if (a1)
  {
    Property = (uint64_t *)objc_getProperty(a1, a2, 40, 1);
    -[SRFrameStore sync](Property);
    objc_super v5 = (uint64_t *)objc_getProperty(a1, v4, 48, 1);
    -[SRFrameStore sync](v5);
    v7 = (uint64_t *)objc_getProperty(a1, v6, 56, 1);
    -[SRFrameStore sync](v7);
  }
}

@end