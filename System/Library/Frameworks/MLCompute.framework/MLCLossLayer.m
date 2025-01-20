@interface MLCLossLayer
+ (MLCLossLayer)categoricalCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weight:(float)weight;
+ (MLCLossLayer)categoricalCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weights:(MLCTensor *)weights;
+ (MLCLossLayer)cosineDistanceLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight;
+ (MLCLossLayer)cosineDistanceLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights;
+ (MLCLossLayer)hingeLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight;
+ (MLCLossLayer)hingeLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights;
+ (MLCLossLayer)huberLossWithReductionType:(MLCReductionType)reductionType delta:(float)delta weight:(float)weight;
+ (MLCLossLayer)huberLossWithReductionType:(MLCReductionType)reductionType delta:(float)delta weights:(MLCTensor *)weights;
+ (MLCLossLayer)layerWithDescriptor:(MLCLossDescriptor *)lossDescriptor;
+ (MLCLossLayer)layerWithDescriptor:(MLCLossDescriptor *)lossDescriptor weights:(MLCTensor *)weights;
+ (MLCLossLayer)logLossWithReductionType:(MLCReductionType)reductionType epsilon:(float)epsilon weight:(float)weight;
+ (MLCLossLayer)logLossWithReductionType:(MLCReductionType)reductionType epsilon:(float)epsilon weights:(MLCTensor *)weights;
+ (MLCLossLayer)meanAbsoluteErrorLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight;
+ (MLCLossLayer)meanAbsoluteErrorLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights;
+ (MLCLossLayer)meanSquaredErrorLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight;
+ (MLCLossLayer)meanSquaredErrorLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights;
+ (MLCLossLayer)sigmoidCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing weight:(float)weight;
+ (MLCLossLayer)sigmoidCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing weights:(MLCTensor *)weights;
+ (MLCLossLayer)softmaxCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weight:(float)weight;
+ (MLCLossLayer)softmaxCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weights:(MLCTensor *)weights;
+ (id)categoricalCrossEntropyLossWithReductionType:(int)a3 weight:(float)a4;
+ (id)categoricalCrossEntropyLossWithReductionType:(int)a3 weights:(id)a4;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCLossDescriptor)descriptor;
- (MLCLossLayer)initWithDescriptor:(id)a3 weights:(id)a4;
- (MLCTensor)lossLabels;
- (MLCTensor)weights;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (void)linkAssociatedTensors;
- (void)setLossLabels:(id)a3;
- (void)unlinkAssociatedTensors;
@end

@implementation MLCLossLayer

+ (MLCLossLayer)layerWithDescriptor:(MLCLossDescriptor *)lossDescriptor
{
  v4 = lossDescriptor;
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4 weights:0];

  return (MLCLossLayer *)v5;
}

+ (MLCLossLayer)layerWithDescriptor:(MLCLossDescriptor *)lossDescriptor weights:(MLCTensor *)weights
{
  v6 = weights;
  v7 = lossDescriptor;
  v8 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v7 weights:v6];

  return (MLCLossLayer *)v8;
}

+ (MLCLossLayer)softmaxCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weight:(float)weight
{
  *(float *)&double v8 = weight;
  *(float *)&double v9 = labelSmoothing;
  v10 = +[MLCLossDescriptor descriptorWithType:2 reductionType:*(void *)&reductionType weight:classCount labelSmoothing:v8 classCount:v9];
  v11 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v10 weights:0];

  return (MLCLossLayer *)v11;
}

+ (MLCLossLayer)softmaxCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weights:(MLCTensor *)weights
{
  uint64_t v8 = *(void *)&reductionType;
  v10 = weights;
  LODWORD(v11) = 1.0;
  *(float *)&double v12 = labelSmoothing;
  v13 = +[MLCLossDescriptor descriptorWithType:2 reductionType:v8 weight:classCount labelSmoothing:v11 classCount:v12];
  v14 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v13 weights:v10];

  return (MLCLossLayer *)v14;
}

+ (MLCLossLayer)categoricalCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weight:(float)weight
{
  *(float *)&double v8 = weight;
  *(float *)&double v9 = labelSmoothing;
  v10 = +[MLCLossDescriptor descriptorWithType:4 reductionType:*(void *)&reductionType weight:classCount labelSmoothing:v8 classCount:v9];
  double v11 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v10 weights:0];

  return (MLCLossLayer *)v11;
}

+ (MLCLossLayer)categoricalCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing classCount:(NSUInteger)classCount weights:(MLCTensor *)weights
{
  uint64_t v8 = *(void *)&reductionType;
  v10 = weights;
  LODWORD(v11) = 1.0;
  *(float *)&double v12 = labelSmoothing;
  v13 = +[MLCLossDescriptor descriptorWithType:4 reductionType:v8 weight:classCount labelSmoothing:v11 classCount:v12];
  v14 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v13 weights:v10];

  return (MLCLossLayer *)v14;
}

+ (MLCLossLayer)sigmoidCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing weight:(float)weight
{
  *(float *)&double v7 = weight;
  *(float *)&double v8 = labelSmoothing;
  double v9 = +[MLCLossDescriptor descriptorWithType:3 reductionType:*(void *)&reductionType weight:1 labelSmoothing:v7 classCount:v8];
  v10 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v9 weights:0];

  return (MLCLossLayer *)v10;
}

+ (MLCLossLayer)sigmoidCrossEntropyLossWithReductionType:(MLCReductionType)reductionType labelSmoothing:(float)labelSmoothing weights:(MLCTensor *)weights
{
  uint64_t v6 = *(void *)&reductionType;
  double v8 = weights;
  LODWORD(v9) = 1.0;
  *(float *)&double v10 = labelSmoothing;
  double v11 = +[MLCLossDescriptor descriptorWithType:3 reductionType:v6 weight:1 labelSmoothing:v9 classCount:v10];
  double v12 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v11 weights:v8];

  return (MLCLossLayer *)v12;
}

+ (id)categoricalCrossEntropyLossWithReductionType:(int)a3 weight:(float)a4
{
  v5 = +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 4, *(void *)&a3);
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5 weights:0];

  return v6;
}

+ (id)categoricalCrossEntropyLossWithReductionType:(int)a3 weights:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  double v7 = +[MLCLossDescriptor descriptorWithType:4 reductionType:v4];
  double v8 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v7 weights:v6];

  return v8;
}

+ (MLCLossLayer)logLossWithReductionType:(MLCReductionType)reductionType epsilon:(float)epsilon weight:(float)weight
{
  LODWORD(v6) = 1.0;
  *(float *)&double v9 = weight;
  *(float *)&double v5 = epsilon;
  double v10 = +[MLCLossDescriptor descriptorWithType:8 reductionType:*(void *)&reductionType weight:1 labelSmoothing:v9 classCount:0.0 epsilon:v5 delta:v6];
  double v11 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v10 weights:0];

  return (MLCLossLayer *)v11;
}

+ (MLCLossLayer)logLossWithReductionType:(MLCReductionType)reductionType epsilon:(float)epsilon weights:(MLCTensor *)weights
{
  uint64_t v6 = *(void *)&reductionType;
  double v8 = weights;
  LODWORD(v9) = 1.0;
  LODWORD(v10) = 1.0;
  *(float *)&double v11 = epsilon;
  double v12 = +[MLCLossDescriptor descriptorWithType:8 reductionType:v6 weight:1 labelSmoothing:v9 classCount:0.0 epsilon:v11 delta:v10];
  v13 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v12 weights:v8];

  return (MLCLossLayer *)v13;
}

+ (MLCLossLayer)huberLossWithReductionType:(MLCReductionType)reductionType delta:(float)delta weight:(float)weight
{
  *(float *)&double v6 = delta;
  LODWORD(v5) = 869711765;
  *(float *)&double v8 = weight;
  double v9 = +[MLCLossDescriptor descriptorWithType:6 reductionType:*(void *)&reductionType weight:1 labelSmoothing:v8 classCount:0.0 epsilon:v5 delta:v6];
  double v10 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v9 weights:0];

  return (MLCLossLayer *)v10;
}

+ (MLCLossLayer)huberLossWithReductionType:(MLCReductionType)reductionType delta:(float)delta weights:(MLCTensor *)weights
{
  uint64_t v6 = *(void *)&reductionType;
  double v8 = weights;
  LODWORD(v9) = 869711765;
  LODWORD(v10) = 1.0;
  *(float *)&double v11 = delta;
  double v12 = +[MLCLossDescriptor descriptorWithType:6 reductionType:v6 weight:1 labelSmoothing:v10 classCount:0.0 epsilon:v9 delta:v11];
  v13 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v12 weights:v8];

  return (MLCLossLayer *)v13;
}

+ (MLCLossLayer)meanAbsoluteErrorLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight
{
  double v5 = +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 0, *(void *)&reductionType);
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5 weights:0];

  return (MLCLossLayer *)v6;
}

+ (MLCLossLayer)meanAbsoluteErrorLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights
{
  uint64_t v4 = *(void *)&reductionType;
  uint64_t v6 = weights;
  double v7 = +[MLCLossDescriptor descriptorWithType:0 reductionType:v4];
  double v8 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v7 weights:v6];

  return (MLCLossLayer *)v8;
}

+ (MLCLossLayer)meanSquaredErrorLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight
{
  double v5 = +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 1, *(void *)&reductionType);
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5 weights:0];

  return (MLCLossLayer *)v6;
}

+ (MLCLossLayer)meanSquaredErrorLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights
{
  uint64_t v4 = *(void *)&reductionType;
  uint64_t v6 = weights;
  double v7 = +[MLCLossDescriptor descriptorWithType:1 reductionType:v4];
  double v8 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v7 weights:v6];

  return (MLCLossLayer *)v8;
}

+ (MLCLossLayer)hingeLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight
{
  double v5 = +[MLCLossDescriptor descriptorWithType:reductionType:weight:](MLCLossDescriptor, "descriptorWithType:reductionType:weight:", 5, *(void *)&reductionType);
  uint64_t v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5 weights:0];

  return (MLCLossLayer *)v6;
}

+ (MLCLossLayer)hingeLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights
{
  uint64_t v4 = *(void *)&reductionType;
  uint64_t v6 = weights;
  double v7 = +[MLCLossDescriptor descriptorWithType:5 reductionType:v4];
  double v8 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v7 weights:v6];

  return (MLCLossLayer *)v8;
}

+ (MLCLossLayer)cosineDistanceLossWithReductionType:(MLCReductionType)reductionType weight:(float)weight
{
  uint64_t v5 = *(void *)&reductionType;
  if (reductionType == MLCReductionTypeMean)
  {
    double v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MLCLossLayer cosineDistanceLossWithReductionType:weight:](a2);
    }
  }
  *(float *)&double v9 = weight;
  double v10 = +[MLCLossDescriptor descriptorWithType:7 reductionType:v5 weight:v9];
  double v11 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v10 weights:0];

  return (MLCLossLayer *)v11;
}

+ (MLCLossLayer)cosineDistanceLossWithReductionType:(MLCReductionType)reductionType weights:(MLCTensor *)weights
{
  uint64_t v4 = *(void *)&reductionType;
  double v7 = weights;
  if (v4 == 2)
  {
    double v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MLCLossLayer cosineDistanceLossWithReductionType:weight:](a2);
    }
  }
  double v9 = +[MLCLossDescriptor descriptorWithType:7 reductionType:v4];
  double v10 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v9 weights:v7];

  return (MLCLossLayer *)v10;
}

- (MLCLossLayer)initWithDescriptor:(id)a3 weights:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 lossType] == 7 && objc_msgSend(v8, "reductionType") == 2)
  {
    double v10 = +[MLCLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MLCLossLayer cosineDistanceLossWithReductionType:weight:](a2);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)MLCLossLayer;
  double v11 = [(MLCLayer *)&v15 initWithLabel:@"Loss"];
  double v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_descriptor, a3);
    lossLabels = v12->_lossLabels;
    v12->_lossLabels = 0;

    objc_storeStrong((id *)&v12->_weights, a4);
  }

  return v12;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    aSelector = a2;
    uint64_t v12 = [v10 count];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      while (1)
      {
        objc_super v15 = [v10 objectAtIndexedSubscript:v14];
        v16 = [v15 descriptor];
        uint64_t v17 = [v16 dataType];

        if (!+[MLCLayer supportsDataType:v17 onDevice:v9]) {
          break;
        }
        if (v13 == ++v14) {
          goto LABEL_6;
        }
      }
      v35 = +[MLCLog framework];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v46 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        v51 = v46;
        __int16 v52 = 2048;
        uint64_t v53 = v14;
        __int16 v54 = 1024;
        int v55 = v17;
        __int16 v56 = 2112;
        id v57 = v9;
        _os_log_error_impl(&dword_1DD0C9000, v35, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);
      }
      goto LABEL_29;
    }
LABEL_6:
    v18 = [v10 objectAtIndexedSubscript:0];
    v19 = [v18 descriptor];
    v20 = [v19 shape];
    uint64_t v21 = [v20 count];

    if ([v10 count])
    {
      uint64_t v22 = 0;
      while (1)
      {
        v23 = [v10 objectAtIndexedSubscript:v22];
        v24 = [v23 descriptor];
        v25 = [v24 shape];
        uint64_t v26 = [v25 count];

        if (v21 != v26) {
          break;
        }
        if (++v22 >= (unint64_t)[v10 count]) {
          goto LABEL_10;
        }
      }
      v35 = +[MLCLog framework];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:].cold.5();
      }
      goto LABEL_29;
    }
LABEL_10:
    uint64_t v27 = [(MLCLossLayer *)self lossLabels];
    if (!v27) {
      goto LABEL_12;
    }
    v28 = (void *)v27;
    v29 = [(MLCLossLayer *)self lossLabels];
    v30 = [v29 descriptor];
    v31 = [v30 shape];
    uint64_t v32 = [v31 count];

    if (v21 == v32)
    {
LABEL_12:
      v33 = [v9 computeEngine];
      v34 = [(MLCLossLayer *)self descriptor];
      v35 = [v33 lossLayerWithDescriptor:v34];

      if (v35 && [v35 count])
      {
        v36 = [v9 computeEngine];
        char v37 = [v36 compileLayerDeviceOps:v35 sourceTensors:v10 resultTensor:v11];

        if (v37)
        {
          v49.receiver = self;
          v49.super_class = (Class)MLCLossLayer;
          [(MLCLayer *)&v49 bindDevice:v9 deviceOps:v35];
          v38 = [v9 computeEngine];
          v39 = [v38 deviceList];
          unint64_t v40 = [v39 count];

          if (v40 >= 2)
          {
            v41 = [(MLCLossLayer *)self descriptor];
            objc_msgSend(v11, "setMultiDeviceReductionType:", objc_msgSend(v41, "reductionType"));
          }
          v42 = [(MLCLossLayer *)self weights];

          if (!v42)
          {
            BOOL v45 = 1;
            goto LABEL_30;
          }
          v43 = [(MLCLossLayer *)self weights];
          [v43 allocateDeviceMemory:v9];

          v44 = [(MLCLossLayer *)self weights];
          [v44 writeTensorDataToAllDevices:v9];
          BOOL v45 = 1;
          goto LABEL_34;
        }
        v44 = +[MLCLog framework];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:](aSelector);
        }
      }
      else
      {
        v44 = +[MLCLog framework];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:]();
        }
      }
      BOOL v45 = 0;
LABEL_34:

      goto LABEL_30;
    }
    v35 = +[MLCLog framework];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:].cold.4();
    }
  }
  else
  {
    v35 = +[MLCLog framework];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[MLCLossLayer compileForDevice:sourceTensors:resultTensor:]();
    }
  }
LABEL_29:
  BOOL v45 = 0;
LABEL_30:

  return v45;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MLCLossLayer;
  id v6 = -[MLCLayer resultSizeFromSourceSize:dimension:](&v13, sel_resultSizeFromSourceSize_dimension_, a3);
  double v7 = [(MLCLossLayer *)self descriptor];
  int v8 = [v7 reductionType];

  if (!v8)
  {
    if (a4 != 1) {
      return (unint64_t)v6;
    }
    id v10 = [(MLCLossLayer *)self descriptor];
    if ([v10 lossType] == 2)
    {
    }
    else
    {
      id v11 = [(MLCLossLayer *)self descriptor];
      int v12 = [v11 lossType];

      if (v12 != 4) {
        return (unint64_t)v6;
      }
    }
  }
  return 1;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v6 = [v4 objectAtIndexedSubscript:0];
  double v7 = [v6 descriptor];
  int v8 = [v7 shape];
  id v9 = [v8 objectAtIndexedSubscript:0];
  unint64_t v10 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v9 unsignedIntegerValue], 0);

  id v11 = [NSNumber numberWithUnsignedInteger:v10];
  [v5 setObject:v11 atIndexedSubscript:0];

  int v12 = [v4 objectAtIndexedSubscript:0];
  objc_super v13 = [v12 descriptor];
  uint64_t v14 = [v13 shape];
  uint64_t v15 = [v14 count];

  v16 = [v4 objectAtIndexedSubscript:0];
  uint64_t v17 = [v16 descriptor];
  v18 = [v17 shape];
  v19 = v18;
  if (v15 == 2)
  {
    v20 = [v18 objectAtIndexedSubscript:1];
    unint64_t v21 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v20 unsignedIntegerValue], 1);

    uint64_t v22 = [NSNumber numberWithUnsignedInteger:v21];
    v23 = v5;
    v24 = v22;
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v26 = [v18 count];

    uint64_t v27 = [v4 objectAtIndexedSubscript:0];
    v28 = [v27 descriptor];
    v29 = [v28 shape];
    v30 = v29;
    if (v26 == 3)
    {
      v31 = [v29 objectAtIndexedSubscript:1];
      unint64_t v32 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v31 unsignedIntegerValue], 1);

      v33 = [v4 objectAtIndexedSubscript:0];
      v34 = [v33 descriptor];
      v35 = [v34 shape];
      v36 = [v35 objectAtIndexedSubscript:2];
      unint64_t v37 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v36 unsignedIntegerValue], 2);

      v38 = [NSNumber numberWithUnsignedInteger:v32];
      [v5 setObject:v38 atIndexedSubscript:1];

      uint64_t v22 = [NSNumber numberWithUnsignedInteger:v37];
      v23 = v5;
      v24 = v22;
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v39 = [v29 count];

      if (v39 != 4) {
        goto LABEL_8;
      }
      unint64_t v40 = [v4 objectAtIndexedSubscript:0];
      v41 = [v40 descriptor];
      v42 = [v41 shape];
      v43 = [v42 objectAtIndexedSubscript:1];
      unint64_t v44 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v43 unsignedIntegerValue], 1);

      BOOL v45 = [v4 objectAtIndexedSubscript:0];
      v46 = [v45 descriptor];
      v47 = [v46 shape];
      v48 = [v47 objectAtIndexedSubscript:2];
      unint64_t v49 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v48 unsignedIntegerValue], 2);

      v50 = [v4 objectAtIndexedSubscript:0];
      v51 = [v50 descriptor];
      __int16 v52 = [v51 shape];
      uint64_t v53 = [v52 objectAtIndexedSubscript:3];
      unint64_t v54 = -[MLCLossLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v53 unsignedIntegerValue], 3);

      int v55 = [NSNumber numberWithUnsignedInteger:v44];
      [v5 setObject:v55 atIndexedSubscript:1];

      __int16 v56 = [NSNumber numberWithUnsignedInteger:v49];
      [v5 setObject:v56 atIndexedSubscript:2];

      uint64_t v22 = [NSNumber numberWithUnsignedInteger:v54];
      v23 = v5;
      v24 = v22;
      uint64_t v25 = 3;
    }
  }
  [v23 setObject:v24 atIndexedSubscript:v25];

LABEL_8:
  id v57 = (void *)[v5 copy];
  uint64_t v58 = [v4 objectAtIndexedSubscript:0];
  v59 = [v58 descriptor];
  v60 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v57, [v59 dataType]);

  v61 = +[MLCTensor tensorWithDescriptor:v60];

  return v61;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(MLCLossLayer *)self descriptor];
  double v7 = [(MLCLayer *)self resultTensors];
  int v8 = [v3 stringWithFormat:@"%@: { lossDescriptor=%@ : resultTensor=%@ }", v5, v6, v7];

  return v8;
}

- (id)summarizedDOTDescription
{
  v24 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  NSUInteger v23 = [(MLCLayer *)self layerID];
  uint64_t v25 = [(MLCLossLayer *)self descriptor];
  uint64_t v5 = MLCLossTypeDebugDescription((MLCLossType)[v25 lossType]);
  id v6 = [(MLCLossLayer *)self descriptor];
  double v7 = MLCReductionTypeDebugDescription((MLCReductionType)[v6 reductionType]);
  int v8 = [(MLCLossLayer *)self descriptor];
  [v8 weight];
  double v10 = v9;
  id v11 = [(MLCLossLayer *)self descriptor];
  [v11 labelSmoothing];
  double v13 = v12;
  uint64_t v14 = [(MLCLossLayer *)self descriptor];
  uint64_t v15 = [v14 classCount];
  v16 = [(MLCLossLayer *)self descriptor];
  [v16 epsilon];
  double v18 = v17;
  v19 = [(MLCLossLayer *)self descriptor];
  [v19 delta];
  unint64_t v21 = [v24 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Loss Type: %@         Reduction Type: %@    Weight: %.03f\n<BR />Label Smoothing: %.03f    Class Count: %lu       Epsilon: %.03f<BR />Delta: %.03f</FONT>>", v4, v23, v5, v7, *(void *)&v10, *(void *)&v13, v15, *(void *)&v18, v20];

  return v21;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (void)linkAssociatedTensors
{
  v3 = [(MLCLossLayer *)self lossLabels];

  if (v3)
  {
    id v5 = [(MLCLossLayer *)self lossLabels];
    id v4 = [v5 childLayers];
    [v4 addObject:self];
  }
}

- (void)unlinkAssociatedTensors
{
  v3 = [(MLCLossLayer *)self lossLabels];

  if (v3)
  {
    id v5 = [(MLCLossLayer *)self lossLabels];
    id v4 = [v5 childLayers];
    [v4 removeObject:self];
  }
}

- (MLCLossDescriptor)descriptor
{
  return self->_descriptor;
}

- (MLCTensor)weights
{
  return self->_weights;
}

- (MLCTensor)lossLabels
{
  return self->_lossLabels;
}

- (void)setLossLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lossLabels, 0);
  objc_storeStrong((id *)&self->_weights, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (void)cosineDistanceLossWithReductionType:(const char *)a1 weight:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: MLCReductionTypeMean not supported with cosine distance loss", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: source tensors cannot be nil=%@", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failure to compile loss layer", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: source and labels tensors in loss layer must have the same shape=%@", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:sourceTensors:resultTensor:.cold.5()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: source tensors in loss layer must have the same shape=%@", v4, v5, v6, v7, v8);
}

@end