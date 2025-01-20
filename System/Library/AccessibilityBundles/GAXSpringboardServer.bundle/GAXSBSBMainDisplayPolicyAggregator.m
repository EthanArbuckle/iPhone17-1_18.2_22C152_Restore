@interface GAXSBSBMainDisplayPolicyAggregator
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_guidedAccessShouldBlockCapability:(int64_t)a3 explanation:(id *)a4;
- (BOOL)allowsCapability:(int64_t)a3;
- (BOOL)allowsCapability:(int64_t)a3 explanation:(id *)a4;
@end

@implementation GAXSBSBMainDisplayPolicyAggregator

+ (id)safeCategoryTargetClassName
{
  return @"SBMainDisplayPolicyAggregator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayPolicyAggregator", @"allowsCapability:", "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBMainDisplayPolicyAggregator", @"allowsCapability:explanation:", "B", "q", "^@", 0);
}

- (BOOL)_guidedAccessShouldBlockCapability:(int64_t)a3 explanation:(id *)a4
{
  v6 = +[GAXSpringboard sharedInstance];
  unsigned int v7 = [v6 isActive];
  unsigned __int8 v8 = [v6 isInWorkspace];
  unsigned __int8 v9 = [v6 wantsSingleAppModeOrAppSelfLockMode];
  if (v7 & 1) != 0 || (v9)
  {
    BOOL v11 = 0;
    if ((unint64_t)a3 > 0x19 || ((1 << a3) & 0x2EFD928) == 0) {
      goto LABEL_18;
    }
  }
  else
  {
    if (a3 == 5) {
      unsigned __int8 v10 = v8;
    }
    else {
      unsigned __int8 v10 = 0;
    }
    if ((v10 & 1) == 0)
    {
      BOOL v11 = 0;
      goto LABEL_18;
    }
  }
  if (a4)
  {
    if (((a3 == 5) & v8) != 0) {
      v12 = @"Guided Access is in workspace";
    }
    else {
      v12 = @"Guided Access wants single app mode";
    }
    if (v7) {
      v12 = @"Guided Access is active";
    }
    *a4 = v12;
  }
  BOOL v11 = 1;
LABEL_18:

  return v11;
}

- (BOOL)allowsCapability:(int64_t)a3
{
  if ([(GAXSBSBMainDisplayPolicyAggregator *)self _guidedAccessShouldBlockCapability:a3 explanation:0])
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)GAXSBSBMainDisplayPolicyAggregator;
  return [(GAXSBSBMainDisplayPolicyAggregator *)&v6 allowsCapability:a3];
}

- (BOOL)allowsCapability:(int64_t)a3 explanation:(id *)a4
{
  if (-[GAXSBSBMainDisplayPolicyAggregator _guidedAccessShouldBlockCapability:explanation:](self, "_guidedAccessShouldBlockCapability:explanation:"))
  {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)GAXSBSBMainDisplayPolicyAggregator;
  return [(GAXSBSBMainDisplayPolicyAggregator *)&v8 allowsCapability:a3 explanation:a4];
}

@end