@interface MLCTensorParameter
+ (MLCTensorParameter)parameterWithTensor:(MLCTensor *)tensor;
+ (MLCTensorParameter)parameterWithTensor:(MLCTensor *)tensor optimizerData:(NSArray *)optimizerData;
- (BOOL)allocateDataForOptimizer:(id)a3 device:(id)a4 isVector:(BOOL)a5;
- (BOOL)isUpdatable;
- (MLCDevice)device;
- (MLCTensor)tensor;
- (MLCTensorParameter)initWithTensor:(id)a3 optimizerData:(id)a4;
- (void)setDevice:(id)a3;
- (void)setIsUpdatable:(BOOL)isUpdatable;
@end

@implementation MLCTensorParameter

+ (MLCTensorParameter)parameterWithTensor:(MLCTensor *)tensor
{
  v4 = tensor;
  v5 = (void *)[objc_alloc((Class)a1) initWithTensor:v4 optimizerData:0];

  return (MLCTensorParameter *)v5;
}

+ (MLCTensorParameter)parameterWithTensor:(MLCTensor *)tensor optimizerData:(NSArray *)optimizerData
{
  v6 = optimizerData;
  v7 = tensor;
  v8 = (void *)[objc_alloc((Class)a1) initWithTensor:v7 optimizerData:v6];

  return (MLCTensorParameter *)v8;
}

- (MLCTensorParameter)initWithTensor:(id)a3 optimizerData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLCTensorParameter;
  v9 = [(MLCTensorParameter *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tensor, a3);
    if (v8)
    {
      v11 = (void *)[v8 copy];
      [v7 setOptimizerData:v11];
    }
    device = v10->_device;
    v10->_device = 0;

    v10->_isUpdatable = 1;
  }

  return v10;
}

- (BOOL)allocateDataForOptimizer:(id)a3 device:(id)a4 isVector:(BOOL)a5
{
  uint64_t v5 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 numOptimizerDataBuffers];
  v12 = [(MLCTensorParameter *)self tensor];
  v13 = [v12 optimizerData];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    v43 = a2;
    v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v16 = [(MLCTensorParameter *)self tensor];
    v17 = [v16 descriptor];
    unint64_t v18 = [v17 tensorAllocationSizeInBytes];

    if (v11)
    {
      uint64_t v19 = 0;
      size_t v20 = v18 >> 2;
      unint64_t v21 = v18 & 0xFFFFFFFFFFFFFFFCLL;
      do
      {
        v22 = +[MLCTensorData dataWithBytesNoCopy:malloc_type_calloc(v20, 4uLL, 0x100004052888210uLL) length:v21 freeWhenDone:1];
        [v15 setObject:v22 atIndexedSubscript:v19];

        ++v19;
      }
      while (v11 != v19);
    }
    v23 = (void *)[v15 copy];
    v24 = [(MLCTensorParameter *)self tensor];
    [v24 setOptimizerData:v23];

    a2 = v43;
    uint64_t v5 = v5;
  }
  v25 = [(MLCTensorParameter *)self tensor];
  uint64_t v26 = [v25 optimizerDeviceData];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(MLCTensorParameter *)self tensor];
    v29 = [v28 optimizerDeviceData];
    uint64_t v30 = [v29 count];

    if (v30)
    {
      uint64_t v31 = [(MLCTensorParameter *)self device];
      if (!v31
        || (v32 = (void *)v31,
            [(MLCTensorParameter *)self device],
            id v33 = (id)objc_claimAutoreleasedReturnValue(),
            v33,
            v32,
            v33 == v10))
      {
        [(MLCTensorParameter *)self setDevice:v10];
LABEL_15:
        BOOL v40 = 1;
        goto LABEL_19;
      }
    }
  }
  else
  {
  }
  v34 = [v10 computeEngine];
  v35 = [(MLCTensorParameter *)self tensor];
  v36 = [(MLCTensorParameter *)self tensor];
  v37 = [v36 optimizerData];
  v38 = [v34 createOptimizerDeviceDataForTensor:v35 optimizer:v9 optimizerData:v37 isVector:v5];

  if (v38 && [v38 count])
  {
    [(MLCTensorParameter *)self setDevice:v10];
    v39 = [(MLCTensorParameter *)self tensor];
    [v39 setOptimizerDeviceData:v38];

    goto LABEL_15;
  }
  v41 = +[MLCLog framework];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    -[MLCTensorParameter allocateDataForOptimizer:device:isVector:](a2, (uint64_t)v38, v41);
  }

  BOOL v40 = 0;
LABEL_19:

  return v40;
}

- (MLCTensor)tensor
{
  return self->_tensor;
}

- (BOOL)isUpdatable
{
  return self->_isUpdatable;
}

- (void)setIsUpdatable:(BOOL)isUpdatable
{
  self->_isUpdatable = isUpdatable;
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_tensor, 0);
}

- (void)allocateDataForOptimizer:(const char *)a1 device:(uint64_t)a2 isVector:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: failure to create deviceParameter=%@", (uint8_t *)&v6, 0x16u);
}

@end