@interface SGObjCRuntime
+ (unint64_t)_arityForBlockAtIndex:(unint64_t)a3 inSelector:(SEL)a4 instanceMethod:(BOOL)a5 ofProtocol:(id)a6 seenProtocols:(id)a7 foundSelector:(BOOL *)a8;
+ (unint64_t)arityForBlockAtIndex:(unint64_t)a3 inSelector:(SEL)a4 instanceMethod:(BOOL)a5 ofProtocol:(id)a6;
@end

@implementation SGObjCRuntime

+ (unint64_t)_arityForBlockAtIndex:(unint64_t)a3 inSelector:(SEL)a4 instanceMethod:(BOOL)a5 ofProtocol:(id)a6 seenProtocols:(id)a7 foundSelector:(BOOL *)a8
{
  BOOL v10 = a5;
  v13 = (Protocol *)a6;
  id v14 = a7;
  v15 = (void *)MEMORY[0x1A6265250]();
  uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding();
  if (MethodTypeEncoding || (uint64_t MethodTypeEncoding = _protocol_getMethodTypeEncoding()) != 0)
  {
    *a8 = 1;
    v17 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodTypeEncoding];
    v18 = [v17 _signatureForBlockAtArgumentIndex:a3];
    v19 = v18;
    if (v18) {
      unint64_t v20 = [v18 numberOfArguments];
    }
    else {
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unsigned int outCount = 0;
    v22 = protocol_copyProtocolList(v13, &outCount);
    v25 = v15;
    if (outCount)
    {
      uint64_t v23 = 0;
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        v24 = [NSString stringWithUTF8String:protocol_getName(v22[v23])];
        if (([v14 containsObject:v24] & 1) == 0)
        {
          [v14 addObject:v24];
          unint64_t v20 = [a1 _arityForBlockAtIndex:a3 inSelector:a4 instanceMethod:v10 ofProtocol:v22[v23] seenProtocols:v14 foundSelector:a8];
          if (*a8) {
            break;
          }
        }

        if (++v23 >= (unint64_t)outCount) {
          goto LABEL_16;
        }
      }
    }
    else
    {
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_16:
    free(v22);
    v15 = v25;
  }

  return v20;
}

+ (unint64_t)arityForBlockAtIndex:(unint64_t)a3 inSelector:(SEL)a4 instanceMethod:(BOOL)a5 ofProtocol:(id)a6
{
  BOOL v6 = a5;
  char v14 = 0;
  id v10 = a6;
  v11 = objc_opt_new();
  unint64_t v12 = [a1 _arityForBlockAtIndex:a3 inSelector:a4 instanceMethod:v6 ofProtocol:v10 seenProtocols:v11 foundSelector:&v14];

  return v12;
}

@end