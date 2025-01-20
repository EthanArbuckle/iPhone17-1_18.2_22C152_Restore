@interface ISEmbossedEffect
- (CGSize)offset;
- (ISEmbossedEffect)init;
- (double)range;
- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4;
- (unint64_t)variant;
- (void)setOffset:(CGSize)a3;
- (void)setRange:(double)a3;
- (void)setVariant:(unint64_t)a3;
@end

@implementation ISEmbossedEffect

- (ISEmbossedEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)ISEmbossedEffect;
  result = [(ISEmbossedEffect *)&v3 init];
  if (result) {
    result->_variant = 0;
  }
  return result;
}

- (id)filterWithBackgroundImage:(id)a3 inputImage:(id)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1E040];
  id v8 = a4;
  v9 = [v7 filterWithName:@"CIColorMatrix"];
  uint64_t v10 = *MEMORY[0x1E4F1E480];
  v55 = v6;
  [v9 setValue:v6 forKey:*MEMORY[0x1E4F1E480]];
  unint64_t variant = self->_variant;
  if (variant > 3)
  {
    double v14 = 0.02;
    double v12 = 0.43;
    double v13 = 0.2;
  }
  else
  {
    double v12 = dbl_1AE7C4E28[variant];
    double v13 = dbl_1AE7C4E48[variant];
    double v14 = dbl_1AE7C4E68[variant];
  }
  v15 = [MEMORY[0x1E4F1E080] vectorWithX:v14 Y:v14 Z:v14 W:0.0];
  [v9 setValue:v15 forKey:@"inputRVector"];

  v16 = [MEMORY[0x1E4F1E080] vectorWithX:v13 Y:v13 Z:v13 W:0.0];
  [v9 setValue:v16 forKey:@"inputGVector"];

  v17 = [MEMORY[0x1E4F1E080] vectorWithX:v12 Y:v12 Z:v12 W:0.0];
  [v9 setValue:v17 forKey:@"inputBVector"];

  v18 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
  [v9 setValue:v18 forKey:@"inputAVector"];

  v19 = [MEMORY[0x1E4F1E040] filterWithName:@"CUIInnerGlowOrShadowFilter"];
  v20 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:-2.0];
  [v19 setValue:v20 forKey:@"inputOffset"];

  v21 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.11];
  uint64_t v22 = *MEMORY[0x1E4F1E448];
  uint64_t v54 = *MEMORY[0x1E4F1E448];
  [v19 setValue:v21 forKey:*MEMORY[0x1E4F1E448]];

  v23 = [NSNumber numberWithDouble:2.0];
  [v19 setValue:v23 forKey:@"inputRange"];

  LODWORD(v24) = 1074174045;
  v25 = [NSNumber numberWithFloat:v24];
  [v19 setValue:v25 forKey:@"inputRadius"];

  [v19 setValue:v8 forKey:v10];
  v26 = [MEMORY[0x1E4F1E040] filterWithName:@"CILinearBurnBlendMode"];
  v27 = [v19 outputImage];
  [v26 setValue:v27 forKey:v10];

  v28 = [v9 outputImage];
  uint64_t v29 = *MEMORY[0x1E4F1E418];
  [v26 setValue:v28 forKey:*MEMORY[0x1E4F1E418]];

  v30 = [MEMORY[0x1E4F1E040] filterWithName:@"CUIInnerGlowOrShadowFilter"];
  v31 = [NSNumber numberWithDouble:2.0];
  uint64_t v53 = *MEMORY[0x1E4F1E4E0];
  objc_msgSend(v30, "setValue:forKey:", v31);

  v32 = [MEMORY[0x1E4F1E008] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.07];
  [v30 setValue:v32 forKey:v22];

  v33 = [NSNumber numberWithDouble:1.0];
  [v30 setValue:v33 forKey:@"inputRange"];

  [v30 setValue:v8 forKey:v10];
  v34 = [MEMORY[0x1E4F1E040] filterWithName:@"CIOverlayBlendMode"];
  v35 = [v30 outputImage];
  [v34 setValue:v35 forKey:v10];

  v36 = [v26 outputImage];
  [v34 setValue:v36 forKey:v29];

  v37 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceInCompositing"];
  v38 = [v34 outputImage];
  [v37 setValue:v38 forKey:v10];

  [v37 setValue:v8 forKey:v29];
  v39 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOverCompositing"];
  v40 = [v37 outputImage];
  [v39 setValue:v40 forKey:v10];

  [v39 setValue:v55 forKey:v29];
  id v41 = v39;

  v42 = [MEMORY[0x1E4F1E008] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.2];
  v43 = [MEMORY[0x1E4F1E040] filterWithName:@"CUIOuterGlowOrShadowFilter"];
  v44 = [NSNumber numberWithDouble:2.0];
  [v43 setValue:v44 forKey:v53];

  v45 = [MEMORY[0x1E4F1E080] vectorWithX:0.0 Y:-2.0];
  [v43 setValue:v45 forKey:@"inputOffset"];

  [v43 setValue:v42 forKey:v54];
  v46 = [NSNumber numberWithDouble:2.0];
  [v43 setValue:v46 forKey:@"inputRange"];

  [v43 setValue:v8 forKey:v10];
  v47 = [MEMORY[0x1E4F1E040] filterWithName:@"CISourceOutCompositing"];
  v48 = [v43 outputImage];
  [v47 setValue:v48 forKey:v10];

  [v47 setValue:v8 forKey:v29];
  v49 = [MEMORY[0x1E4F1E040] filterWithName:@"CILinearDodgeBlendMode"];
  v50 = [v47 outputImage];
  [v49 setValue:v50 forKey:v10];

  v51 = [v41 outputImage];

  [v49 setValue:v51 forKey:v29];
  return v49;
}

- (CGSize)offset
{
  objc_copyStruct(v4, &self->_offset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16, 1, 0);
}

- (double)range
{
  return self->_range;
}

- (void)setRange:(double)a3
{
  self->_range = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_unint64_t variant = a3;
}

@end