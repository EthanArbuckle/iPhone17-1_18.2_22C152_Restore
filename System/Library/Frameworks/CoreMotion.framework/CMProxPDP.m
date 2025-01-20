@interface CMProxPDP
+ (BOOL)supportsSecureCoding;
- (CMProxPDP)initWithCoder:(id)a3;
- (CMProxPDP)initWithTimestamp:(double)a3 intensity:(float)a4 intensityCalDelta:(float)a5 intensityBaselineDelta:(float)a6 ambient:(float)a7 pocketProbability:(float)a8 baselineConfidence:(float)a9 rxNtcC:(float)a10 scanFlags:(BOOL)a11 pocketFlag:(BOOL)a12;
- (NSNumber)ambient;
- (NSNumber)baselineConfidence;
- (NSNumber)intensity;
- (NSNumber)intensityBaselineDelta;
- (NSNumber)intensityCalDelta;
- (NSNumber)pocketFlag;
- (NSNumber)pocketProbability;
- (NSNumber)rxNtcC;
- (NSNumber)scanFlags;
- (NSNumber)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMProxPDP

- (CMProxPDP)initWithTimestamp:(double)a3 intensity:(float)a4 intensityCalDelta:(float)a5 intensityBaselineDelta:(float)a6 ambient:(float)a7 pocketProbability:(float)a8 baselineConfidence:(float)a9 rxNtcC:(float)a10 scanFlags:(BOOL)a11 pocketFlag:(BOOL)a12
{
  BOOL v12 = a12;
  BOOL v13 = a11;
  v59.receiver = self;
  v59.super_class = (Class)CMProxPDP;
  v22 = [(CMProxPDP *)&v59 init];
  if (v22)
  {
    id v23 = objc_alloc(NSNumber);
    v22->fTimestamp = (NSNumber *)objc_msgSend_initWithDouble_(v23, v24, v25, a3);
    id v26 = objc_alloc(NSNumber);
    *(float *)&double v27 = a4;
    v22->fIntensity = (NSNumber *)objc_msgSend_initWithFloat_(v26, v28, v29, v27);
    id v30 = objc_alloc(NSNumber);
    *(float *)&double v31 = a5;
    v22->fIntensityCalDelta = (NSNumber *)objc_msgSend_initWithFloat_(v30, v32, v33, v31);
    id v34 = objc_alloc(NSNumber);
    *(float *)&double v35 = a6;
    v22->fIntensityBaselineDelta = (NSNumber *)objc_msgSend_initWithFloat_(v34, v36, v37, v35);
    id v38 = objc_alloc(NSNumber);
    *(float *)&double v39 = a7;
    v22->fAmbient = (NSNumber *)objc_msgSend_initWithFloat_(v38, v40, v41, v39);
    id v42 = objc_alloc(NSNumber);
    *(float *)&double v43 = a8;
    v22->fPocketProbability = (NSNumber *)objc_msgSend_initWithFloat_(v42, v44, v45, v43);
    id v46 = objc_alloc(NSNumber);
    *(float *)&double v47 = a9;
    v22->fBaselineConfidence = (NSNumber *)objc_msgSend_initWithFloat_(v46, v48, v49, v47);
    id v50 = objc_alloc(NSNumber);
    *(float *)&double v51 = a10;
    v22->fRxNtcC = (NSNumber *)objc_msgSend_initWithFloat_(v50, v52, v53, v51);
    id v54 = objc_alloc(NSNumber);
    v22->fScanFlags = (NSNumber *)objc_msgSend_initWithBool_(v54, v55, v13);
    id v56 = objc_alloc(NSNumber);
    v22->fPocketFlag = (NSNumber *)objc_msgSend_initWithBool_(v56, v57, v12);
  }
  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMProxPDP)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)CMProxPDP;
  v4 = [(CMProxPDP *)&v26 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->fTimestamp = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"kCMProxPDPTimestamp");
    uint64_t v7 = objc_opt_class();
    v4->fIntensity = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"kCMProxPDPIntensity");
    uint64_t v9 = objc_opt_class();
    v4->fIntensityCalDelta = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, @"kCMProxPDPIntensityCalDelta");
    uint64_t v11 = objc_opt_class();
    v4->fIntensityBaselineDelta = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"kCMProxPDPIntensityBaselineDelta");
    uint64_t v13 = objc_opt_class();
    v4->fAmbient = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"kCMProxPDPAmbient");
    uint64_t v15 = objc_opt_class();
    v4->fPocketProbability = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"kCMProxPDPPocketProbability");
    uint64_t v17 = objc_opt_class();
    v4->fBaselineConfidence = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v18, v17, @"kCMProxPDPBaselineConfidence");
    uint64_t v19 = objc_opt_class();
    v4->fRxNtcC = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, @"kCMProxPDPRxNtcC");
    uint64_t v21 = objc_opt_class();
    v4->fScanFlags = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v22, v21, @"kCMProxPDPScanFlags");
    uint64_t v23 = objc_opt_class();
    v4->fPocketFlag = (NSNumber *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, @"kCMProxPDPPocketFlag");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->fTimestamp, @"kCMProxPDPTimestamp");
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->fIntensity, @"kCMProxPDPIntensity");
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->fIntensityCalDelta, @"kCMProxPDPIntensityCalDelta");
  objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)self->fIntensityBaselineDelta, @"kCMProxPDPIntensityBaselineDelta");
  objc_msgSend_encodeObject_forKey_(a3, v8, (uint64_t)self->fAmbient, @"kCMProxPDPAmbient");
  objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)self->fPocketProbability, @"kCMProxPDPPocketProbability");
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->fBaselineConfidence, @"kCMProxPDPBaselineConfidence");
  objc_msgSend_encodeObject_forKey_(a3, v11, (uint64_t)self->fRxNtcC, @"kCMProxPDPRxNtcC");
  objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)self->fScanFlags, @"kCMProxPDPScanFlags");
  fPocketFlag = self->fPocketFlag;

  objc_msgSend_encodeObject_forKey_(a3, v13, (uint64_t)fPocketFlag, @"kCMProxPDPPocketFlag");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  BOOL v12 = objc_msgSend_init(v7, v8, v9);
  if (v12)
  {
    v12[1] = objc_msgSend_copy(self->fTimestamp, v10, v11);
    v12[2] = objc_msgSend_copy(self->fIntensity, v13, v14);
    v12[3] = objc_msgSend_copy(self->fIntensityCalDelta, v15, v16);
    v12[4] = objc_msgSend_copy(self->fIntensityBaselineDelta, v17, v18);
    v12[5] = objc_msgSend_copy(self->fAmbient, v19, v20);
    v12[6] = objc_msgSend_copy(self->fPocketProbability, v21, v22);
    v12[7] = objc_msgSend_copy(self->fBaselineConfidence, v23, v24);
    v12[8] = objc_msgSend_copy(self->fRxNtcC, v25, v26);
    v12[9] = objc_msgSend_copy(self->fScanFlags, v27, v28);
    v12[10] = objc_msgSend_copy(self->fPocketFlag, v29, v30);
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMProxPDP;
  [(CMProxPDP *)&v3 dealloc];
}

- (NSNumber)timestamp
{
  return self->fTimestamp;
}

- (NSNumber)intensity
{
  return self->fIntensity;
}

- (NSNumber)intensityCalDelta
{
  return self->fIntensityCalDelta;
}

- (NSNumber)intensityBaselineDelta
{
  return self->fIntensityBaselineDelta;
}

- (NSNumber)ambient
{
  return self->fAmbient;
}

- (NSNumber)pocketProbability
{
  return self->fPocketProbability;
}

- (NSNumber)baselineConfidence
{
  return self->fBaselineConfidence;
}

- (NSNumber)rxNtcC
{
  return self->fRxNtcC;
}

- (NSNumber)scanFlags
{
  return self->fScanFlags;
}

- (NSNumber)pocketFlag
{
  return self->fPocketFlag;
}

- (id)description
{
  uint64_t v37 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v3);
  uint64_t v6 = objc_msgSend_timestamp(self, v4, v5);
  uint64_t v9 = objc_msgSend_intensity(self, v7, v8);
  uint64_t v12 = objc_msgSend_intensityCalDelta(self, v10, v11);
  uint64_t v15 = objc_msgSend_intensityBaselineDelta(self, v13, v14);
  uint64_t v18 = objc_msgSend_ambient(self, v16, v17);
  uint64_t v21 = objc_msgSend_pocketProbability(self, v19, v20);
  uint64_t v24 = objc_msgSend_baselineConfidence(self, v22, v23);
  uint64_t v27 = objc_msgSend_rxNtcC(self, v25, v26);
  uint64_t v30 = objc_msgSend_scanFlags(self, v28, v29);
  uint64_t v33 = objc_msgSend_pocketFlag(self, v31, v32);
  return (id)objc_msgSend_stringWithFormat_(v37, v34, @"%@, <timestamp %@, intensity %@, intensityCalDelta %@, intensityBaselineDelta %@, ambient %@, pocketProbability %@, baselineConfidence %@, rxNtcC %@, scanFlags %@, pocketFlag %@>", v36, v6, v9, v12, v15, v18, v21, v24, v27, v30, v33);
}

@end