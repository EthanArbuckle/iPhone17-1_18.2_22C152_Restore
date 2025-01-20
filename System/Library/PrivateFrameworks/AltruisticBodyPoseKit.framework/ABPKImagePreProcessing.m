@interface ABPKImagePreProcessing
- (ABPKImagePreProcessing)initWithPreProcessingParams:(id)a3;
- (int)preprocessColorImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4;
- (int)preprocessData:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4;
- (int)preprocessGrayscaleImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4;
- (void)_endARGBToBGRASignpost;
- (void)_endARGBToRGBASignpost;
- (void)_endGrayToBGRASignpost;
- (void)_endPaddingSignpost;
- (void)_endScaleSignpost;
- (void)_endYCbCrToARGBSignpost;
- (void)_startARGBToBGRASignpost;
- (void)_startARGBToRGBASignpost;
- (void)_startGrayToBGRASignpost;
- (void)_startPaddingSignpost;
- (void)_startScaleSignpost;
- (void)_startYCbCrToARGBSignpost;
- (void)dealloc;
- (void)logProfilingDetails;
@end

@implementation ABPKImagePreProcessing

- (ABPKImagePreProcessing)initWithPreProcessingParams:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ABPKImagePreProcessing;
  v5 = [(ABPKImagePreProcessing *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 paddingParams];
    paddingParameters = v5->_paddingParameters;
    v5->_paddingParameters = (ABPKPaddingParams *)v6;

    if (!v5->_paddingParameters)
    {
      v8 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21B7C6000, v8, OS_LOG_TYPE_ERROR, " Padding parameters not specified. Cannot run image pre-processing pipeline ", v13, 2u);
      }
    }
    p_vtPixelTransferSession = (CFTypeRef *)&v5->_vtPixelTransferSession;
    if (!VTPixelTransferSessionCreate(0, &v5->_vtPixelTransferSession))
    {
      v11 = v5;
      goto LABEL_14;
    }
    if (*p_vtPixelTransferSession) {
      CFRelease(*p_vtPixelTransferSession);
    }
    CFTypeRef *p_vtPixelTransferSession = 0;
    v10 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_ERROR, " Unable to create pixel transfer session for image downscaling ", v13, 2u);
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (void)dealloc
{
  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(vtPixelTransferSession);
    CFRelease(self->_vtPixelTransferSession);
    self->_vtPixelTransferSession = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ABPKImagePreProcessing;
  [(ABPKImagePreProcessing *)&v4 dealloc];
}

- (int)preprocessData:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType <= 875704437)
  {
    if (PixelFormatType != 32 && PixelFormatType != 875704422)
    {
LABEL_13:
      v9 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_ERROR, " Input image is of invalid format ", v10, 2u);
      }

      return -6660;
    }
  }
  else if (PixelFormatType != 875704438 && PixelFormatType != 1111970369)
  {
    if (PixelFormatType == 1278226488)
    {
      return [(ABPKImagePreProcessing *)self preprocessGrayscaleImage:a3 outputBuffer:a4];
    }
    goto LABEL_13;
  }
  return [(ABPKImagePreProcessing *)self preprocessColorImage:a3 outputBuffer:a4];
}

- (int)preprocessGrayscaleImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef v26 = a4;
  v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " \t\t Preprocessing GrayscaleImage ", buf, 2u);
  }

  uint64_t v27 = *MEMORY[0x263F04130];
  v28[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  self->_startScale = CFAbsoluteTimeGetCurrent();
  v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_DEBUG, " \t\t Scaling image ", buf, 2u);
  }

  [(ABPKImagePreProcessing *)self _startScaleSignpost];
  *(void *)buf = 0;
  unsigned int v10 = [(ABPKPaddingParams *)self->_paddingParameters width];
  unsigned int v11 = [(ABPKPaddingParams *)self->_paddingParameters height];
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, v11, 0x4C303038u, v8, (CVPixelBufferRef *)buf))
  {
    v13 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_ERROR, " Could not create scaledImage buffer ", v24, 2u);
    }

    goto LABEL_9;
  }
  OSStatus v14 = VTPixelTransferSessionTransferImage(self->_vtPixelTransferSession, a3, *(CVPixelBufferRef *)buf);
  [(ABPKImagePreProcessing *)self _endScaleSignpost];
  if (!v14)
  {
    self->_timeScale = CFAbsoluteTimeGetCurrent() - self->_startScale;
    self->_startPadding = CFAbsoluteTimeGetCurrent();
    v17 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_21B7C6000, v17, OS_LOG_TYPE_DEBUG, " \t\t Padding image ", v24, 2u);
    }

    [(ABPKImagePreProcessing *)self _startPaddingSignpost];
    *(void *)v24 = 0;
    size_t Width = CVPixelBufferGetWidth(a4);
    size_t Height = CVPixelBufferGetHeight(a4);
    if (CVPixelBufferCreate(v12, Width, Height, 0x4C303038u, v8, (CVPixelBufferRef *)v24))
    {
      v20 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        v21 = " Could not create scaledImage buffer ";
LABEL_28:
        _os_log_impl(&dword_21B7C6000, v20, OS_LOG_TYPE_ERROR, v21, v23, 2u);
      }
    }
    else
    {
      if (!padImage(*(__CVBuffer **)buf, (CVPixelBufferRef *)v24, [(ABPKPaddingParams *)self->_paddingParameters offsetHeight], [(ABPKPaddingParams *)self->_paddingParameters offsetWidth]))
      {
        [(ABPKImagePreProcessing *)self _endPaddingSignpost];
        self->_timePadding = CFAbsoluteTimeGetCurrent() - self->_startPadding;
        v22 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_21B7C6000, v22, OS_LOG_TYPE_DEBUG, " Convert Format GrayScale To ARGB_BGRA ", v23, 2u);
        }

        self->_startConvertGrayScaleToBGRA = CFAbsoluteTimeGetCurrent();
        [(ABPKImagePreProcessing *)self _startGrayToBGRASignpost];
        if (!convertFormatGrayScaleToARGB_BGRA(*(__CVBuffer **)v24, &v26))
        {
          [(ABPKImagePreProcessing *)self _endGrayToBGRASignpost];
          self->_timeConvertGrayScaleToBGRA = CFAbsoluteTimeGetCurrent() - self->_startConvertGrayScaleToBGRA;
          CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
          CVPixelBufferRelease(*(CVPixelBufferRef *)v24);
          OSStatus v14 = 0;
          goto LABEL_14;
        }
        v20 = __ABPKLogSharedInstance();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        *(_WORD *)v23 = 0;
        v21 = " Could not convert Grayscale to BGRA buffer ";
        goto LABEL_28;
      }
      v20 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        v21 = " Could not pad buffer ";
        goto LABEL_28;
      }
    }
LABEL_29:

LABEL_9:
    OSStatus v14 = -6660;
    goto LABEL_14;
  }
  v15 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_ERROR, " Could not scale Image ", v24, 2u);
  }

LABEL_14:
  return v14;
}

- (int)preprocessColorImage:(__CVBuffer *)a3 outputBuffer:(__CVBuffer *)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  CVPixelBufferRef v28 = a4;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  signed int v9 = PixelFormatType;
  if (PixelFormatType > 875704437)
  {
    if (PixelFormatType == 875704438) {
      goto LABEL_7;
    }
    int v10 = 1111970369;
  }
  else
  {
    if (PixelFormatType == 32) {
      goto LABEL_7;
    }
    int v10 = 875704422;
  }
  if (PixelFormatType == v10)
  {
LABEL_7:
    BOOL v11 = PixelFormatType == 1111970369;
    *(void *)uint64_t v27 = 0;
    uint64_t v29 = *MEMORY[0x263F04130];
    v30[0] = MEMORY[0x263EFFA78];
    CFDictionaryRef v12 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    if (v11)
    {
      *(void *)uint64_t v27 = a3;
      goto LABEL_9;
    }
    if ((v9 & 0xFFFFFFEF) == 0x34323066)
    {
      v19 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v19, OS_LOG_TYPE_DEBUG, " \t\t Converting image format: YCbCr --> BGRA ", buf, 2u);
      }

      self->_startConvertYCbCrToBGRA = CFAbsoluteTimeGetCurrent();
      [(ABPKImagePreProcessing *)self _startYCbCrToARGBSignpost];
    }
    else
    {
      v21 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v21, OS_LOG_TYPE_DEBUG, " \t\t Converting image format: ARGB --> BGRA ", buf, 2u);
      }

      self->_startConvertARGBToBGRA = CFAbsoluteTimeGetCurrent();
      [(ABPKImagePreProcessing *)self _startARGBToBGRASignpost];
    }
    if (CVPixelBufferCreate(0, Width, Height, 0x42475241u, v12, (CVPixelBufferRef *)v27))
    {
      v22 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v22, OS_LOG_TYPE_ERROR, " Could not create imageBGRA buffer ", buf, 2u);
      }
LABEL_30:

      OSStatus v18 = -6660;
      goto LABEL_31;
    }
    if ((v9 & 0xFFFFFFEF) == 0x34323066)
    {
      if (convertFormatYCbCrToBGRA(a3, (CVPixelBufferRef *)v27))
      {
        v22 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, v22, OS_LOG_TYPE_ERROR, " Could not convert Format YCbCr to BGRA. ", buf, 2u);
        }
        goto LABEL_30;
      }
      [(ABPKImagePreProcessing *)self _endYCbCrToARGBSignpost];
      self->_timeConvertYCbCrToBGRA = CFAbsoluteTimeGetCurrent() - self->_startConvertYCbCrToBGRA;
    }
    else
    {
      if (changeChannelsARGB(a3, (CVPixelBufferRef *)v27))
      {
        v22 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, v22, OS_LOG_TYPE_ERROR, " changeChannelsARGB failed. ", buf, 2u);
        }
        goto LABEL_30;
      }
      [(ABPKImagePreProcessing *)self _endARGBToBGRASignpost];
      self->_timeConvertARGBToBGRA = CFAbsoluteTimeGetCurrent() - self->_startConvertARGBToBGRA;
    }
LABEL_9:
    self->_startScale = CFAbsoluteTimeGetCurrent();
    v13 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " \t\t Scaling image ", buf, 2u);
    }

    [(ABPKImagePreProcessing *)self _startScaleSignpost];
    *(void *)buf = 0;
    unsigned int v14 = [(ABPKPaddingParams *)self->_paddingParameters width];
    unsigned int v15 = [(ABPKPaddingParams *)self->_paddingParameters height];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v14, v15, 0x42475241u, v12, (CVPixelBufferRef *)buf))
    {
      v16 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v25 = 0;
        v17 = " Could not create scaledImage buffer ";
LABEL_14:
        _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_ERROR, v17, v25, 2u);
      }
    }
    else
    {
      OSStatus v18 = VTPixelTransferSessionTransferImage(self->_vtPixelTransferSession, *(CVPixelBufferRef *)v27, *(CVPixelBufferRef *)buf);
      [(ABPKImagePreProcessing *)self _endScaleSignpost];
      if (v18)
      {
        v16 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_ERROR, " Could not scale Image ", v25, 2u);
        }
        goto LABEL_16;
      }
      self->_timeScale = CFAbsoluteTimeGetCurrent() - self->_startScale;
      self->_startPadding = CFAbsoluteTimeGetCurrent();
      v24 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_21B7C6000, v24, OS_LOG_TYPE_DEBUG, " \t\t Padding image ", v25, 2u);
      }

      [(ABPKImagePreProcessing *)self _startPaddingSignpost];
      if (!padImage(*(__CVBuffer **)buf, &v28, [(ABPKPaddingParams *)self->_paddingParameters offsetHeight], [(ABPKPaddingParams *)self->_paddingParameters offsetWidth]))
      {
        [(ABPKImagePreProcessing *)self _endPaddingSignpost];
        self->_timePadding = CFAbsoluteTimeGetCurrent() - self->_startPadding;
        CVPixelBufferRelease(*(CVPixelBufferRef *)buf);
        if (v9 != 1111970369) {
          CVPixelBufferRelease(*(CVPixelBufferRef *)v27);
        }
        OSStatus v18 = 0;
        goto LABEL_31;
      }
      v16 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v25 = 0;
        v17 = " Could not pad buffer ";
        goto LABEL_14;
      }
    }
    OSStatus v18 = -6660;
LABEL_16:

LABEL_31:
    return v18;
  }
  v20 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl(&dword_21B7C6000, v20, OS_LOG_TYPE_ERROR, " Input image is of invalid format ", v27, 2u);
  }

  return -6660;
}

- (void)logProfilingDetails
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    double timeConvertYCbCrToBGRA = self->_timeConvertYCbCrToBGRA;
    int v15 = 134217984;
    double v16 = timeConvertYCbCrToBGRA;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ConvertYCbCrToBGRA: %f ", (uint8_t *)&v15, 0xCu);
  }

  v5 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    double timeConvertARGBToBGRA = self->_timeConvertARGBToBGRA;
    int v15 = 134217984;
    double v16 = timeConvertARGBToBGRA;
    _os_log_impl(&dword_21B7C6000, v5, OS_LOG_TYPE_DEBUG, " ConvertARGBToBGRA: %f ", (uint8_t *)&v15, 0xCu);
  }

  v7 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double timeConvertGrayScaleToBGRA = self->_timeConvertGrayScaleToBGRA;
    int v15 = 134217984;
    double v16 = timeConvertGrayScaleToBGRA;
    _os_log_impl(&dword_21B7C6000, v7, OS_LOG_TYPE_DEBUG, " ConvertGrayScaleToBGRA: %f ", (uint8_t *)&v15, 0xCu);
  }

  signed int v9 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double timeScale = self->_timeScale;
    int v15 = 134217984;
    double v16 = timeScale;
    _os_log_impl(&dword_21B7C6000, v9, OS_LOG_TYPE_DEBUG, " Scale: %f ", (uint8_t *)&v15, 0xCu);
  }

  BOOL v11 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double timePadding = self->_timePadding;
    int v15 = 134217984;
    double v16 = timePadding;
    _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEBUG, " Padding: %f ", (uint8_t *)&v15, 0xCu);
  }

  v13 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    double v14 = self->_timeConvertARGBToBGRA
        + self->_timeConvertYCbCrToBGRA
        + self->_timeConvertGrayScaleToBGRA
        + self->_timeScale
        + self->_timePadding;
    int v15 = 134217984;
    double v16 = v14;
    _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " Total: %f ", (uint8_t *)&v15, 0xCu);
  }
}

- (void)_startScaleSignpost
{
}

- (void)_endScaleSignpost
{
}

- (void)_startARGBToRGBASignpost
{
}

- (void)_endARGBToRGBASignpost
{
}

- (void)_startPaddingSignpost
{
}

- (void)_endPaddingSignpost
{
}

- (void)_startYCbCrToARGBSignpost
{
}

- (void)_endYCbCrToARGBSignpost
{
}

- (void)_startARGBToBGRASignpost
{
}

- (void)_endARGBToBGRASignpost
{
}

- (void)_startGrayToBGRASignpost
{
}

- (void)_endGrayToBGRASignpost
{
}

- (void).cxx_destruct
{
}

@end