@interface CWFAWDLPeerAssistedDiscoveryParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)followMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAWDLParameters:(id)a3;
- (CWFAWDLPeerAssistedDiscoveryParameters)initWithCoder:(id)a3;
- (NSString)peerMACAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)peerSupportedChannelFlags;
- (unint64_t)followModePreferredBand;
- (unint64_t)hash;
- (unint64_t)localAssistedDiscoveryMetric;
- (unint64_t)localMasterChannel;
- (unint64_t)localPreferredChannel;
- (unint64_t)localSecondaryPreferredChannel;
- (unint64_t)peerAssistedDiscoveryMetric;
- (unint64_t)peerMasterChannel;
- (unint64_t)peerPreferredChannel;
- (unint64_t)peerSecondaryPreferredChannel;
- (void)encodeWithCoder:(id)a3;
- (void)setFollowMode:(BOOL)a3;
- (void)setFollowModePreferredBand:(unint64_t)a3;
- (void)setLocalAssistedDiscoveryMetric:(unint64_t)a3;
- (void)setLocalMasterChannel:(unint64_t)a3;
- (void)setLocalPreferredChannel:(unint64_t)a3;
- (void)setLocalSecondaryPreferredChannel:(unint64_t)a3;
- (void)setPeerAssistedDiscoveryMetric:(unint64_t)a3;
- (void)setPeerMACAddress:(id)a3;
- (void)setPeerMasterChannel:(unint64_t)a3;
- (void)setPeerPreferredChannel:(unint64_t)a3;
- (void)setPeerSecondaryPreferredChannel:(unint64_t)a3;
- (void)setPeerSupportedChannelFlags:(int)a3;
@end

@implementation CWFAWDLPeerAssistedDiscoveryParameters

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"localMasterChannel=%lu, localPreferredChannel=%lu, localSecondaryPreferredChannel=%lu, localAssistedDiscoveryMetric=%lu, peerMACAddr=%@, peerMasterChannel=%lu, peerPreferredChannel=%lu, peerSecondaryPreferredChannel=%lu, peerAssistedDiscoveryMetric=%lu, peerSupportedChannelFlags=0x%x, followMode=%d, followModePreferredBand=%lu", v2, v3, self->_localMasterChannel, self->_localPreferredChannel, self->_localSecondaryPreferredChannel, self->_localAssistedDiscoveryMetric, self->_peerMACAddress, self->_peerMasterChannel, self->_peerPreferredChannel, self->_peerSecondaryPreferredChannel, self->_peerAssistedDiscoveryMetric, self->_peerSupportedChannelFlags, self->_followMode, self->_followModePreferredBand);
}

- (BOOL)isEqualToAWDLParameters:(id)a3
{
  id v6 = a3;
  unint64_t localMasterChannel = self->_localMasterChannel;
  if (localMasterChannel == objc_msgSend_localMasterChannel(v6, v8, v9, v10, v11))
  {
    unint64_t localPreferredChannel = self->_localPreferredChannel;
    if (localPreferredChannel == objc_msgSend_localPreferredChannel(v6, v12, v13, v14, v15))
    {
      unint64_t localSecondaryPreferredChannel = self->_localSecondaryPreferredChannel;
      if (localSecondaryPreferredChannel == objc_msgSend_localSecondaryPreferredChannel(v6, v17, v18, v19, v20))
      {
        unint64_t localAssistedDiscoveryMetric = self->_localAssistedDiscoveryMetric;
        if (localAssistedDiscoveryMetric == objc_msgSend_localAssistedDiscoveryMetric(v6, v22, v23, v24, v25))
        {
          peerMACAddress = self->_peerMACAddress;
          objc_msgSend_peerMACAddress(v6, v27, v28, v29, v30);
          v36 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (peerMACAddress == v36) {
            goto LABEL_13;
          }
          if (!self->_peerMACAddress
            || (objc_msgSend_peerMACAddress(v6, v32, v33, v34, v35), (uint64_t v37 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            BOOL v47 = 0;
LABEL_23:

            goto LABEL_11;
          }
          uint64_t v3 = (void *)v37;
          v42 = self->_peerMACAddress;
          v4 = objc_msgSend_peerMACAddress(v6, v38, v39, v40, v41);
          if (objc_msgSend_isEqual_(v42, v43, (uint64_t)v4, v44, v45))
          {
LABEL_13:
            unint64_t peerMasterChannel = self->_peerMasterChannel;
            if (peerMasterChannel == objc_msgSend_peerMasterChannel(v6, v32, v33, v34, v35)
              && (unint64_t peerPreferredChannel = self->_peerPreferredChannel,
                  peerPreferredChannel == objc_msgSend_peerPreferredChannel(v6, v50, v51, v52, v53))
              && (unint64_t peerSecondaryPreferredChannel = self->_peerSecondaryPreferredChannel,
                  peerSecondaryPreferredChannel == objc_msgSend_peerSecondaryPreferredChannel(v6, v55, v56, v57, v58))
              && (unint64_t peerAssistedDiscoveryMetric = self->_peerAssistedDiscoveryMetric,
                  peerAssistedDiscoveryMetric == objc_msgSend_peerAssistedDiscoveryMetric(v6, v60, v61, v62, v63))
              && (int peerSupportedChannelFlags = self->_peerSupportedChannelFlags,
                  peerSupportedChannelFlags == objc_msgSend_peerSupportedChannelFlags(v6, v65, v66, v67, v68))&& (int followMode = self->_followMode, followMode == objc_msgSend_followMode(v6, v70, v71, v72, v73)))
            {
              unint64_t followModePreferredBand = self->_followModePreferredBand;
              BOOL v46 = followModePreferredBand == objc_msgSend_followModePreferredBand(v6, v75, v76, v77, v78);
              BOOL v47 = v46;
            }
            else
            {
              BOOL v46 = 0;
              BOOL v47 = 0;
            }
            if (peerMACAddress == v36) {
              goto LABEL_23;
            }
          }
          else
          {
            BOOL v46 = 0;
          }

          BOOL v47 = v46;
          goto LABEL_23;
        }
      }
    }
  }
  BOOL v47 = 0;
LABEL_11:

  return v47;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CWFAWDLPeerAssistedDiscoveryParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToAWDLParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAWDLParameters = objc_msgSend_isEqualToAWDLParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToAWDLParameters = 0;
  }

  return isEqualToAWDLParameters;
}

- (unint64_t)hash
{
  int8x16_t v9 = *(int8x16_t *)&self->_localSecondaryPreferredChannel;
  int8x16_t v10 = *(int8x16_t *)&self->_localMasterChannel;
  uint64_t v6 = objc_msgSend_hash(self->_peerMACAddress, a2, v2, v3, v4);
  int8x16_t v7 = veorq_s8(veorq_s8(v10, *(int8x16_t *)&self->_peerMasterChannel), veorq_s8(v9, *(int8x16_t *)&self->_peerSecondaryPreferredChannel));
  return *(void *)&veor_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)) ^ self->_followModePreferredBand ^ self->_peerSupportedChannelFlags ^ self->_followMode ^ (unint64_t)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFAWDLPeerAssistedDiscoveryParameters, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setLocalMasterChannel_(v11, v12, self->_localMasterChannel, v13, v14);
  objc_msgSend_setLocalPreferredChannel_(v11, v15, self->_localPreferredChannel, v16, v17);
  objc_msgSend_setLocalSecondaryPreferredChannel_(v11, v18, self->_localSecondaryPreferredChannel, v19, v20);
  objc_msgSend_setLocalAssistedDiscoveryMetric_(v11, v21, self->_localAssistedDiscoveryMetric, v22, v23);
  objc_msgSend_setPeerMACAddress_(v11, v24, (uint64_t)self->_peerMACAddress, v25, v26);
  objc_msgSend_setPeerMasterChannel_(v11, v27, self->_peerMasterChannel, v28, v29);
  objc_msgSend_setPeerPreferredChannel_(v11, v30, self->_peerPreferredChannel, v31, v32);
  objc_msgSend_setPeerSecondaryPreferredChannel_(v11, v33, self->_peerSecondaryPreferredChannel, v34, v35);
  objc_msgSend_setPeerAssistedDiscoveryMetric_(v11, v36, self->_peerAssistedDiscoveryMetric, v37, v38);
  objc_msgSend_setPeerSupportedChannelFlags_(v11, v39, self->_peerSupportedChannelFlags, v40, v41);
  objc_msgSend_setFollowMode_(v11, v42, self->_followMode, v43, v44);
  objc_msgSend_setFollowModePreferredBand_(v11, v45, self->_followModePreferredBand, v46, v47);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  unint64_t localMasterChannel = self->_localMasterChannel;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v4, v7, localMasterChannel, v8, v9);
  objc_msgSend_encodeObject_forKey_(v6, v11, (uint64_t)v10, @"_localMasterChannel", v12);

  uint64_t v16 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v13, self->_localPreferredChannel, v14, v15);
  objc_msgSend_encodeObject_forKey_(v6, v17, (uint64_t)v16, @"_localPreferredChannel", v18);

  uint64_t v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, self->_localSecondaryPreferredChannel, v20, v21);
  objc_msgSend_encodeObject_forKey_(v6, v23, (uint64_t)v22, @"_localSecondaryPreferredChannel", v24);

  uint64_t v28 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v25, self->_localAssistedDiscoveryMetric, v26, v27);
  objc_msgSend_encodeObject_forKey_(v6, v29, (uint64_t)v28, @"_localAssistedDiscoveryMetric", v30);

  objc_msgSend_encodeObject_forKey_(v6, v31, (uint64_t)self->_peerMACAddress, @"_peerMACAddress", v32);
  v36 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v33, self->_peerMasterChannel, v34, v35);
  objc_msgSend_encodeObject_forKey_(v6, v37, (uint64_t)v36, @"_peerMasterChannel", v38);

  v42 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v39, self->_peerPreferredChannel, v40, v41);
  objc_msgSend_encodeObject_forKey_(v6, v43, (uint64_t)v42, @"_peerPreferredChannel", v44);

  v48 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v45, self->_peerSecondaryPreferredChannel, v46, v47);
  objc_msgSend_encodeObject_forKey_(v6, v49, (uint64_t)v48, @"_peerSecondaryPreferredChannel", v50);

  v54 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v51, self->_peerAssistedDiscoveryMetric, v52, v53);
  objc_msgSend_encodeObject_forKey_(v6, v55, (uint64_t)v54, @"_peerAssistedDiscoveryMetric", v56);

  objc_msgSend_encodeInteger_forKey_(v6, v57, self->_peerSupportedChannelFlags, @"_peerSupportedChannelFlags", v58);
  objc_msgSend_encodeBool_forKey_(v6, v59, self->_followMode, @"_followMode", v60);
  objc_msgSend_numberWithUnsignedInteger_(NSNumber, v61, self->_followModePreferredBand, v62, v63);
  id v66 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v64, (uint64_t)v66, @"_followModePreferredBand", v65);
}

- (CWFAWDLPeerAssistedDiscoveryParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)CWFAWDLPeerAssistedDiscoveryParameters;
  v5 = [(CWFAWDLPeerAssistedDiscoveryParameters *)&v90 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_localMasterChannel", v8);
    v5->_unint64_t localMasterChannel = objc_msgSend_unsignedIntegerValue(v9, v10, v11, v12, v13);

    uint64_t v14 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"_localPreferredChannel", v16);
    v5->_unint64_t localPreferredChannel = objc_msgSend_unsignedIntegerValue(v17, v18, v19, v20, v21);

    uint64_t v22 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"_localSecondaryPreferredChannel", v24);
    v5->_unint64_t localSecondaryPreferredChannel = objc_msgSend_unsignedIntegerValue(v25, v26, v27, v28, v29);

    uint64_t v30 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"_localAssistedDiscoveryMetric", v32);
    v5->_unint64_t localAssistedDiscoveryMetric = objc_msgSend_unsignedIntegerValue(v33, v34, v35, v36, v37);

    uint64_t v38 = objc_opt_class();
    uint64_t v41 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"_peerMACAddress", v40);
    peerMACAddress = v5->_peerMACAddress;
    v5->_peerMACAddress = (NSString *)v41;

    uint64_t v43 = objc_opt_class();
    uint64_t v46 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, @"_peerMasterChannel", v45);
    v5->_unint64_t peerMasterChannel = objc_msgSend_unsignedIntegerValue(v46, v47, v48, v49, v50);

    uint64_t v51 = objc_opt_class();
    v54 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, @"_peerPreferredChannel", v53);
    v5->_unint64_t peerPreferredChannel = objc_msgSend_unsignedIntegerValue(v54, v55, v56, v57, v58);

    uint64_t v59 = objc_opt_class();
    uint64_t v62 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v60, v59, @"_peerSecondaryPreferredChannel", v61);
    v5->_unint64_t peerSecondaryPreferredChannel = objc_msgSend_unsignedIntegerValue(v62, v63, v64, v65, v66);

    uint64_t v67 = objc_opt_class();
    v70 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v68, v67, @"_peerAssistedDiscoveryMetric", v69);
    v5->_unint64_t peerAssistedDiscoveryMetric = objc_msgSend_unsignedIntegerValue(v70, v71, v72, v73, v74);

    v5->_int peerSupportedChannelFlags = objc_msgSend_decodeIntegerForKey_(v4, v75, @"_peerSupportedChannelFlags", v76, v77);
    v5->_int followMode = objc_msgSend_decodeBoolForKey_(v4, v78, @"_followMode", v79, v80);
    uint64_t v81 = objc_opt_class();
    v84 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v82, v81, @"_followModePreferredBand", v83);
    v5->_unint64_t followModePreferredBand = objc_msgSend_unsignedIntegerValue(v84, v85, v86, v87, v88);
  }
  return v5;
}

- (unint64_t)localMasterChannel
{
  return self->_localMasterChannel;
}

- (void)setLocalMasterChannel:(unint64_t)a3
{
  self->_unint64_t localMasterChannel = a3;
}

- (unint64_t)localPreferredChannel
{
  return self->_localPreferredChannel;
}

- (void)setLocalPreferredChannel:(unint64_t)a3
{
  self->_unint64_t localPreferredChannel = a3;
}

- (unint64_t)localSecondaryPreferredChannel
{
  return self->_localSecondaryPreferredChannel;
}

- (void)setLocalSecondaryPreferredChannel:(unint64_t)a3
{
  self->_unint64_t localSecondaryPreferredChannel = a3;
}

- (unint64_t)localAssistedDiscoveryMetric
{
  return self->_localAssistedDiscoveryMetric;
}

- (void)setLocalAssistedDiscoveryMetric:(unint64_t)a3
{
  self->_unint64_t localAssistedDiscoveryMetric = a3;
}

- (NSString)peerMACAddress
{
  return self->_peerMACAddress;
}

- (void)setPeerMACAddress:(id)a3
{
}

- (unint64_t)peerMasterChannel
{
  return self->_peerMasterChannel;
}

- (void)setPeerMasterChannel:(unint64_t)a3
{
  self->_unint64_t peerMasterChannel = a3;
}

- (unint64_t)peerPreferredChannel
{
  return self->_peerPreferredChannel;
}

- (void)setPeerPreferredChannel:(unint64_t)a3
{
  self->_unint64_t peerPreferredChannel = a3;
}

- (unint64_t)peerSecondaryPreferredChannel
{
  return self->_peerSecondaryPreferredChannel;
}

- (void)setPeerSecondaryPreferredChannel:(unint64_t)a3
{
  self->_unint64_t peerSecondaryPreferredChannel = a3;
}

- (unint64_t)peerAssistedDiscoveryMetric
{
  return self->_peerAssistedDiscoveryMetric;
}

- (void)setPeerAssistedDiscoveryMetric:(unint64_t)a3
{
  self->_unint64_t peerAssistedDiscoveryMetric = a3;
}

- (int)peerSupportedChannelFlags
{
  return self->_peerSupportedChannelFlags;
}

- (void)setPeerSupportedChannelFlags:(int)a3
{
  self->_int peerSupportedChannelFlags = a3;
}

- (BOOL)followMode
{
  return self->_followMode;
}

- (void)setFollowMode:(BOOL)a3
{
  self->_int followMode = a3;
}

- (unint64_t)followModePreferredBand
{
  return self->_followModePreferredBand;
}

- (void)setFollowModePreferredBand:(unint64_t)a3
{
  self->_unint64_t followModePreferredBand = a3;
}

- (void).cxx_destruct
{
}

@end