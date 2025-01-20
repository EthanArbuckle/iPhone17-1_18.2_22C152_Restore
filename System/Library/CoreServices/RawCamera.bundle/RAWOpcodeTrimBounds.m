@interface RAWOpcodeTrimBounds
- (CIImage)inputImage;
- (NSDictionary)arguments;
- (RAWOpcodeTrimBounds)initWithArguments:(id)a3;
- (id)outputImage;
- (void)setArguments:(id)a3;
- (void)setInputImage:(id)a3;
@end

@implementation RAWOpcodeTrimBounds

- (RAWOpcodeTrimBounds)initWithArguments:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RAWOpcodeTrimBounds;
  v5 = [(RAWOpcodeTrimBounds *)&v11 init];
  v9 = v5;
  if (v5) {
    objc_msgSend_setArguments_(v5, v6, (uint64_t)v4, v7, v8);
  }

  return v9;
}

- (id)outputImage
{
  v31[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend_kernelWithString_(MEMORY[0x1E4F1E010], a2, @"kernel vec4 rc_trim_bounds (__sample c) { return c; }",
    v2,
  v5 = v3);
  v10 = objc_msgSend_inputImage(self, v6, v7, v8, v9);
  objc_msgSend_extent(v10, v11, v12, v13, v14);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v31[0] = self->inputImage;
  v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)v31, 1, v24);
  v29 = objc_msgSend_applyWithExtent_arguments_(v5, v26, (uint64_t)v25, v27, v28, v16, v18, v20, v22);

  return v29;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSDictionary)arguments
{
  return self->arguments;
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->arguments, 0);

  objc_storeStrong((id *)&self->inputImage, 0);
}

@end