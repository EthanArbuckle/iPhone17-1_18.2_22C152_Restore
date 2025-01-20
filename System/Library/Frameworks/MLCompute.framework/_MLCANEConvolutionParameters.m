@interface _MLCANEConvolutionParameters
+ (id)convolutionUnitParametersWith:(id)a3 biasParams:(id)a4 neuronParams:(id)a5;
- (NSArray)neuronParams;
- (NSDictionary)biasParams;
- (NSDictionary)convolutionParams;
- (_MLCANEConvolutionParameters)initWithConvolutionParams:(id)a3 biasParams:(id)a4 neuronParams:(id)a5;
@end

@implementation _MLCANEConvolutionParameters

+ (id)convolutionUnitParametersWith:(id)a3 biasParams:(id)a4 neuronParams:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithConvolutionParams:v10 biasParams:v9 neuronParams:v8];

  return v11;
}

- (_MLCANEConvolutionParameters)initWithConvolutionParams:(id)a3 biasParams:(id)a4 neuronParams:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_MLCANEConvolutionParameters;
  v12 = [(_MLCANEConvolutionParameters *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_convolutionParams, a3);
    objc_storeStrong((id *)&v13->_biasParams, a4);
    objc_storeStrong((id *)&v13->_neuronParams, a5);
  }

  return v13;
}

- (NSDictionary)convolutionParams
{
  return self->_convolutionParams;
}

- (NSDictionary)biasParams
{
  return self->_biasParams;
}

- (NSArray)neuronParams
{
  return self->_neuronParams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuronParams, 0);
  objc_storeStrong((id *)&self->_biasParams, 0);

  objc_storeStrong((id *)&self->_convolutionParams, 0);
}

@end