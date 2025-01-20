@interface MDLLight(SCNModelIO)
+ (id)lightWithSCNLight:()SCNModelIO;
@end

@implementation MDLLight(SCNModelIO)

+ (id)lightWithSCNLight:()SCNModelIO
{
  id v4 = objc_alloc_init(MEMORY[0x263F13648]);
  objc_setAssociatedObject(v4, @"SCNSceneKitAssociatedObject", a3, (void *)0x301);
  [v4 setColorSpace:*MEMORY[0x263F002D8]];
  [a3 color];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = (void *)[a3 color];
  uint64_t v7 = (uint64_t)v6;
  if (isKindOfClass) {
    uint64_t v7 = [v6 CGColor];
  }
  [v4 setColor:v7];
  [a3 attenuationStartDistance];
  *(float *)&double v8 = v8;
  [v4 setAttenuationStartDistance:v8];
  [a3 attenuationEndDistance];
  *(float *)&double v9 = v9;
  [v4 setAttenuationEndDistance:v9];
  [a3 attenuationFalloffExponent];
  *(float *)&double v10 = v10;
  [v4 setAttenuationFalloffExponent:v10];
  [a3 spotInnerAngle];
  *(float *)&double v11 = v11;
  [v4 setInnerConeAngle:v11];
  [a3 spotOuterAngle];
  *(float *)&double v12 = v12;
  [v4 setOuterConeAngle:v12];
  if (objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"ambient"))
  {
    uint64_t v13 = 1;
  }
  else if (objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"spot"))
  {
    uint64_t v13 = 3;
  }
  else if (objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"directional"))
  {
    uint64_t v13 = 2;
  }
  else
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", @"omni")) {
      goto LABEL_12;
    }
    uint64_t v13 = 4;
  }
  [v4 setLightType:v13];
LABEL_12:

  return v4;
}

@end