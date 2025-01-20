@interface _DKSync2Coordinator(APSConnectionDelegate)
@end

@implementation _DKSync2Coordinator(APSConnectionDelegate)

- (void)connection:()APSConnectionDelegate didReceivePublicToken:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Did receive public token: %@", v3, v4, v5, v6, v7);
}

- (void)connection:()APSConnectionDelegate didReceiveIncomingMessage:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10() topic];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v2, v3, "%{public}@: Did receive message for topic: %@", v4, v5, v6, v7, v8);
}

@end