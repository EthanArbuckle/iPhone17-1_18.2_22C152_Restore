@interface CRXFVisionPrescriptionURLDecoder
- (CRXFVisionPrescriptionURLDecoder)initWithDeviceModel:(id)a3;
- (id)prescriptionFromURL:(id)a3 withDescription:(id)a4;
- (unsigned)computeCRC16ForString:(id)a3;
- (unsigned)computeURLChecksum:(id)a3;
@end

@implementation CRXFVisionPrescriptionURLDecoder

- (CRXFVisionPrescriptionURLDecoder)initWithDeviceModel:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRXFVisionPrescriptionURLDecoder;
  v5 = [(CRXFVisionPrescriptionURLDecoder *)&v20 init];
  if (v5)
  {
    os_log_t v6 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    uint64_t v8 = [v4 copy];
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v8;

    v10 = [MEMORY[0x263F0A830] diopterUnit];
    uint64_t v11 = HKQuantityRangeInclusive();
    sphereRange = v5->_sphereRange;
    v5->_sphereRange = (HKQuantityRange *)v11;

    v13 = [MEMORY[0x263F0A830] diopterUnit];
    uint64_t v14 = HKQuantityRangeInclusive();
    cylinderRange = v5->_cylinderRange;
    v5->_cylinderRange = (HKQuantityRange *)v14;

    v16 = [MEMORY[0x263F0A830] degreeAngleUnit];
    uint64_t v17 = HKQuantityRangeInclusive();
    axisRange = v5->_axisRange;
    v5->_axisRange = (HKQuantityRange *)v17;
  }
  return v5;
}

- (id)prescriptionFromURL:(id)a3 withDescription:(id)a4
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (__CFString *)a4;
  v83 = v6;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v6 resolvingAgainstBaseURL:0];
  v9 = v8;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[CRXFVisionPrescriptionURLDecoder prescriptionFromURL:withDescription:]();
    }
    v51 = 0;
    goto LABEL_73;
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v10 = [v8 queryItems];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v97 objects:v121 count:16];
  v94 = self;
  v81 = v7;
  if (!v11)
  {
    v47 = 0;
    v48 = 0;
    v92 = 0;
    v49 = 0;
    v50 = 0;
    v85 = 0;
    v86 = 0;
    unint64_t v82 = 0;
    int v89 = 1;
    int v84 = 1;
LABEL_51:

    goto LABEL_53;
  }
  uint64_t v12 = v11;
  v80 = v9;
  char v79 = 0;
  uint64_t v13 = 0;
  unint64_t v82 = 0;
  unsigned __int16 v78 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  v90 = 0;
  v92 = 0;
  v93 = 0;
  v96 = 0;
  uint64_t v14 = *(void *)v98;
  int v84 = 1;
  int v89 = 1;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v98 != v14) {
        objc_enumerationMutation(v10);
      }
      v16 = *(void **)(*((void *)&v97 + 1) + 8 * v15);
      uint64_t v17 = [v16 name];
      v18 = [v16 value];
      if (v18)
      {
        if ([v17 isEqualToString:@"ls"])
        {
          v19 = (void *)MEMORY[0x263F0A630];
          objc_super v20 = [MEMORY[0x263F0A830] diopterUnit];
          [v18 doubleValue];
          v21 = objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20);

          if ([(HKQuantityRange *)self->_sphereRange containsQuantity:v21])
          {
            id v22 = v21;

            v96 = v22;
          }
          goto LABEL_25;
        }
        if ([v17 isEqualToString:@"lc"])
        {
          v23 = (void *)MEMORY[0x263F0A630];
          v24 = [MEMORY[0x263F0A830] diopterUnit];
          [v18 doubleValue];
          v21 = objc_msgSend(v23, "quantityWithUnit:doubleValue:", v24);

          self = v94;
          if ([(HKQuantityRange *)v94->_cylinderRange containsQuantity:v21])
          {
            id v25 = v21;

            v93 = v25;
          }
          goto LABEL_25;
        }
        if ([v17 isEqualToString:@"la"])
        {
          [v18 doubleValue];
          if (v26 != 0.0)
          {
            double v27 = v26;
            v28 = (void *)MEMORY[0x263F0A630];
            v29 = [MEMORY[0x263F0A830] degreeAngleUnit];
            v21 = [v28 quantityWithUnit:v29 doubleValue:v27];

            self = v94;
            if ([(HKQuantityRange *)v94->_axisRange containsQuantity:v21])
            {
              id v30 = v21;

              v92 = v30;
            }
            else
            {
              int v89 = 0;
            }
            goto LABEL_25;
          }
          goto LABEL_26;
        }
        if ([v17 isEqualToString:@"rs"])
        {
          v31 = (void *)MEMORY[0x263F0A630];
          v32 = [MEMORY[0x263F0A830] diopterUnit];
          [v18 doubleValue];
          v21 = objc_msgSend(v31, "quantityWithUnit:doubleValue:", v32);

          self = v94;
          if ([(HKQuantityRange *)v94->_sphereRange containsQuantity:v21])
          {
            id v33 = v21;

            v90 = v33;
          }
        }
        else
        {
          if (![v17 isEqualToString:@"rc"])
          {
            if ([v17 isEqualToString:@"ra"])
            {
              [v18 doubleValue];
              if (v37 != 0.0)
              {
                double v38 = v37;
                v39 = (void *)MEMORY[0x263F0A630];
                v40 = [MEMORY[0x263F0A830] degreeAngleUnit];
                v21 = [v39 quantityWithUnit:v40 doubleValue:v38];

                self = v94;
                if ([(HKQuantityRange *)v94->_axisRange containsQuantity:v21])
                {
                  id v41 = v21;

                  v85 = v41;
                }
                else
                {
                  int v84 = 0;
                }
                goto LABEL_25;
              }
            }
            else if ([v17 isEqualToString:@"acc"])
            {
              if ([v18 length] == 38 || objc_msgSend(v18, "length") == 32)
              {
                uint64_t v42 = objc_msgSend(MEMORY[0x263EFF8F8], "crxu_dataWithHexString:", v18);

                v86 = (void *)v42;
              }
            }
            else if ([v17 isEqualToString:@"cc"])
            {
              unint64_t v82 = strtoul((const char *)[v18 UTF8String], 0, 10);
            }
            else if ([v17 isEqualToString:@"c"])
            {
              v43 = [v80 queryItems];
              uint64_t v44 = [v43 count] - 1;

              if (v13 == v44)
              {
                unsigned __int16 v78 = strtoul((const char *)[v18 UTF8String], 0, 16);
                char v79 = 1;
              }
            }
LABEL_26:
            ++v13;
            goto LABEL_27;
          }
          v34 = (void *)MEMORY[0x263F0A630];
          v35 = [MEMORY[0x263F0A830] diopterUnit];
          [v18 doubleValue];
          v21 = objc_msgSend(v34, "quantityWithUnit:doubleValue:", v35);

          self = v94;
          if ([(HKQuantityRange *)v94->_cylinderRange containsQuantity:v21])
          {
            id v36 = v21;

            v87 = v36;
          }
        }
LABEL_25:

        goto LABEL_26;
      }
LABEL_27:

      ++v15;
    }
    while (v12 != v15);
    uint64_t v45 = [v10 countByEnumeratingWithState:&v97 objects:v121 count:16];
    uint64_t v12 = v45;
  }
  while (v45);

  if (v79)
  {
    v46 = [v83 absoluteString];
    v10 = objc_msgSend(v46, "substringToIndex:", objc_msgSend(v46, "length") - 7);

    v9 = v80;
    v7 = v81;
    v47 = v96;
    v48 = v93;
    v49 = v90;
    if ([(CRXFVisionPrescriptionURLDecoder *)self computeCRC16ForString:v10] == v78)
    {
      v50 = v87;
      goto LABEL_51;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      -[CRXFVisionPrescriptionURLDecoder prescriptionFromURL:withDescription:]();
    }

    v51 = 0;
    v53 = v86;
    v70 = v87;
    v68 = v85;
LABEL_71:
    v69 = v92;
    goto LABEL_72;
  }
  v9 = v80;
  v7 = v81;
  v47 = v96;
  v48 = v93;
  v49 = v90;
  v50 = v87;
LABEL_53:
  log = self->_log;
  v96 = v47;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v73 = v50;
    v74 = NSNumber;
    v75 = log;
    v76 = [v74 numberWithBool:v89 & 1];
    v77 = [NSNumber numberWithBool:v84 & 1];
    *(_DWORD *)buf = 136317186;
    v104 = "-[CRXFVisionPrescriptionURLDecoder prescriptionFromURL:withDescription:]";
    __int16 v105 = 1024;
    int v106 = 246;
    __int16 v107 = 2112;
    v108 = v48;
    __int16 v109 = 2112;
    v110 = v47;
    __int16 v111 = 2112;
    v112 = v73;
    __int16 v113 = 2112;
    v114 = v49;
    __int16 v115 = 2112;
    v116 = v86;
    __int16 v117 = 2112;
    v118 = v76;
    v7 = v81;
    __int16 v119 = 2112;
    v120 = v77;
    _os_log_debug_impl(&dword_24C484000, v75, OS_LOG_TYPE_DEBUG, "%s @%d: lc: %@, ls: %@, rc: %@, rs: %@, acc: %@, la: %@, ra: %@", buf, 0x58u);

    v50 = v73;
    self = v94;
  }
  v53 = v86;
  if (!v48 || !v47 || !v50 || !v49 || !v86 || ((v89 ^ 1) & 1) != 0 || ((v84 ^ 1) & 1) != 0)
  {
    v71 = self;
    v70 = v50;
    if (os_log_type_enabled((os_log_t)v71->_log, OS_LOG_TYPE_DEBUG)) {
      -[CRXFVisionPrescriptionURLDecoder prescriptionFromURL:withDescription:]();
    }
    v51 = 0;
    v68 = v85;
    v53 = v86;
    goto LABEL_71;
  }
  v54 = (void *)[objc_alloc(MEMORY[0x263F0A3E8]) initWithSphere:v49 cylinder:v50 axis:v85 addPower:0 vertexDistance:0 prism:0 farPupillaryDistance:0 nearPupillaryDistance:0];
  v95 = (void *)[objc_alloc(MEMORY[0x263F0A3E8]) initWithSphere:v47 cylinder:v48 axis:v92 addPower:0 vertexDistance:0 prism:0 farPupillaryDistance:0 nearPupillaryDistance:0];
  uint64_t v55 = *MEMORY[0x263F0ABA0];
  v101[0] = *MEMORY[0x263F0AB88];
  v101[1] = v55;
  deviceModel = self->_deviceModel;
  v102[0] = v86;
  v102[1] = deviceModel;
  v101[2] = *MEMORY[0x263F0AB90];
  uint64_t v57 = [NSNumber numberWithUnsignedInt:v82];
  v88 = v50;
  v58 = (void *)v57;
  v59 = @"Lenses";
  uint64_t v60 = *MEMORY[0x263F09A80];
  if (v7) {
    v59 = v7;
  }
  v102[2] = v57;
  v102[3] = v59;
  uint64_t v61 = *MEMORY[0x263F09AF0];
  v101[3] = v60;
  v101[4] = v61;
  v62 = [MEMORY[0x263F08C38] UUID];
  [v62 UUIDString];
  v63 = v91 = v49;
  v101[5] = *MEMORY[0x263F09AF8];
  v102[4] = v63;
  v102[5] = &unk_26FECDEB8;
  v64 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:6];

  v65 = (void *)MEMORY[0x263F0A3F0];
  v66 = [MEMORY[0x263EFF910] date];
  v67 = [MEMORY[0x263F0A2D8] localDevice];
  v51 = [v65 prescriptionWithRightEyeSpecification:v54 leftEyeSpecification:v95 dateIssued:v66 expirationDate:0 device:v67 metadata:v64];

  v68 = v85;
  v7 = v81;

  v69 = v92;
  v49 = v91;
  v70 = v88;
LABEL_72:

LABEL_73:
  return v51;
}

- (unsigned)computeURLChecksum:(id)a3
{
  id v4 = [a3 absoluteString];
  if ((unint64_t)[v4 length] >= 7)
  {
    id v6 = objc_msgSend(v4, "substringWithRange:", objc_msgSend(v4, "length") - 7, 3);
    if ([v6 isEqualToString:@"&c="])
    {
      uint64_t v7 = objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 7);

      id v4 = (void *)v7;
    }
    unsigned __int16 v5 = [(CRXFVisionPrescriptionURLDecoder *)self computeCRC16ForString:v4];
  }
  else
  {
    unsigned __int16 v5 = 0;
  }

  return v5;
}

- (unsigned)computeCRC16ForString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 dataUsingEncoding:4];
  unsigned __int16 v5 = (unsigned __int8 *)[v4 bytes];
  uint64_t v6 = [v4 length];
  if (v6 < 1)
  {
    unsigned __int16 v8 = -1;
  }
  else
  {
    uint64_t v7 = &v5[v6];
    unsigned __int16 v8 = -1;
    do
    {
      int v9 = *v5++;
      unsigned int v10 = v9 ^ HIBYTE(v8) ^ ((v9 ^ HIBYTE(v8)) >> 4);
      unsigned __int16 v8 = (v10 | (v8 << 8)) ^ ((_WORD)v10 << 12) ^ (32 * v10);
    }
    while (v5 < v7);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisRange, 0);
  objc_storeStrong((id *)&self->_cylinderRange, 0);
  objc_storeStrong((id *)&self->_sphereRange, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)prescriptionFromURL:withDescription:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)((char *)&v1[3] + 2) = 59;
  _os_log_error_impl(&dword_24C484000, v0, OS_LOG_TYPE_ERROR, "%s @%d: Can't get query items.", (uint8_t *)v1, 0x12u);
}

- (void)prescriptionFromURL:withDescription:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)((char *)&v1[3] + 2) = 250;
  _os_log_debug_impl(&dword_24C484000, v0, OS_LOG_TYPE_DEBUG, "%s @%d: Invalid or missing RX values", (uint8_t *)v1, 0x12u);
}

- (void)prescriptionFromURL:withDescription:.cold.3()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(_DWORD *)id v3 = 136315906;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v3[7] = 239;
  v3[9] = 1026;
  int v4 = v0;
  __int16 v5 = 1026;
  int v6 = v1;
  _os_log_debug_impl(&dword_24C484000, v2, OS_LOG_TYPE_DEBUG, "%s @%d: checksum failed: %{public}04x vs %{public}04x", (uint8_t *)v3, 0x1Eu);
}

@end