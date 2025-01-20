@interface _MPCQueueControllerBehaviorEmpty
+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4;
- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)isEmpty;
- (BOOL)itemExistsForContentItemID:(id)a3;
- (MPCQueueControllerBehaviorHost)host;
- (NSString)sessionID;
- (_MPCQueueControllerBehaviorEmpty)initWithSessionID:(id)a3;
- (id)_itemForContentItemID:(id)a3;
- (id)_stateDictionaryIncludingQueue:(BOOL)a3;
- (id)componentsForContentItemID:(id)a3;
- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5;
- (id)performLoadCommand:(id)a3 completion:(id)a4;
- (int64_t)playbackPositionRestorationPolicy;
@end

@implementation _MPCQueueControllerBehaviorEmpty

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MPCQueueControllerBehaviorHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (MPCQueueControllerBehaviorHost *)WeakRetained;
}

- (id)_itemForContentItemID:(id)a3
{
  return 0;
}

- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x263EFFA68], "objectEnumerator", a3, a4, a5);
}

- (BOOL)isEmpty
{
  return 1;
}

- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4
{
  if (a4) {
    *a4 = @"Empty Queue Behavior";
  }
  return 0;
}

- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4
{
  if (a4) {
    *a4 = @"Empty Queue Behavior";
  }
  return 0;
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  if (a4) {
    *a4 = @"Empty Queue Behavior";
  }
  return 0;
}

- (id)componentsForContentItemID:(id)a3
{
  return 0;
}

- (BOOL)itemExistsForContentItemID:(id)a3
{
  return 0;
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (NSString)sessionID
{
  return (NSString *)@"EMPTY";
}

- (int64_t)playbackPositionRestorationPolicy
{
  return 0;
}

- (_MPCQueueControllerBehaviorEmpty)initWithSessionID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MPCQueueControllerBehaviorEmpty;
  return [(_MPCQueueControllerBehaviorEmpty *)&v4 init];
}

- (id)performLoadCommand:(id)a3 completion:(id)a4
{
  return 0;
}

+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = isKindOfClass;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    *a4 = [NSString stringWithFormat:@"Cannot populate empty behavior with %@", v5];
  }

  return v7 & 1;
}

@end