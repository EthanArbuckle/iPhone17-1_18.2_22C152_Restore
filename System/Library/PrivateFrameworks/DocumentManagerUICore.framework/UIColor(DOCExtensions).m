@interface UIColor(DOCExtensions)
+ (id)_doc_safeTintColor:()DOCExtensions;
- (id)_doc_invertedColor;
- (id)doc_readableFromColor:()DOCExtensions fallbackColor:;
@end

@implementation UIColor(DOCExtensions)

+ (id)_doc_safeTintColor:()DOCExtensions
{
  id v3 = a3;
  v4 = [MEMORY[0x263F1C550] whiteColor];
  [v4 _colorDifferenceFromColor:v3];
  if (v5 >= 0.2)
  {
    id v6 = v3;
  }
  else
  {
    id v6 = [MEMORY[0x263F1C550] systemBlueColor];
  }
  v7 = v6;

  return v7;
}

- (id)_doc_invertedColor
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  long long v3 = 0u;
  *(_OWORD *)v4 = 0u;
  [a1 getRed:&v3 green:(char *)&v3 + 8 blue:v4 alpha:&v4[1]];
  v1 = [MEMORY[0x263F1C550] colorWithRed:1.0 - *(double *)&v3 green:1.0 - *((double *)&v3 + 1) blue:1.0 - v4[0] alpha:v4[1]];
  return v1;
}

- (id)doc_readableFromColor:()DOCExtensions fallbackColor:
{
  id v6 = a4;
  [a1 _colorDifferenceFromColor:a3];
  if (v7 < 0.2) {
    v8 = v6;
  }
  else {
    v8 = a1;
  }
  id v9 = v8;

  return v9;
}

@end