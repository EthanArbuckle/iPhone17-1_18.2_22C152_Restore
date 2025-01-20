@interface NSCoder(NearbyInteraction)
- (__n128)decodeMatrix4x4ForKey:()NearbyInteraction;
- (__n128)decodeQuatForKey:()NearbyInteraction;
- (__n128)decodeVector3ForKey:()NearbyInteraction;
- (void)encodeMatrix4x4:()NearbyInteraction forKey:;
- (void)encodeQuat:()NearbyInteraction forKey:;
- (void)encodeVector3:()NearbyInteraction forKey:;
@end

@implementation NSCoder(NearbyInteraction)

- (void)encodeVector3:()NearbyInteraction forKey:
{
  __n128 v7 = a2;
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:16];
  objc_msgSend(a1, "encodeObject:forKey:", v6, v5, *(_OWORD *)&v7);
}

- (__n128)decodeVector3ForKey:()NearbyInteraction
{
  id v4 = a3;
  id v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  if ((unint64_t)[v5 length] <= 0xF)
  {
    __n128 v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [NSString stringWithUTF8String:"simd_float3 GetVector3FromNSData(NSData *__strong)"];
    [v7 handleFailureInFunction:v8 file:@"NINearbyObject.mm" lineNumber:663 description:@"NSData must contain enough bytes for simd_float3"];
  }
  DWORD2(v10) = 0;
  *(void *)&long long v10 = 0;
  [v5 getBytes:&v10 length:16];
  long long v9 = v10;

  return (__n128)v9;
}

- (void)encodeQuat:()NearbyInteraction forKey:
{
  __n128 v7 = a2;
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:16];
  objc_msgSend(a1, "encodeObject:forKey:", v6, v5, *(_OWORD *)&v7);
}

- (__n128)decodeQuatForKey:()NearbyInteraction
{
  id v4 = a3;
  id v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
  if ((unint64_t)[v5 length] <= 0xF)
  {
    __n128 v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = [NSString stringWithUTF8String:"simd_quatf GetQuaternionFromNSData(NSData *__strong)"];
    [v7 handleFailureInFunction:v8 file:@"NINearbyObject.mm" lineNumber:670 description:@"NSData must contain enough bytes for simd_quatf"];
  }
  [v5 getBytes:&v10 length:16];

  long long v9 = v10;
  return (__n128)v9;
}

- (void)encodeMatrix4x4:()NearbyInteraction forKey:
{
  __n128 v10 = a2;
  __n128 v11 = a3;
  __n128 v12 = a4;
  __n128 v13 = a5;
  id v8 = a7;
  long long v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v10 length:64];
  objc_msgSend(a1, "encodeObject:forKey:", v9, v8, *(_OWORD *)&v10, *(_OWORD *)&v11, *(_OWORD *)&v12, *(_OWORD *)&v13);
}

- (__n128)decodeMatrix4x4ForKey:()NearbyInteraction
{
  id v4 = a3;
  if ([a1 containsValueForKey:v4])
  {
    id v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];
    if ((unint64_t)[v5 length] <= 0x3F)
    {
      __n128 v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"simd_float4x4 GetMatrix4x4FromNSData(NSData *__strong)"];
      [v7 handleFailureInFunction:v8 file:@"NIVisionSupport.mm" lineNumber:111 description:@"NSData must contain enough bytes for simd_float4x4"];
    }
    [v5 getBytes:&v10 length:64];

    long long v9 = v10;
  }
  else
  {
    long long v9 = *MEMORY[0x1E4F149A0];
  }

  return (__n128)v9;
}

@end