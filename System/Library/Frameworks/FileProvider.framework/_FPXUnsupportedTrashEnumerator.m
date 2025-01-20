@interface _FPXUnsupportedTrashEnumerator
- (void)currentSyncAnchorWithCompletionHandler:(id)a3;
- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
@end

@implementation _FPXUnsupportedTrashEnumerator

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  id v6 = [v4 data];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = a3;
  id v6 = [v4 data];
  [v5 finishEnumeratingChangesUpToSyncAnchor:v6 moreComing:0];
}

@end