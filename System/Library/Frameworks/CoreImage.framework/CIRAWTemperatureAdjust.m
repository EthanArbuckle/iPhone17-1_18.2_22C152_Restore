@interface CIRAWTemperatureAdjust
- (id)outputImage;
@end

@implementation CIRAWTemperatureAdjust

- (id)outputImage
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v3 = +[CIFilter filterWithName:@"CIColorMatrix"];
  [(NSNumber *)self->inputEV doubleValue];
  long double v5 = v4;
  inputVersion = self->inputVersion;
  if (inputVersion)
  {
    if ([(NSNumber *)inputVersion intValue]) {
      double v7 = 2.54999995;
    }
    else {
      double v7 = 2.0;
    }
  }
  else
  {
    double v7 = 2.54999995;
  }
  double v8 = exp2(v5);
  [(CIVector *)self->inputWhitePoint X];
  float v10 = v9;
  [(CIVector *)self->inputWhitePoint Y];
  *(float *)&double v11 = v11;
  double v28 = v8 * v7;
  double v29 = v7 * 0.0;
  double v30 = v7 * 0.0;
  double v31 = v7 * 0.0;
  double v32 = v8 * v7;
  double v33 = v7 * 0.0;
  double v34 = v7 * 0.0;
  double v35 = v7 * 0.0;
  double v36 = v8 * v7;
  v48[0] = (float)(v10 / *(float *)&v11);
  v48[1] = 1.0;
  v48[2] = (1.0 - v10 - *(float *)&v11) / *(float *)&v11;
  uint64_t v47 = 0;
  memset(v46, 0, sizeof(v46));
  GetAdaptationMatrix(v48, dbl_193955610, (double *)v46);
  MatrixMatrix(&v28, (double *)v46, &v28);
  long long v54 = xmmword_193955570;
  uint64_t v55 = 0x3FEA6741C471F7DCLL;
  double v53 = 0.0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  GetAdaptationMatrix((const double *)&v54, dbl_193955610, (double *)&v49);
  double v12 = *((double *)&v49 + 1) * 0.332802766 + *(double *)&v49 * 0.645435667;
  double v13 = v12 + *(double *)&v50 * 0.0302547969;
  double v14 = *(double *)&v51 * 0.332802766 + *((double *)&v50 + 1) * 0.645435667;
  double v15 = v14 + *((double *)&v51 + 1) * 0.0302547969;
  double v16 = *((double *)&v52 + 1) * 0.332802766 + *(double *)&v52 * 0.645435667;
  double v17 = v16 + v53 * 0.0302547969;
  double v18 = *((double *)&v49 + 1) * 0.612066763 + *(double *)&v49 * 0.181033831 + *(double *)&v50 * 0.0689652691;
  double v19 = *(double *)&v51 * 0.612066763 + *((double *)&v50 + 1) * 0.181033831 + *((double *)&v51 + 1) * 0.0689652691;
  double v20 = *((double *)&v52 + 1) * 0.612066763 + *(double *)&v52 * 0.181033831 + v53 * 0.0689652691;
  double v21 = *((double *)&v49 + 1) * 0.0551304711 + *(double *)&v49 * 0.137826178 + *(double *)&v50 * 0.725884537;
  double v22 = *(double *)&v51 * 0.0551304711 + *((double *)&v50 + 1) * 0.137826178 + *((double *)&v51 + 1) * 0.725884537;
  double v23 = *((double *)&v52 + 1) * 0.0551304711 + *(double *)&v52 * 0.137826178 + v53 * 0.725884537;
  double v37 = v13;
  double v38 = v18;
  double v39 = v21;
  double v40 = v15;
  double v41 = v19;
  double v42 = v22;
  double v43 = v17;
  double v44 = v20;
  double v45 = v23;
  double v24 = v21 * -(v17 * v19)
      + v13 * v19 * v23
      + v21 * v15 * v20
      + -(v15 * v18) * v23
      + v18 * v22 * v17
      + -(v13 * v22) * v20;
  if (v24 != 0.0)
  {
    double v37 = (v19 * v23 - v20 * v22) / v24;
    double v38 = (v20 * v21 - v18 * v23) / v24;
    double v39 = (v18 * v22 - v19 * v21) / v24;
    double v40 = (v23 * -(v14 + *((double *)&v51 + 1) * 0.0302547969) + v17 * v22) / v24;
    double v41 = (v21 * -(v16 + v53 * 0.0302547969) + v13 * v23) / v24;
    double v42 = (v15 * v21 - v13 * v22) / v24;
    double v43 = (v15 * v20 - v17 * v19) / v24;
    double v44 = (v20 * -(v12 + *(double *)&v50 * 0.0302547969) + v17 * v18) / v24;
    double v45 = (v13 * v19 - v15 * v18) / v24;
  }
  MatrixMatrix(&v28, &v37, &v28);
  [(CIFilter *)v3 setValue:+[CIVector vectorWithX:v28 Y:v29 Z:v30 W:0.0] forKey:@"inputRVector"];
  [(CIFilter *)v3 setValue:+[CIVector vectorWithX:v31 Y:v32 Z:v33 W:0.0] forKey:@"inputGVector"];
  [(CIFilter *)v3 setValue:+[CIVector vectorWithX:v34 Y:v35 Z:v36 W:0.0] forKey:@"inputBVector"];
  [(CIFilter *)v3 setValue:+[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0] forKey:@"inputAVector"];
  [(CIFilter *)v3 setValue:+[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0] forKey:@"inputBiasVector"];
  [(CIFilter *)v3 setValue:self->inputImage forKey:@"inputImage"];
  v25 = (void *)[(CIFilter *)v3 valueForKey:@"outputImage"];
  if (GetLinearAdobeRGB(void)::onceToken != -1) {
    dispatch_once(&GetLinearAdobeRGB(void)::onceToken, &__block_literal_global_58);
  }
  uint64_t v26 = GetLinearAdobeRGB(void)::space;

  return (id)[v25 imageByColorMatchingColorSpaceToWorkingSpace:v26];
}

@end