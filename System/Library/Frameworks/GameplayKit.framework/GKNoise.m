@interface GKNoise
+ (GKNoise)noiseWithComponentNoises:(NSArray *)noises selectionNoise:(GKNoise *)selectionNoise;
+ (GKNoise)noiseWithComponentNoises:(NSArray *)noises selectionNoise:(GKNoise *)selectionNoise componentBoundaries:(NSArray *)componentBoundaries boundaryBlendDistances:(NSArray *)blendDistances;
+ (GKNoise)noiseWithNoiseSource:(GKNoiseSource *)noiseSource;
+ (GKNoise)noiseWithNoiseSource:(GKNoiseSource *)noiseSource gradientColors:(NSDictionary *)gradientColors;
- (GKNoise)init;
- (GKNoise)initWithNoiseSource:(GKNoiseSource *)noiseSource;
- (GKNoise)initWithNoiseSource:(GKNoiseSource *)noiseSource gradientColors:(NSDictionary *)gradientColors;
- (NSDictionary)gradientColors;
- (float)valueAtPosition:(vector_float2)position;
- (id)__modules;
- (id)cloneRecursive:(id)a3;
- (void)__blendWithNoise:(id)a3 selectionNoise:(id)a4 selectionRangeLowerBound:(double)a5 selectionRangeUpperBound:(double)a6 selectionBoundaryBlendDistance:(double)a7;
- (void)addWithNoise:(GKNoise *)noise;
- (void)applyAbsoluteValue;
- (void)applyTurbulenceWithFrequency:(double)frequency power:(double)power roughness:(int)roughness seed:(int32_t)seed;
- (void)cacheBinaryModule:(id)a3 rhsNoise:(id)a4;
- (void)cacheQuaternaryModule:(id)a3 xDisplacementNoise:(id)a4 yDisplacementNoise:(id)a5 zDisplacementNoise:(id)a6;
- (void)cacheTernaryModule:(id)a3 rhsNoise:(id)a4 selectionNoise:(id)a5;
- (void)cacheUnaryModule:(id)a3;
- (void)clampWithLowerBound:(double)lowerBound upperBound:(double)upperBound;
- (void)dealloc;
- (void)displaceXWithNoise:(GKNoise *)xDisplacementNoise yWithNoise:(GKNoise *)yDisplacementNoise zWithNoise:(GKNoise *)zDisplacementNoise;
- (void)invert;
- (void)maximumWithNoise:(GKNoise *)noise;
- (void)minimumWithNoise:(GKNoise *)noise;
- (void)moveBy:(_OWORD *)a3;
- (void)multiplyWithNoise:(GKNoise *)noise;
- (void)raiseToPower:(double)power;
- (void)raiseToPowerWithNoise:(GKNoise *)noise;
- (void)remapValuesToCurveWithControlPoints:(NSDictionary *)controlPoints;
- (void)remapValuesToTerracesWithPeaks:(NSArray *)peakInputValues terracesInverted:(BOOL)inverted;
- (void)rotateBy:(_OWORD *)a3;
- (void)scaleBy:(_OWORD *)a3;
- (void)setGradientColors:(NSDictionary *)gradientColors;
@end

@implementation GKNoise

- (GKNoise)init
{
  v3 = objc_opt_new();
  v4 = [(GKNoise *)self initWithNoiseSource:v3];

  return v4;
}

+ (GKNoise)noiseWithNoiseSource:(GKNoiseSource *)noiseSource
{
  v3 = noiseSource;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNoiseSource:v3];

  return (GKNoise *)v4;
}

+ (GKNoise)noiseWithNoiseSource:(GKNoiseSource *)noiseSource gradientColors:(NSDictionary *)gradientColors
{
  v5 = noiseSource;
  v6 = gradientColors;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNoiseSource:v5 gradientColors:v6];

  return (GKNoise *)v7;
}

- (GKNoise)initWithNoiseSource:(GKNoiseSource *)noiseSource
{
  v10[2] = *MEMORY[0x263EF8340];
  v4 = noiseSource;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26884D868, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26884D868))
  {
    v9[0] = &unk_26E94B9E0;
    v7 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    v9[1] = &unk_26E94B9F0;
    v10[0] = v7;
    v8 = [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    v10[1] = v8;
    _MergedGlobals_0 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

    __cxa_guard_release(&qword_26884D868);
  }
  v5 = [(GKNoise *)self initWithNoiseSource:v4 gradientColors:_MergedGlobals_0];

  return v5;
}

- (GKNoise)initWithNoiseSource:(GKNoiseSource *)noiseSource gradientColors:(NSDictionary *)gradientColors
{
  v6 = noiseSource;
  v7 = gradientColors;
  v13.receiver = self;
  v13.super_class = (Class)GKNoise;
  v8 = [(GKNoise *)&v13 init];
  if (v8)
  {
    v9 = [(GKNoiseSource *)v6 cloneModule];
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    modules = v8->_modules;
    v8->_modules = v10;

    [(NSMutableArray *)v8->_modules addObject:v9];
    [(GKNoise *)v8 setGradientColors:v7];
  }
  return v8;
}

+ (GKNoise)noiseWithComponentNoises:(NSArray *)noises selectionNoise:(GKNoise *)selectionNoise
{
  v5 = noises;
  v6 = selectionNoise;
  unint64_t v7 = [(NSArray *)v5 count];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v7 != 1)
  {
    for (uint64_t i = 1; i != v7; ++i)
    {
      v11 = [NSNumber numberWithDouble:(double)i * (1.0 / (double)v7 + 1.0 / (double)v7) + -1.0];
      [v8 addObject:v11];

      v12 = [NSNumber numberWithDouble:0.1];
      [v9 addObject:v12];
    }
  }
  objc_super v13 = [(id)objc_opt_class() noiseWithComponentNoises:v5 selectionNoise:v6 componentBoundaries:v8 boundaryBlendDistances:v9];

  return (GKNoise *)v13;
}

+ (GKNoise)noiseWithComponentNoises:(NSArray *)noises selectionNoise:(GKNoise *)selectionNoise componentBoundaries:(NSArray *)componentBoundaries boundaryBlendDistances:(NSArray *)blendDistances
{
  id v9 = noises;
  v10 = selectionNoise;
  v74 = componentBoundaries;
  v72 = blendDistances;
  unint64_t v75 = [(NSArray *)v9 count];
  if (v75)
  {
    unint64_t v11 = 0;
    double v12 = -1.0;
    do
    {
      objc_super v13 = [(NSArray *)v9 objectAtIndexedSubscript:v11];
      double v14 = 1.0;
      if (v11 < v75 - 1)
      {
        v15 = [(NSArray *)v74 objectAtIndexedSubscript:v11];
        [v15 doubleValue];
        double v14 = v16;
      }
      v17 = +[GKConstantNoiseSource constantNoiseWithValue:(v14 - v12) * 0.5];
      v18 = +[GKNoise noiseWithNoiseSource:v17];
      [v13 multiplyWithNoise:v18];

      v19 = +[GKConstantNoiseSource constantNoiseWithValue:(v14 + v12) * 0.5];
      v20 = +[GKNoise noiseWithNoiseSource:v19];
      [v13 addWithNoise:v20];

      ++v11;
      double v12 = v14;
    }
    while (v75 != v11);
  }
  v21 = [(NSArray *)v9 objectAtIndexedSubscript:0];
  id v70 = v21;
  if (v75 >= 2)
  {
    uint64_t v22 = 1;
    do
    {
      v23 = [(NSArray *)v9 objectAtIndexedSubscript:v22];
      uint64_t v24 = v22 - 1;
      v25 = [(NSArray *)v74 objectAtIndexedSubscript:v22 - 1];
      [v25 doubleValue];
      double v27 = v26;
      v28 = [(NSArray *)v72 objectAtIndexedSubscript:v24];
      [v28 doubleValue];
      objc_msgSend(v21, "__blendWithNoise:selectionNoise:selectionRangeLowerBound:selectionRangeUpperBound:selectionBoundaryBlendDistance:", v23, v10, v27, 1.79769313e308, v29);

      uint64_t v22 = v24 + 2;
    }
    while (v24 + 2 != v75);
  }
  v69 = v10;
  id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v71 = v9;
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  v32 = v31;
  if (v75)
  {
    uint64_t v33 = 0;
    id v73 = v31;
    do
    {
      v34 = [(NSArray *)v9 objectAtIndexedSubscript:v33];
      v35 = [v34 gradientColors];
      [v32 addObject:v35];

      ++v33;
    }
    while (v75 != v33);
    unint64_t v36 = 0;
    unint64_t v37 = v75 - 1;
    double v38 = -1.0;
    do
    {
      double v39 = v38;
      v40 = [v32 objectAtIndexedSubscript:v36];
      uint64_t v41 = [v40 count];
      double v38 = 1.0;
      if (v36 < v37)
      {
        v42 = [(NSArray *)v74 objectAtIndexedSubscript:v36];
        [v42 doubleValue];
        double v38 = v43;
      }
      v44 = [v40 allKeys];
      v45 = [v44 sortedArrayUsingComparator:&__block_literal_global_2];

      double v46 = v38 - v39;
      uint64_t v47 = v41 - 1;
      if (v36)
      {
        if ([v45 count])
        {
          v48 = [v45 objectAtIndexedSubscript:0];
          v49 = [v40 objectForKeyedSubscript:v48];
          [v48 doubleValue];
          BOOL v51 = v41 != 1 || v36 >= v37;
          double v52 = v39 + (v50 * 0.5 + 0.5) * v46;
          if (v51) {
            double v52 = v52 + 2.22044605e-16;
          }
          v53 = [NSNumber numberWithDouble:v52];
          [v30 setObject:v49 forKey:v53];

          for (uint64_t i = 2; i - 1 < (unint64_t)[v45 count]; ++i)
          {
            v55 = objc_msgSend(v45, "objectAtIndexedSubscript:");
            v56 = [v40 objectForKeyedSubscript:v55];
            [v55 doubleValue];
            BOOL v58 = v41 != i || v36 >= v37;
            double v59 = v39 + (v57 * 0.5 + 0.5) * v46;
            if (!v58) {
              double v59 = v59 + -2.22044605e-16;
            }
            v60 = [NSNumber numberWithDouble:v59];
            [v30 setObject:v56 forKey:v60];
          }
        }
      }
      else
      {
        for (unint64_t j = 0; j < [v45 count]; ++j)
        {
          v62 = [v45 objectAtIndexedSubscript:j];
          v63 = [v40 objectForKeyedSubscript:v62];
          [v62 doubleValue];
          BOOL v65 = v47 != j || v75 == 1;
          double v66 = v39 + (v64 * 0.5 + 0.5) * v46;
          if (!v65) {
            double v66 = v66 + -2.22044605e-16;
          }
          v67 = [NSNumber numberWithDouble:v66];
          [v30 setObject:v63 forKey:v67];
        }
      }

      ++v36;
      v32 = v73;
    }
    while (v36 != v75);
  }
  if ([v30 count]) {
    [v70 setGradientColors:v30];
  }

  return (GKNoise *)v70;
}

uint64_t __94__GKNoise_noiseWithComponentNoises_selectionNoise_componentBoundaries_boundaryBlendDistances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 <= v8)
  {
    [v4 doubleValue];
    double v11 = v10;
    [v5 doubleValue];
    if (v11 >= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (float)valueAtPosition:(vector_float2)position
{
  v3 = [(NSMutableArray *)self->_modules lastObject];
  *(double *)&long long v4 = position.f32[1];
  v10[0] = COERCE_UNSIGNED_INT64(position.f32[0]);
  v10[1] = v4;
  [v3 valueAt:v10];
  float v6 = v5;
  float v7 = -1.0;
  if (v6 >= -1.0)
  {
    float v7 = v6;
    if (v6 > 1.0) {
      float v7 = 1.0;
    }
  }

  return v7;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_modules removeAllObjects];
  modules = self->_modules;
  self->_modules = 0;

  v4.receiver = self;
  v4.super_class = (Class)GKNoise;
  [(GKNoise *)&v4 dealloc];
}

- (id)__modules
{
  return self->_modules;
}

- (void)cacheUnaryModule:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(NSMutableArray *)self->_modules lastObject];
  [v5 setInputModule:v4 atIndex:0];

  [(NSMutableArray *)self->_modules addObject:v5];
}

- (void)cacheBinaryModule:(id)a3 rhsNoise:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  float v7 = [(NSMutableArray *)self->_modules lastObject];
  [v12 setInputModule:v7 atIndex:0];

  double v8 = objc_msgSend(v6, "__modules");
  uint64_t v9 = [v8 lastObject];
  id v10 = [(GKNoise *)self cloneRecursive:v9];
  double v11 = [(NSMutableArray *)self->_modules lastObject];
  [v12 setInputModule:v11 atIndex:1];

  [(NSMutableArray *)self->_modules addObject:v12];
}

- (void)cacheTernaryModule:(id)a3 rhsNoise:(id)a4 selectionNoise:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSMutableArray *)self->_modules lastObject];
  [v19 setInputModule:v10 atIndex:0];

  double v11 = objc_msgSend(v8, "__modules");
  id v12 = [v11 lastObject];
  id v13 = [(GKNoise *)self cloneRecursive:v12];
  double v14 = [(NSMutableArray *)self->_modules lastObject];
  [v19 setInputModule:v14 atIndex:1];

  v15 = objc_msgSend(v9, "__modules");
  double v16 = [v15 lastObject];
  id v17 = [(GKNoise *)self cloneRecursive:v16];
  v18 = [(NSMutableArray *)self->_modules lastObject];
  [v19 setInputModule:v18 atIndex:2];

  [(NSMutableArray *)self->_modules addObject:v19];
}

- (void)cacheQuaternaryModule:(id)a3 xDisplacementNoise:(id)a4 yDisplacementNoise:(id)a5 zDisplacementNoise:(id)a6
{
  id v29 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(NSMutableArray *)self->_modules lastObject];
  [v29 setInputModule:v13 atIndex:0];

  if (!v10)
  {
    double v14 = +[GKConstantNoiseSource constantNoiseWithValue:0.0];
    id v10 = +[GKNoise noiseWithNoiseSource:v14];
  }
  v28 = objc_msgSend(v10, "__modules");
  v15 = [v28 lastObject];
  id v16 = [(GKNoise *)self cloneRecursive:v15];
  id v17 = [(NSMutableArray *)self->_modules lastObject];
  [v29 setInputModule:v17 atIndex:1];

  if (!v11)
  {
    v18 = +[GKConstantNoiseSource constantNoiseWithValue:0.0];
    id v11 = +[GKNoise noiseWithNoiseSource:v18];
  }
  id v19 = objc_msgSend(v11, "__modules");
  v20 = [v19 lastObject];
  id v21 = [(GKNoise *)self cloneRecursive:v20];
  uint64_t v22 = [(NSMutableArray *)self->_modules lastObject];
  [v29 setInputModule:v22 atIndex:2];

  if (!v12)
  {
    v23 = +[GKConstantNoiseSource constantNoiseWithValue:0.0];
    id v12 = +[GKNoise noiseWithNoiseSource:v23];
  }
  uint64_t v24 = objc_msgSend(v12, "__modules");
  v25 = [v24 lastObject];
  id v26 = [(GKNoise *)self cloneRecursive:v25];
  double v27 = [(NSMutableArray *)self->_modules lastObject];
  [v29 setInputModule:v27 atIndex:3];

  [(NSMutableArray *)self->_modules addObject:v29];
}

- (id)cloneRecursive:(id)a3
{
  id v4 = a3;
  id v5 = [v4 cloneModule];
  int v6 = [v4 requiredInputModuleCount];
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      id v8 = [v4 inputModuleAtIndex:v7];
      id v9 = [(GKNoise *)self cloneRecursive:v8];
      [v5 setInputModule:v9 atIndex:v7];

      uint64_t v7 = (v7 + 1);
    }
    while (v6 != v7);
  }
  [(NSMutableArray *)self->_modules addObject:v5];

  return v5;
}

- (void)applyAbsoluteValue
{
  v3 = objc_alloc_init(GKAbsoluteValueNoiseModifier);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");
}

- (void)clampWithLowerBound:(double)lowerBound upperBound:(double)upperBound
{
  id v5 = [[GKClampNoiseModifier alloc] initWithLowerBound:lowerBound upperBound:upperBound];
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");
}

- (void)raiseToPower:(double)power
{
  id v4 = [[GKConstantPowerNoiseModifier alloc] initWithConstantPower:power];
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");
}

- (void)invert
{
  v3 = objc_alloc_init(GKInvertNoiseModifier);
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");
}

- (void)applyTurbulenceWithFrequency:(double)frequency power:(double)power roughness:(int)roughness seed:(int32_t)seed
{
  uint64_t v7 = [[GKTurbulenceNoiseModifier alloc] initWithFrequency:*(void *)&seed power:frequency roughness:power seed:(double)roughness];
  -[GKNoise cacheUnaryModule:](self, "cacheUnaryModule:");
}

- (void)remapValuesToCurveWithControlPoints:(NSDictionary *)controlPoints
{
  id v5 = controlPoints;
  id v4 = [[GKCurveNoiseModifier alloc] initWithControlPoints:v5];
  [(GKNoise *)self cacheUnaryModule:v4];
}

- (void)remapValuesToTerracesWithPeaks:(NSArray *)peakInputValues terracesInverted:(BOOL)inverted
{
  BOOL v4 = inverted;
  uint64_t v7 = peakInputValues;
  [(NSArray *)v7 count];
  int v6 = [[GKTerraceNoiseModifier alloc] initWithPeakInputValues:v7 terracesInverted:v4];
  [(GKNoise *)self cacheUnaryModule:v6];
}

- (void)moveBy:(_OWORD *)a3
{
  long long v5 = a3[1];
  v6[0] = *a3;
  v6[1] = v5;
  BOOL v4 = [[GKMoveNoiseModifier alloc] initWithDelta:v6];
  [a1 cacheUnaryModule:v4];
}

- (void)scaleBy:(_OWORD *)a3
{
  long long v5 = a3[1];
  v6[0] = *a3;
  v6[1] = v5;
  BOOL v4 = [[GKScaleNoiseModifier alloc] initWithFactor:v6];
  [a1 cacheUnaryModule:v4];
}

- (void)rotateBy:(_OWORD *)a3
{
  long long v5 = a3[1];
  v6[0] = *a3;
  v6[1] = v5;
  BOOL v4 = [[GKRotateNoiseModifier alloc] initWithRadians:v6];
  [a1 cacheUnaryModule:v4];
}

- (void)addWithNoise:(GKNoise *)noise
{
  long long v5 = noise;
  BOOL v4 = objc_alloc_init(GKAddNoiseModifier);
  [(GKNoise *)self cacheBinaryModule:v4 rhsNoise:v5];
}

- (void)multiplyWithNoise:(GKNoise *)noise
{
  long long v5 = noise;
  BOOL v4 = objc_alloc_init(GKMultiplyNoiseModifier);
  [(GKNoise *)self cacheBinaryModule:v4 rhsNoise:v5];
}

- (void)minimumWithNoise:(GKNoise *)noise
{
  long long v5 = noise;
  BOOL v4 = objc_alloc_init(GKMinimumNoiseModifier);
  [(GKNoise *)self cacheBinaryModule:v4 rhsNoise:v5];
}

- (void)maximumWithNoise:(GKNoise *)noise
{
  long long v5 = noise;
  BOOL v4 = objc_alloc_init(GKMaximumNoiseModifier);
  [(GKNoise *)self cacheBinaryModule:v4 rhsNoise:v5];
}

- (void)raiseToPowerWithNoise:(GKNoise *)noise
{
  long long v5 = noise;
  BOOL v4 = objc_alloc_init(GKPowerNoiseModifier);
  [(GKNoise *)self cacheBinaryModule:v4 rhsNoise:v5];
}

- (void)displaceXWithNoise:(GKNoise *)xDisplacementNoise yWithNoise:(GKNoise *)yDisplacementNoise zWithNoise:(GKNoise *)zDisplacementNoise
{
  id v11 = xDisplacementNoise;
  id v8 = yDisplacementNoise;
  id v9 = zDisplacementNoise;
  id v10 = objc_alloc_init(GKDisplaceNoiseModifier);
  [(GKNoise *)self cacheQuaternaryModule:v10 xDisplacementNoise:v11 yDisplacementNoise:v8 zDisplacementNoise:v9];
}

- (void)__blendWithNoise:(id)a3 selectionNoise:(id)a4 selectionRangeLowerBound:(double)a5 selectionRangeUpperBound:(double)a6 selectionBoundaryBlendDistance:(double)a7
{
  id v14 = a3;
  id v12 = a4;
  id v13 = [[GKBlendNoiseModifier alloc] initWithSelectionRangeLowerBound:a5 selectionRangeUpperBound:a6 selectionBoundaryBlendDistance:a7];
  [(GKNoise *)self cacheTernaryModule:v13 rhsNoise:v14 selectionNoise:v12];
}

- (NSDictionary)gradientColors
{
  return self->_gradientColors;
}

- (void)setGradientColors:(NSDictionary *)gradientColors
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColors, 0);

  objc_storeStrong((id *)&self->_modules, 0);
}

@end