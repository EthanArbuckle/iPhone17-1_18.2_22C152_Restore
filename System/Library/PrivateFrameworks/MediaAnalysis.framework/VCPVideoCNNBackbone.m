@interface VCPVideoCNNBackbone
+ (id)sharedModel:(id)a3 outputNames:(id)a4 properties:(id)a5;
- (NSData)tensorBeforeTemporalPooling;
- (VCPVideoCNNBackbone)initWithConfig:(id)a3;
- (float)outputBeforeFc;
- (float)outputBeforeFcSettling;
- (float)outputBeforeSpatiialPooling;
- (float)outputBeforeTemporalPooling;
- (float)outputRes4;
- (int)inference:(float *)a3 settling:(BOOL)a4;
@end

@implementation VCPVideoCNNBackbone

+ (id)sharedModel:(id)a3 outputNames:(id)a4 properties:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[VCPSharedInstanceManager sharedManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__VCPVideoCNNBackbone_sharedModel_outputNames_properties___block_invoke;
  v16[3] = &unk_1E62990C0;
  id v11 = v7;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  id v13 = v9;
  id v19 = v13;
  v14 = [v10 sharedInstanceWithIdentifier:@"VCPVideoCNNBackboneEspresso" andCreationBlock:v16];

  return v14;
}

VCPCNNModelEspresso *__58__VCPVideoCNNBackbone_sharedModel_outputNames_properties___block_invoke(void *a1)
{
  v1 = [[VCPCNNModelEspresso alloc] initWithParameters:a1[4] inputNames:0 outputNames:a1[5] properties:a1[6]];
  return v1;
}

- (VCPVideoCNNBackbone)initWithConfig:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_outputBeforeFc = 0;
  self->_outputBeforeFcSettling = 0;
  v5 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
  v6 = [v5 resourceURL];

  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"video_backbone.espresso.net" relativeToURL:v6];
  v22.receiver = self;
  v22.super_class = (Class)VCPVideoCNNBackbone;
  id v8 = [(VCPVideoCNNBackbone *)&v22 init];
  id v9 = v8;
  if (!v8) {
    goto LABEL_7;
  }
  outputNames = v8->_outputNames;
  v8->_outputNames = (NSArray *)&unk_1F15EE100;

  BOOL v11 = DeviceGeqD5x();
  v23[0] = @"forceNNGraph";
  id v12 = [NSNumber numberWithBool:v11 ^ 1];
  v24[0] = v12;
  v23[1] = @"sharedContext";
  id v13 = [NSNumber numberWithBool:v11];
  v24[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  if (DeviceHasANE())
  {
    v15 = [(id)objc_opt_class() sharedModel:v7 outputNames:v9->_outputNames properties:v14];
  }
  else
  {
    v15 = [[VCPCNNModelEspresso alloc] initWithParameters:v7 inputNames:0 outputNames:v9->_outputNames properties:v14];
  }
  modelEspresso = v9->_modelEspresso;
  v9->_modelEspresso = v15;

  id v17 = v9->_modelEspresso;
  if (!v17)
  {

    goto LABEL_9;
  }
  int v18 = [(VCPCNNModelEspresso *)v17 prepareModelWithConfig:v4];

  if (v18)
  {
LABEL_9:
    id v19 = 0;
    goto LABEL_10;
  }
LABEL_7:
  id v19 = v9;
LABEL_10:
  v20 = v19;

  return v20;
}

- (int)inference:(float *)a3 settling:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(VCPCNNModelEspresso *)self->_modelEspresso espressoForward:a3];
  if (!v6)
  {
    if (v4)
    {
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      self->_outputBeforeFcSettling = (float *)__p[21];
      operator delete(__p);
    }
    else
    {
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      self->_outputBeforeSpatiialPooling = (float *)*__p;
      operator delete(__p);
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      self->_outputBeforeFc = (float *)__p[21];
      operator delete(__p);
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      self->_outputRes4 = (float *)__p[42];
      operator delete(__p);
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      self->_outputBeforeTemporalPooling = (float *)__p[63];
      operator delete(__p);
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      uint64_t v7 = __p[65];
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      uint64_t v8 = v18[66];
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      uint64_t v9 = v17[67];
      [(VCPCNNModelEspresso *)self->_modelEspresso outputBlobs];
      uint64_t v10 = v16[68];
      operator delete(v16);
      if (v17) {
        operator delete(v17);
      }
      uint64_t v11 = v8 * v7;
      if (v18) {
        operator delete(v18);
      }
      uint64_t v12 = v9 * v11;
      if (__p) {
        operator delete(__p);
      }
      id v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_outputBeforeTemporalPooling length:4 * v12 * v10];
      tensorBeforeTemporalPooling = self->_tensorBeforeTemporalPooling;
      self->_tensorBeforeTemporalPooling = v13;
    }
  }
  return v6;
}

- (float)outputBeforeFc
{
  return self->_outputBeforeFc;
}

- (float)outputBeforeFcSettling
{
  return self->_outputBeforeFcSettling;
}

- (float)outputBeforeSpatiialPooling
{
  return self->_outputBeforeSpatiialPooling;
}

- (float)outputRes4
{
  return self->_outputRes4;
}

- (float)outputBeforeTemporalPooling
{
  return self->_outputBeforeTemporalPooling;
}

- (NSData)tensorBeforeTemporalPooling
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tensorBeforeTemporalPooling, 0);
  objc_storeStrong((id *)&self->_outputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
}

@end