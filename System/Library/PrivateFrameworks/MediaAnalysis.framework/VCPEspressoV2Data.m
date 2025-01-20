@interface VCPEspressoV2Data
- (VCPEspressoV2Data)initWithTensorType:(unint64_t)a3 size:(unint64_t)a4;
- (VCPEspressoV2Data)initWithTensorType:(unint64_t)a3 size:(unint64_t)a4 dataPtr:(void *)a5;
- (int64_t)tensorType;
- (unint64_t)tensorSize;
- (void)copyDataFrom:(void *)a3 srcStart:(unint64_t)a4 dstStart:(unint64_t)a5 length:(unint64_t)a6;
- (void)dealloc;
- (void)getData:(unint64_t)a3;
- (void)setData:(id)a3 padding:(id)a4;
- (void)setValue:(id)a3 atIndex:(unint64_t)a4;
- (void)setValueFP:(float)_S0 atIndex:(unint64_t)a4;
@end

@implementation VCPEspressoV2Data

- (VCPEspressoV2Data)initWithTensorType:(unint64_t)a3 size:(unint64_t)a4 dataPtr:(void *)a5
{
  v6 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 >= 3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v15 = a3;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "Unsupported Tensor type %lu", buf, 0xCu);
      }
    }
    v9 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VCPEspressoV2Data;
    v9 = [(VCPEspressoV2Data *)&v13 init];
    if (v9)
    {
      v9->_tensorType = a3;
      v9->_tensorSize = a4;
      v9->_dataPtr = a5;
      v6 = v9;
      v9->_allocated = 0;
    }
    else
    {
      v6 = 0;
    }
  }
  v11 = v9;

  return v11;
}

- (VCPEspressoV2Data)initWithTensorType:(unint64_t)a3 size:(unint64_t)a4
{
  v5 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3 >= 3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v17 = a3;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "Unsupported Tensor type %lu", buf, 0xCu);
      }
    }
    goto LABEL_23;
  }
  v15.receiver = self;
  v15.super_class = (Class)VCPEspressoV2Data;
  v8 = [(VCPEspressoV2Data *)&v15 init];
  v5 = v8;
  if (!v8)
  {
LABEL_23:
    v11 = 0;
    goto LABEL_24;
  }
  v8->_tensorType = a3;
  v8->_tensorSize = a4;
  v8->_allocated = 1;
  if (a3)
  {
    if (a3 == 1)
    {
      if ((a4 & 0x8000000000000000) != 0) {
        size_t v9 = -1;
      }
      else {
        size_t v9 = 2 * a4;
      }
      goto LABEL_16;
    }
    if (a3 != 2)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "Unsupported tensor type", buf, 2u);
        }
      }
      goto LABEL_23;
    }
  }
  if (a4 >> 62) {
    size_t v9 = -1;
  }
  else {
    size_t v9 = 4 * a4;
  }
LABEL_16:
  v10 = operator new[](v9, MEMORY[0x1E4FBA2D0]);
  v5->_dataPtr = v10;
  if (v10) {
    v11 = v5;
  }
  else {
    v11 = 0;
  }
LABEL_24:
  objc_super v13 = v11;

  return v13;
}

- (void)dealloc
{
  if (self->_dataPtr && self->_allocated)
  {
    if (self->_tensorType <= 2uLL) {
      goto LABEL_9;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v3 = VCPLogInstance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "unsupported tensor type with valid data pointer", buf, 2u);
      }
    }
    if (self->_dataPtr) {
LABEL_9:
    }
      MEMORY[0x1C186C790]();
    self->_dataPtr = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPEspressoV2Data;
  [(VCPEspressoV2Data *)&v4 dealloc];
}

- (void)setData:(id)a3 padding:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (self->_tensorSize)
  {
    unint64_t v7 = 0;
    do
    {
      if (v7 >= [v9 count])
      {
        [(VCPEspressoV2Data *)self setValue:v6 atIndex:v7];
      }
      else
      {
        v8 = [v9 objectAtIndexedSubscript:v7];
        [(VCPEspressoV2Data *)self setValue:v8 atIndex:v7];
      }
      ++v7;
    }
    while (v7 < self->_tensorSize);
  }
}

- (void)setValue:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = v6;
  if (self->_tensorSize <= a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t tensorSize = self->_tensorSize;
        int v21 = 134218240;
        unint64_t v22 = a4;
        __int16 v23 = 2048;
        unint64_t v24 = tensorSize;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "Setting data out of boundary (%llu - %llu)", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    int64_t tensorType = self->_tensorType;
    if (tensorType == 2)
    {
      dataPtr = self->_dataPtr;
      [v6 floatValue];
      dataPtr[a4] = v13;
    }
    else if (tensorType == 1)
    {
      v14 = self->_dataPtr;
      [v6 floatValue];
      __asm { FCVT            H0, S0 }
      v14[a4] = _S0;
    }
    else if (tensorType)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "Unsupported tensor type", (uint8_t *)&v21, 2u);
        }
      }
    }
    else
    {
      id v9 = self->_dataPtr;
      v9[a4] = [v6 intValue];
    }
  }
}

- (void)setValueFP:(float)_S0 atIndex:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_tensorSize <= a4)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      unint64_t v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t tensorSize = self->_tensorSize;
        int v15 = 134218240;
        unint64_t v16 = a4;
        __int16 v17 = 2048;
        unint64_t v18 = tensorSize;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "Setting data out of boundary (%llu - %llu)", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    int64_t tensorType = self->_tensorType;
    if (tensorType == 2)
    {
      *((float *)self->_dataPtr + a4) = _S0;
    }
    else if (tensorType == 1)
    {
      __asm { FCVT            H0, S0 }
      *((_WORD *)self->_dataPtr + a4) = _H0;
    }
    else if (tensorType)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v14 = VCPLogInstance();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "Unsupported tensor type", (uint8_t *)&v15, 2u);
        }
      }
    }
    else
    {
      *((_DWORD *)self->_dataPtr + a4) = (int)_S0;
    }
  }
}

- (void)getData:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 < 3)
  {
    if (self->_tensorType == a3) {
      return self->_dataPtr;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "tensor type mismatch!", (uint8_t *)&v7, 2u);
      }
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    objc_super v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 134217984;
      unint64_t v8 = a3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "Unsupported Tensor type %lu", (uint8_t *)&v7, 0xCu);
    }
  }
  return 0;
}

- (void)copyDataFrom:(void *)a3 srcStart:(unint64_t)a4 dstStart:(unint64_t)a5 length:(unint64_t)a6
{
  int64_t tensorType = self->_tensorType;
  if (tensorType != 2)
  {
    if (tensorType == 1)
    {
      memcpy((char *)self->_dataPtr + 2 * a5, (char *)a3 + 2 * a4, 2 * a6);
      return;
    }
    if (tensorType) {
      return;
    }
  }
  memcpy((char *)self->_dataPtr + 4 * a5, (char *)a3 + 4 * a4, 4 * a6);
}

- (int64_t)tensorType
{
  return self->_tensorType;
}

- (unint64_t)tensorSize
{
  return self->_tensorSize;
}

@end