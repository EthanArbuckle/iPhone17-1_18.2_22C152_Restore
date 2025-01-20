@interface GAXUIClientRotationContextOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (GAXUIClientRotationContextOverride)initWithClient:(id)a3 toOrientation:(int64_t)a4 duration:(double)a5 andWindow:(id)a6;
@end

@implementation GAXUIClientRotationContextOverride

+ (id)safeCategoryTargetClassName
{
  return @"UIClientRotationContext";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (GAXUIClientRotationContextOverride)initWithClient:(id)a3 toOrientation:(int64_t)a4 duration:(double)a5 andWindow:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)GAXUIClientRotationContextOverride;
  v6 = [(GAXUIClientRotationContextOverride *)&v10 initWithClient:a3 toOrientation:a4 duration:a6 andWindow:a5];
  if (v6)
  {
    v7 = +[GAXClient sharedInstance];
    unsigned int v8 = [v7 isInWorkspace];

    if (v8) {
      *((_DWORD *)[(GAXUIClientRotationContextOverride *)v6 safeIvarForKey:@"_rotationSettings"]+ 4) = 0;
    }
  }
  return v6;
}

@end