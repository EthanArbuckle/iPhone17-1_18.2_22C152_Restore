@interface VNFgBgE5MLInstanceSegmenterConfiguration
+ (id)configurationForRevision:(unint64_t)a3 error:(id *)a4;
- (CGSize)inputSize;
- (NSArray)inputTensorNames;
- (NSArray)modelOutputInstanceInvalidCocoCategory;
- (NSArray)modelOutputInstanceInvalidMiyoshiCategory;
- (NSArray)outputTensorNames;
- (NSString)inputImageName;
- (NSURL)modelURL;
- (VNFgBgE5MLInstanceSegmenterThresholds)thresholds;
- (id)initDefaultConfig;
- (int)maxSpatialLength;
- (int)queryNumber;
- (int)radius;
- (unint64_t)revision;
@end

@implementation VNFgBgE5MLInstanceSegmenterConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholds, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_modelOutputInstanceInvalidCocoCategory, 0);
  objc_storeStrong((id *)&self->_modelOutputInstanceInvalidMiyoshiCategory, 0);
  objc_storeStrong((id *)&self->_outputTensorNames, 0);
  objc_storeStrong((id *)&self->_inputTensorNames, 0);

  objc_storeStrong((id *)&self->_inputImageName, 0);
}

- (VNFgBgE5MLInstanceSegmenterThresholds)thresholds
{
  return (VNFgBgE5MLInstanceSegmenterThresholds *)objc_getProperty(self, a2, 80, 1);
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)modelOutputInstanceInvalidCocoCategory
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)modelOutputInstanceInvalidMiyoshiCategory
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)outputTensorNames
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)inputTensorNames
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)inputImageName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (int)radius
{
  return self->_radius;
}

- (int)maxSpatialLength
{
  return self->_maxSpatialLength;
}

- (int)queryNumber
{
  return self->_queryNumber;
}

- (CGSize)inputSize
{
  objc_copyStruct(v4, &self->_inputSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (id)initDefaultConfig
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VNFgBgE5MLInstanceSegmenterConfiguration;
  double v2 = [(VNFgBgE5MLInstanceSegmenterConfiguration *)&v19 init];
  double v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 88) = xmmword_1A410C4C0;
    *((void *)v2 + 1) = 0x4000000001ELL;
    *((_DWORD *)v2 + 4) = 4;
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 3) = 1;
    *((void *)v2 + 4) = @"input";

    v5 = (void *)v3[5];
    v3[5] = &unk_1EF7A7EE0;

    v6 = (void *)v3[6];
    v3[6] = &unk_1EF7A7EF8;

    v7 = (void *)v3[7];
    v3[7] = &unk_1EF7A7F10;

    v8 = (void *)v3[8];
    v3[8] = &unk_1EF7A7F28;

    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = (void *)MEMORY[0x1E4F1CB10];
    v11 = [v9 resourcePath];
    v20[0] = v11;
    v20[1] = @"foregroundbackgroundsegmenter.mlmodelc";
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v13 = [v10 fileURLWithPathComponents:v12];

    v14 = (void *)v3[9];
    v3[9] = v13;
    id v15 = v13;

    v16 = [[VNFgBgE5MLInstanceSegmenterThresholds alloc] initWithRevision:1 error:0];
    v17 = (void *)v3[10];
    v3[10] = v16;
  }
  return v3;
}

+ (id)configurationForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 1)
  {
    v4 = (void *)[objc_alloc((Class)a1) initDefaultConfig];
  }
  else
  {
    if (a4)
    {
      v6 = +[VNFgBgInstanceSegmenterError genericErrorConfigDescription];
      *a4 = +[VNFgBgInstanceSegmenterError errorWithCode:-4 description:v6];
    }
    v4 = 0;
  }

  return v4;
}

@end