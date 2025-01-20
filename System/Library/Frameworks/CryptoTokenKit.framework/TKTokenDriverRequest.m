@interface TKTokenDriverRequest
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation TKTokenDriverRequest

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"TKToken.m" lineNumber:270 description:@"Unexpected TKTokenDriverRequest context type"];
  }
  id v6 = v5;
  [v6 setup];
  v7 = TK_LOG_token();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[TKTokenDriverRequest beginRequestWithExtensionContext:](v6);
  }
}

- (void)beginRequestWithExtensionContext:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 driver];
  v2 = [v1 classID];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_1BED55000, v3, v4, "%{public}@: new beginRequest for token driver", v5, v6, v7, v8, v9);
}

@end