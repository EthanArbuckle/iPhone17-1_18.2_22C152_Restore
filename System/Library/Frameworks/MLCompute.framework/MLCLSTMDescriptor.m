@interface MLCLSTMDescriptor
+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount;
+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional dropout:(float)dropout;
+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional returnsSequences:(BOOL)returnsSequences dropout:(float)dropout;
+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional returnsSequences:(BOOL)returnsSequences dropout:(float)dropout resultMode:(MLCLSTMResultMode)resultMode;
+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases isBidirectional:(BOOL)isBidirectional dropout:(float)dropout;
- (BOOL)batchFirst;
- (BOOL)isBidirectional;
- (BOOL)isEqual:(id)a3;
- (BOOL)returnsSequences;
- (BOOL)usesBiases;
- (MLCLSTMDescriptor)initWithInputSize:(unint64_t)a3 hiddenSize:(unint64_t)a4 layerCount:(unint64_t)a5 usesBiases:(BOOL)a6 batchFirst:(BOOL)a7 isBidirectional:(BOOL)a8 returnsSequences:(BOOL)a9 dropout:(float)a10 resultMode:(unint64_t)a11;
- (MLCLSTMResultMode)resultMode;
- (NSUInteger)hiddenSize;
- (NSUInteger)inputSize;
- (NSUInteger)layerCount;
- (float)dropout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLCLSTMDescriptor

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount
{
  return (MLCLSTMDescriptor *)[a1 descriptorWithInputSize:inputSize hiddenSize:hiddenSize layerCount:layerCount usesBiases:1 isBidirectional:0 dropout:0.0];
}

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases isBidirectional:(BOOL)isBidirectional dropout:(float)dropout
{
  return (MLCLSTMDescriptor *)objc_msgSend(a1, "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:dropout:", inputSize, hiddenSize, layerCount, usesBiases, 1, isBidirectional);
}

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional dropout:(float)dropout
{
  LOBYTE(v10) = 1;
  return (MLCLSTMDescriptor *)objc_msgSend(a1, "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:returnsSequences:dropout:", inputSize, hiddenSize, layerCount, usesBiases, batchFirst, isBidirectional, v10);
}

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional returnsSequences:(BOOL)returnsSequences dropout:(float)dropout
{
  LOBYTE(v11) = returnsSequences;
  return (MLCLSTMDescriptor *)objc_msgSend(a1, "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:returnsSequences:dropout:resultMode:", inputSize, hiddenSize, layerCount, usesBiases, batchFirst, isBidirectional, v11, 0);
}

+ (MLCLSTMDescriptor)descriptorWithInputSize:(NSUInteger)inputSize hiddenSize:(NSUInteger)hiddenSize layerCount:(NSUInteger)layerCount usesBiases:(BOOL)usesBiases batchFirst:(BOOL)batchFirst isBidirectional:(BOOL)isBidirectional returnsSequences:(BOOL)returnsSequences dropout:(float)dropout resultMode:(MLCLSTMResultMode)resultMode
{
  BOOL v12 = isBidirectional;
  BOOL v13 = batchFirst;
  BOOL v14 = usesBiases;
  id v18 = objc_alloc((Class)a1);
  LOBYTE(v22) = returnsSequences;
  *(float *)&double v19 = dropout;
  v20 = (void *)[v18 initWithInputSize:inputSize hiddenSize:hiddenSize layerCount:layerCount usesBiases:v14 batchFirst:v13 isBidirectional:v12 returnsSequences:v19 dropout:v22 resultMode:resultMode];

  return (MLCLSTMDescriptor *)v20;
}

- (MLCLSTMDescriptor)initWithInputSize:(unint64_t)a3 hiddenSize:(unint64_t)a4 layerCount:(unint64_t)a5 usesBiases:(BOOL)a6 batchFirst:(BOOL)a7 isBidirectional:(BOOL)a8 returnsSequences:(BOOL)a9 dropout:(float)a10 resultMode:(unint64_t)a11
{
  v19.receiver = self;
  v19.super_class = (Class)MLCLSTMDescriptor;
  result = [(MLCLSTMDescriptor *)&v19 init];
  if (result)
  {
    result->_inputSize = a3;
    result->_hiddenSize = a4;
    result->_usesBiases = a6;
    result->_batchFirst = a7;
    result->_isBidirectional = a8;
    result->_returnsSequences = a9;
    result->_dropout = a10;
    result->_layerCount = a5;
    result->_resultMode = a11;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLSTMDescriptor *)self inputSize];
  NSUInteger v7 = [(MLCLSTMDescriptor *)self hiddenSize];
  NSUInteger v8 = [(MLCLSTMDescriptor *)self layerCount];
  BOOL v9 = [(MLCLSTMDescriptor *)self usesBiases];
  BOOL v10 = [(MLCLSTMDescriptor *)self batchFirst];
  BOOL v11 = [(MLCLSTMDescriptor *)self isBidirectional];
  [(MLCLSTMDescriptor *)self dropout];
  BOOL v13 = [v3 stringWithFormat:@"%@: { inputSize=%lu : hiddenSize=%lu : numberOfLayers=%lu : bias=%d : batchFirst=%d : biDirectional=%d : dropout=%f }", v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 inputSize];
    if (v6 != [(MLCLSTMDescriptor *)self inputSize]) {
      goto LABEL_12;
    }
    uint64_t v7 = [v5 hiddenSize];
    if (v7 != [(MLCLSTMDescriptor *)self hiddenSize]) {
      goto LABEL_12;
    }
    uint64_t v8 = [v5 layerCount];
    if (v8 != [(MLCLSTMDescriptor *)self layerCount]) {
      goto LABEL_12;
    }
    int v9 = [v5 usesBiases];
    if (v9 == [(MLCLSTMDescriptor *)self usesBiases]
      && (int v10 = [v5 batchFirst], v10 == -[MLCLSTMDescriptor batchFirst](self, "batchFirst"))
      && (int v11 = [v5 isBidirectional], v11 == -[MLCLSTMDescriptor isBidirectional](self, "isBidirectional"))&& (v12 = objc_msgSend(v5, "returnsSequences"), v12 == -[MLCLSTMDescriptor returnsSequences](self, "returnsSequences"))&& (objc_msgSend(v5, "dropout"), v14 = v13, -[MLCLSTMDescriptor dropout](self, "dropout"), v14 == v15))
    {
      uint64_t v16 = [v5 resultMode];
      BOOL v17 = v16 == [(MLCLSTMDescriptor *)self resultMode];
    }
    else
    {
LABEL_12:
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  unint64_t v14 = 0;
  char v3 = [(MLCLSTMDescriptor *)self inputSize];
  [(MLCLSTMDescriptor *)self hiddenSize];
  [(MLCLSTMDescriptor *)self layerCount];
  [(MLCLSTMDescriptor *)self usesBiases];
  [(MLCLSTMDescriptor *)self batchFirst];
  [(MLCLSTMDescriptor *)self isBidirectional];
  [(MLCLSTMDescriptor *)self returnsSequences];
  id v4 = NSNumber;
  [(MLCLSTMDescriptor *)self dropout];
  id v5 = objc_msgSend(v4, "numberWithFloat:");
  [v5 hash];
  [(MLCLSTMDescriptor *)self resultMode];
  hashCombine_2(&v14, v6, v7, v8, v9, v10, v11, v12, v3);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  NSUInteger v5 = [(MLCLSTMDescriptor *)self inputSize];
  NSUInteger v6 = [(MLCLSTMDescriptor *)self hiddenSize];
  NSUInteger v7 = [(MLCLSTMDescriptor *)self layerCount];
  BOOL v8 = [(MLCLSTMDescriptor *)self usesBiases];
  BOOL v9 = [(MLCLSTMDescriptor *)self batchFirst];
  BOOL v10 = [(MLCLSTMDescriptor *)self isBidirectional];
  BOOL v11 = [(MLCLSTMDescriptor *)self returnsSequences];
  [(MLCLSTMDescriptor *)self dropout];
  int v13 = v12;
  MLCLSTMResultMode v14 = [(MLCLSTMDescriptor *)self resultMode];
  LOBYTE(v17) = v11;
  LODWORD(v15) = v13;
  return (id)[v4 initWithInputSize:v5 hiddenSize:v6 layerCount:v7 usesBiases:v8 batchFirst:v9 isBidirectional:v10 returnsSequences:v15 dropout:v17 resultMode:v14];
}

- (NSUInteger)inputSize
{
  return self->_inputSize;
}

- (NSUInteger)hiddenSize
{
  return self->_hiddenSize;
}

- (NSUInteger)layerCount
{
  return self->_layerCount;
}

- (BOOL)usesBiases
{
  return self->_usesBiases;
}

- (BOOL)batchFirst
{
  return self->_batchFirst;
}

- (BOOL)isBidirectional
{
  return self->_isBidirectional;
}

- (BOOL)returnsSequences
{
  return self->_returnsSequences;
}

- (float)dropout
{
  return self->_dropout;
}

- (MLCLSTMResultMode)resultMode
{
  return self->_resultMode;
}

@end