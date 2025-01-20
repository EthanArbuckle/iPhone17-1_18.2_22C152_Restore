@interface EKEvent(EKEvent_Shared)
- (void)_couldBeJunkCommon;
@end

@implementation EKEvent(EKEvent_Shared)

- (void)setIsJunk:()EKEvent_Shared shouldSave:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = @"junk";
  if ((a1 & 1) == 0) {
    v3 = @"not junk";
  }
  int v4 = 138412546;
  v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Error saving event for reporting as %@. Error = %@", (uint8_t *)&v4, 0x16u);
}

- (void)_couldBeJunkCommon
{
}

@end