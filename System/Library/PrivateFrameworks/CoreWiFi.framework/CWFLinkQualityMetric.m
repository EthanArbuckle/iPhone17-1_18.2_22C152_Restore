@interface CWFLinkQualityMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLinkQualityMetric:(id)a3;
- (CWFLinkQualityMetric)initWithCoder:(id)a3;
- (NSData)linkQualityMetricData;
- (NSDate)updatedAt;
- (NSString)description;
- (double)rxRate;
- (double)txRate;
- (id)JSONCompatibleKeyValueMap;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)RSSI;
- (int64_t)noise;
- (unint64_t)CCA;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLinkQualityMetricData:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation CWFLinkQualityMetric

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = objc_msgSend_allocWithZone_(CWFLinkQualityMetric, a2, (uint64_t)a3, v3, v4);
  v11 = objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setLinkQualityMetricData_(v11, v12, (uint64_t)self->_linkQualityMetricData, v13, v14);
  objc_msgSend_setUpdatedAt_(v11, v15, (uint64_t)self->_updatedAt, v16, v17);
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkQualityMetricData, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
}

- (void)encodeWithCoder:(id)a3
{
  linkQualityMetricData = self->_linkQualityMetricData;
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)linkQualityMetricData, @"_linkQualityMetricData", v6);
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_updatedAt, @"_updatedAt", v8);
}

- (CWFLinkQualityMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CWFLinkQualityMetric;
  v5 = [(CWFLinkQualityMetric *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"_linkQualityMetricData", v8);
    linkQualityMetricData = v5->_linkQualityMetricData;
    v5->_linkQualityMetricData = (NSData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"_updatedAt", v13);
    updatedAt = v5->_updatedAt;
    v5->_updatedAt = (NSDate *)v14;
  }
  return v5;
}

- (unint64_t)CCA
{
  v5 = objc_msgSend_linkQualityMetricData(self, a2, v2, v3, v4);
  uint64_t v10 = v5;
  if (v5
    && objc_msgSend_length(v5, v6, v7, v8, v9) == 332
    && (v11 = v10, uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15), *(unsigned char *)(v16 + 18)))
  {
    unint64_t v17 = *(char *)(v16 + 19);
  }
  else
  {
    unint64_t v17 = 0;
  }

  return v17;
}

- (int64_t)RSSI
{
  v5 = objc_msgSend_linkQualityMetricData(self, a2, v2, v3, v4);
  uint64_t v10 = v5;
  if (v5
    && objc_msgSend_length(v5, v6, v7, v8, v9) == 332
    && (v11 = v10, uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15), *(unsigned char *)v16))
  {
    int64_t v17 = *(int *)(v16 + 4);
  }
  else
  {
    int64_t v17 = 0;
  }

  return v17;
}

- (double)rxRate
{
  v5 = objc_msgSend_linkQualityMetricData(self, a2, v2, v3, v4);
  uint64_t v10 = v5;
  double v11 = 0.0;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8, v9) == 332)
  {
    id v12 = v10;
    double v11 = (double)(*(_DWORD *)(objc_msgSend_bytes(v12, v13, v14, v15, v16) + 72) / 0x3E8u);
  }

  return v11;
}

- (NSData)linkQualityMetricData
{
  return self->_linkQualityMetricData;
}

- (void)setUpdatedAt:(id)a3
{
}

- (void)setLinkQualityMetricData:(id)a3
{
}

- (id)JSONCompatibleKeyValueMap
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = objc_msgSend_updatedAt(self, v4, v5, v6, v7);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v8, @"updated_at", v10);

  double v11 = NSNumber;
  uint64_t v16 = objc_msgSend_RSSI(self, v12, v13, v14, v15);
  v20 = objc_msgSend_numberWithInteger_(v11, v17, v16, v18, v19);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v21, (uint64_t)v20, @"rssi", v22);

  v23 = NSNumber;
  uint64_t v28 = objc_msgSend_noise(self, v24, v25, v26, v27);
  v32 = objc_msgSend_numberWithInteger_(v23, v29, v28, v30, v31);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, @"noise", v34);

  v35 = NSNumber;
  objc_msgSend_txRate(self, v36, v37, v38, v39);
  v44 = objc_msgSend_numberWithDouble_(v35, v40, v41, v42, v43);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v45, (uint64_t)v44, @"tx_rate", v46);

  v47 = NSNumber;
  objc_msgSend_rxRate(self, v48, v49, v50, v51);
  v56 = objc_msgSend_numberWithDouble_(v47, v52, v53, v54, v55);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v57, (uint64_t)v56, @"rx_rate", v58);

  v59 = NSNumber;
  uint64_t v64 = objc_msgSend_CCA(self, v60, v61, v62, v63);
  v68 = objc_msgSend_numberWithUnsignedInteger_(v59, v65, v64, v66, v67);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v69, (uint64_t)v68, @"cca", v70);

  v75 = objc_msgSend_linkQualityMetricData(self, v71, v72, v73, v74);
  v80 = v75;
  if (v75 && (unint64_t)objc_msgSend_length(v75, v76, v77, v78, v79) >= 0x14C)
  {
    id v81 = v80;
    uint64_t v90 = objc_msgSend_bytes(v81, v82, v83, v84, v85);
    if (*(unsigned char *)(v90 + 8))
    {
      v91 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v86, v87, v88, v89);
      v95 = objc_msgSend_numberWithChar_(NSNumber, v92, *(char *)(v90 + 9), v93, v94);
      objc_msgSend_addObject_(v91, v96, (uint64_t)v95, v97, v98);

      v102 = objc_msgSend_numberWithChar_(NSNumber, v99, *(char *)(v90 + 10), v100, v101);
      objc_msgSend_addObject_(v91, v103, (uint64_t)v102, v104, v105);

      objc_msgSend_setObject_forKeyedSubscript_(v3, v106, (uint64_t)v91, @"per_ant_rssi", v107);
    }
    if (*(unsigned char *)(v90 + 11))
    {
      v108 = objc_msgSend_numberWithShort_(NSNumber, v86, *(__int16 *)(v90 + 12), v88, v89);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v109, (uint64_t)v108, @"snr", v110);
    }
    if (*(unsigned char *)(v90 + 168))
    {
      v111 = objc_msgSend_numberWithChar_(NSNumber, v86, *(char *)(v90 + 172), v88, v89);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v112, (uint64_t)v111, @"cca_self_total", v113);

      v117 = objc_msgSend_numberWithChar_(NSNumber, v114, *(char *)(v90 + 173), v115, v116);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v118, (uint64_t)v117, @"cca_other_total", v119);

      v123 = objc_msgSend_numberWithChar_(NSNumber, v120, *(char *)(v90 + 174), v121, v122);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v124, (uint64_t)v123, @"cca_interference_total", v125);
    }
    v126 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v86, *(unsigned int *)(v90 + 28), v88, v89);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v127, (uint64_t)v126, @"tx_frames", v128);

    v132 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v129, *(unsigned int *)(v90 + 20), v130, v131);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v133, (uint64_t)v132, @"tx_fail", v134);

    v138 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v135, *(unsigned int *)(v90 + 24), v136, v137);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v139, (uint64_t)v138, @"tx_retrans", v140);

    LODWORD(v141) = *(_DWORD *)(v90 + 68);
    v146 = objc_msgSend_numberWithDouble_(NSNumber, v142, v143, v144, v145, (double)v141 / 1000.0);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v147, (uint64_t)v146, @"tx_fallback_rate", v148);

    v152 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v149, *(unsigned int *)(v90 + 36), v150, v151);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v153, (uint64_t)v152, @"rx_frames", v154);

    v158 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v155, *(unsigned int *)(v90 + 32), v156, v157);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v159, (uint64_t)v158, @"rx_retry_frames", v160);

    v164 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v161, *(unsigned int *)(v90 + 76), v162, v163);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v165, (uint64_t)v164, @"rx_toss", v166);

    if (*(unsigned char *)(v90 + 48))
    {
      v170 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v167, *(unsigned int *)(v90 + 40), v168, v169);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v171, (uint64_t)v170, @"beacon_recv", v172);

      v176 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v173, *(unsigned int *)(v90 + 44), v174, v175);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v177, (uint64_t)v176, @"beacon_sched", v178);
    }
    if (*(unsigned char *)(v90 + 49))
    {
      v179 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v167, *(unsigned int *)(v90 + 60), v168, v169);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v180, (uint64_t)v179, @"tx_fw_frames", v181);

      v185 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v182, *(unsigned int *)(v90 + 52), v183, v184);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v186, (uint64_t)v185, @"tx_fw_fail", v187);

      v191 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v188, *(unsigned int *)(v90 + 56), v189, v190);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v192, (uint64_t)v191, @"tx_fw_retrans", v193);
    }
  }
  v197 = sub_1B4F59CC8(v3, 0, 1u);
  if (v197)
  {
    v198 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E4F1C9E8], v194, (uint64_t)v197, v195, v196);
  }
  else
  {
    v198 = 0;
  }

  return v198;
}

- (int64_t)noise
{
  uint64_t v5 = objc_msgSend_linkQualityMetricData(self, a2, v2, v3, v4);
  uint64_t v10 = v5;
  if (v5
    && objc_msgSend_length(v5, v6, v7, v8, v9) == 332
    && (v11 = v10, uint64_t v16 = objc_msgSend_bytes(v11, v12, v13, v14, v15), *(unsigned char *)(v16 + 14)))
  {
    int64_t v17 = *(__int16 *)(v16 + 16);
  }
  else
  {
    int64_t v17 = 0;
  }

  return v17;
}

- (double)txRate
{
  uint64_t v5 = objc_msgSend_linkQualityMetricData(self, a2, v2, v3, v4);
  uint64_t v10 = v5;
  double v11 = 0.0;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8, v9) == 332)
  {
    id v12 = v10;
    double v11 = (double)(*(_DWORD *)(objc_msgSend_bytes(v12, v13, v14, v15, v16) + 64) / 0x3E8u);
  }

  return v11;
}

- (NSString)description
{
  uint64_t v6 = objc_msgSend_linkQualityMetricData(self, a2, v2, v3, v4);
  double v11 = v6;
  if (v6 && objc_msgSend_length(v6, v7, v8, v9, v10) == 332)
  {
    id v12 = v11;
    uint64_t v17 = objc_msgSend_bytes(v12, v13, v14, v15, v16);
    uint64_t v22 = objc_msgSend_string(MEMORY[0x1E4F28E78], v18, v19, v20, v21);
    uint64_t v27 = v22;
    if (*(unsigned char *)v17) {
      objc_msgSend_appendFormat_(v22, v23, @"rssi=%ddBm ", v24, v25, *(unsigned int *)(v17 + 4));
    }
    if (*(unsigned char *)(v17 + 8))
    {
      objc_msgSend_appendString_(v27, v23, @"per_ant_rssi=("), v24, v25;
      objc_msgSend_appendFormat_(v27, v28, @"%ddBm, ", v29, v30, *(char *)(v17 + 9));
      objc_msgSend_appendFormat_(v27, v31, @"%ddBm, ", v32, v33, *(char *)(v17 + 10));
      if (objc_msgSend_hasSuffix_(v27, v34, @", ", v35, v36))
      {
        uint64_t v41 = objc_msgSend_length(v27, v37, v38, v39, v40);
        objc_msgSend_deleteCharactersInRange_(v27, v42, v41 - 2, 2, v43);
      }
      objc_msgSend_appendString_(v27, v37, @" "), v39, v40);
    }
    if (*(unsigned char *)(v17 + 14)) {
      objc_msgSend_appendFormat_(v27, v23, @"noise=%ddBm ", v24, v25, *(__int16 *)(v17 + 16));
    }
    if (*(unsigned char *)(v17 + 11)) {
      objc_msgSend_appendFormat_(v27, v23, @"snr=%d ", v24, v25, *(__int16 *)(v17 + 12));
    }
    if (*(unsigned char *)(v17 + 18)) {
      objc_msgSend_appendFormat_(v27, v23, @"cca=%.1f%% ", v24, v25, (double)*(char *)(v17 + 19));
    }
    if (*(unsigned char *)(v17 + 168)) {
      objc_msgSend_appendFormat_(v27, v23, @"ccaSelfTotal=%d ccaOtherTotal=%d interferenceTotal=%d ", v24, v25, *(char *)(v17 + 172), *(char *)(v17 + 173), *(char *)(v17 + 174));
    }
    LODWORD(v26) = *(_DWORD *)(v17 + 64);
    objc_msgSend_appendFormat_(v27, v23, @"txRate=%.1fMbps ", v24, v25, (double)v26 / 1000.0);
    LODWORD(v44) = *(_DWORD *)(v17 + 68);
    objc_msgSend_appendFormat_(v27, v45, @"txFrames=%d txFail=%d txRetrans=%d txFallbackRate=%.1fMbps ", v46, v47, *(unsigned int *)(v17 + 28), *(unsigned int *)(v17 + 20), *(unsigned int *)(v17 + 24), (double)v44 / 1000.0);
    LODWORD(v48) = *(_DWORD *)(v17 + 72);
    objc_msgSend_appendFormat_(v27, v49, @"rxRate=%.1fMbps ", v50, v51, (double)v48 / 1000.0);
    objc_msgSend_appendFormat_(v27, v52, @"rxFrames=%d rxRetryFrames=%d ", v53, v54, *(unsigned int *)(v17 + 36), *(unsigned int *)(v17 + 32));
    objc_msgSend_appendFormat_(v27, v55, @"rxToss=%d ", v56, v57, *(unsigned int *)(v17 + 76));
    if (*(unsigned char *)(v17 + 48)) {
      objc_msgSend_appendFormat_(v27, v58, @"beaconRecv=%d beaconSched=%d ", v60, v61, *(unsigned int *)(v17 + 40), *(unsigned int *)(v17 + 44));
    }
    if (*(unsigned char *)(v17 + 49)) {
      objc_msgSend_appendFormat_(v27, v58, @"txFwFrames=%d txFwFail=%d txFwRetrans=%d", v60, v61, *(unsigned int *)(v17 + 60), *(unsigned int *)(v17 + 52), *(unsigned int *)(v17 + 56));
    }
    uint64_t v62 = objc_msgSend_copy(v27, v58, v59, v60, v61);
  }
  else
  {
    v64.receiver = self;
    v64.super_class = (Class)CWFLinkQualityMetric;
    uint64_t v62 = [(CWFLinkQualityMetric *)&v64 description];
  }

  return (NSString *)v62;
}

- (BOOL)isEqualToLinkQualityMetric:(id)a3
{
  id v6 = a3;
  updatedAt = self->_updatedAt;
  objc_msgSend_updatedAt(v6, v8, v9, v10, v11);
  uint64_t v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (updatedAt != v16)
  {
    if (!self->_updatedAt
      || (objc_msgSend_updatedAt(v6, v12, v13, v14, v15), (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      char isEqual = 0;
      goto LABEL_14;
    }
    uint64_t v3 = (void *)v17;
    uint64_t v22 = self->_updatedAt;
    uint64_t v4 = objc_msgSend_updatedAt(v6, v18, v19, v20, v21);
    if (!objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24, v25))
    {
      char isEqual = 0;
LABEL_12:

      goto LABEL_14;
    }
  }
  linkQualityMetricData = self->_linkQualityMetricData;
  objc_msgSend_linkQualityMetricData(v6, v12, v13, v14, v15);
  uint64_t v32 = (NSData *)objc_claimAutoreleasedReturnValue();
  char isEqual = linkQualityMetricData == v32;
  if (isEqual || !self->_linkQualityMetricData) {
    goto LABEL_10;
  }
  uint64_t v33 = objc_msgSend_linkQualityMetricData(v6, v28, v29, v30, v31);
  if (v33)
  {
    uint64_t v38 = (void *)v33;
    uint64_t v39 = self->_linkQualityMetricData;
    uint64_t v40 = objc_msgSend_linkQualityMetricData(v6, v34, v35, v36, v37);
    char isEqual = objc_msgSend_isEqual_(v39, v41, (uint64_t)v40, v42, v43);

LABEL_10:
    goto LABEL_11;
  }

  char isEqual = 0;
LABEL_11:
  if (updatedAt != v16) {
    goto LABEL_12;
  }
LABEL_14:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CWFLinkQualityMetric *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToLinkQualityMetric = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToLinkQualityMetric = objc_msgSend_isEqualToLinkQualityMetric_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    char isEqualToLinkQualityMetric = 0;
  }

  return isEqualToLinkQualityMetric;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_linkQualityMetricData, a2, v2, v3, v4);
  return objc_msgSend_hash(self->_updatedAt, v7, v8, v9, v10) ^ v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

@end