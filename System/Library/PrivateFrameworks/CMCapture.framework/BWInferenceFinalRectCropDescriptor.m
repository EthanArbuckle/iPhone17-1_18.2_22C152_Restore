@interface BWInferenceFinalRectCropDescriptor
+ (id)finalCropRectDescriptorWithName:(id)a3;
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3;
- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4;
- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (NSString)description;
- (char)identifier;
- (void)dealloc;
- (void)initWithName:(void *)a1;
@end

@implementation BWInferenceFinalRectCropDescriptor

- (char)identifier
{
  return 1;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p>: name: %@", objc_opt_class(), self, self->_name];
}

+ (id)finalCropRectDescriptorWithName:(id)a3
{
  v3 = -[BWInferenceFinalRectCropDescriptor initWithName:]([BWInferenceFinalRectCropDescriptor alloc], a3);
  return v3;
}

- (void)initWithName:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWInferenceFinalRectCropDescriptor;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceFinalRectCropDescriptor;
  [(BWInferenceFinalRectCropDescriptor *)&v3 dealloc];
}

- (CGRect)rectForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  long long v7 = *MEMORY[0x1E4F1DB20];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  FigCFDictionaryGetCGRectIfPresent();
  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v6 = *((double *)&v8 + 1);
  double v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)applicableToSampleBuffer:(opaqueCMSampleBuffer *)a3 forMediaKey:(id)a4
{
  return 1;
}

- ($2825F4736939C4A6D3AD43837233062D)maxCropForDimensions:(id)a3
{
  return a3;
}

@end