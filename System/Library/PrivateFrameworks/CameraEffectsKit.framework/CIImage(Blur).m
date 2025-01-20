@interface CIImage(Blur)
- (id)bluredImageWithFlippedXAxis:()Blur;
@end

@implementation CIImage(Blur)

- (id)bluredImageWithFlippedXAxis:()Blur
{
  v35[2] = *MEMORY[0x263EF8340];
  id v4 = a1;
  [v4 extent];
  double v6 = v5;
  double v8 = v7;
  long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v31.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v31.c = v9;
  *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (a3)
  {
    CGAffineTransformMakeTranslation(&v31, v5, 0.0);
    CGAffineTransform v29 = v31;
    CGAffineTransformScale(&v30, &v29, -1.0, 1.0);
    CGAffineTransform v31 = v30;
  }
  uint64_t v10 = [MEMORY[0x263F08D40] value:&v31 withObjCType:"{CGAffineTransform=dddddd}"];
  v11 = (void *)v10;
  v12 = 0;
  if (v4 && v10)
  {
    v13 = (void *)MEMORY[0x263F00640];
    uint64_t v14 = *MEMORY[0x263F00968];
    uint64_t v15 = *MEMORY[0x263F009B0];
    v34[0] = *MEMORY[0x263F00968];
    v34[1] = v15;
    v35[0] = v4;
    v35[1] = v10;
    v16 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    v17 = [v13 filterWithName:@"CIAffineTransform" withInputParameters:v16];

    uint64_t v18 = [v17 outputImage];
    v12 = (void *)v18;
    if (v18)
    {
      v19 = (void *)MEMORY[0x263F00640];
      uint64_t v20 = *MEMORY[0x263F00980];
      v32[0] = v14;
      v32[1] = v20;
      v33[0] = v18;
      v33[1] = &unk_26E801758;
      v21 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      v22 = [v19 filterWithName:@"CIGaussianBlur" withInputParameters:v21];

      v23 = [v22 outputImage];

      double v24 = *MEMORY[0x263F001A8];
      double v25 = *(double *)(MEMORY[0x263F001A8] + 8);
      v26 = [MEMORY[0x263F00628] context];
      v27 = (CGImage *)objc_msgSend(v26, "createCGImage:fromRect:", v23, v24, v25, v6, v8);

      v12 = [MEMORY[0x263F1C6B0] imageWithCGImage:v27];
      CGImageRelease(v27);

      v17 = v22;
    }
  }
  return v12;
}

@end