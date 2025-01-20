@interface NSString(CLFCommunicationLimit)
- (BOOL)isLessRestrictiveThanCommunicationLimit:()CLFCommunicationLimit;
@end

@implementation NSString(CLFCommunicationLimit)

- (BOOL)isLessRestrictiveThanCommunicationLimit:()CLFCommunicationLimit
{
  id v4 = a3;
  v5 = CLFSortedCommunicationLimits();
  unint64_t v6 = [v5 indexOfObject:a1];
  unint64_t v7 = [v5 indexOfObject:v4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = +[CLFLog commonLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      [(NSString(CLFCommunicationLimit) *)a1 isLessRestrictiveThanCommunicationLimit:v9];
    }

    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = v6 > v7;
  }

  return v8;
}

- (void)isLessRestrictiveThanCommunicationLimit:()CLFCommunicationLimit .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_217F54000, log, OS_LOG_TYPE_FAULT, "Invalid communication limit (self: %@, other: %@", (uint8_t *)&v3, 0x16u);
}

@end