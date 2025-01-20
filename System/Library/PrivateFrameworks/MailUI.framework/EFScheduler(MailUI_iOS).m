@interface EFScheduler(MailUI_iOS)
+ (void)mf_afterUIDelay:()MailUI_iOS performBlock:;
@end

@implementation EFScheduler(MailUI_iOS)

+ (void)mf_afterUIDelay:()MailUI_iOS performBlock:
{
  id v9 = a4;
  UIAnimationDragCoefficient();
  double v6 = v5 * a1;
  v7 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  id v8 = (id)[v7 afterDelay:v9 performBlock:v6];
}

@end