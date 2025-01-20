@interface DOCAppProtectionManager(APSubjectMonitorConformance)
@end

@implementation DOCAppProtectionManager(APSubjectMonitorConformance)

- (void)appProtectionSubjectsChanged:()APSubjectMonitorConformance forSubscription:.cold.1(void *a1)
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_14() count];
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_8(&dword_213670000, v3, v4, "[PROTECTED APPS] %s subjects (%lu): %@ app monitor subscription: %@", v5, v6, v7, v8, 2u);
}

@end