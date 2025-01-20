@interface AVCameraCalibrationData
- (AVCameraCalibrationData)cameraCalibrationDataWithExifOrientation:(unsigned int)a3;
- (AVCameraCalibrationData)initWithAuxiliaryMetadata:(CGImageMetadata *)a3;
- (AVCameraCalibrationData)initWithCameraCalibrationDataDictionary:(id)a3 error:(id *)a4;
- (AVCameraCalibrationData)initWithDepthMetadataDictionary:(id)a3;
- (CGImageMetadata)copyAuxiliaryMetadata;
- (CGPoint)lensDistortionCenter;
- (CGSize)intrinsicMatrixReferenceDimensions;
- (NSData)inverseLensDistortionLookupTable;
- (NSData)lensDistortionLookupTable;
- (float)pixelSize;
- (id)_distortionLookupTableFromCoefficients:(id)a3 distortionCenter:(CGPoint)a4 pixelSize:(float)a5 referenceDimensions:(CGSize)a6 lookupTableLength:(int)a7;
- (id)_initEmpty;
- (id)cameraCalibrationDataDictionary;
- (id)debugDescription;
- (id)description;
- (matrix_float3x3)intrinsicMatrix;
- (matrix_float4x3)extrinsicMatrix;
- (void)dealloc;
@end

@implementation AVCameraCalibrationData

- (id)debugDescription
{
  v2 = NSString;
  internal = self->_internal;
  long long v5 = *(_OWORD *)internal->_anon_10;
  long long v4 = *(_OWORD *)&internal->_anon_10[16];
  long long v6 = *(_OWORD *)&internal->_anon_10[32];
  long long v8 = *(_OWORD *)internal->_anon_50;
  long long v7 = *(_OWORD *)&internal->_anon_50[16];
  long long v10 = *(_OWORD *)&internal->_anon_50[32];
  long long v9 = *(_OWORD *)&internal->_anon_50[48];
  float pixelSize = internal->pixelSize;
  double y = internal->lensDistortionCenter.y;
  if (internal->lensDistortionCenter.x == *MEMORY[0x1E4F1DAD8] && y == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    v15 = &stru_1EF4D21D0;
  }
  else
  {
    long long v22 = *(_OWORD *)&internal->_anon_10[16];
    long long v23 = *(_OWORD *)internal->_anon_10;
    long long v20 = *(_OWORD *)internal->_anon_50;
    long long v21 = *(_OWORD *)&internal->_anon_10[32];
    long long v18 = *(_OWORD *)&internal->_anon_50[32];
    long long v19 = *(_OWORD *)&internal->_anon_50[16];
    long long v17 = *(_OWORD *)&internal->_anon_50[48];
    v15 = (__CFString *)[NSString stringWithFormat:@", distortionCenter:{%.2f,%.2f}", *(void *)&internal->lensDistortionCenter.x, *(void *)&y];
    long long v9 = v17;
    long long v10 = v18;
    long long v7 = v19;
    long long v8 = v20;
    long long v6 = v21;
    long long v4 = v22;
    long long v5 = v23;
    internal = self->_internal;
  }
  return (id)objc_msgSend(v2, "stringWithFormat:", @"intrinsicMatrix: [%.2f %.2f %.2f | %.2f %.2f %.2f | %.2f %.2f %.2f], extrinsicMatrix: [%.2f %.2f %.2f %.2f | %.2f %.2f %.2f %.2f | %.2f %.2f %.2f %.2f] pixelSize:%.3f mm%@, ref:{%.0fx%.0f}", *(float *)&v5, *(float *)&v4, *(float *)&v6, *((float *)&v5 + 1), *((float *)&v4 + 1), *((float *)&v6 + 1), *((float *)&v5 + 2), *((float *)&v4 + 2), *((float *)&v6 + 2), *(float *)&v8, *(float *)&v7, *(float *)&v10, *(float *)&v9, *((float *)&v8 + 1), *((float *)&v7 + 1), *((float *)&v10 + 1),
               *((float *)&v9 + 1),
               *((float *)&v8 + 2),
               *((float *)&v7 + 2),
               *((float *)&v10 + 2),
               *((float *)&v9 + 2),
               pixelSize,
               v15,
               *(void *)&internal->intrinsicMatrixReferenceDimensions.width,
               *(void *)&internal->intrinsicMatrixReferenceDimensions.height);
}

- (id)description
{
  v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCameraCalibrationData debugDescription](self, "debugDescription")];
}

- (matrix_float3x3)intrinsicMatrix
{
  internal = self->_internal;
  simd_float3 v3 = *(simd_float3 *)internal->_anon_10;
  simd_float3 v4 = *(simd_float3 *)&internal->_anon_10[16];
  simd_float3 v5 = *(simd_float3 *)&internal->_anon_10[32];
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

- (CGSize)intrinsicMatrixReferenceDimensions
{
  internal = self->_internal;
  double width = internal->intrinsicMatrixReferenceDimensions.width;
  double height = internal->intrinsicMatrixReferenceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (matrix_float4x3)extrinsicMatrix
{
  internal = self->_internal;
  simd_float3 v3 = *(simd_float3 *)internal->_anon_50;
  simd_float3 v4 = *(simd_float3 *)&internal->_anon_50[16];
  simd_float3 v5 = *(simd_float3 *)&internal->_anon_50[32];
  simd_float3 v6 = *(simd_float3 *)&internal->_anon_50[48];
  result.columns[3] = v6;
  result.columns[2] = v5;
  result.columns[1] = v4;
  result.columns[0] = v3;
  return result;
}

- (float)pixelSize
{
  return self->_internal->pixelSize;
}

- (NSData)lensDistortionLookupTable
{
  internal = self->_internal;
  lensDistortionLookupTable = internal->lensDistortionLookupTable;
  if (!lensDistortionLookupTable)
  {
    lensDistortionCoefficients = internal->lensDistortionCoefficients;
    if (lensDistortionCoefficients)
    {
      *(float *)&double v2 = internal->pixelSize;
      self->_internal->lensDistortionLookupTable = (NSData *)-[AVCameraCalibrationData _distortionLookupTableFromCoefficients:distortionCenter:pixelSize:referenceDimensions:lookupTableLength:](self, "_distortionLookupTableFromCoefficients:distortionCenter:pixelSize:referenceDimensions:lookupTableLength:", lensDistortionCoefficients, 42, internal->lensDistortionCenter.x, internal->lensDistortionCenter.y, v2, internal->intrinsicMatrixReferenceDimensions.width, internal->intrinsicMatrixReferenceDimensions.height);
      lensDistortionLookupTable = self->_internal->lensDistortionLookupTable;
    }
    else
    {
      lensDistortionLookupTable = 0;
    }
  }
  long long v7 = lensDistortionLookupTable;

  return v7;
}

- (NSData)inverseLensDistortionLookupTable
{
  internal = self->_internal;
  inverseLensDistortionLookupTable = internal->inverseLensDistortionLookupTable;
  if (!inverseLensDistortionLookupTable)
  {
    inverseLensDistortionCoefficients = internal->inverseLensDistortionCoefficients;
    if (inverseLensDistortionCoefficients)
    {
      *(float *)&double v2 = internal->pixelSize;
      self->_internal->inverseLensDistortionLookupTable = (NSData *)-[AVCameraCalibrationData _distortionLookupTableFromCoefficients:distortionCenter:pixelSize:referenceDimensions:lookupTableLength:](self, "_distortionLookupTableFromCoefficients:distortionCenter:pixelSize:referenceDimensions:lookupTableLength:", inverseLensDistortionCoefficients, 42, internal->lensDistortionCenter.x, internal->lensDistortionCenter.y, v2, internal->intrinsicMatrixReferenceDimensions.width, internal->intrinsicMatrixReferenceDimensions.height);
      inverseLensDistortionLookupTable = self->_internal->inverseLensDistortionLookupTable;
    }
    else
    {
      inverseLensDistortionLookupTable = 0;
    }
  }
  long long v7 = inverseLensDistortionLookupTable;

  return v7;
}

- (CGPoint)lensDistortionCenter
{
  internal = self->_internal;
  double x = internal->lensDistortionCenter.x;
  double y = internal->lensDistortionCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (AVCameraCalibrationData)initWithCameraCalibrationDataDictionary:(id)a3 error:(id *)a4
{
  long long v7 = (void *)[a3 objectForKeyedSubscript:@"VersionMajor"];
  long long v8 = (void *)[a3 objectForKeyedSubscript:@"VersionMinor"];
  if ([v7 intValue] != 1
    || [v8 intValue]
    || (CGPoint result = [(AVCameraCalibrationData *)self initWithDepthMetadataDictionary:a3]) == 0)
  {
    long long v9 = (void *)AVLocalizedError();
    CGPoint result = 0;
    if (a4)
    {
      if (v9)
      {
        CGPoint result = 0;
        *a4 = v9;
      }
    }
  }
  return result;
}

- (id)cameraCalibrationDataDictionary
{
  id result = self->_internal->cameraCalibrationDataDictionary;
  if (!result)
  {
    simd_float3 v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v4 setObject:&unk_1EF4FA688 forKeyedSubscript:@"VersionMajor"];
    [v4 setObject:&unk_1EF4FA6A0 forKeyedSubscript:@"VersionMinor"];
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_internal->_anon_10 length:48];
    [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F51230]];
    [v4 setObject:CGSizeCreateDictionaryRepresentation(self->_internal->intrinsicMatrixReferenceDimensions) forKeyedSubscript:*MEMORY[0x1E4F51238]];
    uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_internal->_anon_50 length:64];
    [v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F51228]];
    *(float *)&double v7 = self->_internal->pixelSize;
    uint64_t v8 = [NSNumber numberWithFloat:v7];
    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F51258]];
    internal = self->_internal;
    lensDistortionCoefficients = internal->lensDistortionCoefficients;
    if (lensDistortionCoefficients)
    {
      id v11 = (id)[(NSData *)lensDistortionCoefficients copy];
      [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F51250]];
      internal = self->_internal;
    }
    inverseLensDistortionCoefficients = internal->inverseLensDistortionCoefficients;
    if (inverseLensDistortionCoefficients)
    {
      id v13 = (id)[(NSData *)inverseLensDistortionCoefficients copy];
      [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F51240]];
      internal = self->_internal;
    }
    double x = internal->lensDistortionCenter.x;
    double y = internal->lensDistortionCenter.y;
    if (x != *MEMORY[0x1E4F1DAD8] || y != *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
      [v4 setObject:CGPointCreateDictionaryRepresentation(*(CGPoint *)&x) forKeyedSubscript:*MEMORY[0x1E4F51248]];
    }
    self->_internal->cameraCalibrationDataDictionardouble y = (NSDictionary *)[v4 copy];
    return self->_internal->cameraCalibrationDataDictionary;
  }
  return result;
}

- (AVCameraCalibrationData)initWithAuxiliaryMetadata:(CGImageMetadata *)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)AVCameraCalibrationData;
  simd_float3 v4 = [(AVCameraCalibrationData *)&v67 init];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(AVCameraCalibrationDataInternal);
    v4->_internal = v5;
    if (!v5) {
      goto LABEL_35;
    }
    uint64_t v6 = *MEMORY[0x1E4F525C0];
    double v7 = AVAuxiliaryMetadataArrayTagWithPrefixedKey(a3, *MEMORY[0x1E4F525C0], *MEMORY[0x1E4F525E0]);
    if ([(CGImageMetadataTag *)v7 count] != 9) {
      goto LABEL_35;
    }
    if (v7 && [(CGImageMetadataTag *)v7 count] == 9)
    {
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0), "floatValue");
      *(_DWORD *)v4->_internal->_anon_10 = v8;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 1), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[4] = v9;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 2), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[8] = v10;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 3), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[16] = v11;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 4), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[20] = v12;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 5), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[24] = v13;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 6), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[32] = v14;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 7), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[36] = v15;
      objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 8), "floatValue");
      *(_DWORD *)&v4->_internal->_anon_10[40] = v16;
    }
    id v17 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E4F525F0]);
    if (!v17) {
      goto LABEL_35;
    }
    [v17 floatValue];
    v4->_internal->intrinsicMatrixReferenceDimensions.double width = v18;
    id v19 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E4F525E8]);
    if (!v19) {
      goto LABEL_35;
    }
    [v19 floatValue];
    v4->_internal->intrinsicMatrixReferenceDimensions.double height = v20;
    long long v21 = AVAuxiliaryMetadataArrayTagWithPrefixedKey(a3, v6, *MEMORY[0x1E4F525D0]);
    if ([(CGImageMetadataTag *)v21 count] != 12) {
      goto LABEL_35;
    }
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 0), "floatValue");
    *(_DWORD *)v4->_internal->_anon_50 = v22;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 1), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[4] = v23;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 2), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[8] = v24;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 3), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[16] = v25;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 4), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[20] = v26;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 5), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[24] = v27;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 6), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[32] = v28;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 7), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[36] = v29;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 8), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[40] = v30;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 9), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[48] = v31;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 10), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[52] = v32;
    objc_msgSend((id)-[CGImageMetadataTag objectAtIndexedSubscript:](v21, "objectAtIndexedSubscript:", 11), "floatValue");
    *(_DWORD *)&v4->_internal->_anon_50[56] = v33;
    id v34 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E4F52618]);
    if (v34)
    {
      [v34 floatValue];
      v4->_internal->float pixelSize = v35;
      v36 = AVAuxiliaryMetadataArrayTagWithPrefixedKey(a3, v6, *MEMORY[0x1E4F52610]);
      if ([(CGImageMetadataTag *)v36 count] == 8)
      {
        v37 = (NSData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
        v38 = (_DWORD *)[(NSData *)v37 mutableBytes];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v39 = [(CGImageMetadataTag *)v36 countByEnumeratingWithState:&v63 objects:v69 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v64;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v64 != v41) {
                objc_enumerationMutation(v36);
              }
              [*(id *)(*((void *)&v63 + 1) + 8 * i) floatValue];
              *v38++ = v43;
            }
            uint64_t v40 = [(CGImageMetadataTag *)v36 countByEnumeratingWithState:&v63 objects:v69 count:16];
          }
          while (v40);
        }
        v4->_internal->lensDistortionCoefficients = v37;
      }
      v44 = AVAuxiliaryMetadataArrayTagWithPrefixedKey(a3, v6, *MEMORY[0x1E4F525F8]);
      if ([(CGImageMetadataTag *)v44 count] == 8)
      {
        v45 = (NSData *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
        v46 = (_DWORD *)[(NSData *)v45 mutableBytes];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v47 = [(CGImageMetadataTag *)v44 countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v60;
          do
          {
            for (uint64_t j = 0; j != v48; ++j)
            {
              if (*(void *)v60 != v49) {
                objc_enumerationMutation(v44);
              }
              [*(id *)(*((void *)&v59 + 1) + 8 * j) floatValue];
              *v46++ = v51;
            }
            uint64_t v48 = [(CGImageMetadataTag *)v44 countByEnumeratingWithState:&v59 objects:v68 count:16];
          }
          while (v48);
        }
        v4->_internal->inverseLensDistortionCoefficients = v45;
      }
      id v52 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E4F52600]);
      double v53 = 0.0;
      double v54 = 0.0;
      if (v52)
      {
        objc_msgSend(v52, "floatValue", 0.0);
        double v54 = v55;
      }
      v4->_internal->lensDistortionCenter.double x = v54;
      id v56 = AVAuxiliaryMetadataStringTagWithPrefixedKey(a3, v6, *MEMORY[0x1E4F52608]);
      if (v56)
      {
        [v56 floatValue];
        double v53 = v57;
      }
      v4->_internal->lensDistortionCenter.double y = v53;
    }
    else
    {
LABEL_35:

      return 0;
    }
  }
  return v4;
}

- (AVCameraCalibrationData)initWithDepthMetadataDictionary:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)AVCameraCalibrationData;
  simd_float3 v4 = [(AVCameraCalibrationData *)&v17 init];
  if (!v4) {
    return v4;
  }
  uint64_t v5 = objc_alloc_init(AVCameraCalibrationDataInternal);
  v4->_internal = v5;
  if (!v5) {
    goto LABEL_17;
  }
  uint64_t v6 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52670]];
  if ([v6 length] != 48) {
    goto LABEL_17;
  }
  [v6 getBytes:v4->_internal->_anon_10 length:48];
  CFDictionaryRef v7 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52678]];
  if (!v7) {
    goto LABEL_17;
  }
  if (!CGSizeMakeWithDictionaryRepresentation(v7, &v4->_internal->intrinsicMatrixReferenceDimensions)) {
    goto LABEL_17;
  }
  int v8 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52660]];
  if ([v8 length] != 64) {
    goto LABEL_17;
  }
  [v8 getBytes:v4->_internal->_anon_50 length:64];
  int v9 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52698]];
  if (!v9) {
    goto LABEL_17;
  }
  [v9 floatValue];
  v4->_internal->float pixelSize = v10;
  int v11 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52690]];
  if (v11)
  {
    int v12 = v11;
    if ([v11 length] != 32) {
      goto LABEL_17;
    }
    v4->_internal->lensDistortionCoefficients = (NSData *)[v12 copy];
  }
  int v13 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52680]];
  if (!v13) {
    goto LABEL_14;
  }
  int v14 = v13;
  if ([v13 length] != 32)
  {
LABEL_17:

    return 0;
  }
  v4->_internal->inverseLensDistortionCoefficients = (NSData *)[v14 copy];
LABEL_14:
  CFDictionaryRef v15 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F52688]];
  if (v15) {
    CGPointMakeWithDictionaryRepresentation(v15, &v4->_internal->lensDistortionCenter);
  }
  return v4;
}

- (AVCameraCalibrationData)cameraCalibrationDataWithExifOrientation:(unsigned int)a3
{
  simd_float3 v4 = [[AVCameraCalibrationData alloc] _initEmpty];
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  internal = self->_internal;
  uint64_t v7 = v4[1];
  long long v8 = *(_OWORD *)internal->_anon_10;
  long long v9 = *(_OWORD *)&internal->_anon_10[32];
  *(_OWORD *)(v7 + 32) = *(_OWORD *)&internal->_anon_10[16];
  *(_OWORD *)(v7 + 48) = v9;
  *(_OWORD *)(v7 + 16) = v8;
  *(CGSize *)(v7 + 64) = internal->intrinsicMatrixReferenceDimensions;
  long long v10 = *(_OWORD *)internal->_anon_50;
  long long v11 = *(_OWORD *)&internal->_anon_50[16];
  long long v12 = *(_OWORD *)&internal->_anon_50[48];
  *(_OWORD *)(v7 + 112) = *(_OWORD *)&internal->_anon_50[32];
  *(_OWORD *)(v7 + 128) = v12;
  *(_OWORD *)(v7 + 80) = v10;
  *(_OWORD *)(v7 + 96) = v11;
  *(float *)(v7 + 144) = internal->pixelSize;
  *(void *)(v7 + 152) = internal->lensDistortionCoefficients;
  *(void *)(v7 + 160) = internal->inverseLensDistortionCoefficients;
  *(CGPoint *)(v7 + 168) = internal->lensDistortionCenter;
  *(void *)(v7 + 184) = internal->lensDistortionLookupTable;
  *(void *)(v7 + 192) = internal->inverseLensDistortionLookupTable;
  if (FigDepthRotateCalibrationData())
  {

    return 0;
  }
  else
  {
LABEL_4:
    return (AVCameraCalibrationData *)v5;
  }
}

- (CGImageMetadata)copyAuxiliaryMetadata
{
  v43[9] = *MEMORY[0x1E4F143B8];
  Mutable = CGImageMetadataCreateMutable();
  simd_float3 v4 = Mutable;
  if (!Mutable)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v4;
  }
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F525B8];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F525C0];
  if (!CGImageMetadataRegisterNamespaceForPrefix(Mutable, (CFStringRef)*MEMORY[0x1E4F525B8], (CFStringRef)*MEMORY[0x1E4F525C0], 0))
  {
    fig_log_get_emitter();
LABEL_27:
    FigDebugAssert3();
    CFRelease(v4);
    return 0;
  }
  LODWORD(v7) = *(_DWORD *)self->_internal->_anon_10;
  v43[0] = [NSNumber numberWithFloat:v7];
  LODWORD(v8) = *(_DWORD *)&self->_internal->_anon_10[4];
  v43[1] = [NSNumber numberWithFloat:v8];
  LODWORD(v9) = *(_DWORD *)&self->_internal->_anon_10[8];
  v43[2] = [NSNumber numberWithFloat:v9];
  LODWORD(v10) = *(_DWORD *)&self->_internal->_anon_10[16];
  v43[3] = [NSNumber numberWithFloat:v10];
  LODWORD(v11) = *(_DWORD *)&self->_internal->_anon_10[20];
  v43[4] = [NSNumber numberWithFloat:v11];
  LODWORD(v12) = *(_DWORD *)&self->_internal->_anon_10[24];
  v43[5] = [NSNumber numberWithFloat:v12];
  LODWORD(v13) = *(_DWORD *)&self->_internal->_anon_10[32];
  v43[6] = [NSNumber numberWithFloat:v13];
  LODWORD(v14) = *(_DWORD *)&self->_internal->_anon_10[36];
  v43[7] = [NSNumber numberWithFloat:v14];
  LODWORD(v15) = *(_DWORD *)&self->_internal->_anon_10[40];
  v43[8] = [NSNumber numberWithFloat:v15];
  int v16 = (const void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:9];
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F525E0], v16)
    || !AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F525F0], (const void *)[NSNumber numberWithDouble:self->_internal->intrinsicMatrixReferenceDimensions.width])|| !AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F525E8], (const void *)objc_msgSend(NSNumber, "numberWithDouble:", self->_internal->intrinsicMatrixReferenceDimensions.height)))
  {
    fig_log_get_emitter();
    goto LABEL_27;
  }
  LODWORD(v17) = *(_DWORD *)self->_internal->_anon_50;
  v42[0] = [NSNumber numberWithFloat:v17];
  LODWORD(v18) = *(_DWORD *)&self->_internal->_anon_50[4];
  v42[1] = [NSNumber numberWithFloat:v18];
  LODWORD(v19) = *(_DWORD *)&self->_internal->_anon_50[8];
  v42[2] = [NSNumber numberWithFloat:v19];
  LODWORD(v20) = *(_DWORD *)&self->_internal->_anon_50[16];
  v42[3] = [NSNumber numberWithFloat:v20];
  LODWORD(v21) = *(_DWORD *)&self->_internal->_anon_50[20];
  v42[4] = [NSNumber numberWithFloat:v21];
  LODWORD(v22) = *(_DWORD *)&self->_internal->_anon_50[24];
  v42[5] = [NSNumber numberWithFloat:v22];
  LODWORD(v23) = *(_DWORD *)&self->_internal->_anon_50[32];
  v42[6] = [NSNumber numberWithFloat:v23];
  LODWORD(v24) = *(_DWORD *)&self->_internal->_anon_50[36];
  v42[7] = [NSNumber numberWithFloat:v24];
  LODWORD(v25) = *(_DWORD *)&self->_internal->_anon_50[40];
  v42[8] = [NSNumber numberWithFloat:v25];
  LODWORD(v26) = *(_DWORD *)&self->_internal->_anon_50[48];
  v42[9] = [NSNumber numberWithFloat:v26];
  LODWORD(v27) = *(_DWORD *)&self->_internal->_anon_50[52];
  v42[10] = [NSNumber numberWithFloat:v27];
  LODWORD(v28) = *(_DWORD *)&self->_internal->_anon_50[56];
  v42[11] = [NSNumber numberWithFloat:v28];
  int v29 = (const void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:12];
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F525D0], v29)) {
    goto LABEL_26;
  }
  *(float *)&double v30 = self->_internal->pixelSize;
  if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52618], (const void *)[NSNumber numberWithFloat:v30]))goto LABEL_26; {
  if ([(NSData *)self->_internal->lensDistortionCoefficients length] == 32)
  }
  {
    int v31 = (void *)[MEMORY[0x1E4F1CA48] array];
    int v32 = [(NSData *)self->_internal->lensDistortionCoefficients bytes];
    for (uint64_t i = 0; i != 32; i += 4)
    {
      LODWORD(v33) = *(_DWORD *)&v32[i];
      objc_msgSend(v31, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v33));
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52610], v31)) {
      goto LABEL_26;
    }
  }
  if ([(NSData *)self->_internal->inverseLensDistortionCoefficients length] == 32)
  {
    float v35 = (void *)[MEMORY[0x1E4F1CA48] array];
    v36 = [(NSData *)self->_internal->inverseLensDistortionCoefficients bytes];
    for (uint64_t j = 0; j != 32; j += 4)
    {
      LODWORD(v37) = *(_DWORD *)&v36[j];
      objc_msgSend(v35, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v37));
    }
    if (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F525F8], v35)) {
      goto LABEL_26;
    }
  }
  internal = self->_internal;
  BOOL v40 = internal->lensDistortionCenter.x == *MEMORY[0x1E4F1DAD8]
     && internal->lensDistortionCenter.y == *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!v40
    && (!AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52600], (const void *)objc_msgSend(NSNumber, "numberWithDouble:"))|| !AVAuxiliaryMetadataAddValue(v4, v5, v6, (CFStringRef)*MEMORY[0x1E4F52608], (const void *)objc_msgSend(NSNumber, "numberWithDouble:", self->_internal->lensDistortionCenter.y))))
  {
LABEL_26:
    fig_log_get_emitter();
    goto LABEL_27;
  }
  return v4;
}

- (id)_initEmpty
{
  v5.receiver = self;
  v5.super_class = (Class)AVCameraCalibrationData;
  double v2 = [(AVCameraCalibrationData *)&v5 init];
  if (v2)
  {
    simd_float3 v3 = objc_alloc_init(AVCameraCalibrationDataInternal);
    v2->_internal = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCameraCalibrationData;
  [(AVCameraCalibrationData *)&v4 dealloc];
}

- (id)_distortionLookupTableFromCoefficients:(id)a3 distortionCenter:(CGPoint)a4 pixelSize:(float)a5 referenceDimensions:(CGSize)a6 lookupTableLength:(int)a7
{
  if (!a3 || (height = a6.height, width = a6.width, double y = a4.y, x = a4.x, [a3 length] != 32))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    double v15 = 0;
LABEL_19:
    int v16 = 0;
    goto LABEL_16;
  }
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * a7];
  double v15 = v14;
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  int v16 = (float *)[v14 mutableBytes];
  if (v16)
  {
    double v17 = (float *)[a3 bytes];
    double v18 = width - x;
    if (x > width - x) {
      double v18 = x;
    }
    double v19 = height - y;
    if (y > height - y) {
      double v19 = y;
    }
    if (a7 >= 1)
    {
      uint64_t v20 = 0;
      double v21 = sqrt(v19 * v19 + v18 * v18);
      double v18 = (double)(a7 - 1);
      double v19 = v21 * a5;
      do
      {
        double v22 = v19 * (double)(int)v20 / v18 * (v19 * (double)(int)v20 / v18);
        double v23 = v22 * v22;
        double v24 = v22 * (v22 * v22);
        double v25 = (v22 * v17[1]
             + *v17
             + v17[2] * v23
             + v17[3] * v24
             + v17[4] * (v23 * v23)
             + v17[5] * (v22 * v22 * v24)
             + v17[6] * (v24 * v24)
             + v17[7] * (v23 * v23 * v24))
            / 100.0
            + 1.0;
        if (v25 <= 0.0) {
          double v26 = 0.0;
        }
        else {
          double v26 = 1.0 / v25 + -1.0;
        }
        float v27 = v26;
        v16[v20++] = v27;
      }
      while (a7 != v20);
    }
    int v16 = (float *)objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithData:", v15, v18, v19);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_16:

  return v16;
}

@end