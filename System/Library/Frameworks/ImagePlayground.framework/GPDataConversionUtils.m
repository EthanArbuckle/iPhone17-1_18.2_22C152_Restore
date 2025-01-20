@interface GPDataConversionUtils
+ (id)convertFloat16ToFloat32:(id)a3;
@end

@implementation GPDataConversionUtils

+ (id)convertFloat16ToFloat32:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  v5 = [MEMORY[0x263EFF990] dataWithLength:4 * (v4 >> 1)];
  id v6 = v3;
  v7 = (__int16 *)[v6 bytes];
  id v8 = v5;
  v9 = (_DWORD *)[v8 mutableBytes];
  if (v4 >= 2)
  {
    if (v4 >> 1 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v4 >> 1;
    }
    do
    {
      __int16 v11 = *v7++;
      _H0 = v11;
      __asm { FCVT            S0, H0 }
      *v9++ = _S0;
      --v10;
    }
    while (v10);
  }

  return v8;
}

@end