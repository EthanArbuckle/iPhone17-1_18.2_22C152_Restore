@interface NSArray(ScopedIDs)
- (void)_gkUpdateInternalPlayersScopedIDs:()ScopedIDs;
@end

@implementation NSArray(ScopedIDs)

- (void)_gkUpdateInternalPlayersScopedIDs:()ScopedIDs
{
  v4 = a3;
  v5 = [a1 _gkMapWithBlock:&__block_literal_global_355];
  if ([v5 count])
  {
    v6 = [v5 _gkPlayersIDsFromInternals];
    v7 = +[GKPlayer gameBundleID];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__NSArray_ScopedIDs___gkUpdateInternalPlayersScopedIDs___block_invoke_2;
    v8[3] = &unk_1E646FF40;
    id v9 = v5;
    v10 = v4;
    +[GKPlayer loadScopedIDsForPlayerIDs:v6 gameBundleID:v7 handler:v8];
  }
  else
  {
    v4[2](v4);
  }
}

@end