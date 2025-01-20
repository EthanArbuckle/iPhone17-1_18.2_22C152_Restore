@interface FBKBugForm(Survey)
@end

@implementation FBKBugForm(Survey)

- (void)canTakeForTeam:()Survey .cold.1(uint8_t *a1, void *a2, _DWORD *a3, NSObject *a4)
{
  v7 = [a2 ID];
  int v8 = [v7 intValue];
  *(_DWORD *)a1 = 67109120;
  *a3 = v8;
  _os_log_error_impl(&dword_22A36D000, a4, OS_LOG_TYPE_ERROR, "feedback in feedback item not found, cannot determine canTake for survey [%i]", a1, 8u);
}

@end