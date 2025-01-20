@interface MLCConditionalLayer
+ (id)layerWithTrueBranch:(id)a3 falseBranch:(id)a4;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (MLCConditionalLayer)initWithTrueBranch:(id)a3 falseBranch:(id)a4;
- (MLCGraph)falseBranch;
- (MLCGraph)trueBranch;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (unint64_t)resultSizeForOutputIndex:(unint64_t)a3 dimension:(unint64_t)a4;
@end

@implementation MLCConditionalLayer

+ (id)layerWithTrueBranch:(id)a3 falseBranch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithTrueBranch:v7 falseBranch:v6];

  return v8;
}

- (MLCConditionalLayer)initWithTrueBranch:(id)a3 falseBranch:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLCConditionalLayer;
  v9 = [(MLCLayer *)&v12 initWithLabel:@"Conditonal"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_trueBranch, a3);
    objc_storeStrong((id *)&v10->_falseBranch, a4);
  }

  return v10;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v6 = +[MLCLog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MLCConditionalLayer compileForDevice:sourceTensors:resultTensor:](a2, v6);
  }

  return 0;
}

- (unint64_t)resultSizeForOutputIndex:(unint64_t)a3 dimension:(unint64_t)a4
{
  id v7 = [(MLCConditionalLayer *)self trueBranch];
  id v8 = [v7 graphLayerList];
  v9 = [(MLCConditionalLayer *)self trueBranch];
  v10 = [v9 graphLayerList];
  v11 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
  objc_super v12 = [v11 resultTensors];

  v13 = [v12 objectAtIndexedSubscript:0];
  v14 = [v13 descriptor];
  v15 = [v14 shape];
  v16 = [v15 objectAtIndexedSubscript:a4];
  unint64_t v17 = [v16 unsignedIntegerValue];

  v18 = [(MLCConditionalLayer *)self falseBranch];
  v19 = [v18 graphLayerList];
  v20 = [(MLCConditionalLayer *)self falseBranch];
  v21 = [v20 graphLayerList];
  v22 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v21, "count") - 1);
  v23 = [v22 resultTensors];

  v24 = [v23 objectAtIndexedSubscript:0];
  v25 = [v24 descriptor];
  v26 = [v25 shape];
  v27 = [v26 objectAtIndexedSubscript:a4];
  uint64_t v28 = [v27 unsignedIntegerValue];

  if (v17 != v28)
  {
    v29 = +[MLCLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MLCConditionalLayer resultSizeForOutputIndex:dimension:](a2, a4, v29);
    }

    unint64_t v17 = 0;
  }

  return v17;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    id v7 = [v4 objectAtIndexedSubscript:0];
    id v8 = [v7 descriptor];
    v9 = [v8 shape];
    unint64_t v10 = [v9 count];

    if (i >= v10) {
      break;
    }
    unint64_t v11 = [(MLCConditionalLayer *)self resultSizeForOutputIndex:0 dimension:i];
    objc_super v12 = [NSNumber numberWithUnsignedInteger:v11];
    [v5 setObject:v12 atIndexedSubscript:i];
  }
  v13 = (void *)[v5 copy];
  v14 = +[MLCTensorDescriptor descriptorWithShape:v13 dataType:4];

  v15 = +[MLCTensor tensorWithDescriptor:v14];

  return v15;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MLCLayer *)self sourceTensors];
  id v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [(MLCConditionalLayer *)self trueBranch];
  v9 = [(MLCConditionalLayer *)self falseBranch];
  unint64_t v10 = [(MLCLayer *)self conditionalTreeNode];
  unint64_t v11 = [(MLCLayer *)self resultTensors];
  objc_super v12 = [v3 stringWithFormat:@"%@: { predicate=%@ : trueBranch=%p : falseBranch=%p : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v7, v8, v9, v10, v11];

  return v12;
}

- (MLCGraph)trueBranch
{
  return self->_trueBranch;
}

- (MLCGraph)falseBranch
{
  return self->_falseBranch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_falseBranch, 0);

  objc_storeStrong((id *)&self->_trueBranch, 0);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(NSObject *)a2 resultTensor:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: Conditional must not be present in the graph during compilation.", (uint8_t *)&v4, 0xCu);
}

- (void)resultSizeForOutputIndex:(NSObject *)a3 dimension:.cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: Result tensors of true and false branches have different shape at dimension = %lu", (uint8_t *)&v6, 0x16u);
}

@end