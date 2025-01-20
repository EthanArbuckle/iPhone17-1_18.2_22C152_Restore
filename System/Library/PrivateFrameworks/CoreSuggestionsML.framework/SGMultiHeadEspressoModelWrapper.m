@interface SGMultiHeadEspressoModelWrapper
- (NSDictionary)headDimensionality;
- (NSString)espressoModelFile;
- (NSString)inputName;
- (_PASLazyPurgeableResult)model;
- (void)setEspressoModelFile:(id)a3;
- (void)setHeadDimensionality:(id)a3;
- (void)setInputName:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation SGMultiHeadEspressoModelWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_headDimensionality, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_espressoModelFile, 0);
}

- (void)setModel:(id)a3
{
}

- (_PASLazyPurgeableResult)model
{
  return self->_model;
}

- (void)setHeadDimensionality:(id)a3
{
}

- (NSDictionary)headDimensionality
{
  return self->_headDimensionality;
}

- (void)setInputName:(id)a3
{
}

- (NSString)inputName
{
  return self->_inputName;
}

- (void)setEspressoModelFile:(id)a3
{
}

- (NSString)espressoModelFile
{
  return self->_espressoModelFile;
}

@end