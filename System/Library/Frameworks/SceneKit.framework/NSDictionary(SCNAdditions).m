@interface NSDictionary(SCNAdditions)
- (float)SCNVector3Value;
- (float)SCNVector4Value;
- (uint64_t)SCNMatrix4Value;
@end

@implementation NSDictionary(SCNAdditions)

- (float)SCNVector3Value
{
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"x"), "floatValue");
  float v3 = v2;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"y"), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"z"), "floatValue");
  return v3;
}

- (float)SCNVector4Value
{
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"x"), "floatValue");
  float v3 = v2;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"y"), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"z"), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"w"), "floatValue");
  return v3;
}

- (uint64_t)SCNMatrix4Value
{
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m11"), "floatValue");
  *(_DWORD *)a2 = v4;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m12"), "floatValue");
  *(_DWORD *)(a2 + 4) = v5;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m13"), "floatValue");
  *(_DWORD *)(a2 + 8) = v6;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m14"), "floatValue");
  *(_DWORD *)(a2 + 12) = v7;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m21"), "floatValue");
  *(_DWORD *)(a2 + 16) = v8;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m22"), "floatValue");
  *(_DWORD *)(a2 + 20) = v9;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m23"), "floatValue");
  *(_DWORD *)(a2 + 24) = v10;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m24"), "floatValue");
  *(_DWORD *)(a2 + 28) = v11;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m31"), "floatValue");
  *(_DWORD *)(a2 + 32) = v12;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m32"), "floatValue");
  *(_DWORD *)(a2 + 36) = v13;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m33"), "floatValue");
  *(_DWORD *)(a2 + 40) = v14;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m34"), "floatValue");
  *(_DWORD *)(a2 + 44) = v15;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m41"), "floatValue");
  *(_DWORD *)(a2 + 48) = v16;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m42"), "floatValue");
  *(_DWORD *)(a2 + 52) = v17;
  objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m43"), "floatValue");
  *(_DWORD *)(a2 + 56) = v18;
  uint64_t result = objc_msgSend((id)objc_msgSend(a1, "valueForKey:", @"m44"), "floatValue");
  *(_DWORD *)(a2 + 60) = v20;
  return result;
}

@end