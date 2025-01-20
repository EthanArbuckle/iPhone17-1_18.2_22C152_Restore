@interface BDSReadingHistoryModelSnapshotInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryDayInfo)modelReadingDay;
- (BDSReadingHistoryDayInfo)remoteModelReadingDay;
- (BDSReadingHistoryModelSnapshotInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryModelSnapshotInfo)initWithLoaded:(int64_t)a3 lastSource:(int64_t)a4 modelReadingDay:(id)a5 modelLongestStreak:(id)a6 remoteModelReadingDay:(id)a7 remoteModelLongestStreak:(id)a8;
- (BDSReadingHistoryStreakInfo)modelLongestStreak;
- (BDSReadingHistoryStreakInfo)remoteModelLongestStreak;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)lastSource;
- (int64_t)loaded;
- (void)encodeWithCoder:(id)a3;
- (void)setLastSource:(int64_t)a3;
- (void)setLoaded:(int64_t)a3;
- (void)setModelLongestStreak:(id)a3;
- (void)setModelReadingDay:(id)a3;
- (void)setRemoteModelLongestStreak:(id)a3;
- (void)setRemoteModelReadingDay:(id)a3;
@end

@implementation BDSReadingHistoryModelSnapshotInfo

- (BDSReadingHistoryModelSnapshotInfo)initWithLoaded:(int64_t)a3 lastSource:(int64_t)a4 modelReadingDay:(id)a5 modelLongestStreak:(id)a6 remoteModelReadingDay:(id)a7 remoteModelLongestStreak:(id)a8
{
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BDSReadingHistoryModelSnapshotInfo;
  v18 = [(BDSReadingHistoryModelSnapshotInfo *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_loaded = a3;
    v18->_lastSource = a4;
    objc_storeStrong((id *)&v18->_modelReadingDay, a5);
    objc_storeStrong((id *)&v19->_modelLongestStreak, a6);
    objc_storeStrong((id *)&v19->_remoteModelReadingDay, a7);
    objc_storeStrong((id *)&v19->_remoteModelLongestStreak, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryModelSnapshotInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v18 = (BDSReadingHistoryModelSnapshotInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v18)
  {
    v18->_loaded = objc_msgSend_decodeIntegerForKey_(v4, v12, @"loaded", v13, v14, v15, v16, v17);
    v18->_lastSource = objc_msgSend_decodeIntegerForKey_(v4, v19, @"lastSource", v20, v21, v22, v23, v24);
    uint64_t v25 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"modelReadingDay", v27, v28, v29, v30);
    modelReadingDay = v18->_modelReadingDay;
    v18->_modelReadingDay = (BDSReadingHistoryDayInfo *)v31;

    uint64_t v33 = objc_opt_class();
    uint64_t v39 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"modelLongestStreak", v35, v36, v37, v38);
    modelLongestStreak = v18->_modelLongestStreak;
    v18->_modelLongestStreak = (BDSReadingHistoryStreakInfo *)v39;

    uint64_t v41 = objc_opt_class();
    uint64_t v47 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, @"remoteModelReadingDay", v43, v44, v45, v46);
    remoteModelReadingDay = v18->_remoteModelReadingDay;
    v18->_remoteModelReadingDay = (BDSReadingHistoryDayInfo *)v47;

    uint64_t v49 = objc_opt_class();
    uint64_t v55 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v50, v49, @"remoteModelLongestStreak", v51, v52, v53, v54);
    remoteModelLongestStreak = v18->_remoteModelLongestStreak;
    v18->_remoteModelLongestStreak = (BDSReadingHistoryStreakInfo *)v55;
  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_loaded(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeInteger_forKey_(v4, v13, v12, @"loaded", v14, v15, v16, v17);
  uint64_t Source = objc_msgSend_lastSource(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeInteger_forKey_(v4, v26, Source, @"lastSource", v27, v28, v29, v30);
  uint64_t v38 = objc_msgSend_modelReadingDay(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"modelReadingDay", v40, v41, v42, v43);

  uint64_t v51 = objc_msgSend_modelLongestStreak(self, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_encodeObject_forKey_(v4, v52, (uint64_t)v51, @"modelLongestStreak", v53, v54, v55, v56);

  v64 = objc_msgSend_remoteModelReadingDay(self, v57, v58, v59, v60, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"remoteModelReadingDay", v66, v67, v68, v69);

  objc_msgSend_remoteModelLongestStreak(self, v70, v71, v72, v73, v74, v75, v76);
  id v82 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v77, (uint64_t)v82, @"remoteModelLongestStreak", v78, v79, v80, v81);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSReadingHistoryModelSnapshotInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_loaded(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setLoaded_(v11, v13, v12, v14, v15, v16, v17, v18);
    uint64_t Source = objc_msgSend_lastSource(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setLastSource_(v11, v27, Source, v28, v29, v30, v31, v32);
    uint64_t v40 = objc_msgSend_modelReadingDay(self, v33, v34, v35, v36, v37, v38, v39);
    objc_msgSend_setModelReadingDay_(v11, v41, (uint64_t)v40, v42, v43, v44, v45, v46);

    uint64_t v54 = objc_msgSend_modelLongestStreak(self, v47, v48, v49, v50, v51, v52, v53);
    objc_msgSend_setModelLongestStreak_(v11, v55, (uint64_t)v54, v56, v57, v58, v59, v60);

    uint64_t v68 = objc_msgSend_remoteModelReadingDay(self, v61, v62, v63, v64, v65, v66, v67);
    objc_msgSend_setRemoteModelReadingDay_(v11, v69, (uint64_t)v68, v70, v71, v72, v73, v74);

    id v82 = objc_msgSend_remoteModelLongestStreak(self, v75, v76, v77, v78, v79, v80, v81);
    objc_msgSend_setRemoteModelLongestStreak_(v11, v83, (uint64_t)v82, v84, v85, v86, v87, v88);
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v12 = objc_msgSend_loaded(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t Source = objc_msgSend_lastSource(self, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v28 = objc_msgSend_modelReadingDay(self, v21, v22, v23, v24, v25, v26, v27);
  uint64_t v36 = objc_msgSend_modelLongestStreak(self, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v44 = objc_msgSend_remoteModelReadingDay(self, v37, v38, v39, v40, v41, v42, v43);
  uint64_t v52 = objc_msgSend_remoteModelLongestStreak(self, v45, v46, v47, v48, v49, v50, v51);
  uint64_t v59 = objc_msgSend_stringWithFormat_(v3, v53, @"<%@: %p loaded:%ld, lastSource:%ld, modelReadingDay:%@, modelLongestStreak:%@, remoteModelReadingDay:%@, remoteModelLongestStreak:%@>", v54, v55, v56, v57, v58, v4, self, v12, Source, v28, v36, v44, v52);

  return v59;
}

- (int64_t)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(int64_t)a3
{
  self->_loaded = a3;
}

- (int64_t)lastSource
{
  return self->_lastSource;
}

- (void)setLastSource:(int64_t)a3
{
  self->_lastuint64_t Source = a3;
}

- (BDSReadingHistoryDayInfo)modelReadingDay
{
  return self->_modelReadingDay;
}

- (void)setModelReadingDay:(id)a3
{
}

- (BDSReadingHistoryStreakInfo)modelLongestStreak
{
  return self->_modelLongestStreak;
}

- (void)setModelLongestStreak:(id)a3
{
}

- (BDSReadingHistoryDayInfo)remoteModelReadingDay
{
  return self->_remoteModelReadingDay;
}

- (void)setRemoteModelReadingDay:(id)a3
{
}

- (BDSReadingHistoryStreakInfo)remoteModelLongestStreak
{
  return self->_remoteModelLongestStreak;
}

- (void)setRemoteModelLongestStreak:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteModelLongestStreak, 0);
  objc_storeStrong((id *)&self->_remoteModelReadingDay, 0);
  objc_storeStrong((id *)&self->_modelLongestStreak, 0);
  objc_storeStrong((id *)&self->_modelReadingDay, 0);
}

@end