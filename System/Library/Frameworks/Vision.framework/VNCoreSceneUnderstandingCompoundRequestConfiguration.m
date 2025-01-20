@interface VNCoreSceneUnderstandingCompoundRequestConfiguration
- (NSArray)originalRequestConfigurations;
- (NSDictionary)detectorConfigurationOptions;
- (NSString)detectorType;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDetectorConfigurationOptions:(id)a3;
- (void)setDetectorType:(id)a3;
- (void)setOriginalRequestConfigurations:(id)a3;
@end

@implementation VNCoreSceneUnderstandingCompoundRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequestConfigurations, 0);
  objc_storeStrong((id *)&self->_detectorConfigurationOptions, 0);

  objc_storeStrong((id *)&self->_detectorType, 0);
}

- (void)setOriginalRequestConfigurations:(id)a3
{
}

- (NSArray)originalRequestConfigurations
{
  return self->_originalRequestConfigurations;
}

- (void)setDetectorConfigurationOptions:(id)a3
{
}

- (NSDictionary)detectorConfigurationOptions
{
  return self->_detectorConfigurationOptions;
}

- (void)setDetectorType:(id)a3
{
}

- (NSString)detectorType
{
  return self->_detectorType;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNCoreSceneUnderstandingCompoundRequestConfiguration;
  id v4 = [(VNRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setDetectorType:self->_detectorType];
    [v5 setDetectorConfigurationOptions:self->_detectorConfigurationOptions];
    [v5 setOriginalRequestConfigurations:self->_originalRequestConfigurations];
  }
  return v5;
}

@end