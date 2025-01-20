@interface CMContinuityCaptureCapabilities
+ (id)capabilitiesForCurrentDevice;
+ (void)capabilitiesForCurrentDevice;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)capabilitiesVersion;
- (BOOL)userDisabled;
- (CMContinuityCaptureCapabilities)initWithCapabilitiesVersion:(id *)a3 devicesCapabilities:(id)a4 userDisabled:(BOOL)a5;
- (CMContinuityCaptureCapabilities)initWithDictionaryRepresentation:(id)a3;
- (NSArray)devicesCapabilities;
- (NSString)debugDescription;
- (NSString)description;
- (id)dictionaryRepresentation;
@end

@implementation CMContinuityCaptureCapabilities

+ (id)capabilitiesForCurrentDevice
{
  char BoolAnswer = AVGestaltGetBoolAnswer();
  uint64_t UserPreferenceDisabled = FigContinuityCaptureGetUserPreferenceDisabled();
  if (BoolAnswer)
  {
    uint64_t v4 = UserPreferenceDisabled;
    if (UserPreferenceDisabled)
    {
      v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        v15 = "User has opted out of Continuity Capture";
LABEL_26:
        _os_log_impl(&dword_235FC2000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 2u);
      }
    }
    else
    {
      if GestaltGetDeviceClass() != 3 || (_os_feature_enabled_impl())
      {
        v5 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v6 = +[CMContinuityCaptureDeviceCapabilities capabilitiesForEntityType:1];
        if (v6)
        {
          v7 = (void *)v6;
          [v5 addObject:v6];
          v8 = +[CMContinuityCaptureDeviceCapabilities capabilitiesForEntityType:2];
          if (v8)
          {
            [v5 addObject:v8];
          }
          else
          {
            v9 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              LOWORD(v17) = 0;
              _os_log_impl(&dword_235FC2000, v9, OS_LOG_TYPE_INFO, "ContinuityCaptureEntityTypeDeskcamVideo not available on this device", (uint8_t *)&v17, 2u);
            }
          }
          v10 = +[CMContinuityCaptureDeviceCapabilities capabilitiesForEntityType:3];
          [v5 addObject:v10];
          goto LABEL_12;
        }
        v16 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice]();
        }

LABEL_28:
        v7 = 0;
        v8 = 0;
        v10 = 0;
LABEL_12:
        id v11 = objc_alloc((Class)objc_opt_class());
        long long v17 = xmmword_2360595C8;
        uint64_t v18 = 1;
        v12 = (void *)[v11 initWithCapabilitiesVersion:&v17 devicesCapabilities:v5 userDisabled:v4];

        goto LABEL_13;
      }
      v14 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        v15 = "Feature flag Laguna/ContinuityCapture_iPad disabled";
        goto LABEL_26;
      }
    }

    v5 = 0;
    goto LABEL_28;
  }
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_INFO, "Device does not support Continuity Capture", (uint8_t *)&v17, 2u);
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (CMContinuityCaptureCapabilities)initWithCapabilitiesVersion:(id *)a3 devicesCapabilities:(id)a4 userDisabled:(BOOL)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CMContinuityCaptureCapabilities;
  v9 = [(CMContinuityCaptureCapabilities *)&v15 init];
  v10 = (CMContinuityCaptureCapabilities *)v9;
  if (v9)
  {
    long long v11 = *(_OWORD *)&a3->var0;
    *((void *)v9 + 3) = a3->var2;
    *(_OWORD *)(v9 + 8) = v11;
    uint64_t v12 = [v8 copy];
    devicesCapabilities = v10->_devicesCapabilities;
    v10->_devicesCapabilities = (NSArray *)v12;

    v10->_userDisabled = a5;
  }

  return v10;
}

- (CMContinuityCaptureCapabilities)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [v4 objectForKeyedSubscript:@"CapabilitiesVersion"];
  v7 = [v4 objectForKeyedSubscript:@"CapabiltiesMinorVersion"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"CapabiltiesPatchVersion"];
  v41 = (void *)v8;
  if (v6)
  {
    v9 = (void *)v8;
    uint64_t v10 = [v6 integerValue];
    uint64_t v11 = 0;
    if (v7)
    {
      *((void *)&v42 + 1) = 0;
      if (v9)
      {
        uint64_t v11 = [v7 integerValue];
        *((void *)&v42 + 1) = [v9 integerValue];
      }
    }
    else
    {
      *((void *)&v42 + 1) = 0;
    }
    uint64_t v12 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[%ld.%ld.%ld]", v10, v11, *((void *)&v42 + 1));
      v13 = uint64_t v43 = v11;
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"[%ld.%ld.%ld]", 3, 303, 1);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v14;
      _os_log_impl(&dword_235FC2000, v12, OS_LOG_TYPE_INFO, "Remote Device Version %@, Current Device version %@", buf, 0x16u);

      uint64_t v11 = v43;
    }
    uint64_t v38 = v10;
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v11 = 0;
    *((void *)&v42 + 1) = 0;
  }
  objc_super v15 = [v4 objectForKeyedSubscript:@"UserDisabled"];
  unsigned int v16 = [v15 BOOLValue];

  long long v17 = [v4 objectForKeyedSubscript:@"Devices"];
  uint64_t v18 = v17;
  if (v17)
  {
    unsigned int v37 = v16;
    *(void *)&long long v42 = v11;
    v39 = v7;
    v40 = self;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v45;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          v25 = [[CMContinuityCaptureDeviceCapabilities alloc] initWithDictionaryRepresentation:v24];
          if (!v25)
          {
            v28 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              -[CMContinuityCaptureCapabilities initWithDictionaryRepresentation:](v24, v28, v29, v30, v31, v32, v33, v34);
            }

            v27 = 0;
            self = v40;
            goto LABEL_23;
          }
          v26 = v25;
          [v5 addObject:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v44 objects:v49 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    *(void *)buf = v38;
    *(_OWORD *)&buf[8] = v42;
    self = [(CMContinuityCaptureCapabilities *)v40 initWithCapabilitiesVersion:buf devicesCapabilities:v5 userDisabled:v37];
    v27 = self;
LABEL_23:
    v7 = v39;
  }
  else
  {
    v36 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureCapabilities initWithDictionaryRepresentation:]();
    }

    v27 = 0;
  }

  return v27;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithInteger:self->_capabilitiesVersion.major];
  [v3 setObject:v4 forKeyedSubscript:@"CapabilitiesVersion"];

  id v5 = [NSNumber numberWithInteger:self->_capabilitiesVersion.minor];
  [v3 setObject:v5 forKeyedSubscript:@"CapabiltiesMinorVersion"];

  uint64_t v6 = [NSNumber numberWithInteger:self->_capabilitiesVersion.patch];
  [v3 setObject:v6 forKeyedSubscript:@"CapabiltiesPatchVersion"];

  v7 = [NSNumber numberWithBool:self->_userDisabled];
  [v3 setObject:v7 forKeyedSubscript:@"UserDisabled"];

  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = self->_devicesCapabilities;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v3 setObject:v8 forKeyedSubscript:@"Devices"];
  return v3;
}

- (NSString)debugDescription
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"[%ld.%ld.%ld]", self->_capabilitiesVersion.major, self->_capabilitiesVersion.minor, self->_capabilitiesVersion.patch);
  id v5 = [v3 stringWithFormat:@"V:%@, D:%d", v4, self->_userDisabled];

  if ([(NSArray *)self->_devicesCapabilities count]) {
    [v5 appendString:@" "];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_devicesCapabilities;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) debugDescription];
        [v5 appendFormat:@"(%@)", v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSString *)v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CMContinuityCaptureCapabilities *)self debugDescription];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p %@>", v5, self, v6];

  return (NSString *)v7;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)capabilitiesVersion
{
  *($93270A8783F91AF9136665ABBDC0A449 *)retstr = *($93270A8783F91AF9136665ABBDC0A449 *)&self->var1;
  return self;
}

- (NSArray)devicesCapabilities
{
  return self->_devicesCapabilities;
}

- (BOOL)userDisabled
{
  return self->_userDisabled;
}

- (void).cxx_destruct
{
}

+ (void)capabilitiesForCurrentDevice
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Could not create capabilities for ContinuityCaptureEntityTypeDefaultVideo", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:.cold.1()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8_0(&dword_235FC2000, v0, v1, "Missing CMContinuityCaptureCapabilitiesKey_Devices", v2, v3, v4, v5, v6);
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end