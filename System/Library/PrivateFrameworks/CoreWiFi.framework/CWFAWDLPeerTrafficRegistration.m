@interface CWFAWDLPeerTrafficRegistration
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAWDLPeerTrafficRegistration:(id)a3;
- (CWFAWDLPeerTrafficRegistration)initWithCoder:(id)a3;
- (NSArray)peerContextList;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializedRegistrationInfo;
- (int)sessionFlags;
- (unint64_t)desiredBandwidth;
- (unint64_t)desiredLatency;
- (unint64_t)hash;
- (unint64_t)preferredChannel;
- (unint64_t)secondaryPreferredChannel;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDesiredBandwidth:(unint64_t)a3;
- (void)setDesiredLatency:(unint64_t)a3;
- (void)setPeerContextList:(id)a3;
- (void)setPreferredChannel:(unint64_t)a3;
- (void)setSecondaryPreferredChannel:(unint64_t)a3;
- (void)setServiceName:(id)a3;
- (void)setSessionFlags:(int)a3;
@end

@implementation CWFAWDLPeerTrafficRegistration

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"serviceName=%@, sessionFlags=0x%x, active=%d, desiredBandwidth=%lu, desiredLatency=%lu, preferredChannel=%ld, secondaryPreferredChannel=%ld, peerContextList=%@", v2, v3, self->_serviceName, self->_sessionFlags, self->_active, self->_desiredBandwidth, self->_desiredLatency, self->_preferredChannel, self->_secondaryPreferredChannel, self->_peerContextList);
}

- (BOOL)isEqualToAWDLPeerTrafficRegistration:(id)a3
{
  id v6 = a3;
  serviceName = self->_serviceName;
  objc_msgSend_serviceName(v6, v8, v9, v10, v11);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (serviceName != v16)
  {
    if (!self->_serviceName
      || (objc_msgSend_serviceName(v6, v12, v13, v14, v15), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v27 = 0;
      goto LABEL_22;
    }
    uint64_t v3 = (void *)v17;
    v22 = self->_serviceName;
    v4 = objc_msgSend_serviceName(v6, v18, v19, v20, v21);
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      char isEqual = 0;
LABEL_21:

      BOOL v27 = isEqual;
      goto LABEL_22;
    }
  }
  int sessionFlags = self->_sessionFlags;
  if (sessionFlags == objc_msgSend_sessionFlags(v6, v12, v13, v14, v15))
  {
    int active = self->_active;
    if (active == objc_msgSend_isActive(v6, v29, v30, v31, v32))
    {
      unint64_t desiredBandwidth = self->_desiredBandwidth;
      if (desiredBandwidth == objc_msgSend_desiredBandwidth(v6, v34, v35, v36, v37))
      {
        unint64_t desiredLatency = self->_desiredLatency;
        if (desiredLatency == objc_msgSend_desiredLatency(v6, v39, v40, v41, v42))
        {
          unint64_t preferredChannel = self->_preferredChannel;
          if (preferredChannel == objc_msgSend_preferredChannel(v6, v44, v45, v46, v47))
          {
            unint64_t secondaryPreferredChannel = self->_secondaryPreferredChannel;
            if (secondaryPreferredChannel == objc_msgSend_secondaryPreferredChannel(v6, v49, v50, v51, v52))
            {
              peerContextList = self->_peerContextList;
              objc_msgSend_peerContextList(v6, v54, v55, v56, v57);
              v63 = (NSArray *)objc_claimAutoreleasedReturnValue();
              char isEqual = peerContextList == v63;
              if (isEqual || !self->_peerContextList) {
                goto LABEL_17;
              }
              uint64_t v64 = objc_msgSend_peerContextList(v6, v59, v60, v61, v62);
              if (v64)
              {
                v69 = (void *)v64;
                v70 = self->_peerContextList;
                v71 = objc_msgSend_peerContextList(v6, v65, v66, v67, v68);
                char isEqual = objc_msgSend_isEqual_(v70, v72, (uint64_t)v71, v73, v74);

LABEL_17:
                BOOL v27 = isEqual;
                goto LABEL_20;
              }
            }
          }
        }
      }
    }
  }
  char isEqual = 0;
  BOOL v27 = 0;
LABEL_20:
  if (serviceName != v16) {
    goto LABEL_21;
  }
LABEL_22:

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CWFAWDLPeerTrafficRegistration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToAWDLPeerTrafficRegistration = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToAWDLPeerTrafficRegistration = objc_msgSend_isEqualToAWDLPeerTrafficRegistration_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToAWDLPeerTrafficRegistration = 0;
  }

  return isEqualToAWDLPeerTrafficRegistration;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_serviceName, a2, v2, v3, v4);
  uint64_t sessionFlags = self->_sessionFlags;
  BOOL active = self->_active;
  int8x16_t v16 = *(int8x16_t *)&self->_desiredBandwidth;
  int8x16_t v17 = *(int8x16_t *)&self->_preferredChannel;
  uint64_t v13 = objc_msgSend_hash(self->_peerContextList, v9, v10, v11, v12);
  int8x16_t v14 = veorq_s8(v16, v17);
  return *(void *)&veor_s8(*(int8x8_t *)v14.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL)) ^ v13 ^ v6 ^ active ^ sessionFlags;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFAWDLPeerTrafficRegistration, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setServiceName_(v11, v12, (uint64_t)self->_serviceName, v13, v14);
  objc_msgSend_setActive_(v11, v15, self->_active, v16, v17);
  objc_msgSend_setSessionFlags_(v11, v18, self->_sessionFlags, v19, v20);
  objc_msgSend_setDesiredBandwidth_(v11, v21, self->_desiredBandwidth, v22, v23);
  objc_msgSend_setDesiredLatency_(v11, v24, self->_desiredLatency, v25, v26);
  objc_msgSend_setPreferredChannel_(v11, v27, self->_preferredChannel, v28, v29);
  objc_msgSend_setSecondaryPreferredChannel_(v11, v30, self->_secondaryPreferredChannel, v31, v32);
  objc_msgSend_setPeerContextList_(v11, v33, (uint64_t)self->_peerContextList, v34, v35);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  serviceName = self->_serviceName;
  id v37 = a3;
  objc_msgSend_encodeObject_forKey_(v37, v5, (uint64_t)serviceName, @"_serviceName", v6);
  objc_msgSend_encodeBool_forKey_(v37, v7, self->_active, @"_active", v8);
  objc_msgSend_encodeInteger_forKey_(v37, v9, self->_sessionFlags, @"_sessionFlags", v10);
  uint64_t v14 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v11, self->_desiredBandwidth, v12, v13);
  objc_msgSend_encodeObject_forKey_(v37, v15, (uint64_t)v14, @"_desiredBandwidth", v16);

  uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v17, self->_desiredLatency, v18, v19);
  objc_msgSend_encodeObject_forKey_(v37, v21, (uint64_t)v20, @"_desiredLatency", v22);

  uint64_t v26 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v23, self->_preferredChannel, v24, v25);
  objc_msgSend_encodeObject_forKey_(v37, v27, (uint64_t)v26, @"_preferredChannel", v28);

  uint64_t v32 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v29, self->_secondaryPreferredChannel, v30, v31);
  objc_msgSend_encodeObject_forKey_(v37, v33, (uint64_t)v32, @"_secondaryPreferredChannel", v34);

  objc_msgSend_encodeObject_forKey_(v37, v35, (uint64_t)self->_peerContextList, @"_peerContextList", v36);
}

- (CWFAWDLPeerTrafficRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)CWFAWDLPeerTrafficRegistration;
  v5 = [(CWFAWDLPeerTrafficRegistration *)&v61 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_serviceName", v8);
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v9;

    v5->_BOOL active = objc_msgSend_decodeBoolForKey_(v4, v11, @"_active", v12, v13);
    v5->_uint64_t sessionFlags = objc_msgSend_decodeIntegerForKey_(v4, v14, @"_sessionFlags", v15, v16);
    uint64_t v17 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"_desiredBandwidth", v19);
    v5->_unint64_t desiredBandwidth = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23, v24);

    uint64_t v25 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"_desiredLatency", v27);
    v5->_unint64_t desiredLatency = objc_msgSend_unsignedIntegerValue(v28, v29, v30, v31, v32);

    uint64_t v33 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"_preferredChannel", v35);
    v5->_unint64_t preferredChannel = objc_msgSend_unsignedIntegerValue(v36, v37, v38, v39, v40);

    uint64_t v41 = objc_opt_class();
    v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"_secondaryPreferredChannel", v43);
    v5->_unint64_t secondaryPreferredChannel = objc_msgSend_unsignedIntegerValue(v44, v45, v46, v47, v48);

    v49 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v50 = objc_opt_class();
    uint64_t v51 = objc_opt_class();
    uint64_t v55 = objc_msgSend_setWithObjects_(v49, v52, v50, v53, v54, v51, 0);
    uint64_t v58 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v56, (uint64_t)v55, @"_peerContextList", v57);
    peerContextList = v5->_peerContextList;
    v5->_peerContextList = (NSArray *)v58;
  }
  return v5;
}

- (id)serializedRegistrationInfo
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_serviceName(self, v7, v8, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v12, (uint64_t)v11, @"TR_SRV_NAME", v13);

  uint64_t v14 = NSNumber;
  uint64_t isActive = objc_msgSend_isActive(self, v15, v16, v17, v18);
  uint64_t v23 = objc_msgSend_numberWithBool_(v14, v20, isActive, v21, v22);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v24, (uint64_t)v23, @"TR_ACTIVE", v25);

  uint64_t v26 = NSNumber;
  uint64_t v31 = objc_msgSend_sessionFlags(self, v27, v28, v29, v30);
  uint64_t v35 = objc_msgSend_numberWithUnsignedInt_(v26, v32, v31, v33, v34);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v36, (uint64_t)v35, @"TR_SESSION_FLAGS", v37);

  uint64_t v38 = NSNumber;
  uint64_t v43 = objc_msgSend_desiredBandwidth(self, v39, v40, v41, v42);
  uint64_t v47 = objc_msgSend_numberWithUnsignedInteger_(v38, v44, v43, v45, v46);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v48, (uint64_t)v47, @"TR_DESIRED_BW", v49);

  uint64_t v50 = NSNumber;
  uint64_t v55 = objc_msgSend_desiredLatency(self, v51, v52, v53, v54);
  v59 = objc_msgSend_numberWithUnsignedInteger_(v50, v56, v55, v57, v58);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v60, (uint64_t)v59, @"TR_DESIRED_LATENCY", v61);

  uint64_t v62 = NSNumber;
  uint64_t v67 = objc_msgSend_preferredChannel(self, v63, v64, v65, v66);
  v71 = objc_msgSend_numberWithUnsignedInteger_(v62, v68, v67, v69, v70);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v72, (uint64_t)v71, @"AWDL_TR_CHANNEL", v73);

  uint64_t v74 = NSNumber;
  uint64_t v79 = objc_msgSend_secondaryPreferredChannel(self, v75, v76, v77, v78);
  v83 = objc_msgSend_numberWithUnsignedInteger_(v74, v80, v79, v81, v82);
  v140 = v6;
  objc_msgSend_setObject_forKeyedSubscript_(v6, v84, (uint64_t)v83, @"AWDL_TR_SEC_CHANNEL", v85);

  v90 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v86, v87, v88, v89);
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v95 = objc_msgSend_peerContextList(self, v91, v92, v93, v94);
  uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v141, (uint64_t)v145, 16);
  if (v97)
  {
    uint64_t v102 = v97;
    uint64_t v103 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v102; ++i)
      {
        if (*(void *)v142 != v103) {
          objc_enumerationMutation(v95);
        }
        v105 = *(void **)(*((void *)&v141 + 1) + 8 * i);
        v106 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v98, v99, v100, v101);
        v111 = objc_msgSend_MACAddress(v105, v107, v108, v109, v110);

        if (v111)
        {
          objc_msgSend_MACAddress(v105, v112, v113, v114, v115);
          id v116 = objc_claimAutoreleasedReturnValue();
          v121 = (const char *)objc_msgSend_UTF8String(v116, v117, v118, v119, v120);
          v122 = ether_aton(v121);

          if (v122)
          {
            v123 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v112, (uint64_t)v122, 6, v115);
            objc_msgSend_setObject_forKeyedSubscript_(v106, v124, (uint64_t)v123, @"TR_PEER_ADDRESS", v125);
          }
        }
        v126 = objc_msgSend_interfaceName(v105, v112, v113, v114, v115);
        objc_msgSend_setObject_forKeyedSubscript_(v106, v127, (uint64_t)v126, @"TR_IFNAME", v128);

        objc_msgSend_addObject_(v90, v129, (uint64_t)v106, v130, v131);
      }
      uint64_t v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v98, (uint64_t)&v141, (uint64_t)v145, 16);
    }
    while (v102);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v140, v132, (uint64_t)v90, @"TR_PEER_CONTEXTS", v133);
  v138 = objc_msgSend_copy(v140, v134, v135, v136, v137);

  return v138;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_BOOL active = a3;
}

- (int)sessionFlags
{
  return self->_sessionFlags;
}

- (void)setSessionFlags:(int)a3
{
  self->_uint64_t sessionFlags = a3;
}

- (unint64_t)desiredBandwidth
{
  return self->_desiredBandwidth;
}

- (void)setDesiredBandwidth:(unint64_t)a3
{
  self->_unint64_t desiredBandwidth = a3;
}

- (unint64_t)desiredLatency
{
  return self->_desiredLatency;
}

- (void)setDesiredLatency:(unint64_t)a3
{
  self->_unint64_t desiredLatency = a3;
}

- (unint64_t)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(unint64_t)a3
{
  self->_unint64_t preferredChannel = a3;
}

- (unint64_t)secondaryPreferredChannel
{
  return self->_secondaryPreferredChannel;
}

- (void)setSecondaryPreferredChannel:(unint64_t)a3
{
  self->_unint64_t secondaryPreferredChannel = a3;
}

- (NSArray)peerContextList
{
  return self->_peerContextList;
}

- (void)setPeerContextList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerContextList, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end