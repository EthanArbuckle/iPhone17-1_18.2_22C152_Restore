@interface FlowAdaptationFeatureExtractor
+ (unint64_t)numLevels;
- (BOOL)extractFeaturesFromImage:(__CVBuffer *)a3 toFeatures:(id *)a4 callback:(id)a5;
- (FlowAdaptationFeatureExtractor)initWithMode:(int64_t)a3;
- (FlowAdaptationFeatureExtractor)initWithMode:(int64_t)a3 revision:(int64_t)a4;
- (void)getOutputTensorSize:(id *)a3 level:(unsigned int)a4;
- (void)setupNetworkModel;
@end

@implementation FlowAdaptationFeatureExtractor

+ (unint64_t)numLevels
{
  return 1;
}

- (FlowAdaptationFeatureExtractor)initWithMode:(int64_t)a3
{
  return [(FlowAdaptationFeatureExtractor *)self initWithMode:a3 revision:1];
}

- (FlowAdaptationFeatureExtractor)initWithMode:(int64_t)a3 revision:(int64_t)a4
{
  -[EspressoModel setUsage:](self, "setUsage:");
  [(FeatureExtractor *)self setRevision:a4];
  [(FlowAdaptationFeatureExtractor *)self setupNetworkModel];
  espresso_file = self->super._espresso_file;
  v10.receiver = self;
  v10.super_class = (Class)FlowAdaptationFeatureExtractor;
  v8 = [(EspressoModel *)&v10 initWithModelName:espresso_file usage:a3];
  if (!v8) {
    NSLog(&cfstr_ErrorFailedToC_14.isa, a3);
  }
  return v8;
}

- (void)setupNetworkModel
{
  self->super._inputBlob = "0";
  self->super._outputBlobs = (const char **)&outputBlobNames_2;
  espresso_file = self->super._espresso_file;
  self->super._espresso_file = (NSString *)@"flow_adaptation_feature_extractor";

  if ([(FeatureExtractor *)self revision] != 1)
  {
    self->super._espresso_file = [(NSString *)self->super._espresso_file stringByAppendingFormat:@"_rev%ld", [(FeatureExtractor *)self revision]];
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)extractFeaturesFromImage:(__CVBuffer *)a3 toFeatures:(id *)a4 callback:(id)a5
{
  id v6 = a5;
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(&cfstr_Flowadaptation_0.isa);
LABEL_5:
    BOOL v7 = 0;
    goto LABEL_6;
  }
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(&cfstr_Flowadaptation_1.isa);
    goto LABEL_5;
  }
  uint64_t v10 = MEMORY[0x1E4F143A8];
  id v11 = v6;
  int v9 = espresso_plan_submit();
  BOOL v7 = v9 == 0;
  if (v9) {
    NSLog(&cfstr_Flowadaptation_2.isa, [(EspressoModel *)self usage], v10, 3221225472, __79__FlowAdaptationFeatureExtractor_extractFeaturesFromImage_toFeatures_callback___block_invoke, &unk_1E6CA4238, v11);
  }

LABEL_6:
  return v7;
}

uint64_t __79__FlowAdaptationFeatureExtractor_extractFeaturesFromImage_toFeatures_callback___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getOutputTensorSize:(id *)a3 level:(unsigned int)a4
{
  v5.receiver = self;
  v5.super_class = (Class)FlowAdaptationFeatureExtractor;
  [(FeatureExtractor *)&v5 getOutputTensorSize:a3 level:0];
  *(uint64x2_t *)&a3->var0 = vshrq_n_u64(*(uint64x2_t *)&a3->var0, 1uLL);
  a3->var2 = 64;
}

@end