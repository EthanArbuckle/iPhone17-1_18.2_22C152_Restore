@interface BMWalletPaymentsCommerceUserProofingResult
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13;
- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13 facVersion:(id)a14 facePoseVersion:(id)a15 padtoolVersion:(id)a16 prdVersion:(id)a17;
- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13 facVersion:(id)a14 facePoseVersion:(id)a15 padtoolVersion:(id)a16 prdVersion:(id)a17 didStepUp:(id)a18 passiveGestureAssessment:(id)a19 passiveLivenessAssessment:(id)a20 passiveLivenessFacVersion:(id)a21 passiveLivenessFacePoseVersion:(id)a22 passiveLivenessPadtoolVersion:(id)a23 passiveLivenessPrdVersion:(id)a24;
- (BMWalletPaymentsCommerceUserProofingResult)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)didStepUp;
- (BOOL)hasDidStepUp;
- (BOOL)isEqual:(id)a3;
- (NSArray)axSettings;
- (NSDate)absoluteTimestamp;
- (NSString)age;
- (NSString)description;
- (NSString)deviceLanguage;
- (NSString)ethnicity;
- (NSString)facVersion;
- (NSString)facePoseVersion;
- (NSString)gender;
- (NSString)gestureAssessment;
- (NSString)issuer;
- (NSString)livenessAssessment;
- (NSString)padtoolVersion;
- (NSString)passiveGestureAssessment;
- (NSString)passiveLivenessAssessment;
- (NSString)passiveLivenessFacVersion;
- (NSString)passiveLivenessFacePoseVersion;
- (NSString)passiveLivenessPadtoolVersion;
- (NSString)passiveLivenessPrdVersion;
- (NSString)prdVersion;
- (NSString)proofingDecision;
- (NSString)skinTone;
- (id)_axSettingsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasDidStepUp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMWalletPaymentsCommerceUserProofingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passiveLivenessPrdVersion, 0);
  objc_storeStrong((id *)&self->_passiveLivenessPadtoolVersion, 0);
  objc_storeStrong((id *)&self->_passiveLivenessFacePoseVersion, 0);
  objc_storeStrong((id *)&self->_passiveLivenessFacVersion, 0);
  objc_storeStrong((id *)&self->_passiveLivenessAssessment, 0);
  objc_storeStrong((id *)&self->_passiveGestureAssessment, 0);
  objc_storeStrong((id *)&self->_prdVersion, 0);
  objc_storeStrong((id *)&self->_padtoolVersion, 0);
  objc_storeStrong((id *)&self->_facePoseVersion, 0);
  objc_storeStrong((id *)&self->_facVersion, 0);
  objc_storeStrong((id *)&self->_axSettings, 0);
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

- (NSString)passiveLivenessPrdVersion
{
  return self->_passiveLivenessPrdVersion;
}

- (NSString)passiveLivenessPadtoolVersion
{
  return self->_passiveLivenessPadtoolVersion;
}

- (NSString)passiveLivenessFacePoseVersion
{
  return self->_passiveLivenessFacePoseVersion;
}

- (NSString)passiveLivenessFacVersion
{
  return self->_passiveLivenessFacVersion;
}

- (NSString)passiveLivenessAssessment
{
  return self->_passiveLivenessAssessment;
}

- (NSString)passiveGestureAssessment
{
  return self->_passiveGestureAssessment;
}

- (void)setHasDidStepUp:(BOOL)a3
{
  self->_hasDidStepUp = a3;
}

- (BOOL)hasDidStepUp
{
  return self->_hasDidStepUp;
}

- (BOOL)didStepUp
{
  return self->_didStepUp;
}

- (NSString)prdVersion
{
  return self->_prdVersion;
}

- (NSString)padtoolVersion
{
  return self->_padtoolVersion;
}

- (NSString)facePoseVersion
{
  return self->_facePoseVersion;
}

- (NSString)facVersion
{
  return self->_facVersion;
}

- (NSArray)axSettings
{
  return self->_axSettings;
}

- (NSString)gestureAssessment
{
  return self->_gestureAssessment;
}

- (NSString)livenessAssessment
{
  return self->_livenessAssessment;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)proofingDecision
{
  return self->_proofingDecision;
}

- (NSString)deviceLanguage
{
  return self->_deviceLanguage;
}

- (NSString)ethnicity
{
  return self->_ethnicity;
}

- (NSString)skinTone
{
  return self->_skinTone;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSString)age
{
  return self->_age;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMWalletPaymentsCommerceUserProofingResult *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMWalletPaymentsCommerceUserProofingResult *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_86;
      }
    }
    v13 = [(BMWalletPaymentsCommerceUserProofingResult *)self age];
    uint64_t v14 = [v5 age];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMWalletPaymentsCommerceUserProofingResult *)self age];
      v17 = [v5 age];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_86;
      }
    }
    v19 = [(BMWalletPaymentsCommerceUserProofingResult *)self gender];
    uint64_t v20 = [v5 gender];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMWalletPaymentsCommerceUserProofingResult *)self gender];
      v23 = [v5 gender];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_86;
      }
    }
    v25 = [(BMWalletPaymentsCommerceUserProofingResult *)self skinTone];
    uint64_t v26 = [v5 skinTone];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMWalletPaymentsCommerceUserProofingResult *)self skinTone];
      v29 = [v5 skinTone];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_86;
      }
    }
    v31 = [(BMWalletPaymentsCommerceUserProofingResult *)self ethnicity];
    uint64_t v32 = [v5 ethnicity];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMWalletPaymentsCommerceUserProofingResult *)self ethnicity];
      v35 = [v5 ethnicity];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_86;
      }
    }
    v37 = [(BMWalletPaymentsCommerceUserProofingResult *)self deviceLanguage];
    uint64_t v38 = [v5 deviceLanguage];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(BMWalletPaymentsCommerceUserProofingResult *)self deviceLanguage];
      v41 = [v5 deviceLanguage];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_86;
      }
    }
    v43 = [(BMWalletPaymentsCommerceUserProofingResult *)self proofingDecision];
    uint64_t v44 = [v5 proofingDecision];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(BMWalletPaymentsCommerceUserProofingResult *)self proofingDecision];
      v47 = [v5 proofingDecision];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_86;
      }
    }
    v49 = [(BMWalletPaymentsCommerceUserProofingResult *)self issuer];
    uint64_t v50 = [v5 issuer];
    if (v49 == (void *)v50)
    {
    }
    else
    {
      v51 = (void *)v50;
      v52 = [(BMWalletPaymentsCommerceUserProofingResult *)self issuer];
      v53 = [v5 issuer];
      int v54 = [v52 isEqual:v53];

      if (!v54) {
        goto LABEL_86;
      }
    }
    v55 = [(BMWalletPaymentsCommerceUserProofingResult *)self livenessAssessment];
    uint64_t v56 = [v5 livenessAssessment];
    if (v55 == (void *)v56)
    {
    }
    else
    {
      v57 = (void *)v56;
      v58 = [(BMWalletPaymentsCommerceUserProofingResult *)self livenessAssessment];
      v59 = [v5 livenessAssessment];
      int v60 = [v58 isEqual:v59];

      if (!v60) {
        goto LABEL_86;
      }
    }
    v61 = [(BMWalletPaymentsCommerceUserProofingResult *)self gestureAssessment];
    uint64_t v62 = [v5 gestureAssessment];
    if (v61 == (void *)v62)
    {
    }
    else
    {
      v63 = (void *)v62;
      v64 = [(BMWalletPaymentsCommerceUserProofingResult *)self gestureAssessment];
      v65 = [v5 gestureAssessment];
      int v66 = [v64 isEqual:v65];

      if (!v66) {
        goto LABEL_86;
      }
    }
    v67 = [(BMWalletPaymentsCommerceUserProofingResult *)self axSettings];
    uint64_t v68 = [v5 axSettings];
    if (v67 == (void *)v68)
    {
    }
    else
    {
      v69 = (void *)v68;
      v70 = [(BMWalletPaymentsCommerceUserProofingResult *)self axSettings];
      v71 = [v5 axSettings];
      int v72 = [v70 isEqual:v71];

      if (!v72) {
        goto LABEL_86;
      }
    }
    v73 = [(BMWalletPaymentsCommerceUserProofingResult *)self facVersion];
    uint64_t v74 = [v5 facVersion];
    if (v73 == (void *)v74)
    {
    }
    else
    {
      v75 = (void *)v74;
      v76 = [(BMWalletPaymentsCommerceUserProofingResult *)self facVersion];
      v77 = [v5 facVersion];
      int v78 = [v76 isEqual:v77];

      if (!v78) {
        goto LABEL_86;
      }
    }
    v79 = [(BMWalletPaymentsCommerceUserProofingResult *)self facePoseVersion];
    uint64_t v80 = [v5 facePoseVersion];
    if (v79 == (void *)v80)
    {
    }
    else
    {
      v81 = (void *)v80;
      v82 = [(BMWalletPaymentsCommerceUserProofingResult *)self facePoseVersion];
      v83 = [v5 facePoseVersion];
      int v84 = [v82 isEqual:v83];

      if (!v84) {
        goto LABEL_86;
      }
    }
    v85 = [(BMWalletPaymentsCommerceUserProofingResult *)self padtoolVersion];
    uint64_t v86 = [v5 padtoolVersion];
    if (v85 == (void *)v86)
    {
    }
    else
    {
      v87 = (void *)v86;
      v88 = [(BMWalletPaymentsCommerceUserProofingResult *)self padtoolVersion];
      v89 = [v5 padtoolVersion];
      int v90 = [v88 isEqual:v89];

      if (!v90) {
        goto LABEL_86;
      }
    }
    v91 = [(BMWalletPaymentsCommerceUserProofingResult *)self prdVersion];
    uint64_t v92 = [v5 prdVersion];
    if (v91 == (void *)v92)
    {
    }
    else
    {
      v93 = (void *)v92;
      v94 = [(BMWalletPaymentsCommerceUserProofingResult *)self prdVersion];
      v95 = [v5 prdVersion];
      int v96 = [v94 isEqual:v95];

      if (!v96) {
        goto LABEL_86;
      }
    }
    if ([(BMWalletPaymentsCommerceUserProofingResult *)self hasDidStepUp]
      || [v5 hasDidStepUp])
    {
      if (![(BMWalletPaymentsCommerceUserProofingResult *)self hasDidStepUp]) {
        goto LABEL_86;
      }
      if (![v5 hasDidStepUp]) {
        goto LABEL_86;
      }
      int v97 = [(BMWalletPaymentsCommerceUserProofingResult *)self didStepUp];
      if (v97 != [v5 didStepUp]) {
        goto LABEL_86;
      }
    }
    v98 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveGestureAssessment];
    uint64_t v99 = [v5 passiveGestureAssessment];
    if (v98 == (void *)v99)
    {
    }
    else
    {
      v100 = (void *)v99;
      v101 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveGestureAssessment];
      v102 = [v5 passiveGestureAssessment];
      int v103 = [v101 isEqual:v102];

      if (!v103) {
        goto LABEL_86;
      }
    }
    v104 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessAssessment];
    uint64_t v105 = [v5 passiveLivenessAssessment];
    if (v104 == (void *)v105)
    {
    }
    else
    {
      v106 = (void *)v105;
      v107 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessAssessment];
      v108 = [v5 passiveLivenessAssessment];
      int v109 = [v107 isEqual:v108];

      if (!v109) {
        goto LABEL_86;
      }
    }
    v110 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessFacVersion];
    uint64_t v111 = [v5 passiveLivenessFacVersion];
    if (v110 == (void *)v111)
    {
    }
    else
    {
      v112 = (void *)v111;
      v113 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessFacVersion];
      v114 = [v5 passiveLivenessFacVersion];
      int v115 = [v113 isEqual:v114];

      if (!v115) {
        goto LABEL_86;
      }
    }
    v116 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessFacePoseVersion];
    uint64_t v117 = [v5 passiveLivenessFacePoseVersion];
    if (v116 == (void *)v117)
    {
    }
    else
    {
      v118 = (void *)v117;
      v119 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessFacePoseVersion];
      v120 = [v5 passiveLivenessFacePoseVersion];
      int v121 = [v119 isEqual:v120];

      if (!v121) {
        goto LABEL_86;
      }
    }
    v122 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessPadtoolVersion];
    uint64_t v123 = [v5 passiveLivenessPadtoolVersion];
    if (v122 == (void *)v123)
    {
    }
    else
    {
      v124 = (void *)v123;
      v125 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessPadtoolVersion];
      v126 = [v5 passiveLivenessPadtoolVersion];
      int v127 = [v125 isEqual:v126];

      if (!v127)
      {
LABEL_86:
        char v12 = 0;
LABEL_87:

        goto LABEL_88;
      }
    }
    v129 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessPrdVersion];
    v130 = [v5 passiveLivenessPrdVersion];
    if (v129 == v130)
    {
      char v12 = 1;
    }
    else
    {
      v131 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessPrdVersion];
      v132 = [v5 passiveLivenessPrdVersion];
      char v12 = [v131 isEqual:v132];
    }
    goto LABEL_87;
  }
  char v12 = 0;
LABEL_88:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v78[22] = *MEMORY[0x1E4F143B8];
  v3 = [(BMWalletPaymentsCommerceUserProofingResult *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMWalletPaymentsCommerceUserProofingResult *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  uint64_t v7 = [(BMWalletPaymentsCommerceUserProofingResult *)self age];
  v8 = [(BMWalletPaymentsCommerceUserProofingResult *)self gender];
  uint64_t v9 = [(BMWalletPaymentsCommerceUserProofingResult *)self skinTone];
  uint64_t v10 = [(BMWalletPaymentsCommerceUserProofingResult *)self ethnicity];
  uint64_t v11 = [(BMWalletPaymentsCommerceUserProofingResult *)self deviceLanguage];
  uint64_t v12 = [(BMWalletPaymentsCommerceUserProofingResult *)self proofingDecision];
  v76 = [(BMWalletPaymentsCommerceUserProofingResult *)self issuer];
  v75 = [(BMWalletPaymentsCommerceUserProofingResult *)self livenessAssessment];
  uint64_t v74 = [(BMWalletPaymentsCommerceUserProofingResult *)self gestureAssessment];
  v73 = [(BMWalletPaymentsCommerceUserProofingResult *)self _axSettingsJSONArray];
  int v72 = [(BMWalletPaymentsCommerceUserProofingResult *)self facVersion];
  v71 = [(BMWalletPaymentsCommerceUserProofingResult *)self facePoseVersion];
  v70 = [(BMWalletPaymentsCommerceUserProofingResult *)self padtoolVersion];
  v69 = [(BMWalletPaymentsCommerceUserProofingResult *)self prdVersion];
  if ([(BMWalletPaymentsCommerceUserProofingResult *)self hasDidStepUp])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMWalletPaymentsCommerceUserProofingResult didStepUp](self, "didStepUp"));
    id v68 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v68 = 0;
  }
  v67 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveGestureAssessment];
  int v66 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessAssessment];
  v65 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessFacVersion];
  v64 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessFacePoseVersion];
  v63 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessPadtoolVersion];
  uint64_t v13 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessPrdVersion];
  v77[0] = @"absoluteTimestamp";
  uint64_t v14 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v53 = (void *)v14;
  v78[0] = v14;
  v77[1] = @"age";
  uint64_t v15 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = (void *)v15;
  v78[1] = v15;
  v77[2] = @"gender";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = (void *)v16;
  v78[2] = v16;
  v77[3] = @"skinTone";
  uint64_t v17 = v9;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v50 = (void *)v17;
  v78[3] = v17;
  v77[4] = @"ethnicity";
  uint64_t v18 = v10;
  if (!v10)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v49 = (void *)v18;
  v78[4] = v18;
  v77[5] = @"deviceLanguage";
  uint64_t v19 = v11;
  if (!v11)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v48 = (void *)v19;
  v78[5] = v19;
  v77[6] = @"proofingDecision";
  uint64_t v20 = v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v47 = (void *)v20;
  v78[6] = v20;
  v77[7] = @"issuer";
  uint64_t v21 = (uint64_t)v76;
  if (!v76)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v78[7] = v21;
  v77[8] = @"livenessAssessment";
  uint64_t v22 = (uint64_t)v75;
  if (!v75)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v78[8] = v22;
  v77[9] = @"gestureAssessment";
  uint64_t v23 = (uint64_t)v74;
  if (!v74)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v57 = (void *)v23;
  v78[9] = v23;
  v77[10] = @"axSettings";
  uint64_t v24 = (uint64_t)v73;
  if (!v73)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v56 = (void *)v24;
  v78[10] = v24;
  v77[11] = @"facVersion";
  uint64_t v25 = (uint64_t)v72;
  if (!v72)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v59 = (void *)v10;
  v78[11] = v25;
  v77[12] = @"facePoseVersion";
  uint64_t v26 = (uint64_t)v71;
  v27 = (void *)v25;
  if (!v71)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v58 = (void *)v11;
  v55 = (void *)v26;
  v78[12] = v26;
  v77[13] = @"padtoolVersion";
  uint64_t v28 = (uint64_t)v70;
  if (!v70)
  {
    uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
  }
  int v60 = (void *)v9;
  v78[13] = v28;
  v77[14] = @"prdVersion";
  uint64_t v29 = (uint64_t)v69;
  if (!v69)
  {
    uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v62 = (void *)v13;
  v78[14] = v29;
  v77[15] = @"didStepUp";
  uint64_t v30 = (uint64_t)v68;
  if (!v68)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v61 = v6;
  v78[15] = v30;
  v77[16] = @"passiveGestureAssessment";
  uint64_t v31 = (uint64_t)v67;
  if (!v67)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v21;
  uint64_t v41 = v31;
  v78[16] = v31;
  v77[17] = @"passiveLivenessAssessment";
  uint64_t v32 = v66;
  if (!v66)
  {
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v31);
  }
  v43 = (void *)v30;
  uint64_t v44 = v27;
  v45 = (void *)v22;
  v78[17] = v32;
  v77[18] = @"passiveLivenessFacVersion";
  v33 = v65;
  if (!v65)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v29;
  v35 = (void *)v12;
  v78[18] = v33;
  v77[19] = @"passiveLivenessFacePoseVersion";
  int v36 = v64;
  if (!v64)
  {
    int v36 = [MEMORY[0x1E4F1CA98] null];
  }
  v37 = (void *)v28;
  v78[19] = v36;
  v77[20] = @"passiveLivenessPadtoolVersion";
  uint64_t v38 = v63;
  if (!v63)
  {
    uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
  }
  v78[20] = v38;
  v77[21] = @"passiveLivenessPrdVersion";
  v39 = v62;
  if (!v62)
  {
    v39 = [MEMORY[0x1E4F1CA98] null];
  }
  v78[21] = v39;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v78, v77, 22, v41);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  if (!v62) {

  }
  if (!v63) {
  if (!v64)
  }

  if (!v65) {
  if (!v66)
  }

  if (!v67) {
  if (!v68)
  }

  if (!v69) {
  if (!v70)
  }

  if (!v71) {
  if (!v72)
  }

  if (!v73) {
  if (!v74)
  }

  if (!v75) {
  if (v76)
  }
  {
    if (v35) {
      goto LABEL_81;
    }
  }
  else
  {

    if (v35)
    {
LABEL_81:
      if (v58) {
        goto LABEL_82;
      }
      goto LABEL_92;
    }
  }

  if (v58)
  {
LABEL_82:
    if (v59) {
      goto LABEL_83;
    }
    goto LABEL_93;
  }
LABEL_92:

  if (v59)
  {
LABEL_83:
    if (v60) {
      goto LABEL_84;
    }
    goto LABEL_94;
  }
LABEL_93:

  if (v60)
  {
LABEL_84:
    if (v8) {
      goto LABEL_85;
    }
    goto LABEL_95;
  }
LABEL_94:

  if (v8)
  {
LABEL_85:
    if (v7) {
      goto LABEL_86;
    }
LABEL_96:

    if (v61) {
      goto LABEL_87;
    }
    goto LABEL_97;
  }
LABEL_95:

  if (!v7) {
    goto LABEL_96;
  }
LABEL_86:
  if (v61) {
    goto LABEL_87;
  }
LABEL_97:

LABEL_87:

  return v54;
}

- (id)_axSettingsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMWalletPaymentsCommerceUserProofingResult *)self axSettings];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMWalletPaymentsCommerceUserProofingResult)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v310[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v256 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  v257 = v6;
  if (!v256 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v253 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v256;
    id v18 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v17 doubleValue];
    id v253 = (id)objc_msgSend(v18, "initWithTimeIntervalSinceReferenceDate:");

    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    id v20 = v256;
    id v253 = [v19 dateFromString:v20];

    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v253 = v256;
LABEL_4:
    uint64_t v7 = [v6 objectForKeyedSubscript:@"age"];
    if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
LABEL_7:
      uint64_t v9 = [v6 objectForKeyedSubscript:@"gender"];
      if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v249 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v249 = v9;
LABEL_10:
        long long v10 = [v6 objectForKeyedSubscript:@"skinTone"];
        v252 = v10;
        long long v11 = self;
        if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v251 = 0;
LABEL_13:
          long long v12 = [v6 objectForKeyedSubscript:@"ethnicity"];
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                id v248 = 0;
                int v36 = 0;
                v55 = v12;
                self = v11;
                goto LABEL_227;
              }
              v237 = v9;
              id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
              id v57 = v8;
              uint64_t v58 = *MEMORY[0x1E4F502C8];
              uint64_t v301 = *MEMORY[0x1E4F28568];
              v59 = v7;
              id v60 = [NSString alloc];
              v55 = v12;
              uint64_t v200 = objc_opt_class();
              v61 = v60;
              uint64_t v7 = v59;
              uint64_t v62 = [v61 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v200, @"ethnicity"];
              uint64_t v302 = v62;
              [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v302 forKeys:&v301 count:1];
              uint64_t v64 = v63 = a4;
              v65 = v56;
              uint64_t v9 = v237;
              uint64_t v66 = v58;
              id v8 = v57;
              id v248 = 0;
              int v36 = 0;
              id *v63 = (id)[v65 initWithDomain:v66 code:2 userInfo:v64];
              long long v10 = v252;
              v67 = v11;
              id v68 = (void *)v64;
              v69 = (void *)v62;
              self = v67;
              goto LABEL_110;
            }
            long long v13 = v7;
            uint64_t v14 = a4;
            v246 = v12;
            id v248 = v12;
          }
          else
          {
            long long v13 = v7;
            uint64_t v14 = a4;
            v246 = v12;
            id v248 = 0;
          }
          id v15 = [v257 objectForKeyedSubscript:@"deviceLanguage"];
          self = v11;
          id v247 = v15;
          if (!v15) {
            goto LABEL_33;
          }
          uint64_t v16 = v15;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = 0;
            goto LABEL_33;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v16;
LABEL_33:
            id v243 = v15;
            v250 = [v257 objectForKeyedSubscript:@"proofingDecision"];
            v242 = v11;
            if (v250)
            {
              objc_opt_class();
              uint64_t v21 = v14;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                uint64_t v7 = v13;
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!v21)
                  {
                    id v245 = 0;
                    int v36 = 0;
                    v55 = v246;
                    id v68 = v247;
                    id v6 = v257;
                    v69 = v243;
                    goto LABEL_225;
                  }
                  id v79 = objc_alloc(MEMORY[0x1E4F28C58]);
                  id v80 = v8;
                  uint64_t v81 = *MEMORY[0x1E4F502C8];
                  uint64_t v297 = *MEMORY[0x1E4F28568];
                  id v82 = [NSString alloc];
                  uint64_t v202 = objc_opt_class();
                  v83 = v82;
                  uint64_t v7 = v13;
                  id v240 = (id)[v83 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v202, @"proofingDecision"];
                  id v298 = v240;
                  uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v298 forKeys:&v297 count:1];
                  uint64_t v85 = v81;
                  id v8 = v80;
                  v241 = (void *)v84;
                  id v245 = 0;
                  int v36 = 0;
                  id *v21 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v85, 2);
                  goto LABEL_120;
                }
                id v245 = v250;
LABEL_38:
                id v6 = v257;
                uint64_t v22 = [v257 objectForKeyedSubscript:@"issuer"];
                v241 = (void *)v22;
                if (!v22 || (uint64_t v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  id v240 = 0;
                  goto LABEL_41;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v240 = v23;
                  id v6 = v257;
LABEL_41:
                  uint64_t v24 = [v6 objectForKeyedSubscript:@"livenessAssessment"];
                  v239 = (void *)v24;
                  if (!v24 || (uint64_t v25 = (void *)v24, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    id v238 = 0;
                    goto LABEL_44;
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v238 = v25;
                    id v6 = v257;
LABEL_44:
                    uint64_t v26 = [v6 objectForKeyedSubscript:@"gestureAssessment"];
                    id v234 = v8;
                    v236 = v9;
                    v233 = (void *)v26;
                    if (!v26 || (v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      v227 = v7;
                      id v229 = 0;
                      goto LABEL_47;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v227 = v7;
                      id v229 = v27;
                      id v6 = v257;
LABEL_47:
                      uint64_t v28 = [v6 objectForKeyedSubscript:@"axSettings"];
                      uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
                      int v30 = [v28 isEqual:v29];

                      if (v30)
                      {
                        uint64_t v31 = v21;

                        uint64_t v28 = 0;
                      }
                      else if (v28)
                      {
                        objc_opt_class();
                        id obj = v28;
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!v21)
                          {
                            int v36 = 0;
                            uint64_t v7 = v227;
                            uint64_t v105 = v229;
                            v55 = v246;
                            v69 = v243;
                            goto LABEL_221;
                          }
                          id v129 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v130 = *MEMORY[0x1E4F502C8];
                          uint64_t v289 = *MEMORY[0x1E4F28568];
                          v254 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"axSettings"];
                          v290 = v254;
                          uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v290 forKeys:&v289 count:1];
                          int v36 = 0;
                          id *v21 = (id)[v129 initWithDomain:v130 code:2 userInfo:v31];
                          uint64_t v7 = v227;
                          uint64_t v9 = v236;
                          v55 = v246;
                          goto LABEL_108;
                        }
                        uint64_t v31 = v21;
                      }
                      else
                      {
                        uint64_t v31 = v21;
                      }
                      v254 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v28, "count"));
                      long long v258 = 0u;
                      long long v259 = 0u;
                      long long v260 = 0u;
                      long long v261 = 0u;
                      id obj = v28;
                      uint64_t v111 = [obj countByEnumeratingWithState:&v258 objects:v288 count:16];
                      if (!v111) {
                        goto LABEL_94;
                      }
                      uint64_t v112 = v111;
                      uint64_t v113 = *(void *)v259;
LABEL_87:
                      uint64_t v114 = 0;
                      while (1)
                      {
                        if (*(void *)v259 != v113) {
                          objc_enumerationMutation(obj);
                        }
                        int v115 = *(void **)(*((void *)&v258 + 1) + 8 * v114);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          break;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (v31)
                          {
                            id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v125 = *MEMORY[0x1E4F502C8];
                            uint64_t v284 = *MEMORY[0x1E4F28568];
                            v226 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"axSettings"];
                            v285 = v226;
                            uint64_t v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v285 forKeys:&v284 count:1];
                            v122 = v124;
                            uint64_t v123 = v125;
                            goto LABEL_101;
                          }
                          goto LABEL_102;
                        }
                        id v116 = v115;
                        [v254 addObject:v116];

                        if (v112 == ++v114)
                        {
                          uint64_t v112 = [obj countByEnumeratingWithState:&v258 objects:v288 count:16];
                          long long v10 = v252;
                          id v6 = v257;
                          if (v112) {
                            goto LABEL_87;
                          }
LABEL_94:

                          uint64_t v117 = [v6 objectForKeyedSubscript:@"facVersion"];
                          v226 = (void *)v117;
                          if (!v117)
                          {
                            uint64_t v9 = v236;
                            v232 = v31;
                            uint64_t v31 = 0;
                            uint64_t v105 = v229;
                            goto LABEL_115;
                          }
                          v118 = (void *)v117;
                          objc_opt_class();
                          uint64_t v9 = v236;
                          uint64_t v105 = v229;
                          if (objc_opt_isKindOfClass())
                          {
                            v232 = v31;
                            uint64_t v31 = 0;
                            goto LABEL_115;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v232 = v31;
                            uint64_t v31 = v118;
                            long long v10 = v252;
                            id v6 = v257;
LABEL_115:
                            uint64_t v131 = [v6 objectForKeyedSubscript:@"facePoseVersion"];
                            v223 = (void *)v131;
                            if (!v131)
                            {
                              id v225 = 0;
                              uint64_t v7 = v227;
                              goto LABEL_123;
                            }
                            v132 = (void *)v131;
                            objc_opt_class();
                            uint64_t v7 = v227;
                            if (objc_opt_isKindOfClass())
                            {
                              id v225 = 0;
LABEL_123:
                              uint64_t v133 = [v6 objectForKeyedSubscript:@"padtoolVersion"];
                              v221 = (void *)v133;
                              if (!v133 || (v134 = (void *)v133, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                              {
                                id v222 = 0;
LABEL_126:
                                uint64_t v135 = [v6 objectForKeyedSubscript:@"prdVersion"];
                                v220 = (void *)v135;
                                if (!v135
                                  || (v136 = (void *)v135, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                {
                                  id v228 = 0;
LABEL_129:
                                  uint64_t v137 = [v6 objectForKeyedSubscript:@"didStepUp"];
                                  v218 = (void *)v137;
                                  if (!v137
                                    || (v138 = (void *)v137, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                  {
                                    id v219 = 0;
LABEL_132:
                                    uint64_t v139 = [v6 objectForKeyedSubscript:@"passiveGestureAssessment"];
                                    v216 = (void *)v139;
                                    if (!v139
                                      || (v140 = (void *)v139, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                    {
                                      id v217 = 0;
LABEL_135:
                                      uint64_t v141 = [v6 objectForKeyedSubscript:@"passiveLivenessAssessment"];
                                      v215 = (void *)v141;
                                      if (!v141
                                        || (v142 = (void *)v141, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                                      {
                                        id v143 = 0;
                                        goto LABEL_138;
                                      }
                                      objc_opt_class();
                                      if (objc_opt_isKindOfClass())
                                      {
                                        id v143 = v142;
                                        long long v10 = v252;
                                        id v6 = v257;
LABEL_138:
                                        id v144 = [v6 objectForKeyedSubscript:@"passiveLivenessFacVersion"];
                                        v214 = v143;
                                        v212 = v144;
                                        if (v144)
                                        {
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v144 = 0;
                                            goto LABEL_165;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v144 = v144;
                                            long long v10 = v252;
                                            id v6 = v257;
                                            goto LABEL_165;
                                          }
                                          if (v232)
                                          {
                                            id v179 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v180 = *MEMORY[0x1E4F502C8];
                                            uint64_t v268 = *MEMORY[0x1E4F28568];
                                            id v213 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passiveLivenessFacVersion"];
                                            id v269 = v213;
                                            uint64_t v181 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v269 forKeys:&v268 count:1];
                                            v182 = v179;
                                            uint64_t v105 = v229;
                                            v209 = (void *)v181;
                                            int v36 = 0;
                                            v211 = 0;
                                            void *v232 = (id)objc_msgSend(v182, "initWithDomain:code:userInfo:", v180, 2);
                                            goto LABEL_240;
                                          }
                                          v211 = 0;
                                          int v36 = 0;
LABEL_238:
                                          long long v10 = v252;
                                          v55 = v246;
                                          id v6 = v257;
                                          v69 = v243;
LABEL_212:

LABEL_213:
LABEL_214:

LABEL_215:
LABEL_216:

LABEL_217:
LABEL_218:

LABEL_219:
LABEL_220:

LABEL_221:
                                          id v8 = v234;
LABEL_222:

                                          id v68 = v247;
LABEL_223:

LABEL_224:
                                          self = v242;
LABEL_225:

LABEL_226:
LABEL_227:
                                          a4 = v249;
LABEL_228:

                                          goto LABEL_229;
                                        }
LABEL_165:
                                        uint64_t v157 = [v6 objectForKeyedSubscript:@"passiveLivenessFacePoseVersion"];
                                        v211 = v144;
                                        v209 = (void *)v157;
                                        if (v157
                                          && (v158 = (void *)v157, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                                        {
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v213 = v158;
                                            long long v10 = v252;
                                            id v6 = v257;
                                            goto LABEL_168;
                                          }
                                          if (!v232)
                                          {
                                            id v213 = 0;
                                            int v36 = 0;
LABEL_240:
                                            long long v10 = v252;
                                            v55 = v246;
                                            id v6 = v257;
                                            v69 = v243;
                                            goto LABEL_211;
                                          }
                                          id v183 = objc_alloc(MEMORY[0x1E4F28C58]);
                                          uint64_t v184 = *MEMORY[0x1E4F502C8];
                                          uint64_t v266 = *MEMORY[0x1E4F28568];
                                          id v210 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passiveLivenessFacePoseVersion"];
                                          id v267 = v210;
                                          uint64_t v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v267 forKeys:&v266 count:1];
                                          v186 = v183;
                                          uint64_t v105 = v229;
                                          v208 = (void *)v185;
                                          int v36 = 0;
                                          id v213 = 0;
                                          void *v232 = (id)objc_msgSend(v186, "initWithDomain:code:userInfo:", v184, 2);
                                        }
                                        else
                                        {
                                          id v213 = 0;
LABEL_168:
                                          uint64_t v159 = [v6 objectForKeyedSubscript:@"passiveLivenessPadtoolVersion"];
                                          v208 = (void *)v159;
                                          if (!v159
                                            || (v160 = (void *)v159,
                                                objc_opt_class(),
                                                (objc_opt_isKindOfClass() & 1) != 0))
                                          {
                                            id v210 = 0;
                                            goto LABEL_171;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass())
                                          {
                                            id v210 = v160;
                                            long long v10 = v252;
                                            id v6 = v257;
LABEL_171:
                                            id v161 = [v6 objectForKeyedSubscript:@"passiveLivenessPrdVersion"];
                                            v207 = v161;
                                            if (!v161)
                                            {
LABEL_174:
                                              v55 = v246;
                                              goto LABEL_175;
                                            }
                                            v162 = v161;
                                            objc_opt_class();
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v161 = 0;
                                              goto LABEL_174;
                                            }
                                            objc_opt_class();
                                            v55 = v246;
                                            if (objc_opt_isKindOfClass())
                                            {
                                              id v161 = v162;
                                              long long v10 = v252;
                                              id v6 = v257;
LABEL_175:
                                              v206 = v161;
                                              id v205 = v144;
                                              v69 = v243;
                                              int v36 = objc_retain(-[BMWalletPaymentsCommerceUserProofingResult initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:didStepUp:passiveGestureAssessment:passiveLivenessAssessment:passiveLivenessFacVersion:passiveLivenessFacePoseVersion:passiveLivenessPadtoolVersion:passiveLivenessPrdVersion:](v242, "initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:didStepUp:passiveGestureAssessment:passiveLivenessAssessment:passiveLivenessFacVersion:passiveLivenessFacePoseVersion:passiveLivenessPadtoolVersion:passiveLivenessPrdVersion:", v253, v234, v249, v251, v248, v243, v245, v240, v238, v105, v254,
                                                        v31,
                                                        v225,
                                                        v222,
                                                        v228,
                                                        v219,
                                                        v217,
                                                        v143,
                                                        v205,
                                                        v213,
                                                        v210,
                                                        v161));
                                              v242 = v36;
LABEL_209:

LABEL_210:
LABEL_211:

                                              goto LABEL_212;
                                            }
                                            if (v232)
                                            {
                                              id v191 = objc_alloc(MEMORY[0x1E4F28C58]);
                                              uint64_t v192 = *MEMORY[0x1E4F502C8];
                                              uint64_t v262 = *MEMORY[0x1E4F28568];
                                              v193 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passiveLivenessPrdVersion"];
                                              v263 = v193;
                                              v194 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v263 forKeys:&v262 count:1];
                                              v195 = v191;
                                              uint64_t v105 = v229;
                                              uint64_t v196 = v192;
                                              v55 = v246;
                                              void *v232 = (id)[v195 initWithDomain:v196 code:2 userInfo:v194];
                                            }
                                            v206 = 0;
                                            int v36 = 0;
                                            long long v10 = v252;
LABEL_208:
                                            id v6 = v257;
                                            v69 = v243;
                                            goto LABEL_209;
                                          }
                                          if (v232)
                                          {
                                            id v187 = objc_alloc(MEMORY[0x1E4F28C58]);
                                            uint64_t v188 = *MEMORY[0x1E4F502C8];
                                            uint64_t v264 = *MEMORY[0x1E4F28568];
                                            v206 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passiveLivenessPadtoolVersion"];
                                            v265 = v206;
                                            uint64_t v189 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v265 forKeys:&v264 count:1];
                                            v190 = v187;
                                            uint64_t v105 = v229;
                                            v207 = (void *)v189;
                                            int v36 = 0;
                                            id v210 = 0;
                                            void *v232 = (id)objc_msgSend(v190, "initWithDomain:code:userInfo:", v188, 2);
                                            long long v10 = v252;
                                            v55 = v246;
                                            goto LABEL_208;
                                          }
                                          id v210 = 0;
                                          int v36 = 0;
                                        }
                                        long long v10 = v252;
                                        v55 = v246;
                                        id v6 = v257;
                                        v69 = v243;
                                        goto LABEL_210;
                                      }
                                      if (v232)
                                      {
                                        id v175 = objc_alloc(MEMORY[0x1E4F28C58]);
                                        uint64_t v176 = *MEMORY[0x1E4F502C8];
                                        uint64_t v270 = *MEMORY[0x1E4F28568];
                                        v211 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passiveLivenessAssessment"];
                                        v271 = v211;
                                        uint64_t v177 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v271 forKeys:&v270 count:1];
                                        v178 = v175;
                                        uint64_t v105 = v229;
                                        v212 = (void *)v177;
                                        int v36 = 0;
                                        v214 = 0;
                                        void *v232 = (id)objc_msgSend(v178, "initWithDomain:code:userInfo:", v176, 2);
                                        goto LABEL_238;
                                      }
                                      v214 = 0;
                                      int v36 = 0;
LABEL_236:
                                      long long v10 = v252;
                                      v55 = v246;
                                      id v6 = v257;
                                      v69 = v243;
                                      goto LABEL_213;
                                    }
                                    objc_opt_class();
                                    if (objc_opt_isKindOfClass())
                                    {
                                      id v217 = v140;
                                      long long v10 = v252;
                                      id v6 = v257;
                                      goto LABEL_135;
                                    }
                                    if (v232)
                                    {
                                      id v171 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v172 = *MEMORY[0x1E4F502C8];
                                      uint64_t v272 = *MEMORY[0x1E4F28568];
                                      v214 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passiveGestureAssessment"];
                                      v273 = v214;
                                      uint64_t v173 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v273 forKeys:&v272 count:1];
                                      v174 = v171;
                                      uint64_t v105 = v229;
                                      v215 = (void *)v173;
                                      int v36 = 0;
                                      id v217 = 0;
                                      void *v232 = (id)objc_msgSend(v174, "initWithDomain:code:userInfo:", v172, 2);
                                      goto LABEL_236;
                                    }
                                    id v217 = 0;
                                    int v36 = 0;
                                    long long v10 = v252;
                                    v55 = v246;
                                    id v6 = v257;
LABEL_234:
                                    v69 = v243;
                                    goto LABEL_214;
                                  }
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass())
                                  {
                                    id v219 = v138;
                                    goto LABEL_132;
                                  }
                                  if (v232)
                                  {
                                    id v167 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v168 = *MEMORY[0x1E4F502C8];
                                    uint64_t v274 = *MEMORY[0x1E4F28568];
                                    long long v10 = v252;
                                    id v217 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"didStepUp"];
                                    id v275 = v217;
                                    uint64_t v169 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v275 forKeys:&v274 count:1];
                                    v170 = v167;
                                    uint64_t v105 = v229;
                                    uint64_t v9 = v236;
                                    v216 = (void *)v169;
                                    int v36 = 0;
                                    id v219 = 0;
                                    void *v232 = (id)objc_msgSend(v170, "initWithDomain:code:userInfo:", v168, 2);
                                    v55 = v246;
                                    goto LABEL_234;
                                  }
                                  id v219 = 0;
                                  int v36 = 0;
                                  v55 = v246;
LABEL_204:
                                  v69 = v243;
                                  goto LABEL_215;
                                }
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  id v228 = v136;
                                  long long v10 = v252;
                                  id v6 = v257;
                                  goto LABEL_129;
                                }
                                if (v232)
                                {
                                  id v163 = objc_alloc(MEMORY[0x1E4F28C58]);
                                  uint64_t v164 = *MEMORY[0x1E4F502C8];
                                  uint64_t v276 = *MEMORY[0x1E4F28568];
                                  id v219 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"prdVersion"];
                                  id v277 = v219;
                                  uint64_t v165 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v277 forKeys:&v276 count:1];
                                  v166 = v163;
                                  uint64_t v105 = v229;
                                  v218 = (void *)v165;
                                  int v36 = 0;
                                  id v228 = 0;
                                  void *v232 = (id)objc_msgSend(v166, "initWithDomain:code:userInfo:", v164, 2);
                                  long long v10 = v252;
                                  v55 = v246;
                                  id v6 = v257;
                                  goto LABEL_204;
                                }
                                id v228 = 0;
                                int v36 = 0;
LABEL_200:
                                long long v10 = v252;
                                v55 = v246;
                                id v6 = v257;
                                v69 = v243;
                                goto LABEL_216;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v222 = v134;
                                long long v10 = v252;
                                id v6 = v257;
                                goto LABEL_126;
                              }
                              if (v232)
                              {
                                id v153 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v154 = *MEMORY[0x1E4F502C8];
                                uint64_t v278 = *MEMORY[0x1E4F28568];
                                id v228 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"padtoolVersion"];
                                id v279 = v228;
                                uint64_t v155 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v279 forKeys:&v278 count:1];
                                v156 = v153;
                                uint64_t v105 = v229;
                                v220 = (void *)v155;
                                int v36 = 0;
                                id v222 = 0;
                                void *v232 = (id)objc_msgSend(v156, "initWithDomain:code:userInfo:", v154, 2);
                                goto LABEL_200;
                              }
                              id v222 = 0;
                              int v36 = 0;
LABEL_196:
                              long long v10 = v252;
                              v55 = v246;
                              id v6 = v257;
                              v69 = v243;
                              goto LABEL_217;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v225 = v132;
                              long long v10 = v252;
                              id v6 = v257;
                              goto LABEL_123;
                            }
                            if (v232)
                            {
                              id v149 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v150 = *MEMORY[0x1E4F502C8];
                              uint64_t v280 = *MEMORY[0x1E4F28568];
                              id v222 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"facePoseVersion"];
                              id v281 = v222;
                              uint64_t v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v281 forKeys:&v280 count:1];
                              v152 = v149;
                              uint64_t v105 = v229;
                              v221 = (void *)v151;
                              int v36 = 0;
                              id v225 = 0;
                              void *v232 = (id)objc_msgSend(v152, "initWithDomain:code:userInfo:", v150, 2);
                              goto LABEL_196;
                            }
                            id v225 = 0;
                            int v36 = 0;
                          }
                          else
                          {
                            uint64_t v7 = v227;
                            if (!v31)
                            {
                              int v36 = 0;
                              long long v10 = v252;
                              v55 = v246;
                              id v6 = v257;
                              v69 = v243;
                              goto LABEL_219;
                            }
                            id v145 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v146 = *MEMORY[0x1E4F502C8];
                            uint64_t v282 = *MEMORY[0x1E4F28568];
                            id v225 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"facVersion"];
                            id v283 = v225;
                            uint64_t v147 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v283 forKeys:&v282 count:1];
                            v148 = v145;
                            uint64_t v105 = v229;
                            v223 = (void *)v147;
                            int v36 = 0;
                            void *v31 = (id)objc_msgSend(v148, "initWithDomain:code:userInfo:", v146, 2);
                            uint64_t v31 = 0;
                          }
                          long long v10 = v252;
                          v55 = v246;
                          id v6 = v257;
                          v69 = v243;
                          goto LABEL_218;
                        }
                      }
                      if (v31)
                      {
                        id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v120 = *MEMORY[0x1E4F502C8];
                        uint64_t v286 = *MEMORY[0x1E4F28568];
                        v226 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"axSettings"];
                        v287 = v226;
                        uint64_t v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v287 forKeys:&v286 count:1];
                        v122 = v119;
                        uint64_t v123 = v120;
LABEL_101:
                        v224 = (void *)v121;
                        long long v10 = v252;
                        v55 = v246;
                        id v6 = v257;
                        v69 = v243;
                        int v36 = 0;
                        void *v31 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v123, 2);
                        uint64_t v31 = obj;
                        uint64_t v7 = v227;
                        uint64_t v105 = v229;
                        uint64_t v9 = v236;

                        goto LABEL_219;
                      }
LABEL_102:
                      int v36 = 0;
                      uint64_t v31 = obj;
                      uint64_t v7 = v227;
                      uint64_t v9 = v236;
                      long long v10 = v252;
                      v55 = v246;
                      id v6 = v257;
LABEL_108:
                      v69 = v243;
                      uint64_t v105 = v229;
                      goto LABEL_220;
                    }
                    if (v21)
                    {
                      id v126 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v127 = *MEMORY[0x1E4F502C8];
                      uint64_t v291 = *MEMORY[0x1E4F28568];
                      id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"gestureAssessment"];
                      id v292 = obj;
                      v255 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v292 forKeys:&v291 count:1];
                      id v128 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v127, 2);
                      uint64_t v105 = 0;
                      int v36 = 0;
                      id *v21 = v128;
                      uint64_t v9 = v236;
                      v55 = v246;
                      id v6 = v257;
                      v69 = v243;

                      goto LABEL_221;
                    }
                    uint64_t v105 = 0;
                    int v36 = 0;
LABEL_147:
                    long long v10 = v252;
                    v55 = v246;
                    id v6 = v257;
                    v69 = v243;
                    goto LABEL_222;
                  }
                  if (v21)
                  {
                    id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
                    id v98 = v8;
                    uint64_t v99 = *MEMORY[0x1E4F502C8];
                    uint64_t v293 = *MEMORY[0x1E4F28568];
                    v100 = v7;
                    id v101 = [NSString alloc];
                    uint64_t v204 = objc_opt_class();
                    v102 = v101;
                    uint64_t v7 = v100;
                    uint64_t v103 = [v102 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v204, @"livenessAssessment"];
                    uint64_t v294 = v103;
                    uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v294 forKeys:&v293 count:1];
                    uint64_t v105 = (void *)v103;
                    uint64_t v106 = v99;
                    id v8 = v98;
                    v233 = (void *)v104;
                    id v238 = 0;
                    int v36 = 0;
                    id *v21 = (id)objc_msgSend(v97, "initWithDomain:code:userInfo:", v106, 2);
                    goto LABEL_147;
                  }
                  id v238 = 0;
                  int v36 = 0;
LABEL_142:
                  long long v10 = v252;
                  v55 = v246;
                  id v68 = v247;
                  id v6 = v257;
                  v69 = v243;
                  goto LABEL_223;
                }
                if (v21)
                {
                  uint64_t v86 = v21;
                  v87 = v9;
                  id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                  id v89 = v8;
                  uint64_t v90 = *MEMORY[0x1E4F502C8];
                  uint64_t v295 = *MEMORY[0x1E4F28568];
                  v91 = v7;
                  id v92 = [NSString alloc];
                  uint64_t v203 = objc_opt_class();
                  v93 = v92;
                  uint64_t v7 = v91;
                  id v238 = (id)[v93 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v203, @"issuer"];
                  id v296 = v238;
                  uint64_t v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v296 forKeys:&v295 count:1];
                  v95 = v88;
                  uint64_t v9 = v87;
                  uint64_t v96 = v90;
                  id v8 = v89;
                  v239 = (void *)v94;
                  id v240 = 0;
                  int v36 = 0;
                  *uint64_t v86 = (id)objc_msgSend(v95, "initWithDomain:code:userInfo:", v96, 2);
                  goto LABEL_142;
                }
                id v240 = 0;
                int v36 = 0;
LABEL_120:
                v55 = v246;
                id v68 = v247;
                id v6 = v257;
                v69 = v243;
                goto LABEL_224;
              }
              id v245 = 0;
            }
            else
            {
              id v245 = 0;
              uint64_t v21 = v14;
            }
            uint64_t v7 = v13;
            goto LABEL_38;
          }
          if (v14)
          {
            v70 = v14;
            v71 = v9;
            id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
            id v235 = v8;
            uint64_t v73 = *MEMORY[0x1E4F502C8];
            uint64_t v299 = *MEMORY[0x1E4F28568];
            id v74 = [NSString alloc];
            uint64_t v201 = objc_opt_class();
            v75 = v74;
            uint64_t v7 = v13;
            id v245 = (id)[v75 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v201, @"deviceLanguage"];
            id v300 = v245;
            uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v300 forKeys:&v299 count:1];
            v77 = v72;
            uint64_t v9 = v71;
            self = v11;
            id v68 = v247;
            uint64_t v78 = v73;
            id v8 = v235;
            v250 = (void *)v76;
            v69 = 0;
            int v36 = 0;
            id *v70 = (id)[v77 initWithDomain:v78 code:2 userInfo:v76];
            v55 = v246;
            id v6 = v257;
            goto LABEL_225;
          }
          v69 = 0;
          int v36 = 0;
          v55 = v246;
          id v68 = v247;
          uint64_t v7 = v13;
LABEL_110:
          id v6 = v257;
          goto LABEL_226;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v251 = v10;
          goto LABEL_13;
        }
        if (a4)
        {
          v231 = a4;
          v45 = v9;
          id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v47 = v8;
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v303 = *MEMORY[0x1E4F28568];
          v49 = v7;
          id v50 = [NSString alloc];
          uint64_t v199 = objc_opt_class();
          v51 = v50;
          uint64_t v7 = v49;
          id v248 = (id)[v51 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v199, @"skinTone"];
          id v304 = v248;
          uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v304 forKeys:&v303 count:1];
          v53 = v46;
          uint64_t v9 = v45;
          a4 = v249;
          uint64_t v54 = v48;
          id v8 = v47;
          v55 = (void *)v52;
          id v251 = 0;
          int v36 = 0;
          id *v231 = (id)[v53 initWithDomain:v54 code:2 userInfo:v52];
          self = v11;
          goto LABEL_228;
        }
        id v251 = 0;
        int v36 = 0;
        a4 = v249;
LABEL_229:

        goto LABEL_230;
      }
      if (a4)
      {
        v230 = a4;
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v38 = v8;
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v305 = *MEMORY[0x1E4F28568];
        v40 = v7;
        id v41 = [NSString alloc];
        uint64_t v198 = objc_opt_class();
        int v42 = v41;
        uint64_t v7 = v40;
        id v251 = (id)[v42 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v198, @"gender"];
        id v306 = v251;
        long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v306 forKeys:&v305 count:1];
        uint64_t v43 = v39;
        id v8 = v38;
        id v44 = (id)[v37 initWithDomain:v43 code:2 userInfo:v10];
        a4 = 0;
        int v36 = 0;
        id *v230 = v44;
        id v6 = v257;
        goto LABEL_229;
      }
      int v36 = 0;
LABEL_78:
      id v6 = v257;
LABEL_230:

      goto LABEL_231;
    }
    if (a4)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v33 = *MEMORY[0x1E4F502C8];
      uint64_t v307 = *MEMORY[0x1E4F28568];
      v34 = a4;
      a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"age"];
      v308 = a4;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v308 forKeys:&v307 count:1];
      id v35 = (id)[v32 initWithDomain:v33 code:2 userInfo:v9];
      id v8 = 0;
      int v36 = 0;
      id *v34 = v35;
      goto LABEL_78;
    }
    id v8 = 0;
    int v36 = 0;
LABEL_231:

    goto LABEL_232;
  }
  if (a4)
  {
    id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v108 = *MEMORY[0x1E4F502C8];
    uint64_t v309 = *MEMORY[0x1E4F28568];
    uint64_t v109 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
    v310[0] = v109;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v310 forKeys:&v309 count:1];
    uint64_t v110 = v108;
    id v8 = (id)v109;
    id v253 = 0;
    int v36 = 0;
    *a4 = (id)[v107 initWithDomain:v110 code:2 userInfo:v7];
    goto LABEL_231;
  }
  id v253 = 0;
  int v36 = 0;
LABEL_232:

  return v36;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMWalletPaymentsCommerceUserProofingResult *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_age) {
    PBDataWriterWriteStringField();
  }
  if (self->_gender) {
    PBDataWriterWriteStringField();
  }
  if (self->_skinTone) {
    PBDataWriterWriteStringField();
  }
  if (self->_ethnicity) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceLanguage) {
    PBDataWriterWriteStringField();
  }
  if (self->_proofingDecision) {
    PBDataWriterWriteStringField();
  }
  if (self->_issuer) {
    PBDataWriterWriteStringField();
  }
  if (self->_livenessAssessment) {
    PBDataWriterWriteStringField();
  }
  if (self->_gestureAssessment) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_axSettings;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_facVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_facePoseVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_padtoolVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_prdVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasDidStepUp) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_passiveGestureAssessment) {
    PBDataWriterWriteStringField();
  }
  if (self->_passiveLivenessAssessment) {
    PBDataWriterWriteStringField();
  }
  if (self->_passiveLivenessFacVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_passiveLivenessFacePoseVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_passiveLivenessPadtoolVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_passiveLivenessPrdVersion) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMWalletPaymentsCommerceUserProofingResult;
  uint64_t v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_64;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v21 = *v7;
          unint64_t v22 = *(void *)&v4[v21];
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v8])
          {
            double v23 = *(double *)(*(void *)&v4[*v10] + v22);
            *(void *)&v4[v21] = v22 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v23 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v23;
          continue;
        case 2u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 40;
          goto LABEL_53;
        case 3u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 48;
          goto LABEL_53;
        case 4u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 56;
          goto LABEL_53;
        case 5u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 64;
          goto LABEL_53;
        case 6u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 72;
          goto LABEL_53;
        case 7u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 80;
          goto LABEL_53;
        case 8u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 88;
          goto LABEL_53;
        case 9u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 96;
          goto LABEL_53;
        case 0xAu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 104;
          goto LABEL_53;
        case 0xBu:
          uint64_t v26 = PBReaderReadString();
          if (!v26) {
            goto LABEL_66;
          }
          v27 = (void *)v26;
          [v6 addObject:v26];

          continue;
        case 0xCu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 120;
          goto LABEL_53;
        case 0xDu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 128;
          goto LABEL_53;
        case 0xEu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 136;
          goto LABEL_53;
        case 0xFu:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 144;
          goto LABEL_53;
        case 0x10u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasDidStepUp = 1;
          break;
        case 0x11u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 152;
          goto LABEL_53;
        case 0x12u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 160;
          goto LABEL_53;
        case 0x13u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 168;
          goto LABEL_53;
        case 0x14u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 176;
          goto LABEL_53;
        case 0x15u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 184;
          goto LABEL_53;
        case 0x16u:
          uint64_t v24 = PBReaderReadString();
          uint64_t v25 = 192;
LABEL_53:
          id v35 = *(Class *)((char *)&v5->super.super.isa + v25);
          *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_66:

          goto LABEL_63;
      }
      while (1)
      {
        uint64_t v31 = *v7;
        uint64_t v32 = *(void *)&v4[v31];
        unint64_t v33 = v32 + 1;
        if (v32 == -1 || v33 > *(void *)&v4[*v8]) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)&v4[*v10] + v32);
        *(void *)&v4[v31] = v33;
        v30 |= (unint64_t)(v34 & 0x7F) << v28;
        if ((v34 & 0x80) == 0) {
          goto LABEL_57;
        }
        v28 += 7;
        BOOL v18 = v29++ >= 9;
        if (v18)
        {
          uint64_t v30 = 0;
          goto LABEL_59;
        }
      }
      v4[*v9] = 1;
LABEL_57:
      if (v4[*v9]) {
        uint64_t v30 = 0;
      }
LABEL_59:
      v5->_didStepUp = v30 != 0;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v36 = [v6 copy];
  axSettings = v5->_axSettings;
  v5->_axSettings = (NSArray *)v36;

  int v38 = v4[*v9];
  if (v38) {
LABEL_63:
  }
    uint64_t v39 = 0;
  else {
LABEL_64:
  }
    uint64_t v39 = v5;

  return v39;
}

- (NSString)description
{
  id v18 = [NSString alloc];
  uint64_t v24 = [(BMWalletPaymentsCommerceUserProofingResult *)self absoluteTimestamp];
  v27 = [(BMWalletPaymentsCommerceUserProofingResult *)self age];
  unint64_t v22 = [(BMWalletPaymentsCommerceUserProofingResult *)self gender];
  uint64_t v26 = [(BMWalletPaymentsCommerceUserProofingResult *)self skinTone];
  char v17 = [(BMWalletPaymentsCommerceUserProofingResult *)self ethnicity];
  uint64_t v25 = [(BMWalletPaymentsCommerceUserProofingResult *)self deviceLanguage];
  double v23 = [(BMWalletPaymentsCommerceUserProofingResult *)self proofingDecision];
  uint64_t v21 = [(BMWalletPaymentsCommerceUserProofingResult *)self issuer];
  unint64_t v16 = [(BMWalletPaymentsCommerceUserProofingResult *)self livenessAssessment];
  id v20 = [(BMWalletPaymentsCommerceUserProofingResult *)self gestureAssessment];
  uint64_t v15 = [(BMWalletPaymentsCommerceUserProofingResult *)self axSettings];
  unint64_t v13 = [(BMWalletPaymentsCommerceUserProofingResult *)self facVersion];
  uint64_t v14 = [(BMWalletPaymentsCommerceUserProofingResult *)self facePoseVersion];
  unsigned int v12 = [(BMWalletPaymentsCommerceUserProofingResult *)self padtoolVersion];
  char v11 = [(BMWalletPaymentsCommerceUserProofingResult *)self prdVersion];
  long long v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMWalletPaymentsCommerceUserProofingResult didStepUp](self, "didStepUp"));
  v3 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveGestureAssessment];
  id v4 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessAssessment];
  uint64_t v5 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessFacVersion];
  uint64_t v6 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessFacePoseVersion];
  uint64_t v7 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessPadtoolVersion];
  uint64_t v8 = [(BMWalletPaymentsCommerceUserProofingResult *)self passiveLivenessPrdVersion];
  int v19 = objc_msgSend(v18, "initWithFormat:", @"BMWalletPaymentsCommerceUserProofingResult with absoluteTimestamp: %@, age: %@, gender: %@, skinTone: %@, ethnicity: %@, deviceLanguage: %@, proofingDecision: %@, issuer: %@, livenessAssessment: %@, gestureAssessment: %@, axSettings: %@, facVersion: %@, facePoseVersion: %@, padtoolVersion: %@, prdVersion: %@, didStepUp: %@, passiveGestureAssessment: %@, passiveLivenessAssessment: %@, passiveLivenessFacVersion: %@, passiveLivenessFacePoseVersion: %@, passiveLivenessPadtoolVersion: %@, passiveLivenessPrdVersion: %@", v24, v27, v22, v26, v17, v25, v23, v21, v16, v20, v15, v13, v14, v12, v11, v10,
                  v3,
                  v4,
                  v5,
                  v6,
                  v7,
                  v8);

  return (NSString *)v19;
}

- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13 facVersion:(id)a14 facePoseVersion:(id)a15 padtoolVersion:(id)a16 prdVersion:(id)a17 didStepUp:(id)a18 passiveGestureAssessment:(id)a19 passiveLivenessAssessment:(id)a20 passiveLivenessFacVersion:(id)a21 passiveLivenessFacePoseVersion:(id)a22 passiveLivenessPadtoolVersion:(id)a23 passiveLivenessPrdVersion:(id)a24
{
  id v44 = a3;
  id obj = a4;
  id v59 = a4;
  id v41 = a5;
  id v58 = a5;
  id v42 = a6;
  id v57 = a6;
  id v43 = a7;
  id v56 = a7;
  id v55 = a8;
  id v54 = a9;
  id v53 = a10;
  id v52 = a11;
  id v51 = a12;
  id v50 = a13;
  id v49 = a14;
  unsigned int v29 = v44;
  id v48 = a15;
  id v47 = a16;
  id v46 = a17;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  id v33 = a21;
  id v34 = a22;
  id v35 = a23;
  id v36 = a24;
  v60.receiver = self;
  v60.super_class = (Class)BMWalletPaymentsCommerceUserProofingResult;
  id v37 = [(BMEventBase *)&v60 init];
  if (v37)
  {
    v37->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v44)
    {
      v37->_hasRaw_absoluteTimestamp = 1;
      [v44 timeIntervalSinceReferenceDate];
    }
    else
    {
      unsigned int v29 = 0;
      v37->_hasRaw_absoluteTimestamp = 0;
      double v38 = -1.0;
    }
    v37->_raw_absoluteTimestamp = v38;
    objc_storeStrong((id *)&v37->_age, obj);
    objc_storeStrong((id *)&v37->_gender, v41);
    objc_storeStrong((id *)&v37->_skinTone, v42);
    objc_storeStrong((id *)&v37->_ethnicity, v43);
    objc_storeStrong((id *)&v37->_deviceLanguage, a8);
    objc_storeStrong((id *)&v37->_proofingDecision, a9);
    objc_storeStrong((id *)&v37->_issuer, a10);
    objc_storeStrong((id *)&v37->_livenessAssessment, a11);
    objc_storeStrong((id *)&v37->_gestureAssessment, a12);
    objc_storeStrong((id *)&v37->_axSettings, a13);
    objc_storeStrong((id *)&v37->_facVersion, a14);
    objc_storeStrong((id *)&v37->_facePoseVersion, a15);
    objc_storeStrong((id *)&v37->_padtoolVersion, a16);
    objc_storeStrong((id *)&v37->_prdVersion, a17);
    if (v30)
    {
      v37->_hasDidStepUp = 1;
      v37->_didStepUp = [v30 BOOLValue];
    }
    else
    {
      v37->_hasDidStepUp = 0;
      v37->_didStepUp = 0;
    }
    objc_storeStrong((id *)&v37->_passiveGestureAssessment, a19);
    objc_storeStrong((id *)&v37->_passiveLivenessAssessment, a20);
    objc_storeStrong((id *)&v37->_passiveLivenessFacVersion, a21);
    objc_storeStrong((id *)&v37->_passiveLivenessFacePoseVersion, a22);
    objc_storeStrong((id *)&v37->_passiveLivenessPadtoolVersion, a23);
    objc_storeStrong((id *)&v37->_passiveLivenessPrdVersion, a24);
  }

  return v37;
}

+ (id)protoFields
{
  v26[22] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v26[0] = v25;
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"age" number:2 type:13 subMessageClass:0];
  v26[1] = v24;
  double v23 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"gender" number:3 type:13 subMessageClass:0];
  v26[2] = v23;
  unint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"skinTone" number:4 type:13 subMessageClass:0];
  v26[3] = v22;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ethnicity" number:5 type:13 subMessageClass:0];
  v26[4] = v21;
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceLanguage" number:6 type:13 subMessageClass:0];
  v26[5] = v20;
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"proofingDecision" number:7 type:13 subMessageClass:0];
  v26[6] = v19;
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"issuer" number:8 type:13 subMessageClass:0];
  v26[7] = v18;
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"livenessAssessment" number:9 type:13 subMessageClass:0];
  v26[8] = v17;
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"gestureAssessment" number:10 type:13 subMessageClass:0];
  v26[9] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"axSettings" number:11 type:13 subMessageClass:0];
  v26[10] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"facVersion" number:12 type:13 subMessageClass:0];
  v26[11] = v14;
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"facePoseVersion" number:13 type:13 subMessageClass:0];
  v26[12] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"padtoolVersion" number:14 type:13 subMessageClass:0];
  v26[13] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prdVersion" number:15 type:13 subMessageClass:0];
  v26[14] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"didStepUp" number:16 type:12 subMessageClass:0];
  v26[15] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passiveGestureAssessment" number:17 type:13 subMessageClass:0];
  v26[16] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passiveLivenessAssessment" number:18 type:13 subMessageClass:0];
  v26[17] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passiveLivenessFacVersion" number:19 type:13 subMessageClass:0];
  v26[18] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passiveLivenessFacePoseVersion" number:20 type:13 subMessageClass:0];
  v26[19] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passiveLivenessPadtoolVersion" number:21 type:13 subMessageClass:0];
  v26[20] = v9;
  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passiveLivenessPrdVersion" number:22 type:13 subMessageClass:0];
  v26[21] = v10;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:22];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF34C8;
}

+ (id)columns
{
  v26[22] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"age" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  double v23 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"gender" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"skinTone" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  unint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ethnicity" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceLanguage" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"proofingDecision" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  int v19 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"issuer" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"livenessAssessment" dataType:2 requestOnly:0 fieldNumber:9 protoDataType:13 convertedType:0];
  char v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"gestureAssessment" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"axSettings_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_3043];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"facVersion" dataType:2 requestOnly:0 fieldNumber:12 protoDataType:13 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"facePoseVersion" dataType:2 requestOnly:0 fieldNumber:13 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"padtoolVersion" dataType:2 requestOnly:0 fieldNumber:14 protoDataType:13 convertedType:0];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prdVersion" dataType:2 requestOnly:0 fieldNumber:15 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"didStepUp" dataType:0 requestOnly:0 fieldNumber:16 protoDataType:12 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passiveGestureAssessment" dataType:2 requestOnly:0 fieldNumber:17 protoDataType:13 convertedType:0];
  unsigned int v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passiveLivenessAssessment" dataType:2 requestOnly:0 fieldNumber:18 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passiveLivenessFacVersion" dataType:2 requestOnly:0 fieldNumber:19 protoDataType:13 convertedType:0];
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passiveLivenessFacePoseVersion" dataType:2 requestOnly:0 fieldNumber:20 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passiveLivenessPadtoolVersion" dataType:2 requestOnly:0 fieldNumber:21 protoDataType:13 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passiveLivenessPrdVersion" dataType:2 requestOnly:0 fieldNumber:22 protoDataType:13 convertedType:0];
  v26[0] = v25;
  v26[1] = v24;
  v26[2] = v23;
  v26[3] = v13;
  v26[4] = v22;
  v26[5] = v21;
  v26[6] = v20;
  v26[7] = v19;
  v26[8] = v18;
  v26[9] = v17;
  v26[10] = v16;
  v26[11] = v15;
  v26[12] = v2;
  v26[13] = v3;
  v26[14] = v14;
  v26[15] = v4;
  v26[16] = v5;
  v26[17] = v12;
  v26[18] = v6;
  v26[19] = v11;
  v26[20] = v7;
  v26[21] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:22];

  return v10;
}

id __53__BMWalletPaymentsCommerceUserProofingResult_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _axSettingsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMWalletPaymentsCommerceUserProofingResult alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[9] = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13 facVersion:(id)a14 facePoseVersion:(id)a15 padtoolVersion:(id)a16 prdVersion:(id)a17
{
  return -[BMWalletPaymentsCommerceUserProofingResult initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:didStepUp:passiveGestureAssessment:passiveLivenessAssessment:passiveLivenessFacVersion:passiveLivenessFacePoseVersion:passiveLivenessPadtoolVersion:passiveLivenessPrdVersion:](self, "initWithAbsoluteTimestamp:age:gender:skinTone:ethnicity:deviceLanguage:proofingDecision:issuer:livenessAssessment:gestureAssessment:axSettings:facVersion:facePoseVersion:padtoolVersion:prdVersion:didStepUp:passiveGestureAssessment:passiveLivenessAssessment:passiveLivenessFacVersion:passiveLivenessFacePoseVersion:passiveLivenessPadtoolVersion:passiveLivenessPrdVersion:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           0,
           0,
           0,
           0,
           0,
           0,
           0);
}

- (BMWalletPaymentsCommerceUserProofingResult)initWithAbsoluteTimestamp:(id)a3 age:(id)a4 gender:(id)a5 skinTone:(id)a6 ethnicity:(id)a7 deviceLanguage:(id)a8 proofingDecision:(id)a9 issuer:(id)a10 livenessAssessment:(id)a11 gestureAssessment:(id)a12 axSettings:(id)a13
{
  return [(BMWalletPaymentsCommerceUserProofingResult *)self initWithAbsoluteTimestamp:a3 age:a4 gender:a5 skinTone:a6 ethnicity:a7 deviceLanguage:a8 proofingDecision:a9 issuer:a10 livenessAssessment:a11 gestureAssessment:a12 axSettings:a13 facVersion:0 facePoseVersion:0 padtoolVersion:0 prdVersion:0];
}

@end