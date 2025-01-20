@interface MLCReshapeLayer(CoreMLModelSpecification)
+ (id)flattenLayerWithTensor:()CoreMLModelSpecification flattenParams:batchSize:error:;
+ (id)reshapeLayer:()CoreMLModelSpecification batchSize:error:;
+ (id)reshapeStaticLayer:()CoreMLModelSpecification batchSize:error:;
@end

@implementation MLCReshapeLayer(CoreMLModelSpecification)

+ (id)reshapeStaticLayer:()CoreMLModelSpecification batchSize:error:
{
  uint64_t v6 = *(unsigned int *)(a3 + 16);
  v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  [v7 addObject:v8];

  if ((int)v6 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      if (v6 != 4 || v9)
      {
        v10 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + v9 + 8)];
        [v7 addObject:v10];
      }
      v9 += 8;
    }
    while (8 * v6 != v9);
  }
  v11 = +[MLNeuralNetworkMLComputeLayer reshapeLayerWithChannelFirstOrderingAndTargetShape:v7];

  return v11;
}

+ (id)reshapeLayer:()CoreMLModelSpecification batchSize:error:
{
  v20[4] = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a3 + 36) != 1)
  {
    int v9 = *(_DWORD *)(a3 + 16);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    if (v9 == 3)
    {
      v11 = [NSNumber numberWithUnsignedInteger:a4];
      v18[0] = v11;
      v12 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 8)];
      v18[1] = v12;
      v13 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 16)];
      v18[2] = v13;
      v14 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 24)];
      v18[3] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];
    }
    else
    {
      if (v9 != 4)
      {
        if (a5)
        {
          +[MLModelErrorUtils updateErrorWithFormat:@"Target shape size is not valid. It must be either 3 or 4."];
          uint64_t v6 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v6 = 0;
        }
        goto LABEL_14;
      }
      if (*(void *)(*(void *)(a3 + 24) + 8) == 1)
      {
        v11 = [NSNumber numberWithUnsignedInteger:a4];
        v19[0] = v11;
        v12 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 16)];
        v19[1] = v12;
        v13 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 24)];
        v19[2] = v13;
        v14 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 32)];
        v19[3] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
      }
      else
      {
        v11 = [NSNumber numberWithUnsignedInteger:a4];
        v20[0] = v11;
        v12 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 24)];
        v20[1] = v12;
        v13 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 16)];
        v20[2] = v13;
        v14 = [NSNumber numberWithLongLong:*(void *)(*(void *)(a3 + 24) + 8)];
        v20[3] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
      }
    }
    v16 = (void *)v15;

    uint64_t v6 = +[MLNeuralNetworkMLComputeLayer reshapeLayerWithChannelFirstOrderingAndTargetShape:v16];
    id v10 = v16;
LABEL_14:

    goto LABEL_15;
  }
  if (a5)
  {
    +[MLModelErrorUtils errorWithCode:6 format:@"CHANNEL_LAST mode for reshape layer not supported"];
    uint64_t v6 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_15:

  return v6;
}

+ (id)flattenLayerWithTensor:()CoreMLModelSpecification flattenParams:batchSize:error:
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = v9;
  if (*(_DWORD *)(a4 + 16) == 1)
  {
    if (a6)
    {
      +[MLModelErrorUtils errorWithCode:6 format:@"CHANNEL_LAST mode for flatten layer not supported"];
      v11 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v12 = [v9 descriptor];
    v13 = [v12 shape];

    v14 = [v13 objectAtIndexedSubscript:3];
    uint64_t v15 = [v14 unsignedIntegerValue];
    v16 = [v13 objectAtIndexedSubscript:2];
    uint64_t v17 = [v16 unsignedIntegerValue];
    v18 = [v13 objectAtIndexedSubscript:1];
    uint64_t v19 = [v18 unsignedIntegerValue];

    v20 = [NSNumber numberWithUnsignedInteger:a5];
    v24[0] = v20;
    v21 = [NSNumber numberWithUnsignedInteger:v17 * v15 * v19];
    v24[1] = v21;
    v24[2] = &unk_1EF11A640;
    v24[3] = &unk_1EF11A640;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];

    v11 = +[MLNeuralNetworkMLComputeLayer reshapeLayerWithChannelFirstOrderingAndTargetShape:v22];
  }

  return v11;
}

@end