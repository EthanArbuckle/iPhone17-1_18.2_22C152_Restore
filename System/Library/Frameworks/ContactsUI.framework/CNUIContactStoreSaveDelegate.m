@interface CNUIContactStoreSaveDelegate
- (BOOL)saveRequest:(id)a3 shouldProceedAfterError:(id)a4;
@end

@implementation CNUIContactStoreSaveDelegate

- (BOOL)saveRequest:(id)a3 shouldProceedAfterError:(id)a4
{
  id v4 = a4;
  if ([v4 code] == 1015)
  {
    v5 = [v4 domain];
    char v6 = [v5 isEqualToString:*MEMORY[0x1E4F1AFD8]];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end