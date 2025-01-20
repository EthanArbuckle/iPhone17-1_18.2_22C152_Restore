@interface CWFBSS
+ (BOOL)supportsSecureCoding;
+ (id)supportedOSSpecificKeys;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBSS:(id)a3;
- (CLLocation)location;
- (CWFBSS)init;
- (CWFBSS)initWithCoder:(id)a3;
- (CWFBSS)initWithExternalForm:(id)a3;
- (CWFChannel)channel;
- (CWFChannel)colocated2GHzRNRChannel;
- (CWFChannel)colocated5GHzRNRChannel;
- (NSData)DHCPServerID;
- (NSData)DHCPv6ServerID;
- (NSDate)AWDLRealTimeModeTimestamp;
- (NSDate)lastAssociatedAt;
- (NSDictionary)OSSpecificAttributes;
- (NSMutableDictionary)internal;
- (NSSet)properties;
- (NSString)BSSID;
- (NSString)IPv4NetworkSignature;
- (NSString)IPv6NetworkSignature;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleKeyValueMap;
- (id)OSSpecificValueForKey:(id)a3;
- (id)__coreWiFiSpecificProperties;
- (id)__defaultProperties;
- (id)__filteredBSSWithProperties:(id)a3 includeRequiredProperties:(BOOL)a4 OSSpecificKeys:(id)a5;
- (id)__infoForLocation:(id)a3;
- (id)__keyForProperty:(int64_t)a3;
- (id)__locationFromInfo:(id)a3;
- (id)__requiredProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreWiFiSpecificAttributes;
- (id)externalForm;
- (id)filteredBSSWithProperties:(id)a3;
- (id)filteredBSSWithProperties:(id)a3 OSSpecificKeys:(id)a4;
- (int64_t)__propertyForKey:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithBSS:(id)a3;
- (void)setAWDLRealTimeModeTimestamp:(id)a3;
- (void)setBSSID:(id)a3;
- (void)setChannel:(id)a3;
- (void)setColocated2GHzRNRChannel:(id)a3;
- (void)setColocated5GHzRNRChannel:(id)a3;
- (void)setCoreWiFiSpecificAttributes:(id)a3;
- (void)setDHCPServerID:(id)a3;
- (void)setDHCPv6ServerID:(id)a3;
- (void)setIPv4NetworkSignature:(id)a3;
- (void)setIPv6NetworkSignature:(id)a3;
- (void)setInternal:(id)a3;
- (void)setLastAssociatedAt:(id)a3;
- (void)setLocation:(id)a3;
- (void)setOSSpecificAttributes:(id)a3;
- (void)setOSSpecificValue:(id)a3 forKey:(id)a4;
@end

@implementation CWFBSS

- (void)setOSSpecificAttributes:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9 = v4;
  if (v4)
  {
    v45 = self;
    v46 = v4;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v10 = objc_msgSend_allKeys(v4, v5, v6, v7, v8);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v47, (uint64_t)v59, 16);
    if (v12)
    {
      uint64_t v17 = v12;
      v18 = 0;
      uint64_t v19 = *(void *)v48;
      v20 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(v10);
          }
          uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          v23 = objc_msgSend_supportedOSSpecificKeys(CWFBSS, v13, v14, v15, v16, v43, v44);
          char v27 = objc_msgSend_containsObject_(v23, v24, v22, v25, v26);

          if ((v27 & 1) == 0)
          {
            if (!v18)
            {
              v18 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v13, v14, v15, v16);
            }
            objc_msgSend_addObject_(v18, v13, v22, v15, v16);
            v28 = CWFGetOSLog();
            if (v28)
            {
              v29 = CWFGetOSLog();
            }
            else
            {
              v30 = v20;
              v29 = v20;
            }

            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              int v51 = 136446978;
              v52 = "-[CWFBSS setOSSpecificAttributes:]";
              __int16 v53 = 2082;
              v54 = "CWFBSS.m";
              __int16 v55 = 1024;
              int v56 = 684;
              __int16 v57 = 2112;
              uint64_t v58 = v22;
              LODWORD(v44) = 38;
              v43 = &v51;
              _os_log_send_and_compose_impl();
            }
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v47, (uint64_t)v59, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    if (objc_msgSend_count(v18, v32, v33, v34, v35))
    {
      v9 = v46;
      v31 = objc_msgSend_mutableCopy(v46, v36, v37, v38, v39);
      objc_msgSend_removeObjectsForKeys_(v31, v40, (uint64_t)v18, v41, v42);
    }
    else
    {
      v31 = 0;
      v9 = v46;
    }
    self = v45;
  }
  else
  {
    v31 = 0;
  }
  if (v31) {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v31, (uint64_t)&unk_1F0DC76B0, v8, v43, v44);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v5, (uint64_t)v9, (uint64_t)&unk_1F0DC76B0, v8, v43, v44);
  }
}

- (void)setLocation:(id)a3
{
  objc_msgSend___infoForLocation_(self, a2, (uint64_t)a3, v3, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v6, (uint64_t)v8, (uint64_t)&unk_1F0DC76F8, v7);
}

- (id)__infoForLocation:(id)a3
{
  v44[4] = *MEMORY[0x1E4F143B8];
  v43[0] = @"LocationLatitude";
  uint64_t v3 = NSNumber;
  id v4 = a3;
  objc_msgSend_coordinate(v4, v5, v6, v7, v8);
  v13 = objc_msgSend_numberWithDouble_(v3, v9, v10, v11, v12);
  v44[0] = v13;
  v43[1] = @"LocationLongitude";
  uint64_t v14 = NSNumber;
  objc_msgSend_coordinate(v4, v15, v16, v17, v18);
  v24 = objc_msgSend_numberWithDouble_(v14, v19, v20, v21, v22, v23);
  v44[1] = v24;
  v43[2] = @"LocationAccuracy";
  uint64_t v25 = NSNumber;
  objc_msgSend_horizontalAccuracy(v4, v26, v27, v28, v29);
  uint64_t v34 = objc_msgSend_numberWithDouble_(v25, v30, v31, v32, v33);
  v44[2] = v34;
  v43[3] = @"LocationTimestamp";
  uint64_t v39 = objc_msgSend_timestamp(v4, v35, v36, v37, v38);

  v44[3] = v39;
  uint64_t v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v40, (uint64_t)v44, (uint64_t)v43, 4);

  return v41;
}

- (CWFBSS)initWithCoder:(id)a3
{
  v29[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CWFBSS;
  v5 = [(CWFBSS *)&v28 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA80];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    v29[4] = objc_opt_class();
    v29[5] = objc_opt_class();
    v29[6] = objc_opt_class();
    v29[7] = objc_opt_class();
    v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v29, 8, v8);
    v13 = objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11, v12);

    if (sub_1B4F39A34())
    {
      sub_1B4F39880();
      uint64_t v16 = objc_opt_class();
      objc_msgSend_addObject_(v13, v17, v16, v18, v19);
    }
    uint64_t v20 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v13, @"_internal", v15);
    uint64_t v25 = objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);
    internal = v5->_internal;
    v5->_internal = (NSMutableDictionary *)v25;
  }
  return v5;
}

- (NSString)description
{
  uint64_t v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_BSSID(self, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_redactedForWiFi(v11, v12, v13, v14, v15);
  objc_msgSend_appendFormat_(v6, v17, @"bssid=%@, ", v18, v19, v16);

  uint64_t v24 = objc_msgSend_channel(self, v20, v21, v22, v23);
  objc_msgSend_appendFormat_(v6, v25, @"channel=%@", v26, v27, v24);

  uint64_t v32 = objc_msgSend_channel(self, v28, v29, v30, v31);
  if ((objc_msgSend_is6GHz(v32, v33, v34, v35, v36) & 1) == 0)
  {

    goto LABEL_5;
  }
  uint64_t v41 = objc_msgSend_colocated2GHzRNRChannel(self, v37, v38, v39, v40);
  if (!v41)
  {
    __int16 v53 = objc_msgSend_colocated5GHzRNRChannel(self, v42, v43, v44, v45);

    if (v53) {
      goto LABEL_7;
    }
LABEL_5:
    objc_msgSend_appendString_(v6, v46, @", ", v47, v48);
    goto LABEL_14;
  }

LABEL_7:
  objc_msgSend_appendString_(v6, v46, @" ("), v47, v48;
  uint64_t v58 = objc_msgSend_colocated2GHzRNRChannel(self, v54, v55, v56, v57);

  if (v58)
  {
    v63 = objc_msgSend_colocated2GHzRNRChannel(self, v59, v60, v61, v62);
    objc_msgSend_appendFormat_(v6, v64, @"%@, ", v65, v66, v63);
  }
  v67 = objc_msgSend_colocated5GHzRNRChannel(self, v59, v60, v61, v62);

  if (v67)
  {
    v72 = objc_msgSend_colocated5GHzRNRChannel(self, v68, v69, v70, v71);
    objc_msgSend_appendFormat_(v6, v73, @"%@, ", v74, v75, v72);
  }
  if (objc_msgSend_hasSuffix_(v6, v68, @", ", v70, v71))
  {
    uint64_t v80 = objc_msgSend_length(v6, v76, v77, v78, v79);
    objc_msgSend_deleteCharactersInRange_(v6, v81, v80 - 2, 2, v82);
  }
  objc_msgSend_appendString_(v6, v76, @", "), v78, v79);
LABEL_14:
  v83 = objc_msgSend_lastAssociatedAt(self, v49, v50, v51, v52);

  if (v83)
  {
    v88 = objc_msgSend_lastAssociatedAt(self, v84, v85, v86, v87);
    v89 = sub_1B4F3D76C(v88);
    objc_msgSend_appendFormat_(v6, v90, @"assoc=%@, ", v91, v92, v89);
  }
  if (objc_msgSend_hasSuffix_(v6, v84, @", ", v86, v87))
  {
    uint64_t v97 = objc_msgSend_length(v6, v93, v94, v95, v96);
    objc_msgSend_deleteCharactersInRange_(v6, v98, v97 - 2, 2, v99);
  }
  return (NSString *)v6;
}

- (CWFChannel)channel
{
  return (CWFChannel *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7698, v2, v3);
}

- (NSDate)lastAssociatedAt
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC76C8, v2, v3);
}

- (void)setCoreWiFiSpecificAttributes:(id)a3
{
  id v4 = a3;
  objc_msgSend___coreWiFiSpecificProperties(self, v5, v6, v7, v8);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [CWFBSS alloc];
  uint64_t v13 = objc_msgSend_initWithExternalForm_(v9, v10, (uint64_t)v4, v11, v12);

  uint64_t v17 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v14, (uint64_t)v34, v15, v16);
  uint64_t v22 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v18, v19, v20, v21);
  uint64_t v24 = objc_msgSend___filteredBSSWithProperties_includeRequiredProperties_OSSpecificKeys_(v13, v23, (uint64_t)v17, 0, (uint64_t)v22);

  internal = self->_internal;
  uint64_t v30 = objc_msgSend_internal(v24, v26, v27, v28, v29);
  objc_msgSend_addEntriesFromDictionary_(internal, v31, (uint64_t)v30, v32, v33);
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_BSSID(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_hash(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_internal(self, v12, v13, v14, v15);
  unint64_t v21 = objc_msgSend_hash(v16, v17, v18, v19, v20) ^ v11;

  return v21;
}

- (NSString)BSSID
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7680, v2, v3);
}

- (NSMutableDictionary)internal
{
  return self->_internal;
}

- (id)__coreWiFiSpecificProperties
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)__filteredBSSWithProperties:(id)a3 includeRequiredProperties:(BOOL)a4 OSSpecificKeys:(id)a5
{
  BOOL v6 = a4;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(CWFBSS);
  uint64_t v15 = objc_msgSend_mutableCopy(self->_internal, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_properties(self, v16, v17, v18, v19);
  uint64_t v25 = objc_msgSend_mutableCopy(v20, v21, v22, v23, v24);

  if (v6)
  {
    uint64_t v30 = objc_msgSend___requiredProperties(self, v26, v27, v28, v29);
    objc_msgSend_minusSet_(v25, v31, (uint64_t)v30, v32, v33);
  }
  if (v8)
  {
    objc_msgSend_minusSet_(v25, v26, (uint64_t)v8, v28, v29);
  }
  else
  {
    uint64_t v38 = objc_msgSend___defaultProperties(self, v26, v27, v28, v29);
    objc_msgSend_minusSet_(v25, v39, (uint64_t)v38, v40, v41);
  }
  uint64_t v42 = objc_msgSend_allObjects(v25, v34, v35, v36, v37);
  objc_msgSend_removeObjectsForKeys_(v15, v43, (uint64_t)v42, v44, v45);

  objc_msgSend_setInternal_(v10, v46, (uint64_t)v15, v47, v48);
  int v52 = objc_msgSend_containsObject_(v8, v49, (uint64_t)&unk_1F0DC76B0, v50, v51);
  if (v9 && v52)
  {
    uint64_t v94 = v25;
    uint64_t v95 = v15;
    uint64_t v96 = v10;
    id v97 = v8;
    uint64_t v57 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v53, v54, v55, v56);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    uint64_t v62 = objc_msgSend_OSSpecificAttributes(self, v58, v59, v60, v61);
    v67 = objc_msgSend_allKeys(v62, v63, v64, v65, v66);

    uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v98, (uint64_t)v102, 16);
    if (v69)
    {
      uint64_t v73 = v69;
      uint64_t v74 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v73; ++i)
        {
          if (*(void *)v99 != v74) {
            objc_enumerationMutation(v67);
          }
          uint64_t v76 = *(void *)(*((void *)&v98 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(v9, v70, v76, v71, v72))
          {
            uint64_t v78 = objc_msgSend_OSSpecificAttributes(self, v70, v77, v71, v72);
            uint64_t v82 = objc_msgSend_objectForKeyedSubscript_(v78, v79, v76, v80, v81);
            objc_msgSend_setObject_forKeyedSubscript_(v57, v83, (uint64_t)v82, v76, v84);
          }
        }
        uint64_t v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v98, (uint64_t)v102, 16);
      }
      while (v73);
    }

    v89 = objc_msgSend_copy(v57, v85, v86, v87, v88);
    uint64_t v10 = v96;
    objc_msgSend_setOSSpecificAttributes_(v96, v90, (uint64_t)v89, v91, v92);

    id v8 = v97;
    uint64_t v25 = v94;
    uint64_t v15 = v95;
  }

  return v10;
}

- (NSSet)properties
{
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v6 = objc_msgSend_allKeys(self->_internal, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_setWithArray_(v5, v7, (uint64_t)v6, v8, v9);

  return (NSSet *)v10;
}

- (CWFBSS)initWithExternalForm:(id)a3
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v14 = (CWFBSS *)objc_msgSend_init(self, v6, v7, v8, v9);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v10, v11, v12, v13);
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    objc_msgSend_allKeys(v5, v16, v17, v18, v19);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v135, (uint64_t)v139, 16);
    if (v134)
    {
      uint64_t v133 = *(void *)v136;
      v131 = @"ChannelFlags";
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v136 != v133) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v135 + 1) + 8 * v24);
          uint64_t v26 = objc_msgSend___propertyForKey_(v14, v21, v25, v22, v23, v131);
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = v3;
            uint64_t v29 = objc_msgSend_numberWithInteger_(NSNumber, v21, v26, v22, v23);
            uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v15, v30, (uint64_t)v29, v31, v32);

            if (v33)
            {
              uint64_t v3 = v28;
            }
            else
            {
              uint64_t v3 = v28;
              switch(v27)
              {
                case 2:
                  id v34 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"Channel", v22, v23);
                  uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v5, v35, (uint64_t)v131, v36, v37);
                  uint64_t v39 = (void *)v38;
                  if (!v34 || !v38) {
                    goto LABEL_26;
                  }
                  uint64_t v40 = objc_alloc_init(CWFChannel);
                  uint64_t v45 = objc_msgSend_unsignedIntegerValue(v34, v41, v42, v43, v44);
                  objc_msgSend_setChannel_(v40, v46, v45, v47, v48);
                  uint64_t v53 = objc_msgSend_unsignedIntValue(v39, v49, v50, v51, v52);
                  objc_msgSend_setFlags_(v40, v54, v53, v55, v56);
                  objc_msgSend_numberWithInteger_(NSNumber, v57, 2, v58, v59);
                  break;
                case 4:
                  v83 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"Location", v22, v23);
                  id v34 = objc_msgSend___locationFromInfo_(v14, v84, (uint64_t)v83, v85, v86);

                  if (v34
                    || (objc_msgSend___locationFromInfo_(v14, v87, (uint64_t)v5, v88, v89),
                        (id v34 = objc_claimAutoreleasedReturnValue()) != 0))
                  {
                    uint64_t v28 = objc_msgSend___infoForLocation_(v14, v87, (uint64_t)v34, v88, v89);
                    char v90 = 0;
                    uint64_t v91 = v28;
                  }
                  else
                  {
                    uint64_t v91 = 0;
                    char v90 = 1;
                  }
                  uint64_t v92 = objc_msgSend_numberWithInteger_(NSNumber, v87, 4, v88, v89);
                  objc_msgSend_setObject_forKeyedSubscript_(v15, v93, v91, (uint64_t)v92, v94);

                  uint64_t v39 = (void *)v28;
                  uint64_t v3 = v28;
                  if (v90) {
                    goto LABEL_27;
                  }
                  goto LABEL_26;
                case 10:
                  id v34 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"colocated2GHzRNRChannel", v22, v23);
                  uint64_t v63 = objc_msgSend_objectForKeyedSubscript_(v5, v60, @"colocated2GHzRNRChannelFlags", v61, v62);
                  uint64_t v39 = (void *)v63;
                  if (!v34 || !v63) {
                    goto LABEL_26;
                  }
                  uint64_t v40 = objc_alloc_init(CWFChannel);
                  uint64_t v68 = objc_msgSend_unsignedIntegerValue(v34, v64, v65, v66, v67);
                  objc_msgSend_setChannel_(v40, v69, v68, v70, v71);
                  uint64_t v76 = objc_msgSend_unsignedIntValue(v39, v72, v73, v74, v75);
                  objc_msgSend_setFlags_(v40, v77, v76, v78, v79);
                  objc_msgSend_numberWithInteger_(NSNumber, v80, 10, v81, v82);
                  break;
                case 11:
                  id v34 = objc_msgSend_objectForKeyedSubscript_(v5, v21, @"colocated5GHzRNRChannel", v22, v23);
                  uint64_t v98 = objc_msgSend_objectForKeyedSubscript_(v5, v95, @"colocated5GHzRNRChannelFlags", v96, v97);
                  uint64_t v39 = (void *)v98;
                  if (!v34 || !v98) {
                    goto LABEL_26;
                  }
                  uint64_t v40 = objc_alloc_init(CWFChannel);
                  uint64_t v103 = objc_msgSend_unsignedIntegerValue(v34, v99, v100, v101, v102);
                  objc_msgSend_setChannel_(v40, v104, v103, v105, v106);
                  uint64_t v111 = objc_msgSend_unsignedIntValue(v39, v107, v108, v109, v110);
                  objc_msgSend_setFlags_(v40, v112, v111, v113, v114);
                  objc_msgSend_numberWithInteger_(NSNumber, v115, 11, v116, v117);
                  break;
                default:
                  id v34 = objc_msgSend_objectForKeyedSubscript_(v5, v21, v25, v22, v23);
                  uint64_t v39 = objc_msgSend_numberWithInteger_(NSNumber, v121, v27, v122, v123);
                  objc_msgSend_setObject_forKeyedSubscript_(v15, v124, (uint64_t)v34, (uint64_t)v39, v125);
                  goto LABEL_26;
              v118 = };
              objc_msgSend_setObject_forKeyedSubscript_(v15, v119, (uint64_t)v40, (uint64_t)v118, v120);

              uint64_t v3 = v28;
LABEL_26:

LABEL_27:
            }
          }
          ++v24;
        }
        while (v134 != v24);
        uint64_t v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v135, (uint64_t)v139, 16);
        uint64_t v134 = v126;
      }
      while (v126);
    }

    objc_msgSend_setInternal_(v14, v127, (uint64_t)v15, v128, v129);
  }

  return v14;
}

- (CWFBSS)init
{
  v6.receiver = self;
  v6.super_class = (Class)CWFBSS;
  uint64_t v2 = [(CWFBSS *)&v6 init];
  if (!v2
    || (uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]),
        internal = v2->_internal,
        v2->_internal = v3,
        internal,
        !v2->_internal))
  {

    return 0;
  }
  return v2;
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)setLastAssociatedAt:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC76C8, v3);
}

- (void)setIPv6NetworkSignature:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7788, v3);
}

- (void)setIPv4NetworkSignature:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7770, v3);
}

- (void)setDHCPv6ServerID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7758, v3);
}

- (void)setDHCPServerID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7740, v3);
}

- (void)setChannel:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7698, v3);
}

- (void)setBSSID:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7680, v3);
}

- (void)setAWDLRealTimeModeTimestamp:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC76E0, v3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_internal, @"_internal", v3);
}

+ (id)supportedOSSpecificKeys
{
  if (qword_1EB4B2660 != -1) {
    dispatch_once(&qword_1EB4B2660, &unk_1F0DA3F30);
  }
  uint64_t v2 = (void *)qword_1EB4B2658;
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__keyForProperty:(int64_t)a3
{
  int64_t v4 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 0xB && ((0x9FDu >> v4))
  {
    id v5 = *off_1E60BC2C8[v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (int64_t)__propertyForKey:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"BSSID", v5, v6))
  {
    int64_t v10 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v7, @"Channel", v8, v9) & 1) != 0 {
         || (objc_msgSend_isEqualToString_(v3, v11, @"ChannelFlags", v12, v13) & 1) != 0)
  }
  {
    int64_t v10 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, @"LastAssociatedAt", v15, v16))
  {
    int64_t v10 = 3;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v18, @"Location", v19, v20) & 1) != 0 {
         || (objc_msgSend_isEqualToString_(v3, v21, @"LocationLatitude", v22, v23) & 1) != 0
  }
         || (objc_msgSend_isEqualToString_(v3, v24, @"LocationLongitude", v25, v26) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v27, @"LocationAccuracy", v28, v29) & 1) != 0
         || (objc_msgSend_isEqualToString_(v3, v30, @"LocationTimestamp", v31, v32) & 1) != 0)
  {
    int64_t v10 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v33, @"AWDLRealTimeModeTimestamp", v34, v35))
  {
    int64_t v10 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v36, @"DHCPServerID", v37, v38))
  {
    int64_t v10 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v39, @"DHCPv6ServerID", v40, v41))
  {
    int64_t v10 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v42, @"IPv4NetworkSignature", v43, v44))
  {
    int64_t v10 = 8;
  }
  else if (objc_msgSend_isEqualToString_(v3, v45, @"IPv6NetworkSignature", v46, v47))
  {
    int64_t v10 = 9;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v48, @"colocated2GHzRNRChannel", v49, v50) & 1) != 0 {
         || (objc_msgSend_isEqualToString_(v3, v51, @"colocated2GHzRNRChannelFlags", v52, v53) & 1) != 0)
  }
  {
    int64_t v10 = 10;
  }
  else if ((objc_msgSend_isEqualToString_(v3, v54, @"colocated5GHzRNRChannel", v55, v56) & 1) != 0 {
         || (objc_msgSend_isEqualToString_(v3, v57, @"colocated5GHzRNRChannelFlags", v58, v59) & 1) != 0)
  }
  {
    int64_t v10 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v3, v60, @"__OSSpecific__", v61, v62))
  {
    int64_t v10 = 12;
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)externalForm
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3, v4);
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v11 = objc_msgSend_allKeys(self->_internal, v7, v8, v9, v10);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v122, (uint64_t)v126, 16);
  if (v13)
  {
    uint64_t v18 = v13;
    uint64_t v19 = *(void *)v123;
    v121 = @"ChannelFlags";
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v123 != v19) {
          objc_enumerationMutation(v11);
        }
        unint64_t v21 = *(void **)(*((void *)&v122 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_integerValue(v21, v14, v15, v16, v17, v121);
        uint64_t v26 = objc_msgSend___keyForProperty_(self, v23, v22, v24, v25);
        uint64_t v31 = objc_msgSend_integerValue(v21, v27, v28, v29, v30);
        uint64_t v35 = v31;
        if (v26)
        {
          uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
          uint64_t v41 = v36;
          if (v35 != 12 || objc_msgSend_count(v36, v37, v38, v39, v40)) {
            objc_msgSend_setObject_forKeyedSubscript_(v6, v37, (uint64_t)v41, (uint64_t)v26, v40);
          }
          goto LABEL_20;
        }
        switch(v31)
        {
          case 11:
            uint64_t v91 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
            uint64_t v41 = v91;
            if (v91)
            {
              uint64_t v96 = NSNumber;
              uint64_t v97 = objc_msgSend_channel(v91, v92, v93, v94, v95);
              uint64_t v101 = objc_msgSend_numberWithUnsignedInteger_(v96, v98, v97, v99, v100);
              objc_msgSend_setObject_forKeyedSubscript_(v6, v102, (uint64_t)v101, @"colocated5GHzRNRChannel", v103);

              v104 = NSNumber;
              uint64_t v109 = objc_msgSend_flags(v41, v105, v106, v107, v108);
              uint64_t v64 = objc_msgSend_numberWithUnsignedInt_(v104, v110, v109, v111, v112);
              objc_msgSend_setObject_forKeyedSubscript_(v6, v113, (uint64_t)v64, @"colocated5GHzRNRChannelFlags", v114);
              goto LABEL_19;
            }
            break;
          case 10:
            uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
            uint64_t v41 = v67;
            if (v67)
            {
              uint64_t v72 = NSNumber;
              uint64_t v73 = objc_msgSend_channel(v67, v68, v69, v70, v71);
              uint64_t v77 = objc_msgSend_numberWithUnsignedInteger_(v72, v74, v73, v75, v76);
              objc_msgSend_setObject_forKeyedSubscript_(v6, v78, (uint64_t)v77, @"colocated2GHzRNRChannel", v79);

              uint64_t v80 = NSNumber;
              uint64_t v85 = objc_msgSend_flags(v41, v81, v82, v83, v84);
              uint64_t v64 = objc_msgSend_numberWithUnsignedInt_(v80, v86, v85, v87, v88);
              objc_msgSend_setObject_forKeyedSubscript_(v6, v89, (uint64_t)v64, @"colocated2GHzRNRChannelFlags", v90);
              goto LABEL_19;
            }
            break;
          case 2:
            uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v32, (uint64_t)v21, v33, v34);
            uint64_t v41 = v42;
            if (v42)
            {
              uint64_t v47 = NSNumber;
              uint64_t v48 = objc_msgSend_channel(v42, v43, v44, v45, v46);
              uint64_t v52 = objc_msgSend_numberWithUnsignedInteger_(v47, v49, v48, v50, v51);
              objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, @"Channel", v54);

              uint64_t v55 = NSNumber;
              uint64_t v60 = objc_msgSend_flags(v41, v56, v57, v58, v59);
              uint64_t v64 = objc_msgSend_numberWithUnsignedInt_(v55, v61, v60, v62, v63);
              objc_msgSend_setObject_forKeyedSubscript_(v6, v65, (uint64_t)v64, (uint64_t)v121, v66);
LABEL_19:
            }
            break;
          default:
            goto LABEL_21;
        }
LABEL_20:

LABEL_21:
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v122, (uint64_t)v126, 16);
    }
    while (v18);
  }

  v119 = objc_msgSend_copy(v6, v115, v116, v117, v118);
  return v119;
}

- (void)mergeWithBSS:(id)a3
{
  internal = self->_internal;
  objc_msgSend_internal(a3, a2, (uint64_t)a3, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(internal, v6, (uint64_t)v9, v7, v8);
}

- (id)__defaultProperties
{
  uint64_t v8 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, v2, v3, v4);
  for (uint64_t i = 0; i != 13; ++i)
  {
    uint64_t v10 = objc_msgSend_numberWithInteger_(NSNumber, v5, i, v6, v7);
    objc_msgSend_addObject_(v8, v11, (uint64_t)v10, v12, v13);
  }
  uint64_t v15 = objc_msgSend_copy(v8, v5, v14, v6, v7);

  return v15;
}

- (id)__requiredProperties
{
  return (id)objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], a2, (uint64_t)&unk_1F0DC8730, v2, v3);
}

- (id)filteredBSSWithProperties:(id)a3
{
  return (id)objc_msgSend___filteredBSSWithProperties_includeRequiredProperties_OSSpecificKeys_(self, a2, (uint64_t)a3, 1, 0);
}

- (id)filteredBSSWithProperties:(id)a3 OSSpecificKeys:(id)a4
{
  return (id)objc_msgSend___filteredBSSWithProperties_includeRequiredProperties_OSSpecificKeys_(self, a2, (uint64_t)a3, 1, (uint64_t)a4);
}

- (id)coreWiFiSpecificAttributes
{
  uint64_t v6 = objc_msgSend___coreWiFiSpecificProperties(self, a2, v2, v3, v4);
  uint64_t v10 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v7, (uint64_t)v6, v8, v9);
  uint64_t v15 = objc_msgSend_set(MEMORY[0x1E4F1CAD0], v11, v12, v13, v14);
  uint64_t v17 = objc_msgSend___filteredBSSWithProperties_includeRequiredProperties_OSSpecificKeys_(self, v16, (uint64_t)v10, 0, (uint64_t)v15);

  uint64_t v22 = objc_msgSend_externalForm(v17, v18, v19, v20, v21);

  return v22;
}

- (NSDate)AWDLRealTimeModeTimestamp
{
  return (NSDate *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC76E0, v2, v3);
}

- (id)__locationFromInfo:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"LocationLatitude", v5, v6);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v3, v8, @"LocationLongitude", v9, v10);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v3, v12, @"LocationAccuracy", v13, v14);
  uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v3, v16, @"LocationTimestamp", v17, v18);
  uint64_t v24 = (void *)v19;
  if (v7) {
    BOOL v25 = v11 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (v25 || v15 == 0 || v19 == 0) {
    goto LABEL_19;
  }
  objc_msgSend_doubleValue(v7, v20, v21, v22, v23);
  double v29 = v28;
  objc_msgSend_doubleValue(v11, v30, v31, v32, v33);
  double v35 = v34;
  uint64_t v78 = 0;
  uint64_t v79 = &v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v36 = (double (*)(double, double))off_1EB4B2668;
  uint64_t v81 = off_1EB4B2668;
  if (!off_1EB4B2668)
  {
    uint64_t v74 = MEMORY[0x1E4F143A8];
    uint64_t v75 = 3221225472;
    uint64_t v76 = sub_1B4F922FC;
    uint64_t v77 = &unk_1E60BAFD8;
    uint64_t v37 = sub_1B4F9234C();
    v79[3] = (uint64_t)dlsym(v37, "CLLocationCoordinate2DMake");
    off_1EB4B2668 = (_UNKNOWN *)v79[3];
    uint64_t v36 = (double (*)(double, double))v79[3];
  }
  _Block_object_dispose(&v78, 8);
  if (!v36)
  {
    uint64_t v62 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v38, v39, v40, v41);
    uint64_t v66 = objc_msgSend_stringWithUTF8String_(NSString, v63, (uint64_t)"CLLocationCoordinate2D soft_CLLocationCoordinate2DMake(CLLocationDegrees, CLLocationDegrees)", v64, v65);
    uint64_t v67 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v62, v68, (uint64_t)v66, @"CWFBSS.m", 34, @"%s", v67, v74, v75, v76, v77);
LABEL_25:

    __break(1u);
    return result;
  }
  double v42 = v36(v29, v35);
  double v44 = v43;
  uint64_t v78 = 0;
  uint64_t v79 = &v78;
  uint64_t v80 = 0x2020000000;
  uint64_t v45 = (unsigned int (*)(double, double))off_1EB4B2670;
  uint64_t v81 = off_1EB4B2670;
  if (!off_1EB4B2670)
  {
    uint64_t v74 = MEMORY[0x1E4F143A8];
    uint64_t v75 = 3221225472;
    uint64_t v76 = sub_1B4F92470;
    uint64_t v77 = &unk_1E60BAFD8;
    uint64_t v46 = sub_1B4F9234C();
    v79[3] = (uint64_t)dlsym(v46, "CLLocationCoordinate2DIsValid");
    off_1EB4B2670 = (_UNKNOWN *)v79[3];
    uint64_t v45 = (unsigned int (*)(double, double))v79[3];
  }
  _Block_object_dispose(&v78, 8);
  if (!v45)
  {
    uint64_t v62 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v47, v48, v49, v50);
    uint64_t v66 = objc_msgSend_stringWithUTF8String_(NSString, v69, (uint64_t)"BOOL soft_CLLocationCoordinate2DIsValid(CLLocationCoordinate2D)", v70, v71);
    uint64_t v72 = dlerror();
    objc_msgSend_handleFailureInFunction_file_lineNumber_description_(v62, v73, (uint64_t)v66, @"CWFBSS.m", 40, @"%s", v72, v74, v75, v76, v77);
    goto LABEL_25;
  }
  if (!v45(v42, v44))
  {
LABEL_19:
    uint64_t v60 = 0;
    goto LABEL_20;
  }
  id v51 = objc_alloc((Class)sub_1B4F39880());
  objc_msgSend_doubleValue(v15, v52, v53, v54, v55);
  uint64_t v60 = objc_msgSend_initWithCoordinate_altitude_horizontalAccuracy_verticalAccuracy_timestamp_(v51, v56, (uint64_t)v24, v57, v58, v42, v44, 0.0, v59, 0.0);
LABEL_20:

  return v60;
}

- (CLLocation)location
{
  uint64_t v5 = objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC76F8, v2, v3);
  uint64_t v9 = objc_msgSend___locationFromInfo_(self, v6, (uint64_t)v5, v7, v8);

  return (CLLocation *)v9;
}

- (CWFChannel)colocated2GHzRNRChannel
{
  return (CWFChannel *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7710, v2, v3);
}

- (void)setColocated2GHzRNRChannel:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7710, v3);
}

- (CWFChannel)colocated5GHzRNRChannel
{
  return (CWFChannel *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7728, v2, v3);
}

- (void)setColocated5GHzRNRChannel:(id)a3
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_internal, a2, (uint64_t)a3, (uint64_t)&unk_1F0DC7728, v3);
}

- (NSData)DHCPServerID
{
  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7740, v2, v3);
}

- (NSData)DHCPv6ServerID
{
  return (NSData *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7758, v2, v3);
}

- (NSString)IPv4NetworkSignature
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7770, v2, v3);
}

- (NSString)IPv6NetworkSignature
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC7788, v2, v3);
}

- (NSDictionary)OSSpecificAttributes
{
  return (NSDictionary *)objc_msgSend_objectForKeyedSubscript_(self->_internal, a2, (uint64_t)&unk_1F0DC76B0, v2, v3);
}

- (void)setOSSpecificValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v11 = a4;
  if (v11
    && (objc_msgSend_supportedOSSpecificKeys(CWFBSS, v7, v8, v9, v10),
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        int v16 = objc_msgSend_containsObject_(v12, v13, (uint64_t)v11, v14, v15),
        v12,
        v16))
  {
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v17, (uint64_t)&unk_1F0DC76B0, v18, v19);

    if (v6 && !v20)
    {
      BOOL v25 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v21, v22, v23, v24);
      objc_msgSend_setObject_forKeyedSubscript_(self->_internal, v26, (uint64_t)v25, (uint64_t)&unk_1F0DC76B0, v27);
    }
    double v28 = objc_msgSend_objectForKeyedSubscript_(self->_internal, v21, (uint64_t)&unk_1F0DC76B0, v23, v24);
    objc_msgSend_setObject_forKeyedSubscript_(v28, v29, (uint64_t)v6, (uint64_t)v11, v30);
  }
  else
  {
    uint64_t v31 = CWFGetOSLog();
    if (v31)
    {
      double v28 = CWFGetOSLog();
    }
    else
    {
      double v28 = MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      _os_log_send_and_compose_impl();
    }
  }
}

- (id)OSSpecificValueForKey:(id)a3
{
  if (a3)
  {
    internal = self->_internal;
    id v4 = a3;
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(internal, v5, (uint64_t)&unk_1F0DC76B0, v6, v7);
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v4, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (NSString)debugDescription
{
  uint64_t v6 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_description(self, v7, v8, v9, v10);
  objc_msgSend_appendString_(v6, v12, (uint64_t)v11, v13, v14);

  objc_msgSend_appendString_(v6, v15, @", ", v16, v17);
  uint64_t v22 = objc_msgSend_IPv4NetworkSignature(self, v18, v19, v20, v21);

  if (v22)
  {
    uint64_t v27 = objc_msgSend_IPv4NetworkSignature(self, v23, v24, v25, v26);
    objc_msgSend_appendFormat_(v6, v28, @"ipv4=%@, ", v29, v30, v27);
  }
  uint64_t v31 = objc_msgSend_DHCPServerID(self, v23, v24, v25, v26);

  if (v31)
  {
    uint64_t v36 = objc_msgSend_DHCPServerID(self, v32, v33, v34, v35);
    uint64_t v41 = CWFHexadecimalStringFromData(v36, v37, v38, v39, v40);
    objc_msgSend_appendFormat_(v6, v42, @"dhcp=%@, ", v43, v44, v41);
  }
  uint64_t v45 = objc_msgSend_IPv6NetworkSignature(self, v32, v33, v34, v35);

  if (v45)
  {
    uint64_t v50 = objc_msgSend_IPv6NetworkSignature(self, v46, v47, v48, v49);
    objc_msgSend_appendFormat_(v6, v51, @"ipv6=%@, ", v52, v53, v50);
  }
  uint64_t v54 = objc_msgSend_DHCPv6ServerID(self, v46, v47, v48, v49);

  if (v54)
  {
    double v59 = objc_msgSend_DHCPv6ServerID(self, v55, v56, v57, v58);
    uint64_t v64 = CWFHexadecimalStringFromData(v59, v60, v61, v62, v63);
    objc_msgSend_appendFormat_(v6, v65, @"dhcpv6=%@, ", v66, v67, v64);
  }
  if (objc_msgSend_logRedactionDisabled(CWFInterface, v55, v56, v57, v58))
  {
    uint64_t v72 = objc_msgSend_location(self, v68, v69, v70, v71);

    if (v72)
    {
      uint64_t v74 = objc_msgSend_location(self, v68, v73, v70, v71);
      objc_msgSend_appendFormat_(v6, v75, @"location=%@, ", v76, v77, v74);
    }
  }
  if (objc_msgSend_hasSuffix_(v6, v68, @", ", v70, v71))
  {
    uint64_t v82 = objc_msgSend_length(v6, v78, v79, v80, v81);
    objc_msgSend_deleteCharactersInRange_(v6, v83, v82 - 2, 2, v84);
  }
  return (NSString *)v6;
}

- (BOOL)isEqualToBSS:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_BSSID(self, v5, v6, v7, v8);
  uint64_t v18 = objc_msgSend_BSSID(v4, v10, v11, v12, v13);
  if (v9 != v18)
  {
    uint64_t v19 = objc_msgSend_BSSID(self, v14, v15, v16, v17);
    if (!v19)
    {
      char isEqual = 0;
      goto LABEL_20;
    }
    uint64_t v24 = (void *)v19;
    uint64_t v29 = objc_msgSend_BSSID(v4, v20, v21, v22, v23);
    if (!v29)
    {
      char isEqual = 0;
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v30 = objc_msgSend_BSSID(self, v25, v26, v27, v28);
    uint64_t v35 = objc_msgSend_BSSID(v4, v31, v32, v33, v34);
    if (!objc_msgSend_isEqual_(v30, v36, (uint64_t)v35, v37, v38))
    {
      char isEqual = 0;
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v72 = v35;
    uint64_t v74 = v30;
    uint64_t v76 = v29;
    uint64_t v78 = v24;
  }
  uint64_t v39 = objc_msgSend_internal(self, v14, v15, v16, v17, v72, v74, v76, v78);
  uint64_t v44 = objc_msgSend_internal(v4, v40, v41, v42, v43);
  if (v39 == (void *)v44)
  {

    char isEqual = 1;
  }
  else
  {
    uint64_t v49 = (void *)v44;
    uint64_t v50 = objc_msgSend_internal(self, v45, v46, v47, v48);
    if (v50)
    {
      uint64_t v55 = (void *)v50;
      uint64_t v60 = objc_msgSend_internal(v4, v51, v52, v53, v54);
      if (v60)
      {
        uint64_t v61 = objc_msgSend_internal(self, v56, v57, v58, v59);
        uint64_t v66 = objc_msgSend_internal(v4, v62, v63, v64, v65);
        char isEqual = objc_msgSend_isEqual_(v61, v67, (uint64_t)v66, v68, v69);
      }
      else
      {
        char isEqual = 0;
      }
    }
    else
    {

      char isEqual = 0;
    }
  }
  uint64_t v29 = v77;
  uint64_t v24 = v79;
  uint64_t v35 = v73;
  uint64_t v30 = v75;
  if (v9 != v18) {
    goto LABEL_18;
  }
LABEL_20:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CWFBSS *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToBSS = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToBSS = objc_msgSend_isEqualToBSS_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToBSS = 0;
  }

  return isEqualToBSS;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(CWFBSS, a2, (uint64_t)a3, v3, v4);
  uint64_t v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_mutableCopy(self->_internal, v12, v13, v14, v15);
  objc_msgSend_setInternal_(v11, v17, (uint64_t)v16, v18, v19);

  return v11;
}

- (id)JSONCompatibleKeyValueMap
{
  uint64_t v5 = objc_msgSend_externalForm(self, a2, v2, v3, v4);
  uint64_t v6 = sub_1B4F59CC8(v5, 0, 1u);

  if (v6)
  {
    uint64_t v10 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v7, (uint64_t)v6, v8, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end