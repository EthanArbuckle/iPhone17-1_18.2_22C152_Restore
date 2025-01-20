@interface NSCoder(VNAdditions)
+ (id)_vn_createEncodableDataWithMagicNumber:()VNAdditions forN:floatValues:error:;
- (__CVBuffer)vn_decodePixelBufferForKey:()VNAdditions;
- (__n128)_vn_decode3x3MatrixFromDataRepresentation:()VNAdditions forKey:;
- (__n128)_vn_decode3x3MatrixFromStringRepresentation:()VNAdditions;
- (__n128)_vn_decode4x4MatrixFromDataRepresentation:()VNAdditions forKey:;
- (__n128)_vn_decode4x4MatrixFromStringRepresentation:()VNAdditions;
- (__n128)_vn_decodeSimdFloat3FromDataRepresentation:()VNAdditions forKey:;
- (__n128)_vn_decodeSimdFloat3FromStringRepresentation:()VNAdditions;
- (__n128)vn_decode3x3MatrixForKey:()VNAdditions;
- (__n128)vn_decode4x4MatrixForKey:()VNAdditions;
- (__n128)vn_decodeSimdFloat3ForKey:()VNAdditions;
- (double)vn_decodePointForKey:()VNAdditions;
- (double)vn_decodeRectForKey:()VNAdditions;
- (double)vn_decodeSizeForKey:()VNAdditions;
- (float)vn_decodeValidatedConfidenceForKey:()VNAdditions;
- (float)vn_decodeValidatedScoreForKey:()VNAdditions;
- (uint64_t)_vn_decodeFloatsFromEncodedData:()VNAdditions withExpectedMagicNumber:valueCount:forKey:usingBlock:;
- (void)vn_decodeCGAffineTransformForKey:()VNAdditions;
- (void)vn_decodeTimeRangeForKey:()VNAdditions;
- (void)vn_encode3x3Matrix:()VNAdditions forKey:;
- (void)vn_encode4x4Matrix:()VNAdditions forKey:;
- (void)vn_encodeCGAffineTransform:()VNAdditions forKey:;
- (void)vn_encodePixelBuffer:()VNAdditions forKey:;
- (void)vn_encodePoint:()VNAdditions forKey:;
- (void)vn_encodeRect:()VNAdditions forKey:;
- (void)vn_encodeSimdFloat3:()VNAdditions forKey:;
- (void)vn_encodeSize:()VNAdditions forKey:;
- (void)vn_encodeTimeRange:()VNAdditions forKey:;
- (void)vn_encodeValidatedConfidence:()VNAdditions forKey:;
- (void)vn_encodeValidatedScore:()VNAdditions forKey:;
@end

@implementation NSCoder(VNAdditions)

- (float)vn_decodeValidatedScoreForKey:()VNAdditions
{
  id v4 = a3;
  [a1 decodeFloatForKey:v4];
  float v6 = v5;
  id v17 = 0;
  BOOL v7 = +[VNValidationUtilities validateScoreRange:named:error:](VNValidationUtilities, "validateScoreRange:named:error:", v4, &v17);
  id v8 = v17;
  if (!v7)
  {
    [v4 UTF8String];
    id v9 = [v8 localizedDescription];
    [v9 UTF8String];
    VNValidatedLog(4, @"unable to accept decoded score of %f for %s - %s", v10, v11, v12, v13, v14, v15, COERCE__INT64(v6));

    float v6 = 0.0;
    [a1 failWithError:v8];
  }

  return v6;
}

- (void)vn_encodeValidatedScore:()VNAdditions forKey:
{
  id v6 = a4;
  id v18 = 0;
  *(float *)&double v7 = a2;
  BOOL v8 = +[VNValidationUtilities validateScoreRange:v6 named:&v18 error:v7];
  id v9 = v18;
  if (v8)
  {
    *(float *)&double v10 = a2;
    [a1 encodeFloat:v6 forKey:v10];
  }
  else
  {
    [v6 UTF8String];
    id v11 = [v9 localizedDescription];
    [v11 UTF8String];
    VNValidatedLog(4, @"unable to encode score of %f for %s - %s", v12, v13, v14, v15, v16, v17, COERCE__INT64(a2));

    [a1 failWithError:v9];
  }
}

- (float)vn_decodeValidatedConfidenceForKey:()VNAdditions
{
  id v4 = a3;
  [a1 decodeFloatForKey:v4];
  float v6 = v5;
  id v17 = 0;
  BOOL v7 = +[VNValidationUtilities validateVNConfidenceRange:error:](VNValidationUtilities, "validateVNConfidenceRange:error:", &v17);
  id v8 = v17;
  if (!v7)
  {
    [v4 UTF8String];
    id v9 = [v8 localizedDescription];
    [v9 UTF8String];
    VNValidatedLog(4, @"unable to accept decoded confidence of %f for %s - %s", v10, v11, v12, v13, v14, v15, COERCE__INT64(v6));

    float v6 = 0.0;
    [a1 failWithError:v8];
  }

  return v6;
}

- (void)vn_encodeValidatedConfidence:()VNAdditions forKey:
{
  id v6 = a4;
  id v18 = 0;
  *(float *)&double v7 = a2;
  BOOL v8 = +[VNValidationUtilities validateVNConfidenceRange:&v18 error:v7];
  id v9 = v18;
  if (v8)
  {
    *(float *)&double v10 = a2;
    [a1 encodeFloat:v6 forKey:v10];
  }
  else
  {
    [v6 UTF8String];
    id v11 = [v9 localizedDescription];
    [v11 UTF8String];
    VNValidatedLog(4, @"unable to encode confidence of %f for %s - %s", v12, v13, v14, v15, v16, v17, COERCE__INT64(a2));

    [a1 failWithError:v9];
  }
}

- (__CVBuffer)vn_decodePixelBufferForKey:()VNAdditions
{
  id v4 = a3;
  float v5 = +[VNCVPixelBufferConversionHelpers dictionaryRepresentationClassesSet];
  id v6 = [a1 decodeObjectOfClasses:v5 forKey:v4];
  if (v6) {
    double v7 = +[VNCVPixelBufferConversionHelpers createCVPixelBufferRefFromDictionaryRepresentation:v6];
  }
  else {
    double v7 = 0;
  }

  return v7;
}

- (void)vn_encodePixelBuffer:()VNAdditions forKey:
{
  id v7 = a4;
  id v6 = +[VNCVPixelBufferConversionHelpers createDictionaryRepresentationOfCVPixelBuffer:a3];
  [a1 encodeObject:v6 forKey:v7];
}

- (double)vn_decodeRectForKey:()VNAdditions
{
  id v4 = a3;
  float v5 = (void *)[[NSString alloc] initWithFormat:@"%@.or", v4];
  objc_msgSend(a1, "vn_decodePointForKey:", v5);
  double v7 = v6;

  BOOL v8 = (void *)[[NSString alloc] initWithFormat:@"%@.sz", v4];
  objc_msgSend(a1, "vn_decodeSizeForKey:", v8);

  return v7;
}

- (void)vn_encodeRect:()VNAdditions forKey:
{
  id v14 = a7;
  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"%@.or", v14];
  objc_msgSend(a1, "vn_encodePoint:forKey:", v12, a2, a3);

  uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"%@.sz", v14];
  objc_msgSend(a1, "vn_encodeSize:forKey:", v13, a4, a5);
}

- (double)vn_decodeSizeForKey:()VNAdditions
{
  id v4 = a3;
  float v5 = (void *)[[NSString alloc] initWithFormat:@"%@.w", v4];
  [a1 decodeDoubleForKey:v5];
  double v7 = v6;

  BOOL v8 = (void *)[[NSString alloc] initWithFormat:@"%@.h", v4];
  [a1 decodeDoubleForKey:v8];

  return v7;
}

- (void)vn_encodeSize:()VNAdditions forKey:
{
  id v10 = a5;
  BOOL v8 = (void *)[[NSString alloc] initWithFormat:@"%@.w", v10];
  [a1 encodeDouble:v8 forKey:a2];

  id v9 = (void *)[[NSString alloc] initWithFormat:@"%@.h", v10];
  [a1 encodeDouble:v9 forKey:a3];
}

- (double)vn_decodePointForKey:()VNAdditions
{
  id v4 = a3;
  float v5 = (void *)[[NSString alloc] initWithFormat:@"%@.x", v4];
  [a1 decodeDoubleForKey:v5];
  double v7 = v6;

  BOOL v8 = (void *)[[NSString alloc] initWithFormat:@"%@.y", v4];
  [a1 decodeDoubleForKey:v8];

  return v7;
}

- (void)vn_encodePoint:()VNAdditions forKey:
{
  id v10 = a5;
  BOOL v8 = (void *)[[NSString alloc] initWithFormat:@"%@.x", v10];
  [a1 encodeDouble:v8 forKey:a2];

  id v9 = (void *)[[NSString alloc] initWithFormat:@"%@.y", v10];
  [a1 encodeDouble:v9 forKey:a3];
}

- (void)vn_decodeTimeRangeForKey:()VNAdditions
{
  id v5 = a2;
  uint64_t v6 = MEMORY[0x1E4F1FA30];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  *a3 = *MEMORY[0x1E4F1FA30];
  a3[1] = v7;
  a3[2] = *(_OWORD *)(v6 + 32);
  if (-[NSCoder(VNAdditions) vn_decodeTimeRangeForKey:]::ourCMTimeRangeRepresentationClassesSetOnceToken != -1) {
    dispatch_once(&-[NSCoder(VNAdditions) vn_decodeTimeRangeForKey:]::ourCMTimeRangeRepresentationClassesSetOnceToken, &__block_literal_global_3106);
  }
  CFDictionaryRef v8 = [a1 decodeObjectOfClasses:-[NSCoder(VNAdditions) vn_decodeTimeRangeForKey:]::ourCMTimeRangeRepresentationClassesSet forKey:v5];
  CFDictionaryRef v9 = v8;
  if (v8)
  {
    CMTimeRangeMakeFromDictionary(&v11, v8);
    long long v10 = *(_OWORD *)&v11.start.epoch;
    *a3 = *(_OWORD *)&v11.start.value;
    a3[1] = v10;
    a3[2] = *(_OWORD *)&v11.duration.timescale;
  }
}

- (void)vn_encodeTimeRange:()VNAdditions forKey:
{
  id v6 = a4;
  long long v7 = a3[1];
  *(_OWORD *)&v9.start.value = *a3;
  *(_OWORD *)&v9.start.epoch = v7;
  *(_OWORD *)&v9.duration.timescale = a3[2];
  CFDictionaryRef v8 = CMTimeRangeCopyAsDictionary(&v9, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [a1 encodeObject:v8 forKey:v6];
}

- (__n128)vn_decodeSimdFloat3ForKey:()VNAdditions
{
  id v4 = a3;
  id v5 = _stringOrDataCodingClassesSet();
  id v6 = [a1 decodeObjectOfClasses:v5 forKey:v4];

  if (!v6)
  {
    CFDictionaryRef v8 = missingRequiredCodingKeyError(v4);
    [a1 failWithError:v8];
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(a1, "_vn_decodeSimdFloat3FromStringRepresentation:", v6);
      goto LABEL_9;
    }
    CFDictionaryRef v8 = unknownDataForCodingKeyError(v4);
    [a1 failWithError:v8];
LABEL_8:

    long long v7 = 0uLL;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_vn_decodeSimdFloat3FromDataRepresentation:forKey:", v6, v4);
LABEL_9:
  long long v10 = v7;

  return (__n128)v10;
}

- (__n128)_vn_decodeSimdFloat3FromStringRepresentation:()VNAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 length] < 0xA) {
    goto LABEL_12;
  }
  id v5 = (void *)MEMORY[0x1A6257080]();
  id v6 = [MEMORY[0x1E4F28FE8] scannerWithString:v4];
  if (![v6 scanString:@"d3:|" intoString:0]) {
    goto LABEL_10;
  }
  BOOL v7 = 0;
  unint64_t v8 = 0;
  CMTimeRange v9 = &v17;
  do
  {
    if (([v6 scanDouble:v9] & 1) == 0) {
      break;
    }
    BOOL v7 = v8 > 1;
    CMTimeRange v9 = (float64x2_t *)((char *)v9 + 8);
    ++v8;
  }
  while (v8 != 3);
  if (v7
    && [v6 scanString:@"|" intoString:0]
    && [v6 isAtEnd])
  {
    int v11 = 0;
    *(float32x2_t *)&long long v10 = vcvt_f32_f64(v17);
    float v12 = v18;
    *((float *)&v10 + 2) = v12;
    long long v16 = v10;
  }
  else
  {
LABEL_10:
    int v11 = 1;
  }

  if (v11)
  {
LABEL_12:
    uint64_t v13 = [NSString stringWithFormat:@"'%@' is not a valid simd_flloat3 encoding", v4];
    id v14 = +[VNError errorForInvalidFormatErrorWithLocalizedDescription:v13];
    [a1 failWithError:v14];

    long long v16 = 0u;
  }

  return (__n128)v16;
}

- (__n128)_vn_decodeSimdFloat3FromDataRepresentation:()VNAdditions forKey:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3020000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__NSCoder_VNAdditions___vn_decodeSimdFloat3FromDataRepresentation_forKey___block_invoke;
  v8[3] = &unk_1E5B1C2D8;
  v8[4] = &v9;
  char v4 = objc_msgSend(a1, "_vn_decodeFloatsFromEncodedData:withExpectedMagicNumber:valueCount:forKey:usingBlock:", a3, 1935631923, 3, a4, v8);
  long long v5 = 0uLL;
  if (v4) {
    long long v5 = *((_OWORD *)v10 + 2);
  }
  long long v7 = v5;
  _Block_object_dispose(&v9, 8);
  return (__n128)v7;
}

- (void)vn_encodeSimdFloat3:()VNAdditions forKey:
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unint64_t v10 = a2.n128_u64[0];
  unsigned __int32 v11 = a2.n128_u32[2];
  id v9 = 0;
  id v6 = objc_msgSend((id)objc_opt_class(), "_vn_createEncodableDataWithMagicNumber:forN:floatValues:error:", 1935631923, 3, &v10, &v9);
  id v7 = v9;
  if (v6) {
    [a1 encodeObject:v6 forKey:v5];
  }
  else {
    [a1 failWithError:v7];
  }
}

- (__n128)vn_decode4x4MatrixForKey:()VNAdditions
{
  char v4 = a3;
  id v5 = _stringOrDataCodingClassesSet();
  id v6 = [a1 decodeObjectOfClasses:v5 forKey:v4];

  if (!v6)
  {
    unint64_t v8 = missingRequiredCodingKeyError(v4);
    [a1 failWithError:v8];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(a1, "_vn_decode4x4MatrixFromStringRepresentation:", v6);
      goto LABEL_7;
    }
    unint64_t v8 = unknownDataForCodingKeyError(v4);
    [a1 failWithError:v8];
LABEL_9:

    long long v10 = *MEMORY[0x1E4F149A0];
    goto LABEL_10;
  }
  objc_msgSend(a1, "_vn_decode4x4MatrixFromDataRepresentation:forKey:", v6, v4);
LABEL_7:
  long long v10 = v7;
LABEL_10:

  return (__n128)v10;
}

- (__n128)_vn_decode4x4MatrixFromStringRepresentation:()VNAdditions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 hasPrefix:@"4x4:|"]
    || (unint64_t)[v3 length] < 0x25
    || ((char v4 = (void *)MEMORY[0x1A6257080](),
         [MEMORY[0x1E4F28FE8] scannerWithString:v3],
         id v5 = (NSScanner *)objc_claimAutoreleasedReturnValue(),
         ![(NSScanner *)v5 scanString:@"4x4:|" intoString:0])
     || !_scanNFloats(v5, 0x10uLL, (float *)&v9)
     || ![(NSScanner *)v5 scanString:@"|" intoString:0]
     || ![(NSScanner *)v5 isAtEnd]
      ? (int v6 = 1)
      : (int v6 = 0, v8 = v9),
        v5,
        v6))
  {
    long long v8 = *MEMORY[0x1E4F149A0];
  }

  return (__n128)v8;
}

- (__n128)_vn_decode4x4MatrixFromDataRepresentation:()VNAdditions forKey:
{
  uint64_t v10 = 0;
  unsigned __int32 v11 = &v10;
  uint64_t v12 = 0x7012000000;
  uint64_t v13 = __Block_byref_object_copy__48;
  char v4 = (long long *)MEMORY[0x1E4F149A0];
  uint64_t v14 = __Block_byref_object_dispose__49;
  uint64_t v15 = "";
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  long long v16 = *MEMORY[0x1E4F149A0];
  long long v17 = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
  long long v19 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__NSCoder_VNAdditions___vn_decode4x4MatrixFromDataRepresentation_forKey___block_invoke;
  v9[3] = &unk_1E5B1C2D8;
  v9[4] = &v10;
  if (objc_msgSend(a1, "_vn_decodeFloatsFromEncodedData:withExpectedMagicNumber:valueCount:forKey:usingBlock:", a3, 1714714676, 16, a4, v9))char v4 = (long long *)(v11 + 6); {
  long long v8 = *v4;
  }
  _Block_object_dispose(&v10, 8);
  return (__n128)v8;
}

- (void)vn_encode4x4Matrix:()VNAdditions forKey:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a7;
  v16[0] = a2;
  v16[1] = a3;
  v16[2] = a4;
  v16[3] = a5;
  id v15 = 0;
  long long v9 = objc_msgSend((id)objc_opt_class(), "_vn_createEncodableDataWithMagicNumber:forN:floatValues:error:", 1714714676, 16, v16, &v15);
  id v10 = v15;
  if (v9) {
    [a1 encodeObject:v9 forKey:v8];
  }
  else {
    [a1 failWithError:v10];
  }
}

- (__n128)vn_decode3x3MatrixForKey:()VNAdditions
{
  char v4 = a3;
  long long v5 = _stringOrDataCodingClassesSet();
  long long v6 = [a1 decodeObjectOfClasses:v5 forKey:v4];

  if (!v6)
  {
    id v8 = missingRequiredCodingKeyError(v4);
    [a1 failWithError:v8];
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(a1, "_vn_decode3x3MatrixFromStringRepresentation:", v6);
      goto LABEL_7;
    }
    id v8 = unknownDataForCodingKeyError(v4);
    [a1 failWithError:v8];
LABEL_9:

    long long v10 = *MEMORY[0x1E4F14998];
    goto LABEL_10;
  }
  objc_msgSend(a1, "_vn_decode3x3MatrixFromDataRepresentation:forKey:", v6, v4);
LABEL_7:
  long long v10 = v7;
LABEL_10:

  return (__n128)v10;
}

- (__n128)_vn_decode3x3MatrixFromStringRepresentation:()VNAdditions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x17
    || ((char v4 = (void *)MEMORY[0x1A6257080](),
         [MEMORY[0x1E4F28FE8] scannerWithString:v3],
         long long v5 = (NSScanner *)objc_claimAutoreleasedReturnValue(),
         ![(NSScanner *)v5 scanString:@"3x3:|" intoString:0])
     || !_scanNFloats(v5, 9uLL, v9)
     || ![(NSScanner *)v5 scanString:@"|" intoString:0]
     || ![(NSScanner *)v5 isAtEnd]
      ? (int v6 = 1)
      : (int v6 = 0, v8 = *(_OWORD *)v9),
        v5,
        v6))
  {
    long long v8 = *MEMORY[0x1E4F14998];
  }

  return (__n128)v8;
}

- (__n128)_vn_decode3x3MatrixFromDataRepresentation:()VNAdditions forKey:
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x6012000000;
  uint64_t v14 = __Block_byref_object_copy__3128;
  id v15 = __Block_byref_object_dispose__3129;
  long long v16 = "";
  char v4 = (long long *)MEMORY[0x1E4F14998];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F14998] + 16);
  long long v17 = *MEMORY[0x1E4F14998];
  long long v18 = v5;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F14998] + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__NSCoder_VNAdditions___vn_decode3x3MatrixFromDataRepresentation_forKey___block_invoke;
  v10[3] = &unk_1E5B1C2D8;
  v10[4] = &v11;
  int v6 = objc_msgSend(a1, "_vn_decodeFloatsFromEncodedData:withExpectedMagicNumber:valueCount:forKey:usingBlock:", a3, 1714649139, 9, a4, v10);
  long long v7 = (long long *)(v12 + 6);
  if (!v6) {
    long long v7 = v4;
  }
  long long v9 = *v7;
  _Block_object_dispose(&v11, 8);
  return (__n128)v9;
}

- (void)vn_encode3x3Matrix:()VNAdditions forKey:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  __n128 v8 = a2;
  v8.n128_u32[3] = a3.i32[0];
  v15[0] = v8;
  v15[1] = vextq_s8(vextq_s8(a3, a3, 0xCuLL), a4, 8uLL);
  unsigned __int32 v16 = a4.u32[2];
  id v14 = 0;
  long long v9 = objc_msgSend((id)objc_opt_class(), "_vn_createEncodableDataWithMagicNumber:forN:floatValues:error:", 1714649139, 9, v15, &v14);
  id v10 = v14;
  if (v9) {
    [a1 encodeObject:v9 forKey:v7];
  }
  else {
    [a1 failWithError:v10];
  }
}

- (void)vn_decodeCGAffineTransformForKey:()VNAdditions
{
  id v11 = a2;
  long long v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v11];
  if ((unint64_t)[v5 length] < 0xD
    || ((int v6 = (void *)MEMORY[0x1A6257080](),
         [MEMORY[0x1E4F28FE8] scannerWithString:v5],
         id v7 = objc_claimAutoreleasedReturnValue(),
         ![v7 scanString:@"[" intoString:0])
     || ![v7 scanDouble:a3]
     || ![v7 scanDouble:a3 + 8]
     || ![v7 scanDouble:a3 + 16]
     || ![v7 scanDouble:a3 + 24]
     || ![v7 scanDouble:a3 + 32]
     || ![v7 scanDouble:a3 + 40]
     || ![v7 scanString:@"]" intoString:0]
      ? (char v8 = 0)
      : (char v8 = [v7 isAtEnd]),
        v7,
        (v8 & 1) == 0))
  {
    long long v9 = [NSString stringWithFormat:@"'%@' is not a valid CGAffineTransform encoding", v5];
    id v10 = +[VNError errorForInvalidFormatErrorWithLocalizedDescription:v9];
    [a1 failWithError:v10];
  }
}

- (void)vn_encodeCGAffineTransform:()VNAdditions forKey:
{
  id v7 = a4;
  int v6 = objc_msgSend(NSString, "stringWithFormat:", @"[%g %g %g %g %g %g]", *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
  [a1 encodeObject:v6 forKey:v7];
}

- (uint64_t)_vn_decodeFloatsFromEncodedData:()VNAdditions withExpectedMagicNumber:valueCount:forKey:usingBlock:
{
  id v12 = a3;
  uint64_t v13 = a6;
  id v14 = a7;
  if ([v12 length] != 4 * a5 + 4
    || (id v15 = (unsigned int *)[v12 bytes], bswap32(*v15) != a4))
  {
    unknownDataForCodingKeyError(v13);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    [a1 failWithError:v17];
LABEL_11:
    uint64_t v22 = 0;
    goto LABEL_12;
  }
  unsigned __int32 v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * a5];
  if (!v16)
  {
    v23 = +[VNError errorForMemoryAllocationFailure];
    [a1 failWithError:v23];

    id v17 = 0;
    goto LABEL_11;
  }
  id v17 = v16;
  uint64_t v18 = [v17 mutableBytes];
  if (a5)
  {
    long long v19 = v15 + 1;
    v20 = (_DWORD *)v18;
    do
    {
      unsigned int v21 = *v19++;
      *v20++ = bswap32(v21);
      --a5;
    }
    while (a5);
  }
  v14[2](v14, v18);
  uint64_t v22 = 1;
LABEL_12:

  return v22;
}

+ (id)_vn_createEncodableDataWithMagicNumber:()VNAdditions forN:floatValues:error:
{
  uint64_t v8 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * a4 + 4];
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = (_DWORD *)[v12 mutableBytes];
    *uint64_t v13 = bswap32(a3);
    if (v8)
    {
      id v14 = v13 + 1;
      do
      {
        unsigned int v15 = *a5++;
        *v14++ = bswap32(v15);
        --v8;
      }
      while (v8);
    }
    id v16 = v12;
  }
  else if (a6)
  {
    *a6 = +[VNError errorForMemoryAllocationFailure];
  }

  return v11;
}

@end