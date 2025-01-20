@interface MLCSelectionLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCSelectionLayer)layer;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCSelectionLayer)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
@end

@implementation MLCSelectionLayer

+ (MLCSelectionLayer)layer
{
  id v2 = objc_alloc_init((Class)a1);

  return (MLCSelectionLayer *)v2;
}

- (MLCSelectionLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)MLCSelectionLayer;
  return [(MLCLayer *)&v3 initWithLabel:@"Selection"];
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCSelectionLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_18;
  }
  if ([v10 count] != 3)
  {
    v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCSelectionLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
    }
    goto LABEL_18;
  }
  v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  int v14 = [v13 dataType];

  if (v14 != 4)
  {
    v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCSelectionLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_18;
  }
  v15 = [v9 computeEngine];
  char v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0)
  {
    v18 = 0;
LABEL_15:
    v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v18, v21);
    }

LABEL_18:
    char v20 = 0;
    goto LABEL_19;
  }
  v17 = [v9 computeEngine];
  v18 = [v17 selectLayer];

  if (!v18 || ![v18 count]) {
    goto LABEL_15;
  }
  v19 = [v9 computeEngine];
  char v20 = [v19 compileLayerDeviceOps:v18 sourceTensors:v10 resultTensor:v11];

  v23.receiver = self;
  v23.super_class = (Class)MLCSelectionLayer;
  [(MLCLayer *)&v23 bindDevice:v9 deviceOps:v18];
LABEL_19:

  return v20;
}

- (id)resultTensorFromSources:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1E01B11E0]();
  v5 = [v4 objectAtIndexedSubscript:1];
  v6 = [v5 descriptor];
  uint64_t v7 = [v6 dataType];

  v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  id v9 = [v4 objectAtIndexedSubscript:0];
  v24[0] = v9;
  id v10 = [v4 objectAtIndexedSubscript:1];
  v24[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v22.receiver = self;
  v22.super_class = (Class)MLCSelectionLayer;
  v12 = [(MLCLayer *)&v22 resultTensorsFromBroadcastableSources:v11 resultTensorDataType:v7];
  [v8 setObject:v12 atIndexedSubscript:0];

  v13 = [v4 objectAtIndexedSubscript:1];
  v23[0] = v13;
  int v14 = [v4 objectAtIndexedSubscript:2];
  v23[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v21.receiver = self;
  v21.super_class = (Class)MLCSelectionLayer;
  char v16 = [(MLCLayer *)&v21 resultTensorsFromBroadcastableSources:v15 resultTensorDataType:v7];
  [v8 setObject:v16 atIndexedSubscript:1];

  v20.receiver = self;
  v20.super_class = (Class)MLCSelectionLayer;
  v17 = [(MLCLayer *)&v20 resultTensorsFromBroadcastableSources:v8 resultTensorDataType:v7];

  return v17;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 1 || a3 == 4;
}

- (id)description
{
  id v2 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"%@", v4];

  return v5;
}

- (id)summarizedDOTDescription
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\"></FONT>>", v5, -[MLCLayer layerID](self, "layerID")];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: no source tensors specified", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: data type for the condition tensor must be BOOLean", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: source tensors count must be 3", v4, v5, v6, v7, v8);
}

@end