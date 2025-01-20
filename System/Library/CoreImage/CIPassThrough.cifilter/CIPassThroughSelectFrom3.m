@interface CIPassThroughSelectFrom3
- (CIImage)inputImage;
- (CIImage)inputImage1;
- (CIImage)inputImage2;
- (NSNumber)inputSelected;
- (id)outputImage;
- (void)setInputImage1:(id)a3;
- (void)setInputImage2:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputSelected:(id)a3;
@end

@implementation CIPassThroughSelectFrom3

- (id)outputImage
{
  if ([(NSNumber *)self->inputSelected intValue] < 0
    || [(NSNumber *)self->inputSelected intValue] <= 2)
  {
    if ([(NSNumber *)self->inputSelected intValue] < 0) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = [(NSNumber *)self->inputSelected intValue];
    }
  }
  else
  {
    uint64_t v3 = 2;
  }
  inputImage = self->inputImage;
  if (inputImage)
  {
    v5 = inputImage;
  }
  else
  {
    v5 = +[CIImage emptyImage];
  }
  v6 = v5;
  inputImage1 = self->inputImage1;
  if (inputImage1)
  {
    v8 = inputImage1;
  }
  else
  {
    v8 = +[CIImage emptyImage];
  }
  v9 = v8;
  inputImage2 = self->inputImage2;
  if (inputImage2)
  {
    v11 = inputImage2;
  }
  else
  {
    v11 = +[CIImage emptyImage];
  }
  v12 = v11;
  [(CIImage *)v6 extent];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [(CIImage *)v9 extent];
  v48.origin.CGFloat x = v21;
  v48.origin.CGFloat y = v22;
  v48.size.CGFloat width = v23;
  v48.size.CGFloat height = v24;
  v44.origin.CGFloat x = v14;
  v44.origin.CGFloat y = v16;
  v44.size.CGFloat width = v18;
  v44.size.CGFloat height = v20;
  CGRect v45 = CGRectUnion(v44, v48);
  CGFloat x = v45.origin.x;
  CGFloat y = v45.origin.y;
  CGFloat width = v45.size.width;
  CGFloat height = v45.size.height;
  [(CIImage *)v12 extent];
  v49.origin.CGFloat x = v29;
  v49.origin.CGFloat y = v30;
  v49.size.CGFloat width = v31;
  v49.size.CGFloat height = v32;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGRect v47 = CGRectUnion(v46, v49);
  double v33 = v47.origin.x;
  double v34 = v47.origin.y;
  double v35 = v47.size.width;
  double v36 = v47.size.height;
  if (CGRectIsEmpty(v47))
  {
    v37 = 0;
  }
  else
  {
    v38 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIPT_Select3(__sample c0, __sample c1, __sample c2, float sel) { return sel < 1.0 ? c0 : sel < 2.0 ? c1 : c2; } \n"];
    v42[0] = v6;
    v42[1] = v9;
    v42[2] = v12;
    v39 = +[NSNumber numberWithInt:v3];
    v42[3] = v39;
    v40 = +[NSArray arrayWithObjects:v42 count:4];
    v37 = objc_msgSend(v38, "applyWithExtent:arguments:", v40, v33, v34, v35, v36);
  }

  return v37;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage1
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage1:(id)a3
{
}

- (CIImage)inputImage2
{
  return (CIImage *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputImage2:(id)a3
{
}

- (NSNumber)inputSelected
{
  return self->inputSelected;
}

- (void)setInputSelected:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputSelected, 0);
  objc_storeStrong((id *)&self->inputImage2, 0);
  objc_storeStrong((id *)&self->inputImage1, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end