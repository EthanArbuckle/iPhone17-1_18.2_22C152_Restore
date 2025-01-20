@interface CWFLinkChangeStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLinkChangeStatus:(id)a3;
- (BOOL)isInvoluntaryLinkDown;
- (BOOL)isLinkDown;
- (BOOL)isLinkDownDebounceInProgress;
- (CWFLinkChangeStatus)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (NSString)interfaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)reason;
- (int64_t)RSSI;
- (int64_t)noise;
- (int64_t)subreason;
- (unint64_t)CCA;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCCA:(unint64_t)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInvoluntaryLinkDown:(BOOL)a3;
- (void)setLinkDown:(BOOL)a3;
- (void)setLinkDownDebounceInProgress:(BOOL)a3;
- (void)setNoise:(int64_t)a3;
- (void)setRSSI:(int64_t)a3;
- (void)setReason:(int)a3;
- (void)setSubreason:(int64_t)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation CWFLinkChangeStatus

- (id)description
{
  v3 = NSString;
  if (self->_linkDown)
  {
    if (self->_involuntaryLinkDown) {
      v4 = "down (involuntary)";
    }
    else {
      v4 = "down";
    }
  }
  else
  {
    v4 = "up";
  }
  interfaceName = self->_interfaceName;
  v6 = sub_1B4F3D76C(self->_timestamp);
  v10 = objc_msgSend_stringWithFormat_(v3, v7, @"link %s,  intf=%@ timestamp=%@ reason=%d sub=%ld debounce=%d rssi=%ld noise=%ld cca=%lu", v8, v9, v4, interfaceName, v6, self->_reason, self->_subreason, self->_linkDownDebounceInProgress, self->_RSSI, self->_noise, self->_CCA);

  return v10;
}

- (BOOL)isEqualToLinkChangeStatus:(id)a3
{
  id v7 = a3;
  interfaceName = self->_interfaceName;
  objc_msgSend_interfaceName(v7, v9, v10, v11, v12);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (interfaceName != v17)
  {
    if (!self->_interfaceName
      || (objc_msgSend_interfaceName(v7, v13, v14, v15, v16), (uint64_t v18 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v27 = 0;
      goto LABEL_30;
    }
    v3 = (void *)v18;
    v23 = self->_interfaceName;
    v4 = objc_msgSend_interfaceName(v7, v19, v20, v21, v22);
    if (!objc_msgSend_isEqual_(v23, v24, (uint64_t)v4, v25, v26))
    {
      BOOL v27 = 0;
LABEL_29:

      goto LABEL_30;
    }
  }
  timestamp = self->_timestamp;
  objc_msgSend_timestamp(v7, v13, v14, v15, v16);
  v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (timestamp != v33)
  {
    if (!self->_timestamp) {
      goto LABEL_24;
    }
    uint64_t v34 = objc_msgSend_timestamp(v7, v29, v30, v31, v32);
    if (!v34)
    {
LABEL_23:

      BOOL v27 = 0;
      goto LABEL_28;
    }
    v5 = (void *)v34;
    v39 = self->_timestamp;
    uint64_t v40 = objc_msgSend_timestamp(v7, v35, v36, v37, v38);
    v41 = v39;
    v42 = (void *)v40;
    if (!objc_msgSend_isEqual_(v41, v43, v40, v44, v45))
    {
      BOOL v27 = 0;
LABEL_26:

      goto LABEL_27;
    }
    v83 = v42;
  }
  int linkDown = self->_linkDown;
  if (linkDown == objc_msgSend_isLinkDown(v7, v29, v30, v31, v32))
  {
    int involuntaryLinkDown = self->_involuntaryLinkDown;
    if (involuntaryLinkDown == objc_msgSend_isInvoluntaryLinkDown(v7, v47, v48, v49, v50))
    {
      int reason = self->_reason;
      if (reason == objc_msgSend_reason(v7, v52, v53, v54, v55))
      {
        subint reason = self->_subreason;
        if (subreason == objc_msgSend_subreason(v7, v57, v58, v59, v60))
        {
          int linkDownDebounceInProgress = self->_linkDownDebounceInProgress;
          if (linkDownDebounceInProgress == objc_msgSend_isLinkDownDebounceInProgress(v7, v62, v63, v64, v65))
          {
            int64_t RSSI = self->_RSSI;
            if (RSSI == objc_msgSend_RSSI(v7, v67, v68, v69, v70))
            {
              int64_t noise = self->_noise;
              if (noise == objc_msgSend_noise(v7, v72, v73, v74, v75))
              {
                unint64_t CCA = self->_CCA;
                BOOL v27 = CCA == objc_msgSend_CCA(v7, v77, v78, v79, v80);
                v42 = v83;
                if (timestamp == v33) {
                  goto LABEL_27;
                }
                goto LABEL_26;
              }
            }
          }
        }
      }
    }
  }
  if (timestamp != v33)
  {

    goto LABEL_23;
  }
LABEL_24:
  BOOL v27 = 0;
LABEL_27:

LABEL_28:
  if (interfaceName != v17) {
    goto LABEL_29;
  }
LABEL_30:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CWFLinkChangeStatus *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v9 = objc_msgSend_isEqualToLinkChangeStatus_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_interfaceName, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_timestamp, v7, v8, v9, v10);
  int8x16_t v12 = veorq_s8(*(int8x16_t *)&self->_subreason, *(int8x16_t *)&self->_noise);
  return *(unint64_t *)&veor_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) ^ self->_linkDown ^ self->_involuntaryLinkDown ^ self->_linkDownDebounceInProgress ^ v11 ^ self->_reason ^ v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFLinkChangeStatus, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setInterfaceName_(v11, v12, (uint64_t)self->_interfaceName, v13, v14);
  objc_msgSend_setLinkDown_(v11, v15, self->_linkDown, v16, v17);
  objc_msgSend_setInvoluntaryLinkDown_(v11, v18, self->_involuntaryLinkDown, v19, v20);
  objc_msgSend_setTimestamp_(v11, v21, (uint64_t)self->_timestamp, v22, v23);
  objc_msgSend_setReason_(v11, v24, self->_reason, v25, v26);
  objc_msgSend_setSubreason_(v11, v27, self->_subreason, v28, v29);
  objc_msgSend_setLinkDownDebounceInProgress_(v11, v30, self->_linkDownDebounceInProgress, v31, v32);
  objc_msgSend_setRSSI_(v11, v33, self->_RSSI, v34, v35);
  objc_msgSend_setNoise_(v11, v36, self->_noise, v37, v38);
  objc_msgSend_setCCA_(v11, v39, self->_CCA, v40, v41);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  interfaceName = self->_interfaceName;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)interfaceName, @"_interfaceName", v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_timestamp, @"_timestamp", v9);
  objc_msgSend_encodeBool_forKey_(v5, v10, self->_linkDown, @"_linkDown", v11);
  objc_msgSend_encodeBool_forKey_(v5, v12, self->_involuntaryLinkDown, @"_involuntaryLinkDown", v13);
  objc_msgSend_encodeInteger_forKey_(v5, v14, self->_reason, @"_reason", v15);
  objc_msgSend_encodeInteger_forKey_(v5, v16, self->_subreason, @"_subreason", v17);
  objc_msgSend_encodeBool_forKey_(v5, v18, self->_linkDownDebounceInProgress, @"_linkDownDebounceInProgress", v19);
  objc_msgSend_encodeInteger_forKey_(v5, v20, self->_RSSI, @"_RSSI", v21);
  objc_msgSend_encodeInteger_forKey_(v5, v22, self->_noise, @"_noise", v23);
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, v24, self->_CCA, v25, v26);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v27, (uint64_t)v29, @"_CCA", v28);
}

- (CWFLinkChangeStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CWFLinkChangeStatus;
  id v5 = [(CWFLinkChangeStatus *)&v46 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_interfaceName", v8);
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_timestamp", v13);
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v14;

    v5->_int linkDown = objc_msgSend_decodeBoolForKey_(v4, v16, @"_linkDown", v17, v18);
    v5->_int involuntaryLinkDown = objc_msgSend_decodeBoolForKey_(v4, v19, @"_involuntaryLinkDown", v20, v21);
    v5->_int reason = objc_msgSend_decodeIntegerForKey_(v4, v22, @"_reason", v23, v24);
    v5->_subint reason = objc_msgSend_decodeIntegerForKey_(v4, v25, @"_subreason", v26, v27);
    v5->_int linkDownDebounceInProgress = objc_msgSend_decodeBoolForKey_(v4, v28, @"_linkDownDebounceInProgress", v29, v30);
    v5->_int64_t RSSI = objc_msgSend_decodeIntegerForKey_(v4, v31, @"_RSSI", v32, v33);
    v5->_int64_t noise = objc_msgSend_decodeIntegerForKey_(v4, v34, @"_noise", v35, v36);
    uint64_t v37 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v38, v37, @"_CCA", v39);
    v5->_unint64_t CCA = objc_msgSend_unsignedIntegerValue(v40, v41, v42, v43, v44);
  }
  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (BOOL)isLinkDown
{
  return self->_linkDown;
}

- (void)setLinkDown:(BOOL)a3
{
  self->_int linkDown = a3;
}

- (BOOL)isLinkDownDebounceInProgress
{
  return self->_linkDownDebounceInProgress;
}

- (void)setLinkDownDebounceInProgress:(BOOL)a3
{
  self->_int linkDownDebounceInProgress = a3;
}

- (BOOL)isInvoluntaryLinkDown
{
  return self->_involuntaryLinkDown;
}

- (void)setInvoluntaryLinkDown:(BOOL)a3
{
  self->_int involuntaryLinkDown = a3;
}

- (int)reason
{
  return self->_reason;
}

- (void)setReason:(int)a3
{
  self->_int reason = a3;
}

- (int64_t)subreason
{
  return self->_subreason;
}

- (void)setSubreason:(int64_t)a3
{
  self->_subint reason = a3;
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (void)setRSSI:(int64_t)a3
{
  self->_int64_t RSSI = a3;
}

- (int64_t)noise
{
  return self->_noise;
}

- (void)setNoise:(int64_t)a3
{
  self->_int64_t noise = a3;
}

- (unint64_t)CCA
{
  return self->_CCA;
}

- (void)setCCA:(unint64_t)a3
{
  self->_unint64_t CCA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end