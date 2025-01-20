@interface _BRCTransferInfo
- (BRCProgress)progress;
- (NSMutableDictionary)childProgresses;
- (NSMutableDictionary)previousUnitCounts;
- (NSMutableDictionary)versionSizes;
- (_BRCTransferInfo)init;
- (id)description;
- (int64_t)sumOfCompletedUnitCountDelta;
- (int64_t)sumOfTotalUnitCountDelta;
- (void)copyProgressInfoToProgress:(id)a3 options:(char)a4;
- (void)setSumOfCompletedUnitCountDelta:(int64_t)a3;
- (void)setSumOfTotalUnitCountDelta:(int64_t)a3;
- (void)updateLocalizedDescriptionWithOptions:(char)a3;
- (void)updateUnitCount;
- (void)verifyFutureProgressIsNotFinished;
@end

@implementation _BRCTransferInfo

- (_BRCTransferInfo)init
{
  v14.receiver = self;
  v14.super_class = (Class)_BRCTransferInfo;
  v2 = [(_BRCTransferInfo *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(BRCProgress);
    progress = v2->_progress;
    v2->_progress = v3;

    v5 = v2->_progress;
    v6 = [MEMORY[0x1E4F594C0] mobileDocumentsURL];
    [(BRCProgress *)v5 setUserInfoObject:v6 forKey:*MEMORY[0x1E4F28890]];

    [(BRCProgress *)v2->_progress setUserInfoObject:&unk_1F2B26F40 forKey:*MEMORY[0x1E4F28888]];
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    versionSizes = v2->_versionSizes;
    v2->_versionSizes = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    childProgresses = v2->_childProgresses;
    v2->_childProgresses = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    previousUnitCounts = v2->_previousUnitCounts;
    v2->_previousUnitCounts = v11;
  }
  return v2;
}

- (id)description
{
  v4 = [(_BRCTransferInfo *)self progress];

  v5 = (void *)0x1E4F29000;
  if (v4)
  {
    v6 = NSString;
    v7 = [(_BRCTransferInfo *)self progress];
    v8 = [v7 localizedDescription];
    v9 = [(_BRCTransferInfo *)self progress];
    v10 = [v9 localizedAdditionalDescription];
    uint64_t v11 = [v10 length];
    if (v11)
    {
      v12 = NSString;
      v5 = [(_BRCTransferInfo *)self progress];
      v2 = [v5 localizedAdditionalDescription];
      v13 = [v12 stringWithFormat:@" (%@)", v2];
    }
    else
    {
      v13 = &stru_1F2AC7720;
    }
    uint64_t v14 = [v6 stringWithFormat:@" d:'%@%@'", v8, v13];
    if (v11)
    {
    }
    v26 = (__CFString *)v14;
  }
  else
  {
    v26 = &stru_1F2AC7720;
  }
  v28 = NSString;
  uint64_t v27 = objc_opt_class();
  v30 = [(_BRCTransferInfo *)self progress];
  v29 = [v30 userInfo];
  v15 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F28888]];
  v16 = [(_BRCTransferInfo *)self progress];
  uint64_t v17 = [v16 completedUnitCount];
  int64_t v18 = [(_BRCTransferInfo *)self sumOfCompletedUnitCountDelta];
  v19 = [(_BRCTransferInfo *)self progress];
  uint64_t v20 = [v19 totalUnitCount];
  int64_t v21 = [(_BRCTransferInfo *)self sumOfTotalUnitCountDelta];
  v22 = [(_BRCTransferInfo *)self progress];
  [v22 fractionCompleted];
  v24 = [v28 stringWithFormat:@"<%@:%p c:%@ p:%lld(%+lld)/%lld(%+lld) [%.3f%%]%@>", v27, self, v15, v17, v18, v20, v21, v23 * 100.0, v26];

  return v24;
}

- (void)updateUnitCount
{
  OUTLINED_FUNCTION_8();
  v3 = v2;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [v2 sumOfCompletedUnitCountDelta];
  v5 = [v3 progress];
  int v6 = 134218498;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = [v5 completedUnitCount];
  __int16 v10 = 2112;
  uint64_t v11 = v1;
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[NOTIF] sumOfCompletedUnitCountDelta = %lld, progress.completedUnitCount = %lld%@", (uint8_t *)&v6, 0x20u);
}

- (void)copyProgressInfoToProgress:(id)a3 options:(char)a4
{
  progress = self->_progress;
  id v6 = a3;
  objc_msgSend(v6, "setCompletedUnitCount:", -[BRCProgress completedUnitCount](progress, "completedUnitCount"));
  objc_msgSend(v6, "setTotalUnitCount:", -[BRCProgress totalUnitCount](self->_progress, "totalUnitCount"));
  id v9 = [(BRCProgress *)self->_progress userInfo];
  uint64_t v7 = *MEMORY[0x1E4F28888];
  __int16 v8 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28888]];
  [v6 setUserInfoObject:v8 forKey:v7];
}

- (void)verifyFutureProgressIsNotFinished
{
  LODWORD(v4) = 134218242;
  *(void *)((char *)&v4 + 4) = a2;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v2, v3, "[CRIT] UNREACHABLE: future progress state isn't valid (unitCount: %lld)%@", (void)v4, DWORD2(v4));
}

- (BRCProgress)progress
{
  return self->_progress;
}

- (int64_t)sumOfCompletedUnitCountDelta
{
  return self->sumOfCompletedUnitCountDelta;
}

- (void)setSumOfCompletedUnitCountDelta:(int64_t)a3
{
  self->sumOfCompletedUnitCountDelta = a3;
}

- (int64_t)sumOfTotalUnitCountDelta
{
  return self->sumOfTotalUnitCountDelta;
}

- (void)setSumOfTotalUnitCountDelta:(int64_t)a3
{
  self->sumOfTotalUnitCountDelta = a3;
}

- (NSMutableDictionary)versionSizes
{
  return self->_versionSizes;
}

- (NSMutableDictionary)childProgresses
{
  return self->_childProgresses;
}

- (NSMutableDictionary)previousUnitCounts
{
  return self->_previousUnitCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousUnitCounts, 0);
  objc_storeStrong((id *)&self->_childProgresses, 0);
  objc_storeStrong((id *)&self->_versionSizes, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

- (void)updateLocalizedDescriptionWithOptions:(char)a3
{
  uint64_t v5 = objc_opt_class();
  MEMORY[0x1F40E7228](self, a2, v5);
}

@end