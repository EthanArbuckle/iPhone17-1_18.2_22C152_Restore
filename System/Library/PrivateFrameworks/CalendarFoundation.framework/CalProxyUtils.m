@interface CalProxyUtils
+ (id)copyReplyBlockFromInvocation:(id)a3;
+ (int64_t)replyBlockArgumentIndex:(id)a3;
+ (void)callReplyHandler:(id)a3 ofInvocation:(id)a4 withErrorCode:(int64_t)a5;
@end

@implementation CalProxyUtils

+ (int64_t)replyBlockArgumentIndex:(id)a3
{
  v3 = [a3 methodSignature];
  unint64_t v4 = [v3 numberOfArguments];
  if (v4 < 3
    || (int64_t v5 = v4 - 1,
        strcmp("@?", (const char *)[v3 getArgumentTypeAtIndex:v4 - 1])))
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

+ (id)copyReplyBlockFromInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 replyBlockArgumentIndex:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    id v8 = 0;
    [v4 getArgument:&v8 atIndex:v5];
    v6 = (void *)[v8 copy];
  }

  return v6;
}

+ (void)callReplyHandler:(id)a3 ofInvocation:(id)a4 withErrorCode:(int64_t)a5
{
  int v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = _Block_signature(v7);
    if (v9 && (v10 = v9, *v9))
    {
      v11 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:v9];
      unint64_t v12 = [v11 numberOfArguments];
      if (v12 >= 2)
      {
        unint64_t v13 = v12;
        v11 = v11;
        v14 = (const char *)[v11 getArgumentTypeAtIndex:1];
        v15 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v11];
        if (!strcmp("i", v14))
        {
          HIDWORD(v19) = v5;
          [v15 setArgument:(char *)&v19 + 4 atIndex:1];
        }
        else
        {
          v16 = +[CalFoundationLogSubsystem defaultCategory];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            +[CalProxyUtils callReplyHandler:ofInvocation:withErrorCode:]((uint64_t)v14, v16);
          }
        }
        if (v13 >= 3)
        {
          for (uint64_t i = 2; i != v13; ++i)
          {
            v18 = (char *)&v19 - (([v11 frameLength] + 15) & 0xFFFFFFFFFFFFFFF0);
            bzero(v18, [v11 frameLength]);
            [v15 setArgument:v18 atIndex:i];
          }
        }
        [v15 setTarget:v7];
        [v15 invoke];
      }
    }
    else
    {
      v11 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[CalProxyUtils callReplyHandler:ofInvocation:withErrorCode:](v8, v11);
      }
    }
  }
}

+ (void)callReplyHandler:(void *)a1 ofInvocation:(NSObject *)a2 withErrorCode:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 debugDescription];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "_Block_signature() failed for the block argument of invocation %@.", (uint8_t *)&v4, 0xCu);
}

+ (void)callReplyHandler:(uint64_t)a1 ofInvocation:(NSObject *)a2 withErrorCode:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "The first argument of the reply block is of type %s, which is not an int. Ignoring!", (uint8_t *)&v2, 0xCu);
}

@end