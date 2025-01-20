@interface IMCloudKitMockSyncState
- (BOOL)IMCloudKitIsEligibleForTruthZone;
- (BOOL)IMCloudKitIsInExitState;
- (BOOL)IMCloudKitIsRemovedFromBackup;
- (BOOL)IMCloudKitIsSyncing;
- (BOOL)IMCloudKitStartingDisableDevices;
- (BOOL)IMCloudKitStartingInitialSync;
- (BOOL)IMCloudKitStartingPeriodicSync;
- (BOOL)IMCloudKitSyncPaused;
- (BOOL)IMCloudKitSyncingEnabled;
- (NSArray)IMCloudKitSyncErrors;
- (NSDate)IMCloudKitFullPartialSyncCompletedDate;
- (NSDate)IMCloudKitFullSyncCompletedDate;
- (NSDate)IMCloudKitSyncDate;
- (id)convertToDictionary;
- (int64_t)IMCloudKitStartingEnabledSettingChange;
- (int64_t)IMCloudKitSyncControllerSyncRecordType;
- (int64_t)IMCloudKitSyncControllerSyncType;
- (unint64_t)IMCloudKitSyncControllerSyncState;
- (unint64_t)IMCloudKitSyncJobState;
- (unint64_t)IMCloudKitSyncStatus;
- (void)setIMCloudKitFullPartialSyncCompletedDate:(id)a3;
- (void)setIMCloudKitFullSyncCompletedDate:(id)a3;
- (void)setIMCloudKitIsEligibleForTruthZone:(BOOL)a3;
- (void)setIMCloudKitIsInExitState:(BOOL)a3;
- (void)setIMCloudKitIsRemovedFromBackup:(BOOL)a3;
- (void)setIMCloudKitIsSyncing:(BOOL)a3;
- (void)setIMCloudKitStartingDisableDevices:(BOOL)a3;
- (void)setIMCloudKitStartingEnabledSettingChange:(int64_t)a3;
- (void)setIMCloudKitStartingInitialSync:(BOOL)a3;
- (void)setIMCloudKitStartingPeriodicSync:(BOOL)a3;
- (void)setIMCloudKitSyncControllerSyncRecordType:(int64_t)a3;
- (void)setIMCloudKitSyncControllerSyncState:(unint64_t)a3;
- (void)setIMCloudKitSyncControllerSyncType:(int64_t)a3;
- (void)setIMCloudKitSyncDate:(id)a3;
- (void)setIMCloudKitSyncErrors:(id)a3;
- (void)setIMCloudKitSyncJobState:(unint64_t)a3;
- (void)setIMCloudKitSyncPaused:(BOOL)a3;
- (void)setIMCloudKitSyncStatus:(unint64_t)a3;
- (void)setIMCloudKitSyncingEnabled:(BOOL)a3;
@end

@implementation IMCloudKitMockSyncState

- (id)convertToDictionary
{
  v185[15] = *MEMORY[0x1E4F143B8];
  v184[0] = *MEMORY[0x1E4F6D170];
  v5 = NSNumber;
  uint64_t v6 = objc_msgSend_IMCloudKitSyncingEnabled(self, a2, v2, v3);
  v183 = objc_msgSend_numberWithBool_(v5, v7, v6, v8);
  v185[0] = v183;
  v184[1] = *MEMORY[0x1E4F6D030];
  v9 = NSNumber;
  uint64_t IsSyncing = objc_msgSend_IMCloudKitIsSyncing(self, v10, v11, v12);
  v182 = objc_msgSend_numberWithBool_(v9, v14, IsSyncing, v15);
  v185[1] = v182;
  v184[2] = *MEMORY[0x1E4F6D018];
  v16 = NSNumber;
  uint64_t IsEligibleForTruthZone = objc_msgSend_IMCloudKitIsEligibleForTruthZone(self, v17, v18, v19);
  v181 = objc_msgSend_numberWithBool_(v16, v21, IsEligibleForTruthZone, v22);
  v185[2] = v181;
  v184[3] = *MEMORY[0x1E4F6D020];
  v23 = NSNumber;
  uint64_t v27 = objc_msgSend_IMCloudKitIsInExitState(self, v24, v25, v26);
  v180 = objc_msgSend_numberWithBool_(v23, v28, v27, v29);
  v185[3] = v180;
  v184[4] = *MEMORY[0x1E4F6D028];
  v30 = NSNumber;
  uint64_t IsRemovedFromBackup = objc_msgSend_IMCloudKitIsRemovedFromBackup(self, v31, v32, v33);
  v179 = objc_msgSend_numberWithBool_(v30, v35, IsRemovedFromBackup, v36);
  v185[4] = v179;
  v184[5] = *MEMORY[0x1E4F6D100];
  v37 = NSNumber;
  uint64_t v41 = objc_msgSend_IMCloudKitStartingPeriodicSync(self, v38, v39, v40);
  v178 = objc_msgSend_numberWithBool_(v37, v42, v41, v43);
  v185[5] = v178;
  v184[6] = *MEMORY[0x1E4F6D0F8];
  v44 = NSNumber;
  uint64_t v48 = objc_msgSend_IMCloudKitStartingInitialSync(self, v45, v46, v47);
  v177 = objc_msgSend_numberWithBool_(v44, v49, v48, v50);
  v185[6] = v177;
  v184[7] = *MEMORY[0x1E4F6D0F0];
  v51 = NSNumber;
  uint64_t v55 = objc_msgSend_IMCloudKitStartingEnabledSettingChange(self, v52, v53, v54);
  v176 = objc_msgSend_numberWithInteger_(v51, v56, v55, v57);
  v185[7] = v176;
  v184[8] = *MEMORY[0x1E4F6D0E8];
  v58 = NSNumber;
  uint64_t v62 = objc_msgSend_IMCloudKitStartingDisableDevices(self, v59, v60, v61);
  v175 = objc_msgSend_numberWithBool_(v58, v63, v62, v64);
  v185[8] = v175;
  v184[9] = *MEMORY[0x1E4F6D120];
  v65 = NSNumber;
  uint64_t v69 = objc_msgSend_IMCloudKitSyncControllerSyncState(self, v66, v67, v68);
  v72 = objc_msgSend_numberWithUnsignedInteger_(v65, v70, v69, v71);
  v185[9] = v72;
  v184[10] = *MEMORY[0x1E4F6D128];
  v73 = NSNumber;
  uint64_t v77 = objc_msgSend_IMCloudKitSyncControllerSyncType(self, v74, v75, v76);
  v80 = objc_msgSend_numberWithInteger_(v73, v78, v77, v79);
  v185[10] = v80;
  v184[11] = *MEMORY[0x1E4F6D118];
  v81 = NSNumber;
  uint64_t v85 = objc_msgSend_IMCloudKitSyncControllerSyncRecordType(self, v82, v83, v84);
  v88 = objc_msgSend_numberWithInteger_(v81, v86, v85, v87);
  v185[11] = v88;
  v184[12] = *MEMORY[0x1E4F6D150];
  v89 = NSNumber;
  uint64_t v93 = objc_msgSend_IMCloudKitSyncPaused(self, v90, v91, v92);
  v96 = objc_msgSend_numberWithBool_(v89, v94, v93, v95);
  v185[12] = v96;
  v184[13] = *MEMORY[0x1E4F6D160];
  v97 = NSNumber;
  uint64_t v101 = objc_msgSend_IMCloudKitSyncStatus(self, v98, v99, v100);
  v104 = objc_msgSend_numberWithUnsignedInteger_(v97, v102, v101, v103);
  v185[13] = v104;
  v184[14] = *MEMORY[0x1E4F6D148];
  v105 = NSNumber;
  uint64_t v109 = objc_msgSend_IMCloudKitSyncJobState(self, v106, v107, v108);
  v112 = objc_msgSend_numberWithUnsignedInteger_(v105, v110, v109, v111);
  v185[14] = v112;
  v114 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v113, (uint64_t)v185, (uint64_t)v184, 15);
  v118 = objc_msgSend_mutableCopy(v114, v115, v116, v117);

  v122 = objc_msgSend_IMCloudKitSyncDate(self, v119, v120, v121);

  if (v122)
  {
    v126 = objc_msgSend_IMCloudKitSyncDate(self, v123, v124, v125);
    objc_msgSend_setObject_forKey_(v118, v127, (uint64_t)v126, *MEMORY[0x1E4F6D130]);
  }
  v128 = objc_msgSend_IMCloudKitFullSyncCompletedDate(self, v123, v124, v125);
  if (v128)
  {
  }
  else
  {
    v132 = objc_msgSend_IMCloudKitFullPartialSyncCompletedDate(self, v129, v130, v131);

    if (!v132) {
      goto LABEL_11;
    }
  }
  id v136 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v140 = objc_msgSend_IMCloudKitFullPartialSyncCompletedDate(self, v137, v138, v139);

  if (v140)
  {
    v144 = NSNumber;
    v145 = objc_msgSend_IMCloudKitFullPartialSyncCompletedDate(self, v141, v142, v143);
    objc_msgSend_timeIntervalSince1970(v145, v146, v147, v148);
    v152 = objc_msgSend_numberWithDouble_(v144, v149, v150, v151);

    objc_msgSend_setObject_forKey_(v136, v153, (uint64_t)v152, *MEMORY[0x1E4F6CFC0]);
  }
  v154 = objc_msgSend_IMCloudKitFullSyncCompletedDate(self, v141, v142, v143);

  if (v154)
  {
    v158 = NSNumber;
    v159 = objc_msgSend_IMCloudKitFullSyncCompletedDate(self, v155, v156, v157);
    objc_msgSend_timeIntervalSince1970(v159, v160, v161, v162);
    v166 = objc_msgSend_numberWithDouble_(v158, v163, v164, v165);

    objc_msgSend_setObject_forKey_(v136, v167, (uint64_t)v166, *MEMORY[0x1E4F6CFD8]);
  }
  objc_msgSend_setObject_forKey_(v118, v155, (uint64_t)v136, *MEMORY[0x1E4F6CE90]);

LABEL_11:
  v168 = objc_msgSend_IMCloudKitSyncErrors(self, v133, v134, v135);

  if (v168)
  {
    v172 = objc_msgSend_IMCloudKitSyncErrors(self, v169, v170, v171);
    objc_msgSend_setObject_forKey_(v118, v173, (uint64_t)v172, *MEMORY[0x1E4F6D140]);
  }

  return v118;
}

- (BOOL)IMCloudKitSyncingEnabled
{
  return self->_IMCloudKitSyncingEnabled;
}

- (void)setIMCloudKitSyncingEnabled:(BOOL)a3
{
  self->_IMCloudKitSyncingEnabled = a3;
}

- (BOOL)IMCloudKitIsSyncing
{
  return self->_IMCloudKitIsSyncing;
}

- (void)setIMCloudKitIsSyncing:(BOOL)a3
{
  self->_IMCloudKituint64_t IsSyncing = a3;
}

- (unint64_t)IMCloudKitSyncStatus
{
  return self->_IMCloudKitSyncStatus;
}

- (void)setIMCloudKitSyncStatus:(unint64_t)a3
{
  self->_IMCloudKitSyncStatus = a3;
}

- (unint64_t)IMCloudKitSyncJobState
{
  return self->_IMCloudKitSyncJobState;
}

- (void)setIMCloudKitSyncJobState:(unint64_t)a3
{
  self->_IMCloudKitSyncJobState = a3;
}

- (BOOL)IMCloudKitSyncPaused
{
  return self->_IMCloudKitSyncPaused;
}

- (void)setIMCloudKitSyncPaused:(BOOL)a3
{
  self->_IMCloudKitSyncPaused = a3;
}

- (BOOL)IMCloudKitIsEligibleForTruthZone
{
  return self->_IMCloudKitIsEligibleForTruthZone;
}

- (void)setIMCloudKitIsEligibleForTruthZone:(BOOL)a3
{
  self->_IMCloudKituint64_t IsEligibleForTruthZone = a3;
}

- (BOOL)IMCloudKitIsInExitState
{
  return self->_IMCloudKitIsInExitState;
}

- (void)setIMCloudKitIsInExitState:(BOOL)a3
{
  self->_IMCloudKitIsInExitState = a3;
}

- (BOOL)IMCloudKitIsRemovedFromBackup
{
  return self->_IMCloudKitIsRemovedFromBackup;
}

- (void)setIMCloudKitIsRemovedFromBackup:(BOOL)a3
{
  self->_IMCloudKituint64_t IsRemovedFromBackup = a3;
}

- (NSDate)IMCloudKitSyncDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIMCloudKitSyncDate:(id)a3
{
}

- (NSDate)IMCloudKitFullSyncCompletedDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIMCloudKitFullSyncCompletedDate:(id)a3
{
}

- (NSDate)IMCloudKitFullPartialSyncCompletedDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIMCloudKitFullPartialSyncCompletedDate:(id)a3
{
}

- (BOOL)IMCloudKitStartingPeriodicSync
{
  return self->_IMCloudKitStartingPeriodicSync;
}

- (void)setIMCloudKitStartingPeriodicSync:(BOOL)a3
{
  self->_IMCloudKitStartingPeriodicSync = a3;
}

- (BOOL)IMCloudKitStartingInitialSync
{
  return self->_IMCloudKitStartingInitialSync;
}

- (void)setIMCloudKitStartingInitialSync:(BOOL)a3
{
  self->_IMCloudKitStartingInitialSync = a3;
}

- (int64_t)IMCloudKitStartingEnabledSettingChange
{
  return self->_IMCloudKitStartingEnabledSettingChange;
}

- (void)setIMCloudKitStartingEnabledSettingChange:(int64_t)a3
{
  self->_IMCloudKitStartingEnabledSettingChange = a3;
}

- (BOOL)IMCloudKitStartingDisableDevices
{
  return self->_IMCloudKitStartingDisableDevices;
}

- (void)setIMCloudKitStartingDisableDevices:(BOOL)a3
{
  self->_IMCloudKitStartingDisableDevices = a3;
}

- (unint64_t)IMCloudKitSyncControllerSyncState
{
  return self->_IMCloudKitSyncControllerSyncState;
}

- (void)setIMCloudKitSyncControllerSyncState:(unint64_t)a3
{
  self->_IMCloudKitSyncControllerSyncState = a3;
}

- (int64_t)IMCloudKitSyncControllerSyncType
{
  return self->_IMCloudKitSyncControllerSyncType;
}

- (void)setIMCloudKitSyncControllerSyncType:(int64_t)a3
{
  self->_IMCloudKitSyncControllerSyncType = a3;
}

- (int64_t)IMCloudKitSyncControllerSyncRecordType
{
  return self->_IMCloudKitSyncControllerSyncRecordType;
}

- (void)setIMCloudKitSyncControllerSyncRecordType:(int64_t)a3
{
  self->_IMCloudKitSyncControllerSyncRecordType = a3;
}

- (NSArray)IMCloudKitSyncErrors
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIMCloudKitSyncErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_IMCloudKitSyncErrors, 0);
  objc_storeStrong((id *)&self->_IMCloudKitFullPartialSyncCompletedDate, 0);
  objc_storeStrong((id *)&self->_IMCloudKitFullSyncCompletedDate, 0);

  objc_storeStrong((id *)&self->_IMCloudKitSyncDate, 0);
}

@end