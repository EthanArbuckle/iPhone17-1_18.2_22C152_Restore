@interface BMUserProofingEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10;
- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12;
- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceRegion:(id)a8 proofingDecision:(id)a9;
- (BMUserProofingEvent)initWithCoder:(id)a3;
- (BMUserProofingEvent)initWithProto:(id)a3;
- (BMUserProofingEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)age;
- (NSString)deviceLanguage;
- (NSString)ethnicity;
- (NSString)gender;
- (NSString)gestureAssessment;
- (NSString)issuer;
- (NSString)livenessAssessment;
- (NSString)proofingDecision;
- (NSString)skinTone;
- (double)absoluteTimestamp;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)hash;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMUserProofingEvent

- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceRegion:(id)a8 proofingDecision:(id)a9
{
  return [(BMUserProofingEvent *)self initWithAbsoluteTimestamp:a4 age:a5 gender:a6 skinTone:a7 ethnicity:a8 deviceLanguage:a9 proofingDecision:a3 issuer:0 livenessAssessment:0 gestureAssessment:0];
}

- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10
{
  return [(BMUserProofingEvent *)self initWithAbsoluteTimestamp:a4 age:a5 gender:a6 skinTone:a7 ethnicity:a8 deviceLanguage:a9 proofingDecision:a3 issuer:a10 livenessAssessment:0 gestureAssessment:0];
}

- (BMUserProofingEvent)initWithAbsoluteTimestamp:(double)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12
{
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  v49.receiver = self;
  v49.super_class = (Class)BMUserProofingEvent;
  v28 = [(BMUserProofingEvent *)&v49 init];
  v29 = v28;
  if (v28)
  {
    v28->_absoluteTimestamp = a3;
    uint64_t v30 = [v19 copy];
    age = v29->_age;
    v29->_age = (NSString *)v30;

    uint64_t v32 = [v20 copy];
    gender = v29->_gender;
    v29->_gender = (NSString *)v32;

    uint64_t v34 = [v21 copy];
    skinTone = v29->_skinTone;
    v29->_skinTone = (NSString *)v34;

    uint64_t v36 = [v22 copy];
    ethnicity = v29->_ethnicity;
    v29->_ethnicity = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    deviceLanguage = v29->_deviceLanguage;
    v29->_deviceLanguage = (NSString *)v38;

    uint64_t v40 = [v24 copy];
    proofingDecision = v29->_proofingDecision;
    v29->_proofingDecision = (NSString *)v40;

    uint64_t v42 = [v25 copy];
    issuer = v29->_issuer;
    v29->_issuer = (NSString *)v42;

    uint64_t v44 = [v26 copy];
    livenessAssessment = v29->_livenessAssessment;
    v29->_livenessAssessment = (NSString *)v44;

    uint64_t v46 = [v27 copy];
    gestureAssessment = v29->_gestureAssessment;
    v29->_gestureAssessment = (NSString *)v46;
  }
  return v29;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[BMUserProofingEvent eventWithData:dataVersion:](a4, v8);
    }

    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BMUserProofingEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"user_proofing"];
}

- (BMUserProofingEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  id v6 = [v4 robustDecodeObjectOfClass:objc_opt_class() forKey:@"user_proofing" withCoder:v5 expectNonNull:1 errorDomain:@"BMStreamErrorDomain" errorCode:2 logHandle:0];

  if (v6)
  {
    self = [(BMUserProofingEvent *)self initWithProtoData:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  v2 = [(BMUserProofingEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMUserProofingEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMUserProofingEvent initWithProto:](v5);
      }
      goto LABEL_17;
    }
    id v5 = v4;
    [v5 absoluteTimestamp];
    if (v6 != 0.0)
    {
      uint64_t v7 = [v5 age];
      if (v7)
      {
        v8 = (void *)v7;
        uint64_t v9 = [v5 gender];
        if (v9)
        {
          v10 = (void *)v9;
          uint64_t v11 = [v5 deviceLanguage];
          if (v11)
          {
            v12 = (void *)v11;
            v13 = [v5 proofingDecision];

            if (v13)
            {
              [v5 absoluteTimestamp];
              double v15 = v14;
              id v27 = [v5 age];
              id v26 = [v5 gender];
              v16 = [v5 skinTone];
              v17 = [v5 ethnicity];
              v18 = [v5 deviceLanguage];
              id v19 = [v5 proofingDecision];
              id v20 = [v5 issuer];
              id v21 = [v5 livenessAssessment];
              id v22 = [v5 gestureAssessment];
              self = [(BMUserProofingEvent *)self initWithAbsoluteTimestamp:v27 age:v26 gender:v16 skinTone:v17 ethnicity:v18 deviceLanguage:v19 proofingDecision:v15 issuer:v20 livenessAssessment:v21 gestureAssessment:v22];

              id v23 = self;
LABEL_18:

              goto LABEL_19;
            }
            goto LABEL_14;
          }
        }
      }
    }
LABEL_14:
    id v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BMUserProofingEvent initWithProto:](v24);
    }

LABEL_17:
    id v23 = 0;
    goto LABEL_18;
  }
  id v23 = 0;
LABEL_19:

  return v23;
}

- (BMUserProofingEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBUserProofingEvent alloc] initWithData:v4];

    self = [(BMUserProofingEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_alloc_init(BMPBUserProofingEvent);
  [(BMPBUserProofingEvent *)v3 setAbsoluteTimestamp:self->_absoluteTimestamp];
  [(BMPBUserProofingEvent *)v3 setAge:self->_age];
  [(BMPBUserProofingEvent *)v3 setGender:self->_gender];
  [(BMPBUserProofingEvent *)v3 setSkinTone:self->_skinTone];
  [(BMPBUserProofingEvent *)v3 setEthnicity:self->_ethnicity];
  [(BMPBUserProofingEvent *)v3 setDeviceLanguage:self->_deviceLanguage];
  [(BMPBUserProofingEvent *)v3 setProofingDecision:self->_proofingDecision];
  [(BMPBUserProofingEvent *)v3 setIssuer:self->_issuer];
  [(BMPBUserProofingEvent *)v3 setLivenessAssessment:self->_livenessAssessment];
  [(BMPBUserProofingEvent *)v3 setGestureAssessment:self->_gestureAssessment];

  return v3;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_age hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_gender hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_deviceLanguage hash] ^ v4;
  NSUInteger v8 = v7 ^ [(NSString *)self->_proofingDecision hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    double absoluteTimestamp = self->_absoluteTimestamp;
    [v7 absoluteTimestamp];
    if (absoluteTimestamp != v9)
    {
      char v14 = 0;
LABEL_93:

      goto LABEL_94;
    }
    age = self->_age;
    uint64_t v11 = age;
    if (!age)
    {
      uint64_t v12 = [v7 age];
      if (!v12)
      {
        v71 = 0;
        int v13 = 0;
        goto LABEL_12;
      }
      v71 = (void *)v12;
      uint64_t v11 = self->_age;
    }
    v3 = [v7 age];
    if (![(NSString *)v11 isEqualToString:v3])
    {

      char v14 = 0;
      goto LABEL_91;
    }
    int v13 = 1;
LABEL_12:
    gender = self->_gender;
    v16 = gender;
    if (!gender)
    {
      uint64_t v17 = [v7 gender];
      if (!v17)
      {
        int v70 = v13;
        v69 = 0;
        int v18 = 0;
        goto LABEL_19;
      }
      v69 = (void *)v17;
      v16 = self->_gender;
    }
    uint64_t v4 = [v7 gender];
    if (![(NSString *)v16 isEqualToString:v4])
    {
      char v14 = 0;
      goto LABEL_88;
    }
    int v70 = v13;
    int v18 = 1;
LABEL_19:
    skinTone = self->_skinTone;
    id v20 = skinTone;
    if (!skinTone)
    {
      uint64_t v21 = [v7 skinTone];
      if (!v21)
      {
        int v67 = v18;
        int v68 = 0;
        v65 = 0;
        goto LABEL_26;
      }
      v65 = (void *)v21;
      id v20 = self->_skinTone;
    }
    uint64_t v22 = [v7 skinTone];
    id v23 = v20;
    id v24 = (void *)v22;
    if (![(NSString *)v23 isEqualToString:v22])
    {
      char v14 = 0;
      goto LABEL_84;
    }
    v64 = v24;
    int v67 = v18;
    int v68 = 1;
LABEL_26:
    ethnicity = self->_ethnicity;
    id v26 = ethnicity;
    if (!ethnicity)
    {
      uint64_t v27 = [v7 ethnicity];
      if (!v27)
      {
        v60 = 0;
        int v63 = 0;
        goto LABEL_33;
      }
      v60 = (void *)v27;
      id v26 = self->_ethnicity;
    }
    v66 = [v7 ethnicity];
    if (!-[NSString isEqualToString:](v26, "isEqualToString:"))
    {
      char v14 = 0;
      int v18 = v67;
      goto LABEL_78;
    }
    int v63 = 1;
LABEL_33:
    deviceLanguage = self->_deviceLanguage;
    v62 = deviceLanguage;
    if (!deviceLanguage)
    {
      uint64_t v29 = [v7 deviceLanguage];
      if (!v29)
      {
        v56 = 0;
        int v59 = 0;
        goto LABEL_40;
      }
      v56 = (void *)v29;
      deviceLanguage = self->_deviceLanguage;
    }
    v61 = [v7 deviceLanguage];
    if (!-[NSString isEqualToString:](deviceLanguage, "isEqualToString:"))
    {
      char v14 = 0;
      int v18 = v67;
      goto LABEL_75;
    }
    int v59 = 1;
LABEL_40:
    proofingDecision = self->_proofingDecision;
    v58 = proofingDecision;
    if (!proofingDecision)
    {
      uint64_t v31 = [v7 proofingDecision];
      if (!v31)
      {
        v52 = 0;
        int v55 = 0;
        goto LABEL_47;
      }
      v52 = (void *)v31;
      proofingDecision = self->_proofingDecision;
    }
    v57 = [v7 proofingDecision];
    if (!-[NSString isEqualToString:](proofingDecision, "isEqualToString:"))
    {
      char v14 = 0;
      int v18 = v67;
      goto LABEL_72;
    }
    int v55 = 1;
LABEL_47:
    issuer = self->_issuer;
    v54 = issuer;
    if (!issuer)
    {
      uint64_t v33 = [v7 issuer];
      if (!v33)
      {
        v48 = 0;
        int v51 = 0;
        goto LABEL_54;
      }
      v48 = (void *)v33;
      issuer = self->_issuer;
    }
    v53 = [v7 issuer];
    if (!-[NSString isEqualToString:](issuer, "isEqualToString:"))
    {
      char v14 = 0;
      int v18 = v67;
      goto LABEL_69;
    }
    int v51 = 1;
LABEL_54:
    livenessAssessment = self->_livenessAssessment;
    v50 = livenessAssessment;
    if (!livenessAssessment)
    {
      uint64_t v35 = [v7 livenessAssessment];
      if (!v35)
      {
        v45 = 0;
        int v47 = 0;
        goto LABEL_61;
      }
      v45 = (void *)v35;
      livenessAssessment = self->_livenessAssessment;
    }
    objc_super v49 = [v7 livenessAssessment];
    if (!-[NSString isEqualToString:](livenessAssessment, "isEqualToString:"))
    {
      char v14 = 0;
      int v18 = v67;
      goto LABEL_66;
    }
    int v47 = 1;
LABEL_61:
    gestureAssessment = self->_gestureAssessment;
    v37 = gestureAssessment;
    if (!gestureAssessment)
    {
      uint64_t v38 = [v7 gestureAssessment];
      if (!v38)
      {
        uint64_t v42 = 0;
        char v14 = 1;
        int v18 = v67;
LABEL_109:

        if ((v47 & 1) == 0)
        {
LABEL_67:
          if (v50)
          {
            if (!v51) {
              goto LABEL_70;
            }
          }
          else
          {

            if ((v51 & 1) == 0)
            {
LABEL_70:
              if (v54)
              {
                if (!v55) {
                  goto LABEL_73;
                }
              }
              else
              {

                if ((v55 & 1) == 0)
                {
LABEL_73:
                  if (v58)
                  {
                    if (!v59) {
                      goto LABEL_76;
                    }
                  }
                  else
                  {

                    if ((v59 & 1) == 0)
                    {
LABEL_76:
                      if (v62)
                      {
                        if (!v63)
                        {
LABEL_79:
                          if (ethnicity)
                          {
                            if (!v68)
                            {
LABEL_85:
                              if (skinTone)
                              {
                                if (v18)
                                {
LABEL_87:
                                  int v13 = v70;
LABEL_88:

                                  if (gender) {
                                    goto LABEL_89;
                                  }
                                  goto LABEL_97;
                                }
                              }
                              else
                              {

                                if (v18) {
                                  goto LABEL_87;
                                }
                              }
                              int v13 = v70;
                              if (gender)
                              {
LABEL_89:
                                if (!v13) {
                                  goto LABEL_91;
                                }
                                goto LABEL_90;
                              }
LABEL_97:

                              if ((v13 & 1) == 0)
                              {
LABEL_91:
                                if (!age) {

                                }
                                goto LABEL_93;
                              }
LABEL_90:

                              goto LABEL_91;
                            }
                          }
                          else
                          {

                            if ((v68 & 1) == 0) {
                              goto LABEL_85;
                            }
                          }
                          id v24 = v64;
LABEL_84:

                          goto LABEL_85;
                        }
                      }
                      else
                      {

                        if ((v63 & 1) == 0) {
                          goto LABEL_79;
                        }
                      }
LABEL_78:

                      goto LABEL_79;
                    }
                  }
LABEL_75:

                  goto LABEL_76;
                }
              }
LABEL_72:

              goto LABEL_73;
            }
          }
LABEL_69:

          goto LABEL_70;
        }
LABEL_66:

        goto LABEL_67;
      }
      uint64_t v43 = v38;
      v37 = self->_gestureAssessment;
    }
    v39 = v37;
    objc_msgSend(v7, "gestureAssessment", v43, v45);
    uint64_t v40 = v46 = gestureAssessment;
    char v14 = [(NSString *)v39 isEqualToString:v40];

    if (v46)
    {
      int v18 = v67;
      if (!v47) {
        goto LABEL_67;
      }
      goto LABEL_66;
    }
    int v18 = v67;
    uint64_t v42 = v44;
    goto LABEL_109;
  }
  char v14 = 0;
LABEL_94:

  return v14;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)age
{
  return self->_age;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSString)skinTone
{
  return self->_skinTone;
}

- (NSString)ethnicity
{
  return self->_ethnicity;
}

- (NSString)deviceLanguage
{
  return self->_deviceLanguage;
}

- (NSString)proofingDecision
{
  return self->_proofingDecision;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)livenessAssessment
{
  return self->_livenessAssessment;
}

- (NSString)gestureAssessment
{
  return self->_gestureAssessment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureAssessment, 0);
  objc_storeStrong((id *)&self->_livenessAssessment, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_proofingDecision, 0);
  objc_storeStrong((id *)&self->_deviceLanguage, 0);
  objc_storeStrong((id *)&self->_ethnicity, 0);
  objc_storeStrong((id *)&self->_skinTone, 0);
  objc_storeStrong((id *)&self->_gender, 0);

  objc_storeStrong((id *)&self->_age, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMUserProofingEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
}

- (void)initWithProto:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMUserProofingEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)initWithProto:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMUserProofingEvent: tried to initialize with a non-BMPBInferredModeEvent proto", v1, 2u);
}

@end