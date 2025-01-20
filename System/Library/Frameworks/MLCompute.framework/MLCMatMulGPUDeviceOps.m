@interface MLCMatMulGPUDeviceOps
+ (id)deviceOps;
+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5;
- (MLCMatMulGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5;
- (NSArray)broadcastingFlags;
- (NSArray)gradientLeftRightMatrixSelectionFlags;
- (NSArray)shapes;
- (NSArray)transposeLeft;
- (NSArray)transposeRight;
- (NSMutableArray)forwardMatricesOrNDArrays;
- (NSMutableArray)gradientMatricesOrNDArrays;
- (NSMutableArray)matrixDescs;
- (NSMutableArray)reductionShapes;
- (id)matmulKernel;
- (id)reduceSumKernel;
- (void)setBroadcastingFlags:(id)a3;
- (void)setForwardMatricesOrNDArrays:(id)a3;
- (void)setGradientLeftRightMatrixSelectionFlags:(id)a3;
- (void)setGradientMatricesOrNDArrays:(id)a3;
- (void)setMatmulKernel:(id)a3;
- (void)setMatrixDescs:(id)a3;
- (void)setReduceSumKernel:(id)a3;
- (void)setReductionShapes:(id)a3;
- (void)setShapes:(id)a3;
- (void)setTransposeLeft:(id)a3;
- (void)setTransposeRight:(id)a3;
@end

@implementation MLCMatMulGPUDeviceOps

+ (id)deviceOps
{
  v2 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:0 gradientKernel:0 secondaryGradientKernel:0];

  return v2;
}

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v10 gradientKernel:v9 secondaryGradientKernel:v8];

  return v11;
}

- (MLCMatMulGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4 secondaryGradientKernel:(id)a5
{
  v29.receiver = self;
  v29.super_class = (Class)MLCMatMulGPUDeviceOps;
  v5 = [(MLCGPUDeviceOps *)&v29 initWithForwardKernel:a3 gradientKernel:a4 secondaryGradientKernel:a5 forwardStatistics:0 gradientStatistics:0];
  v6 = v5;
  if (v5)
  {
    id matmulKernel = v5->_matmulKernel;
    v5->_id matmulKernel = 0;

    id reduceSumKernel = v6->_reduceSumKernel;
    v6->_id reduceSumKernel = 0;

    id v9 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v10 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    matrixDescs = v6->_matrixDescs;
    v6->_matrixDescs = (NSMutableArray *)v10;

    uint64_t v12 = [v9 mutableCopy];
    forwardMatricesOrNDArrays = v6->_forwardMatricesOrNDArrays;
    v6->_forwardMatricesOrNDArrays = (NSMutableArray *)v12;

    uint64_t v14 = [v9 mutableCopy];
    gradientMatricesOrNDArrays = v6->_gradientMatricesOrNDArrays;
    v6->_gradientMatricesOrNDArrays = (NSMutableArray *)v14;

    uint64_t v16 = [v9 copy];
    shapes = v6->_shapes;
    v6->_shapes = (NSArray *)v16;

    uint64_t v18 = [v9 copy];
    transposeLeft = v6->_transposeLeft;
    v6->_transposeLeft = (NSArray *)v18;

    uint64_t v20 = [v9 copy];
    transposeRight = v6->_transposeRight;
    v6->_transposeRight = (NSArray *)v20;

    uint64_t v22 = [v9 copy];
    gradientLeftRightMatrixSelectionFlags = v6->_gradientLeftRightMatrixSelectionFlags;
    v6->_gradientLeftRightMatrixSelectionFlags = (NSArray *)v22;

    uint64_t v24 = [v9 copy];
    broadcastingFlags = v6->_broadcastingFlags;
    v6->_broadcastingFlags = (NSArray *)v24;

    uint64_t v26 = [v9 mutableCopy];
    reductionShapes = v6->_reductionShapes;
    v6->_reductionShapes = (NSMutableArray *)v26;
  }
  return v6;
}

- (id)matmulKernel
{
  return self->_matmulKernel;
}

- (void)setMatmulKernel:(id)a3
{
}

- (id)reduceSumKernel
{
  return self->_reduceSumKernel;
}

- (void)setReduceSumKernel:(id)a3
{
}

- (NSMutableArray)matrixDescs
{
  return self->_matrixDescs;
}

- (void)setMatrixDescs:(id)a3
{
}

- (NSMutableArray)forwardMatricesOrNDArrays
{
  return self->_forwardMatricesOrNDArrays;
}

- (void)setForwardMatricesOrNDArrays:(id)a3
{
}

- (NSMutableArray)gradientMatricesOrNDArrays
{
  return self->_gradientMatricesOrNDArrays;
}

- (void)setGradientMatricesOrNDArrays:(id)a3
{
}

- (NSArray)shapes
{
  return self->_shapes;
}

- (void)setShapes:(id)a3
{
}

- (NSArray)transposeLeft
{
  return self->_transposeLeft;
}

- (void)setTransposeLeft:(id)a3
{
}

- (NSArray)transposeRight
{
  return self->_transposeRight;
}

- (void)setTransposeRight:(id)a3
{
}

- (NSArray)gradientLeftRightMatrixSelectionFlags
{
  return self->_gradientLeftRightMatrixSelectionFlags;
}

- (void)setGradientLeftRightMatrixSelectionFlags:(id)a3
{
}

- (NSArray)broadcastingFlags
{
  return self->_broadcastingFlags;
}

- (void)setBroadcastingFlags:(id)a3
{
}

- (NSMutableArray)reductionShapes
{
  return self->_reductionShapes;
}

- (void)setReductionShapes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reductionShapes, 0);
  objc_storeStrong((id *)&self->_broadcastingFlags, 0);
  objc_storeStrong((id *)&self->_gradientLeftRightMatrixSelectionFlags, 0);
  objc_storeStrong((id *)&self->_transposeRight, 0);
  objc_storeStrong((id *)&self->_transposeLeft, 0);
  objc_storeStrong((id *)&self->_shapes, 0);
  objc_storeStrong((id *)&self->_gradientMatricesOrNDArrays, 0);
  objc_storeStrong((id *)&self->_forwardMatricesOrNDArrays, 0);
  objc_storeStrong((id *)&self->_matrixDescs, 0);
  objc_storeStrong(&self->_reduceSumKernel, 0);

  objc_storeStrong(&self->_matmulKernel, 0);
}

@end