@interface CWFRNRBSS
+ (BOOL)supportsSecureCoding;
- (BOOL)isColocatedAP;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRNRBSS:(id)a3;
- (BOOL)isMultiband6GHz;
- (BOOL)isMultipleBSSID;
- (BOOL)isSameSSID;
- (BOOL)isTransmittedBSSID;
- (BOOL)isUPRActive;
- (CWFChannel)channel;
- (CWFRNRBSS)initWithCoder:(id)a3;
- (NSString)BSSID;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)TBTTOffset;
- (unint64_t)hash;
- (unint64_t)primary20MHzPSD;
- (unint64_t)shortSSID;
- (void)encodeWithCoder:(id)a3;
- (void)setBSSID:(id)a3;
- (void)setChannel:(id)a3;
- (void)setColocatedAP:(BOOL)a3;
- (void)setMultiband6GHz:(BOOL)a3;
- (void)setMultipleBSSID:(BOOL)a3;
- (void)setPrimary20MHzPSD:(unint64_t)a3;
- (void)setSameSSID:(BOOL)a3;
- (void)setShortSSID:(unint64_t)a3;
- (void)setTBTTOffset:(unint64_t)a3;
- (void)setTransmittedBSSID:(BOOL)a3;
- (void)setUPRActive:(BOOL)a3;
@end

@implementation CWFRNRBSS

- (NSString)description
{
  v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_shortSSID(self, v7, v8, v9, v10);
  objc_msgSend_appendFormat_(v6, v12, @"ssid=%lu, ", v13, v14, v11);
  v19 = objc_msgSend_BSSID(self, v15, v16, v17, v18);
  v20 = CWFCorrectEthernetAddressString(v19);
  v25 = objc_msgSend_redactedForWiFi(v20, v21, v22, v23, v24);
  objc_msgSend_appendFormat_(v6, v26, @"bssid=%@, ", v27, v28, v25);

  v33 = objc_msgSend_channel(self, v29, v30, v31, v32);
  objc_msgSend_appendFormat_(v6, v34, @"channel=%@, ", v35, v36, v33);

  if (objc_msgSend_isSameSSID(self, v37, v38, v39, v40)) {
    objc_msgSend_appendString_(v6, v41, @"same=yes, ", v43, v44);
  }
  if (objc_msgSend_isUPRActive(self, v41, v42, v43, v44)) {
    objc_msgSend_appendString_(v6, v45, @"upr=yes, ", v47, v48);
  }
  if (objc_msgSend_isMultipleBSSID(self, v45, v46, v47, v48)) {
    objc_msgSend_appendString_(v6, v49, @"multiBSS=yes, ", v51, v52);
  }
  if (objc_msgSend_isTransmittedBSSID(self, v49, v50, v51, v52)) {
    objc_msgSend_appendString_(v6, v53, @"transmit=yes, ", v55, v56);
  }
  if (objc_msgSend_isMultiband6GHz(self, v53, v54, v55, v56)) {
    objc_msgSend_appendString_(v6, v57, @"multiband=yes, ", v59, v60);
  }
  if (objc_msgSend_isColocatedAP(self, v57, v58, v59, v60)) {
    objc_msgSend_appendString_(v6, v61, @"colocated=yes, ", v63, v64);
  }
  uint64_t v65 = objc_msgSend_TBTTOffset(self, v61, v62, v63, v64);
  objc_msgSend_appendFormat_(v6, v66, @"tbtt=%lu, ", v67, v68, v65);
  uint64_t v73 = objc_msgSend_primary20MHzPSD(self, v69, v70, v71, v72);
  objc_msgSend_appendFormat_(v6, v74, @"psd=%lu, ", v75, v76, v73);
  if (objc_msgSend_hasSuffix_(v6, v77, @", ", v78, v79))
  {
    uint64_t v84 = objc_msgSend_length(v6, v80, v81, v82, v83);
    objc_msgSend_deleteCharactersInRange_(v6, v85, v84 - 2, 2, v86);
  }
  return (NSString *)v6;
}

- (BOOL)isEqualToRNRBSS:(id)a3
{
  id v6 = a3;
  unint64_t shortSSID = self->_shortSSID;
  if (shortSSID == objc_msgSend_shortSSID(v6, v8, v9, v10, v11))
  {
    BSSID = self->_BSSID;
    objc_msgSend_BSSID(v6, v12, v13, v14, v15);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (BSSID == v21) {
      goto LABEL_9;
    }
    if (!self->_BSSID || (objc_msgSend_BSSID(v6, v17, v18, v19, v20), (uint64_t v22 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v32 = 0;
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v3 = (void *)v22;
    uint64_t v27 = self->_BSSID;
    uint64_t v4 = objc_msgSend_BSSID(v6, v23, v24, v25, v26);
    if (objc_msgSend_isEqual_(v27, v28, (uint64_t)v4, v29, v30))
    {
LABEL_9:
      int sameSSID = self->_sameSSID;
      if (sameSSID == objc_msgSend_isSameSSID(v6, v17, v18, v19, v20)
        && (int UPRActive = self->_UPRActive, UPRActive == objc_msgSend_isUPRActive(v6, v34, v35, v36, v37))
        && (int multipleBSSID = self->_multipleBSSID,
            multipleBSSID == objc_msgSend_isMultipleBSSID(v6, v39, v40, v41, v42))
        && (int transmittedBSSID = self->_transmittedBSSID,
            transmittedBSSID == objc_msgSend_isTransmittedBSSID(v6, v44, v45, v46, v47))
        && (int multiband6GHz = self->_multiband6GHz,
            multiband6GHz == objc_msgSend_isMultiband6GHz(v6, v49, v50, v51, v52))
        && (int colocatedAP = self->_colocatedAP,
            colocatedAP == objc_msgSend_isColocatedAP(v6, v54, v55, v56, v57))
        && (unint64_t TBTTOffset = self->_TBTTOffset, TBTTOffset == objc_msgSend_TBTTOffset(v6, v59, v60, v61, v62)))
      {
        unint64_t primary20MHzPSD = self->_primary20MHzPSD;
        BOOL v31 = primary20MHzPSD == objc_msgSend_primary20MHzPSD(v6, v64, v65, v66, v67);
        BOOL v32 = v31;
      }
      else
      {
        BOOL v31 = 0;
        BOOL v32 = 0;
      }
      if (BSSID == v21) {
        goto LABEL_20;
      }
    }
    else
    {
      BOOL v31 = 0;
    }

    BOOL v32 = v31;
    goto LABEL_20;
  }
  BOOL v32 = 0;
LABEL_21:

  return v32;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFRNRBSS *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToRNRBSS = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToRNRBSS = objc_msgSend_isEqualToRNRBSS_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToRNRBSS = 0;
  }

  return isEqualToRNRBSS;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, a2, self->_shortSSID, v2, v3);
  uint64_t v10 = objc_msgSend_hash(v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_hash(self->_BSSID, v11, v12, v13, v14);
  unint64_t v20 = v15 ^ objc_msgSend_hash(self->_channel, v16, v17, v18, v19) ^ self->_sameSSID ^ v10 ^ self->_UPRActive ^ (unint64_t)self->_multipleBSSID ^ self->_transmittedBSSID ^ self->_multiband6GHz ^ self->_colocatedAP ^ self->_TBTTOffset ^ self->_primary20MHzPSD;

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v6 = objc_msgSend_allocWithZone_(CWFRNRBSS, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setShortSSID_(v11, v12, self->_shortSSID, v13, v14);
  objc_msgSend_setBSSID_(v11, v15, (uint64_t)self->_BSSID, v16, v17);
  objc_msgSend_setChannel_(v11, v18, (uint64_t)self->_channel, v19, v20);
  objc_msgSend_setSameSSID_(v11, v21, self->_sameSSID, v22, v23);
  objc_msgSend_setUPRActive_(v11, v24, self->_UPRActive, v25, v26);
  objc_msgSend_setMultipleBSSID_(v11, v27, self->_multipleBSSID, v28, v29);
  objc_msgSend_setTransmittedBSSID_(v11, v30, self->_transmittedBSSID, v31, v32);
  objc_msgSend_setMultiband6GHz_(v11, v33, self->_multiband6GHz, v34, v35);
  objc_msgSend_setColocatedAP_(v11, v36, self->_colocatedAP, v37, v38);
  objc_msgSend_setTBTTOffset_(v11, v39, self->_TBTTOffset, v40, v41);
  objc_msgSend_setPrimary20MHzPSD_(v11, v42, self->_primary20MHzPSD, v43, v44);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  unint64_t shortSSID = self->_shortSSID;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_numberWithUnsignedInteger_(v4, v7, shortSSID, v8, v9);
  objc_msgSend_encodeObject_forKey_(v6, v11, (uint64_t)v10, @"_shortSSID", v12);

  objc_msgSend_encodeObject_forKey_(v6, v13, (uint64_t)self->_BSSID, @"_BSSID", v14);
  objc_msgSend_encodeObject_forKey_(v6, v15, (uint64_t)self->_channel, @"_channel", v16);
  objc_msgSend_encodeBool_forKey_(v6, v17, self->_sameSSID, @"_sameSSID", v18);
  objc_msgSend_encodeBool_forKey_(v6, v19, self->_UPRActive, @"_UPRActive", v20);
  objc_msgSend_encodeBool_forKey_(v6, v21, self->_multipleBSSID, @"_multipleBSSID", v22);
  objc_msgSend_encodeBool_forKey_(v6, v23, self->_transmittedBSSID, @"_transmittedBSSID", v24);
  objc_msgSend_encodeBool_forKey_(v6, v25, self->_multiband6GHz, @"_multiband6GHz", v26);
  objc_msgSend_encodeBool_forKey_(v6, v27, self->_colocatedAP, @"_colocatedAP", v28);
  uint64_t v32 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v29, self->_TBTTOffset, v30, v31);
  objc_msgSend_encodeObject_forKey_(v6, v33, (uint64_t)v32, @"_TBTTOffset", v34);

  objc_msgSend_numberWithUnsignedInteger_(NSNumber, v35, self->_primary20MHzPSD, v36, v37);
  id v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v6, v38, (uint64_t)v40, @"_primary20MHzPSD", v39);
}

- (CWFRNRBSS)initWithCoder:(id)a3
{
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)CWFRNRBSS;
  v5 = [(CWFRNRBSS *)&v59 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_shortSSID", v8);
    v5->_unint64_t shortSSID = objc_msgSend_unsignedIntegerValue(v9, v10, v11, v12, v13);

    uint64_t v14 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"_BSSID", v16);
    BSSID = v5->_BSSID;
    v5->_BSSID = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"_channel", v21);
    channel = v5->_channel;
    v5->_channel = (CWFChannel *)v22;

    v5->_int sameSSID = objc_msgSend_decodeBoolForKey_(v4, v24, @"_sameSSID", v25, v26);
    v5->_int UPRActive = objc_msgSend_decodeBoolForKey_(v4, v27, @"_UPRActive", v28, v29);
    v5->_int multipleBSSID = objc_msgSend_decodeBoolForKey_(v4, v30, @"_multipleBSSID", v31, v32);
    v5->_int transmittedBSSID = objc_msgSend_decodeBoolForKey_(v4, v33, @"_transmittedBSSID", v34, v35);
    v5->_int multiband6GHz = objc_msgSend_decodeBoolForKey_(v4, v36, @"_multiband6GHz", v37, v38);
    v5->_int colocatedAP = objc_msgSend_decodeBoolForKey_(v4, v39, @"_colocatedAP", v40, v41);
    uint64_t v42 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"_TBTTOffset", v44);
    v5->_unint64_t TBTTOffset = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48, v49);

    uint64_t v50 = objc_opt_class();
    v53 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"_primary20MHzPSD", v52);
    v5->_unint64_t primary20MHzPSD = objc_msgSend_unsignedIntegerValue(v53, v54, v55, v56, v57);
  }
  return v5;
}

- (unint64_t)shortSSID
{
  return self->_shortSSID;
}

- (void)setShortSSID:(unint64_t)a3
{
  self->_unint64_t shortSSID = a3;
}

- (NSString)BSSID
{
  return self->_BSSID;
}

- (void)setBSSID:(id)a3
{
}

- (CWFChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (BOOL)isUPRActive
{
  return self->_UPRActive;
}

- (void)setUPRActive:(BOOL)a3
{
  self->_int UPRActive = a3;
}

- (BOOL)isSameSSID
{
  return self->_sameSSID;
}

- (void)setSameSSID:(BOOL)a3
{
  self->_int sameSSID = a3;
}

- (BOOL)isMultipleBSSID
{
  return self->_multipleBSSID;
}

- (void)setMultipleBSSID:(BOOL)a3
{
  self->_int multipleBSSID = a3;
}

- (BOOL)isTransmittedBSSID
{
  return self->_transmittedBSSID;
}

- (void)setTransmittedBSSID:(BOOL)a3
{
  self->_int transmittedBSSID = a3;
}

- (BOOL)isMultiband6GHz
{
  return self->_multiband6GHz;
}

- (void)setMultiband6GHz:(BOOL)a3
{
  self->_int multiband6GHz = a3;
}

- (BOOL)isColocatedAP
{
  return self->_colocatedAP;
}

- (void)setColocatedAP:(BOOL)a3
{
  self->_int colocatedAP = a3;
}

- (unint64_t)TBTTOffset
{
  return self->_TBTTOffset;
}

- (void)setTBTTOffset:(unint64_t)a3
{
  self->_unint64_t TBTTOffset = a3;
}

- (unint64_t)primary20MHzPSD
{
  return self->_primary20MHzPSD;
}

- (void)setPrimary20MHzPSD:(unint64_t)a3
{
  self->_unint64_t primary20MHzPSD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_BSSID, 0);
}

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = objc_msgSend_BSSID(self, v4, v5, v6, v7);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, @"BSSID", v10);

  uint64_t v15 = objc_msgSend_channel(self, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_JSONCompatibleKeyValueMap(v15, v16, v17, v18, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, @"channel", v22);

  uint64_t v23 = NSNumber;
  isint UPRActive = objc_msgSend_isUPRActive(self, v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_numberWithBool_(v23, v29, isUPRActive, v30, v31);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, @"upr_active", v34);

  uint64_t v35 = NSNumber;
  uint64_t isSameSSID = objc_msgSend_isSameSSID(self, v36, v37, v38, v39);
  uint64_t v44 = objc_msgSend_numberWithBool_(v35, v41, isSameSSID, v42, v43);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, @"same_ssid", v46);

  uint64_t v47 = NSNumber;
  uint64_t isMultipleBSSID = objc_msgSend_isMultipleBSSID(self, v48, v49, v50, v51);
  uint64_t v56 = objc_msgSend_numberWithBool_(v47, v53, isMultipleBSSID, v54, v55);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, @"multiple_bssid", v58);

  objc_super v59 = NSNumber;
  uint64_t isTransmittedBSSID = objc_msgSend_isTransmittedBSSID(self, v60, v61, v62, v63);
  uint64_t v68 = objc_msgSend_numberWithBool_(v59, v65, isTransmittedBSSID, v66, v67);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, @"transmitted_bssid", v70);

  uint64_t v71 = NSNumber;
  uint64_t isMultiband6GHz = objc_msgSend_isMultiband6GHz(self, v72, v73, v74, v75);
  v80 = objc_msgSend_numberWithBool_(v71, v77, isMultiband6GHz, v78, v79);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v81, (uint64_t)v80, @"multiband_6ghz", v82);

  uint64_t v83 = NSNumber;
  uint64_t isColocatedAP = objc_msgSend_isColocatedAP(self, v84, v85, v86, v87);
  v92 = objc_msgSend_numberWithBool_(v83, v89, isColocatedAP, v90, v91);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v93, (uint64_t)v92, @"colocated_ap", v94);

  v95 = NSNumber;
  uint64_t v100 = objc_msgSend_TBTTOffset(self, v96, v97, v98, v99);
  v104 = objc_msgSend_numberWithUnsignedInteger_(v95, v101, v100, v102, v103);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v105, (uint64_t)v104, @"tbtt_offset", v106);

  v107 = NSNumber;
  uint64_t v112 = objc_msgSend_primary20MHzPSD(self, v108, v109, v110, v111);
  v116 = objc_msgSend_numberWithUnsignedInteger_(v107, v113, v112, v114, v115);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v117, (uint64_t)v116, @"primary_20mhz_psd", v118);

  v122 = sub_1B4F59CC8(v3, 0, 1u);
  if (v122)
  {
    v123 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v119, (uint64_t)v122, v120, v121);
  }
  else
  {
    v123 = 0;
  }

  return v123;
}

@end