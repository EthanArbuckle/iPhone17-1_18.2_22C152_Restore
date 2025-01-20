@interface VNCIFilter
- (CIImage)inputImage;
- (VNCIFilter)initWithKernelName:(id)a3;
- (VNCIFilter)initWithKernelName:(id)a3 inputParameters:(id)a4;
- (id)applyWithArguments:(id *)a1;
- (void)setInputImage:(id)a3;
@end

@implementation VNCIFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputImage, 0);

  objc_storeStrong((id *)&self->_kernel, 0);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (VNCIFilter)initWithKernelName:(id)a3 inputParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(VNCIFilter *)self initWithKernelName:v6];
  v9 = v8;
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__VNCIFilter_initWithKernelName_inputParameters___block_invoke;
    v13[3] = &unk_1E5B1FD68;
    v10 = v8;
    v14 = v10;
    [v7 enumerateKeysAndObjectsUsingBlock:v13];
    v11 = v10;
  }
  return v9;
}

uint64_t __49__VNCIFilter_initWithKernelName_inputParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forKey:a2];
}

- (VNCIFilter)initWithKernelName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNCIFilter;
  v5 = [(VNCIFilter *)&v13 init];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = v4;
  self;
  if (getVNBundle(void)::onceToken != -1) {
    dispatch_once(&getVNBundle(void)::onceToken, &__block_literal_global_14841);
  }
  id v7 = [(id)getVNBundle(void)::bundle URLForResource:@"ImageFilters" withExtension:@"metallib"];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v7];
  uint64_t v9 = [MEMORY[0x1E4F1E010] kernelWithFunctionName:v6 fromMetalLibraryData:v8 error:0];

  kernel = v5->_kernel;
  v5->_kernel = (CIColorKernel *)v9;

  if (v5->_kernel) {
    v11 = v5;
  }
  else {
LABEL_6:
  }
    v11 = 0;

  return v11;
}

- (id)applyWithArguments:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 inputImage];
    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v5 addObject:v4];
      if (v3) {
        [v5 addObjectsFromArray:v3];
      }
      id v6 = [v4 imageByUnpremultiplyingAlpha];

      id v7 = a1[10];
      [v6 extent];
      v8 = objc_msgSend(v7, "applyWithExtent:arguments:", v5);

      a1 = [v8 imageByPremultiplyingAlpha];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

@end