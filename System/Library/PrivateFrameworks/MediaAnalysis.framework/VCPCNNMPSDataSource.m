@interface VCPCNNMPSDataSource
- (BOOL)load;
- (VCPCNNMPSDataSource)initWith:(unsigned int)a3 convolutionDescriptor:(id)a4 kernelWeights:(void *)a5 biasTerm:(float *)a6;
- (float)biasTerms;
- (id)descriptor;
- (id)label;
- (unsigned)dataType;
- (void)weights;
@end

@implementation VCPCNNMPSDataSource

- (VCPCNNMPSDataSource)initWith:(unsigned int)a3 convolutionDescriptor:(id)a4 kernelWeights:(void *)a5 biasTerm:(float *)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VCPCNNMPSDataSource;
  v12 = [(VCPCNNMPSDataSource *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_dataType = a3;
    objc_storeStrong((id *)&v12->_descriptor, a4);
    v13->_kernelWeights = a5;
    v13->_biasTerms = a6;
  }

  return v13;
}

- (unsigned)dataType
{
  return self->_dataType;
}

- (id)descriptor
{
  return self->_descriptor;
}

- (void)weights
{
  return self->_kernelWeights;
}

- (float)biasTerms
{
  return self->_biasTerms;
}

- (BOOL)load
{
  return 1;
}

- (id)label
{
  return @"VCPCNNMPSDataSource";
}

- (void).cxx_destruct
{
}

@end