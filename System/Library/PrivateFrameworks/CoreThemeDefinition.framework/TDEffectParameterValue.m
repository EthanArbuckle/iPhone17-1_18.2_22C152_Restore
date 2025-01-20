@interface TDEffectParameterValue
+ (id)keyPathsForValuesAffectingBlueComponent;
+ (id)keyPathsForValuesAffectingColor;
+ (id)keyPathsForValuesAffectingGreenComponent;
+ (id)keyPathsForValuesAffectingRedComponent;
- (unint64_t)blueComponent;
- (unint64_t)greenComponent;
- (unint64_t)redComponent;
- (void)setBlueComponent:(unint64_t)a3;
- (void)setGreenComponent:(unint64_t)a3;
- (void)setRedComponent:(unint64_t)a3;
@end

@implementation TDEffectParameterValue

+ (id)keyPathsForValuesAffectingColor
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"colorValue", 0);
}

+ (id)keyPathsForValuesAffectingRedComponent
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"colorValue", 0);
}

- (unint64_t)redComponent
{
  return objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue");
}

- (void)setRedComponent:(unint64_t)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v5 = objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue");
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5 & 0xFFFFFFFFFFFFFF00 | v3];

  [(TDEffectParameterValue *)self setColorValue:v6];
}

+ (id)keyPathsForValuesAffectingGreenComponent
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"colorValue", 0);
}

- (unint64_t)greenComponent
{
  return ((unsigned __int16)objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue") >> 8);
}

- (void)setGreenComponent:(unint64_t)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v5 = objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue");
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5 & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)v3 << 8)];

  [(TDEffectParameterValue *)self setColorValue:v6];
}

+ (id)keyPathsForValuesAffectingBlueComponent
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"colorValue", 0);
}

- (unint64_t)blueComponent
{
  return (objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue") >> 16);
}

- (void)setBlueComponent:(unint64_t)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v5 = objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue");
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5 & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)v3 << 16)];

  [(TDEffectParameterValue *)self setColorValue:v6];
}

@end