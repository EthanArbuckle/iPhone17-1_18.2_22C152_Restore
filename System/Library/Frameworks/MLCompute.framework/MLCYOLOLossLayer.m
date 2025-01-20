@interface MLCYOLOLossLayer
+ (MLCYOLOLossLayer)layerWithDescriptor:(MLCYOLOLossDescriptor *)lossDescriptor;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (MLCYOLOLossDescriptor)yoloLossDescriptor;
- (MLCYOLOLossLayer)initWithLossDescriptor:(id)a3;
- (id)description;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
@end

@implementation MLCYOLOLossLayer

+ (MLCYOLOLossLayer)layerWithDescriptor:(MLCYOLOLossDescriptor *)lossDescriptor
{
  v4 = lossDescriptor;
  v5 = (void *)[objc_alloc((Class)a1) initWithLossDescriptor:v4];

  return (MLCYOLOLossLayer *)v5;
}

- (MLCYOLOLossLayer)initWithLossDescriptor:(id)a3
{
  id v5 = a3;
  v6 = [v5 spatialPositionLossDescriptor];
  v9.receiver = self;
  v9.super_class = (Class)MLCYOLOLossLayer;
  v7 = [(MLCLossLayer *)&v9 initWithDescriptor:v6 weights:0];

  if (v7) {
    objc_storeStrong((id *)&v7->_yoloLossDescriptor, a3);
  }

  return v7;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  uint64_t v14 = [v13 dataType];

  if (!+[MLCLayer supportsDataType:v14 onDevice:v9])
  {
    v35 = +[MLCLog framework];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v37 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v40 = v37;
      __int16 v41 = 1024;
      int v42 = v14;
      __int16 v43 = 2112;
      id v44 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v35, OS_LOG_TYPE_ERROR, "%@: YOLOLoss layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
    v29 = 0;
    goto LABEL_11;
  }
  v15 = [v10 objectAtIndexedSubscript:0];
  v16 = [v15 descriptor];
  v17 = [v16 shape];
  v18 = [v17 objectAtIndexedSubscript:0];
  unint64_t v19 = [v18 unsignedIntegerValue];

  float v20 = 1.0 / (float)v19;
  v21 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v21 scaleNoObjectConfidenceLoss];
  *(float *)&double v23 = v20 * v22;
  [v21 setScaleNoObjectConfidenceLoss:v23];

  v24 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v24 scaleObjectConfidenceLoss];
  *(float *)&double v26 = v20 * v25;
  [v24 setScaleObjectConfidenceLoss:v26];

  v27 = [v9 computeEngine];
  v28 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  v29 = [v27 lossYOLOLayerWithDescriptor:v28];

  if (!v29 || ![v29 count])
  {
    v35 = +[MLCLog framework];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v29, v35);
    }
LABEL_11:
    char v31 = 0;
    goto LABEL_12;
  }
  v30 = [v9 computeEngine];
  char v31 = [v30 compileLayerDeviceOps:v29 sourceTensors:v10 resultTensor:v11];

  v38.receiver = self;
  v38.super_class = (Class)MLCYOLOLossLayer;
  [(MLCLayer *)&v38 bindDevice:v9 deviceOps:v29];
  v32 = [v9 engine];
  v33 = [v32 deviceList];
  unint64_t v34 = [v33 count];

  if (v34 >= 2)
  {
    v35 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
    objc_msgSend(v11, "setMultiDeviceReductionType:", -[NSObject reductionType](v35, "reductionType"));
LABEL_12:
  }
  return v31;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MLCYOLOLossLayer;
  unint64_t result = -[MLCLossLayer resultSizeFromSourceSize:dimension:](&v10, sel_resultSizeFromSourceSize_dimension_, a3);
  unint64_t v7 = result;
  if (a4 == 1)
  {
    v8 = [(MLCLossLayer *)self descriptor];
    int v9 = [v8 reductionType];

    if (v9) {
      return 1;
    }
    else {
      return v7;
    }
  }
  else if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    return 1;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  unint64_t v7 = [(MLCLayer *)self resultTensors];
  v8 = [v3 stringWithFormat:@"%@: { lossDescriptor=%@ : resultTensor=%@ }", v5, v6, v7];

  return v8;
}

- (id)summarizedDOTDescription
{
  char v31 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  NSUInteger v30 = [(MLCLayer *)self layerID];
  v32 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  uint64_t v29 = [v32 anchorBoxCount];
  id v5 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  unsigned int v6 = [v5 shouldRescore];
  unint64_t v7 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v7 scaleSpatialPositionLoss];
  double v9 = v8;
  objc_super v10 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v10 scaleSpatialSizeLoss];
  double v12 = v11;
  v13 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v13 scaleNoObjectConfidenceLoss];
  double v15 = v14;
  v16 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v16 scaleObjectConfidenceLoss];
  double v18 = v17;
  unint64_t v19 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v19 scaleClassLoss];
  double v21 = v20;
  float v22 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v22 minimumIOUForObjectPresence];
  double v24 = v23;
  float v25 = [(MLCYOLOLossLayer *)self yoloLossDescriptor];
  [v25 maximumIOUForObjectAbsence];
  v27 = [v31 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Anchor Box Count: %lu    Should Rescore: %hhd<BR />Scale Spatial Position Loss: %.03f    Scale Spatial Size Loss: %.03f<BR />Scale No Object Confidence Loss: %.03f    Scale Object Confidence Loss: %.03f<BR />Scale Class Loss: %.03f    Minimum IOU For Object Presence: %.03f<BR />Maximum IOU For Object Absence: %.03f</FONT>>", v4, v30, v29, v6, *(void *)&v9, *(void *)&v12, *(void *)&v15, *(void *)&v18, *(void *)&v21, *(void *)&v24, v26];

  return v27;
}

- (MLCYOLOLossDescriptor)yoloLossDescriptor
{
  return self->_yoloLossDescriptor;
}

- (void).cxx_destruct
{
}

@end