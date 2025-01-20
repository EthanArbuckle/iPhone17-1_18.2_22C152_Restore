@interface CWFBackgroundScanConfiguration
+ (BOOL)supportsSecureCoding;
- ($A4FF59F43F4B20644E55A5E6B3BB4A05)modifyMap;
- (BOOL)cacheEnabled;
- (BOOL)cacheRollover;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBackgroundScanConfiguration:(id)a3;
- (BOOL)modified;
- (CWFBackgroundScanConfiguration)initWithCoder:(id)a3;
- (NSArray)channels;
- (NSArray)networks;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)lostNetworkScanCount;
- (unint64_t)scanFrequency;
- (void)encodeWithCoder:(id)a3;
- (void)merge:(id)a3;
- (void)setCacheEnabled:(BOOL)a3;
- (void)setCacheRollover:(BOOL)a3;
- (void)setChannels:(id)a3;
- (void)setLostNetworkScanCount:(unint64_t)a3;
- (void)setModifyMap:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setScanFrequency:(unint64_t)a3;
@end

@implementation CWFBackgroundScanConfiguration

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  v9 = objc_msgSend_networks(self, v5, v6, v7, v8);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v104, (uint64_t)v109, 16);
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v105 != v17) {
          objc_enumerationMutation(v9);
        }
        v19 = objc_msgSend_JSONCompatibleKeyValueMap(*(void **)(*((void *)&v104 + 1) + 8 * i), v12, v13, v14, v15);
        objc_msgSend_addObject_(v4, v20, (uint64_t)v19, v21, v22);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v104, (uint64_t)v109, 16);
    }
    while (v16);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v23, (uint64_t)v4, @"networks", v24);
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v30 = objc_msgSend_channels(self, v26, v27, v28, v29, 0);
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v100, (uint64_t)v108, 16);
  if (v32)
  {
    uint64_t v37 = v32;
    uint64_t v38 = *(void *)v101;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v101 != v38) {
          objc_enumerationMutation(v30);
        }
        v40 = objc_msgSend_JSONCompatibleKeyValueMap(*(void **)(*((void *)&v100 + 1) + 8 * j), v33, v34, v35, v36);
        objc_msgSend_addObject_(v25, v41, (uint64_t)v40, v42, v43);
      }
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v100, (uint64_t)v108, 16);
    }
    while (v37);
  }

  objc_msgSend_setObject_forKeyedSubscript_(v3, v44, (uint64_t)v25, @"channels", v45);
  v46 = NSNumber;
  uint64_t v51 = objc_msgSend_cacheEnabled(self, v47, v48, v49, v50);
  v55 = objc_msgSend_numberWithBool_(v46, v52, v51, v53, v54);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v56, (uint64_t)v55, @"cacheEnabled", v57);

  v58 = NSNumber;
  uint64_t v63 = objc_msgSend_cacheRollover(self, v59, v60, v61, v62);
  v67 = objc_msgSend_numberWithBool_(v58, v64, v63, v65, v66);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v68, (uint64_t)v67, @"cacheRollover", v69);

  v70 = NSNumber;
  uint64_t v75 = objc_msgSend_scanFrequency(self, v71, v72, v73, v74);
  v79 = objc_msgSend_numberWithUnsignedInteger_(v70, v76, v75, v77, v78);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v80, (uint64_t)v79, @"scanFrequency", v81);

  v82 = NSNumber;
  uint64_t v87 = objc_msgSend_lostNetworkScanCount(self, v83, v84, v85, v86);
  v91 = objc_msgSend_numberWithUnsignedInteger_(v82, v88, v87, v89, v90);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v92, (uint64_t)v91, @"lostNetworkScanCount", v93);

  v97 = sub_1B4F59CC8(v3, 0, 1u);
  if (v97)
  {
    v98 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v94, (uint64_t)v97, v95, v96);
  }
  else
  {
    v98 = 0;
  }

  return v98;
}

- (BOOL)modified
{
  return *(&self->_cacheRollover + 1);
}

- (void)merge:(id)a3
{
  v129 = (CWFBackgroundScanConfiguration *)a3;
  if ((objc_msgSend_modifyMap(v129, v4, v5, v6, v7) & 2) != 0)
  {
    v12 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v8, v9, v10, v11);
    uint64_t v17 = objc_msgSend_networks(self, v13, v14, v15, v16);
    objc_msgSend_addObjectsFromArray_(v12, v18, (uint64_t)v17, v19, v20);

    id v25 = objc_msgSend_networks(v129, v21, v22, v23, v24);
    objc_msgSend_addObjectsFromArray_(v12, v26, (uint64_t)v25, v27, v28);

    v33 = objc_msgSend_array(v12, v29, v30, v31, v32);
    objc_msgSend_setNetworks_(self, v34, (uint64_t)v33, v35, v36);
  }
  if (objc_msgSend_modifyMap(v129, v8, v9, v10, v11))
  {
    v41 = objc_msgSend_orderedSet(MEMORY[0x1E4F1CA70], v37, v38, v39, v40);
    v46 = objc_msgSend_channels(self, v42, v43, v44, v45);
    objc_msgSend_addObjectsFromArray_(v41, v47, (uint64_t)v46, v48, v49);

    uint64_t v54 = objc_msgSend_channels(v129, v50, v51, v52, v53);
    objc_msgSend_addObjectsFromArray_(v41, v55, (uint64_t)v54, v56, v57);

    uint64_t v62 = objc_msgSend_array(v41, v58, v59, v60, v61);
    objc_msgSend_setChannels_(self, v63, (uint64_t)v62, v64, v65);
  }
  if ((objc_msgSend_modifyMap(v129, v37, v38, v39, v40) & 4) != 0)
  {
    int v70 = objc_msgSend_cacheEnabled(v129, v66, v67, v68, v69);
    unsigned int v75 = objc_msgSend_cacheEnabled(self, v71, v72, v73, v74);
    objc_msgSend_setCacheEnabled_(self, v76, v70 | v75, v77, v78);
  }
  if ((objc_msgSend_modifyMap(v129, v66, v67, v68, v69) & 8) != 0)
  {
    int v83 = objc_msgSend_cacheRollover(v129, v79, v80, v81, v82);
    unsigned int v88 = objc_msgSend_cacheRollover(self, v84, v85, v86, v87);
    objc_msgSend_setCacheRollover_(self, v89, v83 | v88, v90, v91);
  }
  if ((objc_msgSend_modifyMap(v129, v79, v80, v81, v82) & 0x10) != 0)
  {
    unint64_t v96 = objc_msgSend_scanFrequency(self, v92, v93, v94, v95);
    BOOL v101 = v96 >= objc_msgSend_scanFrequency(v129, v97, v98, v99, v100);
    long long v106 = v129;
    if (!v101) {
      long long v106 = self;
    }
    uint64_t v107 = objc_msgSend_scanFrequency(v106, v102, v103, v104, v105);
    objc_msgSend_setScanFrequency_(self, v108, v107, v109, v110);
  }
  if ((objc_msgSend_modifyMap(v129, v92, v93, v94, v95) & 0x20) != 0)
  {
    unint64_t v115 = objc_msgSend_lostNetworkScanCount(self, v111, v112, v113, v114);
    BOOL v101 = v115 >= objc_msgSend_lostNetworkScanCount(v129, v116, v117, v118, v119);
    v124 = v129;
    if (!v101) {
      v124 = self;
    }
    uint64_t v125 = objc_msgSend_lostNetworkScanCount(v124, v120, v121, v122, v123);
    objc_msgSend_setLostNetworkScanCount_(self, v126, v125, v127, v128);
  }
}

- (void)setChannels:(id)a3
{
  id v4 = a3;
  unsigned __int8 v9 = objc_msgSend_modifyMap(self, v5, v6, v7, v8);
  objc_msgSend_setModifyMap_(self, v10, v9 | 1u, v11, v12);
  uint64_t v17 = (NSArray *)objc_msgSend_copy(v4, v13, v14, v15, v16);

  channels = self->_channels;
  self->_channels = v17;
}

- (void)setNetworks:(id)a3
{
  id v4 = a3;
  unsigned __int8 v9 = objc_msgSend_modifyMap(self, v5, v6, v7, v8);
  objc_msgSend_setModifyMap_(self, v10, v9 | 2u, v11, v12);
  uint64_t v17 = (NSArray *)objc_msgSend_copy(v4, v13, v14, v15, v16);

  networks = self->_networks;
  self->_networks = v17;
}

- (void)setCacheEnabled:(BOOL)a3
{
  unsigned __int8 v7 = objc_msgSend_modifyMap(self, a2, a3, v3, v4);
  objc_msgSend_setModifyMap_(self, v8, v7 | 4u, v9, v10);
  self->_cacheEnabled = a3;
}

- (void)setCacheRollover:(BOOL)a3
{
  unsigned __int8 v7 = objc_msgSend_modifyMap(self, a2, a3, v3, v4);
  objc_msgSend_setModifyMap_(self, v8, v7 | 8u, v9, v10);
  self->_cacheRollover = a3;
}

- (void)setScanFrequency:(unint64_t)a3
{
  unsigned __int8 v7 = objc_msgSend_modifyMap(self, a2, a3, v3, v4);
  objc_msgSend_setModifyMap_(self, v8, v7 | 0x10u, v9, v10);
  self->_scanFrequency = a3;
}

- (void)setLostNetworkScanCount:(unint64_t)a3
{
  unsigned __int8 v7 = objc_msgSend_modifyMap(self, a2, a3, v3, v4);
  objc_msgSend_setModifyMap_(self, v8, v7 | 0x20u, v9, v10);
  self->_lostNetworkScanCount = a3;
}

- (NSString)description
{
  int v70 = NSString;
  uint64_t v10 = "";
  if (objc_msgSend_modifyMap(self, a2, v2, v3, v4)) {
    uint64_t v11 = "*";
  }
  else {
    uint64_t v11 = "";
  }
  uint64_t v69 = v11;
  uint64_t v12 = objc_msgSend_channels(self, v6, v7, v8, v9);
  if ((objc_msgSend_modifyMap(self, v13, v14, v15, v16) & 2) != 0) {
    uint64_t v21 = "*";
  }
  else {
    uint64_t v21 = "";
  }
  uint64_t v68 = v21;
  uint64_t v22 = objc_msgSend_networks(self, v17, v18, v19, v20);
  if ((objc_msgSend_modifyMap(self, v23, v24, v25, v26) & 4) != 0) {
    uint64_t v31 = "*";
  }
  else {
    uint64_t v31 = "";
  }
  uint64_t v67 = v31;
  unsigned int v32 = objc_msgSend_cacheEnabled(self, v27, v28, v29, v30);
  if ((objc_msgSend_modifyMap(self, v33, v34, v35, v36) & 8) != 0) {
    v41 = "*";
  }
  else {
    v41 = "";
  }
  unsigned int v42 = objc_msgSend_cacheRollover(self, v37, v38, v39, v40);
  if ((objc_msgSend_modifyMap(self, v43, v44, v45, v46) & 0x10) != 0) {
    uint64_t v51 = "*";
  }
  else {
    uint64_t v51 = "";
  }
  uint64_t v52 = objc_msgSend_scanFrequency(self, v47, v48, v49, v50);
  if ((objc_msgSend_modifyMap(self, v53, v54, v55, v56) & 0x20) != 0) {
    uint64_t v10 = "*";
  }
  uint64_t v61 = objc_msgSend_lostNetworkScanCount(self, v57, v58, v59, v60);
  uint64_t v65 = objc_msgSend_stringWithFormat_(v70, v62, @"channels%s=%@, networks%s=%@, cache%s=%d, rollover%s=%d, freq%s=%lu, lostNetScan%s=%lu", v63, v64, v69, v12, v68, v22, v67, v32, v41, v42, v51, v52, v10, v61);

  return (NSString *)v65;
}

- (BOOL)isEqualToBackgroundScanConfiguration:(id)a3
{
  id v7 = a3;
  channels = self->_channels;
  objc_msgSend_channels(v7, v9, v10, v11, v12);
  uint64_t v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (channels == v17) {
    goto LABEL_7;
  }
  if (self->_channels)
  {
    uint64_t v18 = objc_msgSend_channels(v7, v13, v14, v15, v16);
    if (v18)
    {
      uint64_t v3 = (void *)v18;
      uint64_t v23 = self->_channels;
      uint64_t v24 = objc_msgSend_channels(v7, v19, v20, v21, v22);
      if (!objc_msgSend_isEqual_(v23, v25, (uint64_t)v24, v26, v27))
      {
        BOOL v28 = 0;
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v62 = v24;
LABEL_7:
      networks = self->_networks;
      objc_msgSend_networks(v7, v13, v14, v15, v16);
      uint64_t v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (networks != v34)
      {
        if (!self->_networks) {
          goto LABEL_21;
        }
        uint64_t v35 = objc_msgSend_networks(v7, v30, v31, v32, v33);
        if (!v35) {
          goto LABEL_19;
        }
        uint64_t v4 = (void *)v35;
        uint64_t v40 = self->_networks;
        uint64_t v5 = objc_msgSend_networks(v7, v36, v37, v38, v39);
        if (!objc_msgSend_isEqual_(v40, v41, (uint64_t)v5, v42, v43))
        {
          BOOL v28 = 0;
          uint64_t v24 = v62;
LABEL_16:

          goto LABEL_22;
        }
      }
      int cacheEnabled = self->_cacheEnabled;
      if (cacheEnabled == objc_msgSend_cacheEnabled(v7, v30, v31, v32, v33))
      {
        int cacheRollover = self->_cacheRollover;
        if (cacheRollover == objc_msgSend_cacheRollover(v7, v45, v46, v47, v48))
        {
          unint64_t scanFrequency = self->_scanFrequency;
          if (scanFrequency == objc_msgSend_scanFrequency(v7, v50, v51, v52, v53))
          {
            unint64_t lostNetworkScanCount = self->_lostNetworkScanCount;
            BOOL v28 = lostNetworkScanCount == objc_msgSend_lostNetworkScanCount(v7, v55, v56, v57, v58);
            BOOL v60 = networks == v34;
            uint64_t v24 = v62;
            if (v60) {
              goto LABEL_22;
            }
            goto LABEL_16;
          }
        }
      }
      if (networks != v34)
      {

LABEL_19:
        BOOL v28 = 0;
        uint64_t v24 = v62;
        if (channels == v17) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
LABEL_21:
      BOOL v28 = 0;
      uint64_t v24 = v62;
LABEL_22:

      if (channels == v17) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFBackgroundScanConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToBackgroundScanConfiguration = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToBackgroundScanConfiguration = objc_msgSend_isEqualToBackgroundScanConfiguration_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToBackgroundScanConfiguration = 0;
  }

  return isEqualToBackgroundScanConfiguration;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_channels, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_networks, v7, v8, v9, v10) ^ v6 ^ self->_cacheEnabled ^ (unint64_t)self->_cacheRollover ^ self->_scanFrequency ^ self->_lostNetworkScanCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFBackgroundScanConfiguration, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setChannels_(v11, v12, (uint64_t)self->_channels, v13, v14);
  objc_msgSend_setNetworks_(v11, v15, (uint64_t)self->_networks, v16, v17);
  objc_msgSend_setCacheEnabled_(v11, v18, self->_cacheEnabled, v19, v20);
  objc_msgSend_setCacheRollover_(v11, v21, self->_cacheRollover, v22, v23);
  objc_msgSend_setScanFrequency_(v11, v24, self->_scanFrequency, v25, v26);
  objc_msgSend_setLostNetworkScanCount_(v11, v27, self->_lostNetworkScanCount, v28, v29);
  objc_msgSend_setModifyMap_(v11, v30, *((unsigned __int8 *)&self->_cacheRollover + 1), v31, v32);
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  channels = self->_channels;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)channels, @"_channels", v7);
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_networks, @"_networks", v9);
  objc_msgSend_encodeBool_forKey_(v5, v10, self->_cacheEnabled, @"_cacheEnabled", v11);
  objc_msgSend_encodeBool_forKey_(v5, v12, self->_cacheRollover, @"_cacheRollover", v13);
  uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v14, self->_scanFrequency, v15, v16);
  objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)v17, @"_scanFrequency", v19);

  uint64_t v23 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v20, self->_lostNetworkScanCount, v21, v22);
  objc_msgSend_encodeObject_forKey_(v5, v24, (uint64_t)v23, @"_lostNetworkScanCount", v25);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v26, (uint64_t)(&self->_cacheRollover + 1), 1, v27);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v28, (uint64_t)v30, @"_modifyMap", v29);
}

- (CWFBackgroundScanConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)CWFBackgroundScanConfiguration;
  id v5 = [(CWFBackgroundScanConfiguration *)&v57 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v8, 0);
    uint64_t v15 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"_channels", v14);
    channels = v5->_channels;
    v5->_channels = (NSArray *)v15;

    uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v23 = objc_msgSend_setWithObjects_(v17, v20, v18, v21, v22, v19, 0);
    uint64_t v26 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, @"_networks", v25);
    networks = v5->_networks;
    v5->_networks = (NSArray *)v26;

    v5->_int cacheEnabled = objc_msgSend_decodeBoolForKey_(v4, v28, @"_cacheEnabled", v29, v30);
    v5->_int cacheRollover = objc_msgSend_decodeBoolForKey_(v4, v31, @"_cacheRollover", v32, v33);
    uint64_t v34 = objc_opt_class();
    uint64_t v37 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"_scanFrequency", v36);
    v5->_unint64_t scanFrequency = objc_msgSend_unsignedIntegerValue(v37, v38, v39, v40, v41);

    uint64_t v42 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"_lostNetworkScanCount", v44);
    v5->_unint64_t lostNetworkScanCount = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48, v49);

    uint64_t v50 = objc_opt_class();
    uint64_t v53 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"_modifyMap", v52);
    objc_msgSend_getBytes_length_(v53, v54, (uint64_t)(&v5->_cacheRollover + 1), 1, v55);
  }
  return v5;
}

- (NSArray)networks
{
  return self->_networks;
}

- (NSArray)channels
{
  return self->_channels;
}

- (BOOL)cacheEnabled
{
  return self->_cacheEnabled;
}

- (BOOL)cacheRollover
{
  return self->_cacheRollover;
}

- (unint64_t)scanFrequency
{
  return self->_scanFrequency;
}

- (unint64_t)lostNetworkScanCount
{
  return self->_lostNetworkScanCount;
}

- ($A4FF59F43F4B20644E55A5E6B3BB4A05)modifyMap
{
  return ($A4FF59F43F4B20644E55A5E6B3BB4A05)*((unsigned __int8 *)&self->_cacheRollover + 1);
}

- (void)setModifyMap:(id)a3
{
  *(&self->_cacheRollover + 1) = (BOOL)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_networks, 0);
}

@end