@interface CRXFAppClipCodeTranscoder
+ (CRXFAppClipCodeTranscoder)sharedInstance;
- (BOOL)encodeAppClipCode:(id)a3 toBytes:(char *)a4 length:(unint64_t)a5 error:(id *)a6;
- (BOOL)encodeAppClipCode:(id)a3 toData:(id)a4 error:(id *)a5;
- (BOOL)encodeAppClipCodeV1:(id)a3 toBuffer:(id)a4 error:(id *)a5;
- (BOOL)encodeAppClipCodeV2:(id)a3 toBuffer:(id)a4 error:(id *)a5;
- (BOOL)encodeAppClipCodeV3:(id)a3 toBuffer:(id)a4 error:(id *)a5;
- (BOOL)encodeAppClipCodeV4:(id)a3 toBuffer:(id)a4 error:(id *)a5;
- (BOOL)encodeAppClipCodeV5:(id)a3 toBuffer:(id)a4 error:(id *)a5;
- (BOOL)getIndexForQuarterDiopterValue:(float)a3 minValue:(float)a4 maxValue:(float)a5 index:(unint64_t *)a6;
- (BOOL)getQuarterDiopterValueForIndex:(unint64_t)a3 minValue:(float)a4 maxValue:(float)a5 value:(float *)a6;
- (BOOL)isACCVersionSupported:(unint64_t)a3;
- (CRXFAppClipCodeTranscoder)init;
- (float)vRxFromAddValue:(float)a3 andSphereValue:(float)a4;
- (id)decodeAppClipCodeFromBytes:(const char *)a3 length:(unint64_t)a4 allowUnsupportedRX:(BOOL)a5 error:(id *)a6;
- (id)decodeAppClipCodeFromData:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5;
- (id)decodeAppClipCodeFromHexString:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5;
- (id)decodeAppClipCodeV1FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5;
- (id)decodeAppClipCodeV2FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5;
- (id)decodeAppClipCodeV3FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5;
- (id)decodeAppClipCodeV4FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5;
- (id)decodeAppClipCodeV5FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5;
- (id)derivePayloadWithLensTypeZeroed:(id)a3 ifLensTypeIs:(unint64_t)a4;
- (id)derivePayloadWithSoftwareBitsZeroedFromPayload:(id)a3;
- (id)encodeAppClipCodeToHexString:(id)a3 error:(id *)a4;
- (id)errorForStatus:(unint64_t)a3 leftLens:(BOOL)a4;
- (id)generateAppClipCodeWithVersion:(unint64_t)a3 lensType:(unint64_t)a4 haveLeftLens:(BOOL)a5 leftSphere:(float)a6 leftCylinder:(float)a7 leftAxis:(unint64_t)a8 leftAddVR:(float)a9 haveRightLens:(BOOL)a10 rightSphere:(float)a11 rightCylinder:(float)a12 rightAxis:(unint64_t)a13 rightAddVR:(float)a14 identifyingColor:(unint64_t)a15 secret:(id)a16 error:(id *)a17;
- (id)mergeLeftAppClipCode:(id)a3 withRightAppClipCode:(id)a4 error:(id *)a5;
- (unint64_t)decodeAppClipCodeVersionFromBuffer:(id)a3 error:(id *)a4;
- (unint64_t)decodeCalibrationRXID:(unint64_t *)a3 calibrationSphere:(float *)a4 calibrationCylinder:(float *)a5 calibrationAxis:(unint64_t *)a6 addVR:(float *)a7 clampingStatus:(unint64_t *)a8 displaySphere:(float *)a9 displayCylinder:(float *)a10 displayAxis:(unint64_t *)a11 fromRXID:(unint64_t)a12 RXOffsetID:(unint64_t)a13 cylinderSignFlipped:(BOOL)a14 axisID:(unint64_t)a15 allowUnsupportedRX:(BOOL)a16;
- (unint64_t)encodeSphere:(float)a3 cylinder:(float)a4 axis:(unint64_t)a5 toRXID:(unint64_t *)a6 axisID:(unint64_t *)a7;
- (unint64_t)lookUpAxisID:(unint64_t *)a3 forAxisValue:(unint64_t)a4;
- (unint64_t)lookUpAxisValue:(unint64_t *)a3 forAxisID:(unint64_t)a4;
- (unint64_t)lookUpRXID:(unint64_t *)a3 forSphereValue:(float)a4 cylinderValue:(float)a5;
- (unint64_t)lookUpSphereValue:(float *)a3 cylinderValue:(float *)a4 forRXID:(unint64_t)a5;
- (unint64_t)lookupBestValidRXID:(unint64_t *)a3 andSphere:(float *)a4 matchingCylinder:(float)a5 nearSphere:(float)a6;
- (unint64_t)payloadLengthForAppClipCodeVersion:(unint64_t)a3;
@end

@implementation CRXFAppClipCodeTranscoder

+ (CRXFAppClipCodeTranscoder)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CRXFAppClipCodeTranscoder_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once__LINE__ != -1) {
    dispatch_once(&sharedInstance___once__LINE__, block);
  }
  v2 = (void *)sharedInstance_instance;
  return (CRXFAppClipCodeTranscoder *)v2;
}

uint64_t __43__CRXFAppClipCodeTranscoder_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (CRXFAppClipCodeTranscoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRXFAppClipCodeTranscoder;
  v2 = [(CRXFAppClipCodeTranscoder *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;
  }
  return v2;
}

- (unint64_t)payloadLengthForAppClipCodeVersion:(unint64_t)a3
{
  if (a3 <= 5) {
    return 16;
  }
  else {
    return 19;
  }
}

- (unint64_t)decodeAppClipCodeVersionFromBuffer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v10 = 0;
  if ([v5 byteCount] != 16)
  {
    if ([v5 byteCount] != 19)
    {
      uint64_t v6 = 99;
LABEL_6:
      objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v6, MEMORY[0x263EFFA78]);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    if (([v5 skipBits:145] & 1) == 0)
    {
      uint64_t v6 = 95;
      goto LABEL_6;
    }
  }
LABEL_7:
  if ([v5 readUInteger:&v10 bitWidth:4])
  {
    id v7 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 105, MEMORY[0x263EFFA78]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  if (a4 && v7)
  {
    id v7 = v7;
    *a4 = v7;
  }
LABEL_13:
  unint64_t v8 = v10;

  return v8;
}

- (id)decodeAppClipCodeFromBytes:(const char *)a3 length:(unint64_t)a4 allowUnsupportedRX:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  unint64_t v10 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeFromData:v9 allowUnsupportedRX:v7 error:a6];

  return v10;
}

- (id)decodeAppClipCodeFromHexString:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  unint64_t v8 = objc_msgSend(MEMORY[0x263EFF8F8], "crxu_dataWithHexString:", a3);
  if (v8)
  {
    v9 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeFromData:v8 allowUnsupportedRX:v6 error:a5];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 32, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 129, MEMORY[0x263EFFA78]);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)isACCVersionSupported:(unint64_t)a3
{
  return a3 - 1 < 5;
}

- (id)decodeAppClipCodeFromData:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([v8 length])
  {
    v9 = [[CRXUBitBuffer alloc] initWithData:v8];
    id v21 = 0;
    unint64_t v10 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeVersionFromBuffer:v9 error:&v21];
    id v11 = v21;
    v12 = v11;
    if (v11)
    {
      if (a5)
      {
        id v13 = v11;
LABEL_14:
        v14 = 0;
        *a5 = v13;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      if ([(CRXFAppClipCodeTranscoder *)self isACCVersionSupported:v10])
      {
        [(CRXUBitBuffer *)v9 rewind];
        switch(v10)
        {
          case 1uLL:
            uint64_t v15 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeV1FromBuffer:v9 allowUnsupportedRX:v6 error:a5];
            break;
          case 2uLL:
            uint64_t v15 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeV2FromBuffer:v9 allowUnsupportedRX:v6 error:a5];
            break;
          case 3uLL:
            uint64_t v15 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeV3FromBuffer:v9 allowUnsupportedRX:v6 error:a5];
            break;
          case 4uLL:
            uint64_t v15 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeV4FromBuffer:v9 allowUnsupportedRX:v6 error:a5];
            break;
          case 5uLL:
            uint64_t v15 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeV5FromBuffer:v9 allowUnsupportedRX:v6 error:a5];
            break;
          default:
            if (!a5) {
              goto LABEL_17;
            }
            v16 = (void *)MEMORY[0x263F087E8];
            uint64_t v17 = MEMORY[0x263EFFA78];
            uint64_t v18 = 2;
            uint64_t v19 = 236;
            goto LABEL_13;
        }
        v14 = (void *)v15;
        goto LABEL_23;
      }
      if (a5)
      {
        v16 = (void *)MEMORY[0x263F087E8];
        uint64_t v17 = MEMORY[0x263EFFA78];
        uint64_t v18 = 48;
        uint64_t v19 = 187;
LABEL_13:
        objc_msgSend(v16, "crxf_errorWithCode:file:line:userInfo:", v18, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v19, v17);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
LABEL_17:
    v14 = 0;
    goto LABEL_23;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 32, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 169, MEMORY[0x263EFFA78]);
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_24:

  return v14;
}

- (BOOL)encodeAppClipCode:(id)a3 toBytes:(char *)a4 length:(unint64_t)a5 error:(id *)a6
{
  unint64_t v10 = (objc_class *)MEMORY[0x263EFF990];
  id v11 = a3;
  v12 = (void *)[[v10 alloc] initWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
  LOBYTE(a6) = [(CRXFAppClipCodeTranscoder *)self encodeAppClipCode:v11 toData:v12 error:a6];

  return (char)a6;
}

- (id)encodeAppClipCodeToHexString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = -[CRXFAppClipCodeTranscoder payloadLengthForAppClipCodeVersion:](self, "payloadLengthForAppClipCodeVersion:", [v6 version]);
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v7];
  LODWORD(a4) = [(CRXFAppClipCodeTranscoder *)self encodeAppClipCode:v6 toData:v8 error:a4];

  if (a4)
  {
    v9 = objc_msgSend(v8, "crxu_asHexString");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)encodeAppClipCode:(id)a3 toData:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = [[CRXUBitBuffer alloc] initWithMutableData:v9];

  switch([v8 version])
  {
    case 1:
      BOOL v11 = [(CRXFAppClipCodeTranscoder *)self encodeAppClipCodeV1:v8 toBuffer:v10 error:a5];
      goto LABEL_9;
    case 2:
      BOOL v11 = [(CRXFAppClipCodeTranscoder *)self encodeAppClipCodeV2:v8 toBuffer:v10 error:a5];
      goto LABEL_9;
    case 3:
      BOOL v11 = [(CRXFAppClipCodeTranscoder *)self encodeAppClipCodeV3:v8 toBuffer:v10 error:a5];
      goto LABEL_9;
    case 4:
      BOOL v11 = [(CRXFAppClipCodeTranscoder *)self encodeAppClipCodeV4:v8 toBuffer:v10 error:a5];
      goto LABEL_9;
    case 5:
      BOOL v11 = [(CRXFAppClipCodeTranscoder *)self encodeAppClipCodeV5:v8 toBuffer:v10 error:a5];
LABEL_9:
      BOOL v12 = v11;
      break;
    default:
      if (a5)
      {
        objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 2, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 299, MEMORY[0x263EFFA78]);
        BOOL v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v12 = 0;
      }
      break;
  }

  return v12;
}

- (id)generateAppClipCodeWithVersion:(unint64_t)a3 lensType:(unint64_t)a4 haveLeftLens:(BOOL)a5 leftSphere:(float)a6 leftCylinder:(float)a7 leftAxis:(unint64_t)a8 leftAddVR:(float)a9 haveRightLens:(BOOL)a10 rightSphere:(float)a11 rightCylinder:(float)a12 rightAxis:(unint64_t)a13 rightAddVR:(float)a14 identifyingColor:(unint64_t)a15 secret:(id)a16 error:(id *)a17
{
  BOOL v18 = a10;
  BOOL v20 = a5;
  id v30 = a16;
  v33 = v30;
  if (a7 <= 0.0)
  {
    float v34 = a7;
  }
  else
  {
    a8 = (a8 + 90) % 0xB4;
    float v34 = -a7;
  }
  if (a7 > 0.0) {
    a6 = a6 + a7;
  }
  if (a12 <= 0.0)
  {
    float v35 = a12;
  }
  else
  {
    a11 = a11 + a12;
    float v35 = -a12;
  }
  if (a12 > 0.0) {
    a13 = (a13 + 90) % 0xB4;
  }
  if (!v30)
  {
    v33 = objc_msgSend(MEMORY[0x263EFF8F8], "crxu_randomDataWithLength:", 10);
  }
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  if (!v20)
  {
    BOOL v37 = 1;
    if (v18) {
      goto LABEL_18;
    }
LABEL_22:
    BOOL v39 = 1;
    goto LABEL_23;
  }
  *(float *)&double v31 = a6;
  *(float *)&double v32 = v34;
  unint64_t v36 = [(CRXFAppClipCodeTranscoder *)self encodeSphere:a8 cylinder:&v54 axis:&v52 toRXID:v31 axisID:v32];
  BOOL v37 = v36 == 0;
  if (a17 && v36)
  {
    [(CRXFAppClipCodeTranscoder *)self errorForStatus:v36 leftLens:1];
    BOOL v37 = 0;
    *a17 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v18) {
    goto LABEL_22;
  }
LABEL_18:
  *(float *)&double v31 = a11;
  *(float *)&double v32 = v35;
  unint64_t v38 = [(CRXFAppClipCodeTranscoder *)self encodeSphere:a13 cylinder:&v53 axis:&v51 toRXID:v31 axisID:v32];
  BOOL v39 = v38 == 0;
  if (a17 && v38)
  {
    [(CRXFAppClipCodeTranscoder *)self errorForStatus:v38 leftLens:0];
    v40 = 0;
    *a17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
LABEL_23:
  if (v37 && v39)
  {
    v41 = [CRXFAppClipCode alloc];
    *(float *)&double v42 = a6;
    *(float *)&double v43 = v34;
    *(float *)&double v44 = a6;
    *(float *)&double v45 = v34;
    *(float *)&double v46 = a9;
    *(float *)&double v47 = v35;
    *(float *)&double v48 = a11;
    *(float *)&double v49 = a11;
    v40 = -[CRXFAppClipCode initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:randomBits:](v41, "initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:randomBits:", a3, a4, a7 > 0.0, a12 > 0.0, v54, v54, v42, v43, v44, v45, v46, v48, v47,
            v49,
            v52,
            a8,
            a8,
            0,
            v53,
            v53,
            __PAIR64__(LODWORD(a14), LODWORD(v35)),
            v51,
            a13,
            a13,
            0,
            a15,
            v33,
            0);
  }
  else
  {
    v40 = 0;
  }
LABEL_26:

  return v40;
}

- (id)mergeLeftAppClipCode:(id)a3 withRightAppClipCode:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 version];
  if (v9 == [v8 version])
  {
    if ([v7 rightRXID] || objc_msgSend(v8, "leftRXID"))
    {
      if (a5)
      {
        unint64_t v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = MEMORY[0x263EFFA78];
        uint64_t v12 = 5;
        uint64_t v13 = 444;
LABEL_8:
        objc_msgSend(v10, "crxf_errorWithCode:file:line:userInfo:", v12, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v13, v11);
        v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v15 = [v7 lensType];
      if (v15 == [v8 lensType])
      {
        v16 = objc_msgSend(MEMORY[0x263EFF8F8], "crxu_randomDataWithLength:", 10);
        v61 = [CRXFAppClipCode alloc];
        uint64_t v59 = [v7 version];
        uint64_t v62 = [v7 lensType];
        unsigned int v60 = [v7 cylLeftSignFlipped];
        unsigned int v58 = [v7 cylRightSignFlipped];
        uint64_t v57 = [v7 leftRXID];
        uint64_t v56 = [v7 leftCalibrationRXID];
        [v7 leftDisplaySphere];
        int v55 = v17;
        [v7 leftDisplayCylinder];
        int v54 = v18;
        [v7 leftCalibrationSphere];
        int v20 = v19;
        [v7 leftCalibrationCylinder];
        int v22 = v21;
        [v7 leftAddVR];
        int v24 = v23;
        uint64_t v53 = [v7 leftAxisID];
        uint64_t v52 = [v7 leftDisplayAxis];
        uint64_t v25 = [v7 leftCalibrationAxis];
        uint64_t v26 = [v7 leftClamping];
        uint64_t v27 = [v8 rightRXID];
        uint64_t v28 = [v8 rightCalibrationRXID];
        [v8 rightDisplaySphere];
        int v30 = v29;
        [v8 rightDisplayCylinder];
        int v32 = v31;
        [v7 rightCalibrationSphere];
        int v34 = v33;
        [v7 rightCalibrationCylinder];
        unsigned int v36 = v35;
        [v8 rightAddVR];
        unsigned int v38 = v37;
        uint64_t v39 = [v8 rightAxisID];
        uint64_t v40 = [v8 rightDisplayAxis];
        uint64_t v41 = [v8 rightCalibrationAxis];
        uint64_t v42 = [v8 rightClamping];
        LODWORD(v44) = v54;
        LODWORD(v43) = v55;
        LODWORD(v45) = v20;
        LODWORD(v46) = v22;
        LODWORD(v47) = v24;
        LODWORD(v48) = v30;
        LODWORD(v49) = v32;
        LODWORD(v50) = v34;
        v14 = -[CRXFAppClipCode initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:randomBits:](v61, "initWithVersion:lensType:cylLeftSignFlipped:cylRightSignFlipped:leftRXID:leftCalibrationRXID:leftDisplaySphere:leftDisplayCylinder:leftCalibrationSphere:leftCalibrationCylinder:leftAddVR:leftAxisID:leftDisplayAxis:leftCalibrationAxis:leftClamping:rightRXID:rightCalibrationRXID:rightDisplaySphere:rightDisplayCylinder:rightCalibrationSphere:rightCalibrationCylinder:rightAddVR:rightAxisID:rightDisplayAxis:rightCalibrationAxis:rightClamping:identifyingColor:secret:randomBits:", v59, v62, v60, v58, v57, v56, v43, v44, v45, v46, v47, v48, v49,
                v50,
                v53,
                v52,
                v25,
                v26,
                v27,
                v28,
                __PAIR64__(v38, v36),
                v39,
                v40,
                v41,
                v42,
                0,
                v16,
                0);

        goto LABEL_14;
      }
      if (a5)
      {
        unint64_t v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = MEMORY[0x263EFFA78];
        uint64_t v12 = 31;
        uint64_t v13 = 451;
        goto LABEL_8;
      }
    }
  }
  else if (a5)
  {
    unint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = MEMORY[0x263EFFA78];
    uint64_t v12 = 22;
    uint64_t v13 = 437;
    goto LABEL_8;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (float)vRxFromAddValue:(float)a3 andSphereValue:(float)a4
{
  return roundf((float)((float)(a3 + a4) / (float)((float)((float)(a3 + a4) * 0.003) + 1.0)) * 4.0) * 0.25;
}

- (unint64_t)decodeCalibrationRXID:(unint64_t *)a3 calibrationSphere:(float *)a4 calibrationCylinder:(float *)a5 calibrationAxis:(unint64_t *)a6 addVR:(float *)a7 clampingStatus:(unint64_t *)a8 displaySphere:(float *)a9 displayCylinder:(float *)a10 displayAxis:(unint64_t *)a11 fromRXID:(unint64_t)a12 RXOffsetID:(unint64_t)a13 cylinderSignFlipped:(BOOL)a14 axisID:(unint64_t)a15 allowUnsupportedRX:(BOOL)a16
{
  v16 = a7;
  int v17 = a6;
  int v18 = a5;
  int v19 = a4;
  int v20 = a3;
  unint64_t v22 = a15;
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v50 = 0;
  unint64_t v51 = a12;
  if (a8) {
    *a8 = 0;
  }
  BOOL v23 = a14;
  if (a12 == 1023)
  {
    if (a16)
    {
      unint64_t v24 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:]();
      }
      unint64_t v24 = 8;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calib"
                           "rationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID"
                           ":cylinderSignFlipped:axisID:allowUnsupportedRX:]";
      __int16 v53 = 1024;
      int v54 = 543;
      _os_log_impl(&dword_24C484000, log, OS_LOG_TYPE_INFO, "%s @%d: rxID is out of range, allow unsupported RX", buf, 0x12u);
    }
    goto LABEL_19;
  }
  int v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibra"
                         "tionAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cyl"
                         "inderSignFlipped:axisID:allowUnsupportedRX:]";
    __int16 v53 = 1024;
    int v54 = 545;
    _os_log_impl(&dword_24C484000, v30, OS_LOG_TYPE_INFO, "%s @%d: rxID is in range", buf, 0x12u);
  }
  unint64_t v24 = [(CRXFAppClipCodeTranscoder *)self lookUpSphereValue:(char *)&v50 + 4 cylinderValue:&v50 forRXID:a12];
  BOOL v23 = a14;
  v16 = a7;
  int v17 = a6;
  unint64_t v22 = a15;
  int v18 = a5;
  int v19 = a4;
  int v20 = a3;
  if (!v24)
  {
    float v33 = *((float *)&v50 + 1);
    float v34 = *(float *)&v50;
    if (a13)
    {
      float v35 = (float)a13 * 0.25;
      *(float *)&double v31 = v35;
      LODWORD(v32) = HIDWORD(v50);
      [(CRXFAppClipCodeTranscoder *)self vRxFromAddValue:v31 andSphereValue:v32];
      float v37 = v36;
      *((float *)&v50 + 1) = v36;
      LODWORD(v38) = v50;
      *(float *)&double v39 = v37;
      if ([(CRXFAppClipCodeTranscoder *)self lookupBestValidRXID:&v51 andSphere:(char *)&v50 + 4 matchingCylinder:v38 nearSphere:v39])
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:]();
        }
        unint64_t v24 = 32;
LABEL_30:
        double v44 = a8;
        if (!a8) {
          goto LABEL_33;
        }
        uint64_t v45 = 3;
        goto LABEL_32;
      }
      if (v37 == *((float *)&v50 + 1))
      {
        unint64_t v24 = 0;
      }
      else
      {
        double v47 = self->_log;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:c"
                               "alibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RX"
                               "OffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:]";
          __int16 v53 = 1024;
          int v54 = 574;
          _os_log_impl(&dword_24C484000, v47, OS_LOG_TYPE_INFO, "%s @%d: AddVR clamped successfully!", buf, 0x12u);
        }
        unint64_t v24 = 0;
        double v44 = a8;
        if (a8)
        {
          uint64_t v45 = 2;
LABEL_32:
          *double v44 = v45;
        }
      }
    }
    else
    {
      LODWORD(v32) = HIDWORD(v50);
      LODWORD(v31) = v50;
      if ([(CRXFAppClipCodeTranscoder *)self lookupBestValidRXID:&v51 andSphere:(char *)&v50 + 4 matchingCylinder:v31 nearSphere:v32])
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:]();
        }
        float v35 = 0.0;
        unint64_t v24 = 8;
        goto LABEL_30;
      }
      if (v33 == *((float *)&v50 + 1))
      {
        unint64_t v24 = 0;
        float v35 = 0.0;
      }
      else
      {
        double v48 = self->_log;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[CRXFAppClipCodeTranscoder decodeCalibrationRXID:calibrationSphere:calibrationCylinder:c"
                               "alibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RX"
                               "OffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:]";
          __int16 v53 = 1024;
          int v54 = 591;
          _os_log_impl(&dword_24C484000, v48, OS_LOG_TYPE_INFO, "%s @%d: RX clamped successfully!", buf, 0x12u);
        }
        unint64_t v24 = 0;
        float v35 = 0.0;
        double v44 = a8;
        if (a8)
        {
          uint64_t v45 = 1;
          goto LABEL_32;
        }
      }
    }
LABEL_33:
    if (a14)
    {
      float v43 = -v34;
      float v33 = v33 + v34;
      *(void *)buf = 0;
      unint64_t v41 = [(CRXFAppClipCodeTranscoder *)self lookUpAxisValue:buf forAxisID:a15];
      float v34 = -v34;
      if (!v41) {
        goto LABEL_24;
      }
    }
    else
    {
      *(void *)buf = 0;
      unint64_t v41 = [(CRXFAppClipCodeTranscoder *)self lookUpAxisValue:buf forAxisID:a15];
      if (!v41) {
        goto LABEL_37;
      }
    }
LABEL_21:
    unint64_t v42 = 0;
    v24 |= v41;
    if (!v20) {
      goto LABEL_39;
    }
LABEL_38:
    *int v20 = v51;
    goto LABEL_39;
  }
LABEL_19:
  *(void *)buf = 0;
  unint64_t v41 = [(CRXFAppClipCodeTranscoder *)self lookUpAxisValue:buf forAxisID:v22];
  if (v41)
  {
    float v33 = 0.0;
    float v34 = 0.0;
    float v35 = 0.0;
    goto LABEL_21;
  }
  float v35 = 0.0;
  float v43 = 0.0;
  float v33 = 0.0;
  float v34 = 0.0;
  if (!v23)
  {
LABEL_37:
    unint64_t v42 = *(void *)buf;
    if (!v20) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_24:
  unint64_t v42 = (*(void *)buf + 90) % 0xB4uLL;
  float v34 = v43;
  if (v20) {
    goto LABEL_38;
  }
LABEL_39:
  if (v19) {
    *int v19 = *((float *)&v50 + 1);
  }
  if (v18) {
    *(_DWORD *)int v18 = v50;
  }
  if (a9) {
    *a9 = v33;
  }
  if (a10) {
    *a10 = v34;
  }
  if (a11) {
    *a11 = v42;
  }
  if (v17) {
    *int v17 = *(void *)buf;
  }
  if (v16) {
    float *v16 = v35;
  }
  return v24;
}

- (unint64_t)encodeSphere:(float)a3 cylinder:(float)a4 axis:(unint64_t)a5 toRXID:(unint64_t *)a6 axisID:(unint64_t *)a7
{
  if (!a6)
  {
    unint64_t v11 = 0;
    if (!a7) {
      return v11;
    }
    goto LABEL_7;
  }
  unint64_t v11 = -[CRXFAppClipCodeTranscoder lookUpRXID:forSphereValue:cylinderValue:](self, "lookUpRXID:forSphereValue:cylinderValue:", a6);
  if (v11) {
    *a6 = 0;
  }
  if (a7)
  {
LABEL_7:
    unint64_t v12 = [(CRXFAppClipCodeTranscoder *)self lookUpAxisID:a7 forAxisValue:a5];
    if (v12)
    {
      *a7 = 0;
      v11 |= v12;
    }
  }
  return v11;
}

- (id)errorForStatus:(unint64_t)a3 leftLens:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  id v8 = kCRXFErrorKeyLeftLensDecodeStatus;
  if (!v4) {
    id v8 = kCRXFErrorKeyRightLensDecodeStatus;
  }
  [v6 setObject:v7 forKeyedSubscript:*v8];

  uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 708, v6);

  return v9;
}

- (unint64_t)lookUpAxisID:(unint64_t *)a3 forAxisValue:(unint64_t)a4
{
  if (a4 > 0xB4) {
    return 4;
  }
  unint64_t result = 0;
  unint64_t v5 = (a4 + 2) >> 2;
  if (a4 >= 0xB2) {
    v5 -= 45;
  }
  *a3 = rxid_axis_table[v5];
  return result;
}

- (unint64_t)lookUpAxisValue:(unint64_t *)a3 forAxisID:(unint64_t)a4
{
  int __key = a4;
  unint64_t v5 = (int *)bsearch(&__key, &rxid_axis_lookup_table, 0x2DuLL, 8uLL, (int (__cdecl *)(const void *, const void *))compare_ints);
  if (!v5) {
    return 16;
  }
  id v6 = v5;
  unint64_t result = 0;
  *a3 = 4 * v6[1];
  return result;
}

- (unint64_t)lookUpRXID:(unint64_t *)a3 forSphereValue:(float)a4 cylinderValue:(float)a5
{
  int __key = (int)(float)(a4 * 100.0);
  id v7 = (int *)bsearch(&__key, &rxid_sph_table, 0x49uLL, 0xCuLL, (int (__cdecl *)(const void *, const void *))compare_ints);
  if (!v7) {
    return 1;
  }
  int __key = (int)(float)(a5 * 100.0);
  id v8 = (int *)bsearch(&__key, (char *)&rxid_cyl_table + 8 * v7[1], v7[2], 8uLL, (int (__cdecl *)(const void *, const void *))compare_ints);
  if (!v8) {
    return 2;
  }
  uint64_t v9 = v8;
  unint64_t result = 0;
  *a3 = v9[1];
  return result;
}

- (unint64_t)lookUpSphereValue:(float *)a3 cylinderValue:(float *)a4 forRXID:(unint64_t)a5
{
  int __key = a5;
  id v7 = (int *)bsearch(&__key, &rxid_sph_cyl_lookup_table, 0x451uLL, 0xCuLL, (int (__cdecl *)(const void *, const void *))compare_ints);
  if (!v7) {
    return 8;
  }
  id v8 = v7;
  unint64_t result = 0;
  *a3 = (float)v8[1] / 100.0;
  *a4 = (float)v8[2] / 100.0;
  return result;
}

- (unint64_t)lookupBestValidRXID:(unint64_t *)a3 andSphere:(float *)a4 matchingCylinder:(float)a5 nearSphere:(float)a6
{
  uint64_t v6 = 0;
  int v7 = (int)(float)(a6 * 100.0);
  while (valid_cyl_sph_range_table[v6] != (int)(float)(a5 * 100.0))
  {
    v6 += 3;
    if (v6 == 57) {
      return 2;
    }
  }
  uint64_t v9 = &valid_cyl_sph_range_table[v6];
  int v10 = valid_cyl_sph_range_table[v6 + 1];
  if (v10 <= v7)
  {
    int v10 = v9[2];
    if (v10 >= v7) {
      int v10 = (int)(float)(a6 * 100.0);
    }
  }
  *a4 = (float)v10 / 100.0;
  return -[CRXFAppClipCodeTranscoder lookUpRXID:forSphereValue:cylinderValue:](self, "lookUpRXID:forSphereValue:cylinderValue:", a3);
}

- (id)decodeAppClipCodeV1FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  v45[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 bitCount] == 128)
  {
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v9 = [MEMORY[0x263EFF990] dataWithLength:10];
    if ([v8 skipBits:4]
      && [v8 skipBits:12]
      && [v8 readUInteger:&v43 bitWidth:10]
      && [v8 readUInteger:&v41 bitWidth:6]
      && [v8 readUInteger:&v42 bitWidth:10]
      && [v8 readUInteger:&v40 bitWidth:6]
      && ([v8 readData:v9 bitWidth:80] & 1) != 0)
    {
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      if (v43)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = 0;
        unint64_t v10 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:0 calibrationSphere:0 calibrationCylinder:0 calibrationAxis:0 addVR:0 clampingStatus:&v39 displaySphere:(char *)&v37 + 4 displayCylinder:&v37 displayAxis:&v35 fromRXID:v43 RXOffsetID:0 cylinderSignFlipped:v18 axisID:v41 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v10 = 0;
      }
      if (v42)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = 0;
        unint64_t v12 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:0 calibrationSphere:0 calibrationCylinder:0 calibrationAxis:0 addVR:0 clampingStatus:&v38 displaySphere:(char *)&v36 + 4 displayCylinder:&v36 displayAxis:&v34 fromRXID:v42 RXOffsetID:0 cylinderSignFlipped:v18 axisID:v40 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV1FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_2652E17E8;
        int v30 = HIDWORD(v37);
        int v31 = v37;
        uint64_t v22 = v43;
        uint64_t v23 = v41;
        uint64_t v24 = v35;
        uint64_t v25 = v39;
        int v32 = HIDWORD(v36);
        int v33 = v36;
        uint64_t v26 = v42;
        uint64_t v27 = v40;
        uint64_t v28 = v34;
        uint64_t v29 = v38;
        id v21 = v9;
        unint64_t v11 = +[CRXFAppClipCode appClipCodeWithBlock:v20];
        v14 = v21;
        goto LABEL_29;
      }
      if (a5)
      {
        uint64_t v13 = (void *)MEMORY[0x263F087E8];
        v44[0] = @"leftLensDecodeStatus";
        v14 = [NSNumber numberWithUnsignedInteger:v10];
        v45[0] = v14;
        v44[1] = @"rightLensDecodeStatus";
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:v12];
        v45[1] = v15;
        v16 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 896, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        unint64_t v11 = 0;
LABEL_29:

        goto LABEL_24;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 845, MEMORY[0x263EFFA78]);
      unint64_t v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    unint64_t v11 = 0;
    goto LABEL_24;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 829, MEMORY[0x263EFFA78]);
    unint64_t v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unint64_t v11 = 0;
  }
LABEL_25:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV1FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  [v11 setVersion:1];
  [v11 setLeftRXID:*(void *)(a1 + 40)];
  [v11 setLeftCalibrationRXID:*(void *)(a1 + 40)];
  LODWORD(v3) = *(_DWORD *)(a1 + 104);
  [v11 setLeftDisplaySphere:v3];
  LODWORD(v4) = *(_DWORD *)(a1 + 108);
  [v11 setLeftDisplayCylinder:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 104);
  [v11 setLeftCalibrationSphere:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 108);
  [v11 setLeftCalibrationCylinder:v6];
  [v11 setLeftAxisID:*(void *)(a1 + 48)];
  [v11 setLeftDisplayAxis:*(void *)(a1 + 56)];
  [v11 setLeftCalibrationAxis:*(void *)(a1 + 56)];
  [v11 setLeftClamping:*(void *)(a1 + 64)];
  [v11 setRightRXID:*(void *)(a1 + 72)];
  [v11 setRightCalibrationRXID:*(void *)(a1 + 72)];
  LODWORD(v7) = *(_DWORD *)(a1 + 112);
  [v11 setRightDisplaySphere:v7];
  LODWORD(v8) = *(_DWORD *)(a1 + 116);
  [v11 setRightDisplayCylinder:v8];
  LODWORD(v9) = *(_DWORD *)(a1 + 112);
  [v11 setRightCalibrationSphere:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 116);
  [v11 setRightCalibrationCylinder:v10];
  [v11 setRightAxisID:*(void *)(a1 + 80)];
  [v11 setRightDisplayAxis:*(void *)(a1 + 88)];
  [v11 setRightCalibrationAxis:*(void *)(a1 + 88)];
  [v11 setRightClamping:*(void *)(a1 + 96)];
  [v11 setSecret:*(void *)(a1 + 32)];
}

- (BOOL)encodeAppClipCodeV1:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "version"), 4)
    && [v8 skipBits:12]
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "leftRXID"), 10)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "leftAxisID"), 6)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "rightRXID"), 10)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "rightAxisID"), 6))
  {
    double v9 = [v7 secret];
    char v10 = [v8 writeData:v9 bitWidth:80];
  }
  else
  {
    char v10 = 0;
  }
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 4, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 938, MEMORY[0x263EFFA78]);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)decodeAppClipCodeV2FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  v52[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 bitCount] == 128)
  {
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    double v9 = [MEMORY[0x263EFF990] dataWithLength:10];
    if ([v8 skipBits:4]
      && [v8 skipBits:2]
      && [v8 readUInteger:&v46 bitWidth:4]
      && [v8 readUInteger:&v45 bitWidth:6]
      && [v8 readUInteger:&v50 bitWidth:10]
      && [v8 readUInteger:&v48 bitWidth:6]
      && [v8 readUInteger:&v49 bitWidth:10]
      && [v8 readUInteger:&v47 bitWidth:6]
      && ([v8 readData:v9 bitWidth:80] & 1) != 0)
    {
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v40 = 0;
      int v39 = 0;
      int v38 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      if (v50)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = 0;
        unint64_t v10 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:&v44 calibrationSphere:0 calibrationCylinder:0 calibrationAxis:0 addVR:0 clampingStatus:&v42 displaySphere:(char *)&v40 + 4 displayCylinder:&v40 displayAxis:&v37 fromRXID:v50 RXOffsetID:0 cylinderSignFlipped:v18 axisID:v48 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v10 = 0;
      }
      if (v49)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = 0;
        unint64_t v12 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:&v43 calibrationSphere:0 calibrationCylinder:0 calibrationAxis:0 addVR:0 clampingStatus:&v41 displaySphere:&v39 displayCylinder:&v38 displayAxis:&v36 fromRXID:v49 RXOffsetID:0 cylinderSignFlipped:v18 axisID:v47 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV2FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_2652E1810;
        int v32 = HIDWORD(v40);
        int v33 = v40;
        uint64_t v22 = v50;
        uint64_t v23 = v48;
        uint64_t v24 = v37;
        uint64_t v25 = v42;
        int v34 = v39;
        int v35 = v38;
        uint64_t v26 = v49;
        uint64_t v27 = v47;
        uint64_t v28 = v36;
        uint64_t v29 = v41;
        uint64_t v30 = v46;
        id v21 = v9;
        uint64_t v31 = v45;
        id v11 = +[CRXFAppClipCode appClipCodeWithBlock:v20];
        v14 = v21;
        goto LABEL_31;
      }
      if (a5)
      {
        uint64_t v13 = (void *)MEMORY[0x263F087E8];
        v51[0] = @"leftLensDecodeStatus";
        v14 = [NSNumber numberWithUnsignedInteger:v10];
        v52[0] = v14;
        v51[1] = @"rightLensDecodeStatus";
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:v12];
        v52[1] = v15;
        v16 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1042, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        id v11 = 0;
LABEL_31:

        goto LABEL_26;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 990, MEMORY[0x263EFFA78]);
      id v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

      goto LABEL_27;
    }
    id v11 = 0;
    goto LABEL_26;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 970, MEMORY[0x263EFFA78]);
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_27:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV2FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  [v11 setVersion:2];
  [v11 setLeftRXID:*(void *)(a1 + 40)];
  [v11 setLeftCalibrationRXID:*(void *)(a1 + 40)];
  LODWORD(v3) = *(_DWORD *)(a1 + 120);
  [v11 setLeftDisplaySphere:v3];
  LODWORD(v4) = *(_DWORD *)(a1 + 124);
  [v11 setLeftDisplayCylinder:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 120);
  [v11 setLeftCalibrationSphere:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 124);
  [v11 setLeftCalibrationCylinder:v6];
  [v11 setLeftAxisID:*(void *)(a1 + 48)];
  [v11 setLeftDisplayAxis:*(void *)(a1 + 56)];
  [v11 setLeftCalibrationAxis:*(void *)(a1 + 56)];
  [v11 setLeftClamping:*(void *)(a1 + 64)];
  [v11 setRightRXID:*(void *)(a1 + 72)];
  [v11 setRightCalibrationRXID:*(void *)(a1 + 72)];
  LODWORD(v7) = *(_DWORD *)(a1 + 128);
  [v11 setRightDisplaySphere:v7];
  LODWORD(v8) = *(_DWORD *)(a1 + 132);
  [v11 setRightDisplayCylinder:v8];
  LODWORD(v9) = *(_DWORD *)(a1 + 128);
  [v11 setRightCalibrationSphere:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 132);
  [v11 setRightCalibrationCylinder:v10];
  [v11 setRightAxisID:*(void *)(a1 + 80)];
  [v11 setRightDisplayAxis:*(void *)(a1 + 88)];
  [v11 setRightCalibrationAxis:*(void *)(a1 + 88)];
  [v11 setRightClamping:*(void *)(a1 + 96)];
  [v11 setIdentifyingColor:*(void *)(a1 + 104)];
  [v11 setSecret:*(void *)(a1 + 32)];
  [v11 setRandomBits:*(void *)(a1 + 112)];
}

- (BOOL)encodeAppClipCodeV2:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "version"), 4)
    && [v8 skipBits:2]
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "identifyingColor"), 4)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "randomBits"), 6)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "leftRXID"), 10)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "leftAxisID"), 6)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "rightRXID"), 10)
    && objc_msgSend(v8, "writeUInteger:bitWidth:", objc_msgSend(v7, "rightAxisID"), 6))
  {
    double v9 = [v7 secret];
    char v10 = [v8 writeData:v9 bitWidth:80];
  }
  else
  {
    char v10 = 0;
  }
  if (a5 && (v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 4, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1088, MEMORY[0x263EFFA78]);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)decodeAppClipCodeV3FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  v71[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 bitCount] == 128)
  {
    __int16 v69 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v61 = 0;
    uint64_t v62 = 0;
    double v9 = [MEMORY[0x263EFF990] dataWithLength:10];
    if ([v8 skipBits:4]
      && [v8 readUInteger:&v64 bitWidth:4]
      && [v8 readBool:(char *)&v69 + 1]
      && [v8 readBool:&v69]
      && [v8 readUInteger:&v63 bitWidth:2]
      && [v8 readUInteger:&v62 bitWidth:2]
      && [v8 readUInteger:&v61 bitWidth:2]
      && [v8 readUInteger:&v68 bitWidth:10]
      && [v8 readUInteger:&v66 bitWidth:6]
      && [v8 readUInteger:&v67 bitWidth:10]
      && [v8 readUInteger:&v65 bitWidth:6]
      && ([v8 readData:v9 bitWidth:80] & 1) != 0)
    {
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      uint64_t v55 = 0;
      uint64_t v56 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v48 = 0;
      if (v68)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = HIBYTE(v69);
        unint64_t v10 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:&v49 calibrationSphere:(char *)&v56 + 4 calibrationCylinder:&v56 calibrationAxis:&v51 addVR:(char *)&v54 + 4 clampingStatus:&v60 displaySphere:(char *)&v58 + 4 displayCylinder:&v58 displayAxis:&v53 fromRXID:v68 RXOffsetID:v63 cylinderSignFlipped:v18 axisID:v66 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v10 = 0;
      }
      if (v67)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = v69;
        unint64_t v12 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:&v48 calibrationSphere:(char *)&v55 + 4 calibrationCylinder:&v55 calibrationAxis:&v50 addVR:&v54 clampingStatus:&v59 displaySphere:(char *)&v57 + 4 displayCylinder:&v57 displayAxis:&v52 fromRXID:v67 RXOffsetID:v62 cylinderSignFlipped:v18 axisID:v65 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV3FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_2652E1838;
        char v46 = HIBYTE(v69);
        char v47 = v69;
        uint64_t v22 = v68;
        uint64_t v23 = v49;
        int v36 = HIDWORD(v58);
        int v37 = v58;
        int v38 = HIDWORD(v56);
        int v39 = v56;
        uint64_t v24 = v66;
        uint64_t v25 = v53;
        uint64_t v26 = v51;
        uint64_t v27 = v60;
        uint64_t v28 = v67;
        uint64_t v29 = v48;
        int v40 = HIDWORD(v54);
        int v41 = HIDWORD(v57);
        int v42 = v57;
        int v43 = HIDWORD(v55);
        int v44 = v55;
        int v45 = v54;
        uint64_t v30 = v65;
        uint64_t v31 = v52;
        uint64_t v32 = v50;
        uint64_t v33 = v59;
        uint64_t v34 = v64;
        id v21 = v9;
        uint64_t v35 = v61;
        id v11 = +[CRXFAppClipCode appClipCodeWithBlock:v20];
        v14 = v21;
        goto LABEL_34;
      }
      if (a5)
      {
        uint64_t v13 = (void *)MEMORY[0x263F087E8];
        v70[0] = @"leftLensDecodeStatus";
        v14 = [NSNumber numberWithUnsignedInteger:v10];
        v71[0] = v14;
        v70[1] = @"rightLensDecodeStatus";
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:v12];
        v71[1] = v15;
        v16 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1200, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        id v11 = 0;
LABEL_34:

        goto LABEL_29;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1144, MEMORY[0x263EFFA78]);
      id v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    id v11 = 0;
    goto LABEL_29;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1119, MEMORY[0x263EFFA78]);
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_30:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV3FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 setVersion:3];
  [v13 setCylLeftSignFlipped:*(unsigned __int8 *)(a1 + 192)];
  [v13 setCylRightSignFlipped:*(unsigned __int8 *)(a1 + 193)];
  [v13 setLeftRXID:*(void *)(a1 + 40)];
  [v13 setLeftCalibrationRXID:*(void *)(a1 + 48)];
  LODWORD(v3) = *(_DWORD *)(a1 + 152);
  [v13 setLeftDisplaySphere:v3];
  LODWORD(v4) = *(_DWORD *)(a1 + 156);
  [v13 setLeftDisplayCylinder:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 160);
  [v13 setLeftCalibrationSphere:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 164);
  [v13 setLeftCalibrationCylinder:v6];
  LODWORD(v7) = *(_DWORD *)(a1 + 168);
  [v13 setLeftAddVR:v7];
  [v13 setLeftAxisID:*(void *)(a1 + 56)];
  [v13 setLeftDisplayAxis:*(void *)(a1 + 64)];
  [v13 setLeftCalibrationAxis:*(void *)(a1 + 72)];
  [v13 setLeftClamping:*(void *)(a1 + 80)];
  [v13 setRightRXID:*(void *)(a1 + 88)];
  [v13 setRightCalibrationRXID:*(void *)(a1 + 96)];
  LODWORD(v8) = *(_DWORD *)(a1 + 172);
  [v13 setRightDisplaySphere:v8];
  LODWORD(v9) = *(_DWORD *)(a1 + 176);
  [v13 setRightDisplayCylinder:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 180);
  [v13 setRightCalibrationSphere:v10];
  LODWORD(v11) = *(_DWORD *)(a1 + 184);
  [v13 setRightCalibrationCylinder:v11];
  LODWORD(v12) = *(_DWORD *)(a1 + 188);
  [v13 setRightAddVR:v12];
  [v13 setRightAxisID:*(void *)(a1 + 104)];
  [v13 setRightDisplayAxis:*(void *)(a1 + 112)];
  [v13 setRightCalibrationAxis:*(void *)(a1 + 120)];
  [v13 setRightClamping:*(void *)(a1 + 128)];
  [v13 setIdentifyingColor:*(void *)(a1 + 136)];
  [v13 setSecret:*(void *)(a1 + 32)];
  [v13 setRandomBits:*(void *)(a1 + 144)];
}

- (BOOL)encodeAppClipCodeV3:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  [v8 leftAddVR];
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v19))
  {
    if (!a5) {
      goto LABEL_23;
    }
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = MEMORY[0x263EFFA78];
    uint64_t v15 = 15;
    uint64_t v16 = 1247;
LABEL_22:
    objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", v15, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v16, v14);
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  [v8 rightAddVR];
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v18))
  {
    if (!a5) {
      goto LABEL_23;
    }
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = MEMORY[0x263EFFA78];
    uint64_t v15 = 16;
    uint64_t v16 = 1257;
    goto LABEL_22;
  }
  if (!objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "version"), 4)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "identifyingColor"), 4)
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylLeftSignFlipped"))
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylRightSignFlipped"))
    || ![v9 writeUInteger:v19 bitWidth:2]
    || ![v9 writeUInteger:v18 bitWidth:2]
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "randomBits"), 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftRXID"), 10)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftAxisID"), 6)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightRXID"), 10)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightAxisID"), 6)
    || ([v8 secret],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v9 writeData:v10 bitWidth:80],
        v10,
        (v11 & 1) == 0))
  {
    if (a5)
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = MEMORY[0x263EFFA78];
      uint64_t v15 = 4;
      uint64_t v16 = 1275;
      goto LABEL_22;
    }
LABEL_23:
    BOOL v12 = 0;
    goto LABEL_24;
  }
  BOOL v12 = 1;
LABEL_24:

  return v12;
}

- (id)decodeAppClipCodeV4FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  v71[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 bitCount] == 128)
  {
    __int16 v69 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v62 = 0;
    id v9 = [MEMORY[0x263EFF990] dataWithLength:10];
    uint64_t v61 = 0;
    if ([v8 skipBits:4]
      && [v8 readUInteger:&v64 bitWidth:4]
      && [v8 readBool:(char *)&v69 + 1]
      && [v8 readBool:&v69]
      && [v8 readUInteger:&v63 bitWidth:2]
      && [v8 readUInteger:&v62 bitWidth:2]
      && [v8 readUInteger:&v61 bitWidth:2]
      && [v8 readUInteger:&v68 bitWidth:10]
      && [v8 readUInteger:&v66 bitWidth:6]
      && [v8 readUInteger:&v67 bitWidth:10]
      && [v8 readUInteger:&v65 bitWidth:6]
      && ([v8 readData:v9 bitWidth:80] & 1) != 0)
    {
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      uint64_t v55 = 0;
      uint64_t v56 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v48 = 0;
      if (v68)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = HIBYTE(v69);
        unint64_t v10 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:&v49 calibrationSphere:(char *)&v56 + 4 calibrationCylinder:&v56 calibrationAxis:&v51 addVR:(char *)&v54 + 4 clampingStatus:&v60 displaySphere:(char *)&v58 + 4 displayCylinder:&v58 displayAxis:&v53 fromRXID:v68 RXOffsetID:v63 cylinderSignFlipped:v18 axisID:v66 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v10 = 0;
      }
      if (v67)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = v69;
        unint64_t v12 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:&v48 calibrationSphere:(char *)&v55 + 4 calibrationCylinder:&v55 calibrationAxis:&v50 addVR:&v54 clampingStatus:&v59 displaySphere:(char *)&v57 + 4 displayCylinder:&v57 displayAxis:&v52 fromRXID:v67 RXOffsetID:v62 cylinderSignFlipped:v18 axisID:v65 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV4FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_2652E1838;
        char v46 = HIBYTE(v69);
        char v47 = v69;
        uint64_t v22 = v61;
        uint64_t v23 = v68;
        int v36 = HIDWORD(v58);
        int v37 = v58;
        int v38 = HIDWORD(v56);
        int v39 = v56;
        uint64_t v24 = v49;
        uint64_t v25 = v66;
        uint64_t v26 = v53;
        uint64_t v27 = v51;
        uint64_t v28 = v60;
        uint64_t v29 = v67;
        int v40 = HIDWORD(v54);
        int v41 = HIDWORD(v57);
        int v42 = v57;
        int v43 = HIDWORD(v55);
        int v44 = v55;
        int v45 = v54;
        uint64_t v30 = v48;
        uint64_t v31 = v65;
        uint64_t v32 = v52;
        uint64_t v33 = v50;
        uint64_t v34 = v59;
        uint64_t v35 = v64;
        id v21 = v9;
        char v11 = +[CRXFAppClipCode appClipCodeWithBlock:v20];
        uint64_t v14 = v21;
        goto LABEL_34;
      }
      if (a5)
      {
        id v13 = (void *)MEMORY[0x263F087E8];
        v70[0] = @"leftLensDecodeStatus";
        uint64_t v14 = [NSNumber numberWithUnsignedInteger:v10];
        v71[0] = v14;
        v70[1] = @"rightLensDecodeStatus";
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:v12];
        v71[1] = v15;
        uint64_t v16 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1371, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        char v11 = 0;
LABEL_34:

        goto LABEL_29;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1315, MEMORY[0x263EFFA78]);
      char v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    char v11 = 0;
    goto LABEL_29;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1290, MEMORY[0x263EFFA78]);
    char v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = 0;
  }
LABEL_30:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV4FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 setVersion:4];
  [v13 setLensType:*(void *)(a1 + 40)];
  [v13 setCylLeftSignFlipped:*(unsigned __int8 *)(a1 + 192)];
  [v13 setCylRightSignFlipped:*(unsigned __int8 *)(a1 + 193)];
  [v13 setLeftRXID:*(void *)(a1 + 48)];
  [v13 setLeftCalibrationRXID:*(void *)(a1 + 56)];
  LODWORD(v3) = *(_DWORD *)(a1 + 152);
  [v13 setLeftDisplaySphere:v3];
  LODWORD(v4) = *(_DWORD *)(a1 + 156);
  [v13 setLeftDisplayCylinder:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 160);
  [v13 setLeftCalibrationSphere:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 164);
  [v13 setLeftCalibrationCylinder:v6];
  LODWORD(v7) = *(_DWORD *)(a1 + 168);
  [v13 setLeftAddVR:v7];
  [v13 setLeftAxisID:*(void *)(a1 + 64)];
  [v13 setLeftDisplayAxis:*(void *)(a1 + 72)];
  [v13 setLeftCalibrationAxis:*(void *)(a1 + 80)];
  [v13 setLeftClamping:*(void *)(a1 + 88)];
  [v13 setRightRXID:*(void *)(a1 + 96)];
  [v13 setRightCalibrationRXID:*(void *)(a1 + 104)];
  LODWORD(v8) = *(_DWORD *)(a1 + 172);
  [v13 setRightDisplaySphere:v8];
  LODWORD(v9) = *(_DWORD *)(a1 + 176);
  [v13 setRightDisplayCylinder:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 180);
  [v13 setRightCalibrationSphere:v10];
  LODWORD(v11) = *(_DWORD *)(a1 + 184);
  [v13 setRightCalibrationCylinder:v11];
  LODWORD(v12) = *(_DWORD *)(a1 + 188);
  [v13 setRightAddVR:v12];
  [v13 setRightAxisID:*(void *)(a1 + 112)];
  [v13 setRightDisplayAxis:*(void *)(a1 + 120)];
  [v13 setRightCalibrationAxis:*(void *)(a1 + 128)];
  [v13 setRightClamping:*(void *)(a1 + 136)];
  [v13 setIdentifyingColor:*(void *)(a1 + 144)];
  [v13 setSecret:*(void *)(a1 + 32)];
}

- (BOOL)encodeAppClipCodeV4:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  [v8 leftAddVR];
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v19))
  {
    if (!a5) {
      goto LABEL_23;
    }
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = MEMORY[0x263EFFA78];
    uint64_t v15 = 15;
    uint64_t v16 = 1418;
LABEL_22:
    objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", v15, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v16, v14);
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  [v8 rightAddVR];
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v18))
  {
    if (!a5) {
      goto LABEL_23;
    }
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = MEMORY[0x263EFFA78];
    uint64_t v15 = 16;
    uint64_t v16 = 1428;
    goto LABEL_22;
  }
  if (!objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "version"), 4)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "identifyingColor"), 4)
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylLeftSignFlipped"))
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylRightSignFlipped"))
    || ![v9 writeUInteger:v19 bitWidth:2]
    || ![v9 writeUInteger:v18 bitWidth:2]
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "lensType"), 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftRXID"), 10)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftAxisID"), 6)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightRXID"), 10)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightAxisID"), 6)
    || ([v8 secret],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v9 writeData:v10 bitWidth:80],
        v10,
        (v11 & 1) == 0))
  {
    if (a5)
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = MEMORY[0x263EFFA78];
      uint64_t v15 = 4;
      uint64_t v16 = 1446;
      goto LABEL_22;
    }
LABEL_23:
    BOOL v12 = 0;
    goto LABEL_24;
  }
  BOOL v12 = 1;
LABEL_24:

  return v12;
}

- (id)decodeAppClipCodeV5FromBuffer:(id)a3 allowUnsupportedRX:(BOOL)a4 error:(id *)a5
{
  v71[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 bitCount] == 128)
  {
    __int16 v69 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v62 = 0;
    id v9 = [MEMORY[0x263EFF990] dataWithLength:10];
    uint64_t v61 = 0;
    if ([v8 skipBits:4]
      && [v8 readBool:(char *)&v69 + 1]
      && [v8 readBool:&v69]
      && [v8 readUInteger:&v64 bitWidth:2]
      && [v8 readUInteger:&v63 bitWidth:2]
      && [v8 readUInteger:&v61 bitWidth:2]
      && [v8 readUInteger:&v68 bitWidth:11]
      && [v8 readUInteger:&v66 bitWidth:6]
      && [v8 readUInteger:&v67 bitWidth:11]
      && [v8 readUInteger:&v65 bitWidth:6]
      && [v8 readUInteger:&v62 bitWidth:2]
      && ([v8 readData:v9 bitWidth:80] & 1) != 0)
    {
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      uint64_t v55 = 0;
      uint64_t v56 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v48 = 0;
      if (v68)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = HIBYTE(v69);
        unint64_t v10 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:&v49 calibrationSphere:(char *)&v56 + 4 calibrationCylinder:&v56 calibrationAxis:&v51 addVR:(char *)&v54 + 4 clampingStatus:&v60 displaySphere:(char *)&v58 + 4 displayCylinder:&v58 displayAxis:&v53 fromRXID:v68 RXOffsetID:v64 cylinderSignFlipped:v18 axisID:v66 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v10 = 0;
      }
      if (v67)
      {
        LOBYTE(v19) = a4;
        LOBYTE(v18) = v69;
        unint64_t v12 = [(CRXFAppClipCodeTranscoder *)self decodeCalibrationRXID:&v48 calibrationSphere:(char *)&v55 + 4 calibrationCylinder:&v55 calibrationAxis:&v50 addVR:&v54 clampingStatus:&v59 displaySphere:(char *)&v57 + 4 displayCylinder:&v57 displayAxis:&v52 fromRXID:v67 RXOffsetID:v63 cylinderSignFlipped:v18 axisID:v65 allowUnsupportedRX:v19];
      }
      else
      {
        unint64_t v12 = 0;
      }
      if (!(v10 | v12))
      {
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV5FromBuffer_allowUnsupportedRX_error___block_invoke;
        v20[3] = &unk_2652E1838;
        char v46 = HIBYTE(v69);
        char v47 = v69;
        uint64_t v22 = v61;
        uint64_t v23 = v68;
        int v36 = HIDWORD(v58);
        int v37 = v58;
        int v38 = HIDWORD(v56);
        int v39 = v56;
        uint64_t v24 = v49;
        uint64_t v25 = v66;
        uint64_t v26 = v53;
        uint64_t v27 = v51;
        uint64_t v28 = v60;
        uint64_t v29 = v67;
        int v40 = HIDWORD(v54);
        int v41 = HIDWORD(v57);
        int v42 = v57;
        int v43 = HIDWORD(v55);
        int v44 = v55;
        int v45 = v54;
        uint64_t v30 = v48;
        uint64_t v31 = v65;
        uint64_t v32 = v52;
        uint64_t v33 = v50;
        uint64_t v34 = v59;
        id v21 = v9;
        uint64_t v35 = v62;
        char v11 = +[CRXFAppClipCode appClipCodeWithBlock:v20];
        uint64_t v14 = v21;
        goto LABEL_34;
      }
      if (a5)
      {
        id v13 = (void *)MEMORY[0x263F087E8];
        v70[0] = @"leftLensDecodeStatus";
        uint64_t v14 = [NSNumber numberWithUnsignedInteger:v10];
        v71[0] = v14;
        v70[1] = @"rightLensDecodeStatus";
        uint64_t v15 = [NSNumber numberWithUnsignedInteger:v12];
        v71[1] = v15;
        uint64_t v16 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
        objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", 5, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1561, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        char v11 = 0;
LABEL_34:

        goto LABEL_29;
      }
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1505, MEMORY[0x263EFFA78]);
      char v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

      goto LABEL_30;
    }
    char v11 = 0;
    goto LABEL_29;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "crxf_errorWithCode:file:line:userInfo:", 3, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", 1479, MEMORY[0x263EFFA78]);
    char v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = 0;
  }
LABEL_30:

  return v11;
}

void __84__CRXFAppClipCodeTranscoder_decodeAppClipCodeV5FromBuffer_allowUnsupportedRX_error___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 setVersion:5];
  [v13 setLensType:*(void *)(a1 + 40)];
  [v13 setCylLeftSignFlipped:*(unsigned __int8 *)(a1 + 192)];
  [v13 setCylRightSignFlipped:*(unsigned __int8 *)(a1 + 193)];
  [v13 setLeftRXID:*(void *)(a1 + 48)];
  [v13 setLeftCalibrationRXID:*(void *)(a1 + 56)];
  LODWORD(v3) = *(_DWORD *)(a1 + 152);
  [v13 setLeftDisplaySphere:v3];
  LODWORD(v4) = *(_DWORD *)(a1 + 156);
  [v13 setLeftDisplayCylinder:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 160);
  [v13 setLeftCalibrationSphere:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 164);
  [v13 setLeftCalibrationCylinder:v6];
  LODWORD(v7) = *(_DWORD *)(a1 + 168);
  [v13 setLeftAddVR:v7];
  [v13 setLeftAxisID:*(void *)(a1 + 64)];
  [v13 setLeftDisplayAxis:*(void *)(a1 + 72)];
  [v13 setLeftCalibrationAxis:*(void *)(a1 + 80)];
  [v13 setLeftClamping:*(void *)(a1 + 88)];
  [v13 setRightRXID:*(void *)(a1 + 96)];
  [v13 setRightCalibrationRXID:*(void *)(a1 + 104)];
  LODWORD(v8) = *(_DWORD *)(a1 + 172);
  [v13 setRightDisplaySphere:v8];
  LODWORD(v9) = *(_DWORD *)(a1 + 176);
  [v13 setRightDisplayCylinder:v9];
  LODWORD(v10) = *(_DWORD *)(a1 + 180);
  [v13 setRightCalibrationSphere:v10];
  LODWORD(v11) = *(_DWORD *)(a1 + 184);
  [v13 setRightCalibrationCylinder:v11];
  LODWORD(v12) = *(_DWORD *)(a1 + 188);
  [v13 setRightAddVR:v12];
  [v13 setRightAxisID:*(void *)(a1 + 112)];
  [v13 setRightDisplayAxis:*(void *)(a1 + 120)];
  [v13 setRightCalibrationAxis:*(void *)(a1 + 128)];
  [v13 setRightClamping:*(void *)(a1 + 136)];
  [v13 setIdentifyingColor:0];
  [v13 setSecret:*(void *)(a1 + 32)];
  [v13 setRandomBits:*(void *)(a1 + 144)];
}

- (BOOL)encodeAppClipCodeV5:(id)a3 toBuffer:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  [v8 leftAddVR];
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v19))
  {
    if (!a5) {
      goto LABEL_23;
    }
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = MEMORY[0x263EFFA78];
    uint64_t v15 = 15;
    uint64_t v16 = 1610;
LABEL_22:
    objc_msgSend(v13, "crxf_errorWithCode:file:line:userInfo:", v15, "/Library/Caches/com.apple.xbs/Sources/CorePrescription/CorePrescriptionCommon/CRXFAppClipCodeTranscoder.m", v16, v14);
    BOOL v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  [v8 rightAddVR];
  if (!-[CRXFAppClipCodeTranscoder getIndexForQuarterDiopterValue:minValue:maxValue:index:](self, "getIndexForQuarterDiopterValue:minValue:maxValue:index:", &v18))
  {
    if (!a5) {
      goto LABEL_23;
    }
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = MEMORY[0x263EFFA78];
    uint64_t v15 = 16;
    uint64_t v16 = 1620;
    goto LABEL_22;
  }
  if (!objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "version"), 4)
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylLeftSignFlipped"))
    || !objc_msgSend(v9, "writeBool:", objc_msgSend(v8, "cylRightSignFlipped"))
    || ![v9 writeUInteger:v19 bitWidth:2]
    || ![v9 writeUInteger:v18 bitWidth:2]
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "lensType"), 2)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftRXID"), 11)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "leftAxisID"), 6)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightRXID"), 11)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "rightAxisID"), 6)
    || !objc_msgSend(v9, "writeUInteger:bitWidth:", objc_msgSend(v8, "randomBits"), 2)
    || ([v8 secret],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v9 writeData:v10 bitWidth:80],
        v10,
        (v11 & 1) == 0))
  {
    if (a5)
    {
      id v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = MEMORY[0x263EFFA78];
      uint64_t v15 = 4;
      uint64_t v16 = 1638;
      goto LABEL_22;
    }
LABEL_23:
    BOOL v12 = 0;
    goto LABEL_24;
  }
  BOOL v12 = 1;
LABEL_24:

  return v12;
}

- (BOOL)getQuarterDiopterValueForIndex:(unint64_t)a3 minValue:(float)a4 maxValue:(float)a5 value:(float *)a6
{
  float v6 = a4 + (float)((float)a3 * 0.25);
  if (v6 <= a5) {
    *a6 = v6;
  }
  return v6 <= a5;
}

- (BOOL)getIndexForQuarterDiopterValue:(float)a3 minValue:(float)a4 maxValue:(float)a5 index:(unint64_t *)a6
{
  BOOL v6 = a3 <= a5 && a3 >= a4;
  if (v6) {
    *a6 = ((unint64_t)(float)((float)(a3 - a4) * 100.0) + 24) / 0x19;
  }
  return v6;
}

- (id)derivePayloadWithSoftwareBitsZeroedFromPayload:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  double v5 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeFromData:v4 allowUnsupportedRX:0 error:&v8];
  if (v5) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)derivePayloadWithLensTypeZeroed:(id)a3 ifLensTypeIs:(unint64_t)a4
{
  id v17 = 0;
  id v6 = [(CRXFAppClipCodeTranscoder *)self decodeAppClipCodeFromData:a3 allowUnsupportedRX:0 error:&v17];
  id v7 = v17;
  if (v6 && [v6 lensType] == a4)
  {
    uint64_t v8 = [[CRXFAppClipCodeBuilder alloc] initWithAppClipCode:v6];
    [(CRXFAppClipCodeBuilder *)v8 setLensType:0];
    id v9 = [(CRXFAppClipCodeBuilder *)v8 build];

    unint64_t v10 = -[CRXFAppClipCodeTranscoder payloadLengthForAppClipCodeVersion:](self, "payloadLengthForAppClipCodeVersion:", [v9 version]);
    char v11 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v10];
    id v16 = v7;
    BOOL v12 = [(CRXFAppClipCodeTranscoder *)self encodeAppClipCode:v9 toData:v11 error:&v16];
    id v13 = v16;

    uint64_t v14 = 0;
    if (v12)
    {
      uint64_t v14 = [MEMORY[0x263EFF8F8] dataWithData:v11];
    }

    id v6 = v9;
    id v7 = v13;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AxisToIDMap, 0);
  objc_storeStrong((id *)&self->_IDToAxisMap, 0);
  objc_storeStrong((id *)&self->_RXToIDMap, 0);
  objc_storeStrong((id *)&self->_IDToRXMap, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24C484000, v0, v1, "%s @%d: rxID is out of range", v2, v3, v4, v5, v6);
}

- (void)decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24C484000, v0, v1, "%s @%d: Failed to find any valid Rx without VRX", v2, v3, v4, v5, v6);
}

- (void)decodeCalibrationRXID:calibrationSphere:calibrationCylinder:calibrationAxis:addVR:clampingStatus:displaySphere:displayCylinder:displayAxis:fromRXID:RXOffsetID:cylinderSignFlipped:axisID:allowUnsupportedRX:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_24C484000, v0, v1, "%s @%d: Failed to find any valid VRx", v2, v3, v4, v5, v6);
}

@end