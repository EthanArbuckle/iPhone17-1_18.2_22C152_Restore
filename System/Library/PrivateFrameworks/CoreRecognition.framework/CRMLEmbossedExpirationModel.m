@interface CRMLEmbossedExpirationModel
- (const)codeMap;
- (id)decodeActivations:(void *)a3;
- (id)modelName;
- (int)classCount;
@end

@implementation CRMLEmbossedExpirationModel

- (id)modelName
{
  return @"cc_excnnfs_model.mlmodelc";
}

- (const)codeMap
{
  return (const int *)&kExCNNFSCodeMap;
}

- (int)classCount
{
  return 33;
}

- (id)decodeActivations:(void *)a3
{
  v5 = [(CRMLEmbossedExpirationModel *)self codeMap];
  [(CRMLEmbossedExpirationModel *)self classCount];
  return decodeCreditCardExpirationActivations((uint64_t **)a3, v5);
}

@end