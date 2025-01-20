@interface CHRecurrentNeuralNetwork
+ (id)normalizedDrawing:(id)a3 scaleFactor:(double)a4 interpolationDistance:(double)a5 outputPointMap:(void *)a6;
- (CHRecurrentNeuralNetwork)initWithModelName:(id)a3;
- (NSString)modelName;
- (id)normalizedDrawing:(id)a3 targetHeight:(double)a4 minimumDrawingSize:(CGSize)a5 interpolationDistance:(double)a6 outScaleFactor:(double *)a7 outputPointMap:(void *)a8;
@end

@implementation CHRecurrentNeuralNetwork

- (CHRecurrentNeuralNetwork)initWithModelName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CHRecurrentNeuralNetwork;
  v10 = [(CHRecurrentNeuralNetwork *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_stringByDeletingPathExtension(v4, v5, v6, v7, v8, v9);
    modelName = v10->_modelName;
    v10->_modelName = (NSString *)v11;
  }
  return v10;
}

- (id)normalizedDrawing:(id)a3 targetHeight:(double)a4 minimumDrawingSize:(CGSize)a5 interpolationDistance:(double)a6 outScaleFactor:(double *)a7 outputPointMap:(void *)a8
{
  double height = a5.height;
  id v13 = a3;
  objc_msgSend_averageCharacterHeightEstimation_minChunkHeight_(v13, v14, v15, v16, v17, v18, 5.0, height * 0.5);
  if (v22 <= height) {
    double v22 = height;
  }
  double v23 = a4 / v22;
  v24 = objc_msgSend_normalizedDrawing_scaleFactor_interpolationDistance_outputPointMap_(CHRecurrentNeuralNetwork, v19, (uint64_t)v13, (uint64_t)a8, v20, v21, v23, a6);
  if (a7) {
    *a7 = v23;
  }

  return v24;
}

+ (id)normalizedDrawing:(id)a3 scaleFactor:(double)a4 interpolationDistance:(double)a5 outputPointMap:(void *)a6
{
  id v9 = a3;
  objc_msgSend_bounds(v9, v10, v11, v12, v13, v14);
  double v22 = objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v9, v17, v18, v19, v20, v21, -v15, -v16, a4);
  v27 = objc_msgSend_drawingSpatiallyResampled_outputPointMap_(v22, v23, (uint64_t)a6, v24, v25, v26, a5);

  return v27;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void).cxx_destruct
{
}

@end