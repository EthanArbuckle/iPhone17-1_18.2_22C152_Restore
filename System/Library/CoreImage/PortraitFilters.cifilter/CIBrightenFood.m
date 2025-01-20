@interface CIBrightenFood
- (id)_brightenFood;
- (id)outputImage;
@end

@implementation CIBrightenFood

- (id)_brightenFood
{
  if (qword_8CF20 != -1) {
    dispatch_once(&qword_8CF20, &stru_756C0);
  }
  return (id)qword_8CF18;
}

- (id)outputImage
{
  inputImage = self->super.inputImage;
  if (!inputImage) {
    return 0;
  }
  id v4 = [(CIBrightenFood *)self _brightenFood];
  [(NSNumber *)self->super.inputPShift floatValue];
  float v6 = v5;
  [(NSNumber *)self->super.inputTShift floatValue];
  float v8 = v7;
  float v9 = ((float)(v6 * v6) + (v7 + -0.5) * (v7 + -0.5)) / -0.0225;
  float v10 = 1.0 - expf(v9);
  [(CIImage *)self->super.inputImage extent];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  *(float *)&double v11 = v6 * v10;
  v21[3] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11, inputImage, self->super.inputStrength, self->super.inputSat);
  *(float *)&double v19 = v8 * v10;
  v21[4] = +[NSNumber numberWithFloat:v19];
  return objc_msgSend(v4, "applyWithExtent:arguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 5), v12, v14, v16, v18);
}

@end