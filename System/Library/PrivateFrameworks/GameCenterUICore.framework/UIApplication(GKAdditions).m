@interface UIApplication(GKAdditions)
- (BOOL)_gkSendAction:()GKAdditions viaResponder:withObject:;
- (id)_gkTargetForAction:()GKAdditions viaResponder:;
@end

@implementation UIApplication(GKAdditions)

- (id)_gkTargetForAction:()GKAdditions viaResponder:
{
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    do
    {
      if ([v7 canPerformAction:a3 withSender:v6]) {
        break;
      }
      uint64_t v8 = [v7 nextResponder];

      v7 = (void *)v8;
    }
    while (v8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_gkSendAction:()GKAdditions viaResponder:withObject:
{
  id v8 = a4;
  id v9 = a5;
  v10 = [a1 _gkTargetForAction:a3 viaResponder:v8];
  v11 = v10;
  if (v10)
  {
    if (v9) {
      id v12 = v9;
    }
    else {
      id v12 = v8;
    }
    [v10 _gkPerformSelector:a3 withObject:v12];
  }

  return v11 != 0;
}

@end