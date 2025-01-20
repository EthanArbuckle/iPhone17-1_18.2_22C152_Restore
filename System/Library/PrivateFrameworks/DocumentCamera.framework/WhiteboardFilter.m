@interface WhiteboardFilter
+ (id)customAttributes;
- (CIImage)inputImage;
- (NSNumber)stride;
- (id)outputImage;
- (id)whiteboardFilterKernel;
- (void)setInputImage:(id)a3;
- (void)setStride:(id)a3;
@end

@implementation WhiteboardFilter

- (id)whiteboardFilterKernel
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WhiteboardFilter_whiteboardFilterKernel__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  if (whiteboardFilterKernel_once != -1) {
    dispatch_once(&whiteboardFilterKernel_once, block);
  }
  return (id)whiteboardFilterKernel_kernel;
}

void __42__WhiteboardFilter_whiteboardFilterKernel__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v1 = [v0 pathForResource:@"WhiteboardFilter" ofType:@"cikernel"];
  id v6 = 0;
  v2 = [NSString stringWithContentsOfFile:v1 encoding:4 error:&v6];
  id v3 = v6;
  uint64_t v4 = [MEMORY[0x263F00658] kernelWithString:v2];
  v5 = (void *)whiteboardFilterKernel_kernel;
  whiteboardFilterKernel_kernel = v4;
}

+ (id)customAttributes
{
  return 0;
}

- (id)outputImage
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = [(WhiteboardFilter *)self inputImage];
  [v3 extent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __31__WhiteboardFilter_outputImage__block_invoke;
  v19[3] = &unk_2642A9F40;
  v19[4] = self;
  v12 = (void *)MEMORY[0x21D44FA30](v19);
  v13 = [(WhiteboardFilter *)self whiteboardFilterKernel];
  v14 = [(WhiteboardFilter *)self inputImage];
  v20[0] = v14;
  v15 = [(WhiteboardFilter *)self stride];
  v20[1] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v17 = objc_msgSend(v13, "applyWithExtent:roiCallback:arguments:", v12, v16, v5, v7, v9, v11);

  return v17;
}

double __31__WhiteboardFilter_outputImage__block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v10 = [*(id *)(a1 + 32) stride];
  [v10 floatValue];
  CGFloat v12 = (float)-v11;
  v13 = [*(id *)(a1 + 32) stride];
  [v13 floatValue];
  CGFloat v15 = (float)-v14;
  v18.origin.x = a2;
  v18.origin.y = a3;
  v18.size.width = a4;
  v18.size.height = a5;
  *(void *)&double v16 = (unint64_t)CGRectInset(v18, v12, v15);

  return v16;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
}

- (NSNumber)stride
{
  return self->_stride;
}

- (void)setStride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stride, 0);

  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end