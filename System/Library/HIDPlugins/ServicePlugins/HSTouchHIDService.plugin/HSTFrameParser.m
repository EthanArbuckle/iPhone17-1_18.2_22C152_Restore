@interface HSTFrameParser
- (BOOL)_handleContactFrame:(id)a3;
- (BOOL)_handleDriverExternalMessageFrame:(id)a3;
- (BOOL)_handleDriverNotificationFrame:(id)a3;
- (BOOL)_handleFirmwareEventFrame:(id)a3;
- (BOOL)_handlePointerFrame:(id)a3;
- (BOOL)_handleTimestampSyncFrame:(id)a3;
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (HSTFrameParser)initWithConfig:(const Config *)a3;
- (id).cxx_construct;
- (id)contactFrameFromData:(id)a3;
- (id)parseContactFrame29:(id)a3;
- (id)parseContactFrame31:(id)a3;
- (id)parseContactFrame44:(id)a3;
- (id)parseContactFrame75:(id)a3;
- (id)parseRelativePointerFrame82:(id)a3;
- (id)pointerFrameFromData:(id)a3;
- (unsigned)_driverToHSTNotification:(const DriverNotificationHeader *)a3;
- (unsigned)_driverToHSTNotificationWithContext:(const DriverNotification *)a3;
- (unsigned)_driverUserSpaceToHSTNotification:(const DriverNotification *)a3;
- (unsigned)_firmwareToHSTNotification:(unsigned __int8)a3;
- (void)_handleDebugStateEvent:(id)a3;
- (void)_handleFrame:(id)a3;
- (void)_handleResetEvent:(id)a3;
- (void)handleConsume:(id)a3;
- (void)sanitizeContactFrame:(id)a3;
@end

@implementation HSTFrameParser

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  if (v5)
  {
    [(HSTFrameParser *)self _handleFrame:v4];
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    if (v7)
    {
      [(HSTFrameParser *)self _handleResetEvent:v6];
    }
    else
    {
      id v8 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      if (v9)
      {
        [(HSTFrameParser *)self _handleDebugStateEvent:v8];
      }
      else
      {
        v10.receiver = self;
        v10.super_class = (Class)HSTFrameParser;
        [(HSStage *)&v10 handleConsume:v8];
      }
    }
  }
}

- (HSTFrameParser)initWithConfig:(const Config *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HSTFrameParser;
  id v4 = [(HSStage *)&v9 init];
  id v5 = (HSTFrameParser *)v4;
  if (v4)
  {
    cntrl = a3->dimensions.__cntrl_;
    *(_OWORD *)(v4 + 120) = *(_OWORD *)&a3->type;
    *((void *)v4 + 17) = cntrl;
    *((void *)v4 + 20) = 0;
    *((_DWORD *)v4 + 42) = 0;
    id v7 = v4;
  }

  return v5;
}

- (id)parseContactFrame29:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v34 = +[NSAssertionHandler currentHandler];
    [v34 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 150, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = [v6 bytes];
  id v8 = (char *)[v6 length];
  if (!v8 || *v7 != 41) {
    goto LABEL_11;
  }
  if ((unint64_t)v8 <= 5)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame29:]();
    }
    goto LABEL_11;
  }
  objc_super v9 = v8 - 6;
  if (((unint64_t)(v8 - 6) & 7) != 0)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame29:]();
    }
LABEL_11:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  if (((unsigned __int16)v9 & 0x7F8u) >= 0x108uLL)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame29:]();
    }
    goto LABEL_11;
  }
  unint64_t v12 = v7[3];
  int v13 = v7[4];
  int v14 = v7[5];
  uint64_t v10 = objc_opt_new();
  *(void *)(v10 + 24) = *(void *)&self->_config.sensorSize + 1;
  objc_storeStrong((id *)(v10 + 8), v6);
  *(void *)(v10 + 32) = 1000 * ((v12 >> 6) | (4 * v13) | (v14 << 10));
  std::vector<HSTPipeline::Contact>::resize(v10 + 48, ((unint64_t)v9 >> 3));
  uint64_t v15 = *(void *)(v10 + 48);
  if (*(void *)(v10 + 56) != v15)
  {
    char v35 = v12;
    unint64_t v16 = 0;
    v17 = v7 + 13;
    uint64_t v18 = 56;
    do
    {
      LODWORD(v19) = *(v17 - 4);
      if (*(v17 - 4))
      {
        if (v19 > 0x31)
        {
          if (v19 > 0xA9) {
            unint64_t v19 = (((unint64_t)(((v19 << 10) - 169984) * (uint64_t)((v19 << 10) - 169984)) >> 12)
          }
                 + 958464) >> 10;
          else {
            LODWORD(v19) = ((v19 << 21) + 629145600) >> 20;
          }
        }
        else
        {
          LODWORD(v19) = (((0xFFFFFFFD8
                                        * ((unint64_t)(((v19 << 10) - 76800)
                                                            * (uint64_t)((v19 << 10) - 76800)) >> 10)) >> 10)
                        + 742400) >> 10;
        }
      }
      unsigned int v20 = *(v17 - 3);
      if (*(v17 - 3))
      {
        if (v20 > 0x31)
        {
          BOOL v21 = v20 > 0x95;
          unint64_t v22 = (((87 * ((unint64_t)((int)((v20 << 10) - 141552) * (uint64_t)(int)((v20 << 10) - 141552)) >> 10)) >> 10)
               + 807152) >> 10;
          unsigned int v20 = ((v20 << 21) + 524288000) >> 20;
          if (v21) {
            unsigned int v20 = v22;
          }
        }
        else
        {
          unsigned int v20 = (((0xFFFFFFFD8
                               * ((unint64_t)((int)((v20 << 10) - 76800) * (uint64_t)(int)((v20 << 10) - 76800)) >> 10)) >> 10)
               + 640000) >> 10;
        }
      }
      int v23 = *(v17 - 6);
      int v24 = ((v23 << 12) | (16 * *(v17 - 7))) << 16 >> 19;
      int v25 = ((v23 & 0xF0 | (*(v17 - 5) << 8)) << 16 >> 19) + 4095;
      unsigned int v26 = *(v17 - 2);
      unsigned int v27 = 32 * (v26 & 0x3F);
      char v28 = *(v17 - 1);
      unsigned int v29 = *v17;
      v17 += 8;
      v30 = (float *)(v15 + v18);
      *((unsigned char *)v30 - 56) = (v26 >> 6) & 0xF3 | (4 * (v28 & 3));
      *((unsigned char *)v30 - 55) = (v29 >> 4) & 7;
      *((unsigned char *)v30 - 54) = v29 & 0xF;
      *((unsigned char *)v30 - 53) = 1;
      *((void *)v30 - 5) = (10 * v24 - self->_config.type) | ((unint64_t)(10 * v25 - LODWORD(self->_config.dimensions.__ptr_)) << 32);
      *((unsigned char *)v30 - 32) = 1;
      v31.f64[0] = (double)((v28 & 0xFC) << 7) * 3.14159265;
      v31.f64[1] = (double)v27;
      *((int32x2_t *)v30 - 2) = vmul_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v20, v19), (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)0xA0000000ALL);
      *((float32x2_t *)v30 - 1) = vcvt_f32_f64(vmulq_f64(v31, (float64x2_t)xmmword_112F50));
      float v32 = (double)(int)contactDensityFromRadii(v27, (__int16)v19, (__int16)v20) * 0.00390625;
      float *v30 = v32;
      *((void *)v30 - 6) = 0;
      ++v16;
      uint64_t v15 = *(void *)(v10 + 48);
      v18 += 64;
    }
    while (v16 < (*(void *)(v10 + 56) - v15) >> 6);
    LOBYTE(v12) = v35;
  }
  unint64_t v33 = (self->_config.options - self->_config.type) | ((unint64_t)(HIDWORD(self->_config.dimensions.__ptr_) - LODWORD(self->_config.dimensions.__ptr_)) << 32);
  if (!*(unsigned char *)(v10 + 80)) {
    *(unsigned char *)(v10 + 80) = 1;
  }
  *(void *)(v10 + 72) = v33;
  if (!*(unsigned char *)(v10 + 128)) {
    *(unsigned char *)(v10 + 128) = 1;
  }
  *(_DWORD *)(v10 + 124) = v12 & 3;
LABEL_12:

  return (id)v10;
}

- (id)parseContactFrame31:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v36 = +[NSAssertionHandler currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 373, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = [v6 bytes];
  id v8 = (char *)[v6 length];
  if (!v8 || *v7 != 49) {
    goto LABEL_11;
  }
  if ((unint64_t)v8 <= 3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame31:]();
    }
    goto LABEL_11;
  }
  if (v8 - 4 != (char *)(9 * ((unint64_t)(v8 - 4) / 9)))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame31:]();
    }
LABEL_11:
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  unint64_t v11 = ((unint64_t)(v8 - 4) / 9);
  if (v11 >= 0x21)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame31:]();
    }
    goto LABEL_11;
  }
  unsigned int v12 = v7[1];
  int v13 = v7[2];
  int v14 = v7[3];
  uint64_t v9 = objc_opt_new();
  *(void *)(v9 + 24) = *(void *)&self->_config.sensorSize + 1;
  objc_storeStrong((id *)(v9 + 8), v6);
  uint64_t v15 = (v12 >> 3) | (32 * v13) | (v14 << 13);
  *(_DWORD *)(v9 + 44) |= (v12 >> 2) & 1;
  if (v15 >= ((*(void *)&self->_config.surfaceCoordinates.bottom / 1000) & 0x1FFFFF)) {
    unint64_t v16 = (*(void *)&self->_config.surfaceCoordinates.bottom / 1000) & 0xFFFFFFFFFFE00000 | v15;
  }
  else {
    unint64_t v16 = ((*(void *)&self->_config.surfaceCoordinates.bottom / 1000) & 0xFFFFFFFFFFE00000 | v15) + 0x200000;
  }
  *(void *)(v9 + 32) = 1000 * v16;
  std::vector<HSTPipeline::Contact>::resize(v9 + 48, v11);
  uint64_t v17 = *(void *)(v9 + 48);
  if (*(void *)(v9 + 56) != v17)
  {
    char v37 = v12;
    unint64_t v18 = 0;
    unint64_t v19 = v7 + 6;
    uint64_t v20 = 36;
    do
    {
      unsigned int v21 = v19[1];
      int v22 = (v21 >> 2) & 7;
      LODWORD(v23) = v19[2];
      if (v22 == 7) {
        LOBYTE(v22) = 12;
      }
      if (v19[2])
      {
        if (v23 > 0x31)
        {
          if (v23 > 0xA9) {
            unint64_t v23 = (((unint64_t)(((v23 << 10) - 169984) * (uint64_t)((v23 << 10) - 169984)) >> 12)
          }
                 + 958464) >> 10;
          else {
            LODWORD(v23) = ((v23 << 21) + 629145600) >> 20;
          }
        }
        else
        {
          LODWORD(v23) = (((0xFFFFFFFD8
                                        * ((unint64_t)(((v23 << 10) - 76800)
                                                            * (uint64_t)((v23 << 10) - 76800)) >> 10)) >> 10)
                        + 742400) >> 10;
        }
      }
      LODWORD(v24) = v19[3];
      if (v19[3])
      {
        if (v24 > 0x31)
        {
          if (v24 > 0x95) {
            unint64_t v24 = (((87
          }
                   * ((unint64_t)(((v24 << 10) - 141552) * (uint64_t)((v24 << 10) - 141552)) >> 10)) >> 10)
                 + 807152) >> 10;
          else {
            LODWORD(v24) = ((v24 << 21) + 524288000) >> 20;
          }
        }
        else
        {
          LODWORD(v24) = (((0xFFFFFFFD8
                                        * ((unint64_t)(((v24 << 10) - 76800)
                                                            * (uint64_t)((v24 << 10) - 76800)) >> 10)) >> 10)
                        + 640000) >> 10;
        }
      }
      LODWORD(v25) = v19[4];
      if (v19[4])
      {
        if (v25 > 0x95) {
          unint64_t v25 = (((138
        }
                 * ((unint64_t)(((v25 << 10) - 114670) * (uint64_t)((v25 << 10) - 114670)) >> 10)) >> 10)
               + 1373544) >> 10;
        else {
          LODWORD(v25) = (10485 * v25) >> 10;
        }
      }
      int v26 = v19[5];
      if (v19[5])
      {
        if ((v26 & 0x80) != 0) {
          unint64_t v27 = (((unint64_t)(((v26 << 10) - 98939) * (uint64_t)((v26 << 10) - 98939)) >> 15) + 230011) >> 10;
        }
        else {
          LODWORD(v27) = 2 * v26;
        }
      }
      else
      {
        LODWORD(v27) = 0;
      }
      unsigned int v28 = *(v19 - 1);
      int v29 = (8 * *v19) | (v21 << 11) | (v28 >> 5);
      unsigned int v30 = v19[6];
      int v31 = (int)(((v28 << 11) | (8 * *(v19 - 2))) << 16) >> 18;
      v19 += 9;
      uint64_t v32 = v17 + v20;
      *(unsigned char *)(v32 - 36) = v30 & 0xF;
      *(unsigned char *)(v32 - 35) = v21 >> 5;
      *(unsigned char *)(v32 - 34) = v22;
      *(unsigned char *)(v32 - 33) = 1;
      *(void *)(v32 - 20) = (10 * v31 - self->_config.type) | ((unint64_t)(10 * (((__int16)(8 * v29) >> 2) + 5000) - LODWORD(self->_config.dimensions.__ptr_)) << 32);
      *(unsigned char *)(v32 - 12) = 1;
      *(int32x2_t *)(v32 + 4) = vmul_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v24, v23), (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)0xA0000000ALL);
      v33.f64[0] = (double)(v30 >> 5 << 12) * 3.14159265;
      v33.f64[1] = (double)(unsigned __int16)v25;
      *(float32x2_t *)(v32 + 12) = vcvt_f32_f64(vmulq_f64(v33, (float64x2_t)xmmword_112F50));
      float v34 = (double)(int)contactDensityFromRadii((unsigned __int16)v25, (__int16)v23, (__int16)v24) * 0.00390625;
      *(float *)(v32 + 20) = v34;
      *(_DWORD *)uint64_t v32 = v27;
      *(void *)(v32 - 28) = 0;
      ++v18;
      uint64_t v17 = *(void *)(v9 + 48);
      v20 += 64;
    }
    while (v18 < (*(void *)(v9 + 56) - v17) >> 6);
    LOBYTE(v12) = v37;
  }
  unint64_t v35 = (self->_config.options - self->_config.type) | ((unint64_t)(HIDWORD(self->_config.dimensions.__ptr_) - LODWORD(self->_config.dimensions.__ptr_)) << 32);
  if (!*(unsigned char *)(v9 + 80)) {
    *(unsigned char *)(v9 + 80) = 1;
  }
  *(void *)(v9 + 72) = v35;
  if (!*(unsigned char *)(v9 + 128)) {
    *(unsigned char *)(v9 + 128) = 1;
  }
  *(_DWORD *)(v9 + 124) = v12 & 1;
LABEL_12:

  return (id)v9;
}

- (id)parseContactFrame44:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v38 = +[NSAssertionHandler currentHandler];
    [v38 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 471, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = (unsigned __int8 *)[v6 bytes];
  id v8 = [v6 length];
  if ((unint64_t)v8 < 0x12) {
    goto LABEL_35;
  }
  uint64_t v9 = 0;
  while (*v7 != HSTPipeline::FirmwareInterface::InputReport::ContactFrame44::Header::ReportID[v9])
  {
    if (++v9 == 2) {
      goto LABEL_35;
    }
  }
  unint64_t v10 = v7[2];
  if ((unint64_t)v8 < v10)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame44:]();
    }
LABEL_35:
    id v32 = 0;
    goto LABEL_36;
  }
  if (v7[16] >= 0x21uLL)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame44:].cold.5();
    }
    goto LABEL_35;
  }
  if (v7[17] <= 0x13uLL)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame44:].cold.4();
    }
    goto LABEL_35;
  }
  uint64_t v11 = *((unsigned __int16 *)v7 + 7);
  if (v8 != (id)(v11 + v10 + v7[17] * (unint64_t)v7[16]))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame44:]();
    }
    goto LABEL_35;
  }
  unsigned int v12 = &selRef_setDispatchQueue_;
  if (*((_WORD *)v7 + 7)
    && v11 != 2
            * (HIDWORD(self->_config.dimensions.__cntrl_) * LODWORD(self->_config.dimensions.__cntrl_)))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", (char *)__b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame44:]();
    }
    goto LABEL_35;
  }
  size_t v13 = v10 - 18;
  size_t v14 = 25 - v10;
  if (v13 <= 6) {
    size_t v15 = v14;
  }
  else {
    size_t v15 = 0;
  }
  bzero(&__dst[v13], v15);
  memcpy(__dst, v7 + 18, v13);
  uint64_t v16 = objc_opt_new();
  objc_storeStrong((id *)(v16 + 8), v6);
  *(void *)(v16 + 24) = v7[1];
  *(void *)(v16 + 32) = 1000 * *((unsigned int *)v7 + 1);
  *(_DWORD *)(v16 + 40) = v42;
  std::vector<HSTPipeline::Contact>::resize(v16 + 48, v7[16]);
  if (v7[16])
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    float64x2_t v39 = (float64x2_t)xmmword_112F50;
    v40 = self;
    while (1)
    {
      uint64_t v19 = v7[17];
      uint64_t v20 = &v7[v7[2] + *((unsigned __int16 *)v7 + 7) + v18 * v19];
      unsigned int v21 = *v20;
      if (v21 > 0x1F) {
        break;
      }
      int v22 = v12;
      uint64_t v23 = v16;
      unint64_t v24 = v19 - 20;
      size_t v25 = 30 - v19;
      if (v24 <= 9) {
        size_t v26 = v25;
      }
      else {
        size_t v26 = 0;
      }
      bzero((char *)__b + v24, v26);
      size_t v27 = v24;
      uint64_t v16 = v23;
      unsigned int v12 = v22;
      self = v40;
      memcpy(__b, v20 + 20, v27);
      uint64_t v28 = *(void *)(v16 + 48) + v17;
      *(unsigned char *)uint64_t v28 = v21;
      *(unsigned char *)(v28 + 1) = v20[1];
      *(_WORD *)(v28 + 2) = *((_WORD *)v20 + 1);
      *(void *)(v28 + 8) = __b[4];
      uint64_t v29 = *((int *)v12 + 662);
      *(void *)(v28 + 16) = (10 * *((__int16 *)v20 + 2)
                                           - *(_DWORD *)((char *)&self->super.super.isa + v29)) | ((unint64_t)(10 * *((__int16 *)v20 + 3) - *(_DWORD *)((char *)&self->super._state.lock.__m_.__sig + v29)) << 32);
      *(void *)(v28 + 28) = (0x7D00000000 * *((__int16 *)v20 + 5)) | (125 * *((__int16 *)v20 + 4));
      *(_DWORD *)(v28 + 36) = __b[3];
      *(_DWORD *)(v28 + 40) = 10 * *((unsigned __int16 *)v20 + 6);
      *(_DWORD *)(v28 + 44) = 10 * *((unsigned __int16 *)v20 + 7);
      v30.f64[0] = (double)*((__int16 *)v20 + 8) * 3.14159265;
      LOWORD(v31) = *((_WORD *)v20 + 9);
      v30.f64[1] = (double)v31;
      *(float32x2_t *)&v30.f64[0] = vcvt_f32_f64(vmulq_f64(v30, v39));
      *(float64_t *)(v28 + 48) = v30.f64[0];
      LOWORD(v30.f64[0]) = __b[0];
      *(float *)v30.f64 = (double)*(unint64_t *)&v30.f64[0] * 0.00390625;
      *(_DWORD *)(v28 + 56) = LODWORD(v30.f64[0]);
      ++v18;
      v17 += 64;
      if (v18 >= v7[16]) {
        goto LABEL_40;
      }
    }
    id v32 = 0;
  }
  else
  {
    uint64_t v29 = 120;
LABEL_40:
    float v34 = (char *)self + v29;
    unint64_t v35 = (*((_DWORD *)v34 + 1) - *(_DWORD *)v34) | ((unint64_t)(*((_DWORD *)v34 + 3)
                                                                                                  - *((_DWORD *)v34 + 2)) << 32);
    if (!*(unsigned char *)(v16 + 80)) {
      *(unsigned char *)(v16 + 80) = 1;
    }
    *(void *)(v16 + 72) = v35;
    if (*((_WORD *)v7 + 7))
    {
      uint64_t v36 = v7[2];
      int v37 = *(unsigned __int8 *)(v16 + 104);
      *(void *)(v16 + 88) = *((void *)v34 + 2);
      *(void *)(v16 + 96) = v36;
      if (!v37) {
        *(unsigned char *)(v16 + 104) = 1;
      }
    }
    id v32 = (id)v16;
  }

LABEL_36:

  return v32;
}

- (id)parseContactFrame75:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v31 = +[NSAssertionHandler currentHandler];
    [v31 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 558, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = [v6 bytes];
  id v8 = [v6 length];
  id v9 = v8;
  if ((unint64_t)v8 < 0x20 || *(unsigned char *)v7 != 117) {
    goto LABEL_26;
  }
  unint64_t v10 = *((unsigned __int8 *)v7 + 2);
  if ((unint64_t)v8 < v10)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame75:]();
    }
LABEL_26:
    id v25 = 0;
    goto LABEL_27;
  }
  unint64_t v11 = *((unsigned __int8 *)v7 + 22);
  if (v11 >= 0x21)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame75:].cold.5();
    }
    goto LABEL_26;
  }
  uint64_t v12 = 30 * v11;
  if (v12 != (unsigned __int16)v7[8])
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame75:].cold.4();
    }
    unint64_t v10 = *((unsigned __int8 *)v7 + 2);
    uint64_t v12 = 30 * *((unsigned __int8 *)v7 + 22);
  }
  unint64_t v13 = v10 + (unsigned __int16)v7[7];
  uint64_t v14 = (unsigned __int16)v7[9];
  if (v9 != (id)(v13 + (unsigned __int16)v7[10] + v14 + v12))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame75:]();
    }
    goto LABEL_26;
  }
  if (v7[9]
    && (v7[5] & 0x40) == 0
    && v14 != 2
            * (HIDWORD(self->_config.dimensions.__cntrl_) * LODWORD(self->_config.dimensions.__cntrl_)))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser parseContactFrame75:]();
    }
    goto LABEL_26;
  }
  uint64_t v15 = objc_opt_new();
  objc_storeStrong((id *)(v15 + 8), v6);
  *(void *)(v15 + 24) = *((unsigned __int8 *)v7 + 1);
  *(void *)(v15 + 32) = 1000 * *((unsigned int *)v7 + 1);
  *(_DWORD *)(v15 + 40) = *((_DWORD *)v7 + 6);
  *(_DWORD *)(v15 + 44) = (unsigned __int16)v7[6];
  std::vector<HSTPipeline::Contact>::resize(v15 + 48, *((unsigned __int8 *)v7 + 22));
  if (*((unsigned char *)v7 + 22))
  {
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    uint64_t v20 = v7;
    while (1)
    {
      unint64_t v21 = *((unsigned __int8 *)v7 + 2) + (unint64_t)(unsigned __int16)v7[7];
      unsigned int v22 = *((unsigned __int8 *)v20 + v21);
      if (v22 > 0x1F) {
        break;
      }
      uint64_t v23 = *(void *)(v15 + 48) + v18;
      *(unsigned char *)uint64_t v23 = v22;
      *(unsigned char *)(v23 + 1) = *((unsigned char *)v20 + v21 + 1);
      *(_WORD *)(v23 + 2) = *(_WORD *)((char *)v20 + v21 + 2);
      *(void *)(v23 + 8) = *(unsigned __int16 *)((char *)v20 + v21 + 28);
      *(void *)(v23 + 16) = (10 * *(__int16 *)((char *)v20 + v21 + 4) - self->_config.type) | ((unint64_t)(10 * *(__int16 *)((char *)v20 + v21 + 6) - LODWORD(self->_config.dimensions.__ptr_)) << 32);
      *(void *)(v23 + 28) = (0x7D00000000 * *(__int16 *)((char *)v20 + v21 + 10)) | (125 * *(__int16 *)((char *)v20 + v21 + 8));
      *(_DWORD *)(v23 + 36) = *(unsigned __int16 *)((char *)v20 + v21 + 26);
      *(_DWORD *)(v23 + 40) = 10 * *(unsigned __int16 *)((char *)v20 + v21 + 12);
      *(_DWORD *)(v23 + 44) = 10 * *(unsigned __int16 *)((char *)v20 + v21 + 14);
      v24.f64[0] = (double)*(__int16 *)((char *)v20 + v21 + 16) * 3.14159265;
      LOWORD(v16.f64[0]) = *(_WORD *)((char *)v20 + v21 + 18);
      LOWORD(v17.f64[0]) = *(_WORD *)((char *)v20 + v21 + 20);
      v17.f64[0] = (double)*(unint64_t *)&v17.f64[0];
      v24.f64[1] = (double)*(unint64_t *)&v16.f64[0];
      v17.f64[1] = (double)*(__int16 *)((char *)v20 + v21 + 24) * 3.14159265;
      float64x2_t v16 = vmulq_f64(v17, (float64x2_t)xmmword_112F60);
      *(float32x4_t *)(v23 + 48) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(v24, (float64x2_t)xmmword_112F50)), v16);
      ++v19;
      v20 += 15;
      v18 += 64;
      if (v19 >= *((unsigned __int8 *)v7 + 22)) {
        goto LABEL_30;
      }
    }
    id v25 = 0;
  }
  else
  {
LABEL_30:
    unint64_t v27 = (self->_config.options - self->_config.type) | ((unint64_t)(HIDWORD(self->_config.dimensions.__ptr_) - LODWORD(self->_config.dimensions.__ptr_)) << 32);
    if (!*(unsigned char *)(v15 + 80)) {
      *(unsigned char *)(v15 + 80) = 1;
    }
    *(void *)(v15 + 72) = v27;
    if (v7[9])
    {
      uint64_t v28 = *((unsigned __int8 *)v7 + 2);
      int v29 = *(unsigned __int8 *)(v15 + 104);
      *(void *)(v15 + 88) = self->_config.dimensions.__cntrl_;
      *(void *)(v15 + 96) = v28;
      if (!v29) {
        *(unsigned char *)(v15 + 104) = 1;
      }
    }
    int v30 = *((unsigned __int8 *)v7 + 23);
    if (!*(unsigned char *)(v15 + 128)) {
      *(unsigned char *)(v15 + 128) = 1;
    }
    *(_DWORD *)(v15 + 124) = v30;
    id v25 = (id)v15;
  }

LABEL_27:

  return v25;
}

- (id)parseRelativePointerFrame82:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 640, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v6 = v5;
  id v7 = (unsigned __int8 *)[v6 bytes];
  if ((unint64_t)[v6 length] >= 0x20 && *v7 == 130)
  {
    uint64_t v8 = objc_opt_new();
    id v9 = (void *)v8;
    *(void *)(v8 + 24) = *((unsigned __int16 *)v7 + 1);
    if (!*(void *)(v8 + 24)) {
      *(void *)(v8 + 24) = 400;
    }
    *(_DWORD *)(v8 + 32) = *((_DWORD *)v7 + 1);
    int v10 = *((_DWORD *)v7 + 3);
    *(_DWORD *)(v8 + 36) = *((_DWORD *)v7 + 2);
    *(_DWORD *)(v8 + 40) = v10;
    int v11 = *((_DWORD *)v7 + 5);
    *(_DWORD *)(v8 + 52) = *((_DWORD *)v7 + 4);
    *(_DWORD *)(v8 + 48) = v11;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)contactFrameFromData:(id)a3
{
  id v4 = a3;
  id v5 = [(HSTFrameParser *)self parseContactFrame29:v4];
  if (!v5)
  {
    id v5 = [(HSTFrameParser *)self parseContactFrame31:v4];
    if (!v5)
    {
      id v5 = [(HSTFrameParser *)self parseContactFrame44:v4];
      if (!v5)
      {
        id v5 = [(HSTFrameParser *)self parseContactFrame75:v4];
      }
    }
  }

  return v5;
}

- (id)pointerFrameFromData:(id)a3
{
  v3 = [(HSTFrameParser *)self parseRelativePointerFrame82:a3];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }

  return v4;
}

- (void)sanitizeContactFrame:(id)a3
{
  id v4 = (char *)a3;
  id v5 = v4;
  if (v4)
  {
    memset(__p, 0, 24);
    id v6 = (unsigned __int8 *)*((void *)v4 + 6);
    id v7 = (unsigned __int8 *)*((void *)v4 + 7);
    if (v6 != v7)
    {
      unint64_t v8 = 0;
      v57 = "bitset test argument out of range";
      while (1)
      {
        unint64_t v9 = *v6;
        if (v9 >= 0x20) {
          goto LABEL_72;
        }
        if ((v8 >> v9))
        {
          int v10 = MTLoggingPlugin();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            int v34 = *v6;
            *(_DWORD *)buf = 67109120;
            int v60 = v34;
            _os_log_error_impl(&def_411C8, v10, OS_LOG_TYPE_ERROR, "Contact %u was duplicated, removing extra contact", buf, 8u);
          }

          ++self->_config.service;
        }
        else
        {
          int v11 = __p[1];
          if (__p[1] >= __p[2])
          {
            float64x2_t v16 = __p[0];
            int64_t v17 = ((char *)__p[1] - (char *)__p[0]) >> 6;
            unint64_t v18 = v17 + 1;
            if ((unint64_t)(v17 + 1) >> 58) {
              std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
            }
            int64_t v19 = (char *)__p[2] - (char *)__p[0];
            if (((char *)__p[2] - (char *)__p[0]) >> 5 > v18) {
              unint64_t v18 = v19 >> 5;
            }
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFC0) {
              unint64_t v20 = 0x3FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v20 = v18;
            }
            if (v20)
            {
              unint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSTPipeline::Contact>>((uint64_t)&__p[2], v20);
              float64x2_t v16 = __p[0];
              int v11 = __p[1];
            }
            else
            {
              unint64_t v21 = 0;
            }
            unsigned int v22 = &v21[64 * v17];
            long long v23 = *(_OWORD *)v6;
            long long v24 = *((_OWORD *)v6 + 1);
            long long v25 = *((_OWORD *)v6 + 3);
            *((_OWORD *)v22 + 2) = *((_OWORD *)v6 + 2);
            *((_OWORD *)v22 + 3) = v25;
            *(_OWORD *)unsigned int v22 = v23;
            *((_OWORD *)v22 + 1) = v24;
            if (v11 == v16)
            {
              int v30 = &v21[64 * v17];
            }
            else
            {
              size_t v26 = &v21[64 * v17];
              do
              {
                long long v27 = *(v11 - 4);
                long long v28 = *(v11 - 3);
                long long v29 = *(v11 - 1);
                int v30 = v26 - 64;
                *((_OWORD *)v26 - 2) = *(v11 - 2);
                *((_OWORD *)v26 - 1) = v29;
                *((_OWORD *)v26 - 4) = v27;
                *((_OWORD *)v26 - 3) = v28;
                v11 -= 4;
                v26 -= 64;
              }
              while (v11 != v16);
            }
            uint64_t v15 = v22 + 64;
            __p[0] = v30;
            __p[1] = v22 + 64;
            __p[2] = &v21[64 * v20];
            if (v16) {
              operator delete(v16);
            }
          }
          else
          {
            long long v12 = *(_OWORD *)v6;
            long long v13 = *((_OWORD *)v6 + 1);
            long long v14 = *((_OWORD *)v6 + 3);
            *((_OWORD *)__p[1] + 2) = *((_OWORD *)v6 + 2);
            v11[3] = v14;
            *int v11 = v12;
            v11[1] = v13;
            uint64_t v15 = v11 + 4;
          }
          __p[1] = v15;
          unint64_t v31 = *v6;
          if (v31 > 0x1F)
          {
            v57 = "bitset set argument out of range";
LABEL_72:
            std::__throw_out_of_range[abi:ne180100](v57);
          }
          uint64_t v32 = 1 << v31;
          if (v6[1] - 1 > 3) {
            uint64_t v33 = *(void *)&self->_config.surfaceCoordinates.left & ~v32;
          }
          else {
            uint64_t v33 = *(void *)&self->_config.surfaceCoordinates.left | v32;
          }
          *(void *)&self->_config.surfaceCoordinates.left = v33;
          v8 |= v32;
        }
        v6 += 64;
        if (v6 == v7) {
          goto LABEL_37;
        }
      }
    }
    unint64_t v8 = 0;
LABEL_37:
    if (v5 + 48 != (char *)__p) {
      std::vector<HSTPipeline::Contact>::__assign_with_size[abi:ne180100]<HSTPipeline::Contact*,HSTPipeline::Contact*>(v5 + 48, (char *)__p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 6);
    }
    uint64_t v35 = 0;
    uint64_t v36 = *(void *)&self->_config.surfaceCoordinates.left;
    do
    {
      if ((v36 & (1 << v35)) != 0 && ((1 << v35) & v8) == 0)
      {
        v38 = (void **)(v5 + 48);
        unint64_t v39 = *((void *)v5 + 7);
        unint64_t v40 = *((void *)v5 + 8);
        if (v39 >= v40)
        {
          uint64_t v42 = (uint64_t)(v39 - (void)*v38) >> 6;
          unint64_t v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 58) {
            std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v44 = v40 - (void)*v38;
          if (v44 >> 5 > v43) {
            unint64_t v43 = v44 >> 5;
          }
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFC0) {
            unint64_t v45 = 0x3FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v43;
          }
          if (v45) {
            v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSTPipeline::Contact>>((uint64_t)(v5 + 64), v45);
          }
          else {
            v46 = 0;
          }
          v47 = &v46[64 * v42];
          char *v47 = v35;
          *(_WORD *)(v47 + 1) = 0;
          v47[3] = 0;
          *((void *)v47 + 1) = 0;
          *((void *)v47 + 2) = 0;
          v47[24] = 0;
          *(_OWORD *)(v47 + 28) = 0u;
          *(_OWORD *)(v47 + 44) = 0u;
          *((_DWORD *)v47 + 15) = 0;
          v49 = (char *)*v38;
          v48 = (char *)*((void *)v5 + 7);
          v50 = v47;
          if (v48 != *v38)
          {
            do
            {
              long long v51 = *((_OWORD *)v48 - 4);
              long long v52 = *((_OWORD *)v48 - 3);
              long long v53 = *((_OWORD *)v48 - 1);
              *((_OWORD *)v50 - 2) = *((_OWORD *)v48 - 2);
              *((_OWORD *)v50 - 1) = v53;
              *((_OWORD *)v50 - 4) = v51;
              *((_OWORD *)v50 - 3) = v52;
              v50 -= 64;
              v48 -= 64;
            }
            while (v48 != v49);
            v48 = (char *)*v38;
          }
          v41 = v47 + 64;
          void *v38 = v50;
          *((void *)v5 + 7) = v47 + 64;
          *((void *)v5 + 8) = &v46[64 * v45];
          if (v48) {
            operator delete(v48);
          }
        }
        else
        {
          *(unsigned char *)unint64_t v39 = v35;
          *(_WORD *)(v39 + 1) = 0;
          *(unsigned char *)(v39 + 3) = 0;
          *(void *)(v39 + 8) = 0;
          *(void *)(v39 + 16) = 0;
          *(unsigned char *)(v39 + 24) = 0;
          v41 = (char *)(v39 + 64);
          *(_OWORD *)(v39 + 28) = 0u;
          *(_OWORD *)(v39 + 44) = 0u;
          *(_DWORD *)(v39 + 60) = 0;
        }
        *((void *)v5 + 7) = v41;
        v54 = MTLoggingPlugin();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v60 = v35;
          _os_log_error_impl(&def_411C8, v54, OS_LOG_TYPE_ERROR, "Contact %u was in range but is now missing, setting stage to NotTracking", buf, 8u);
        }

        uint64_t v36 = *(void *)&self->_config.surfaceCoordinates.left & ~(1 << v35);
        *(void *)&self->_config.surfaceCoordinates.left = v36;
      }
      ++v35;
    }
    while (v35 != 32);
    uint64_t v55 = *((void *)v5 + 4);
    if (*(void *)&self->_config.surfaceCoordinates.bottom > v55)
    {
      v56 = objc_opt_new();
      [v56 setNotification:11];
      v58.receiver = self;
      v58.super_class = (Class)HSTFrameParser;
      [(HSStage *)&v58 handleConsume:v56];

      uint64_t v55 = *((void *)v5 + 4);
    }
    *(void *)&self->_config.surfaceCoordinates.bottom = v55;
    self->_config.sensorSize = (SensorSize)*((void *)v5 + 3);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    memset(__p, 170, sizeof(__p));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", (char *)__p);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser sanitizeContactFrame:]();
    }
  }
}

- (BOOL)_handleContactFrame:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 756, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  if (v5[1])
  {
    id v6 = -[HSTFrameParser contactFrameFromData:](self, "contactFrameFromData:");
    BOOL v7 = v6 != 0;
    if (v6)
    {
      [(HSTFrameParser *)self sanitizeContactFrame:v6];
      v10.receiver = self;
      v10.super_class = (Class)HSTFrameParser;
      [(HSStage *)&v10 handleConsume:v6];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_handlePointerFrame:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 781, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  if (v5[1])
  {
    id v6 = -[HSTFrameParser pointerFrameFromData:](self, "pointerFrameFromData:");
    BOOL v7 = v6 != 0;
    if (v6)
    {
      v10.receiver = self;
      v10.super_class = (Class)HSTFrameParser;
      [(HSStage *)&v10 handleConsume:v6];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unsigned)_firmwareToHSTNotification:(unsigned __int8)a3
{
  if ((int)a3 > 31)
  {
    if (a3 != 32)
    {
      if (a3 == 33) {
        return 10;
      }
      return 0;
    }
    return 9;
  }
  else
  {
    if (a3 != 1)
    {
      if (a3 == 2) {
        return 8;
      }
      return 0;
    }
    return 7;
  }
}

- (BOOL)_handleFirmwareEventFrame:(id)a3
{
  id v5 = (id *)a3;
  if (!v5)
  {
    long long v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 816, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  id v6 = v5[1];
  if (v6
    && (BOOL v7 = (unsigned __int8 *)[v6 bytes],
        unint64_t v8 = (char *)[v5[1] length],
        (unint64_t)v8 >= 2)
    && *v7 == 96)
  {
    v34.receiver = self;
    v34.super_class = (Class)HSTFrameParser;
    [(HSStage *)&v34 handleConsume:v5];
    unint64_t v9 = MTLoggingPlugin();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v7[1];
      *(_DWORD *)buf = 67109120;
      int v36 = v10;
      _os_log_impl(&def_411C8, v9, OS_LOG_TYPE_DEFAULT, "Firmware event received: %x", buf, 8u);
    }

    int v11 = objc_opt_new();
    objc_msgSend(v11, "setNotification:", -[HSTFrameParser _firmwareToHSTNotification:](self, "_firmwareToHSTNotification:", v7[1]));
    v33.receiver = self;
    v33.super_class = (Class)HSTFrameParser;
    [(HSStage *)&v33 handleConsume:v11];
    if ([v11 notification] == 9)
    {
      uint64_t v12 = objc_opt_new();
      long long v13 = (void *)v12;
      if ((unint64_t)v8 >= 3)
      {
        int v14 = v7[2] & 8;
        switch(v7[2])
        {
          case 0u:
          case 8u:
            if ((unint64_t)v8 >= 7)
            {
              unint64_t v18 = (10 * *(__int16 *)(v7 + 3) - self->_config.type) | ((unint64_t)(10 * *(__int16 *)(v7 + 5) - LODWORD(self->_config.dimensions.__ptr_)) << 32);
              int64_t v19 = &OBJC_IVAR___HSTWakeSystemEvent_tapPosition;
              goto LABEL_28;
            }
            break;
          case 1u:
          case 9u:
            if ((unint64_t)v8 >= 7) {
              *(_WORD *)(v12 + 28) = v7[3] | 0x100;
            }
            break;
          case 2u:
          case 0xAu:
            if ((unint64_t)v8 >= 7)
            {
              unint64_t v18 = (10 * *(__int16 *)(v7 + 3) - self->_config.type) | ((unint64_t)(10 * *(__int16 *)(v7 + 5) - LODWORD(self->_config.dimensions.__ptr_)) << 32);
              int64_t v19 = &OBJC_IVAR___HSTWakeSystemEvent_longPressPosition;
LABEL_28:
              uint64_t v22 = v12 + *v19;
              if (!*(unsigned char *)(v22 + 8)) {
                *(unsigned char *)(v22 + 8) = 1;
              }
              goto LABEL_34;
            }
            break;
          case 3u:
            if ((unint64_t)v8 < 7) {
              goto LABEL_10;
            }
            unint64_t v18 = (10 * *(__int16 *)(v7 + 3) - self->_config.type) | ((unint64_t)(10 * *(__int16 *)(v7 + 5) - LODWORD(self->_config.dimensions.__ptr_)) << 32);
            uint64_t v22 = v12 + 44;
            if (!*(unsigned char *)(v12 + 52)) {
              *(unsigned char *)(v12 + 52) = 1;
            }
            int v14 = 0;
LABEL_34:
            *(void *)uint64_t v22 = v18;
            break;
          default:
            break;
        }
      }
      else
      {
LABEL_10:
        int v14 = 0;
      }
      v32.receiver = self;
      v32.super_class = (Class)HSTFrameParser;
      [(HSStage *)&v32 handleConsume:v12];
      if (v14)
      {
        if ((unint64_t)v8 <= 7)
        {
          uint64_t v27 = MTLoggingPlugin();
          if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
            -[HSTFrameParser _handleFirmwareEventFrame:]((os_log_t)v27);
          }
        }
        else
        {
          int v23 = v7[7];
          if (v23 == 1)
          {
            if ((unint64_t)v8 <= 0x1E)
            {
              uint64_t v27 = MTLoggingPlugin();
              if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
                -[HSTFrameParser _handleFirmwareEventFrame:]((os_log_t)v27);
              }
            }
            else
            {
              uint64_t v24 = v7[8];
              uint64_t v25 = *(unsigned int *)(v7 + 9);
              size_t v26 = +[NSData dataWithBytes:v7 + 13 length:v8 - 13];
              uint64_t v27 = [(HSTFrameParser *)self contactFrameFromData:v26];

              if (v27)
              {
                if (!*(unsigned char *)(v27 + 120)) {
                  *(unsigned char *)(v27 + 120) = 1;
                }
                *(void *)(v27 + 112) = (v25 << 32) | (v24 << 8) | 0xAAAA0001;
                objc_msgSend((id)v27, "hsSetTimestamp:", (char *)objc_msgSend((id)v27, "hsTimestamp") - 1000000 * v25);
                [(HSTFrameParser *)self sanitizeContactFrame:v27];
                v31.receiver = self;
                v31.super_class = (Class)HSTFrameParser;
                [(HSStage *)&v31 handleConsume:v27];
              }
            }
          }
          else
          {
            uint64_t v27 = MTLoggingPlugin();
            if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR)) {
              -[HSTFrameParser _handleFirmwareEventFrame:](v23, v27);
            }
          }
        }
      }
    }
    else if ([v11 notification] == 7)
    {
      int64_t v17 = MTLoggingPlugin();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_411C8, v17, OS_LOG_TYPE_DEFAULT, "device killed", buf, 2u);
      }
    }
    else if ([v11 notification] == 8)
    {
      buf[0] = 0;
      unint64_t v20 = [[HSTVendorEvent alloc] initWithType:2 buffer:buf length:1];
      v30.receiver = self;
      v30.super_class = (Class)HSTFrameParser;
      [(HSStage *)&v30 handleConsume:v20];
    }
    else if ([v11 notification] == 10)
    {
      buf[0] = 1;
      unint64_t v21 = [[HSTVendorEvent alloc] initWithType:9 buffer:buf length:1];
      v29.receiver = self;
      v29.super_class = (Class)HSTFrameParser;
      [(HSStage *)&v29 handleConsume:v21];
    }
    BOOL v15 = 1;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unsigned)_driverUserSpaceToHSTNotification:(const DriverNotification *)a3
{
  int var2 = a3->var2;
  if (var2 == 27) {
    unsigned __int16 v4 = 13;
  }
  else {
    unsigned __int16 v4 = 0;
  }
  if (var2 == 26) {
    return 12;
  }
  else {
    return v4;
  }
}

- (unsigned)_driverToHSTNotification:(const DriverNotificationHeader *)a3
{
  unsigned int v3 = a3->var1 - 2;
  if (v3 > 0xE) {
    return 0;
  }
  else {
    return word_112FA2[(char)v3];
  }
}

- (unsigned)_driverToHSTNotificationWithContext:(const DriverNotification *)a3
{
  if (a3->var1) {
    return -[HSTFrameParser _driverToHSTNotification:](self, "_driverToHSTNotification:");
  }
  else {
    return -[HSTFrameParser _driverUserSpaceToHSTNotification:](self, "_driverUserSpaceToHSTNotification:");
  }
}

- (BOOL)_handleDriverNotificationFrame:(id)a3
{
  id v5 = (void **)a3;
  if (!v5)
  {
    int64_t v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 985, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  id v6 = v5[1];
  if (v6)
  {
    BOOL v7 = HSTFrameParserTypes::ReportCast<HSTPipeline::FirmwareInterface::InputReport::DriverNotificationHeader>(v6);
    if (v7)
    {
      unint64_t v8 = HSTFrameParserTypes::ReportCast<HSTPipeline::FirmwareInterface::InputReport::DriverNotification>(v5[1]);
      v23.receiver = self;
      v23.super_class = (Class)HSTFrameParser;
      [(HSStage *)&v23 handleConsume:v5];
      if (v8)
      {
        unint64_t v9 = MTLoggingPlugin();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          [(HSTFrameParser *)(uint64_t)v7 _handleDriverNotificationFrame:v9];
        }
      }
      else
      {
        unint64_t v9 = MTLoggingPlugin();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          -[HSTFrameParser _handleDriverNotificationFrame:]((uint64_t)v7, v9);
        }
      }

      int v11 = objc_opt_new();
      if (v8) {
        uint64_t v12 = [(HSTFrameParser *)self _driverToHSTNotificationWithContext:v8];
      }
      else {
        uint64_t v12 = [(HSTFrameParser *)self _driverToHSTNotification:v7];
      }
      [v11 setNotification:v12];
      v22.receiver = self;
      v22.super_class = (Class)HSTFrameParser;
      [(HSStage *)&v22 handleConsume:v11];
      if ([v11 notification] == 1)
      {
        long long v13 = objc_opt_new();
        [(HSTFrameParser *)self handleConsume:v13];

        buf[0] = 0;
        int v14 = [[HSTVendorEvent alloc] initWithType:2 buffer:buf length:1];
        v21.receiver = self;
        v21.super_class = (Class)HSTFrameParser;
        [(HSStage *)&v21 handleConsume:v14];
      }
      else if ([v11 notification] == 3)
      {
        buf[0] = 0;
        int v14 = [[HSTVendorEvent alloc] initWithType:1 buffer:buf length:1];
        v20.receiver = self;
        v20.super_class = (Class)HSTFrameParser;
        [(HSStage *)&v20 handleConsume:v14];
      }
      else
      {
        if ([v11 notification] != 4)
        {
          if ([v11 notification] == 2)
          {
            float64x2_t v16 = MTLoggingPlugin();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&def_411C8, v16, OS_LOG_TYPE_DEFAULT, "device killed", buf, 2u);
            }
          }
          goto LABEL_21;
        }
        buf[0] = 0;
        int v14 = [[HSTVendorEvent alloc] initWithType:4 buffer:buf length:1];
        v19.receiver = self;
        v19.super_class = (Class)HSTFrameParser;
        [(HSStage *)&v19 handleConsume:v14];
      }

LABEL_21:
      BOOL v10 = 1;
      goto LABEL_22;
    }
  }
  BOOL v10 = 0;
LABEL_22:

  return v10;
}

- (BOOL)_handleDriverExternalMessageFrame:(id)a3
{
  id v5 = (id *)a3;
  if (!v5)
  {
    BOOL v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 1052, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  id v6 = v5[1];
  if (v6
    && (BOOL v7 = [v6 bytes],
        id v8 = [v5[1] length],
        unint64_t v9 = (unint64_t)v8 - 6,
        (unint64_t)v8 >= 6)
    && *v7 == 83
    && (v17.receiver = self,
        v17.super_class = (Class)HSTFrameParser,
        [(HSStage *)&v17 handleConsume:v5],
        (v7[1] & 0xFE) == 2)
    && v9 >= *((unsigned __int16 *)v7 + 1))
  {
    uint64_t v12 = MTLoggingPlugin();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = *((unsigned __int16 *)v7 + 2);
      *(_DWORD *)buf = 67109120;
      int v19 = v13;
      _os_log_impl(&def_411C8, v12, OS_LOG_TYPE_DEFAULT, "External message received: 0x%x", buf, 8u);
    }

    int v14 = [[HSTVendorEvent alloc] initWithType:3 buffer:v7 + 4 length:*((unsigned __int16 *)v7 + 1) + 2];
    v16.receiver = self;
    v16.super_class = (Class)HSTFrameParser;
    [(HSStage *)&v16 handleConsume:v14];

    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_handleTimestampSyncFrame:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HSTFrameParser.mm", 1093, @"Invalid parameter not satisfying: %@", @"frame" object file lineNumber description];
  }
  id v6 = (void *)v5[1];
  if (v6
    && (BOOL v7 = HSTFrameParserTypes::ReportCast<HSTPipeline::FirmwareInterface::InputReport::TimestampSync>(v6)) != 0
    && v7[1] == 255)
  {
    uint64_t v10 = *(void *)(v7 + 12);
    if (v10)
    {
      uint64_t v11 = v10 - *(void *)(v7 + 4);
      if (v11) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 1;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    int v13 = MTLoggingPlugin();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[HSTFrameParser _handleTimestampSyncFrame:](v12, v13);
    }

    int v14 = objc_opt_new();
    v14[2] = v12;
    v16.receiver = self;
    v16.super_class = (Class)HSTFrameParser;
    [(HSStage *)&v16 handleConsume:v14];

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_handleFrame:(id)a3
{
  id v4 = a3;
  if (![(HSTFrameParser *)self _handleContactFrame:v4]
    && ![(HSTFrameParser *)self _handlePointerFrame:v4]
    && ![(HSTFrameParser *)self _handleFirmwareEventFrame:v4]
    && ![(HSTFrameParser *)self _handleDriverNotificationFrame:v4]
    && ![(HSTFrameParser *)self _handleDriverExternalMessageFrame:v4]
    && ![(HSTFrameParser *)self _handleTimestampSyncFrame:v4])
  {
    v5.receiver = self;
    v5.super_class = (Class)HSTFrameParser;
    [(HSStage *)&v5 handleConsume:v4];
  }
}

- (void)_handleResetEvent:(id)a3
{
  *(void *)&self->_config.surfaceCoordinates.left = 0;
  *(void *)&self->_config.surfaceCoordinates.bottom = 0;
  v3.receiver = self;
  v3.super_class = (Class)HSTFrameParser;
  [(HSStage *)&v3 handleConsume:a3];
}

- (void)_handleDebugStateEvent:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    unint64_t v9 = +[NSAssertionHandler currentHandler];
    uint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTFrameParser _handleDebugStateEvent:]");
    [v9 handleFailureInFunction:v10, @"HSTFrameParser.mm", 1162, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  *((unsigned char *)v4 + 16) = 1;
  v12[0] = @"Stage";
  objc_super v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  v12[1] = @"Duplicate Contact Count";
  v13[0] = v6;
  BOOL v7 = +[NSNumber numberWithUnsignedInt:self->_config.service];
  v13[1] = v7;
  BOOL v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  [*((id *)v4 + 3) addObject:v8];
  v11.receiver = self;
  v11.super_class = (Class)HSTFrameParser;
  [(HSStage *)&v11 handleConsume:v4];
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  HSUtil::Encoder::encodeCodable<HSTPipeline::SurfaceCoordinates>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)117,(char)114,(char)102,(char)97,(char)99,(char)101,(char)67,(char)111,(char)111,(char)114,(char)100,(char)105,(char)110,(char)97,(char)116,(char)101,(char)115>::Key, (HSTPipeline::SurfaceCoordinates *)&self->_config);
  HSUtil::Encoder::encodeCodable<HSTPipeline::SensorSize>((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)101,(char)110,(char)115,(char)111,(char)114,(char)83,(char)105,(char)122,(char)101>::Key, (HSTPipeline::SensorSize *)&self->_config.dimensions.__cntrl_);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)82,(char)97,(char)110,(char)103,(char)101,(char)67,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)115>::Key, *(void *)&self->_config.surfaceCoordinates.left);
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  v5.var0 = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&v5.var1 = 0xAAAAAAAAAAAAAAAALL;
  CoderKey v13 = v5;
  CoderKey v14 = v5;
  CoderKey v11 = v5;
  CoderKey v12 = v5;
  CoderKey v10 = v5;
  HSUtil::Decoder::decodeMap((unint64_t *)a3, (uint64_t)&v10);
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser handleHSDecode:].cold.4();
    }
LABEL_13:
    BOOL v7 = 0;
    goto LABEL_14;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::SurfaceCoordinates>(&v10, (CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)117,(char)114,(char)102,(char)97,(char)99,(char)101,(char)67,(char)111,(char)111,(char)114,(char)100,(char)105,(char)110,(char)97,(char)116,(char)101,(char)115>::Key, (HSTPipeline::SurfaceCoordinates *)&self->_config);
  if (LODWORD(v10.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser handleHSDecode:]();
    }
    goto LABEL_13;
  }
  HSUtil::Decoder::decodeCodable<HSTPipeline::SensorSize>(&v10, (CoderKey *)HSUtil::CoderKey::Literal<(char)115,(char)101,(char)110,(char)115,(char)111,(char)114,(char)83,(char)105,(char)122,(char)101>::Key, (HSTPipeline::SensorSize *)&self->_config.dimensions.__cntrl_);
  if (LODWORD(v10.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser handleHSDecode:]();
    }
    goto LABEL_13;
  }
  unsigned int v6 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)&v10, (const CoderKey *)HSUtil::CoderKey::Literal<(char)105,(char)110,(char)82,(char)97,(char)110,(char)103,(char)101,(char)67,(char)111,(char)110,(char)116,(char)97,(char)99,(char)116,(char)115>::Key);
  if (LODWORD(v10.var0))
  {
    memset(__b, 170, sizeof(__b));
    basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTFrameParser.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTFrameParser handleHSDecode:]();
    }
    goto LABEL_13;
  }
  *(void *)&self->_config.surfaceCoordinates.left = v6;
  BOOL v7 = 1;
LABEL_14:
  if (v12.var0) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v12.var0);
  }
  var0 = v11.var0;
  v11.var0 = 0;
  if (var0)
  {
    std::__function::__value_func<objc_object * ()(HSUtil::Decoder &,HSUtil::CoderKey const&)>::~__value_func[abi:ne180100](var0);
    operator delete();
  }
  return v7;
}

- (id).cxx_construct
{
  *((void *)self + 18) = 0;
  return self;
}

- (void)parseContactFrame29:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame29:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame29:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame31:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame31:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame31:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame44:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame44:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame44:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame44:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame44:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame75:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame75:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame75:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame75:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)parseContactFrame75:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)sanitizeContactFrame:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)_handleFirmwareEventFrame:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&def_411C8, log, OS_LOG_TYPE_ERROR, "Failed to parse WakeEventWithTritium3Header data from wake event", v1, 2u);
}

- (void)_handleFirmwareEventFrame:(os_log_t)log .cold.2(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl(&def_411C8, log, OS_LOG_TYPE_ERROR, "Failed to parse WakeEventWithTritiumAndFrame data from wake event for tritium3 version %d", (uint8_t *)v1, 8u);
}

- (void)_handleFirmwareEventFrame:(int)a1 .cold.3(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&def_411C8, a2, OS_LOG_TYPE_ERROR, "Unknown tritium3 version received: %d", (uint8_t *)v2, 8u);
}

- (void)_handleDriverNotificationFrame:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&def_411C8, a2, OS_LOG_TYPE_DEBUG, "Driver notification received: type=%x", (uint8_t *)v3, 8u);
}

- (void)_handleDriverNotificationFrame:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 1);
  int v4 = *(unsigned __int8 *)(a2 + 2);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl(&def_411C8, log, OS_LOG_TYPE_DEBUG, "Driver notification received: type=%x context=%d", (uint8_t *)v5, 0xEu);
}

- (void)_handleTimestampSyncFrame:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&def_411C8, a2, OS_LOG_TYPE_DEBUG, "Timestamp sync received: %lldms", (uint8_t *)&v2, 0xCu);
}

- (void)handleHSDecode:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

- (void)handleHSDecode:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&def_411C8, &_os_log_default, v0, "Assertion failed (%s @ %s:%ju): %s", v1, v2, v3, v4, 2u);
}

@end