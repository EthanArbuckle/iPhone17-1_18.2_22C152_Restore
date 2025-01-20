@interface MLCPhiLayer
+ (id)layerWithControlTreeNode:(id)a3 sources:(id)a4 resultTensor:(id)a5;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (MLCPhiLayer)initWithControlTreeNode:(id)a3 sources:(id)a4 resultTensor:(id)a5;
- (id)description;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
@end

@implementation MLCPhiLayer

+ (id)layerWithControlTreeNode:(id)a3 sources:(id)a4 resultTensor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithControlTreeNode:v10 sources:v9 resultTensor:v8];

  return v11;
}

- (MLCPhiLayer)initWithControlTreeNode:(id)a3 sources:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count] == 2)
  {
    v39 = a2;
    v40 = self;
    id v41 = v9;
    v12 = [v11 descriptor];
    v13 = [v12 shape];
    uint64_t v14 = [v13 count];

    uint64_t v42 = [v10 count];
    if (v42)
    {
      uint64_t v15 = 0;
      id v43 = v10;
      id v44 = v11;
      while (1)
      {
        v16 = [v10 objectAtIndexedSubscript:v15];
        v17 = [v16 descriptor];
        v18 = [v17 shape];
        uint64_t v19 = [v18 count];

        if (v14 != v19)
        {
          v38 = +[MLCLog framework];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[MLCPhiLayer initWithControlTreeNode:sources:resultTensor:](v39);
          }

          v34 = 0;
          self = v40;
          id v9 = v41;
          goto LABEL_19;
        }
        if (v14) {
          break;
        }
LABEL_9:
        if (++v15 == v42) {
          goto LABEL_10;
        }
      }
      uint64_t v20 = 0;
      while (1)
      {
        uint64_t v21 = v14;
        v22 = [v11 descriptor];
        v23 = [v22 shape];
        v24 = [v23 objectAtIndexedSubscript:v20];
        uint64_t v25 = v15;
        v26 = [v10 objectAtIndexedSubscript:v15];
        v27 = [v26 descriptor];
        v28 = [v27 shape];
        v29 = [v28 objectAtIndexedSubscript:v20];

        if (v24 != v29) {
          break;
        }
        ++v20;
        uint64_t v14 = v21;
        id v10 = v43;
        id v11 = v44;
        uint64_t v15 = v25;
        if (v21 == v20) {
          goto LABEL_9;
        }
      }
      v36 = +[MLCLog framework];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[MLCPhiLayer initWithControlTreeNode:sources:resultTensor:](v39);
      }

      v34 = 0;
      self = v40;
      id v9 = v41;
      id v10 = v43;
      id v11 = v44;
    }
    else
    {
LABEL_10:
      v48.receiver = v40;
      v48.super_class = (Class)MLCPhiLayer;
      v30 = [(MLCLayer *)&v48 initWithLabel:@"Phi"];
      v31 = v30;
      id v9 = v41;
      if (v30)
      {
        v47.receiver = v30;
        v47.super_class = (Class)MLCPhiLayer;
        v32 = [(MLCLayer *)&v47 sourceTensors];
        [v32 addObjectsFromArray:v10];

        v46.receiver = v31;
        v46.super_class = (Class)MLCPhiLayer;
        v33 = [(MLCLayer *)&v46 resultTensors];
        [v33 addObject:v11];

        v45.receiver = v31;
        v45.super_class = (Class)MLCPhiLayer;
        [(MLCLayer *)&v45 setConditionalTreeNode:v41];
      }
      self = v31;
      v34 = self;
    }
  }
  else
  {
    v35 = +[MLCLog framework];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[MLCPhiLayer initWithControlTreeNode:sources:resultTensor:](a2);
    }

    v34 = 0;
  }
LABEL_19:

  return v34;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)MLCPhiLayer;
  -[MLCLayer bindDevice:deviceOps:](&v6, sel_bindDevice_deviceOps_, a3, 0, a5);
  return 1;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCPhiLayer resultSizeFromSourceSize:dimension:](a2);
  }

  return 0;
}

- (id)description
{
  uint64_t v15 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v16 = [(MLCLayer *)self sourceTensors];
  v5 = [v16 objectAtIndexedSubscript:0];
  objc_super v6 = [v5 label];
  v7 = [(MLCLayer *)self sourceTensors];
  id v8 = [v7 objectAtIndexedSubscript:1];
  id v9 = [v8 label];
  id v10 = [(MLCLayer *)self conditionalTreeNode];
  id v11 = [(MLCLayer *)self resultTensors];
  v12 = [v11 objectAtIndexedSubscript:0];
  v13 = [v15 stringWithFormat:@"%@: { sources = [%@, %@] : predicate = %@ : result = %@ }", v4, v6, v9, v10, v12];

  return v13;
}

- (void)initWithControlTreeNode:(const char *)a1 sources:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Result and source tensors have different shape.", v4, v5, v6, v7, v8);
}

- (void)initWithControlTreeNode:(const char *)a1 sources:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Two source tensors are expected in phi layer.", v4, v5, v6, v7, v8);
}

- (void)resultSizeFromSourceSize:(const char *)a1 dimension:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: resultSizeFromSourceSize:dimension must not be used for phi layer", v4, v5, v6, v7, v8);
}

@end