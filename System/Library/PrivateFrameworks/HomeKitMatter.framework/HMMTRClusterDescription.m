@interface HMMTRClusterDescription
- (BOOL)syncWriteFunc;
- (Class)clusterClass;
- (Class)paramsClass;
- (HMMTRClusterDescription)initWithClass:(id)a3 selectorString:(id)a4;
- (NSDictionary)arguments;
- (NSDictionary)paramsArguments;
- (NSNumber)attributeID;
- (NSNumber)clusterID;
- (NSNumber)paramsIndex;
- (NSNumber)primaryArgIndex;
- (NSString)primaryArgType;
- (SEL)clusterSelector;
- (id)mapValue;
- (id)mapWriteValueToExpectedValues;
- (id)primaryArg;
- (void)setArguments:(id)a3;
- (void)setAttributeID:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setMapValue:(id)a3;
- (void)setMapWriteValueToExpectedValues:(id)a3;
- (void)setParamsArguments:(id)a3;
- (void)setParamsClass:(Class)a3;
- (void)setParamsIndex:(id)a3;
- (void)setPrimaryArg:(id)a3;
- (void)setPrimaryArgIndex:(id)a3;
- (void)setPrimaryArgType:(id)a3;
- (void)setSyncWriteFunc:(BOOL)a3;
@end

@implementation HMMTRClusterDescription

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mapWriteValueToExpectedValues, 0);
  objc_storeStrong((id *)&self->_paramsArguments, 0);
  objc_storeStrong((id *)&self->_paramsIndex, 0);
  objc_storeStrong((id *)&self->_paramsClass, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_primaryArgType, 0);
  objc_storeStrong(&self->_primaryArg, 0);
  objc_storeStrong((id *)&self->_primaryArgIndex, 0);
  objc_storeStrong(&self->_mapValue, 0);
  objc_storeStrong((id *)&self->_attributeID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_clusterClass, 0);
}

- (void)setSyncWriteFunc:(BOOL)a3
{
  self->_syncWriteFunc = a3;
}

- (BOOL)syncWriteFunc
{
  return self->_syncWriteFunc;
}

- (void)setMapWriteValueToExpectedValues:(id)a3
{
}

- (id)mapWriteValueToExpectedValues
{
  return self->_mapWriteValueToExpectedValues;
}

- (void)setParamsArguments:(id)a3
{
}

- (NSDictionary)paramsArguments
{
  return self->_paramsArguments;
}

- (void)setParamsIndex:(id)a3
{
}

- (NSNumber)paramsIndex
{
  return self->_paramsIndex;
}

- (void)setParamsClass:(Class)a3
{
}

- (Class)paramsClass
{
  return self->_paramsClass;
}

- (void)setArguments:(id)a3
{
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void)setPrimaryArgType:(id)a3
{
}

- (NSString)primaryArgType
{
  return self->_primaryArgType;
}

- (void)setPrimaryArg:(id)a3
{
}

- (id)primaryArg
{
  return self->_primaryArg;
}

- (void)setPrimaryArgIndex:(id)a3
{
}

- (NSNumber)primaryArgIndex
{
  return self->_primaryArgIndex;
}

- (void)setMapValue:(id)a3
{
}

- (id)mapValue
{
  return self->_mapValue;
}

- (void)setAttributeID:(id)a3
{
}

- (NSNumber)attributeID
{
  return self->_attributeID;
}

- (void)setClusterID:(id)a3
{
}

- (NSNumber)clusterID
{
  return self->_clusterID;
}

- (SEL)clusterSelector
{
  return self->_clusterSelector;
}

- (Class)clusterClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (HMMTRClusterDescription)initWithClass:(id)a3 selectorString:(id)a4
{
  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRClusterDescription;
  v8 = [(HMMTRClusterDescription *)&v12 init];
  if (v8)
  {
    uint64_t v9 = NSClassFromString(v6);
    Class clusterClass = v8->_clusterClass;
    v8->_Class clusterClass = (Class)v9;

    v8->_clusterSelector = NSSelectorFromString(v7);
  }

  return v8;
}

@end