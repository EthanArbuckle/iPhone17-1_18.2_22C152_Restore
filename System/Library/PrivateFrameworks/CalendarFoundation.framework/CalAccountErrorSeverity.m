@interface CalAccountErrorSeverity
+ (unint64_t)severityForError:(unint64_t)a3;
@end

@implementation CalAccountErrorSeverity

+ (unint64_t)severityForError:(unint64_t)a3
{
  if (a3 < 9) {
    return qword_190DEF080[a3];
  }
  v5 = +[CalFoundationLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[CalAccountErrorSeverity severityForError:](a3, v5);
  }

  return 0;
}

+ (void)severityForError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Can't determine severity of unknown error: %lu", (uint8_t *)&v2, 0xCu);
}

@end