@interface VSLinkedOnOrAfterChecker
- (BOOL)shouldPerformBehavior:(int64_t)a3;
- (id)_minimumVersionsForBehavior:(int64_t)a3;
@end

@implementation VSLinkedOnOrAfterChecker

- (id)_minimumVersionsForBehavior:(int64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:2];
  v5 = v4;
  if ((unint64_t)a3 <= 2)
  {
    uint64_t v6 = (uint64_t)*(&off_1E6BD31C8 + a3);
    uint64_t v7 = (uint64_t)*(&off_1E6BD31E0 + a3);
    uint64_t v8 = (uint64_t)*(&off_1E6BD31F8 + a3);
    [v4 addPointer:v6];
    [v5 addPointer:v7];
    [v5 addPointer:v8];
  }

  return v5;
}

- (BOOL)shouldPerformBehavior:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = -[VSLinkedOnOrAfterChecker _minimumVersionsForBehavior:](self, "_minimumVersionsForBehavior:");
  if ([v4 count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      [v4 pointerAtIndex:v5];
      if (dyld_program_sdk_at_least()) {
        break;
      }
      if (++v5 >= (unint64_t)[v4 count]) {
        goto LABEL_5;
      }
    }
    uint64_t v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      int64_t v10 = a3;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Linked against SDK version that performs behavior %lu.", (uint8_t *)&v9, 0xCu);
    }
    BOOL v7 = 1;
  }
  else
  {
LABEL_5:
    uint64_t v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      int64_t v10 = a3;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Linked against SDK that pre-dates behavior %lu.", (uint8_t *)&v9, 0xCu);
    }
    BOOL v7 = 0;
  }

  return v7;
}

@end