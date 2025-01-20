@interface HearingTestSessionManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axResumeSession;
- (void)_axStartSession;
- (void)resume;
- (void)startTest;
@end

@implementation HearingTestSessionManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HearingTestUI.SessionManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.SessionManager", @"startTest", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HearingTestUI.SessionManager", @"resume", "v", 0);
}

- (void)_axStartSession
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test session: real startTest", v2, v3, v4, v5, v6);
}

- (void)_axResumeSession
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test session: real resume", v2, v3, v4, v5, v6);
}

- (void)startTest
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test session: call startTest", v2, v3, v4, v5, v6);
}

- (void)resume
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2421AF000, v0, v1, "Test session: call resume", v2, v3, v4, v5, v6);
}

@end