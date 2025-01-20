@interface CRMLFlatModel
- (const)codeMap;
- (id)modelName;
- (int)classCount;
@end

@implementation CRMLFlatModel

- (id)modelName
{
  return @"cc_flat_model.mlmodelc";
}

- (const)codeMap
{
  return (const int *)&kModelCCFCodeMap;
}

- (int)classCount
{
  return 43;
}

@end