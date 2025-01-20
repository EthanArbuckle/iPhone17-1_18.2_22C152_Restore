@interface CPLSimpleRecordTargetMapping
- (BOOL)hasUnknownTargets;
- (BOOL)hasUpdatedTargets;
- (id)targetForRecordWithScopedIdentifier:(id)a3;
- (id)updatedTargetScopedIdentifiers;
- (id)updatedTargets;
- (void)setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4;
@end

@implementation CPLSimpleRecordTargetMapping

- (id)updatedTargetScopedIdentifiers
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v2;
}

- (id)updatedTargets
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)hasUpdatedTargets
{
  return 0;
}

- (BOOL)hasUnknownTargets
{
  return 0;
}

- (id)targetForRecordWithScopedIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [[CPLRecordTarget alloc] initWithScopedIdentifier:v3 otherScopedIdentifier:0 targetState:1];

  return v4;
}

- (void)setTarget:(id)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  unint64_t v8 = [v14 targetState];
  if (v8 <= 3 && v8 != 1)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v11 = id v10 = v7;
    v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordTarget.m"];
    v13 = +[CPLRecordTarget descriptionForTargetState:](CPLRecordTarget, "descriptionForTargetState:", [v14 targetState]);
    [v11 handleFailureInMethod:a2, self, v12, 279, @"Trying to set target of %@ to %@ in %@", v10, v13, objc_opt_class() object file lineNumber description];

    abort();
  }
}

@end