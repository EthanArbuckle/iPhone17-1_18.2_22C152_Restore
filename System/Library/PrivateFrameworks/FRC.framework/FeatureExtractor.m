@interface FeatureExtractor
+ (unint64_t)numLevels;
- (BOOL)baseStage;
- (BOOL)extractFeaturesFromImage:(__CVBuffer *)a3 toFeatures:(id *)a4 callback:(id)a5;
- (FeatureExtractor)initWithMode:(int64_t)a3;
- (FeatureExtractor)initWithMode:(int64_t)a3 revision:(int64_t)a4;
- (int64_t)revision;
- (unint64_t)outputChannels;
- (void)getOutputTensorSize:(id *)a3 level:(unsigned int)a4;
- (void)setBaseStage:(BOOL)a3;
- (void)setOutputChannels:(unint64_t)a3;
- (void)setRevision:(int64_t)a3;
- (void)setupNetworkModel;
@end

@implementation FeatureExtractor

+ (unint64_t)numLevels
{
  return 5;
}

- (FeatureExtractor)initWithMode:(int64_t)a3
{
  return [(FeatureExtractor *)self initWithMode:a3 revision:1];
}

- (FeatureExtractor)initWithMode:(int64_t)a3 revision:(int64_t)a4
{
  -[EspressoModel setUsage:](self, "setUsage:");
  [(FeatureExtractor *)self setRevision:a4];
  [(FeatureExtractor *)self setupNetworkModel];
  espresso_file = self->_espresso_file;
  v11.receiver = self;
  v11.super_class = (Class)FeatureExtractor;
  v8 = [(EspressoModel *)&v11 initWithModelName:espresso_file usage:a3];
  if (v8)
  {
    v8->_numLevels = [(id)objc_opt_class() numLevels];
    v9 = v8;
  }

  return v8;
}

- (void)setupNetworkModel
{
  self->_inputBlob = "input_image";
  self->_outputBlobs = (const char **)&outputBlobNames;
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  FRCGetInputFrameSizeForUsage([(EspressoModel *)self usage], (uint64_t *)&v8, &v7);
  if (v8 < 0x3E9) {
    [NSString stringWithFormat:@"optical_flow_feature_extractor_pyrlite"];
  }
  else {
  v3 = [NSString stringWithFormat:@"optical_flow_feature_extractor_pyrlite_HD"];
  }
  espresso_file = self->_espresso_file;
  self->_espresso_file = v3;

  if (self->_revision != 1)
  {
    v5 = [(NSString *)self->_espresso_file stringByAppendingFormat:@"_rev%ld", self->_revision];
    v6 = self->_espresso_file;
    self->_espresso_file = v5;
  }
}

- (BOOL)extractFeaturesFromImage:(__CVBuffer *)a3 toFeatures:(id *)a4 callback:(id)a5
{
  id v6 = a5;
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    NSLog(&cfstr_Featureexracto.isa);
LABEL_3:
    BOOL v7 = 0;
    goto LABEL_11;
  }
  if (self->_numLevels)
  {
    unint64_t v8 = 0;
    while (!espresso_network_bind_direct_cvpixelbuffer())
    {
      unint64_t v8 = (v8 + 1);
      if (self->_numLevels <= v8) {
        goto LABEL_8;
      }
    }
    NSLog(&cfstr_Featureexracto_0.isa, v8);
    goto LABEL_3;
  }
LABEL_8:
  kdebug_trace();
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v6;
  int v9 = espresso_plan_submit();
  BOOL v7 = v9 == 0;
  if (v9) {
    NSLog(&cfstr_Featureextract.isa, [(EspressoModel *)self usage], v11, 3221225472, __65__FeatureExtractor_extractFeaturesFromImage_toFeatures_callback___block_invoke, &unk_1E6CA4238, v12);
  }

LABEL_11:
  return v7;
}

uint64_t __65__FeatureExtractor_extractFeaturesFromImage_toFeatures_callback___block_invoke(uint64_t a1)
{
  kdebug_trace();
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)getOutputTensorSize:(id *)a3 level:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11[0] = xmmword_1DC85A400;
  v11[1] = xmmword_1DC85A410;
  v11[2] = xmmword_1DC85A420;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  FRCGetInputFrameSizeForUsage([(EspressoModel *)self usage], &v10, &v9);
  uint64_t v7 = v9;
  uint64_t v6 = v10;
  unsigned int v8 = a4 + 1;
  do
  {
    uint64_t v6 = (unint64_t)(v6 + 1) >> 1;
    uint64_t v7 = (unint64_t)(v7 + 1) >> 1;
    --v8;
  }
  while (v8);
  a3->var0 = v6;
  a3->var1 = v7;
  a3->var2 = *((void *)v11 + a4);
}

- (unint64_t)outputChannels
{
  return self->_outputChannels;
}

- (void)setOutputChannels:(unint64_t)a3
{
  self->_outputChannels = a3;
}

- (BOOL)baseStage
{
  return self->_baseStage;
}

- (void)setBaseStage:(BOOL)a3
{
  self->_baseStage = a3;
}

- (int64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(int64_t)a3
{
  self->_revision = a3;
}

- (void).cxx_destruct
{
}

@end