@interface CHTerminal
- (id)description;
- (id)getStringValue;
- (id)getValue;
@end

@implementation CHTerminal

- (id)getValue
{
  v7 = objc_msgSend_name(self, a2, v2, v3, v4, v5);
  char isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"0", v9, v10, v11);

  if (isEqualToString) {
    return &unk_1F203E4D8;
  }
  v19 = objc_msgSend_name(self, v13, v14, v15, v16, v17);
  char v24 = objc_msgSend_isEqualToString_(v19, v20, @"1", v21, v22, v23);

  if (v24) {
    return &unk_1F203E4F0;
  }
  v30 = objc_msgSend_name(self, v25, v26, v27, v28, v29);
  char v35 = objc_msgSend_isEqualToString_(v30, v31, @"2", v32, v33, v34);

  if (v35) {
    return &unk_1F203E508;
  }
  v41 = objc_msgSend_name(self, v36, v37, v38, v39, v40);
  char v46 = objc_msgSend_isEqualToString_(v41, v42, @"3", v43, v44, v45);

  if (v46) {
    return &unk_1F203E520;
  }
  v52 = objc_msgSend_name(self, v47, v48, v49, v50, v51);
  char v57 = objc_msgSend_isEqualToString_(v52, v53, @"4", v54, v55, v56);

  if (v57) {
    return &unk_1F203E538;
  }
  v63 = objc_msgSend_name(self, v58, v59, v60, v61, v62);
  char v68 = objc_msgSend_isEqualToString_(v63, v64, @"5", v65, v66, v67);

  if (v68) {
    return &unk_1F203E550;
  }
  v74 = objc_msgSend_name(self, v69, v70, v71, v72, v73);
  char v79 = objc_msgSend_isEqualToString_(v74, v75, @"6", v76, v77, v78);

  if (v79) {
    return &unk_1F203E568;
  }
  v85 = objc_msgSend_name(self, v80, v81, v82, v83, v84);
  char v90 = objc_msgSend_isEqualToString_(v85, v86, @"7", v87, v88, v89);

  if (v90) {
    return &unk_1F203E580;
  }
  v96 = objc_msgSend_name(self, v91, v92, v93, v94, v95);
  char v101 = objc_msgSend_isEqualToString_(v96, v97, @"8", v98, v99, v100);

  if (v101) {
    return &unk_1F203E598;
  }
  v107 = objc_msgSend_name(self, v102, v103, v104, v105, v106);
  char v112 = objc_msgSend_isEqualToString_(v107, v108, @"9", v109, v110, v111);

  if (v112) {
    return &unk_1F203E5B0;
  }
  v118 = objc_msgSend_name(self, v113, v114, v115, v116, v117);
  char v123 = objc_msgSend_isEqualToString_(v118, v119, @"e", v120, v121, v122);

  if (v123) {
    return &unk_1F203F400;
  }
  v129 = objc_msgSend_name(self, v124, v125, v126, v127, v128);
  int v134 = objc_msgSend_isEqualToString_(v129, v130, @"π", v131, v132, v133);

  if (v134) {
    return &unk_1F203F410;
  }
  else {
    return 0;
  }
}

- (id)getStringValue
{
  v7 = objc_msgSend_name(self, a2, v2, v3, v4, v5);
  v13 = objc_msgSend_name(self, v8, v9, v10, v11, v12);
  char isEqualToString = objc_msgSend_isEqualToString_(v13, v14, @"e", v15, v16, v17);

  if (isEqualToString)
  {
    objc_msgSend_stringWithFormat_(NSString, v19, @"%0.6f", v21, v22, v23, 0x4005BF0A8B145769);
  }
  else
  {
    char v24 = objc_msgSend_name(self, v19, v20, v21, v22, v23);
    int v29 = objc_msgSend_isEqualToString_(v24, v25, @"π", v26, v27, v28);

    if (!v29) {
      goto LABEL_6;
    }
    objc_msgSend_stringWithFormat_(NSString, v30, @"%0.6f", v31, v32, v33, 0x400921FB54442D18);
  uint64_t v34 = };

  v7 = (void *)v34;
LABEL_6:
  return v7;
}

- (id)description
{
  v7 = NSString;
  v8 = objc_msgSend_name(self, a2, v2, v3, v4, v5);
  uint64_t v14 = objc_msgSend_inputRange(self, v9, v10, v11, v12, v13);
  v19 = objc_msgSend_stringWithFormat_(v7, v15, @"[%@] : %lu", v16, v17, v18, v8, v14);

  return v19;
}

@end