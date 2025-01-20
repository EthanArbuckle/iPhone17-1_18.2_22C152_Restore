@interface IADataStoreDaterange
+ (id)type;
- (BOOL)_clearWithMask:(int64_t)a3;
- (BOOL)_updateStartDate;
- (BOOL)clearAllUsage;
- (BOOL)clearHistoricalUsage;
- (BOOL)clearMonthlyUsage;
- (BOOL)destroy;
- (BOOL)markToday;
- (BOOL)persist;
- (IADataStoreDaterange)initWithDatastoreHandle:(id)a3 andName:(id)a4 shouldBeCreated:(BOOL)a5;
- (NSDate)originDate;
- (NSDate)startDate;
- (id)timesUsedInDayRangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)timesUsedInLastNDays:(unint64_t)a3;
- (int)bitfield;
- (unint64_t)bitmaskForDayRangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (unint64_t)bitmaskForLessThanDayN:(unint64_t)a3;
- (unint64_t)everUsed;
- (unint64_t)usageFrequency;
- (unint64_t)usedInDayRangeFrom:(unint64_t)a3 to:(unint64_t)a4;
- (unint64_t)usedInLastDay;
- (unint64_t)usedInLastMonth;
- (unint64_t)usedInLastNDays:(unint64_t)a3;
- (unint64_t)usedInLastWeek;
- (void)setBitfield:(int)a3;
- (void)setOriginDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation IADataStoreDaterange

- (IADataStoreDaterange)initWithDatastoreHandle:(id)a3 andName:(id)a4 shouldBeCreated:(BOOL)a5
{
  BOOL v5 = a5;
  location[4] = *(id *)MEMORY[0x263EF8340];
  objc_initWeak(location, a3);
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained(location);
  v75.receiver = self;
  v75.super_class = (Class)IADataStoreDaterange;
  v10 = [(IADataStoreObject *)&v75 initWithDatastoreHandle:WeakRetained andName:v8 shouldBeCreated:v5];

  if (!v10) {
    goto LABEL_6;
  }
  if (v5)
  {
    uint64_t v14 = objc_msgSend_now(MEMORY[0x263EFF910], v11, v12, v13);
    originDate = v10->_originDate;
    v10->_originDate = (NSDate *)v14;

    uint64_t v19 = objc_msgSend_copy(v10->_originDate, v16, v17, v18);
    startDate = v10->_startDate;
    v10->_startDate = (NSDate *)v19;

    v10->_bitfield = 0;
    objc_msgSend_persist(v10, v21, v22, v23);
LABEL_6:
    v69 = v10;
    goto LABEL_7;
  }
  v24 = objc_msgSend_datastoreHandle(v10, v11, v12, v13);
  v28 = v24;
  if (v24)
  {
    v29 = objc_msgSend_defaultsHandle(v24, v25, v26, v27);
    v33 = objc_msgSend_name(v10, v30, v31, v32);
    v36 = objc_msgSend_stringByAppendingString_(v33, v34, @"_originDate", v35);
    uint64_t v39 = objc_msgSend_objectForKey_(v29, v37, (uint64_t)v36, v38);
    v40 = v10->_originDate;
    v10->_originDate = (NSDate *)v39;

    v44 = objc_msgSend_defaultsHandle(v28, v41, v42, v43);
    v48 = objc_msgSend_name(v10, v45, v46, v47);
    v51 = objc_msgSend_stringByAppendingString_(v48, v49, @"_startDate", v50);
    uint64_t v54 = objc_msgSend_objectForKey_(v44, v52, (uint64_t)v51, v53);
    v55 = v10->_startDate;
    v10->_startDate = (NSDate *)v54;

    v59 = objc_msgSend_defaultsHandle(v28, v56, v57, v58);
    v63 = objc_msgSend_name(v10, v60, v61, v62);
    v66 = objc_msgSend_stringByAppendingString_(v63, v64, @"_bitfield", v65);
    v10->_bitfield = objc_msgSend_integerForKey_(v59, v67, (uint64_t)v66, v68);

    goto LABEL_6;
  }
  v71 = sub_252A05B84();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend_name(v10, v72, v73, v74);
    objc_claimAutoreleasedReturnValue();
    sub_252A115A8();
  }

  v69 = 0;
LABEL_7:

  objc_destroyWeak(location);
  return v69;
}

- (BOOL)persist
{
  BOOL v5 = objc_msgSend_datastoreHandle(self, a2, v2, v3);
  if (!v5)
  {
    sub_252A05B84();
    v41 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_FAULT)) {
      sub_252A11674(self, v41, v55, v56);
    }
    goto LABEL_8;
  }
  v60.receiver = self;
  v60.super_class = (Class)IADataStoreDaterange;
  if (![(IADataStoreObject *)&v60 persist])
  {
    sub_252A05B84();
    v41 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_FAULT)) {
      sub_252A1173C(self, v41, v57, v58);
    }
LABEL_8:
    BOOL v54 = 0;
    goto LABEL_9;
  }
  v9 = objc_msgSend_defaultsHandle(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_originDate(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_name(self, v14, v15, v16);
  v20 = objc_msgSend_stringByAppendingString_(v17, v18, @"_originDate", v19);
  objc_msgSend_setObject_forKey_(v9, v21, (uint64_t)v13, (uint64_t)v20);

  v25 = objc_msgSend_defaultsHandle(v5, v22, v23, v24);
  v29 = objc_msgSend_startDate(self, v26, v27, v28);
  v33 = objc_msgSend_name(self, v30, v31, v32);
  v36 = objc_msgSend_stringByAppendingString_(v33, v34, @"_startDate", v35);
  objc_msgSend_setObject_forKey_(v25, v37, (uint64_t)v29, (uint64_t)v36);

  objc_msgSend_defaultsHandle(v5, v38, v39, v40);
  v41 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v45 = (int)objc_msgSend_bitfield(self, v42, v43, v44);
  v49 = objc_msgSend_name(self, v46, v47, v48);
  v52 = objc_msgSend_stringByAppendingString_(v49, v50, @"_bitfield", v51);
  objc_msgSend_setInteger_forKey_(v41, v53, v45, (uint64_t)v52);

  BOOL v54 = 1;
LABEL_9:

  return v54;
}

- (BOOL)destroy
{
  BOOL v5 = objc_msgSend_datastoreHandle(self, a2, v2, v3);
  if (!v5)
  {
    sub_252A05B84();
    uint64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_FAULT)) {
      sub_252A11674(self, v35, v46, v47);
    }
    goto LABEL_8;
  }
  v51.receiver = self;
  v51.super_class = (Class)IADataStoreDaterange;
  if (![(IADataStoreObject *)&v51 destroy])
  {
    sub_252A05B84();
    uint64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_FAULT)) {
      sub_252A117C0(self, v35, v48, v49);
    }
LABEL_8:
    BOOL v45 = 0;
    goto LABEL_9;
  }
  v9 = objc_msgSend_defaultsHandle(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_name(self, v10, v11, v12);
  uint64_t v16 = objc_msgSend_stringByAppendingString_(v13, v14, @"_originDate", v15);
  objc_msgSend_removeObjectForKey_(v9, v17, (uint64_t)v16, v18);

  uint64_t v22 = objc_msgSend_defaultsHandle(v5, v19, v20, v21);
  uint64_t v26 = objc_msgSend_name(self, v23, v24, v25);
  v29 = objc_msgSend_stringByAppendingString_(v26, v27, @"_startDate", v28);
  objc_msgSend_removeObjectForKey_(v22, v30, (uint64_t)v29, v31);

  objc_msgSend_defaultsHandle(v5, v32, v33, v34);
  uint64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = objc_msgSend_name(self, v36, v37, v38);
  uint64_t v42 = objc_msgSend_stringByAppendingString_(v39, v40, @"_bitfield", v41);
  objc_msgSend_removeObjectForKey_(v35, v43, (uint64_t)v42, v44);

  BOOL v45 = 1;
LABEL_9:

  return v45;
}

+ (id)type
{
  return @"IADataStoreDaterange";
}

- (unint64_t)usedInLastDay
{
  return ((uint64_t (*)(IADataStoreDaterange *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel_usedInLastNDays_, 1);
}

- (unint64_t)usedInLastWeek
{
  return ((uint64_t (*)(IADataStoreDaterange *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel_usedInLastNDays_, 7);
}

- (unint64_t)usedInLastMonth
{
  return ((uint64_t (*)(IADataStoreDaterange *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel_usedInLastNDays_, 28);
}

- (unint64_t)everUsed
{
  return ((uint64_t (*)(IADataStoreDaterange *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel_usedInLastNDays_, 32);
}

- (unint64_t)usedInLastNDays:(unint64_t)a3
{
  return objc_msgSend_usedInDayRangeFrom_to_(self, a2, 0, a3);
}

- (unint64_t)usedInDayRangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  v4 = objc_msgSend_timesUsedInDayRangeFrom_to_(self, a2, a3, a4);
  uint64_t v8 = v4;
  if (v4)
  {
    if (objc_msgSend_unsignedLongValue(v4, v5, v6, v7)) {
      unint64_t v9 = 2;
    }
    else {
      unint64_t v9 = 1;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)timesUsedInLastNDays:(unint64_t)a3
{
  return (id)objc_msgSend_timesUsedInDayRangeFrom_to_(self, a2, 0, a3);
}

- (unint64_t)usageFrequency
{
  BOOL v5 = objc_msgSend_now(MEMORY[0x263EFF910], a2, v2, v3);
  unint64_t v9 = objc_msgSend_originDate(self, v6, v7, v8);
  objc_msgSend_timeIntervalSinceDate_(v5, v10, (uint64_t)v9, v11);
  double v13 = v12;

  if (v13 >= 2505600.0)
  {
    uint64_t v16 = objc_msgSend_timesUsedInDayRangeFrom_to_(self, v14, 1, 29);
    uint64_t v20 = v16;
    if (v16)
    {
      if (objc_msgSend_unsignedLongValue(v16, v17, v18, v19) == 28)
      {
        unint64_t v15 = 1;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v25 = objc_msgSend_usedInDayRangeFrom_to_(self, v21, 1, 8);
      uint64_t v27 = objc_msgSend_usedInDayRangeFrom_to_(self, v26, 8, 15);
      uint64_t v29 = objc_msgSend_usedInDayRangeFrom_to_(self, v28, 15, 22);
      uint64_t v31 = objc_msgSend_usedInDayRangeFrom_to_(self, v30, 22, 29);
      if (v25 && v27 && v29 && v31)
      {
        if (v25 == 2 && v27 == 2 && v29 == 2 && v31 == 2)
        {
          unint64_t v15 = 2;
          goto LABEL_20;
        }
        uint64_t v36 = objc_msgSend_usedInDayRangeFrom_to_(self, v32, 1, 29);
        if (v36 == 2)
        {
          unint64_t v15 = 3;
          goto LABEL_20;
        }
        if (v36)
        {
          unint64_t v15 = 4;
          goto LABEL_20;
        }
        sub_252A05B84();
        uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
          sub_252A119D0(self, v22, v37, v38);
        }
      }
      else
      {
        sub_252A05B84();
        uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
          sub_252A1194C(self, v22, v33, v34);
        }
      }
    }
    else
    {
      sub_252A05B84();
      uint64_t v22 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
        sub_252A118C8(self, v22, v23, v24);
      }
    }

    unint64_t v15 = 5;
    goto LABEL_20;
  }
  unint64_t v15 = 0;
LABEL_21:

  return v15;
}

- (unint64_t)bitmaskForLessThanDayN:(unint64_t)a3
{
  if (a3 <= 0x1F) {
    return ~(-1 << a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

- (unint64_t)bitmaskForDayRangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend_bitmaskForLessThanDayN_(self, a2, a4, a4);
  return objc_msgSend_bitmaskForLessThanDayN_(self, v7, a3, v8) ^ v6;
}

- (id)timesUsedInDayRangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a4 < a3)
  {
    uint64_t v7 = sub_252A05B84();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v27 = objc_msgSend_name(self, v8, v9, v10);
      int v28 = 138478339;
      uint64_t v29 = v27;
      __int16 v30 = 2048;
      unint64_t v31 = a4;
      __int16 v32 = 2048;
      unint64_t v33 = a3;
      _os_log_fault_impl(&dword_2529F1000, v7, OS_LOG_TYPE_FAULT, "Daterange with name %{private}@ requires endDayNumber (%lu) >= startDayNumber (%lu)", (uint8_t *)&v28, 0x20u);
    }
LABEL_12:
    uint64_t v22 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend__updateStartDate(self, a2, a3, a4) & 1) == 0)
  {
    sub_252A05B84();
    uint64_t v23 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_FAULT)) {
      sub_252A11A54(self, v23, v24, v25);
    }

    goto LABEL_12;
  }
  int v12 = objc_msgSend_bitmaskForDayRangeFrom_to_(self, v11, a3, a4);
  uint32x2_t v18 = (uint32x2_t)vdup_n_s32(objc_msgSend_bitfield(self, v13, v14, v15) & v12);
  int32x2_t v19 = (int32x2_t)0x100000000;
  int64x2_t v20 = 0uLL;
  int v21 = 32;
  do
  {
    int64x2_t v20 = (int64x2_t)vaddw_u32((uint64x2_t)v20, (uint32x2_t)vand_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)vneg_s32(v19)), (int8x8_t)0x100000001));
    int32x2_t v19 = vadd_s32(v19, (int32x2_t)0x200000002);
    v21 -= 2;
  }
  while (v21);
  uint64_t v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v16, vaddvq_s64(v20), v17);
LABEL_13:
  return v22;
}

- (BOOL)_updateStartDate
{
  BOOL v5 = objc_msgSend_now(MEMORY[0x263EFF910], a2, v2, v3);
  uint64_t v9 = objc_msgSend_startDate(self, v6, v7, v8);
  objc_msgSend_timeIntervalSinceDate_(v5, v10, (uint64_t)v9, v11);
  double v13 = v12;

  uint64_t v17 = (uint64_t)(v13 / 86400.0);
  if (v17 < 0)
  {
    sub_252A05B84();
    int32x2_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT)) {
      sub_252A11AD8(self, v19, v20, v21);
    }

    char v18 = 0;
  }
  else
  {
    if (v17)
    {
      if ((unint64_t)v17 < 0x20)
      {
        int v22 = (objc_msgSend_bitfield(self, v14, v15, v16) & -(0x80000000 >> v17)) != 0;
        self->_bitfield = (objc_msgSend_bitfield(self, v23, v24, v25) << v17) | (v22 << 31);
        uint64_t v26 = (void *)MEMORY[0x263EFF910];
        __int16 v30 = objc_msgSend_startDate(self, v27, v28, v29);
        objc_msgSend_dateWithTimeInterval_sinceDate_(v26, v31, (uint64_t)v30, v32, (double)v17 * 86400.0);
        unint64_t v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
        startDate = self->_startDate;
        self->_startDate = v33;

        char v18 = objc_msgSend_persist(self, v35, v36, v37);
        goto LABEL_10;
      }
      self->_bitfield = (objc_msgSend_bitfield(self, v14, v15, v16) != 0) << 31;
    }
    char v18 = 1;
  }
LABEL_10:

  return v18;
}

- (BOOL)markToday
{
  if (objc_msgSend__updateStartDate(self, a2, v2, v3))
  {
    self->_bitfield = objc_msgSend_bitfield(self, v5, v6, v7) | 1;
    return objc_msgSend_persist(self, v8, v9, v10);
  }
  else
  {
    sub_252A05B84();
    double v12 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT)) {
      sub_252A11A54(self, v12, v13, v14);
    }

    return 0;
  }
}

- (BOOL)_clearWithMask:(int64_t)a3
{
  int v4 = a3;
  char updated = objc_msgSend__updateStartDate(self, a2, a3, v3);
  if (updated)
  {
    self->_bitfield &= v4;
  }
  else
  {
    sub_252A05B84();
    uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
      sub_252A11A54(self, v7, v8, v9);
    }
  }
  return updated;
}

- (BOOL)clearAllUsage
{
  return ((uint64_t (*)(IADataStoreDaterange *, char *, void))MEMORY[0x270F9A6D0])(self, sel__clearWithMask_, 0);
}

- (BOOL)clearMonthlyUsage
{
  return ((uint64_t (*)(IADataStoreDaterange *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel__clearWithMask_, 0x80000000);
}

- (BOOL)clearHistoricalUsage
{
  return ((uint64_t (*)(IADataStoreDaterange *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel__clearWithMask_, 0x7FFFFFFFLL);
}

- (void)setStartDate:(id)a3
{
  BOOL v5 = (NSDate *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  startDate = self->_startDate;
  self->_startDate = v5;
  MEMORY[0x270F9A758](v5, startDate);
}

- (void)setOriginDate:(id)a3
{
  BOOL v5 = (NSDate *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  originDate = self->_originDate;
  self->_originDate = v5;
  MEMORY[0x270F9A758](v5, originDate);
}

- (void)setBitfield:(int)a3
{
  self->_bitfield = a3;
}

- (NSDate)originDate
{
  return self->_originDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int)bitfield
{
  return self->_bitfield;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_originDate, 0);
}

@end