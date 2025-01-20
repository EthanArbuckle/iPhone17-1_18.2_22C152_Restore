@interface MKThreadContext
+ (id)currentContext;
- (void)_CA_setDisableActions:(BOOL)a3;
@end

@implementation MKThreadContext

- (void)_CA_setDisableActions:(BOOL)a3
{
  int64_t CA_disableActionsCounter = self->_CA_disableActionsCounter;
  if (a3)
  {
    self->_int64_t CA_disableActionsCounter = CA_disableActionsCounter + 1;
    if (CA_disableActionsCounter) {
      return;
    }
LABEL_5:
    objc_msgSend(MEMORY[0x1E4F39CF8], "setDisableActions:");
    return;
  }
  int64_t v4 = CA_disableActionsCounter - 1;
  self->_int64_t CA_disableActionsCounter = v4;
  if (!v4) {
    goto LABEL_5;
  }
}

+ (id)currentContext
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];

  int64_t v4 = [v3 objectForKey:@"MKThreadContext"];
  if (!v4)
  {
    int64_t v4 = objc_alloc_init(MKThreadContext);
    [v3 setObject:v4 forKey:@"MKThreadContext"];
  }

  return v4;
}

@end