@interface NSLayoutConstraint(ClipUIServiceExtras)
+ (void)cps_if:()ClipUIServiceExtras thenActivate:elseActivate:;
+ (void)cps_if:()ClipUIServiceExtras thenActivateConstraints:elseActivateConstraints:;
- (void)cps_setPriority:()ClipUIServiceExtras;
@end

@implementation NSLayoutConstraint(ClipUIServiceExtras)

+ (void)cps_if:()ClipUIServiceExtras thenActivate:elseActivate:
{
  id v7 = a5;
  [a4 setActive:a3];
  [v7 setActive:a3 ^ 1];
}

+ (void)cps_if:()ClipUIServiceExtras thenActivateConstraints:elseActivateConstraints:
{
  id v9 = a5;
  id v10 = a4;
  id v13 = v10;
  if (a3) {
    v11 = a5;
  }
  else {
    v11 = a4;
  }
  if (a3) {
    id v12 = v10;
  }
  else {
    id v12 = v9;
  }
  [a1 deactivateConstraints:v11];
  [a1 activateConstraints:v12];
}

- (void)cps_setPriority:()ClipUIServiceExtras
{
  return a1;
}

@end