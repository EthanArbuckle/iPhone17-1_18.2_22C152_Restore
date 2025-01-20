@interface VCPVideoMetaLivePhotoMetaAnalyzer
+ (id)defaultDesiredKeys;
+ (id)referenceSoftwareStackVersion;
- (BOOL)gyroHomographyVersionIsValid:(opaqueCMFormatDescription *)a3;
- (CGSize)readGyroHomographyDimension:(opaqueCMFormatDescription *)a3;
- (VCPVideoMetaLivePhotoMetaAnalyzer)init;
- (VCPVideoMetaLivePhotoMetaAnalyzer)initWithRequestAnalyses:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4;
- (__CFData)getFirstAtomWithFourCharCode:(unsigned int)a3 fromSetupData:(__CFData *)a4;
- (__CFData)getSetupDataFrom:(opaqueCMFormatDescription *)a3;
- (float)compareNumericVersion:(id)a3 withReferenceVersion:(id)a4;
- (float)compareSoftwareStackVersion:(id)a3 withReferenceVersion:(id)a4;
- (id)privateResults;
- (id)readSoftwareStackVersion:(opaqueCMFormatDescription *)a3;
- (int)convertLivePhotoBinary:(id)a3 toDictionary:(id)a4;
- (int)convertLivePhotoStruct:(FigLivePhotoMetadata *)a3 toDictionary:(id)a4;
- (int)finalizeAnalysis;
- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4;
@end

@implementation VCPVideoMetaLivePhotoMetaAnalyzer

+ (id)defaultDesiredKeys
{
  if (+[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::onceToken != -1) {
    dispatch_once(&+[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::onceToken, &__block_literal_global_66);
  }
  v2 = (void *)+[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::keys;
  return v2;
}

void __55__VCPVideoMetaLivePhotoMetaAnalyzer_defaultDesiredKeys__block_invoke()
{
  v2[15] = *MEMORY[0x1E4F143B8];
  v2[0] = @"privECMVct";
  v2[1] = @"privEMBVct";
  v2[2] = @"privDFArray";
  v2[3] = @"privET";
  v2[4] = @"privTZF";
  v2[5] = @"privImgG";
  v2[6] = @"privAFS";
  v2[7] = @"privAFSt";
  v2[8] = @"privFM";
  v2[9] = @"trajectoryHomography";
  v2[10] = @"presentingTimestampInNanos";
  v2[11] = @"originalPresentingTimestampInNanos";
  v2[12] = @"sequenceAdjusterRecipe";
  v2[13] = @"sequenceAdjusterDisplacement";
  v2[14] = @"interpolatedFrame";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:15];
  v1 = (void *)+[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::keys;
  +[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::keys = v0;
}

+ (id)referenceSoftwareStackVersion
{
  v8[2] = *MEMORY[0x1E4F143B8];
  {
    v8[0] = &unk_1F15ED818;
    v7[0] = @"LivePhotoMetadataSetupDataVersion";
    v7[1] = @"FrameworkVersions";
    v5 = @"CMCaptureCore";
    v6 = @"45.1";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    v8[1] = v4;
    +[VCPVideoMetaLivePhotoMetaAnalyzer referenceSoftwareStackVersion]::referenceSoftwareStackVersion = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  }
  v2 = (void *)+[VCPVideoMetaLivePhotoMetaAnalyzer referenceSoftwareStackVersion]::referenceSoftwareStackVersion;
  return v2;
}

- (VCPVideoMetaLivePhotoMetaAnalyzer)init
{
  return 0;
}

- (VCPVideoMetaLivePhotoMetaAnalyzer)initWithRequestAnalyses:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  v33.receiver = self;
  v33.super_class = (Class)VCPVideoMetaLivePhotoMetaAnalyzer;
  v6 = [(VCPVideoMetaLivePhotoMetaAnalyzer *)&v33 init];
  if (v6)
  {
    v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    deSerializedMetaBuffer = v6->_deSerializedMetaBuffer;
    v6->_deSerializedMetaBuffer = v7;

    v9 = objc_alloc_init(VCPVideoMetaFocusAnalyzer);
    metaFocusAnalyzer = v6->_metaFocusAnalyzer;
    v6->_metaFocusAnalyzer = v9;

    v11 = objc_alloc_init(VCPVideoMetaMotionAnalyzer);
    metaMotionAnalyzer = v6->_metaMotionAnalyzer;
    v6->_metaMotionAnalyzer = v11;

    v13 = objc_alloc_init(VCPVideoMetaLensSwitchAnalyzer);
    metaLensSwitchAnalzer = v6->_metaLensSwitchAnalzer;
    v6->_metaLensSwitchAnalzer = v13;

    v15 = v6->_metaFocusAnalyzer;
    if (v15)
    {
      v15 = v6->_metaMotionAnalyzer;
      if (v15)
      {
        v6->_requestAnalyses = a3;
        v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        metadataStabilizationArray = v6->_metadataStabilizationArray;
        v6->_metadataStabilizationArray = v16;

        v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        frameTimestampArray = v6->_frameTimestampArray;
        v6->_frameTimestampArray = v18;

        v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        originalFrameTimestampArray = v6->_originalFrameTimestampArray;
        v6->_originalFrameTimestampArray = v20;

        v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        metadataItemTimestampArray = v6->_metadataItemTimestampArray;
        v6->_metadataItemTimestampArray = v22;

        v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        adjusterArray = v6->_adjusterArray;
        v6->_adjusterArray = v24;

        v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        interpolatedFrameArray = v6->_interpolatedFrameArray;
        v6->_interpolatedFrameArray = v26;

        v6->_prevEstimatedCenterMv.dx = 0.0;
        v6->_prevEstimatedCenterMv.dy = 0.0;
        [(VCPVideoMetaLivePhotoMetaAnalyzer *)v6 readGyroHomographyDimension:a4];
        v6->_gyroHomographyDimension.width = v28;
        v6->_gyroHomographyDimension.height = v29;
        if ([(VCPVideoMetaLivePhotoMetaAnalyzer *)v6 gyroHomographyVersionIsValid:a4])
        {
          BOOL v30 = v6->_gyroHomographyDimension.width != *MEMORY[0x1E4F1DB30];
          if (v6->_gyroHomographyDimension.height != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
            BOOL v30 = 1;
          }
        }
        else
        {
          BOOL v30 = 0;
        }
        v6->_gyroHomographyIsValid = v30;
        v15 = v6;
      }
    }
    v31 = v15;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)gyroHomographyVersionIsValid:(opaqueCMFormatDescription *)a3
{
  v4 = [(VCPVideoMetaLivePhotoMetaAnalyzer *)self readSoftwareStackVersion:a3];
  if (v4)
  {
    v5 = [(id)objc_opt_class() referenceSoftwareStackVersion];
    [(VCPVideoMetaLivePhotoMetaAnalyzer *)self compareSoftwareStackVersion:v4 withReferenceVersion:v5];
    float v7 = v6;

    BOOL v8 = v7 != -1.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CGSize)readGyroHomographyDimension:(opaqueCMFormatDescription *)a3
{
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  float v6 = [(VCPVideoMetaLivePhotoMetaAnalyzer *)self getSetupDataFrom:a3];
  if (v6)
  {
    float v7 = [(VCPVideoMetaLivePhotoMetaAnalyzer *)self getFirstAtomWithFourCharCode:1684630899 fromSetupData:v6];
    if (v7)
    {
      CFDataRef v8 = v7;
      if (CFDataGetLength(v7) >= 8)
      {
        v13.location = 0;
        v13.length = 4;
        CFDataGetBytes(v8, v13, buffer);
        int v9 = bswap32(*(unsigned int *)buffer);
        v14.location = 4;
        v14.length = 4;
        CFDataGetBytes(v8, v14, buffer);
        double v4 = (double)v9;
        double v5 = (double)(int)bswap32(*(unsigned int *)buffer);
        CFRelease(v8);
      }
    }
  }
  double v10 = v4;
  double v11 = v5;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)readSoftwareStackVersion:(opaqueCMFormatDescription *)a3
{
  double v4 = [(VCPVideoMetaLivePhotoMetaAnalyzer *)self getSetupDataFrom:a3];
  if (v4
    && (CFDataRef v5 = [(VCPVideoMetaLivePhotoMetaAnalyzer *)self getFirstAtomWithFourCharCode:1667655542 fromSetupData:v4]) != 0)
  {
    CFDataRef v6 = v5;
    if (CFDataGetLength(v5)) {
      float v7 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, 0, 0, 0);
    }
    else {
      float v7 = (void *)MEMORY[0x1E4F1CC08];
    }
    CFRelease(v6);
  }
  else
  {
    float v7 = 0;
  }
  return v7;
}

- (__CFData)getSetupDataFrom:(opaqueCMFormatDescription *)a3
{
  uint64_t LocalIDForMetadataIdentifyingFactors = FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors();
  if (!LocalIDForMetadataIdentifyingFactors) {
    return 0;
  }
  return (__CFData *)MEMORY[0x1F40DDC60](a3, LocalIDForMetadataIdentifyingFactors);
}

- (__CFData)getFirstAtomWithFourCharCode:(unsigned int)a3 fromSetupData:(__CFData *)a4
{
  unint64_t Length = CFDataGetLength(a4);
  BytePtr = CFDataGetBytePtr(a4);
  if (Length < 8) {
    return 0;
  }
  CFDataRef v8 = BytePtr;
  CGSize result = 0;
  unint64_t v10 = 0;
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  do
  {
    v12 = &v8[v10];
    uint64_t v13 = bswap32(*(_DWORD *)&v8[v10]);
    v10 += v13;
    if (v13 < 8 || v10 > Length) {
      break;
    }
    if (bswap32(*((_DWORD *)v12 + 1)) == a3 && result == 0) {
      CGSize result = CFDataCreate(v11, v12 + 8, v13 - 8);
    }
  }
  while (v10 + 8 <= Length);
  return result;
}

- (float)compareSoftwareStackVersion:(id)a3 withReferenceVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFDataRef v8 = v7;
  float v9 = NAN;
  if (v6)
  {
    if (v7)
    {
      if ([v6 count] || (float v9 = 1.0, !objc_msgSend(v8, "count")))
      {
        if ([v6 count] && !objc_msgSend(v8, "count"))
        {
          float v9 = -1.0;
        }
        else if ([v6 count] || objc_msgSend(v8, "count"))
        {
          unint64_t v10 = [v6 objectForKeyedSubscript:@"LivePhotoMetadataSetupDataVersion"];
          uint64_t v11 = [v8 objectForKeyedSubscript:@"LivePhotoMetadataSetupDataVersion"];
          v12 = (void *)v11;
          float v9 = NAN;
          if (v10 && v11)
          {
            int v13 = [v10 intValue];
            if (v13 == [v12 intValue] && (int)objc_msgSend(v10, "intValue") <= 1)
            {
              uint64_t v14 = [v6 objectForKeyedSubscript:@"FrameworkVersions"];
              uint64_t v15 = [v8 objectForKeyedSubscript:@"FrameworkVersions"];
              v16 = (void *)v15;
              float v17 = 1.0;
              if (!(v14 | v15)) {
                float v17 = 0.0;
              }
              if (v14) {
                float v9 = -1.0;
              }
              else {
                float v9 = v17;
              }
              if (v14 && v15)
              {
                if ([(id)v14 count] && objc_msgSend(v16, "count"))
                {
                  uint64_t v38 = 0;
                  v39 = &v38;
                  uint64_t v40 = 0x2020000000;
                  char v41 = 0;
                  uint64_t v34 = 0;
                  v35 = &v34;
                  uint64_t v36 = 0x2020000000;
                  char v37 = 0;
                  uint64_t v30 = 0;
                  v31 = &v30;
                  uint64_t v32 = 0x2020000000;
                  char v33 = 0;
                  uint64_t v26 = 0;
                  v27 = &v26;
                  uint64_t v28 = 0x2020000000;
                  char v29 = 0;
                  v19[0] = MEMORY[0x1E4F143A8];
                  v19[1] = 3221225472;
                  v19[2] = __86__VCPVideoMetaLivePhotoMetaAnalyzer_compareSoftwareStackVersion_withReferenceVersion___block_invoke;
                  v19[3] = &unk_1E629BD18;
                  id v20 = (id)v14;
                  v21 = self;
                  v22 = &v26;
                  v23 = &v38;
                  v24 = &v34;
                  v25 = &v30;
                  [v16 enumerateKeysAndObjectsUsingBlock:v19];
                  if (*((unsigned char *)v27 + 24))
                  {
                    float v9 = NAN;
                  }
                  else if (*((unsigned char *)v39 + 24))
                  {
                    if (*((unsigned char *)v35 + 24)) {
                      float v9 = NAN;
                    }
                    else {
                      float v9 = 1.0;
                    }
                  }
                  else
                  {
                    float v9 = -1.0;
                    if (!*((unsigned char *)v35 + 24))
                    {
                      if (*((unsigned char *)v31 + 24)) {
                        float v9 = 0.0;
                      }
                      else {
                        float v9 = NAN;
                      }
                    }
                  }

                  _Block_object_dispose(&v26, 8);
                  _Block_object_dispose(&v30, 8);
                  _Block_object_dispose(&v34, 8);
                  _Block_object_dispose(&v38, 8);
                }
                else
                {
                  float v9 = NAN;
                }
              }
            }
            else
            {
              float v9 = NAN;
            }
          }
        }
        else
        {
          float v9 = 0.0;
        }
      }
    }
  }

  return v9;
}

void __86__VCPVideoMetaLivePhotoMetaAnalyzer_compareSoftwareStackVersion_withReferenceVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v10];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
    [*(id *)(a1 + 40) compareNumericVersion:v7 withReferenceVersion:v5];
    if (v8 == 1.0)
    {
      uint64_t v9 = *(void *)(a1 + 56);
    }
    else if (v8 == -1.0)
    {
      uint64_t v9 = *(void *)(a1 + 64);
    }
    else
    {
      if (v8 != 0.0)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v9 = *(void *)(a1 + 72);
    }
    *(unsigned char *)(*(void *)(v9 + 8) + 24) = 1;
    goto LABEL_9;
  }
LABEL_10:
}

- (float)compareNumericVersion:(id)a3 withReferenceVersion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  float v7 = 0.0;
  if (([v5 isEqualToString:v6] & 1) == 0)
  {
    id v27 = v6;
    id v28 = v5;
    float v8 = [v5 componentsSeparatedByString:@"."];
    uint64_t v9 = [v6 componentsSeparatedByString:@"."];
    unint64_t v10 = [v8 count];
    unint64_t v11 = [v9 count];
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = [v8 objectAtIndexedSubscript:v13];
        uint64_t v15 = [v9 objectAtIndexedSubscript:v13];
        if (([v14 isEqualToString:v15] & 1) == 0)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
          float v17 = [v16 numberFromString:v14];
          if (!v17
            || ([v16 numberFromString:v15],
                v18 = objc_claimAutoreleasedReturnValue(),
                v18,
                v17,
                !v18))
          {
            float v23 = NAN;
LABEL_17:

            goto LABEL_19;
          }
          v19 = [v16 numberFromString:v14];
          int v20 = [v19 intValue];

          v21 = [v16 numberFromString:v15];
          int v22 = [v21 intValue];

          if (v20 > v22)
          {
            float v23 = 1.0;
            goto LABEL_17;
          }

          if (v20 < v22) {
            break;
          }
        }

        if (v12 == ++v13)
        {
          float v23 = 0.0;
          goto LABEL_20;
        }
      }
      float v23 = -1.0;
LABEL_19:

LABEL_20:
      float v7 = v23;
      if (v23 != 0.0) {
        goto LABEL_25;
      }
    }
    else
    {
      float v23 = 0.0;
    }
    unint64_t v24 = [v8 count];
    float v7 = 1.0;
    if (v24 <= [v9 count])
    {
      unint64_t v25 = [v8 count];
      if (v25 >= [v9 count]) {
        float v7 = v23;
      }
      else {
        float v7 = -1.0;
      }
    }
LABEL_25:

    id v6 = v27;
    id v5 = v28;
  }

  return v7;
}

- (int)convertLivePhotoStruct:(FigLivePhotoMetadata *)a3 toDictionary:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if (a3->var0 - 4 >= 0xFFFFFFFD)
    {
      __int16 var6_high = HIWORD(a3->var1.var6);
      if (var6_high)
      {
        LODWORD(v7.dx) = *(&a3->var0 + 1);
        uint64_t v9 = [NSNumber numberWithFloat:v7.dx];
        [v6 setObject:v9 forKeyedSubscript:@"privET"];

        __int16 var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 2) != 0)
      {
        unint64_t v10 = [NSNumber numberWithLongLong:*(void *)&a3->var1.var0];
        [v6 setObject:v10 forKeyedSubscript:@"privAFS"];

        __int16 var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 4) != 0)
      {
        v44.x = *(float *)&a3->var1.var1 - self->_prevEstimatedCenterMv.dx;
        v44.y = *((float *)&a3->var1.var1 + 1) - self->_prevEstimatedCenterMv.dy;
        unint64_t v11 = NSStringFromPoint(v44);
        [v6 setObject:v11 forKeyedSubscript:@"privECMVct"];

        CGVector v7 = (CGVector)vcvtq_f64_f32((float32x2_t)a3->var1.var1);
        self->_prevEstimatedCenterMv = v7;
        __int16 var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 8) != 0)
      {
        v45.x = a3->var1.var2;
        v45.y = a3->var1.var3;
        unint64_t v12 = NSStringFromPoint(v45);
        [v6 setObject:v12 forKeyedSubscript:@"privEMBVct"];

        __int16 var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 0x10) != 0)
      {
        *(float *)&v7.dx = a3->var1.var4;
        uint64_t v13 = [NSNumber numberWithFloat:v7.dx];
        [v6 setObject:v13 forKeyedSubscript:@"privTZF"];

        __int16 var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 0x20) != 0)
      {
        *(float *)&v7.dx = a3->var1.var5;
        uint64_t v14 = [NSNumber numberWithFloat:v7.dx];
        [v6 setObject:v14 forKeyedSubscript:@"privImgG"];

        __int16 var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 0x40) != 0)
      {
        uint64_t v15 = [NSNumber numberWithChar:SLOBYTE(a3->var1.var6)];
        [v6 setObject:v15 forKeyedSubscript:@"privAFSt"];

        __int16 var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 0x80) != 0)
      {
        id v16 = [NSNumber numberWithChar:SBYTE1(a3->var1.var6)];
        [v6 setObject:v16 forKeyedSubscript:@"privFM"];
      }
      if (LODWORD(a3->var1.var7))
      {
        v43 = self;
        float v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
        if (LODWORD(a3->var1.var7))
        {
          unint64_t v18 = 0;
          p_var8 = &a3->var1.var8;
          do
          {
            int v20 = [MEMORY[0x1E4F1CA60] dictionary];
            __int16 v21 = *((_WORD *)p_var8 + 15);
            if ((v21 & 2) != 0)
            {
              v46.origin.x = *((float *)p_var8 + 2);
              v46.origin.y = *((float *)p_var8 + 3);
              v46.size.width = *((float *)p_var8 + 4);
              v46.size.height = *((float *)p_var8 + 5);
              int v22 = NSStringFromRect(v46);
              [v20 setObject:v22 forKeyedSubscript:@"faceBounds"];

              __int16 v21 = *((_WORD *)p_var8 + 15);
            }
            if ((v21 & 4) != 0)
            {
              float v23 = [NSNumber numberWithInt:*((unsigned int *)p_var8 + 6)];
              [v20 setObject:v23 forKeyedSubscript:@"faceId"];

              __int16 v21 = *((_WORD *)p_var8 + 15);
            }
            if (v21)
            {
              unint64_t v24 = [NSNumber numberWithLongLong:*(void *)p_var8];
              [v20 setObject:v24 forKeyedSubscript:@"relSampleTime"];
            }
            [v17 addObject:v20];

            ++v18;
            p_var8 += 32;
          }
          while (v18 < LODWORD(a3->var1.var7));
        }
        [v6 setObject:v17 forKeyedSubscript:@"privDFArray"];

        self = v43;
      }
      if (a3->var0 == 3)
      {
        uint64_t var7_low = LODWORD(a3->var1.var7);
        id v28 = (int32x4_t *)((char *)a3 + 32 * var7_low);
        uint64_t v26 = vaddvq_s32(v28[3]);
        uint64_t i64 = (uint64_t)v28[2 * v26 + 3].i64;
        __int16 v30 = *(_WORD *)(i64 + 16);
        uint64_t v29 = i64 + 16;
        LOBYTE(v28) = v30;
        if ((v30 & 1) != 0 && self->_gyroHomographyIsValid)
        {
          id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v33 = 0;
          p_var2 = &a3->var1.var12[var7_low + v26].var2;
          do
          {
            *(float *)&double v32 = p_var2[v33];
            v35 = [NSNumber numberWithFloat:v32];
            [v31 addObject:v35];

            ++v33;
          }
          while (v33 != 9);
          [v6 setObject:v31 forKeyedSubscript:@"trajectoryHomography"];

          LOWORD(v28) = *(_WORD *)v29;
        }
        if ((v28 & 2) != 0)
        {
          uint64_t v36 = [NSNumber numberWithUnsignedLongLong:*(void *)(v29 + 40)];
          [v6 setObject:v36 forKeyedSubscript:@"presentingTimestampInNanos"];

          LOWORD(v28) = *(_WORD *)v29;
        }
        if ((v28 & 4) != 0)
        {
          char v37 = [NSNumber numberWithUnsignedLongLong:*(void *)(v29 + 48)];
          [v6 setObject:v37 forKeyedSubscript:@"originalPresentingTimestampInNanos"];

          LOWORD(v28) = *(_WORD *)v29;
        }
        if ((v28 & 8) != 0)
        {
          v39 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v29 + 56)];
          [v6 setObject:v39 forKeyedSubscript:@"sequenceAdjusterRecipe"];
        }
        else
        {
          [v6 setObject:&unk_1F15ED830 forKeyedSubscript:@"sequenceAdjusterRecipe"];
        }
        if ((*(_WORD *)v29 & 0x10) != 0)
        {
          uint64_t v40 = [NSNumber numberWithChar:*(char *)(v29 + 57)];
          [v6 setObject:v40 forKeyedSubscript:@"sequenceAdjusterDisplacement"];
        }
        else
        {
          [v6 setObject:&unk_1F15ED830 forKeyedSubscript:@"sequenceAdjusterDisplacement"];
        }
        if ((*(_WORD *)v29 & 0x20) != 0)
        {
          char v41 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v29 + 58)];
          [v6 setObject:v41 forKeyedSubscript:@"interpolatedFrame"];
        }
      }
    }
    int v38 = 0;
  }
  else
  {
    int v38 = -50;
  }

  return v38;
}

- (int)convertLivePhotoBinary:(id)a3 toDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  [v8 bytes];
  [v8 length];
  int v9 = FigLivePhotoMetadataComputeDeserializationSize();
  if (!v9)
  {
    [(NSMutableData *)self->_deSerializedMetaBuffer length];
    -[NSMutableData resetBytesInRange:](self->_deSerializedMetaBuffer, "resetBytesInRange:", 0, [(NSMutableData *)self->_deSerializedMetaBuffer length]);
    unint64_t v10 = [(NSMutableData *)self->_deSerializedMetaBuffer mutableBytes];
    int v9 = FigLivePhotoMetadataDeserializeIntoBuffer();
    if (!v9) {
      int v9 = [(VCPVideoMetaLivePhotoMetaAnalyzer *)self convertLivePhotoStruct:v10 toDictionary:v7];
    }
  }

  return v9;
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v90 = v5;
  v99 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v5)
  {
    int v12 = -50;
LABEL_81:
    v87 = v99;
    goto LABEL_82;
  }
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  obuint64_t j = [v5 items];
  uint64_t v6 = [obj countByEnumeratingWithState:&v106 objects:v120 count:16];
  v98 = self;
  if (v6)
  {
    int v94 = 0;
    uint64_t v93 = *(void *)v107;
    uint64_t v92 = *MEMORY[0x1E4F52758];
    while (2)
    {
      uint64_t v95 = v6;
      for (uint64_t i = 0; i != v95; ++i)
      {
        if (*(void *)v107 != v93) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        id v8 = [v7 dataType];
        int v9 = [v8 isEqualToString:v92];

        if (v9)
        {
          unint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
          unint64_t v11 = [v7 dataValue];
          int v12 = [(VCPVideoMetaLivePhotoMetaAnalyzer *)v98 convertLivePhotoBinary:v11 toDictionary:v10];

          if (v12) {
            int v13 = v12;
          }
          else {
            int v13 = v94;
          }
          if (v12)
          {

            goto LABEL_81;
          }
          int v94 = v13;
          if ([v10 count])
          {
            if (v7) {
              [v7 time];
            }
            else {
              memset(&v105[1], 0, sizeof(CMTime));
            }
            CMTime time = v105[1];
            CFDictionaryRef v14 = CMTimeCopyAsDictionary(&time, 0);
            [v99 setObject:v14 forKeyedSubscript:@"start"];

            if (v7) {
              [v7 duration];
            }
            else {
              memset(v105, 0, 24);
            }
            CMTime time = v105[0];
            CFDictionaryRef v15 = CMTimeCopyAsDictionary(&time, 0);
            [v99 setObject:v15 forKeyedSubscript:@"duration"];

            if (v7) {
              [v7 time];
            }
            else {
              memset(&v104, 0, sizeof(v104));
            }
            double Seconds = CMTimeGetSeconds(&v104);
            long long v102 = 0u;
            long long v103 = 0u;
            long long v100 = 0u;
            long long v101 = 0u;
            float v17 = [(id)objc_opt_class() defaultDesiredKeys];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v100 objects:v119 count:16];
            if (v18)
            {
              float v19 = Seconds;
              uint64_t v20 = *(void *)v101;
              id v97 = v17;
              do
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v101 != v20) {
                    objc_enumerationMutation(v97);
                  }
                  int v22 = *(void **)(*((void *)&v100 + 1) + 8 * j);
                  float v23 = [v10 objectForKeyedSubscript:v22];
                  if (v23)
                  {
                    [v99 setObject:v23 forKeyedSubscript:v22];
                    if ([v22 isEqualToString:@"privTZF"])
                    {
                      unint64_t v24 = [v99 objectForKeyedSubscript:v22];
                      [v24 floatValue];
                      float v26 = v25;
                      [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer minZoom];
                      BOOL v28 = v26 < v27;

                      if (v28)
                      {
                        uint64_t v29 = [v99 objectForKeyedSubscript:v22];
                        [v29 floatValue];
                        -[VCPVideoMetaLensSwitchAnalyzer setMinZoom:](v98->_metaLensSwitchAnalzer, "setMinZoom:");
                      }
                      __int16 v30 = [v99 objectForKeyedSubscript:v22];
                      [v30 floatValue];
                      float v32 = v31;
                      [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer maxZoom];
                      BOOL v34 = v32 > v33;

                      if (v34)
                      {
                        v35 = [v99 objectForKeyedSubscript:v22];
                        [v35 floatValue];
                        -[VCPVideoMetaLensSwitchAnalyzer setMaxZoom:](v98->_metaLensSwitchAnalzer, "setMaxZoom:");
                      }
                    }
                    if ([v22 isEqualToString:@"privTZF"])
                    {
                      [(VCPVideoMetaAnalyzer *)v98 photoOffset];
                      if (v36 > v19)
                      {
                        [(VCPVideoMetaAnalyzer *)v98 photoOffset];
                        if ((float)(v37 + -0.5) < v19)
                        {
                          int v38 = [v99 objectForKeyedSubscript:v22];
                          [v38 floatValue];
                          float v40 = v39;
                          [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer settlingMinZoom];
                          BOOL v42 = v40 < v41;

                          if (v42)
                          {
                            v43 = [v99 objectForKeyedSubscript:v22];
                            [v43 floatValue];
                            -[VCPVideoMetaLensSwitchAnalyzer setSettlingMinZoom:](v98->_metaLensSwitchAnalzer, "setSettlingMinZoom:");
                          }
                          NSPoint v44 = [v99 objectForKeyedSubscript:v22];
                          [v44 floatValue];
                          float v46 = v45;
                          [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer settlingMaxZoom];
                          BOOL v48 = v46 > v47;

                          if (v48)
                          {
                            v49 = [v99 objectForKeyedSubscript:v22];
                            [v49 floatValue];
                            -[VCPVideoMetaLensSwitchAnalyzer setSettlingMaxZoom:](v98->_metaLensSwitchAnalzer, "setSettlingMaxZoom:");
                          }
                        }
                      }
                    }
                  }
                }
                float v17 = v97;
                uint64_t v18 = [v97 countByEnumeratingWithState:&v100 objects:v119 count:16];
              }
              while (v18);
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v106 objects:v120 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v94 = 0;
  }

  [v99 objectForKeyedSubscript:@"trajectoryHomography"];
  v51 = v50 = v98;
  if (v51)
  {
    v52 = [v99 objectForKeyedSubscript:@"privEMBVct"];
    if (v52)
    {
      BOOL v53 = (v98->_requestAnalyses & 0x4000010010000200) == 0;

      v50 = v98;
      if (v53) {
        goto LABEL_55;
      }
      metadataStabilizationArray = v98->_metadataStabilizationArray;
      v117 = @"attributes";
      v115[0] = @"MetaHomographyResults";
      v51 = [v99 objectForKeyedSubscript:@"trajectoryHomography"];
      v116[0] = v51;
      v115[1] = @"MetaPresentationTimeResults";
      v55 = [v99 objectForKeyedSubscript:@"start"];
      v116[1] = v55;
      v115[2] = @"MetaMotionBlurResults";
      v56 = [v99 objectForKeyedSubscript:@"privEMBVct"];
      v116[2] = v56;
      v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:3];
      v118 = v57;
      v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
      [(NSMutableArray *)metadataStabilizationArray addObject:v58];
    }
    v50 = v98;
  }
LABEL_55:
  v59 = [v99 objectForKeyedSubscript:@"presentingTimestampInNanos"];
  if (!v59) {
    goto LABEL_60;
  }
  v60 = [v99 objectForKeyedSubscript:@"originalPresentingTimestampInNanos"];
  if (v60)
  {
    BOOL v61 = (v50->_requestAnalyses & 0x200) == 0;

    v50 = v98;
    if (v61) {
      goto LABEL_60;
    }
    frameTimestampArray = v98->_frameTimestampArray;
    v63 = [v99 objectForKeyedSubscript:@"presentingTimestampInNanos"];
    [(NSMutableArray *)frameTimestampArray addObject:v63];

    originalFrameTimestampArray = v98->_originalFrameTimestampArray;
    v65 = [v99 objectForKeyedSubscript:@"originalPresentingTimestampInNanos"];
    [(NSMutableArray *)originalFrameTimestampArray addObject:v65];

    metadataItemTimestampArray = v98->_metadataItemTimestampArray;
    v59 = [v99 objectForKeyedSubscript:@"start"];
    [(NSMutableArray *)metadataItemTimestampArray addObject:v59];
  }

  v50 = v98;
LABEL_60:
  v67 = [v99 objectForKeyedSubscript:@"sequenceAdjusterRecipe"];
  if (!v67) {
    goto LABEL_69;
  }
  v68 = [v99 objectForKeyedSubscript:@"sequenceAdjusterDisplacement"];
  if (v68)
  {
    v69 = [v99 objectForKeyedSubscript:@"presentingTimestampInNanos"];
    if (v69)
    {
      v70 = [v99 objectForKeyedSubscript:@"originalPresentingTimestampInNanos"];
      if (v70)
      {
        BOOL v71 = (v50->_requestAnalyses & 0x4020000000) == 0;

        if (v71) {
          goto LABEL_69;
        }
        adjusterArray = v98->_adjusterArray;
        v113 = @"attributes";
        v111[0] = @"MetaAdjusterRecipeResults";
        v67 = [v99 objectForKeyedSubscript:@"sequenceAdjusterRecipe"];
        v112[0] = v67;
        v111[1] = @"MetaAdjusterDisplacementKey";
        v68 = [v99 objectForKeyedSubscript:@"sequenceAdjusterDisplacement"];
        v112[1] = v68;
        v111[2] = @"MetaItemPTSResultsKey";
        v69 = [v99 objectForKeyedSubscript:@"start"];
        v112[2] = v69;
        v111[3] = @"MetaOriginalPTSInNanosResults";
        v73 = [v99 objectForKeyedSubscript:@"originalPresentingTimestampInNanos"];
        v112[3] = v73;
        v111[4] = @"MetaPTSInNanosResults";
        v74 = [v99 objectForKeyedSubscript:@"originalPresentingTimestampInNanos"];
        v112[4] = v74;
        v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:5];
        v114 = v75;
        v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        [(NSMutableArray *)adjusterArray addObject:v76];
      }
    }
  }
LABEL_69:
  v77 = [v99 objectForKeyedSubscript:@"interpolatedFrame"];
  BOOL v78 = v77 == 0;

  if (!v78)
  {
    interpolatedFrameArray = v98->_interpolatedFrameArray;
    v80 = [v99 objectForKeyedSubscript:@"interpolatedFrame"];
    [(NSMutableArray *)interpolatedFrameArray addObject:v80];
  }
  [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer maxZoom];
  float v82 = v81;
  [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer minZoom];
  if ((float)(v82 - v83) > 0.5) {
    [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer setHadZoom:1];
  }
  [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer settlingMaxZoom];
  float v85 = v84;
  [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer settlingMinZoom];
  if ((float)(v85 - v86) > 0.5) {
    [(VCPVideoMetaLensSwitchAnalyzer *)v98->_metaLensSwitchAnalzer setSettlingHadZoom:1];
  }
  if ((v98->_requestAnalyses & 0xC0) == 0)
  {
    int v12 = v94;
    goto LABEL_81;
  }
  v87 = v99;
  int v12 = [(VCPVideoMetaFocusAnalyzer *)v98->_metaFocusAnalyzer processFrameMetadata:v99];
  if (!v12)
  {
    int v88 = [(VCPVideoMetaMotionAnalyzer *)v98->_metaMotionAnalyzer processFrameMetadata:v99];
    if (v88) {
      int v12 = v88;
    }
    else {
      int v12 = v94;
    }
  }
LABEL_82:

  return v12;
}

- (int)finalizeAnalysis
{
  if ((self->_requestAnalyses & 0xC0) == 0) {
    return 0;
  }
  int result = [(VCPVideoMetaFocusAnalyzer *)self->_metaFocusAnalyzer finalizeAnalysis];
  if (!result)
  {
    metaMotionAnalyzer = self->_metaMotionAnalyzer;
    return [(VCPVideoMetaMotionAnalyzer *)metaMotionAnalyzer finalizeAnalysis];
  }
  return result;
}

- (id)privateResults
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = [(VCPVideoMetaLensSwitchAnalyzer *)self->_metaLensSwitchAnalzer results];
  [v3 setObject:v4 forKeyedSubscript:@"MetaLensSwitchResults"];

  unint64_t requestAnalyses = self->_requestAnalyses;
  if ((requestAnalyses & 0xC0) != 0)
  {
    uint64_t v6 = [(VCPVideoMetaFocusAnalyzer *)self->_metaFocusAnalyzer results];
    [v3 setObject:v6 forKeyedSubscript:@"MetaFocusResults"];

    id v7 = [(VCPVideoMetaMotionAnalyzer *)self->_metaMotionAnalyzer results];
    [v3 setObject:v7 forKeyedSubscript:@"MetaMotionResults"];

    unint64_t requestAnalyses = self->_requestAnalyses;
  }
  if ((requestAnalyses & 0x4000010010000200) != 0
    && [(NSMutableArray *)self->_metadataStabilizationArray count])
  {
    CGFloat width = self->_gyroHomographyDimension.width;
    double height = self->_gyroHomographyDimension.height;
    if (width != *MEMORY[0x1E4F1DB30] || height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v16[0] = self->_metadataStabilizationArray;
      v15[0] = @"MetaStabilizationFrameResults";
      v15[1] = @"MetaHomographyDimensionResults";
      unint64_t v11 = NSStringFromSize(*(NSSize *)&width);
      v16[1] = v11;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      [v3 setObject:v12 forKeyedSubscript:@"MetaStabilizationResults"];
    }
  }
  unint64_t v13 = self->_requestAnalyses;
  if ((v13 & 0x200) != 0)
  {
    [v3 setObject:self->_frameTimestampArray forKeyedSubscript:@"MetaPTSInNanosResults"];
    [v3 setObject:self->_originalFrameTimestampArray forKeyedSubscript:@"MetaOriginalPTSInNanosResults"];
    [v3 setObject:self->_metadataItemTimestampArray forKeyedSubscript:@"MetaItemPTSResultsKey"];
    unint64_t v13 = self->_requestAnalyses;
  }
  if ((v13 & 0x4020000000) != 0) {
    [v3 setObject:self->_adjusterArray forKeyedSubscript:@"MetaAdjusterResults"];
  }
  if ([(NSMutableArray *)self->_interpolatedFrameArray count]) {
    [v3 setObject:self->_interpolatedFrameArray forKeyedSubscript:@"MetaInterpolatedFrameKey"];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaLensSwitchAnalzer, 0);
  objc_storeStrong((id *)&self->_interpolatedFrameArray, 0);
  objc_storeStrong((id *)&self->_adjusterArray, 0);
  objc_storeStrong((id *)&self->_metadataItemTimestampArray, 0);
  objc_storeStrong((id *)&self->_originalFrameTimestampArray, 0);
  objc_storeStrong((id *)&self->_frameTimestampArray, 0);
  objc_storeStrong((id *)&self->_metadataStabilizationArray, 0);
  objc_storeStrong((id *)&self->_metaMotionAnalyzer, 0);
  objc_storeStrong((id *)&self->_metaFocusAnalyzer, 0);
  objc_storeStrong((id *)&self->_deSerializedMetaBuffer, 0);
}

@end