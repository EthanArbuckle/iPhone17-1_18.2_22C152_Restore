@interface FBKBugForm(FBKClientSideResolvers)
- (void)updateResolvableQuestions;
@end

@implementation FBKBugForm(FBKClientSideResolvers)

- (void)updateResolvableQuestions
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "- (void)updateResolvableQuestions commented out", v1, 2u);
}

@end