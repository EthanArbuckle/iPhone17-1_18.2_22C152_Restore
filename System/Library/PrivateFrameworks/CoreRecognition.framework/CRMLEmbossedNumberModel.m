@interface CRMLEmbossedNumberModel
- (const)codeMap;
- (id)decodeActivations:(void *)a3;
- (id)modelName;
- (int)classCount;
@end

@implementation CRMLEmbossedNumberModel

- (id)modelName
{
  return @"cc_cncnnfs_model.mlmodelc";
}

- (const)codeMap
{
  return (const int *)&kCnCNNFSCodeMap;
}

- (int)classCount
{
  return 11;
}

- (id)decodeActivations:(void *)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v5 = [(CRMLEmbossedNumberModel *)self codeMap];
  [(CRMLEmbossedNumberModel *)self classCount];
  v6 = decodeCreditCardNumberActivations((uint64_t **)a3, v5);
  v9 = @"arrayResult";
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

@end