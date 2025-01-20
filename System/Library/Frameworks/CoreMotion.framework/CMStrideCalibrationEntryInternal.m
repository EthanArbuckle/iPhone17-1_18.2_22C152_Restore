@interface CMStrideCalibrationEntryInternal
- (double)score;
- (id)description;
- (unsigned)pacebin;
@end

@implementation CMStrideCalibrationEntryInternal

- (unsigned)pacebin
{
  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalibrationEntryInternal;
  return [(CMStrideCalibrationEntry *)&v3 pacebin];
}

- (double)score
{
  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalibrationEntryInternal;
  [(CMStrideCalibrationEntry *)&v3 score];
  return result;
}

- (id)description
{
  v81[14] = *MEMORY[0x1E4F143B8];
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v80[0] = @"startTime";
  v6 = NSNumber;
  objc_msgSend_startTime(self, v7, v8);
  v81[0] = objc_msgSend_numberWithDouble_(v6, v9, v10);
  v80[1] = @"pacebin";
  v11 = NSNumber;
  uint64_t v14 = objc_msgSend_pacebin(self, v12, v13);
  v81[1] = objc_msgSend_numberWithUnsignedInt_(v11, v15, v14);
  v80[2] = @"kvalue";
  v16 = NSNumber;
  objc_msgSend_kvalue(self, v17, v18);
  v81[2] = objc_msgSend_numberWithDouble_(v16, v19, v20);
  v80[3] = @"kvalueTrack";
  v21 = NSNumber;
  objc_msgSend_kvalueTrack(self, v22, v23);
  v81[3] = objc_msgSend_numberWithDouble_(v21, v24, v25);
  v80[4] = @"score";
  v26 = NSNumber;
  objc_msgSend_score(self, v27, v28);
  v81[4] = objc_msgSend_numberWithDouble_(v26, v29, v30);
  v80[5] = @"endTime";
  v31 = NSNumber;
  objc_msgSend_endTime(self, v32, v33);
  v81[5] = objc_msgSend_numberWithDouble_(v31, v34, v35);
  v80[6] = @"distance";
  v36 = NSNumber;
  objc_msgSend_distance(self, v37, v38);
  v81[6] = objc_msgSend_numberWithDouble_(v36, v39, v40);
  v80[7] = @"steps";
  v41 = NSNumber;
  uint64_t v44 = objc_msgSend_steps(self, v42, v43);
  v81[7] = objc_msgSend_numberWithInt_(v41, v45, v44);
  v80[8] = @"session";
  v46 = NSNumber;
  uint64_t v49 = objc_msgSend_session(self, v47, v48);
  v81[8] = objc_msgSend_numberWithInt_(v46, v50, v49);
  v80[9] = @"speed";
  v51 = NSNumber;
  objc_msgSend_speed(self, v52, v53);
  v81[9] = objc_msgSend_numberWithDouble_(v51, v54, v55);
  v80[10] = @"percentGrade";
  v56 = NSNumber;
  objc_msgSend_percentGrade(self, v57, v58);
  v81[10] = objc_msgSend_numberWithDouble_(v56, v59, v60);
  v80[11] = @"gpsSource";
  v61 = NSNumber;
  uint64_t v64 = objc_msgSend_gpsSource(self, v62, v63);
  v81[11] = objc_msgSend_numberWithInteger_(v61, v65, v64);
  v80[12] = @"meanRunningStrideLength";
  v66 = NSNumber;
  objc_msgSend_meanRunningStrideLength(self, v67, v68);
  v81[12] = objc_msgSend_numberWithDouble_(v66, v69, v70);
  v80[13] = @"numberRunningStrideLengthSamples";
  v71 = NSNumber;
  uint64_t v74 = objc_msgSend_numberRunningStrideLengthSamples(self, v72, v73);
  v81[13] = objc_msgSend_numberWithInteger_(v71, v75, v74);
  uint64_t v77 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v76, (uint64_t)v81, v80, 14);
  return (id)objc_msgSend_stringWithFormat_(v3, v78, @"%@,%@", v5, v77);
}

@end