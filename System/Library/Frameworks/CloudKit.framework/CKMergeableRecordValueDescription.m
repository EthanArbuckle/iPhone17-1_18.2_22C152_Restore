@interface CKMergeableRecordValueDescription
- (BOOL)shortDescription;
- (CKMergeableRecordValue)mergeableRecordValue;
- (CKMergeableRecordValueDescription)initWithMergeableRecordValue:(id)a3 shortDescription:(BOOL)a4;
- (NSString)description;
- (id)redactedDescription;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)CKDescribePropertiesUsing:(id)a3 includeDeltaContents:(BOOL)a4;
@end

@implementation CKMergeableRecordValueDescription

- (CKMergeableRecordValueDescription)initWithMergeableRecordValue:(id)a3 shortDescription:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKMergeableRecordValueDescription;
  v8 = [(CKMergeableRecordValueDescription *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mergeableRecordValue, a3);
    v9->_shortDescription = a4;
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKMergeableRecordValueDescription *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKMergeableRecordValueDescription *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v9 = a3;
  int v7 = objc_msgSend_shortDescription(self, v4, v5, v6);
  objc_msgSend_CKDescribePropertiesUsing_includeDeltaContents_(self, v8, (uint64_t)v9, v7 ^ 1u);
}

- (void)CKDescribePropertiesUsing:(id)a3 includeDeltaContents:(BOOL)a4
{
  BOOL v4 = a4;
  id v154 = a3;
  id v9 = objc_msgSend_mergeableRecordValue(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_valueID(v9, v10, v11, v12);
  objc_msgSend_addProperty_value_shouldRedact_(v154, v14, @"valueID", v13, 0);

  v18 = objc_msgSend_mergeableRecordValue(self, v15, v16, v17);
  LOBYTE(v13) = objc_msgSend_isValueIDKnownToServer(v18, v19, v20, v21);

  if ((v13 & 1) == 0)
  {
    v25 = NSNumber;
    v26 = objc_msgSend_mergeableRecordValue(self, v22, v23, v24);
    uint64_t isValueIDKnownToServer = objc_msgSend_isValueIDKnownToServer(v26, v27, v28, v29);
    v33 = objc_msgSend_numberWithBool_(v25, v31, isValueIDKnownToServer, v32);
    objc_msgSend_addProperty_value_shouldRedact_(v154, v34, @"isValueIDKnownToServer", (uint64_t)v33, 0);
  }
  v35 = objc_msgSend_mergeableRecordValue(self, v22, v23, v24);
  v39 = objc_msgSend_lastKnownServerTimestampVector(v35, v36, v37, v38);
  objc_msgSend_addProperty_value_shouldRedact_(v154, v40, @"serverTimestamp", (uint64_t)v39, 0);

  v44 = objc_msgSend_mergeableRecordValue(self, v41, v42, v43);
  v48 = objc_msgSend_deltasToSave(v44, v45, v46, v47);
  uint64_t v52 = objc_msgSend_count(v48, v49, v50, v51);

  if (v52)
  {
    if (v4)
    {
      v56 = objc_msgSend_mergeableRecordValue(self, v53, v54, v55);
      v60 = objc_msgSend_deltasToSave(v56, v57, v58, v59);
      objc_msgSend_addProperty_value_shouldRedact_(v154, v61, @"deltasToSave", (uint64_t)v60, 0);
    }
    else
    {
      v62 = NSNumber;
      v56 = objc_msgSend_mergeableRecordValue(self, v53, v54, v55);
      v60 = objc_msgSend_deltasToSave(v56, v63, v64, v65);
      uint64_t v69 = objc_msgSend_count(v60, v66, v67, v68);
      v72 = objc_msgSend_numberWithUnsignedInteger_(v62, v70, v69, v71);
      objc_msgSend_addProperty_value_shouldRedact_(v154, v73, @"deltasToSaveCount", (uint64_t)v72, 0);
    }
  }
  v74 = objc_msgSend_mergeableRecordValue(self, v53, v54, v55);
  v78 = objc_msgSend_unmergedDeltas(v74, v75, v76, v77);
  uint64_t v82 = objc_msgSend_count(v78, v79, v80, v81);

  if (v82)
  {
    if (v4)
    {
      v86 = objc_msgSend_mergeableRecordValue(self, v83, v84, v85);
      v90 = objc_msgSend_unmergedDeltas(v86, v87, v88, v89);
      objc_msgSend_addProperty_value_shouldRedact_(v154, v91, @"unmergedDeltas", (uint64_t)v90, 0);
    }
    else
    {
      v92 = NSNumber;
      v86 = objc_msgSend_mergeableRecordValue(self, v83, v84, v85);
      v90 = objc_msgSend_unmergedDeltas(v86, v93, v94, v95);
      uint64_t v99 = objc_msgSend_count(v90, v96, v97, v98);
      v102 = objc_msgSend_numberWithUnsignedInteger_(v92, v100, v99, v101);
      objc_msgSend_addProperty_value_shouldRedact_(v154, v103, @"unmergedDeltasCount", (uint64_t)v102, 0);
    }
  }
  v104 = objc_msgSend_mergeableRecordValue(self, v83, v84, v85);
  uint64_t v108 = objc_msgSend_encryptMetadataTernary(v104, v105, v106, v107);

  if (v108 != -1)
  {
    v112 = NSNumber;
    v113 = objc_msgSend_mergeableRecordValue(self, v109, v110, v111);
    uint64_t v117 = objc_msgSend_encryptMetadata(v113, v114, v115, v116);
    v120 = objc_msgSend_numberWithBool_(v112, v118, v117, v119);
    objc_msgSend_addProperty_value_shouldRedact_(v154, v121, @"encryptMetadata", (uint64_t)v120, 0);
  }
  v122 = objc_msgSend_mergeableRecordValue(self, v109, v110, v111);
  v126 = objc_msgSend_pendingReplacementRequests(v122, v123, v124, v125);
  uint64_t v130 = objc_msgSend_count(v126, v127, v128, v129);

  if (v130)
  {
    v134 = objc_msgSend_mergeableRecordValue(self, v131, v132, v133);
    v138 = objc_msgSend_pendingReplacementRequests(v134, v135, v136, v137);
    objc_msgSend_addProperty_value_shouldRedact_(v154, v139, @"replacementRequests", (uint64_t)v138, 0);
  }
  v140 = NSNumber;
  v141 = objc_msgSend_mergeableRecordValue(self, v131, v132, v133);
  v145 = objc_msgSend_serverDeltaMetadatas(v141, v142, v143, v144);
  uint64_t v149 = objc_msgSend_count(v145, v146, v147, v148);
  v152 = objc_msgSend_numberWithUnsignedInteger_(v140, v150, v149, v151);
  objc_msgSend_addProperty_value_shouldRedact_(v154, v153, @"serverDeltasCount", (uint64_t)v152, 0);
}

- (CKMergeableRecordValue)mergeableRecordValue
{
  return self->_mergeableRecordValue;
}

- (BOOL)shortDescription
{
  return self->_shortDescription;
}

- (void).cxx_destruct
{
}

@end