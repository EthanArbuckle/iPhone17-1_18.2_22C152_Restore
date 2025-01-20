@interface DYFunctionStream
- (BOOL)resetToFunction:(const Function *)a3;
- (const)peekFunction;
- (const)readFunction;
- (unint64_t)readFunctions:(Function *)a3 maxCount:(unint64_t)a4;
- (void)clearResetMarker;
- (void)enumerateFunctionsUsingBlock:(id)a3;
- (void)reset;
- (void)setResetMarker;
@end

@implementation DYFunctionStream

- (void)reset
{
}

- (void)setResetMarker
{
}

- (void)clearResetMarker
{
}

- (BOOL)resetToFunction:(const Function *)a3
{
  return 0;
}

- (const)peekFunction
{
  return 0;
}

- (const)readFunction
{
  return 0;
}

- (unint64_t)readFunctions:(Function *)a3 maxCount:(unint64_t)a4
{
  return 0;
}

- (void)enumerateFunctionsUsingBlock:(id)a3
{
  char v6 = 0;
  do
  {
    v5 = [(DYFunctionStream *)self readFunction];
    if (!v5) {
      break;
    }
    (*((void (**)(id, const Function *, char *))a3 + 2))(a3, v5, &v6);
  }
  while (!v6);
}

@end