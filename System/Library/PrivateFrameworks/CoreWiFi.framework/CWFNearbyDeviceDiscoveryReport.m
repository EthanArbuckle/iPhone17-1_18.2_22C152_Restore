@interface CWFNearbyDeviceDiscoveryReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNDDParameters:(id)a3;
- (BOOL)isLowConfidence;
- (CWFNearbyDeviceDiscoveryReport)init;
- (CWFNearbyDeviceDiscoveryReport)initWithCoder:(id)a3;
- (NSArray)rssi;
- (NSDate)timeStamp;
- (NSString)macId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)band;
- (int64_t)bandwidth;
- (int64_t)channel;
- (int64_t)frameType;
- (int64_t)rateMbps;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBand:(int64_t)a3;
- (void)setBandwidth:(int64_t)a3;
- (void)setChannel:(int64_t)a3;
- (void)setFrameType:(int64_t)a3;
- (void)setIsLowConfidence:(BOOL)a3;
- (void)setMacId:(id)a3;
- (void)setRateMbps:(int64_t)a3;
- (void)setRssi:(id)a3;
- (void)setTimeStamp:(id)a3;
@end

@implementation CWFNearbyDeviceDiscoveryReport

- (CWFNearbyDeviceDiscoveryReport)init
{
  v12.receiver = self;
  v12.super_class = (Class)CWFNearbyDeviceDiscoveryReport;
  v6 = [(CWFNearbyDeviceDiscoveryReport *)&v12 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v2, v3, v4, v5);
    v8 = (void *)*((void *)v6 + 2);
    *((void *)v6 + 2) = v7;

    v9 = (void *)*((void *)v6 + 3);
    *((void *)v6 + 3) = 0;

    v10 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = 0;

    v6[8] = 0;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((void *)v6 + 9) = 0;
  }
  return (CWFNearbyDeviceDiscoveryReport *)v6;
}

- (id)description
{
  v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  objc_msgSend_appendFormat_(v6, v7, @"timeStamp=%@, ", v8, v9, self->_timeStamp);
  objc_msgSend_appendFormat_(v6, v10, @"macId=%@, ", v11, v12, self->_macId);
  if (objc_msgSend_count(self->_rssi, v13, v14, v15, v16))
  {
    unint64_t v20 = 0;
    do
    {
      v21 = objc_msgSend_objectAtIndexedSubscript_(self->_rssi, v17, v20, v18, v19);
      objc_msgSend_appendFormat_(v6, v22, @"rssi%d = %@, ", v23, v24, v20, v21);

      ++v20;
    }
    while (v20 < objc_msgSend_count(self->_rssi, v25, v26, v27, v28));
  }
  objc_msgSend_appendFormat_(v6, v17, @"frameType=%ld, ", v18, v19, self->_frameType);
  objc_msgSend_appendFormat_(v6, v29, @"bandwidth=%ld, ", v30, v31, self->_bandwidth);
  objc_msgSend_appendFormat_(v6, v32, @"channel=%ld, ", v33, v34, self->_channel);
  objc_msgSend_appendFormat_(v6, v35, @"band=%ld, ", v36, v37, self->_band);
  objc_msgSend_appendFormat_(v6, v38, @"rateMbps=%ld, ", v39, v40, self->_rateMbps);
  objc_msgSend_appendFormat_(v6, v41, @"isLowConfidence=%d, ", v42, v43, self->_isLowConfidence);
  return v6;
}

- (BOOL)isEqualToNDDParameters:(id)a3
{
  id v5 = a3;
  timeStamp = self->_timeStamp;
  objc_msgSend_timeStamp(v5, v7, v8, v9, v10);
  uint64_t v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (timeStamp != v15)
  {
    if (!self->_timeStamp
      || (objc_msgSend_timeStamp(v5, v11, v12, v13, v14), (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v26 = 0;
      goto LABEL_36;
    }
    uint64_t v3 = (void *)v16;
    v21 = self->_timeStamp;
    v22 = objc_msgSend_timeStamp(v5, v17, v18, v19, v20);
    if (!objc_msgSend_isEqual_(v21, v23, (uint64_t)v22, v24, v25))
    {
      BOOL v26 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v93 = v22;
  }
  macId = self->_macId;
  objc_msgSend_macId(v5, v11, v12, v13, v14);
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (macId != v32)
  {
    if (!self->_macId || (objc_msgSend_macId(v5, v28, v29, v30, v31), (uint64_t v33 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v26 = 0;
LABEL_13:
      v22 = v93;
      goto LABEL_34;
    }
    v38 = (void *)v33;
    uint64_t v39 = self->_macId;
    uint64_t v40 = objc_msgSend_macId(v5, v34, v35, v36, v37);
    if ((objc_msgSend_isEqual_(v39, v41, (uint64_t)v40, v42, v43) & 1) == 0)
    {

      BOOL v26 = 0;
      goto LABEL_38;
    }
    v91 = v40;
    v92 = v38;
  }
  rssi = self->_rssi;
  objc_msgSend_rssi(v5, v28, v29, v30, v31);
  v49 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (rssi != v49)
  {
    if (!self->_rssi) {
      goto LABEL_30;
    }
    uint64_t v50 = objc_msgSend_rssi(v5, v45, v46, v47, v48);
    if (!v50)
    {
LABEL_29:

      BOOL v26 = 0;
      goto LABEL_32;
    }
    v90 = (void *)v50;
    v55 = self->_rssi;
    uint64_t v56 = objc_msgSend_rssi(v5, v51, v52, v53, v54);
    v57 = v55;
    v58 = (void *)v56;
    if (!objc_msgSend_isEqual_(v57, v59, v56, v60, v61))
    {
      BOOL v26 = 0;
LABEL_41:

      if (macId != v32)
      {

        goto LABEL_13;
      }

LABEL_38:
      v22 = v93;
      if (timeStamp == v15) {
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    v89 = v58;
  }
  int64_t frameType = self->_frameType;
  if (frameType == objc_msgSend_frameType(v5, v45, v46, v47, v48))
  {
    int64_t bandwidth = self->_bandwidth;
    if (bandwidth == objc_msgSend_bandwidth(v5, v63, v64, v65, v66))
    {
      int64_t channel = self->_channel;
      if (channel == objc_msgSend_channel(v5, v68, v69, v70, v71))
      {
        int64_t band = self->_band;
        if (band == objc_msgSend_band(v5, v73, v74, v75, v76))
        {
          int64_t rateMbps = self->_rateMbps;
          if (rateMbps == objc_msgSend_rateMbps(v5, v78, v79, v80, v81))
          {
            int isLowConfidence = self->_isLowConfidence;
            BOOL v26 = isLowConfidence == objc_msgSend_isLowConfidence(v5, v83, v84, v85, v86);
            v58 = v89;
            if (rssi == v49) {
              goto LABEL_31;
            }
            goto LABEL_41;
          }
        }
      }
    }
  }
  if (rssi != v49)
  {

    goto LABEL_29;
  }
LABEL_30:
  BOOL v26 = 0;
LABEL_31:

LABEL_32:
  v22 = v93;
  if (macId != v32)
  {
  }
LABEL_34:

  if (timeStamp != v15) {
    goto LABEL_35;
  }
LABEL_36:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFNearbyDeviceDiscoveryReport *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char isEqualToNDDParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToNDDParameters = objc_msgSend_isEqualToNDDParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToNDDParameters = 0;
  }

  return isEqualToNDDParameters;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_timeStamp, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(self->_macId, v7, v8, v9, v10) ^ v6;
  uint64_t v16 = v11 ^ objc_msgSend_hash(self->_rssi, v12, v13, v14, v15);
  uint64_t v20 = objc_msgSend_numberWithInteger_(NSNumber, v17, self->_frameType, v18, v19);
  uint64_t v25 = v16 ^ objc_msgSend_hash(v20, v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_numberWithInteger_(NSNumber, v26, self->_bandwidth, v27, v28);
  uint64_t v34 = objc_msgSend_hash(v29, v30, v31, v32, v33);
  v38 = objc_msgSend_numberWithInteger_(NSNumber, v35, self->_channel, v36, v37);
  uint64_t v43 = v25 ^ v34 ^ objc_msgSend_hash(v38, v39, v40, v41, v42);
  uint64_t v47 = objc_msgSend_numberWithInteger_(NSNumber, v44, self->_band, v45, v46);
  uint64_t v52 = objc_msgSend_hash(v47, v48, v49, v50, v51);
  uint64_t v56 = objc_msgSend_numberWithInteger_(NSNumber, v53, self->_rateMbps, v54, v55);
  uint64_t v61 = v52 ^ objc_msgSend_hash(v56, v57, v58, v59, v60);
  uint64_t v65 = objc_msgSend_numberWithBool_(NSNumber, v62, self->_isLowConfidence, v63, v64);
  unint64_t v70 = v43 ^ v61 ^ objc_msgSend_hash(v65, v66, v67, v68, v69);

  return v70;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFNearbyDeviceDiscoveryReport, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setTimeStamp_(v11, v12, (uint64_t)self->_timeStamp, v13, v14);
  objc_msgSend_setMacId_(v11, v15, (uint64_t)self->_macId, v16, v17);
  objc_msgSend_setRssi_(v11, v18, (uint64_t)self->_rssi, v19, v20);
  objc_msgSend_setFrameType_(v11, v21, self->_frameType, v22, v23);
  objc_msgSend_setBandwidth_(v11, v24, self->_bandwidth, v25, v26);
  objc_msgSend_setChannel_(v11, v27, self->_channel, v28, v29);
  objc_msgSend_setBand_(v11, v30, self->_band, v31, v32);
  objc_msgSend_setRateMbps_(v11, v33, self->_rateMbps, v34, v35);
  objc_msgSend_setIsLowConfidence_(v11, v36, self->_isLowConfidence, v37, v38);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  timeStamp = self->_timeStamp;
  id v23 = a3;
  objc_msgSend_encodeObject_forKey_(v23, v5, (uint64_t)timeStamp, @"_timeStamp", v6);
  objc_msgSend_encodeObject_forKey_(v23, v7, (uint64_t)self->_macId, @"_macId", v8);
  objc_msgSend_encodeObject_forKey_(v23, v9, (uint64_t)self->_rssi, @"_rssi", v10);
  objc_msgSend_encodeInteger_forKey_(v23, v11, self->_frameType, @"_frameType", v12);
  objc_msgSend_encodeInteger_forKey_(v23, v13, self->_bandwidth, @"_bandwidth", v14);
  objc_msgSend_encodeInteger_forKey_(v23, v15, self->_channel, @"_channel", v16);
  objc_msgSend_encodeInteger_forKey_(v23, v17, self->_band, @"_band", v18);
  objc_msgSend_encodeInteger_forKey_(v23, v19, self->_rateMbps, @"_rateMbps", v20);
  objc_msgSend_encodeBool_forKey_(v23, v21, self->_isLowConfidence, @"_isLowConfidence", v22);
}

- (CWFNearbyDeviceDiscoveryReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CWFNearbyDeviceDiscoveryReport;
  id v5 = [(CWFNearbyDeviceDiscoveryReport *)&v56 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v11 = objc_msgSend_setWithObjects_(v6, v8, v7, v9, v10, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v12, (uint64_t)v11, @"_timeStamp", v13);
    timeStamp = v5->_timeStamp;
    v5->_timeStamp = (NSDate *)v14;

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v21 = objc_msgSend_setWithObjects_(v16, v18, v17, v19, v20, 0);
    uint64_t v24 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, @"_macId", v23);
    macId = v5->_macId;
    v5->_macId = (NSString *)v24;

    uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v32 = objc_msgSend_setWithObjects_(v26, v29, v27, v30, v31, v28, 0);
    uint64_t v35 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v33, (uint64_t)v32, @"_rssi", v34);
    rssi = v5->_rssi;
    v5->_rssi = (NSArray *)v35;

    v5->_int64_t frameType = objc_msgSend_decodeIntegerForKey_(v4, v37, @"_frameType", v38, v39);
    v5->_int64_t bandwidth = objc_msgSend_decodeIntegerForKey_(v4, v40, @"_bandwidth", v41, v42);
    v5->_int64_t channel = objc_msgSend_decodeIntegerForKey_(v4, v43, @"_channel", v44, v45);
    v5->_int64_t band = objc_msgSend_decodeIntegerForKey_(v4, v46, @"_band", v47, v48);
    v5->_int64_t rateMbps = objc_msgSend_decodeIntegerForKey_(v4, v49, @"_rateMbps", v50, v51);
    v5->_int isLowConfidence = objc_msgSend_decodeIntegerForKey_(v4, v52, @"_isLowConfidence", v53, v54) != 0;
  }

  return v5;
}

- (NSDate)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(id)a3
{
}

- (NSString)macId
{
  return self->_macId;
}

- (void)setMacId:(id)a3
{
}

- (NSArray)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
}

- (int64_t)frameType
{
  return self->_frameType;
}

- (void)setFrameType:(int64_t)a3
{
  self->_int64_t frameType = a3;
}

- (int64_t)bandwidth
{
  return self->_bandwidth;
}

- (void)setBandwidth:(int64_t)a3
{
  self->_int64_t bandwidth = a3;
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_int64_t channel = a3;
}

- (int64_t)band
{
  return self->_band;
}

- (void)setBand:(int64_t)a3
{
  self->_int64_t band = a3;
}

- (int64_t)rateMbps
{
  return self->_rateMbps;
}

- (void)setRateMbps:(int64_t)a3
{
  self->_int64_t rateMbps = a3;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void)setIsLowConfidence:(BOOL)a3
{
  self->_int isLowConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_macId, 0);
  objc_storeStrong((id *)&self->_timeStamp, 0);
}

@end