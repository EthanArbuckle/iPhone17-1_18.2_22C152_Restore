@interface MLCPoolingDescriptor
+ (MLCPoolingDescriptor)averagePoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes countIncludesPadding:(BOOL)countIncludesPadding;
+ (MLCPoolingDescriptor)averagePoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes countIncludesPadding:(BOOL)countIncludesPadding;
+ (MLCPoolingDescriptor)l2NormPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCPoolingDescriptor)l2NormPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCPoolingDescriptor)maxPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCPoolingDescriptor)maxPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCPoolingDescriptor)poolingDescriptorWithType:(MLCPoolingType)poolingType kernelSize:(NSUInteger)kernelSize stride:(NSUInteger)stride;
+ (MLCPoolingDescriptor)poolingDescriptorWithType:(int)a3 kernelSizes:(id)a4 strides:(id)a5 dilationRates:(id)a6 paddingPolicy:(int)a7 paddingSizes:(id)a8;
+ (MLCPoolingDescriptor)poolingDescriptorWithType:(int)a3 kernelSizes:(id)a4 strides:(id)a5 paddingPolicy:(int)a6 paddingSizes:(id)a7;
- (BOOL)countIncludesPadding;
- (BOOL)isEqual:(id)a3;
- (MLCPaddingPolicy)paddingPolicy;
- (MLCPoolingDescriptor)initWithType:(int)a3 kernelWidth:(unint64_t)a4 kernelHeight:(unint64_t)a5 strideInX:(unint64_t)a6 strideInY:(unint64_t)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 paddingPolicy:(int)a10 paddingSizeInX:(unint64_t)a11 paddingSizeInY:(unint64_t)a12 countIncludesPadding:(BOOL)a13;
- (MLCPoolingType)poolingType;
- (NSUInteger)dilationRateInX;
- (NSUInteger)dilationRateInY;
- (NSUInteger)kernelHeight;
- (NSUInteger)kernelWidth;
- (NSUInteger)paddingSizeInX;
- (NSUInteger)paddingSizeInY;
- (NSUInteger)strideInX;
- (NSUInteger)strideInY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLCPoolingDescriptor

- (id)description
{
  v7 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v7 stringWithFormat:@"%@: { poolingType=%d : kernelWidth=%lu : kernelHeight=%lu : strideInX=%lu : strideInY=%lu : dilationRateInX=%lu :  dilationRateInY=%lu : paddingPolicy=%d : paddingSizeInX=%lu : paddingSizeInY=%lu }", v4, -[MLCPoolingDescriptor poolingType](self, "poolingType"), -[MLCPoolingDescriptor kernelWidth](self, "kernelWidth"), -[MLCPoolingDescriptor kernelHeight](self, "kernelHeight"), -[MLCPoolingDescriptor strideInX](self, "strideInX"), -[MLCPoolingDescriptor strideInY](self, "strideInY"), -[MLCPoolingDescriptor dilationRateInX](self, "dilationRateInX"), -[MLCPoolingDescriptor dilationRateInY](self, "dilationRateInY"), -[MLCPoolingDescriptor paddingPolicy](self, "paddingPolicy"), -[MLCPoolingDescriptor paddingSizeInX](self, "paddingSizeInX"), -[MLCPoolingDescriptor paddingSizeInY](self, "paddingSizeInY")];

  return v5;
}

+ (MLCPoolingDescriptor)poolingDescriptorWithType:(MLCPoolingType)poolingType kernelSize:(NSUInteger)kernelSize stride:(NSUInteger)stride
{
  LOBYTE(v8) = 0;
  LODWORD(v7) = 0;
  v5 = (void *)[objc_alloc((Class)a1) initWithType:*(void *)&poolingType kernelWidth:kernelSize kernelHeight:kernelSize strideInX:stride strideInY:stride dilationRateInX:1 dilationRateInY:1 paddingPolicy:v7 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v8];

  return (MLCPoolingDescriptor *)v5;
}

+ (MLCPoolingDescriptor)poolingDescriptorWithType:(int)a3 kernelSizes:(id)a4 strides:(id)a5 paddingPolicy:(int)a6 paddingSizes:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = objc_alloc((Class)a1);
  v16 = [v14 objectAtIndexedSubscript:1];
  uint64_t v41 = [v16 unsignedIntegerValue];
  v17 = [v14 objectAtIndexedSubscript:0];

  uint64_t v18 = [v17 unsignedIntegerValue];
  v19 = [v13 objectAtIndexedSubscript:1];
  uint64_t v40 = [v19 unsignedIntegerValue];
  v20 = [v13 objectAtIndexedSubscript:0];

  uint64_t v21 = [v20 unsignedIntegerValue];
  if (v12)
  {
    uint64_t v37 = v21;
    [v12 objectAtIndexedSubscript:1];
    v38 = v17;
    v23 = uint64_t v22 = v10;
    uint64_t v24 = v18;
    v25 = v15;
    v26 = v19;
    int v27 = a6;
    uint64_t v28 = [v23 unsignedIntegerValue];
    [v12 objectAtIndexedSubscript:0];
    id v39 = v12;
    v30 = v29 = v16;
    uint64_t v31 = [v30 unsignedIntegerValue];
    LOBYTE(v36) = 0;
    LODWORD(v35) = v27;
    v19 = v26;
    uint64_t v32 = v22;
    v17 = v38;
    v33 = (void *)[v25 initWithType:v32 kernelWidth:v41 kernelHeight:v24 strideInX:v40 strideInY:v37 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v35 paddingSizeInX:v28 paddingSizeInY:v31 countIncludesPadding:v36];

    v16 = v29;
    id v12 = v39;
  }
  else
  {
    LOBYTE(v36) = 0;
    LODWORD(v35) = a6;
    v33 = (void *)[v15 initWithType:v10 kernelWidth:v41 kernelHeight:v18 strideInX:v40 strideInY:v21 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v35 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v36];
  }

  return (MLCPoolingDescriptor *)v33;
}

+ (MLCPoolingDescriptor)poolingDescriptorWithType:(int)a3 kernelSizes:(id)a4 strides:(id)a5 dilationRates:(id)a6 paddingPolicy:(int)a7 paddingSizes:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v43 = objc_alloc((Class)a1);
  uint64_t v18 = [v17 objectAtIndexedSubscript:1];
  uint64_t v42 = [v18 unsignedIntegerValue];
  v19 = [v17 objectAtIndexedSubscript:0];

  uint64_t v41 = [v19 unsignedIntegerValue];
  v20 = [v16 objectAtIndexedSubscript:1];
  uint64_t v39 = [v20 unsignedIntegerValue];
  uint64_t v21 = [v16 objectAtIndexedSubscript:0];

  uint64_t v22 = [v21 unsignedIntegerValue];
  uint64_t v40 = [v15 objectAtIndexedSubscript:1];
  uint64_t v38 = [v40 unsignedIntegerValue];
  v23 = [v15 objectAtIndexedSubscript:0];

  uint64_t v24 = [v23 unsignedIntegerValue];
  uint64_t v25 = v24;
  if (v14)
  {
    [v14 objectAtIndexedSubscript:1];
    v26 = uint64_t v37 = v18;
    uint64_t v35 = v22;
    int v27 = v19;
    uint64_t v28 = [v26 unsignedIntegerValue];
    [v14 objectAtIndexedSubscript:0];
    v29 = id v36 = v14;
    LOBYTE(v34) = 0;
    uint64_t v33 = v28;
    v19 = v27;
    LODWORD(v32) = a7;
    v30 = objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", v12, v42, v41, v39, v35, v38, v25, v32, v33, objc_msgSend(v29, "unsignedIntegerValue"), v34);

    id v14 = v36;
    uint64_t v18 = v37;
  }
  else
  {
    LOBYTE(v34) = 0;
    LODWORD(v32) = a7;
    v30 = (void *)[v43 initWithType:v12 kernelWidth:v42 kernelHeight:v41 strideInX:v39 strideInY:v22 dilationRateInX:v38 dilationRateInY:v24 paddingPolicy:v32 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v34];
  }

  return (MLCPoolingDescriptor *)v30;
}

+ (MLCPoolingDescriptor)maxPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  uint64_t v10 = paddingSizes;
  v11 = strides;
  uint64_t v12 = kernelSizes;
  id v13 = objc_alloc((Class)a1);
  id v14 = [(NSArray *)v12 objectAtIndexedSubscript:1];
  uint64_t v15 = [v14 unsignedIntegerValue];
  id v16 = [(NSArray *)v12 objectAtIndexedSubscript:0];

  uint64_t v17 = [v16 unsignedIntegerValue];
  uint64_t v18 = [(NSArray *)v11 objectAtIndexedSubscript:1];
  uint64_t v39 = [v18 unsignedIntegerValue];
  v19 = [(NSArray *)v11 objectAtIndexedSubscript:0];

  uint64_t v20 = [v19 unsignedIntegerValue];
  if (v10)
  {
    uint64_t v37 = v20;
    [(NSArray *)v10 objectAtIndexedSubscript:1];
    uint64_t v36 = v17;
    uint64_t v21 = v16;
    v23 = MLCPaddingPolicy v22 = paddingPolicy;
    uint64_t v24 = v15;
    uint64_t v25 = v18;
    id v26 = v13;
    uint64_t v27 = [v23 unsignedIntegerValue];
    [(NSArray *)v10 objectAtIndexedSubscript:0];
    uint64_t v38 = v10;
    v29 = uint64_t v28 = v14;
    LOBYTE(v35) = 0;
    uint64_t v34 = [v29 unsignedIntegerValue];
    LODWORD(v33) = v22;
    id v16 = v21;
    v30 = v26;
    uint64_t v18 = v25;
    uint64_t v31 = (void *)[v30 initWithType:1 kernelWidth:v24 kernelHeight:v36 strideInX:v39 strideInY:v37 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v33 paddingSizeInX:v27 paddingSizeInY:v34 countIncludesPadding:v35];

    id v14 = v28;
    uint64_t v10 = v38;
  }
  else
  {
    LOBYTE(v35) = 0;
    LODWORD(v33) = paddingPolicy;
    uint64_t v31 = (void *)[v13 initWithType:1 kernelWidth:v15 kernelHeight:v17 strideInX:v39 strideInY:v20 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v33 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v35];
  }

  return (MLCPoolingDescriptor *)v31;
}

+ (MLCPoolingDescriptor)maxPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  uint64_t v12 = paddingSizes;
  id v13 = dilationRates;
  id v14 = strides;
  uint64_t v15 = kernelSizes;
  id v16 = objc_alloc((Class)a1);
  uint64_t v17 = [(NSArray *)v15 objectAtIndexedSubscript:1];
  uint64_t v42 = [v17 unsignedIntegerValue];
  uint64_t v18 = [(NSArray *)v15 objectAtIndexedSubscript:0];

  uint64_t v41 = [v18 unsignedIntegerValue];
  v19 = [(NSArray *)v14 objectAtIndexedSubscript:1];
  uint64_t v39 = [v19 unsignedIntegerValue];
  uint64_t v20 = [(NSArray *)v14 objectAtIndexedSubscript:0];

  uint64_t v21 = [v20 unsignedIntegerValue];
  uint64_t v40 = [(NSArray *)v13 objectAtIndexedSubscript:1];
  uint64_t v38 = [v40 unsignedIntegerValue];
  MLCPaddingPolicy v22 = [(NSArray *)v13 objectAtIndexedSubscript:0];

  uint64_t v23 = [v22 unsignedIntegerValue];
  uint64_t v24 = v23;
  if (v12)
  {
    [(NSArray *)v12 objectAtIndexedSubscript:1];
    v25 = uint64_t v37 = v17;
    uint64_t v35 = v21;
    id v26 = v19;
    uint64_t v27 = [v25 unsignedIntegerValue];
    [(NSArray *)v12 objectAtIndexedSubscript:0];
    uint64_t v36 = v18;
    v29 = uint64_t v28 = v12;
    LOBYTE(v34) = 0;
    uint64_t v33 = v27;
    v19 = v26;
    LODWORD(v32) = paddingPolicy;
    v30 = objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 1, v42, v41, v39, v35, v38, v24, v32, v33, objc_msgSend(v29, "unsignedIntegerValue"), v34);

    uint64_t v12 = v28;
    uint64_t v18 = v36;

    uint64_t v17 = v37;
  }
  else
  {
    LOBYTE(v34) = 0;
    LODWORD(v32) = paddingPolicy;
    v30 = (void *)[v16 initWithType:1 kernelWidth:v42 kernelHeight:v41 strideInX:v39 strideInY:v21 dilationRateInX:v38 dilationRateInY:v23 paddingPolicy:v32 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v34];
  }

  return (MLCPoolingDescriptor *)v30;
}

+ (MLCPoolingDescriptor)averagePoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes countIncludesPadding:(BOOL)countIncludesPadding
{
  uint64_t v12 = paddingSizes;
  id v13 = strides;
  id v14 = kernelSizes;
  id v15 = objc_alloc((Class)a1);
  id v16 = [(NSArray *)v14 objectAtIndexedSubscript:1];
  uint64_t v39 = [v16 unsignedIntegerValue];
  uint64_t v17 = [(NSArray *)v14 objectAtIndexedSubscript:0];

  uint64_t v18 = [v17 unsignedIntegerValue];
  v19 = [(NSArray *)v13 objectAtIndexedSubscript:1];
  uint64_t v38 = [v19 unsignedIntegerValue];
  uint64_t v20 = [(NSArray *)v13 objectAtIndexedSubscript:0];

  uint64_t v21 = [v20 unsignedIntegerValue];
  if (v12)
  {
    uint64_t v36 = v21;
    [(NSArray *)v12 objectAtIndexedSubscript:1];
    uint64_t v35 = v15;
    MLCPaddingPolicy v22 = v17;
    uint64_t v24 = v23 = paddingPolicy;
    uint64_t v25 = v18;
    id v26 = v19;
    uint64_t v27 = [v24 unsignedIntegerValue];
    [(NSArray *)v12 objectAtIndexedSubscript:0];
    uint64_t v37 = v12;
    v29 = uint64_t v28 = v16;
    LOBYTE(v34) = countIncludesPadding;
    uint64_t v33 = v27;
    v19 = v26;
    LODWORD(v32) = v23;
    uint64_t v17 = v22;
    v30 = objc_msgSend(v35, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 2, v39, v25, v38, v36, 1, 1, v32, v33, objc_msgSend(v29, "unsignedIntegerValue"), v34);

    id v16 = v28;
    uint64_t v12 = v37;
  }
  else
  {
    LOBYTE(v34) = countIncludesPadding;
    LODWORD(v32) = paddingPolicy;
    v30 = (void *)[v15 initWithType:2 kernelWidth:v39 kernelHeight:v18 strideInX:v38 strideInY:v21 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v32 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v34];
  }

  return (MLCPoolingDescriptor *)v30;
}

+ (MLCPoolingDescriptor)averagePoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes countIncludesPadding:(BOOL)countIncludesPadding
{
  id v14 = paddingSizes;
  id v15 = dilationRates;
  id v16 = strides;
  uint64_t v17 = kernelSizes;
  id v43 = objc_alloc((Class)a1);
  uint64_t v18 = [(NSArray *)v17 objectAtIndexedSubscript:1];
  uint64_t v42 = [v18 unsignedIntegerValue];
  v19 = [(NSArray *)v17 objectAtIndexedSubscript:0];

  uint64_t v41 = [v19 unsignedIntegerValue];
  uint64_t v20 = [(NSArray *)v16 objectAtIndexedSubscript:1];
  uint64_t v39 = [v20 unsignedIntegerValue];
  uint64_t v21 = [(NSArray *)v16 objectAtIndexedSubscript:0];

  uint64_t v22 = [v21 unsignedIntegerValue];
  uint64_t v40 = [(NSArray *)v15 objectAtIndexedSubscript:1];
  uint64_t v38 = [v40 unsignedIntegerValue];
  MLCPaddingPolicy v23 = [(NSArray *)v15 objectAtIndexedSubscript:0];

  uint64_t v24 = [v23 unsignedIntegerValue];
  uint64_t v25 = v24;
  if (v14)
  {
    [(NSArray *)v14 objectAtIndexedSubscript:1];
    v26 = uint64_t v37 = v18;
    uint64_t v35 = v22;
    uint64_t v27 = v19;
    uint64_t v28 = [v26 unsignedIntegerValue];
    [(NSArray *)v14 objectAtIndexedSubscript:0];
    v29 = uint64_t v36 = v14;
    LOBYTE(v34) = countIncludesPadding;
    uint64_t v33 = v28;
    v19 = v27;
    LODWORD(v32) = paddingPolicy;
    v30 = objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 2, v42, v41, v39, v35, v38, v25, v32, v33, objc_msgSend(v29, "unsignedIntegerValue"), v34);

    id v14 = v36;
    uint64_t v18 = v37;
  }
  else
  {
    LOBYTE(v34) = countIncludesPadding;
    LODWORD(v32) = paddingPolicy;
    v30 = (void *)[v43 initWithType:2 kernelWidth:v42 kernelHeight:v41 strideInX:v39 strideInY:v22 dilationRateInX:v38 dilationRateInY:v24 paddingPolicy:v32 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v34];
  }

  return (MLCPoolingDescriptor *)v30;
}

+ (MLCPoolingDescriptor)l2NormPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  uint64_t v10 = paddingSizes;
  v11 = strides;
  uint64_t v12 = kernelSizes;
  id v13 = objc_alloc((Class)a1);
  id v14 = [(NSArray *)v12 objectAtIndexedSubscript:1];
  uint64_t v15 = [v14 unsignedIntegerValue];
  id v16 = [(NSArray *)v12 objectAtIndexedSubscript:0];

  uint64_t v17 = [v16 unsignedIntegerValue];
  uint64_t v18 = [(NSArray *)v11 objectAtIndexedSubscript:1];
  uint64_t v39 = [v18 unsignedIntegerValue];
  v19 = [(NSArray *)v11 objectAtIndexedSubscript:0];

  uint64_t v20 = [v19 unsignedIntegerValue];
  if (v10)
  {
    uint64_t v37 = v20;
    [(NSArray *)v10 objectAtIndexedSubscript:1];
    uint64_t v36 = v17;
    uint64_t v21 = v16;
    v23 = MLCPaddingPolicy v22 = paddingPolicy;
    uint64_t v24 = v15;
    uint64_t v25 = v18;
    id v26 = v13;
    uint64_t v27 = [v23 unsignedIntegerValue];
    [(NSArray *)v10 objectAtIndexedSubscript:0];
    uint64_t v38 = v10;
    v29 = uint64_t v28 = v14;
    LOBYTE(v35) = 0;
    uint64_t v34 = [v29 unsignedIntegerValue];
    LODWORD(v33) = v22;
    id v16 = v21;
    v30 = v26;
    uint64_t v18 = v25;
    uint64_t v31 = (void *)[v30 initWithType:3 kernelWidth:v24 kernelHeight:v36 strideInX:v39 strideInY:v37 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v33 paddingSizeInX:v27 paddingSizeInY:v34 countIncludesPadding:v35];

    id v14 = v28;
    uint64_t v10 = v38;
  }
  else
  {
    LOBYTE(v35) = 0;
    LODWORD(v33) = paddingPolicy;
    uint64_t v31 = (void *)[v13 initWithType:3 kernelWidth:v15 kernelHeight:v17 strideInX:v39 strideInY:v20 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v33 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v35];
  }

  return (MLCPoolingDescriptor *)v31;
}

+ (MLCPoolingDescriptor)l2NormPoolingDescriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  uint64_t v12 = paddingSizes;
  id v13 = dilationRates;
  id v14 = strides;
  uint64_t v15 = kernelSizes;
  id v16 = objc_alloc((Class)a1);
  uint64_t v17 = [(NSArray *)v15 objectAtIndexedSubscript:1];
  uint64_t v41 = [v17 unsignedIntegerValue];
  uint64_t v18 = [(NSArray *)v15 objectAtIndexedSubscript:0];

  uint64_t v40 = [v18 unsignedIntegerValue];
  v19 = [(NSArray *)v14 objectAtIndexedSubscript:1];
  uint64_t v38 = [v19 unsignedIntegerValue];
  uint64_t v20 = [(NSArray *)v14 objectAtIndexedSubscript:0];

  uint64_t v21 = [v20 unsignedIntegerValue];
  uint64_t v39 = [(NSArray *)v13 objectAtIndexedSubscript:1];
  uint64_t v37 = [v39 unsignedIntegerValue];
  MLCPaddingPolicy v22 = [(NSArray *)v13 objectAtIndexedSubscript:0];

  uint64_t v23 = [v22 unsignedIntegerValue];
  uint64_t v24 = v23;
  if (v12)
  {
    [(NSArray *)v12 objectAtIndexedSubscript:1];
    v25 = uint64_t v36 = v17;
    uint64_t v34 = v21;
    id v26 = v19;
    uint64_t v27 = [v25 unsignedIntegerValue];
    [(NSArray *)v12 objectAtIndexedSubscript:0];
    uint64_t v28 = v35 = v18;
    LOBYTE(v33) = 0;
    uint64_t v32 = v27;
    v19 = v26;
    LODWORD(v31) = paddingPolicy;
    v29 = objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:countIncludesPadding:", 3, v41, v40, v38, v34, v37, v24, v31, v32, objc_msgSend(v28, "unsignedIntegerValue"), v33);

    uint64_t v18 = v35;
    uint64_t v17 = v36;
  }
  else
  {
    LOBYTE(v33) = 0;
    LODWORD(v31) = paddingPolicy;
    v29 = (void *)[v16 initWithType:3 kernelWidth:v41 kernelHeight:v40 strideInX:v38 strideInY:v21 dilationRateInX:v37 dilationRateInY:v23 paddingPolicy:v31 paddingSizeInX:0 paddingSizeInY:0 countIncludesPadding:v33];
  }

  return (MLCPoolingDescriptor *)v29;
}

- (MLCPoolingDescriptor)initWithType:(int)a3 kernelWidth:(unint64_t)a4 kernelHeight:(unint64_t)a5 strideInX:(unint64_t)a6 strideInY:(unint64_t)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 paddingPolicy:(int)a10 paddingSizeInX:(unint64_t)a11 paddingSizeInY:(unint64_t)a12 countIncludesPadding:(BOOL)a13
{
  v20.receiver = self;
  v20.super_class = (Class)MLCPoolingDescriptor;
  result = [(MLCPoolingDescriptor *)&v20 init];
  if (result)
  {
    result->_kernelWidth = a4;
    result->_kernelHeight = a5;
    result->_strideInX = a6;
    result->_strideInY = a7;
    result->_dilationRateInX = a8;
    result->_dilationRateInY = a9;
    result->_poolingType = a3;
    result->_paddingPolicy = a10;
    result->_paddingSizeInX = a11;
    result->_paddingSizeInY = a12;
    result->_countIncludesPadding = a13;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 poolingType];
    if (v6 != [(MLCPoolingDescriptor *)self poolingType]) {
      goto LABEL_14;
    }
    uint64_t v7 = [v5 kernelWidth];
    if (v7 != [(MLCPoolingDescriptor *)self kernelWidth]) {
      goto LABEL_14;
    }
    uint64_t v8 = [v5 kernelHeight];
    if (v8 != [(MLCPoolingDescriptor *)self kernelHeight]) {
      goto LABEL_14;
    }
    uint64_t v9 = [v5 strideInX];
    if (v9 == [(MLCPoolingDescriptor *)self strideInX]
      && (uint64_t v10 = [v5 strideInY], v10 == -[MLCPoolingDescriptor strideInY](self, "strideInY"))
      && (uint64_t v11 = [v5 dilationRateInX],
          v11 == [(MLCPoolingDescriptor *)self dilationRateInX])
      && (uint64_t v12 = [v5 dilationRateInY],
          v12 == [(MLCPoolingDescriptor *)self dilationRateInY])
      && (int v13 = [v5 paddingPolicy], v13 == -[MLCPoolingDescriptor paddingPolicy](self, "paddingPolicy"))
      && (uint64_t v14 = [v5 paddingSizeInX], v14 == -[MLCPoolingDescriptor paddingSizeInX](self, "paddingSizeInX"))&& (v15 = objc_msgSend(v5, "paddingSizeInY"), v15 == -[MLCPoolingDescriptor paddingSizeInY](self, "paddingSizeInY")))
    {
      int v16 = [v5 countIncludesPadding];
      int v17 = v16 ^ [(MLCPoolingDescriptor *)self countIncludesPadding] ^ 1;
    }
    else
    {
LABEL_14:
      LOBYTE(v17) = 0;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v12 = 0;
  char v11 = [(MLCPoolingDescriptor *)self poolingType];
  [(MLCPoolingDescriptor *)self kernelWidth];
  [(MLCPoolingDescriptor *)self kernelHeight];
  [(MLCPoolingDescriptor *)self strideInX];
  [(MLCPoolingDescriptor *)self strideInY];
  [(MLCPoolingDescriptor *)self dilationRateInX];
  [(MLCPoolingDescriptor *)self dilationRateInY];
  [(MLCPoolingDescriptor *)self paddingPolicy];
  [(MLCPoolingDescriptor *)self paddingSizeInX];
  [(MLCPoolingDescriptor *)self paddingSizeInY];
  [(MLCPoolingDescriptor *)self countIncludesPadding];
  hashCombine_0(&v12, v3, v4, v5, v6, v7, v8, v9, v11);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v16 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  HIDWORD(v15) = [(MLCPoolingDescriptor *)self poolingType];
  NSUInteger v4 = [(MLCPoolingDescriptor *)self kernelWidth];
  NSUInteger v5 = [(MLCPoolingDescriptor *)self kernelHeight];
  NSUInteger v6 = [(MLCPoolingDescriptor *)self strideInX];
  NSUInteger v7 = [(MLCPoolingDescriptor *)self strideInY];
  NSUInteger v8 = [(MLCPoolingDescriptor *)self dilationRateInX];
  NSUInteger v9 = [(MLCPoolingDescriptor *)self dilationRateInY];
  MLCPaddingPolicy v10 = [(MLCPoolingDescriptor *)self paddingPolicy];
  NSUInteger v11 = [(MLCPoolingDescriptor *)self paddingSizeInX];
  NSUInteger v12 = [(MLCPoolingDescriptor *)self paddingSizeInY];
  LOBYTE(v15) = [(MLCPoolingDescriptor *)self countIncludesPadding];
  LODWORD(v14) = v10;
  return (id)[v16 initWithType:HIDWORD(v15) kernelWidth:v4 kernelHeight:v5 strideInX:v6 strideInY:v7 dilationRateInX:v8 dilationRateInY:v9 paddingPolicy:v14 paddingSizeInX:v11 paddingSizeInY:v12 countIncludesPadding:v15];
}

- (MLCPoolingType)poolingType
{
  return self->_poolingType;
}

- (NSUInteger)kernelWidth
{
  return self->_kernelWidth;
}

- (NSUInteger)kernelHeight
{
  return self->_kernelHeight;
}

- (NSUInteger)strideInX
{
  return self->_strideInX;
}

- (NSUInteger)strideInY
{
  return self->_strideInY;
}

- (NSUInteger)dilationRateInX
{
  return self->_dilationRateInX;
}

- (NSUInteger)dilationRateInY
{
  return self->_dilationRateInY;
}

- (MLCPaddingPolicy)paddingPolicy
{
  return self->_paddingPolicy;
}

- (NSUInteger)paddingSizeInX
{
  return self->_paddingSizeInX;
}

- (NSUInteger)paddingSizeInY
{
  return self->_paddingSizeInY;
}

- (BOOL)countIncludesPadding
{
  return self->_countIncludesPadding;
}

@end