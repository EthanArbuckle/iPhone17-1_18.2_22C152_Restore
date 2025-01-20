@interface CRMLEmbossedCardholderModel
- (const)codeMap;
- (id)decodeActivations:(void *)a3;
- (id)modelName;
- (int)classCount;
@end

@implementation CRMLEmbossedCardholderModel

- (id)modelName
{
  return @"cc_chcnnfs_model.mlmodelc";
}

- (const)codeMap
{
  return (const int *)&kChCNNFSCodeMap;
}

- (int)classCount
{
  return 33;
}

- (id)decodeActivations:(void *)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v5 = [(CRMLEmbossedCardholderModel *)self codeMap];
  [(CRMLEmbossedCardholderModel *)self classCount];
  v6 = decodeCreditCardholderActivations((uint64_t **)a3, v5);
  v9 = @"arrayResult";
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

@end