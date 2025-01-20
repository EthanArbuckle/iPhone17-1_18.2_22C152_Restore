@interface VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations
- (VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations)init;
- (id)allConfigurations;
- (id)configurationForRequest:(id)a3;
- (unint64_t)configurationsCount;
@end

@implementation VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations

- (void).cxx_destruct
{
}

- (VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations)init
{
  v6.receiver = self;
  v6.super_class = (Class)VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations;
  v2 = [(VNCoreSceneUnderstandingCompoundRequestDetectorConfigurations *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    configurations = v2->_configurations;
    v2->_configurations = v3;
  }
  return v2;
}

- (id)allConfigurations
{
  v2 = [(NSMutableDictionary *)self->_configurations allValues];
  v3 = (void *)[v2 copy];

  return v3;
}

- (unint64_t)configurationsCount
{
  return [(NSMutableDictionary *)self->_configurations count];
}

- (id)configurationForRequest:(id)a3
{
  id v4 = a3;
  [v4 regionOfInterest];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  if (objc_opt_respondsToSelector()) {
    uint64_t v13 = ((uint64_t (*)(id, char *))[v4 methodForSelector:sel_imageCropAndScaleOption])(v4, sel_imageCropAndScaleOption);
  }
  else {
    uint64_t v13 = 2;
  }
  id v21 = 0;
  v14 = objc_msgSend(v4, "applicableDetectorClassAndOptions:forRevision:error:", &v21, objc_msgSend(v4, "resolvedRevision"), 0);
  id v15 = v21;
  +[VNError VNAssert:v14 != 0 log:@"detector class could not be resolved"];
  v16 = [v14 computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v15 error:0];
  +[VNError VNAssert:v16 != 0 log:@"main stage compute device could not be resolved"];
  v17 = (void *)[[NSString alloc] initWithFormat:@"[%g,%g,%g,%g]:%@:%u", v6, v8, v10, v12, v16, v13];
  v18 = [(NSMutableDictionary *)self->_configurations objectForKeyedSubscript:v17];
  if (!v18)
  {
    v18 = [[VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration alloc] initWithMainStageComputeDevice:v16];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_configurations, "setObject:forKeyedSubscript:");
  }
  [(VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration *)v18 addOriginalRequest:v4];
  v19 = [NSNumber numberWithUnsignedInteger:v13];
  [(VNCoreSceneUnderstandingCompoundRequestDetectorConfiguration *)v18 setDetectorConfigurationOption:@"VNDetectorProcessOption_ImageCropAndScaleOption" value:v19];

  return v18;
}

@end