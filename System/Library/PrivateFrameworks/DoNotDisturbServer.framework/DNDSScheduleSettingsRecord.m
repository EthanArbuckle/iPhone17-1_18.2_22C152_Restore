@interface DNDSScheduleSettingsRecord
+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4;
+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5;
+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4;
+ (id)recordForLegacyBehaviorOverride:(id)a3 lastUpdated:(id)a4;
- (BOOL)isEqual:(id)a3;
- (DNDSScheduleSettingsRecord)init;
- (NSNumber)bedtimeBehaviorEnabledSetting;
- (NSNumber)lastUpdatedTimestamp;
- (NSNumber)scheduleEnabledSetting;
- (NSNumber)timePeriodEndTimeHour;
- (NSNumber)timePeriodEndTimeMinute;
- (NSNumber)timePeriodStartTimeHour;
- (NSNumber)timePeriodStartTimeMinute;
- (NSNumber)timePeriodWeekdays;
- (NSString)description;
- (id)_initWithLastUpdatedTimestamp:(id)a3 scheduleEnabledSetting:(id)a4 timePeriodStartTimeHour:(id)a5 timePeriodStartTimeMinute:(id)a6 timePeriodEndTimeHour:(id)a7 timePeriodEndTimeMinute:(id)a8 timePeriodWeekdays:(id)a9 bedtimeBehaviorEnabledSetting:(id)a10;
- (id)_initWithRecord:(id)a3;
- (id)dictionaryRepresentationWithContext:(id)a3;
- (id)legacyBehaviorOverride;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation DNDSScheduleSettingsRecord

- (DNDSScheduleSettingsRecord)init
{
  return (DNDSScheduleSettingsRecord *)[(DNDSScheduleSettingsRecord *)self _initWithRecord:0];
}

- (id)_initWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 lastUpdatedTimestamp];
  v6 = [v4 scheduleEnabledSetting];
  v7 = [v4 timePeriodStartTimeHour];
  v8 = [v4 timePeriodStartTimeMinute];
  v9 = [v4 timePeriodEndTimeHour];
  v10 = [v4 timePeriodEndTimeMinute];
  v11 = [v4 timePeriodWeekdays];
  v12 = [v4 bedtimeBehaviorEnabledSetting];

  id v13 = [(DNDSScheduleSettingsRecord *)self _initWithLastUpdatedTimestamp:v5 scheduleEnabledSetting:v6 timePeriodStartTimeHour:v7 timePeriodStartTimeMinute:v8 timePeriodEndTimeHour:v9 timePeriodEndTimeMinute:v10 timePeriodWeekdays:v11 bedtimeBehaviorEnabledSetting:v12];
  return v13;
}

- (id)_initWithLastUpdatedTimestamp:(id)a3 scheduleEnabledSetting:(id)a4 timePeriodStartTimeHour:(id)a5 timePeriodStartTimeMinute:(id)a6 timePeriodEndTimeHour:(id)a7 timePeriodEndTimeMinute:(id)a8 timePeriodWeekdays:(id)a9 bedtimeBehaviorEnabledSetting:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v51.receiver = self;
  v51.super_class = (Class)DNDSScheduleSettingsRecord;
  v24 = [(DNDSScheduleSettingsRecord *)&v51 init];
  if (v24)
  {
    uint64_t v25 = [v16 copy];
    id v50 = v16;
    v26 = (void *)v25;
    if (v25) {
      v27 = (void *)v25;
    }
    else {
      v27 = &unk_1F2A5D880;
    }
    objc_storeStrong((id *)&v24->_lastUpdatedTimestamp, v27);

    uint64_t v28 = [v17 copy];
    v29 = (void *)v28;
    if (v28) {
      v30 = (void *)v28;
    }
    else {
      v30 = &unk_1F2A5D880;
    }
    objc_storeStrong((id *)&v24->_scheduleEnabledSetting, v30);

    uint64_t v31 = [v18 copy];
    v32 = (void *)v31;
    if (v31) {
      v33 = (void *)v31;
    }
    else {
      v33 = &unk_1F2A5D880;
    }
    objc_storeStrong((id *)&v24->_timePeriodStartTimeHour, v33);

    uint64_t v34 = [v19 copy];
    v35 = (void *)v34;
    if (v34) {
      v36 = (void *)v34;
    }
    else {
      v36 = &unk_1F2A5D880;
    }
    objc_storeStrong((id *)&v24->_timePeriodStartTimeMinute, v36);

    uint64_t v37 = [v20 copy];
    v38 = (void *)v37;
    if (v37) {
      v39 = (void *)v37;
    }
    else {
      v39 = &unk_1F2A5D880;
    }
    objc_storeStrong((id *)&v24->_timePeriodEndTimeHour, v39);

    uint64_t v40 = [v21 copy];
    v41 = (void *)v40;
    if (v40) {
      v42 = (void *)v40;
    }
    else {
      v42 = &unk_1F2A5D880;
    }
    objc_storeStrong((id *)&v24->_timePeriodEndTimeMinute, v42);

    uint64_t v43 = [v22 copy];
    v44 = (void *)v43;
    if (v43) {
      v45 = (void *)v43;
    }
    else {
      v45 = &unk_1F2A5D898;
    }
    objc_storeStrong((id *)&v24->_timePeriodWeekdays, v45);

    uint64_t v46 = [v23 copy];
    v47 = (void *)v46;
    if (v46) {
      v48 = (void *)v46;
    }
    else {
      v48 = &unk_1F2A5D880;
    }
    objc_storeStrong((id *)&v24->_bedtimeBehaviorEnabledSetting, v48);

    id v16 = v50;
  }

  return v24;
}

- (unint64_t)hash
{
  v3 = [(DNDSScheduleSettingsRecord *)self lastUpdatedTimestamp];
  uint64_t v4 = [v3 hash];
  v5 = [(DNDSScheduleSettingsRecord *)self scheduleEnabledSetting];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeHour];
  uint64_t v8 = [v7 hash];
  v9 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeMinute];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeHour];
  uint64_t v12 = [v11 hash];
  id v13 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeMinute];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(DNDSScheduleSettingsRecord *)self timePeriodWeekdays];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  id v17 = [(DNDSScheduleSettingsRecord *)self bedtimeBehaviorEnabledSetting];
  unint64_t v18 = v16 ^ [v17 hash];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDSScheduleSettingsRecord *)a3;
  if (self == v4)
  {
    char v18 = 1;
    goto LABEL_124;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v18 = 0;
    goto LABEL_124;
  }
  v5 = v4;
  uint64_t v6 = [(DNDSScheduleSettingsRecord *)self lastUpdatedTimestamp];
  v7 = [(DNDSScheduleSettingsRecord *)v5 lastUpdatedTimestamp];
  if (v6 != v7)
  {
    uint64_t v8 = [(DNDSScheduleSettingsRecord *)self lastUpdatedTimestamp];
    if (!v8)
    {
      v122 = 0;
      long long v125 = 0uLL;
      int v12 = 0;
      int v13 = 0;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, sizeof(v124));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      goto LABEL_64;
    }
    v122 = (void *)v8;
    uint64_t v10 = [(DNDSScheduleSettingsRecord *)v5 lastUpdatedTimestamp];
    if (!v10)
    {
      v119 = 0;
      int v12 = 0;
      int v13 = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 36);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[4]) = 1;
      goto LABEL_64;
    }
    v119 = (void *)v10;
    v11 = [(DNDSScheduleSettingsRecord *)self lastUpdatedTimestamp];
    [(DNDSScheduleSettingsRecord *)v5 lastUpdatedTimestamp];
    v114 = v115 = v11;
    if (!objc_msgSend(v11, "isEqual:"))
    {
      v124[3] = 0;
      int v12 = 0;
      int v13 = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 20);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      v124[4] = 0x100000000;
      HIDWORD(v124[2]) = 1;
      goto LABEL_64;
    }
  }
  uint64_t v19 = [(DNDSScheduleSettingsRecord *)self scheduleEnabledSetting];
  uint64_t v20 = [(DNDSScheduleSettingsRecord *)v5 scheduleEnabledSetting];
  BOOL v21 = v19 != v20;
  HIDWORD(v124[4]) = v6 != v7;
  v120 = (void *)v20;
  v121 = (void *)v19;
  if (v19 != v20)
  {
    uint64_t v22 = [(DNDSScheduleSettingsRecord *)self scheduleEnabledSetting];
    if (!v22)
    {
      v118 = 0;
      int v12 = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      memset(v124, 0, 20);
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      LODWORD(v124[3]) = 1;
      *(void *)((char *)&v124[3] + 4) = 0x100000000;
      HIDWORD(v124[2]) = v6 != v7;
      int v13 = 0;
      goto LABEL_64;
    }
    v118 = (void *)v22;
    uint64_t v23 = [(DNDSScheduleSettingsRecord *)v5 scheduleEnabledSetting];
    if (!v23)
    {
      v113 = 0;
      v124[0] = 0;
      v124[1] = 0;
      int v12 = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      LODWORD(v124[3]) = 1;
      *(void *)((char *)&v124[3] + 4) = 0x100000000;
      HIDWORD(v124[2]) = v6 != v7;
      int v13 = 0;
      LODWORD(v124[2]) = 1;
      goto LABEL_64;
    }
    v113 = (void *)v23;
    v24 = [(DNDSScheduleSettingsRecord *)self scheduleEnabledSetting];
    v108 = [(DNDSScheduleSettingsRecord *)v5 scheduleEnabledSetting];
    v109 = v24;
    if (!objc_msgSend(v24, "isEqual:"))
    {
      int v12 = 0;
      v124[0] = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      LODWORD(v124[3]) = 1;
      *(void *)((char *)&v124[3] + 4) = 0x100000000;
      LODWORD(v124[2]) = 1;
      HIDWORD(v124[2]) = v6 != v7;
      int v13 = 0;
      v124[1] = 1;
      goto LABEL_64;
    }
  }
  uint64_t v25 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeHour];
  uint64_t v26 = [(DNDSScheduleSettingsRecord *)v5 timePeriodStartTimeHour];
  BOOL v27 = v25 != v26;
  LODWORD(v124[4]) = v21;
  v116 = (void *)v26;
  v117 = (void *)v25;
  if (v25 != v26)
  {
    uint64_t v28 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeHour];
    if (!v28)
    {
      v112 = 0;
      uint64_t v9 = 0;
      v124[0] = 0;
      long long v125 = 0uLL;
      BOOL v40 = v21;
      int v12 = 0;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      int v13 = 0;
      LODWORD(v124[2]) = v40;
      v124[1] = v40 | 0x100000000;
      goto LABEL_64;
    }
    v112 = (void *)v28;
    uint64_t v29 = [(DNDSScheduleSettingsRecord *)v5 timePeriodStartTimeHour];
    if (!v29)
    {
      v107 = 0;
      uint64_t v9 = 0;
      v124[0] = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      int v13 = 0;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = 1;
      goto LABEL_64;
    }
    v107 = (void *)v29;
    v30 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeHour];
    v102 = [(DNDSScheduleSettingsRecord *)v5 timePeriodStartTimeHour];
    v103 = v30;
    if (!objc_msgSend(v30, "isEqual:"))
    {
      v124[0] = 0;
      long long v125 = 0uLL;
      memset(v123, 0, sizeof(v123));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      v124[3] = 0x100000001;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = 1;
      int v13 = 1;
      goto LABEL_64;
    }
  }
  uint64_t v31 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeMinute];
  uint64_t v32 = [(DNDSScheduleSettingsRecord *)v5 timePeriodStartTimeMinute];
  v33 = (void *)v31;
  v110 = (void *)v32;
  BOOL v34 = v31 == v32;
  BOOL v35 = v31 != v32;
  HIDWORD(v124[3]) = v27;
  v111 = v33;
  if (v34)
  {
    HIDWORD(v125) = v35;
  }
  else
  {
    uint64_t v36 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeMinute];
    if (!v36)
    {
      v106 = 0;
      *(void *)((char *)&v125 + 4) = 0;
      BOOL v46 = v27;
      memset(v123, 0, sizeof(v123));
      LODWORD(v125) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      uint64_t v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = v46;
      int v13 = v46;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      goto LABEL_64;
    }
    v106 = (void *)v36;
    uint64_t v37 = [(DNDSScheduleSettingsRecord *)v5 timePeriodStartTimeMinute];
    if (!v37)
    {
      v101 = 0;
      *(void *)((char *)&v125 + 4) = 0;
      BOOL v54 = v27;
      memset(v123, 0, 28);
      LODWORD(v125) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      uint64_t v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = v54;
      int v13 = v54;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      *(_OWORD *)&v123[28] = 1uLL;
      goto LABEL_64;
    }
    HIDWORD(v125) = v35;
    v101 = (void *)v37;
    v38 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeMinute];
    v96 = [(DNDSScheduleSettingsRecord *)v5 timePeriodStartTimeMinute];
    v97 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(void *)&v123[36] = 0;
      *(void *)((char *)&v125 + 4) = 0;
      BOOL v39 = v27;
      memset(v123, 0, 24);
      LODWORD(v125) = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      uint64_t v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = v39;
      int v13 = v39;
      v124[0] = 0x100000000;
      HIDWORD(v125) = 1;
      *(_DWORD *)&v123[32] = 0;
      *(void *)&v123[24] = 0x100000001;
      goto LABEL_64;
    }
  }
  uint64_t v41 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeHour];
  v104 = [(DNDSScheduleSettingsRecord *)v5 timePeriodEndTimeHour];
  DWORD2(v125) = v41 != (void)v104;
  v105 = (void *)v41;
  if ((void *)v41 != v104)
  {
    uint64_t v42 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeHour];
    if (!v42)
    {
      v100 = 0;
      *(void *)&long long v125 = 0;
      BOOL v55 = v27;
      memset(v123, 0, 24);
      *(void *)&v123[32] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      uint64_t v9 = 1;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      v124[1] = v21 | 0x100000000;
      LODWORD(v124[2]) = v21;
      int v12 = v55;
      int v13 = v55;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      goto LABEL_64;
    }
    v100 = (void *)v42;
    uint64_t v43 = [(DNDSScheduleSettingsRecord *)v5 timePeriodEndTimeHour];
    if (!v43)
    {
      v95 = 0;
      *(void *)&v123[12] = 0;
      *(_DWORD *)&v123[20] = 0;
      *(void *)&long long v125 = 0;
      BOOL v60 = v27;
      *(void *)v123 = 0;
      *(void *)&v123[32] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v60;
      int v13 = v60;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      *(_DWORD *)&v123[8] = 1;
      goto LABEL_64;
    }
    v95 = (void *)v43;
    v44 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeHour];
    v90 = [(DNDSScheduleSettingsRecord *)v5 timePeriodEndTimeHour];
    v91 = v44;
    if (!objc_msgSend(v44, "isEqual:"))
    {
      *(void *)&long long v125 = 0;
      BOOL v45 = v27;
      *(void *)v123 = 0;
      *(void *)&v123[32] = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v45;
      int v13 = v45;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      DWORD2(v125) = 1;
      *(_OWORD *)&v123[8] = 0x100000001uLL;
      goto LABEL_64;
    }
  }
  uint64_t v47 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeMinute];
  uint64_t v48 = [(DNDSScheduleSettingsRecord *)v5 timePeriodEndTimeMinute];
  v49 = (void *)v47;
  BOOL v34 = v47 == v48;
  BOOL v50 = v47 != v48;
  v98 = (void *)v48;
  v99 = v49;
  if (v34)
  {
    DWORD1(v125) = v50;
  }
  else
  {
    uint64_t v51 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeMinute];
    if (!v51)
    {
      v94 = 0;
      BOOL v61 = v27;
      *(void *)v123 = 0;
      *(void *)&v123[16] = 0x100000000;
      *(void *)&v123[32] = 0;
      *(void *)&long long v125 = 0x100000000;
      uint64_t v9 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v61;
      int v13 = v61;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[8] = DWORD2(v125);
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      goto LABEL_64;
    }
    v94 = (void *)v51;
    uint64_t v52 = [(DNDSScheduleSettingsRecord *)v5 timePeriodEndTimeMinute];
    if (!v52)
    {
      v89 = 0;
      *(void *)&v123[16] = 0x100000000;
      *(void *)&v123[32] = 0;
      *(void *)&long long v125 = 0x100000000;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      *(void *)&v123[4] = __PAIR64__(DWORD2(v125), 1);
      goto LABEL_64;
    }
    DWORD1(v125) = v50;
    v89 = (void *)v52;
    v53 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeMinute];
    v85 = [(DNDSScheduleSettingsRecord *)v5 timePeriodEndTimeMinute];
    v86 = v53;
    if (!objc_msgSend(v53, "isEqual:"))
    {
      *(void *)&v123[32] = 0;
      *(void *)&long long v125 = 0x100000000;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(void *)&v123[12] = DWORD2(v125) | 0x100000000;
      int v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(void *)&v123[4] = __PAIR64__(DWORD2(v125), 1);
      goto LABEL_64;
    }
  }
  uint64_t v56 = [(DNDSScheduleSettingsRecord *)self timePeriodWeekdays];
  v92 = [(DNDSScheduleSettingsRecord *)v5 timePeriodWeekdays];
  LODWORD(v125) = v56 != (void)v92;
  v93 = (void *)v56;
  if ((void *)v56 != v92)
  {
    uint64_t v57 = [(DNDSScheduleSettingsRecord *)self timePeriodWeekdays];
    if (!v57)
    {
      v88 = 0;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[32] = 0;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      goto LABEL_64;
    }
    v88 = (void *)v57;
    uint64_t v58 = [(DNDSScheduleSettingsRecord *)v5 timePeriodWeekdays];
    if (!v58)
    {
      v84 = 0;
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      v124[0] = 0x100000000;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      *(_DWORD *)&v123[32] = 1;
      goto LABEL_64;
    }
    v84 = (void *)v58;
    v59 = [(DNDSScheduleSettingsRecord *)self timePeriodWeekdays];
    v81 = [(DNDSScheduleSettingsRecord *)v5 timePeriodWeekdays];
    v82 = v59;
    if (!objc_msgSend(v59, "isEqual:"))
    {
      uint64_t v9 = 0;
      int v16 = 0;
      int v17 = 0;
      v123[0] = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      int v15 = 0;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      int v14 = 0;
      *(_DWORD *)&v123[20] = 1;
      *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[32] = 1;
      *(_DWORD *)&v123[36] = 1;
      LODWORD(v125) = 1;
      v124[0] = 0x100000001;
      goto LABEL_64;
    }
  }
  uint64_t v62 = [(DNDSScheduleSettingsRecord *)self bedtimeBehaviorEnabledSetting];
  uint64_t v63 = [(DNDSScheduleSettingsRecord *)v5 bedtimeBehaviorEnabledSetting];
  uint64_t v9 = v62;
  if (v62 == v63)
  {
    int v16 = 0;
    int v17 = 0;
    HIDWORD(v124[2]) = v6 != v7;
    LODWORD(v124[3]) = 1;
    LODWORD(v124[2]) = v21;
    v124[1] = v21 | 0x100000000;
    int v12 = v27;
    int v13 = v27;
    int v15 = 0;
    *(_DWORD *)&v123[24] = HIDWORD(v125);
    *(_DWORD *)&v123[28] = HIDWORD(v125);
    *(_DWORD *)&v123[40] = 1;
    *(_DWORD *)&v123[12] = DWORD2(v125);
    *(_DWORD *)&v123[20] = 1;
    *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
    *(_DWORD *)&v123[16] = DWORD1(v125);
    *(_DWORD *)&v123[36] = 1;
    *(_DWORD *)&v123[32] = v125;
    v124[0] = v125 | 0x100000000;
    v87 = (void *)v62;
    int v14 = 1;
    v123[0] = 1;
  }
  else
  {
    v87 = (void *)v63;
    uint64_t v64 = [(DNDSScheduleSettingsRecord *)self bedtimeBehaviorEnabledSetting];
    if (v64)
    {
      v83 = (void *)v64;
      uint64_t v65 = [(DNDSScheduleSettingsRecord *)v5 bedtimeBehaviorEnabledSetting];
      if (v65)
      {
        v80 = (void *)v65;
        v66 = [(DNDSScheduleSettingsRecord *)self bedtimeBehaviorEnabledSetting];
        v78 = [(DNDSScheduleSettingsRecord *)v5 bedtimeBehaviorEnabledSetting];
        v79 = v66;
        HIDWORD(v124[2]) = v6 != v7;
        LODWORD(v124[3]) = 1;
        LODWORD(v124[2]) = v21;
        v124[1] = v21 | 0x100000000;
        int v12 = v27;
        int v13 = v27;
        *(_DWORD *)&v123[24] = HIDWORD(v125);
        *(_DWORD *)&v123[28] = HIDWORD(v125);
        *(_DWORD *)&v123[36] = 1;
        *(_DWORD *)&v123[40] = 1;
        *(_DWORD *)&v123[12] = DWORD2(v125);
        *(_DWORD *)&v123[16] = DWORD1(v125);
        *(_DWORD *)&v123[20] = 1;
        v123[0] = objc_msgSend(v66, "isEqual:");
        *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
        *(_DWORD *)&v123[32] = v125;
        v124[0] = v125 | 0x100000000;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
        int v17 = 1;
      }
      else
      {
        v80 = 0;
        int v17 = 0;
        HIDWORD(v124[2]) = v6 != v7;
        LODWORD(v124[3]) = 1;
        LODWORD(v124[2]) = v21;
        v124[1] = v21 | 0x100000000;
        int v12 = v27;
        int v13 = v27;
        *(_DWORD *)&v123[24] = HIDWORD(v125);
        *(_DWORD *)&v123[28] = HIDWORD(v125);
        *(_DWORD *)&v123[40] = 1;
        *(_DWORD *)&v123[12] = DWORD2(v125);
        v123[0] = 0;
        *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
        *(_DWORD *)&v123[16] = DWORD1(v125);
        *(_DWORD *)&v123[20] = 1;
        *(_DWORD *)&v123[32] = v125;
        *(_DWORD *)&v123[36] = 1;
        v124[0] = v125 | 0x100000000;
        int v14 = 1;
        int v15 = 1;
        int v16 = 1;
      }
    }
    else
    {
      v83 = 0;
      int v16 = 0;
      int v17 = 0;
      HIDWORD(v124[2]) = v6 != v7;
      LODWORD(v124[3]) = 1;
      LODWORD(v124[2]) = v21;
      v124[1] = v21 | 0x100000000;
      int v12 = v27;
      int v13 = v27;
      *(_DWORD *)&v123[24] = HIDWORD(v125);
      *(_DWORD *)&v123[28] = HIDWORD(v125);
      *(_DWORD *)&v123[40] = 1;
      *(_DWORD *)&v123[12] = DWORD2(v125);
      v123[0] = 0;
      *(void *)&v123[4] = *(void *)((char *)&v125 + 4);
      *(_DWORD *)&v123[16] = DWORD1(v125);
      *(_DWORD *)&v123[20] = 1;
      *(_DWORD *)&v123[32] = v125;
      *(_DWORD *)&v123[36] = 1;
      v124[0] = v125 | 0x100000000;
      int v14 = 1;
      int v15 = 1;
    }
    uint64_t v9 = v62;
  }
LABEL_64:
  uint64_t v67 = v9;
  if (v17)
  {
    v68 = v5;
    int v69 = v13;
    v70 = v7;
    v71 = v6;
    int v72 = v14;
    int v73 = v12;
    int v74 = v15;
    int v75 = v16;

    uint64_t v9 = v67;
    int v16 = v75;
    int v15 = v74;
    int v12 = v73;
    int v14 = v72;
    uint64_t v6 = v71;
    v7 = v70;
    int v13 = v69;
    v5 = v68;
  }
  if (v16)
  {

    uint64_t v9 = v67;
  }
  if (v15)
  {

    uint64_t v9 = v67;
  }
  if (v14)
  {
    v76 = (void *)v9;
  }
  if (LODWORD(v124[0]))
  {
  }
  if (*(_DWORD *)&v123[32]) {

  }
  if (v125) {
  if (*(_DWORD *)&v123[36])
  }
  {
  }
  if (*(_DWORD *)&v123[16])
  {
  }
  if (*(_DWORD *)&v123[4]) {

  }
  if (DWORD1(v125)) {
  if (*(_DWORD *)&v123[20])
  }
  {
  }
  if (*(_DWORD *)&v123[12])
  {
  }
  if (*(_DWORD *)&v123[8]) {

  }
  if (DWORD2(v125)) {
  if (*(_DWORD *)&v123[40])
  }
  {
  }
  if (*(_DWORD *)&v123[24])
  {
  }
  if (*(_DWORD *)&v123[28]) {

  }
  if (HIDWORD(v125)) {
  if (HIDWORD(v124[0]))
  }
  {

    if (!v13)
    {
LABEL_104:
      if (!v12) {
        goto LABEL_105;
      }
LABEL_127:

      if (!HIDWORD(v124[3])) {
        goto LABEL_107;
      }
      goto LABEL_106;
    }
  }
  else if (!v13)
  {
    goto LABEL_104;
  }

  if (v12) {
    goto LABEL_127;
  }
LABEL_105:
  if (HIDWORD(v124[3])) {
LABEL_106:
  }

LABEL_107:
  if (HIDWORD(v124[1]))
  {
  }
  if (LODWORD(v124[1]))
  {
  }
  if (LODWORD(v124[2])) {

  }
  if (LODWORD(v124[4])) {
  if (LODWORD(v124[3]))
  }
  {
  }
  if (HIDWORD(v124[2]))
  {
  }
  if (HIDWORD(v124[4])) {

  }
  if (v6 != v7) {
  char v18 = v123[0];
  }
LABEL_124:

  return v18;
}

- (NSString)description
{
  int v14 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(DNDSScheduleSettingsRecord *)self lastUpdatedTimestamp];
  v5 = [(DNDSScheduleSettingsRecord *)self scheduleEnabledSetting];
  uint64_t v6 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeHour];
  v7 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeMinute];
  uint64_t v8 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeHour];
  uint64_t v9 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeMinute];
  uint64_t v10 = [(DNDSScheduleSettingsRecord *)self timePeriodWeekdays];
  v11 = [(DNDSScheduleSettingsRecord *)self bedtimeBehaviorEnabledSetting];
  objc_msgSend(v14, "stringWithFormat:", @"<%@: %p; lastUpdatedTimestamp: %@; scheduleEnabledSetting: %@; timePeriodStartTimeHour: %@; timePeriodStartTimeMinute: %@; timePeriodEndTimeHour: %@; timePeriodEndTimeMinute: %@; timePeriodWeekdays: %@; bedtimeBehaviorEnabledSetting: %@>",
    v3,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
  int v12 = v11);

  return (NSString *)v12;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [DNDSMutableScheduleSettingsRecord alloc];
  return [(DNDSScheduleSettingsRecord *)v4 _initWithRecord:self];
}

+ (id)migrateDictionaryRepresentation:(id)a3 fromVersionNumber:(unint64_t)a4 toVersionNumber:(unint64_t)a5
{
  id v5 = a3;
  return v5;
}

+ (id)newWithDictionaryRepresentation:(id)a3 context:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"lastUpdatedTimestamp", objc_opt_class());
  v7 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"scheduleEnabledSetting", objc_opt_class());
  uint64_t v8 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"timePeriodStartTimeHour", objc_opt_class());
  uint64_t v9 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"timePeriodStartTimeMinute", objc_opt_class());
  uint64_t v10 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"timePeriodEndTimeHour", objc_opt_class());
  v11 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"timePeriodEndTimeMinute", objc_opt_class());
  int v12 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"timePeriodWeekdays", objc_opt_class());
  int v13 = objc_msgSend(v5, "bs_safeObjectForKey:ofType:", @"bedtimeBehaviorEnabledSetting", objc_opt_class());

  int v14 = (void *)[objc_alloc((Class)a1) _initWithLastUpdatedTimestamp:v6 scheduleEnabledSetting:v7 timePeriodStartTimeHour:v8 timePeriodStartTimeMinute:v9 timePeriodEndTimeHour:v10 timePeriodEndTimeMinute:v11 timePeriodWeekdays:v12 bedtimeBehaviorEnabledSetting:v13];
  return v14;
}

- (id)dictionaryRepresentationWithContext:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  id v5 = [(DNDSScheduleSettingsRecord *)self lastUpdatedTimestamp];
  [v4 setObject:v5 forKey:@"lastUpdatedTimestamp"];

  uint64_t v6 = [(DNDSScheduleSettingsRecord *)self scheduleEnabledSetting];
  [v4 setObject:v6 forKey:@"scheduleEnabledSetting"];

  v7 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeHour];
  [v4 setObject:v7 forKey:@"timePeriodStartTimeHour"];

  uint64_t v8 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeMinute];
  [v4 setObject:v8 forKey:@"timePeriodStartTimeMinute"];

  uint64_t v9 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeHour];
  [v4 setObject:v9 forKey:@"timePeriodEndTimeHour"];

  uint64_t v10 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeMinute];
  [v4 setObject:v10 forKey:@"timePeriodEndTimeMinute"];

  v11 = [(DNDSScheduleSettingsRecord *)self timePeriodWeekdays];
  [v4 setObject:v11 forKey:@"timePeriodWeekdays"];

  int v12 = [(DNDSScheduleSettingsRecord *)self bedtimeBehaviorEnabledSetting];
  [v4 setObject:v12 forKey:@"bedtimeBehaviorEnabledSetting"];

  return v4;
}

- (NSNumber)lastUpdatedTimestamp
{
  return self->_lastUpdatedTimestamp;
}

- (NSNumber)scheduleEnabledSetting
{
  return self->_scheduleEnabledSetting;
}

- (NSNumber)timePeriodStartTimeHour
{
  return self->_timePeriodStartTimeHour;
}

- (NSNumber)timePeriodStartTimeMinute
{
  return self->_timePeriodStartTimeMinute;
}

- (NSNumber)timePeriodEndTimeHour
{
  return self->_timePeriodEndTimeHour;
}

- (NSNumber)timePeriodEndTimeMinute
{
  return self->_timePeriodEndTimeMinute;
}

- (NSNumber)timePeriodWeekdays
{
  return self->_timePeriodWeekdays;
}

- (NSNumber)bedtimeBehaviorEnabledSetting
{
  return self->_bedtimeBehaviorEnabledSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bedtimeBehaviorEnabledSetting, 0);
  objc_storeStrong((id *)&self->_timePeriodWeekdays, 0);
  objc_storeStrong((id *)&self->_timePeriodEndTimeMinute, 0);
  objc_storeStrong((id *)&self->_timePeriodEndTimeHour, 0);
  objc_storeStrong((id *)&self->_timePeriodStartTimeMinute, 0);
  objc_storeStrong((id *)&self->_timePeriodStartTimeHour, 0);
  objc_storeStrong((id *)&self->_scheduleEnabledSetting, 0);
  objc_storeStrong((id *)&self->_lastUpdatedTimestamp, 0);
}

+ (id)_recordWithEncodedInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"overrideStatus", objc_opt_class());
  uint64_t v8 = [v7 integerValue];
  uint64_t v9 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"overrideStatusLastCalculatedTime", objc_opt_class());
  uint64_t v10 = v9;
  if (v8 == 2 || v9 == 0)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  else
  {
    id v12 = v9;
  }
  int v13 = v12;
  int v14 = objc_msgSend(v6, "bs_safeObjectForKey:ofType:", @"overrides", objc_opt_class());
  int v15 = objc_msgSend(v14, "bs_firstObjectOfClass:", objc_opt_class());
  if (v15)
  {
    int v16 = objc_msgSend(MEMORY[0x1E4F28DC0], "dnds_secureLegacyUnarchiverForReadingFromData:error:", v15, a4);
    int v17 = [v16 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];

    if (v17)
    {
      char v18 = [a1 recordForLegacyBehaviorOverride:v17 lastUpdated:v13];
      goto LABEL_12;
    }
  }
  else
  {
    int v17 = 0;
  }
  char v18 = 0;
LABEL_12:

  return v18;
}

+ (id)recordForLegacyBehaviorOverride:(id)a3 lastUpdated:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(DNDSMutableScheduleSettingsRecord);
  uint64_t v8 = NSNumber;
  [v5 timeIntervalSinceReferenceDate];
  double v10 = v9;

  v11 = [v8 numberWithDouble:v10];
  [(DNDSMutableScheduleSettingsRecord *)v7 setLastUpdatedTimestamp:v11];

  if ([v6 mode] == 3) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  int v13 = [NSNumber numberWithUnsignedInteger:v12];
  [(DNDSMutableScheduleSettingsRecord *)v7 setScheduleEnabledSetting:v13];

  int v14 = [v6 effectiveIntervals];

  int v15 = [v14 firstObject];

  int v16 = [v15 startComponents];
  int v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "hour"));
  [(DNDSMutableScheduleSettingsRecord *)v7 setTimePeriodStartTimeHour:v17];

  char v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v16, "minute"));
  [(DNDSMutableScheduleSettingsRecord *)v7 setTimePeriodStartTimeMinute:v18];

  uint64_t v19 = [v15 endComponents];
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "hour"));
  [(DNDSMutableScheduleSettingsRecord *)v7 setTimePeriodEndTimeHour:v20];

  BOOL v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v19, "minute"));
  [(DNDSMutableScheduleSettingsRecord *)v7 setTimePeriodEndTimeMinute:v21];

  [(DNDSMutableScheduleSettingsRecord *)v7 setBedtimeBehaviorEnabledSetting:&unk_1F2A5D9B8];
  return v7;
}

- (id)legacyBehaviorOverride
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  uint64_t v4 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeHour];
  objc_msgSend(v3, "setHour:", objc_msgSend(v4, "unsignedIntegerValue"));

  id v5 = [(DNDSScheduleSettingsRecord *)self timePeriodStartTimeMinute];
  objc_msgSend(v3, "setMinute:", objc_msgSend(v5, "unsignedIntegerValue"));

  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v7 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeHour];
  objc_msgSend(v6, "setHour:", objc_msgSend(v7, "unsignedIntegerValue"));

  uint64_t v8 = [(DNDSScheduleSettingsRecord *)self timePeriodEndTimeMinute];
  objc_msgSend(v6, "setMinute:", objc_msgSend(v8, "unsignedIntegerValue"));

  double v9 = [DNDSLegacyBehaviorOverrideEffectiveInterval alloc];
  uint64_t v10 = *MEMORY[0x1E4F1C318];
  v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [(DNDSLegacyBehaviorOverrideEffectiveInterval *)v9 initWithStartComponents:v3 endComponents:v6 calendarIdentifier:v10 repeatInterval:16 identifier:v11];

  int v13 = [(DNDSScheduleSettingsRecord *)self scheduleEnabledSetting];
  [v13 unsignedIntegerValue];
  uint64_t v14 = DNDResolvedScheduleEnabledSetting();

  if (v14 == 2) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  int v16 = [DNDSLegacyBehaviorOverride alloc];
  v20[0] = v12;
  int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  char v18 = [(DNDSLegacyBehaviorOverride *)v16 initWithOverrideType:1 mode:v15 effectiveIntervals:v17];

  return v18;
}

@end