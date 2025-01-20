@interface EKCalendar(Saving)
- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving error:;
- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving error:;
@end

@implementation EKCalendar(Saving)

- (uint64_t)CUIKEditingContext_saveWithSpan:()Saving error:
{
  v6 = [a1 eventStore];
  uint64_t v7 = [v6 saveCalendar:a1 commit:0 error:a4];

  if ((v7 & 1) == 0)
  {
    v8 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[EKCalendar(Saving) CUIKEditingContext_saveWithSpan:error:]();
    }
  }
  return v7;
}

- (uint64_t)CUIKEditingContext_removeWithSpan:()Saving error:
{
  v6 = [a1 eventStore];
  uint64_t v7 = [v6 removeCalendar:a1 commit:0 error:a4];

  if ((v7 & 1) == 0)
  {
    v8 = +[CUIKLogSubsystem editingContext];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[EKCalendar(Saving) CUIKEditingContext_removeWithSpan:error:]();
    }
  }
  return v7;
}

- (void)CUIKEditingContext_saveWithSpan:()Saving error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_1BDF08000, v0, v1, "Calendar %@ failed to save with error %@");
}

- (void)CUIKEditingContext_removeWithSpan:()Saving error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_1BDF08000, v0, v1, "Calendar %@ failed to remove with error %@");
}

@end