@interface CKLStreamLogMessageObserver
- (id)_colorString:(id)a3 withForeground:(unint64_t)a4;
- (void)eventMatched:(id)a3;
@end

@implementation CKLStreamLogMessageObserver

- (id)_colorString:(id)a3 withForeground:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (objc_msgSend_colorOutput(self, v7, v8))
  {
    objc_msgSend_stringWithFormat_(NSString, v9, @"%sm%@\x1B[0m", off_1E64F3E20[v4 & 7], v6);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1F2044F30;
  }

  return v10;
}

- (void)eventMatched:(id)a3
{
  id v128 = a3;
  id v6 = objc_msgSend_processImagePath(v128, v4, v5);
  uint64_t v8 = objc_msgSend__processNameForPath_(self, v7, (uint64_t)v6);

  if (!v8)
  {
    v11 = objc_msgSend_senderImagePath(v128, v9, v10);
    uint64_t v8 = objc_msgSend__processNameForPath_(self, v12, (uint64_t)v11);
  }
  v13 = objc_msgSend_timeZone(v128, v9, v10);

  if (v13)
  {
    v16 = objc_msgSend_timeZone(v128, v14, v15);
    v19 = objc_msgSend_formatter(self, v17, v18);
    objc_msgSend_setTimeZone_(v19, v20, (uint64_t)v16);
  }
  v21 = objc_msgSend_composedMessage(v128, v14, v15);
  if (objc_msgSend_hasPrefix_(v21, v22, @"SIM: "))
  {
    uint64_t v25 = objc_msgSend_substringFromIndex_(v21, v23, 5);

    v21 = (void *)v25;
  }
  int v26 = objc_msgSend_colorOutput(self, v23, v24);
  v29 = NSString;
  if (v26)
  {
    uint64_t v30 = objc_msgSend_threadIdentifier(v128, v27, v28);
    v32 = objc_msgSend_stringWithFormat_(v29, v31, @"%lu", v30);
    uint64_t v35 = objc_msgSend_threadIdentifier(v128, v33, v34);
    uint64_t v37 = objc_msgSend__colorString_withForeground_(self, v36, (uint64_t)v32, v35);

    v38 = NSString;
    uint64_t v41 = objc_msgSend_activityIdentifier(v128, v39, v40);
    v43 = objc_msgSend_stringWithFormat_(v38, v42, @"%lu", v41);
    uint64_t v46 = objc_msgSend_activityIdentifier(v128, v44, v45);
    uint64_t v48 = objc_msgSend__colorString_withForeground_(self, v47, (uint64_t)v43, v46);

    v49 = NSString;
    uint64_t v52 = objc_msgSend_parentActivityIdentifier(v128, v50, v51);
    v54 = objc_msgSend_stringWithFormat_(v49, v53, @"%lu", v52);
    uint64_t v57 = objc_msgSend_parentActivityIdentifier(v128, v55, v56);
    v59 = objc_msgSend__colorString_withForeground_(self, v58, (uint64_t)v54, v57);

    v125 = (void *)v48;
    v126 = (void *)v37;
    if (objc_msgSend_type(v128, v60, v61) == 1024
      && (objc_msgSend_logType(v128, v62, v63) == 16 || objc_msgSend_logType(v128, v64, v65) == 17))
    {
      v66 = objc_msgSend_stringWithFormat_(NSString, v64, @"💩💩💩%@", v21);
      uint64_t v68 = objc_msgSend__colorString_withForeground_(self, v67, (uint64_t)v66, 0);

      v21 = (void *)v68;
    }
    id v123 = [NSString alloc];
    objc_msgSend_formatter(self, v69, v70);
    id v71 = (id)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_date(v128, v72, v73);
    v75 = objc_msgSend_stringFromDate_(v71, v74, (uint64_t)v124);
    uint64_t v78 = objc_msgSend_hash(v8, v76, v77);
    objc_msgSend__colorString_withForeground_(self, v79, (uint64_t)v8, v78);
    v80 = v127 = v8;
    uint64_t v83 = objc_msgSend_processIdentifier(v128, v81, v82);
    uint64_t v86 = objc_msgSend_parentActivityIdentifier(v128, v84, v85);
    v88 = objc_msgSend__colorString_withForeground_(self, v87, @"|", v86);
    uint64_t v91 = objc_msgSend_activityIdentifier(v128, v89, v90);
    v93 = objc_msgSend__colorString_withForeground_(self, v92, @"|", v91);
    v94 = v125;
    id v96 = objc_msgSend_initWithFormat_(v123, v95, @"\x1B[1m\x1B[37m%@\x1B[0m %@[%d:%@:%@:%@]%@%@ %@", v75, v80, v83, v126, v125, v59, v88, v93, v21);
    v99 = (const char *)objc_msgSend_UTF8String(v96, v97, v98);
    puts(v99);

    uint64_t v8 = v127;
    v100 = v126;
  }
  else
  {
    id v101 = [NSString alloc];
    v100 = objc_msgSend_formatter(self, v102, v103);
    v94 = objc_msgSend_date(v128, v104, v105);
    v59 = objc_msgSend_stringFromDate_(v100, v106, (uint64_t)v94);
    uint64_t v109 = objc_msgSend_processIdentifier(v128, v107, v108);
    uint64_t v112 = objc_msgSend_threadIdentifier(v128, v110, v111);
    uint64_t v115 = objc_msgSend_activityIdentifier(v128, v113, v114);
    uint64_t v118 = objc_msgSend_parentActivityIdentifier(v128, v116, v117);
    id v71 = objc_msgSend_initWithFormat_(v101, v119, @"%@ %@[%d:%llu:%llu:%llu] %@", v59, v8, v109, v112, v115, v118, v21);
    v122 = (const char *)objc_msgSend_UTF8String(v71, v120, v121);
    puts(v122);
  }
}

@end