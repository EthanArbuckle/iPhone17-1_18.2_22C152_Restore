@interface JFXImageScaler
- (id)initForCPU:(BOOL)a3;
- (void)dealloc;
- (void)scaleImage:(__CVBuffer *)a3 destinationImage:(__CVBuffer *)a4;
@end

@implementation JFXImageScaler

- (id)initForCPU:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)JFXImageScaler;
  v4 = [(JFXImageScaler *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_useCPU = a3;
    if (!a3)
    {
      OSStatus v6 = VTPixelTransferSessionCreate(0, &v4->_vtPixelTransferSession);
      if (v6)
      {
        OSStatus v7 = v6;
        v8 = JFXLog_matting();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v12 = v7;
          _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "VTPixelTransferSessionCreate failed with error %ld", buf, 0xCu);
        }
      }
    }
  }
  return v5;
}

- (void)scaleImage:(__CVBuffer *)a3 destinationImage:(__CVBuffer *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_useCPU)
  {
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 0);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    OSType v7 = CVPixelBufferGetPixelFormatType(a4);
    OSType v8 = v7;
    if (PixelFormatType == 1278226488 && v7 == 1278226488)
    {
      memset(&src, 0, sizeof(src));
      JFXToVImage(a3, (uint64_t)&src);
      memset(&v13, 0, sizeof(v13));
      JFXToVImage(a4, (uint64_t)&v13);
      vImage_Error v9 = vImageScale_Planar8(&src, &v13, 0, 0x28u);
    }
    else if ((PixelFormatType & 0xFFFFFFEF) == 0x34323066 && (v7 & 0xFFFFFFEF) == 0x34323066)
    {
      memset(&src, 0, sizeof(src));
      JFXPlanarToVImage(a3, 0, (uint64_t)&src);
      memset(&v13, 0, sizeof(v13));
      JFXPlanarToVImage(a4, 0, (uint64_t)&v13);
      if (vImageScale_Planar8(&src, &v13, 0, 0x28u)) {
        goto LABEL_21;
      }
      memset(&src, 0, sizeof(src));
      JFXPlanarToVImage(a3, 1uLL, (uint64_t)&src);
      memset(&v13, 0, sizeof(v13));
      JFXPlanarToVImage(a4, 1uLL, (uint64_t)&v13);
      vImage_Error v9 = vImageScale_CbCr8(&src, &v13, 0, 0x28u);
    }
    else
    {
      if (PixelFormatType != 1717855600 || v7 != 1717855600)
      {
        v11 = JFXLog_matting();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(src.data) = 0;
          _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, "Error: image scaler does not support this pixel format", (uint8_t *)&src, 2u);
        }

        goto LABEL_21;
      }
      memset(&src, 0, sizeof(src));
      JFXToVImage(a3, (uint64_t)&src);
      memset(&v13, 0, sizeof(v13));
      JFXToVImage(a4, (uint64_t)&v13);
      vImage_Error v9 = vImageScale_PlanarF(&src, &v13, 0, 0x28u);
    }
    if (!v9)
    {
LABEL_24:
      CVPixelBufferUnlockBaseAddress(a4, 0);
      CVPixelBufferUnlockBaseAddress(a3, 1uLL);
      return;
    }
LABEL_21:
    uint64_t v12 = JFXLog_matting();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(src.data) = 67110912;
      HIDWORD(src.data) = HIBYTE(PixelFormatType);
      LOWORD(src.height) = 1024;
      *(_DWORD *)((char *)&src.height + 2) = HIWORD(PixelFormatType);
      HIWORD(src.height) = 1024;
      LODWORD(src.width) = PixelFormatType >> 8;
      WORD2(src.width) = 1024;
      *(_DWORD *)((char *)&src.width + 6) = PixelFormatType;
      WORD1(src.rowBytes) = 1024;
      HIDWORD(src.rowBytes) = HIBYTE(v8);
      __int16 v15 = 1024;
      OSType v16 = HIWORD(v8);
      __int16 v17 = 1024;
      OSType v18 = v8 >> 8;
      __int16 v19 = 1024;
      OSType v20 = v8;
      _os_log_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEFAULT, "Error: image scale from %c%c%c%c to %c%c%c%c failed.", (uint8_t *)&src, 0x32u);
    }

    goto LABEL_24;
  }
  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession)
  {
    VTPixelTransferSessionTransferImage(vtPixelTransferSession, a3, a4);
  }
}

- (void)dealloc
{
  if (!self->_useCPU)
  {
    vtPixelTransferSession = self->_vtPixelTransferSession;
    if (vtPixelTransferSession)
    {
      VTPixelTransferSessionInvalidate(vtPixelTransferSession);
      CFRelease(self->_vtPixelTransferSession);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)JFXImageScaler;
  [(JFXImageScaler *)&v4 dealloc];
}

@end