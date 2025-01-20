@interface MLCTensorDescriptor
+ (MLCTensorDescriptor)convolutionBiasesDescriptorWithFeatureChannelCount:(NSUInteger)featureChannelCount dataType:(MLCDataType)dataType;
+ (MLCTensorDescriptor)convolutionWeightsDescriptorWithInputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount dataType:(MLCDataType)dataType;
+ (MLCTensorDescriptor)convolutionWeightsDescriptorWithWidth:(NSUInteger)width height:(NSUInteger)height inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount dataType:(MLCDataType)dataType;
+ (MLCTensorDescriptor)descriptorWithShape:(NSArray *)shape dataType:(MLCDataType)dataType;
+ (MLCTensorDescriptor)descriptorWithShape:(NSArray *)shape sequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences dataType:(MLCDataType)dataType;
+ (MLCTensorDescriptor)descriptorWithShape:(id)a3 stride:(id)a4 dataType:(int)a5;
+ (MLCTensorDescriptor)descriptorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize dataType:(MLCDataType)dataType;
+ (MLCTensorDescriptor)descriptorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannels batchSize:(NSUInteger)batchSize;
+ (MLCTensorDescriptor)descriptorWithWidth:(unint64_t)a3 height:(unint64_t)a4 featureChannels:(unint64_t)a5 batchSize:(unint64_t)a6 strideForWidth:(unint64_t)a7 strideForHeight:(unint64_t)a8 strideForBatch:(unint64_t)a9 dataType:(int)a10;
+ (NSUInteger)maxTensorDimensions;
+ (unint64_t)elementByteCount:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloatingPoint;
- (BOOL)sortedSequences;
- (BOOL)variableLengthSequences;
- (MLCDataType)dataType;
- (NSArray)batchSizePerSequenceStep;
- (NSArray)sequenceLengths;
- (NSArray)shape;
- (NSArray)stride;
- (NSUInteger)dimensionCount;
- (NSUInteger)tensorAllocationSizeInBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initConvolutionWeightsDescriptorWithWidth:(unint64_t)a3 height:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 dataType:(int)a7;
- (id)initNCHWTensorWithWidth:(unint64_t)a3 height:(unint64_t)a4 featureChannels:(unint64_t)a5 batchSize:(unint64_t)a6 strideForWidth:(unint64_t)a7 strideForHeight:(unint64_t)a8 strideForChannel:(unint64_t)a9 strideForBatch:(unint64_t)a10 fanIn:(unint64_t)a11 fanOut:(unint64_t)a12 dataType:(int)a13;
- (id)initTensorWithShape:(id)a3 stride:(id)a4 fanIn:(unint64_t)a5 fanOut:(unint64_t)a6 dataType:(int)a7;
- (id)initTensorWithShape:(id)a3 stride:(id)a4 sequenceLengths:(id)a5 sortedSequences:(BOOL)a6 fanIn:(unint64_t)a7 fanOut:(unint64_t)a8 dataType:(int)a9;
- (id)newShapeWithCount:(unint64_t)a3;
- (unint64_t)elementByteCount;
- (unint64_t)elementCount;
- (unint64_t)fanIn;
- (unint64_t)fanOut;
- (unint64_t)hash;
- (void)setStride:(id)a3;
- (void)setTensorAllocationSizeInBytes:(unint64_t)a3;
- (void)updateStride:(id)a3 tensorAllocationSize:(unint64_t)a4;
@end

@implementation MLCTensorDescriptor

+ (NSUInteger)maxTensorDimensions
{
  return 4;
}

+ (MLCTensorDescriptor)descriptorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannels batchSize:(NSUInteger)batchSize
{
  v10 = objc_opt_class();

  return (MLCTensorDescriptor *)[v10 descriptorWithWidth:width height:height featureChannelCount:featureChannels batchSize:batchSize dataType:1];
}

+ (MLCTensorDescriptor)descriptorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize dataType:(MLCDataType)dataType
{
  LODWORD(v8) = dataType;
  return (MLCTensorDescriptor *)[(id)objc_opt_class() descriptorWithWidth:width height:height featureChannels:featureChannelCount batchSize:batchSize strideForWidth:0 strideForHeight:0 strideForBatch:0 dataType:v8];
}

+ (MLCTensorDescriptor)descriptorWithWidth:(unint64_t)a3 height:(unint64_t)a4 featureChannels:(unint64_t)a5 batchSize:(unint64_t)a6 strideForWidth:(unint64_t)a7 strideForHeight:(unint64_t)a8 strideForBatch:(unint64_t)a9 dataType:(int)a10
{
  LODWORD(v12) = a10;
  v10 = (void *)[objc_alloc((Class)a1) initNCHWTensorWithWidth:a3 height:a4 featureChannels:a5 batchSize:a6 strideForWidth:a7 strideForHeight:a8 strideForChannel:0 strideForBatch:a9 fanIn:a4 * a3 * a5 fanOut:a4 * a3 dataType:v12];

  return (MLCTensorDescriptor *)v10;
}

+ (MLCTensorDescriptor)descriptorWithShape:(NSArray *)shape sequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences dataType:(MLCDataType)dataType
{
  v11 = shape;
  uint64_t v12 = sequenceLengths;
  if ([(NSArray *)v12 count])
  {
    if (sortedSequences)
    {
      if ([(NSArray *)v11 count] == 3 || [(NSArray *)v11 count] == 4)
      {
        if ([(NSArray *)v11 count] == 3)
        {
          v13 = [(NSArray *)v11 objectAtIndexedSubscript:2];
          uint64_t v14 = [v13 unsignedIntegerValue];

          id v15 = objc_alloc((Class)a1);
          LODWORD(v27) = dataType;
          v16 = v11;
          v17 = v12;
          uint64_t v18 = v14;
          uint64_t v19 = 1;
        }
        else
        {
          v21 = [(NSArray *)v11 objectAtIndexedSubscript:1];
          uint64_t v22 = [v21 unsignedIntegerValue];

          v23 = [(NSArray *)v11 objectAtIndexedSubscript:3];
          uint64_t v24 = [v23 unsignedIntegerValue];

          id v15 = objc_alloc((Class)a1);
          uint64_t v18 = v24 * v22;
          LODWORD(v27) = dataType;
          v16 = v11;
          v17 = v12;
          uint64_t v19 = v24;
        }
        v25 = (void *)[v15 initTensorWithShape:v16 stride:0 sequenceLengths:v17 sortedSequences:1 fanIn:v18 fanOut:v19 dataType:v27];
        goto LABEL_16;
      }
      v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](a2);
      }
    }
    else
    {
      v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](a2);
      }
    }
  }
  else
  {
    v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](a2);
    }
  }

  v25 = 0;
LABEL_16:

  return (MLCTensorDescriptor *)v25;
}

+ (MLCTensorDescriptor)descriptorWithShape:(NSArray *)shape dataType:(MLCDataType)dataType
{
  return (MLCTensorDescriptor *)[a1 descriptorWithShape:shape stride:0 dataType:*(void *)&dataType];
}

+ (MLCTensorDescriptor)descriptorWithShape:(id)a3 stride:(id)a4 dataType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 count];
  if (v10 == 4)
  {
    uint64_t v14 = [v8 objectAtIndexedSubscript:0];
    uint64_t v15 = [v14 unsignedIntegerValue];
    v16 = [v8 objectAtIndexedSubscript:1];
    uint64_t v13 = [v16 unsignedIntegerValue] * v15;

    v11 = [v8 objectAtIndexedSubscript:2];
    uint64_t v12 = [v11 unsignedIntegerValue] * v13;
    goto LABEL_5;
  }
  if (v10 == 3)
  {
    v11 = [v8 objectAtIndexedSubscript:2];
    uint64_t v12 = [v11 unsignedIntegerValue];
    uint64_t v13 = 1;
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v12 = 1;
  uint64_t v13 = 1;
LABEL_7:
  v17 = (void *)[objc_alloc((Class)a1) initTensorWithShape:v8 stride:v9 fanIn:v12 fanOut:v13 dataType:v5];

  return (MLCTensorDescriptor *)v17;
}

- (id)initNCHWTensorWithWidth:(unint64_t)a3 height:(unint64_t)a4 featureChannels:(unint64_t)a5 batchSize:(unint64_t)a6 strideForWidth:(unint64_t)a7 strideForHeight:(unint64_t)a8 strideForChannel:(unint64_t)a9 strideForBatch:(unint64_t)a10 fanIn:(unint64_t)a11 fanOut:(unint64_t)a12 dataType:(int)a13
{
  v37[4] = *MEMORY[0x1E4F143B8];
  unint64_t v20 = [(id)objc_opt_class() elementByteCount:a13];
  if (v20)
  {
    unint64_t v21 = a10;
    if (!a7) {
      a7 = v20;
    }
    if (!a8) {
      a8 = a7 * a3;
    }
    if (a9) {
      unint64_t v22 = a9;
    }
    else {
      unint64_t v22 = a8 * a4;
    }
    if (!a10) {
      unint64_t v21 = v22 * a5;
    }
    unint64_t v35 = v21;
    v23 = [NSNumber numberWithUnsignedInteger:a6];
    v37[0] = v23;
    uint64_t v24 = [NSNumber numberWithUnsignedInteger:a5];
    v37[1] = v24;
    v25 = [NSNumber numberWithUnsignedInteger:a4];
    v37[2] = v25;
    v26 = [NSNumber numberWithUnsignedInteger:a3];
    v37[3] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];

    v28 = [NSNumber numberWithUnsignedInteger:v35];
    v36[0] = v28;
    v29 = [NSNumber numberWithUnsignedInteger:v22];
    v36[1] = v29;
    v30 = [NSNumber numberWithUnsignedInteger:a8];
    v36[2] = v30;
    v31 = [NSNumber numberWithUnsignedInteger:a7];
    v36[3] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];

    self = (MLCTensorDescriptor *)[(MLCTensorDescriptor *)self initTensorWithShape:v27 stride:v32 fanIn:a11 fanOut:a12 dataType:a13];
    v33 = self;
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)initTensorWithShape:(id)a3 stride:(id)a4 fanIn:(unint64_t)a5 fanOut:(unint64_t)a6 dataType:(int)a7
{
  LODWORD(v8) = a7;
  return [(MLCTensorDescriptor *)self initTensorWithShape:a3 stride:a4 sequenceLengths:0 sortedSequences:0 fanIn:a5 fanOut:a6 dataType:v8];
}

- (id)initTensorWithShape:(id)a3 stride:(id)a4 sequenceLengths:(id)a5 sortedSequences:(BOOL)a6 fanIn:(unint64_t)a7 fanOut:(unint64_t)a8 dataType:(int)a9
{
  BOOL v11 = a6;
  v84 = a2;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  unint64_t v18 = +[MLCTensorDescriptor maxTensorDimensions];
  if ([v15 count] > v18)
  {
    uint64_t v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unint64_t v20 = NSStringFromSelector(v84);
      *(_DWORD *)buf = 138412802;
      v87 = v20;
      __int16 v88 = 2048;
      uint64_t v89 = [v15 count];
      __int16 v90 = 2048;
      uint64_t v91 = v18;
      _os_log_error_impl(&dword_1DD0C9000, v19, OS_LOG_TYPE_ERROR, "%@: Requested (%lu) dimensions exceed max supported (%lu) dimensions", buf, 0x20u);
    }
    goto LABEL_57;
  }
  BOOL v83 = v11;
  id v81 = a5;
  if ([v15 count])
  {
    uint64_t v21 = 0;
    while (1)
    {
      unint64_t v22 = [v15 objectAtIndexedSubscript:v21];
      uint64_t v23 = [v22 unsignedIntegerValue];

      if (!v23) {
        break;
      }
      if (++v21 >= (unint64_t)[v15 count]) {
        goto LABEL_8;
      }
    }
    uint64_t v19 = +[MLCLog framework];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_57;
    }
    v37 = NSStringFromSelector(v84);
    v38 = [v15 objectAtIndexedSubscript:v21];
    *(_DWORD *)buf = 138412802;
    v87 = v37;
    __int16 v88 = 2048;
    uint64_t v89 = [v38 unsignedIntegerValue];
    __int16 v90 = 2048;
    uint64_t v91 = v21;
    _os_log_error_impl(&dword_1DD0C9000, v19, OS_LOG_TYPE_ERROR, "%@: Requested (%lu) value in size for dimension (%lu) is zero", buf, 0x20u);

    goto LABEL_26;
  }
LABEL_8:
  if (v16)
  {
    uint64_t v24 = [v16 count];
    if (v24 != [v15 count])
    {
      uint64_t v19 = +[MLCLog framework];
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
LABEL_57:

        v47 = 0;
        goto LABEL_58;
      }
      v37 = NSStringFromSelector(v84);
      *(_DWORD *)buf = 138412802;
      v87 = v37;
      __int16 v88 = 2048;
      uint64_t v89 = [v15 count];
      __int16 v90 = 2048;
      uint64_t v91 = [v16 count];
      _os_log_error_impl(&dword_1DD0C9000, v19, OS_LOG_TYPE_ERROR, "%@: Size (%lu) dimensions do not match stride (%lu) dimensions", buf, 0x20u);
LABEL_26:

      goto LABEL_57;
    }
  }
  id v82 = v16;
  if (v17)
  {
    if (!v83)
    {
      uint64_t v19 = +[MLCLog framework];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:].cold.6(v84);
      }
      goto LABEL_57;
    }
    if (![v17 count])
    {
      uint64_t v19 = +[MLCLog framework];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[MLCTensorDescriptor descriptorWithShape:sequenceLengths:sortedSequences:dataType:](v84);
      }
      goto LABEL_57;
    }
    if ([v15 count] == 4)
    {
      v25 = [v15 objectAtIndexedSubscript:0];
      uint64_t v26 = [v25 unsignedIntegerValue];
      uint64_t v27 = [v17 count];

      if (v26 != v27)
      {
        uint64_t v19 = +[MLCLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:].cold.5(v84);
        }
        goto LABEL_57;
      }
    }
    v28 = [v17 objectAtIndexedSubscript:0];
    uint64_t v29 = [v28 unsignedIntegerValue];

    if (!v29)
    {
      uint64_t v19 = +[MLCLog framework];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:](v84);
      }
      goto LABEL_57;
    }
    unint64_t v30 = 0;
    while (v30 < [v17 count] - 1)
    {
      v31 = [v17 objectAtIndexedSubscript:v30];
      unint64_t v32 = [v31 unsignedIntegerValue];
      v33 = [v17 objectAtIndexedSubscript:++v30];
      unint64_t v34 = [v33 unsignedIntegerValue];

      if (v32 < v34)
      {
        uint64_t v19 = +[MLCLog framework];
        id v16 = v82;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:](v84);
        }
        goto LABEL_57;
      }
      unint64_t v35 = [v17 objectAtIndexedSubscript:v30];
      uint64_t v36 = [v35 unsignedIntegerValue];

      id v16 = v82;
      if (!v36)
      {
        uint64_t v19 = +[MLCLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MLCTensorDescriptor initTensorWithShape:stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:].cold.4(v84, v30, v19);
        }
        goto LABEL_57;
      }
    }
  }
  uint64_t v39 = [(id)objc_opt_class() elementByteCount:a9];
  if (v39)
  {
    uint64_t v40 = v39;
    v85.receiver = self;
    v85.super_class = (Class)MLCTensorDescriptor;
    v41 = [(MLCTensorDescriptor *)&v85 init];
    v42 = v41;
    if (v41)
    {
      v41->_dataType = a9;
      uint64_t v43 = [v15 copy];
      shape = v42->_shape;
      v42->_shape = (NSArray *)v43;

      v42->_fanIn = a7;
      v42->_fanOut = a8;
      if (v82)
      {
        uint64_t v45 = [v82 copy];
        stride = v42->_stride;
        v42->_stride = (NSArray *)v45;
      }
      else
      {
        uint64_t v48 = objc_msgSend(v15, "count", 0, 0, 0, 0);
        if (v48)
        {
          uint64_t v49 = v48 - 1;
          do
          {
            v80[v49] = v40;
            v50 = [v15 objectAtIndexedSubscript:v49];
            v40 *= [v50 unsignedIntegerValue];

            --v49;
          }
          while (v49 != -1);
        }
        v51 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        if ([v15 count])
        {
          unint64_t v52 = 0;
          do
          {
            v53 = [NSNumber numberWithUnsignedLongLong:v80[v52]];
            [v51 addObject:v53];

            ++v52;
          }
          while (v52 < [v15 count]);
        }
        uint64_t v54 = [v51 copy];
        v55 = v42->_stride;
        v42->_stride = (NSArray *)v54;
      }
      BOOL v56 = v83;
      if (v17 && v83)
      {
        v42->_variableLengthSequences = 0;
        if ((unint64_t)[v17 count] >= 2)
        {
          unint64_t v57 = 1;
          while (1)
          {
            v58 = [v17 objectAtIndexedSubscript:v57];
            uint64_t v59 = [v58 unsignedIntegerValue];

            unint64_t v60 = v57 - 1;
            v61 = [v17 objectAtIndexedSubscript:v60];
            uint64_t v62 = [v61 unsignedIntegerValue];

            if (v59 != v62) {
              break;
            }
            unint64_t v57 = v60 + 2;
            if (v57 >= [v17 count]) {
              goto LABEL_60;
            }
          }
          v42->_variableLengthSequences = 1;
        }
LABEL_60:
        v66 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v67 = [v17 count];
        v68 = [v17 objectAtIndexedSubscript:0];
        uint64_t v69 = [v68 unsignedIntegerValue];

        if (v69)
        {
          unint64_t v70 = 0;
          do
          {
            v71 = [NSNumber numberWithUnsignedInteger:v67];
            [(NSArray *)v66 setObject:v71 atIndexedSubscript:v70];

            ++v70;
            if (v67)
            {
              do
              {
                uint64_t v72 = v67 - 1;
                v73 = [v17 objectAtIndexedSubscript:v67 - 1];
                uint64_t v74 = [v73 unsignedIntegerValue];

                if (v74 != v70) {
                  break;
                }
                --v67;
              }
              while (v72);
            }
            v75 = [v17 objectAtIndexedSubscript:0];
            unint64_t v76 = [v75 unsignedIntegerValue];
          }
          while (v70 < v76);
        }
        batchSizePerSequenceStep = v42->_batchSizePerSequenceStep;
        v42->_batchSizePerSequenceStep = v66;
        v64 = v81;
        BOOL v56 = v83;
      }
      else
      {
        batchSizePerSequenceStep = v42->_batchSizePerSequenceStep;
        v42->_batchSizePerSequenceStep = 0;
        v64 = v81;
      }

      v42->_sortedSequences = v56;
      objc_storeStrong((id *)&v42->_sequenceLengths, v64);
      v77 = [(NSArray *)v42->_stride objectAtIndexedSubscript:0];
      uint64_t v78 = [v77 unsignedIntegerValue];
      v79 = [(NSArray *)v42->_shape objectAtIndexedSubscript:0];
      v42->_tensorAllocationSizeInBytes = [v79 unsignedIntegerValue] * v78;
    }
    self = v42;
    v47 = self;
  }
  else
  {
    v47 = 0;
  }
  id v16 = v82;
LABEL_58:

  return v47;
}

- (id)initConvolutionWeightsDescriptorWithWidth:(unint64_t)a3 height:(unint64_t)a4 inputFeatureChannels:(unint64_t)a5 outputFeatureChannels:(unint64_t)a6 dataType:(int)a7
{
  LODWORD(v8) = a7;
  return -[MLCTensorDescriptor initNCHWTensorWithWidth:height:featureChannels:batchSize:strideForWidth:strideForHeight:strideForChannel:strideForBatch:fanIn:fanOut:dataType:](self, "initNCHWTensorWithWidth:height:featureChannels:batchSize:strideForWidth:strideForHeight:strideForChannel:strideForBatch:fanIn:fanOut:dataType:", 0, 0, a4 * a3 * a5, a4 * a3 * a6, v8);
}

+ (MLCTensorDescriptor)convolutionWeightsDescriptorWithWidth:(NSUInteger)width height:(NSUInteger)height inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount dataType:(MLCDataType)dataType
{
  v7 = (void *)[objc_alloc((Class)a1) initConvolutionWeightsDescriptorWithWidth:width height:height inputFeatureChannels:inputFeatureChannelCount outputFeatureChannels:outputFeatureChannelCount dataType:*(void *)&dataType];

  return (MLCTensorDescriptor *)v7;
}

+ (MLCTensorDescriptor)convolutionWeightsDescriptorWithInputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount dataType:(MLCDataType)dataType
{
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initConvolutionWeightsDescriptorWithWidth:1 height:1 inputFeatureChannels:inputFeatureChannelCount outputFeatureChannels:outputFeatureChannelCount dataType:*(void *)&dataType];

  return (MLCTensorDescriptor *)v5;
}

+ (MLCTensorDescriptor)convolutionBiasesDescriptorWithFeatureChannelCount:(NSUInteger)featureChannelCount dataType:(MLCDataType)dataType
{
  uint64_t v4 = *(void *)&dataType;
  v6 = objc_opt_class();

  return (MLCTensorDescriptor *)[v6 descriptorWithWidth:1 height:1 featureChannelCount:featureChannelCount batchSize:1 dataType:v4];
}

- (NSUInteger)dimensionCount
{
  v2 = [(MLCTensorDescriptor *)self shape];
  NSUInteger v3 = [v2 count];

  return v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCTensorDescriptor *)self dataType];
  NSUInteger v7 = [(MLCTensorDescriptor *)self dimensionCount];
  uint64_t v8 = [(MLCTensorDescriptor *)self shape];
  id v9 = [v3 stringWithFormat:@"%@: { dataType=%d : numberOfDimensions=%lu : size=%@ : tensorAllocationSizeInBytes=%lu }", v5, v6, v7, v8, -[MLCTensorDescriptor tensorAllocationSizeInBytes](self, "tensorAllocationSizeInBytes")];

  return v9;
}

- (void)updateStride:(id)a3 tensorAllocationSize:(unint64_t)a4
{
  id v9 = a3;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if ([v9 count])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = [v9 objectAtIndex:v7];
      [v6 setObject:v8 atIndexedSubscript:v7];

      ++v7;
    }
    while (v7 < [v9 count]);
  }
  [(MLCTensorDescriptor *)self setStride:v6];
  [(MLCTensorDescriptor *)self setTensorAllocationSizeInBytes:a4];
}

- (unint64_t)elementCount
{
  switch([(MLCTensorDescriptor *)self dataType])
  {
    case 1:
    case 7:
      unint64_t result = [(MLCTensorDescriptor *)self tensorAllocationSizeInBytes] >> 2;
      break;
    case 3:
      unint64_t result = [(MLCTensorDescriptor *)self tensorAllocationSizeInBytes] >> 1;
      break;
    case 4:
    case 6:
    case 8:
    case 9:
      unint64_t result = [(MLCTensorDescriptor *)self tensorAllocationSizeInBytes];
      break;
    case 5:
      unint64_t result = [(MLCTensorDescriptor *)self tensorAllocationSizeInBytes] >> 3;
      break;
    default:
      uint64_t v5 = +[MLCLog framework];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceGPU multiDeviceTensorReduction:sourceBuffer:targetBuffer:](a2);
      }

      unint64_t result = 0;
      break;
  }
  return result;
}

+ (unint64_t)elementByteCount:(int)a3
{
  int v5 = a3 - 1;
  if (a3 - 1) < 9 && ((0x1FDu >> v5)) {
    return qword_1DD1F0BE0[v5];
  }
  uint64_t v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    +[MLCTensorDescriptor elementByteCount:v6];
  }

  return 0;
}

- (unint64_t)elementByteCount
{
  NSUInteger v3 = objc_opt_class();
  uint64_t v4 = [(MLCTensorDescriptor *)self dataType];

  return [v3 elementByteCount:v4];
}

- (BOOL)isFloatingPoint
{
  MLCDataType v2 = [(MLCTensorDescriptor *)self dataType];
  return (v2 > MLCDataTypeCount) | (0x4Eu >> v2) & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [v5 dataType];
    if (v6 != [(MLCTensorDescriptor *)self dataType]) {
      goto LABEL_18;
    }
    uint64_t v7 = [v5 dimensionCount];
    if (v7 != [(MLCTensorDescriptor *)self dimensionCount]) {
      goto LABEL_18;
    }
    uint64_t v8 = [v5 shape];
    id v9 = [(MLCTensorDescriptor *)self shape];
    if ([v8 isEqualToArray:v9])
    {
      uint64_t v10 = [v5 stride];
      BOOL v11 = [(MLCTensorDescriptor *)self stride];
      if ([v10 isEqualToArray:v11])
      {
        uint64_t v12 = [v5 tensorAllocationSizeInBytes];
        if (v12 == [(MLCTensorDescriptor *)self tensorAllocationSizeInBytes])
        {
          int v13 = [v5 sortedSequences];
          int v14 = [(MLCTensorDescriptor *)self sortedSequences];

          if (v13 == v14)
          {
            uint64_t v15 = [v5 sequenceLengths];
            if (v15)
            {
              id v16 = (void *)v15;
              id v17 = [(MLCTensorDescriptor *)self sequenceLengths];

              if (v17)
              {
                unint64_t v18 = [v5 sequenceLengths];
                uint64_t v19 = [(MLCTensorDescriptor *)self sequenceLengths];
                int v20 = [v18 isEqualToArray:v19];

LABEL_11:
                uint64_t v21 = [v5 batchSizePerSequenceStep];
                if (v21)
                {
                  unint64_t v22 = (void *)v21;
                  uint64_t v23 = [(MLCTensorDescriptor *)self batchSizePerSequenceStep];

                  if (v23)
                  {
                    if (v20)
                    {
                      uint64_t v24 = [v5 batchSizePerSequenceStep];
                      v25 = [(MLCTensorDescriptor *)self batchSizePerSequenceStep];
                      LOBYTE(v20) = [v24 isEqualToArray:v25];
                    }
                    goto LABEL_19;
                  }
                }
                uint64_t v27 = [v5 batchSizePerSequenceStep];
                if (!v27)
                {
                  uint64_t v29 = [(MLCTensorDescriptor *)self batchSizePerSequenceStep];

                  if (!v29) {
                    goto LABEL_19;
                  }
                  goto LABEL_18;
                }
                goto LABEL_25;
              }
            }
            uint64_t v27 = [v5 sequenceLengths];
            if (v27)
            {
LABEL_25:

              goto LABEL_18;
            }
            v28 = [(MLCTensorDescriptor *)self sequenceLengths];

            if (!v28)
            {
              int v20 = 1;
              goto LABEL_11;
            }
          }
LABEL_18:
          LOBYTE(v20) = 0;
LABEL_19:

          goto LABEL_20;
        }
      }
    }
    goto LABEL_18;
  }
  LOBYTE(v20) = 0;
LABEL_20:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v16 = 0;
  char v15 = [(MLCTensorDescriptor *)self dataType];
  [(MLCTensorDescriptor *)self dimensionCount];
  NSUInteger v3 = [(MLCTensorDescriptor *)self shape];
  [v3 hash];
  id v4 = [(MLCTensorDescriptor *)self stride];
  [v4 hash];
  [(MLCTensorDescriptor *)self tensorAllocationSizeInBytes];
  id v5 = [(MLCTensorDescriptor *)self sequenceLengths];
  [v5 hash];
  [(MLCTensorDescriptor *)self sortedSequences];
  int v6 = [(MLCTensorDescriptor *)self batchSizePerSequenceStep];
  [v6 hash];
  hashCombine_1(&v16, v7, v8, v9, v10, v11, v12, v13, v15);

  return v16;
}

- (id)newShapeWithCount:(unint64_t)a3
{
  id v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  int v6 = [(MLCTensorDescriptor *)self shape];
  uint64_t v7 = [v6 count];

  uint64_t v8 = [(MLCTensorDescriptor *)self shape];
  uint64_t v9 = v8;
  if (v7 == a3)
  {
    uint64_t v10 = [v8 copy];

    id v5 = (void *)v10;
  }
  else
  {
    uint64_t v11 = [v8 count];

    if (a3)
    {
      unint64_t v12 = 0;
      unint64_t v13 = a3 - v11;
      unint64_t v14 = v11 - a3;
      do
      {
        if (v12 >= v13)
        {
          unint64_t v16 = [(MLCTensorDescriptor *)self shape];
          id v17 = [v16 objectAtIndexedSubscript:v14 + v12];
          uint64_t v15 = [v17 unsignedIntegerValue];
        }
        else
        {
          uint64_t v15 = 1;
        }
        unint64_t v18 = [NSNumber numberWithUnsignedInteger:v15];
        [v5 setObject:v18 atIndexedSubscript:v12];

        ++v12;
      }
      while (a3 != v12);
    }
  }
  uint64_t v19 = (void *)[v5 copy];

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(MLCTensorDescriptor *)self shape];
  int v6 = [(MLCTensorDescriptor *)self stride];
  uint64_t v7 = [(MLCTensorDescriptor *)self sequenceLengths];
  BOOL v8 = [(MLCTensorDescriptor *)self sortedSequences];
  unint64_t v9 = [(MLCTensorDescriptor *)self fanIn];
  unint64_t v10 = [(MLCTensorDescriptor *)self fanOut];
  LODWORD(v13) = [(MLCTensorDescriptor *)self dataType];
  uint64_t v11 = (void *)[v4 initTensorWithShape:v5 stride:v6 sequenceLengths:v7 sortedSequences:v8 fanIn:v9 fanOut:v10 dataType:v13];

  return v11;
}

- (MLCDataType)dataType
{
  return self->_dataType;
}

- (NSArray)shape
{
  return self->_shape;
}

- (NSArray)stride
{
  return self->_stride;
}

- (void)setStride:(id)a3
{
}

- (NSUInteger)tensorAllocationSizeInBytes
{
  return self->_tensorAllocationSizeInBytes;
}

- (void)setTensorAllocationSizeInBytes:(unint64_t)a3
{
  self->_tensorAllocationSizeInBytes = a3;
}

- (NSArray)sequenceLengths
{
  return self->_sequenceLengths;
}

- (BOOL)sortedSequences
{
  return self->_sortedSequences;
}

- (NSArray)batchSizePerSequenceStep
{
  return self->_batchSizePerSequenceStep;
}

- (unint64_t)fanIn
{
  return self->_fanIn;
}

- (unint64_t)fanOut
{
  return self->_fanOut;
}

- (BOOL)variableLengthSequences
{
  return self->_variableLengthSequences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchSizePerSequenceStep, 0);
  objc_storeStrong((id *)&self->_sequenceLengths, 0);
  objc_storeStrong((id *)&self->_stride, 0);

  objc_storeStrong((id *)&self->_shape, 0);
}

+ (void)descriptorWithShape:(const char *)a1 sequenceLengths:sortedSequences:dataType:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: sequenceLengths is empty", v4, v5, v6, v7, v8);
}

+ (void)descriptorWithShape:(const char *)a1 sequenceLengths:sortedSequences:dataType:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: sequenceLengths can only be used for 3D tensors for TNC/NTC layout or 4D tensor with NC1W layout", v4, v5, v6, v7, v8);
}

+ (void)descriptorWithShape:(const char *)a1 sequenceLengths:sortedSequences:dataType:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: unsorted sequences are not supported", v4, v5, v6, v7, v8);
}

- (void)initTensorWithShape:(const char *)a1 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: sequenceLengths[0] has a non-positive value", v4, v5, v6, v7, v8);
}

- (void)initTensorWithShape:(const char *)a1 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: sequenceLengths is not sorted in descending order", v4, v5, v6, v7, v8);
}

- (void)initTensorWithShape:(NSObject *)a3 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.4(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: sequenceLengths[%lu] has a non-positive value", v6, 0x16u);
}

- (void)initTensorWithShape:(const char *)a1 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the number of elements in sequenceLengths does not match batchSize", v4, v5, v6, v7, v8);
}

- (void)initTensorWithShape:(const char *)a1 stride:sequenceLengths:sortedSequences:fanIn:fanOut:dataType:.cold.6(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Unsorted seqeunces are not supported", v4, v5, v6, v7, v8);
}

+ (void)elementByteCount:(NSObject *)a3 .cold.1(const char *a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: Unsupported dataType=%d", v6, 0x12u);
}

@end