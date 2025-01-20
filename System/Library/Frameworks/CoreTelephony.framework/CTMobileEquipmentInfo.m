@interface CTMobileEquipmentInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTMobileEquipmentInfo)initWithCoder:(id)a3;
- (NSNumber)ERIVersion;
- (NSNumber)PRLVersion;
- (NSString)CSN;
- (NSString)EUIMID;
- (NSString)ICCID;
- (NSString)IMEI;
- (NSString)IMSI;
- (NSString)MEID;
- (NSString)MIN;
- (NSString)NAI;
- (NSString)baseId;
- (NSString)baseProfile;
- (NSString)baseVersion;
- (NSString)cdmaIMSI;
- (NSString)currentMobileId;
- (NSString)currentSubscriberId;
- (NSString)displayCSN;
- (NSString)effectiveICCID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)slotId;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseId:(id)a3;
- (void)setBaseProfile:(id)a3;
- (void)setBaseVersion:(id)a3;
- (void)setCSN:(id)a3;
- (void)setCdmaIMSI:(id)a3;
- (void)setCurrentMobileId:(id)a3;
- (void)setCurrentSubscriberId:(id)a3;
- (void)setDisplayCSN:(id)a3;
- (void)setERIVersion:(id)a3;
- (void)setEUIMID:(id)a3;
- (void)setEffectiveICCID:(id)a3;
- (void)setICCID:(id)a3;
- (void)setIMEI:(id)a3;
- (void)setIMSI:(id)a3;
- (void)setMEID:(id)a3;
- (void)setMIN:(id)a3;
- (void)setNAI:(id)a3;
- (void)setPRLVersion:(id)a3;
- (void)setSlotId:(int64_t)a3;
@end

@implementation CTMobileEquipmentInfo

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", slotID=%s", CTSubscriptionSlotAsString(-[CTMobileEquipmentInfo slotId](self, "slotId"))];
  v4 = [(CTMobileEquipmentInfo *)self currentMobileId];
  [v3 appendFormat:@", currentMobileId=%@", v4];

  v5 = [(CTMobileEquipmentInfo *)self currentSubscriberId];
  [v3 appendFormat:@", currentSubscriberId=%@", v5];

  v6 = [(CTMobileEquipmentInfo *)self IMEI];
  [v3 appendFormat:@", IMEI=%@", v6];

  v7 = [(CTMobileEquipmentInfo *)self ICCID];
  [v3 appendFormat:@", ICCID=%@", v7];

  v8 = [(CTMobileEquipmentInfo *)self IMSI];
  [v3 appendFormat:@", IMSI=%@", v8];

  v9 = [(CTMobileEquipmentInfo *)self cdmaIMSI];
  [v3 appendFormat:@", CDMA IMSI=%@", v9];

  v10 = [(CTMobileEquipmentInfo *)self MEID];
  [v3 appendFormat:@", CDMA MEID=%@", v10];

  v11 = [(CTMobileEquipmentInfo *)self EUIMID];
  [v3 appendFormat:@", CDMA EUIMID=%@", v11];

  v12 = [(CTMobileEquipmentInfo *)self PRLVersion];
  [v3 appendFormat:@", CDMA PRL Version=%@", v12];

  v13 = [(CTMobileEquipmentInfo *)self ERIVersion];
  [v3 appendFormat:@", CDMA ERI Version=%@", v13];

  v14 = [(CTMobileEquipmentInfo *)self MIN];
  [v3 appendFormat:@", CDMA MIN=%@", v14];

  v15 = [(CTMobileEquipmentInfo *)self NAI];
  [v3 appendFormat:@", CDMA NAI=%@", v15];

  v16 = [(CTMobileEquipmentInfo *)self baseVersion];
  [v3 appendFormat:@", baseVersion=%@", v16];

  v17 = [(CTMobileEquipmentInfo *)self baseId];
  [v3 appendFormat:@", baseId=%@", v17];

  v18 = [(CTMobileEquipmentInfo *)self baseProfile];
  [v3 appendFormat:@", baseProfile=%@", v18];

  v19 = [(CTMobileEquipmentInfo *)self effectiveICCID];
  [v3 appendFormat:@", effectiveICCID=%@", v19];

  v20 = [(CTMobileEquipmentInfo *)self CSN];
  [v3 appendFormat:@", CSN=%@", v20];

  v21 = [(CTMobileEquipmentInfo *)self displayCSN];
  [v3 appendFormat:@", displayCSN=%@", v21];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_65;
  }
  int64_t slotId = self->_slotId;
  if (slotId != [v4 slotId]) {
    goto LABEL_65;
  }
  currentMobileId = self->_currentMobileId;
  uint64_t v7 = [v4 currentMobileId];
  if (currentMobileId == (NSString *)v7)
  {
  }
  else
  {
    v8 = (void *)v7;
    v9 = self->_currentMobileId;
    v10 = [v4 currentMobileId];
    LODWORD(v9) = [(NSString *)v9 isEqualToString:v10];

    if (!v9) {
      goto LABEL_65;
    }
  }
  currentSubscriberId = self->_currentSubscriberId;
  uint64_t v12 = [v4 currentSubscriberId];
  if (currentSubscriberId == (NSString *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    v14 = self->_currentSubscriberId;
    v15 = [v4 currentSubscriberId];
    LODWORD(v14) = [(NSString *)v14 isEqualToString:v15];

    if (!v14) {
      goto LABEL_65;
    }
  }
  IMEI = self->_IMEI;
  uint64_t v17 = [v4 IMEI];
  if (IMEI == (NSString *)v17)
  {
  }
  else
  {
    v18 = (void *)v17;
    v19 = self->_IMEI;
    v20 = [v4 IMEI];
    LODWORD(v19) = [(NSString *)v19 isEqualToString:v20];

    if (!v19) {
      goto LABEL_65;
    }
  }
  ICCID = self->_ICCID;
  uint64_t v22 = [v4 ICCID];
  if (ICCID == (NSString *)v22)
  {
  }
  else
  {
    v23 = (void *)v22;
    v24 = self->_ICCID;
    v25 = [v4 ICCID];
    LODWORD(v24) = [(NSString *)v24 isEqualToString:v25];

    if (!v24) {
      goto LABEL_65;
    }
  }
  IMSI = self->_IMSI;
  uint64_t v27 = [v4 IMSI];
  if (IMSI == (NSString *)v27)
  {
  }
  else
  {
    v28 = (void *)v27;
    v29 = self->_IMSI;
    v30 = [v4 IMSI];
    LODWORD(v29) = [(NSString *)v29 isEqualToString:v30];

    if (!v29) {
      goto LABEL_65;
    }
  }
  cdmaIMSI = self->_cdmaIMSI;
  uint64_t v32 = [v4 cdmaIMSI];
  if (cdmaIMSI == (NSString *)v32)
  {
  }
  else
  {
    v33 = (void *)v32;
    v34 = self->_cdmaIMSI;
    v35 = [v4 cdmaIMSI];
    LODWORD(v34) = [(NSString *)v34 isEqualToString:v35];

    if (!v34) {
      goto LABEL_65;
    }
  }
  EUIMID = self->_EUIMID;
  uint64_t v37 = [v4 EUIMID];
  if (EUIMID == (NSString *)v37)
  {
  }
  else
  {
    v38 = (void *)v37;
    v39 = self->_EUIMID;
    v40 = [v4 EUIMID];
    LODWORD(v39) = [(NSString *)v39 isEqualToString:v40];

    if (!v39) {
      goto LABEL_65;
    }
  }
  PRLVersion = self->_PRLVersion;
  uint64_t v42 = [v4 PRLVersion];
  if (PRLVersion == (NSNumber *)v42)
  {
  }
  else
  {
    v43 = (void *)v42;
    v44 = self->_PRLVersion;
    v45 = [v4 PRLVersion];
    LODWORD(v44) = [(NSNumber *)v44 isEqual:v45];

    if (!v44) {
      goto LABEL_65;
    }
  }
  ERIVersion = self->_ERIVersion;
  uint64_t v47 = [v4 ERIVersion];
  if (ERIVersion == (NSNumber *)v47)
  {
  }
  else
  {
    v48 = (void *)v47;
    v49 = self->_ERIVersion;
    v50 = [v4 ERIVersion];
    LODWORD(v49) = [(NSNumber *)v49 isEqual:v50];

    if (!v49) {
      goto LABEL_65;
    }
  }
  MIN = self->_MIN;
  uint64_t v52 = [v4 MIN];
  if (MIN == (NSString *)v52)
  {
  }
  else
  {
    v53 = (void *)v52;
    v54 = self->_MIN;
    v55 = [v4 MIN];
    LODWORD(v54) = [(NSString *)v54 isEqualToString:v55];

    if (!v54) {
      goto LABEL_65;
    }
  }
  NAI = self->_NAI;
  uint64_t v57 = [v4 NAI];
  if (NAI == (NSString *)v57)
  {
  }
  else
  {
    v58 = (void *)v57;
    v59 = self->_NAI;
    v60 = [v4 NAI];
    LODWORD(v59) = [(NSString *)v59 isEqualToString:v60];

    if (!v59) {
      goto LABEL_65;
    }
  }
  baseVersion = self->_baseVersion;
  uint64_t v62 = [v4 baseVersion];
  if (baseVersion == (NSString *)v62)
  {
  }
  else
  {
    v63 = (void *)v62;
    v64 = self->_baseVersion;
    v65 = [v4 baseVersion];
    LODWORD(v64) = [(NSString *)v64 isEqualToString:v65];

    if (!v64) {
      goto LABEL_65;
    }
  }
  baseId = self->_baseId;
  uint64_t v67 = [v4 baseId];
  if (baseId == (NSString *)v67)
  {
  }
  else
  {
    v68 = (void *)v67;
    v69 = self->_baseId;
    v70 = [v4 baseId];
    LODWORD(v69) = [(NSString *)v69 isEqualToString:v70];

    if (!v69) {
      goto LABEL_65;
    }
  }
  baseProfile = self->_baseProfile;
  uint64_t v72 = [v4 baseProfile];
  if (baseProfile == (NSString *)v72)
  {
  }
  else
  {
    v73 = (void *)v72;
    v74 = self->_baseProfile;
    v75 = [v4 baseProfile];
    LODWORD(v74) = [(NSString *)v74 isEqualToString:v75];

    if (!v74) {
      goto LABEL_65;
    }
  }
  effectiveICCID = self->_effectiveICCID;
  uint64_t v77 = [v4 effectiveICCID];
  if (effectiveICCID == (NSString *)v77)
  {
  }
  else
  {
    v78 = (void *)v77;
    v79 = self->_effectiveICCID;
    v80 = [v4 effectiveICCID];
    LODWORD(v79) = [(NSString *)v79 isEqualToString:v80];

    if (!v79) {
      goto LABEL_65;
    }
  }
  CSN = self->_CSN;
  uint64_t v82 = [v4 CSN];
  if (CSN == (NSString *)v82)
  {
  }
  else
  {
    v83 = (void *)v82;
    v84 = self->_CSN;
    v85 = [v4 CSN];
    LODWORD(v84) = [(NSString *)v84 isEqualToString:v85];

    if (!v84)
    {
LABEL_65:
      char v86 = 0;
      goto LABEL_66;
    }
  }
  displayCSN = self->_displayCSN;
  uint64_t v89 = [v4 displayCSN];
  if (displayCSN == (NSString *)v89)
  {
    char v86 = 1;
  }
  else
  {
    v90 = (NSString *)v89;
    v91 = self->_displayCSN;
    v92 = [v4 displayCSN];
    char v86 = [(NSString *)v91 isEqualToString:v92];

    displayCSN = v90;
  }

LABEL_66:
  return v86;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSlotId:", -[CTMobileEquipmentInfo slotId](self, "slotId"));
  v5 = [(CTMobileEquipmentInfo *)self currentMobileId];
  v6 = (void *)[v5 copy];
  [v4 setCurrentMobileId:v6];

  uint64_t v7 = [(CTMobileEquipmentInfo *)self currentSubscriberId];
  v8 = (void *)[v7 copy];
  [v4 setCurrentSubscriberId:v8];

  v9 = [(CTMobileEquipmentInfo *)self IMEI];
  v10 = (void *)[v9 copy];
  [v4 setIMEI:v10];

  v11 = [(CTMobileEquipmentInfo *)self ICCID];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setICCID:v12];

  v13 = [(CTMobileEquipmentInfo *)self IMSI];
  v14 = (void *)[v13 copy];
  [v4 setIMSI:v14];

  v15 = [(CTMobileEquipmentInfo *)self cdmaIMSI];
  v16 = (void *)[v15 copy];
  [v4 setCdmaIMSI:v16];

  uint64_t v17 = [(CTMobileEquipmentInfo *)self MEID];
  v18 = (void *)[v17 copy];
  [v4 setMEID:v18];

  v19 = [(CTMobileEquipmentInfo *)self EUIMID];
  v20 = (void *)[v19 copy];
  [v4 setEUIMID:v20];

  v21 = [(CTMobileEquipmentInfo *)self PRLVersion];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setPRLVersion:v22];

  v23 = [(CTMobileEquipmentInfo *)self ERIVersion];
  v24 = (void *)[v23 copy];
  [v4 setERIVersion:v24];

  v25 = [(CTMobileEquipmentInfo *)self MIN];
  v26 = (void *)[v25 copy];
  [v4 setMIN:v26];

  uint64_t v27 = [(CTMobileEquipmentInfo *)self NAI];
  v28 = (void *)[v27 copy];
  [v4 setNAI:v28];

  v29 = [(CTMobileEquipmentInfo *)self baseVersion];
  v30 = (void *)[v29 copy];
  [v4 setBaseVersion:v30];

  v31 = [(CTMobileEquipmentInfo *)self baseId];
  uint64_t v32 = (void *)[v31 copy];
  [v4 setBaseId:v32];

  v33 = [(CTMobileEquipmentInfo *)self baseProfile];
  v34 = (void *)[v33 copy];
  [v4 setBaseProfile:v34];

  v35 = [(CTMobileEquipmentInfo *)self effectiveICCID];
  v36 = (void *)[v35 copy];
  [v4 setEffectiveICCID:v36];

  uint64_t v37 = [(CTMobileEquipmentInfo *)self CSN];
  v38 = (void *)[v37 copy];
  [v4 setCSN:v38];

  v39 = [(CTMobileEquipmentInfo *)self displayCSN];
  v40 = (void *)[v39 copy];
  [v4 setDisplayCSN:v40];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTMobileEquipmentInfo slotId](self, "slotId"), @"slotId");
  v5 = [(CTMobileEquipmentInfo *)self currentMobileId];
  [v4 encodeObject:v5 forKey:@"currentMobileId"];

  v6 = [(CTMobileEquipmentInfo *)self currentSubscriberId];
  [v4 encodeObject:v6 forKey:@"currentSubscriberId"];

  uint64_t v7 = [(CTMobileEquipmentInfo *)self IMEI];
  [v4 encodeObject:v7 forKey:@"IMEI"];

  v8 = [(CTMobileEquipmentInfo *)self ICCID];
  [v4 encodeObject:v8 forKey:@"ICCID"];

  v9 = [(CTMobileEquipmentInfo *)self IMSI];
  [v4 encodeObject:v9 forKey:@"IMSI"];

  v10 = [(CTMobileEquipmentInfo *)self cdmaIMSI];
  [v4 encodeObject:v10 forKey:@"cdmaIMSI"];

  v11 = [(CTMobileEquipmentInfo *)self MEID];
  [v4 encodeObject:v11 forKey:@"MEID"];

  uint64_t v12 = [(CTMobileEquipmentInfo *)self EUIMID];
  [v4 encodeObject:v12 forKey:@"EUIMID"];

  v13 = [(CTMobileEquipmentInfo *)self PRLVersion];
  [v4 encodeObject:v13 forKey:@"PRLVersion"];

  v14 = [(CTMobileEquipmentInfo *)self ERIVersion];
  [v4 encodeObject:v14 forKey:@"ERIVersion"];

  v15 = [(CTMobileEquipmentInfo *)self MIN];
  [v4 encodeObject:v15 forKey:@"MIN"];

  v16 = [(CTMobileEquipmentInfo *)self NAI];
  [v4 encodeObject:v16 forKey:@"NAI"];

  uint64_t v17 = [(CTMobileEquipmentInfo *)self baseVersion];
  [v4 encodeObject:v17 forKey:@"baseVersion"];

  v18 = [(CTMobileEquipmentInfo *)self baseId];
  [v4 encodeObject:v18 forKey:@"baseId"];

  v19 = [(CTMobileEquipmentInfo *)self baseProfile];
  [v4 encodeObject:v19 forKey:@"baseProfile"];

  v20 = [(CTMobileEquipmentInfo *)self effectiveICCID];
  [v4 encodeObject:v20 forKey:@"effectiveICCID"];

  v21 = [(CTMobileEquipmentInfo *)self CSN];
  [v4 encodeObject:v21 forKey:@"CSN"];

  id v22 = [(CTMobileEquipmentInfo *)self displayCSN];
  [v4 encodeObject:v22 forKey:@"displayCSN"];
}

- (CTMobileEquipmentInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CTMobileEquipmentInfo;
  v5 = [(CTMobileEquipmentInfo *)&v43 init];
  if (v5)
  {
    v5->_int64_t slotId = [v4 decodeIntegerForKey:@"slotId"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentMobileId"];
    currentMobileId = v5->_currentMobileId;
    v5->_currentMobileId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentSubscriberId"];
    currentSubscriberId = v5->_currentSubscriberId;
    v5->_currentSubscriberId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IMEI"];
    IMEI = v5->_IMEI;
    v5->_IMEI = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICCID"];
    ICCID = v5->_ICCID;
    v5->_ICCID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IMSI"];
    IMSI = v5->_IMSI;
    v5->_IMSI = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cdmaIMSI"];
    cdmaIMSI = v5->_cdmaIMSI;
    v5->_cdmaIMSI = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MEID"];
    MEID = v5->_MEID;
    v5->_MEID = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EUIMID"];
    EUIMID = v5->_EUIMID;
    v5->_EUIMID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PRLVersion"];
    PRLVersion = v5->_PRLVersion;
    v5->_PRLVersion = (NSNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ERIVersion"];
    ERIVersion = v5->_ERIVersion;
    v5->_ERIVersion = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MIN"];
    MIN = v5->_MIN;
    v5->_MIN = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NAI"];
    NAI = v5->_NAI;
    v5->_NAI = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseVersion"];
    baseVersion = v5->_baseVersion;
    v5->_baseVersion = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseId"];
    baseId = v5->_baseId;
    v5->_baseId = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseProfile"];
    baseProfile = v5->_baseProfile;
    v5->_baseProfile = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectiveICCID"];
    effectiveICCID = v5->_effectiveICCID;
    v5->_effectiveICCID = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CSN"];
    CSN = v5->_CSN;
    v5->_CSN = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayCSN"];
    displayCSN = v5->_displayCSN;
    v5->_displayCSN = (NSString *)v40;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)slotId
{
  return self->_slotId;
}

- (void)setSlotId:(int64_t)a3
{
  self->_int64_t slotId = a3;
}

- (NSString)currentMobileId
{
  return self->_currentMobileId;
}

- (void)setCurrentMobileId:(id)a3
{
}

- (NSString)currentSubscriberId
{
  return self->_currentSubscriberId;
}

- (void)setCurrentSubscriberId:(id)a3
{
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (void)setIMEI:(id)a3
{
}

- (NSString)ICCID
{
  return self->_ICCID;
}

- (void)setICCID:(id)a3
{
}

- (NSString)IMSI
{
  return self->_IMSI;
}

- (void)setIMSI:(id)a3
{
}

- (NSString)cdmaIMSI
{
  return self->_cdmaIMSI;
}

- (void)setCdmaIMSI:(id)a3
{
}

- (NSString)MEID
{
  return self->_MEID;
}

- (void)setMEID:(id)a3
{
}

- (NSString)EUIMID
{
  return self->_EUIMID;
}

- (void)setEUIMID:(id)a3
{
}

- (NSNumber)PRLVersion
{
  return self->_PRLVersion;
}

- (void)setPRLVersion:(id)a3
{
}

- (NSNumber)ERIVersion
{
  return self->_ERIVersion;
}

- (void)setERIVersion:(id)a3
{
}

- (NSString)MIN
{
  return self->_MIN;
}

- (void)setMIN:(id)a3
{
}

- (NSString)NAI
{
  return self->_NAI;
}

- (void)setNAI:(id)a3
{
}

- (NSString)baseVersion
{
  return self->_baseVersion;
}

- (void)setBaseVersion:(id)a3
{
}

- (NSString)baseId
{
  return self->_baseId;
}

- (void)setBaseId:(id)a3
{
}

- (NSString)baseProfile
{
  return self->_baseProfile;
}

- (void)setBaseProfile:(id)a3
{
}

- (NSString)effectiveICCID
{
  return self->_effectiveICCID;
}

- (void)setEffectiveICCID:(id)a3
{
}

- (NSString)CSN
{
  return self->_CSN;
}

- (void)setCSN:(id)a3
{
}

- (NSString)displayCSN
{
  return self->_displayCSN;
}

- (void)setDisplayCSN:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayCSN, 0);
  objc_storeStrong((id *)&self->_CSN, 0);
  objc_storeStrong((id *)&self->_effectiveICCID, 0);
  objc_storeStrong((id *)&self->_baseProfile, 0);
  objc_storeStrong((id *)&self->_baseId, 0);
  objc_storeStrong((id *)&self->_baseVersion, 0);
  objc_storeStrong((id *)&self->_NAI, 0);
  objc_storeStrong((id *)&self->_MIN, 0);
  objc_storeStrong((id *)&self->_ERIVersion, 0);
  objc_storeStrong((id *)&self->_PRLVersion, 0);
  objc_storeStrong((id *)&self->_EUIMID, 0);
  objc_storeStrong((id *)&self->_MEID, 0);
  objc_storeStrong((id *)&self->_cdmaIMSI, 0);
  objc_storeStrong((id *)&self->_IMSI, 0);
  objc_storeStrong((id *)&self->_ICCID, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_currentSubscriberId, 0);

  objc_storeStrong((id *)&self->_currentMobileId, 0);
}

@end