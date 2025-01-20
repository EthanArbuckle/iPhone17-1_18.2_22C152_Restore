@interface NSCoder(ARAdditions)
- (__n128)ar_decodeMatrix3x3ForKey:()ARAdditions;
- (__n128)ar_decodeMatrix4x3ForKey:()ARAdditions;
- (__n128)ar_decodeMatrix4x4ForKey:()ARAdditions;
- (__n128)ar_decodeVector3ForKey:()ARAdditions;
- (double)ar_decodeVector2ForKey:()ARAdditions;
- (id)_ar_decodeDataNoCopyForKey:()ARAdditions;
- (id)_ar_decodeDataNoCopyWithFallbackForKey:()ARAdditions;
- (uint64_t)ar_encodeCMRotationMatrix:()ARAdditions forKey:;
- (uint64_t)ar_encodeMatrix3x3:()ARAdditions forKey:;
- (uint64_t)ar_encodeMatrix4x3:()ARAdditions forKey:;
- (uint64_t)ar_encodeMatrix4x4:()ARAdditions forKey:;
- (uint64_t)ar_encodeVector2:()ARAdditions forKey:;
- (uint64_t)ar_encodeVector3:()ARAdditions forKey:;
- (void)ar_decodeCMRotationMatrixForKey:()ARAdditions;
@end

@implementation NSCoder(ARAdditions)

- (id)_ar_decodeDataNoCopyForKey:()ARAdditions
{
  id v4 = a3;
  uint64_t v8 = 0;
  v5 = (void *)[a1 decodeBytesForKey:v4 returnedLength:&v8];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v5 = (void *)[v6 initWithBytesNoCopy:v5 length:v8 freeWhenDone:0];
  }

  return v5;
}

- (id)_ar_decodeDataNoCopyWithFallbackForKey:()ARAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 decodingFailurePolicy])
  {
    v5 = objc_msgSend(a1, "_ar_decodeDataNoCopyForKey:", v4);
    if (!v5)
    {
      id v6 = [a1 error];

      if (v6)
      {
        v7 = _ARLogGeneral_17();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          uint64_t v8 = (objc_class *)objc_opt_class();
          v9 = NSStringFromClass(v8);
          v10 = [a1 error];
          int v12 = 138544130;
          v13 = v9;
          __int16 v14 = 2048;
          v15 = a1;
          __int16 v16 = 2114;
          id v17 = v4;
          __int16 v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_FAULT, "%{public}@ <%p>: Failed to decode bytes for key %{public}@ and decoder is not configured to raise exceptions, error = %@", (uint8_t *)&v12, 0x2Au);
        }
      }
    }
  }
  else
  {
    v5 = objc_msgSend(a1, "_ar_decodeDataNoCopyForKey:", v4);
  }

  return v5;
}

- (uint64_t)ar_encodeVector2:()ARAdditions forKey:
{
  double v5 = a2;
  return [a1 encodeBytes:&v5 length:8 forKey:a4];
}

- (double)ar_decodeVector2ForKey:()ARAdditions
{
  v1 = objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  double v2 = ARVector2FromNSData(v1);

  return v2;
}

- (uint64_t)ar_encodeVector3:()ARAdditions forKey:
{
  __n128 v5 = a2;
  return [a1 encodeBytes:&v5 length:16 forKey:a4];
}

- (__n128)ar_decodeVector3ForKey:()ARAdditions
{
  v1 = objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  *(double *)&long long v2 = ARVector3FromNSData(v1);
  long long v4 = v2;

  return (__n128)v4;
}

- (uint64_t)ar_encodeMatrix3x3:()ARAdditions forKey:
{
  v7[0] = a2;
  v7[1] = a3;
  v7[2] = a4;
  return [a1 encodeBytes:v7 length:48 forKey:a6];
}

- (__n128)ar_decodeMatrix3x3ForKey:()ARAdditions
{
  v1 = objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  *(double *)&long long v2 = ARMatrix3x3FromNSData(v1);
  long long v4 = v2;

  return (__n128)v4;
}

- (uint64_t)ar_encodeMatrix4x4:()ARAdditions forKey:
{
  v8[0] = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  return [a1 encodeBytes:v8 length:64 forKey:a7];
}

- (__n128)ar_decodeMatrix4x4ForKey:()ARAdditions
{
  id v4 = a3;
  if ([a1 containsValueForKey:v4])
  {
    __n128 v5 = objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:", v4);
    *(double *)&long long v6 = ARMatrix4x4FromNSData(v5);
    long long v8 = v6;
  }
  else
  {
    long long v8 = *MEMORY[0x1E4F149A0];
  }

  return (__n128)v8;
}

- (uint64_t)ar_encodeMatrix4x3:()ARAdditions forKey:
{
  v8[0] = a2;
  v8[1] = a3;
  v8[2] = a4;
  v8[3] = a5;
  return [a1 encodeBytes:v8 length:64 forKey:a7];
}

- (__n128)ar_decodeMatrix4x3ForKey:()ARAdditions
{
  v1 = objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  *(double *)&long long v2 = ARMatrix4x3FromNSData(v1);
  long long v4 = v2;

  return (__n128)v4;
}

- (uint64_t)ar_encodeCMRotationMatrix:()ARAdditions forKey:
{
  return [a1 encodeBytes:a3 length:72 forKey:a4];
}

- (void)ar_decodeCMRotationMatrixForKey:()ARAdditions
{
  *(void *)(a2 + 64) = 0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  objc_msgSend(a1, "_ar_decodeDataNoCopyWithFallbackForKey:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([v6 length] == 72)
  {
    uint64_t v3 = [v6 bytes];
    long long v4 = *(_OWORD *)(v3 + 48);
    *(_OWORD *)(a2 + 32) = *(_OWORD *)(v3 + 32);
    *(_OWORD *)(a2 + 48) = v4;
    *(void *)(a2 + 64) = *(void *)(v3 + 64);
    long long v5 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v3;
    *(_OWORD *)(a2 + 16) = v5;
  }
}

@end