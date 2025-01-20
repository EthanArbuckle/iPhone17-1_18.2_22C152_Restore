@interface CVAJasperDepthFrameProcessor
- (CVAJasperDepthFrameProcessor)initWithCalibrationDict:(id)a3;
- (JDDepthProcessor)jdProc;
- (id)process:(__CVBuffer *)a3;
- (void)setJdProc:(id)a3;
@end

@implementation CVAJasperDepthFrameProcessor

- (CVAJasperDepthFrameProcessor)initWithCalibrationDict:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CVAJasperDepthFrameProcessor;
  v5 = [(CVAJasperDepthFrameProcessor *)&v10 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [MEMORY[0x263F50768] calibrationDataWithJasperCalibDataDictionary:v4];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263F50760]) initWithSystemCalibrationData:v6];
    jdProc = v5->_jdProc;
    v5->_jdProc = (JDDepthProcessor *)v7;

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (id)process:(__CVBuffer *)a3
{
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  if (BytesPerRow == Width)
  {
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    v8 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:BaseAddress length:CVPixelBufferGetDataSize(a3) freeWhenDone:0];
    uint64_t v9 = [(JDDepthProcessor *)self->_jdProc generatePointCloudFromRawFrame:v8];

    objc_super v10 = (void *)v9;
LABEL_13:
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    v21 = 0;
    goto LABEL_15;
  }
  size_t v11 = Width;
  v12 = (void *)MEMORY[0x21D490BF0]();
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType == 1278226488)
  {
    uint64_t v14 = 1;
  }
  else
  {
    if (PixelFormatType != 1278226742)
    {
      objc_super v10 = 0;
      char v20 = 0;
      goto LABEL_12;
    }
    uint64_t v14 = 2;
  }
  size_t Height = CVPixelBufferGetHeight(a3);
  v16 = (char *)CVPixelBufferGetBaseAddress(a3);
  size_t v17 = v14 * v11;
  v18 = [MEMORY[0x263EFF990] dataWithLength:v14 * v11 * Height];
  if (Height)
  {
    uint64_t v19 = 0;
    do
    {
      memcpy((void *)([v18 mutableBytes] + v19), v16, v17);
      v16 += BytesPerRow;
      v19 += v17;
      --Height;
    }
    while (Height);
  }
  objc_super v10 = [(JDDepthProcessor *)self->_jdProc generatePointCloudFromRawFrame:v18];

  char v20 = 1;
LABEL_12:
  if (v20) {
    goto LABEL_13;
  }
  v21 = v10;
  objc_super v10 = 0;
LABEL_15:

  return v10;
}

- (JDDepthProcessor)jdProc
{
  return self->_jdProc;
}

- (void)setJdProc:(id)a3
{
}

- (void).cxx_destruct
{
}

@end