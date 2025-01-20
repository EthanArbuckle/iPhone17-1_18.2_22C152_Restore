@interface PKInkingTool
+ ($D36B54C795B77659A0C5270123F54F47)_contextForStroke:(SEL)a3 weight:(id)a4 type:(double)a5;
+ (BOOL)_isUsingSystemColorPicker;
+ (CGFloat)defaultWidthForInkType:(PKInkType)inkType;
+ (CGFloat)maximumWidthForInkType:(PKInkType)inkType;
+ (CGFloat)minimumWidthForInkType:(PKInkType)inkType;
+ (UIColor)convertColor:(UIColor *)color fromUserInterfaceStyle:(UIUserInterfaceStyle)fromUserInterfaceStyle to:(UIUserInterfaceStyle)toUserInterfaceStyle;
+ (double)_calculateEdgeWidthForWeight:(double)a3 type:(id)a4;
+ (double)_calculateWidthForWeight:(double)a3 type:(id)a4;
+ (double)_weightForWidth:(double)a3 type:(id)a4;
+ (double)_widthForWeight:(double)a3 type:(id)a4;
+ (id)behaviorForInkType:(id)a3;
+ (void)_computeWeightInfoMapFor:(id)a3 in:(void *)a4;
+ (void)_weightInfoMap;
- (CGFloat)width;
- (Class)_toolPickerItemClass;
- (PKContentVersion)requiredContentVersion;
- (PKInkType)inkType;
- (PKInkingTool)initWithInk:(PKInk *)ink width:(CGFloat)width;
- (PKInkingTool)initWithInkType:(PKInkType)type color:(UIColor *)color;
- (PKInkingTool)initWithInkType:(PKInkType)type color:(UIColor *)color width:(CGFloat)width;
- (UIColor)color;
- (id)description;
@end

@implementation PKInkingTool

- (PKInkingTool)initWithInkType:(PKInkType)type color:(UIColor *)color width:(CGFloat)width
{
  v8 = type;
  v9 = color;
  +[PKInkingTool _weightForWidth:v8 type:width];
  v10 = +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", v8, v9);
  v13.receiver = self;
  v13.super_class = (Class)PKInkingTool;
  v11 = [(PKTool *)&v13 _initWithInk:v10];

  return v11;
}

- (PKInkingTool)initWithInkType:(PKInkType)type color:(UIColor *)color
{
  v6 = type;
  v7 = color;
  +[PKInkingTool defaultWidthForInkType:v6];
  v8 = -[PKInkingTool initWithInkType:color:width:](self, "initWithInkType:color:width:", v6, v7);

  return v8;
}

- (PKInkingTool)initWithInk:(PKInk *)ink width:(CGFloat)width
{
  v6 = ink;
  v7 = [(PKInk *)v6 inkType];
  +[PKInkingTool _weightForWidth:v7 type:width];
  double v9 = v8;

  v10 = +[PKInk inkFromInk:v6 weight:v9];
  v11 = [(PKTool *)self _initWithInk:v10];

  return v11;
}

- (PKInkType)inkType
{
  v2 = [(PKTool *)self ink];
  v3 = [v2 identifier];

  return (PKInkType)v3;
}

- (UIColor)color
{
  v2 = [(PKTool *)self ink];
  v3 = [v2 color];

  return (UIColor *)v3;
}

- (CGFloat)width
{
  v3 = [(PKTool *)self ink];
  v4 = [v3 behavior];
  int v5 = [v4 useUnclampedWeight];

  v6 = [(PKTool *)self ink];
  [v6 weight];
  double v8 = v7;
  if (!v5)
  {
    double v9 = [(PKTool *)self ink];
    v10 = [v9 identifier];
    +[PKInkingTool _widthForWeight:v10 type:v8];
    double v8 = v11;
  }
  return v8;
}

- (PKContentVersion)requiredContentVersion
{
  v2 = [(PKTool *)self ink];
  PKContentVersion v3 = [v2 requiredContentVersion];

  return v3;
}

+ (double)_widthForWeight:(double)a3 type:(id)a4
{
  id v5 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  v6 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((void *)+[PKInkingTool _weightInfoMap], (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap];
  if (v6)
  {
    uint64_t v7 = *((void *)v6 + 5);
    if (v7) {
      a3 = PKFunctionPiecewiseSimpleLinear::_solveLinearPiecewise(*(double **)v7, *(void *)(v7 + 8), *(void *)(v7 + 24), *(void *)(v7 + 32), a3);
    }
  }
  if (v10 < 0) {
    operator delete(__p[0]);
  }

  return a3;
}

+ (double)_weightForWidth:(double)a3 type:(id)a4
{
  id v5 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 UTF8String]);
  v6 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((void *)+[PKInkingTool _weightInfoMap], (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap];
  if (v6)
  {
    uint64_t v7 = *((void *)v6 + 5);
    if (v7) {
      a3 = PKFunctionPiecewiseSimpleLinear::_solveLinearPiecewise(*(double **)(v7 + 24), *(void *)(v7 + 32), *(void *)v7, *(void *)(v7 + 8), a3);
    }
  }
  if (v10 < 0) {
    operator delete(__p[0]);
  }

  return a3;
}

+ (CGFloat)defaultWidthForInkType:(PKInkType)inkType
{
  PKContentVersion v3 = inkType;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)v3 UTF8String]);
  v4 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((void *)+[PKInkingTool _weightInfoMap], (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap];
  if (v4) {
    double v5 = *((double *)v4 + 6);
  }
  else {
    double v5 = 1.0;
  }
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

+ (CGFloat)minimumWidthForInkType:(PKInkType)inkType
{
  PKContentVersion v3 = inkType;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)v3 UTF8String]);
  v4 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((void *)+[PKInkingTool _weightInfoMap], (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap];
  if (v4) {
    double v5 = *((double *)v4 + 7);
  }
  else {
    double v5 = 1.0;
  }
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

+ (CGFloat)maximumWidthForInkType:(PKInkType)inkType
{
  PKContentVersion v3 = inkType;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[(NSString *)v3 UTF8String]);
  v4 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((void *)+[PKInkingTool _weightInfoMap], (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap];
  if (v4) {
    double v5 = *((double *)v4 + 8);
  }
  else {
    double v5 = 1.0;
  }
  if (v8 < 0) {
    operator delete(__p[0]);
  }

  return v5;
}

+ (UIColor)convertColor:(UIColor *)color fromUserInterfaceStyle:(UIUserInterfaceStyle)fromUserInterfaceStyle to:(UIUserInterfaceStyle)toUserInterfaceStyle
{
  char v8 = color;
  if ([a1 _isUsingSystemColorPicker])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_convertColorPickerColor:fromUserInterfaceStyle:to:", v8, fromUserInterfaceStyle, toUserInterfaceStyle);
LABEL_10:
    char v10 = (void *)v9;

    goto LABEL_11;
  }
  char v10 = v8;
  if (toUserInterfaceStyle)
  {
    char v10 = v8;
    if (fromUserInterfaceStyle)
    {
      char v10 = v8;
      if (fromUserInterfaceStyle != toUserInterfaceStyle)
      {
        uint64_t v11 = [(UIColor *)v8 CGColor];
        if (toUserInterfaceStyle == UIUserInterfaceStyleDark) {
          CGColorRef v12 = DKUConvertColorForDarkStyle(v11);
        }
        else {
          CGColorRef v12 = DKUConvertColorForLightStyle(v11);
        }
        uint64_t v9 = [MEMORY[0x1E4FB1618] colorWithCGColor:v12];
        goto LABEL_10;
      }
    }
  }
LABEL_11:

  return (UIColor *)v10;
}

+ (BOOL)_isUsingSystemColorPicker
{
  return 1;
}

+ ($D36B54C795B77659A0C5270123F54F47)_contextForStroke:(SEL)a3 weight:(id)a4 type:(double)a5
{
  id v18 = a4;
  id v9 = a6;
  char v10 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v11 = +[PKInk inkWithType:v9 color:v10 weight:a5];
  [v18 setInk:v11];

  *(_OWORD *)&retstr->var0.altitude = 0u;
  *(_OWORD *)&retstr->var0.radius2 = 0u;
  *(_OWORD *)&retstr->var0.aspectRatio = 0u;
  *(_OWORD *)&retstr->var0.force = 0u;
  *(_OWORD *)&retstr->var0.timestamp = 0u;
  *(_OWORD *)&retstr->var0.location.y = 0u;
  retstr->var2 = 1;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&retstr->var3 = _Q0;
  retstr->var5 = 0.0;
  retstr->var6 = 0.0;
  retstr->var7 = v18;
  retstr->var8 = 23;

  return result;
}

+ (double)_calculateWidthForWeight:(double)a3 type:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(_PKStrokeConcrete);
  uint64_t v18 = 0;
  long long v17 = 0u;
  objc_msgSend(a1, "_contextForStroke:weight:type:", v7, v6, a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0);
  char v8 = [*((id *)&v17 + 1) ink];
  id v9 = [v8 behavior];
  -[PKInkBehavior radiusForPoint:context:]((uint64_t)v9, &PKInkingToolWidthCalcPoint, (uint64_t)&v16);
  double v11 = v10;

  CGColorRef v12 = [*((id *)&v17 + 1) ink];
  objc_super v13 = [v12 behavior];
  double v14 = -[PKInkBehavior edgeWidthForPoint:context:]((uint64_t)v13, &PKInkingToolWidthCalcPoint, (uint64_t)&v16);

  return v14 + v11 * 2.0;
}

+ (double)_calculateEdgeWidthForWeight:(double)a3 type:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(_PKStrokeConcrete);
  uint64_t v14 = 0;
  long long v13 = 0u;
  objc_msgSend(a1, "_contextForStroke:weight:type:", v7, v6, a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0);
  char v8 = [*((id *)&v13 + 1) ink];
  id v9 = [v8 behavior];
  double v10 = -[PKInkBehavior edgeWidthForPoint:context:]((uint64_t)v9, &PKInkingToolWidthCalcPoint, (uint64_t)&v12);

  return v10;
}

+ (id)behaviorForInkType:(id)a3
{
  id v3 = a3;
  v4 = +[PKInkManager defaultInkManager];
  double v5 = [v4 supportedInkIdentifierFromIdentifier:v3];

  id v6 = +[PKInkManager defaultInkManager];
  uint64_t v7 = objc_msgSend(v6, "inkBehaviorForIdentifier:version:variant:", v5, +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", v5), @"default");

  return v7;
}

+ (void)_computeWeightInfoMapFor:(id)a3 in:(void *)a4
{
  id v5 = a3;
  uint64_t v6 = +[PKInkingTool behaviorForInkType:v5];
  v49 = (void *)v6;
  if (([(id)v6 useUnclampedWeight] & 1) == 0) {
    operator new();
  }
  [(id)v6 useUnclampedWeight];
  [(id)v6 defaultWidth];
  uint64_t v8 = v7;
  v34 = [(id)v6 uiWidths];
  v35 = [v34 firstObject];
  [v35 doubleValue];
  uint64_t v37 = v36;

  v38 = [(id)v6 uiWidths];
  v39 = [v38 lastObject];
  [v39 doubleValue];
  uint64_t v41 = v40;

  id v9 = v5;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 UTF8String]);
  unint64_t v10 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a4 + 24, (uint64_t)__p);
  unint64_t v11 = v10;
  unint64_t v12 = *((void *)a4 + 1);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      uint64_t v6 = v10;
      if (v10 >= v12) {
        uint64_t v6 = v10 % v12;
      }
    }
    else
    {
      uint64_t v6 = (v12 - 1) & v10;
    }
    v15 = *(void ***)(*(void *)a4 + 8 * v6);
    if (v15)
    {
      long long v16 = (char *)*v15;
      if (*v15)
      {
        do
        {
          unint64_t v17 = *((void *)v16 + 1);
          if (v17 == v11)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v16 + 16, (unsigned __int8 *)__p))
            {
              v47 = v49;
              goto LABEL_77;
            }
          }
          else
          {
            if (v14 > 1)
            {
              if (v17 >= v12) {
                v17 %= v12;
              }
            }
            else
            {
              v17 &= v12 - 1;
            }
            if (v17 != v6) {
              break;
            }
          }
          long long v16 = *(char **)v16;
        }
        while (v16);
      }
    }
  }
  long long v16 = (char *)operator new(0x48uLL);
  uint64_t v18 = (char *)a4 + 16;
  *(void *)long long v16 = 0;
  *((void *)v16 + 1) = v11;
  *((_OWORD *)v16 + 1) = *(_OWORD *)__p;
  *((void *)v16 + 4) = v51;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v51 = 0;
  *(_OWORD *)(v16 + 40) = 0u;
  *(_OWORD *)(v16 + 56) = 0u;
  float v19 = (float)(unint64_t)(*((void *)a4 + 3) + 1);
  float v20 = *((float *)a4 + 8);
  if (!v12 || (float)(v20 * (float)v12) < v19)
  {
    BOOL v21 = 1;
    if (v12 >= 3) {
      BOOL v21 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v12);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      int8x8_t prime = (int8x8_t)v23;
    }
    else {
      int8x8_t prime = (int8x8_t)v22;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v12 = *((void *)a4 + 1);
    }
    if (*(void *)&prime > v12) {
      goto LABEL_33;
    }
    if (*(void *)&prime < v12)
    {
      unint64_t v31 = vcvtps_u32_f32((float)*((unint64_t *)a4 + 3) / *((float *)a4 + 8));
      if (v12 < 3 || (uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        unint64_t v31 = std::__next_prime(v31);
      }
      else
      {
        uint64_t v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2) {
          unint64_t v31 = v33;
        }
      }
      if (*(void *)&prime <= v31) {
        int8x8_t prime = (int8x8_t)v31;
      }
      if (*(void *)&prime >= v12)
      {
        unint64_t v12 = *((void *)a4 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_33:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v25 = operator new(8 * *(void *)&prime);
          v26 = *(void **)a4;
          *(void *)a4 = v25;
          if (v26) {
            operator delete(v26);
          }
          uint64_t v27 = 0;
          *((int8x8_t *)a4 + 1) = prime;
          do
            *(void *)(*(void *)a4 + 8 * v27++) = 0;
          while (*(void *)&prime != v27);
          v28 = (void *)*v18;
          if (*v18)
          {
            unint64_t v29 = v28[1];
            uint8x8_t v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(void *)&prime) {
                v29 %= *(void *)&prime;
              }
            }
            else
            {
              v29 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a4 + 8 * v29) = v18;
            v42 = (void *)*v28;
            if (*v28)
            {
              do
              {
                unint64_t v43 = v42[1];
                if (v30.u32[0] > 1uLL)
                {
                  if (v43 >= *(void *)&prime) {
                    v43 %= *(void *)&prime;
                  }
                }
                else
                {
                  v43 &= *(void *)&prime - 1;
                }
                if (v43 != v29)
                {
                  if (!*(void *)(*(void *)a4 + 8 * v43))
                  {
                    *(void *)(*(void *)a4 + 8 * v43) = v28;
                    goto LABEL_58;
                  }
                  void *v28 = *v42;
                  void *v42 = **(void **)(*(void *)a4 + 8 * v43);
                  **(void **)(*(void *)a4 + 8 * v43) = v42;
                  v42 = v28;
                }
                unint64_t v43 = v29;
LABEL_58:
                v28 = v42;
                v42 = (void *)*v42;
                unint64_t v29 = v43;
              }
              while (v42);
            }
          }
          unint64_t v12 = (unint64_t)prime;
          goto LABEL_62;
        }
        v48 = *(void **)a4;
        *(void *)a4 = 0;
        if (v48) {
          operator delete(v48);
        }
        unint64_t v12 = 0;
        *((void *)a4 + 1) = 0;
      }
    }
LABEL_62:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        uint64_t v6 = v11 % v12;
      }
      else {
        uint64_t v6 = v11;
      }
    }
    else
    {
      uint64_t v6 = (v12 - 1) & v11;
    }
  }
  v44 = *(void **)a4;
  v45 = *(void **)(*(void *)a4 + 8 * v6);
  if (v45)
  {
    *(void *)long long v16 = *v45;
    v47 = v49;
LABEL_75:
    void *v45 = v16;
    goto LABEL_76;
  }
  *(void *)long long v16 = *v18;
  *uint64_t v18 = v16;
  v44[v6] = v18;
  v47 = v49;
  if (*(void *)v16)
  {
    unint64_t v46 = *(void *)(*(void *)v16 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v46 >= v12) {
        v46 %= v12;
      }
    }
    else
    {
      v46 &= v12 - 1;
    }
    v45 = (void *)(*(void *)a4 + 8 * v46);
    goto LABEL_75;
  }
LABEL_76:
  ++*((void *)a4 + 3);
LABEL_77:
  *((void *)v16 + 5) = 0;
  *((void *)v16 + 6) = v8;
  *((void *)v16 + 7) = v37;
  *((void *)v16 + 8) = v41;
  if (SHIBYTE(v51) < 0) {
    operator delete(__p[0]);
  }
}

+ (void)_weightInfoMap
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__PKInkingTool__weightInfoMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_125 != -1) {
    dispatch_once(&_MergedGlobals_125, block);
  }
  return (void *)qword_1EB3C5EF8;
}

void __30__PKInkingTool__weightInfoMap__block_invoke()
{
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PKInkingTool *)self inkType];
  uint64_t v7 = [(PKInkingTool *)self color];
  [(PKInkingTool *)self width];
  id v9 = [v3 stringWithFormat:@"<%@: %p %@ color=%@ width=%f>", v5, self, v6, v7, v8];

  return v9;
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

@end