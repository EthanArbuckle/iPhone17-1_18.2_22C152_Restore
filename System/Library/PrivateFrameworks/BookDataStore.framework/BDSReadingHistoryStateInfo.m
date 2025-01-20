@interface BDSReadingHistoryStateInfo
+ (BOOL)supportsSecureCoding;
- (BDSReadingHistoryDayInfo)today;
- (BDSReadingHistoryStateInfo)initWithCoder:(id)a3;
- (BDSReadingHistoryStateInfo)initWithCurrentStreak:(int64_t)a3 longestStreak:(id)a4 today:(id)a5 readingHistory:(id)a6;
- (BDSReadingHistoryStreakInfo)longestStreak;
- (BOOL)isEmptyState;
- (BOOL)isEqual:(id)a3;
- (NSArray)readingHistory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)currentStreak;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentStreak:(int64_t)a3;
- (void)setLongestStreak:(id)a3;
- (void)setReadingHistory:(id)a3;
- (void)setToday:(id)a3;
@end

@implementation BDSReadingHistoryStateInfo

- (BDSReadingHistoryStateInfo)initWithCurrentStreak:(int64_t)a3 longestStreak:(id)a4 today:(id)a5 readingHistory:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BDSReadingHistoryStateInfo;
  v14 = [(BDSReadingHistoryStateInfo *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_currentStreak = a3;
    objc_storeStrong((id *)&v14->_longestStreak, a4);
    objc_storeStrong((id *)&v15->_today, a5);
    objc_storeStrong((id *)&v15->_readingHistory, a6);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = BUDynamicCast();

    char isEqualToArray = 0;
    if (!self || !v5) {
      goto LABEL_18;
    }
    uint64_t v14 = objc_msgSend_currentStreak(self, v6, v7, v8, v9, v10, v11, v12);
    if (v14 == objc_msgSend_currentStreak(v5, v15, v16, v17, v18, v19, v20, v21))
    {
      v29 = objc_msgSend_longestStreak(self, v22, v23, v24, v25, v26, v27, v28);
      uint64_t v37 = objc_msgSend_longestStreak(v5, v30, v31, v32, v33, v34, v35, v36);
      if (v29 == (void *)v37)
      {
      }
      else
      {
        v45 = (void *)v37;
        v46 = objc_msgSend_longestStreak(self, v38, v39, v40, v41, v42, v43, v44);
        v54 = objc_msgSend_longestStreak(v5, v47, v48, v49, v50, v51, v52, v53);
        int isEqual = objc_msgSend_isEqual_(v46, v55, (uint64_t)v54, v56, v57, v58, v59, v60);

        if (!isEqual) {
          goto LABEL_12;
        }
      }
      v69 = objc_msgSend_today(self, v62, v63, v64, v65, v66, v67, v68);
      uint64_t v77 = objc_msgSend_today(v5, v70, v71, v72, v73, v74, v75, v76);
      if (v69 == (void *)v77)
      {
      }
      else
      {
        v85 = (void *)v77;
        v86 = objc_msgSend_today(self, v78, v79, v80, v81, v82, v83, v84);
        v94 = objc_msgSend_today(v5, v87, v88, v89, v90, v91, v92, v93);
        int v101 = objc_msgSend_isEqual_(v86, v95, (uint64_t)v94, v96, v97, v98, v99, v100);

        if (!v101) {
          goto LABEL_12;
        }
      }
      v109 = objc_msgSend_readingHistory(self, v102, v103, v104, v105, v106, v107, v108);
      v124 = objc_msgSend_readingHistory(v5, v110, v111, v112, v113, v114, v115, v116);
      if (v109 == v124)
      {
        char isEqualToArray = 1;
      }
      else
      {
        v125 = objc_msgSend_readingHistory(self, v117, v118, v119, v120, v121, v122, v123);
        v133 = objc_msgSend_readingHistory(v5, v126, v127, v128, v129, v130, v131, v132);
        char isEqualToArray = objc_msgSend_isEqualToArray_(v125, v134, (uint64_t)v133, v135, v136, v137, v138, v139);
      }
      goto LABEL_18;
    }
LABEL_12:
    char isEqualToArray = 0;
LABEL_18:

    return isEqualToArray;
  }
  return 1;
}

- (BOOL)isEmptyState
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (objc_msgSend_currentStreak(self, a2, v2, v3, v4, v5, v6, v7))
  {
    BOOL v16 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend_longestStreak(self, v9, v10, v11, v12, v13, v14, v15);
    if (objc_msgSend_length(v17, v18, v19, v20, v21, v22, v23, v24))
    {
      BOOL v16 = 0;
    }
    else
    {
      uint64_t v32 = objc_msgSend_today(self, v25, v26, v27, v28, v29, v30, v31);
      BOOL v16 = objc_msgSend_readingTime(v32, v33, v34, v35, v36, v37, v38, v39) == 0;
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v40 = objc_msgSend_readingHistory(self, v9, v10, v11, v12, v13, v14, v15, 0);
  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v65, (uint64_t)v69, 16, v42, v43, v44);
  if (v45)
  {
    uint64_t v53 = v45;
    uint64_t v54 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v66 != v54) {
          objc_enumerationMutation(v40);
        }
        if (v16)
        {
          uint64_t v56 = objc_msgSend_day(*(void **)(*((void *)&v65 + 1) + 8 * i), v46, v47, v48, v49, v50, v51, v52);
          BOOL v16 = objc_msgSend_readingTime(v56, v57, v58, v59, v60, v61, v62, v63) == 0;
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v46, (uint64_t)&v65, (uint64_t)v69, 16, v50, v51, v52);
    }
    while (v53);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSReadingHistoryStateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v18 = (BDSReadingHistoryStateInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v18)
  {
    v18->_currentStreak = objc_msgSend_decodeIntegerForKey_(v4, v12, @"currentStreak", v13, v14, v15, v16, v17);
    uint64_t v19 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"longestStreak", v21, v22, v23, v24);
    longestStreak = v18->_longestStreak;
    v18->_longestStreak = (BDSReadingHistoryStreakInfo *)v25;

    uint64_t v27 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"today", v29, v30, v31, v32);
    today = v18->_today;
    v18->_today = (BDSReadingHistoryDayInfo *)v33;

    uint64_t v35 = (void *)MEMORY[0x263EFFA08];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v44 = objc_msgSend_setWithObjects_(v35, v38, v36, v39, v40, v41, v42, v43, v37, 0);
    uint64_t v50 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v45, (uint64_t)v44, @"readingHistory", v46, v47, v48, v49);
    readingHistory = v18->_readingHistory;
    v18->_readingHistory = (NSArray *)v50;
  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_currentStreak(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeInteger_forKey_(v4, v13, v12, @"currentStreak", v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_longestStreak(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"longestStreak", v27, v28, v29, v30);

  uint64_t v38 = objc_msgSend_today(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"today", v40, v41, v42, v43);

  objc_msgSend_readingHistory(self, v44, v45, v46, v47, v48, v49, v50);
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v56, @"readingHistory", v52, v53, v54, v55);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSReadingHistoryStateInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_currentStreak(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setCurrentStreak_(v11, v13, v12, v14, v15, v16, v17, v18);
    uint64_t v26 = objc_msgSend_longestStreak(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setLongestStreak_(v11, v27, (uint64_t)v26, v28, v29, v30, v31, v32);

    uint64_t v40 = objc_msgSend_today(self, v33, v34, v35, v36, v37, v38, v39);
    objc_msgSend_setToday_(v11, v41, (uint64_t)v40, v42, v43, v44, v45, v46);

    uint64_t v54 = objc_msgSend_readingHistory(self, v47, v48, v49, v50, v51, v52, v53);
    objc_msgSend_setReadingHistory_(v11, v55, (uint64_t)v54, v56, v57, v58, v59, v60);
  }
  return v11;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v12 = objc_msgSend_currentStreak(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v20 = objc_msgSend_longestStreak(self, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v28 = objc_msgSend_today(self, v21, v22, v23, v24, v25, v26, v27);
  uint64_t v36 = objc_msgSend_readingHistory(self, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v43 = objc_msgSend_stringWithFormat_(v3, v37, @"<%@: %p currentStreak:%ld, longestStreak:%@, today:%@, readingHistory:%@>", v38, v39, v40, v41, v42, v4, self, v12, v20, v28, v36);

  return v43;
}

- (int64_t)currentStreak
{
  return self->_currentStreak;
}

- (void)setCurrentStreak:(int64_t)a3
{
  self->_currentStreak = a3;
}

- (BDSReadingHistoryStreakInfo)longestStreak
{
  return self->_longestStreak;
}

- (void)setLongestStreak:(id)a3
{
}

- (BDSReadingHistoryDayInfo)today
{
  return self->_today;
}

- (void)setToday:(id)a3
{
}

- (NSArray)readingHistory
{
  return self->_readingHistory;
}

- (void)setReadingHistory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingHistory, 0);
  objc_storeStrong((id *)&self->_today, 0);
  objc_storeStrong((id *)&self->_longestStreak, 0);
}

@end