@interface MapsSuggestionsTriggeringToggle
- (BOOL)state;
- (MapsSuggestionsTriggeringToggle)initWithName:(id)a3 startState:(BOOL)a4;
- (MapsSuggestionsTriggeringToggle)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5;
- (NSString)description;
- (id)objectForJSON;
- (unint64_t)timesUpdated;
- (void)setState:(BOOL)a3;
@end

@implementation MapsSuggestionsTriggeringToggle

uint64_t __47__MapsSuggestionsTriggeringToggle_timesUpdated__block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 48);
}

uint64_t __40__MapsSuggestionsTriggeringToggle_state__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
}

- (id)objectForJSON
{
  v2 = (MSg *)[(MapsSuggestionsTriggeringToggle *)self isTrue];
  return MSg::jsonFor(v2);
}

- (unint64_t)timesUpdated
{
  v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__MapsSuggestionsTriggeringToggle_timesUpdated__block_invoke;
  v10[3] = &unk_1E5CBA258;
  v10[4] = self;
  v4 = v10;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v12 = ___ZN3MSg26dispatch_sync_if_differentImEET_PU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFS1_vE_block_invoke;
  v13 = &unk_1E5CB7EC8;
  v15 = &v16;
  v5 = v4;
  id v14 = v5;
  label = dispatch_queue_get_label(v3);
  if (label == dispatch_queue_get_label(0))
  {
    v7 = (void *)MEMORY[0x1AD0C8E80]();
    v12((uint64_t)block);
  }
  else
  {
    dispatch_sync(v3, block);
  }
  unint64_t v8 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (BOOL)state
{
  v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__MapsSuggestionsTriggeringToggle_state__block_invoke;
  v10[3] = &unk_1E5CB89A8;
  v10[4] = self;
  v4 = v10;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v12 = ___ZN3MSg26dispatch_sync_if_differentIbEET_PU28objcproto17OS_dispatch_queue8NSObjectU13block_pointerFS1_vE_block_invoke;
  v13 = &unk_1E5CB7EC8;
  v15 = &v16;
  v5 = v4;
  id v14 = v5;
  label = dispatch_queue_get_label(v3);
  if (label == dispatch_queue_get_label(0))
  {
    v7 = (void *)MEMORY[0x1AD0C8E80]();
    v12((uint64_t)block);
  }
  else
  {
    dispatch_sync(v3, block);
  }
  char v8 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (MapsSuggestionsTriggeringToggle)initWithName:(id)a3 startState:(BOOL)a4 behavior:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MapsSuggestionsTriggeringToggle;
  result = [(MapsSuggestionsBaseTrigger *)&v8 initWithName:a3];
  if (result)
  {
    result->_behavior = a5;
    result->_state = a4;
  }
  return result;
}

- (MapsSuggestionsTriggeringToggle)initWithName:(id)a3 startState:(BOOL)a4
{
  return [(MapsSuggestionsTriggeringToggle *)self initWithName:a3 startState:a4 behavior:3];
}

- (void)setState:(BOOL)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v5 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v10 = __44__MapsSuggestionsTriggeringToggle_setState___block_invoke;
  v11 = &unk_1E5CBA4C0;
  v12 = self;
  v13 = &v15;
  BOOL v14 = a3;
  label = dispatch_queue_get_label(v5);
  if (label == dispatch_queue_get_label(0))
  {
    v7 = (void *)MEMORY[0x1AD0C8E80]();
    v10((uint64_t)block);
  }
  else
  {
    dispatch_sync(v5, block);
  }

  unint64_t behavior = self->_behavior;
  if ((!*((unsigned char *)v16 + 24) || (behavior & 4) != 0) && ((behavior & 1) != 0 && a3 || (behavior & 2) != 0 && !a3)) {
    [(MapsSuggestionsBaseTrigger *)self triggerMyObservers];
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __44__MapsSuggestionsTriggeringToggle_setState___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 32) + 40) == *(unsigned __int8 *)(result + 48);
  *(unsigned char *)(*(void *)(result + 32) + 40) = *(unsigned char *)(result + 48);
  ++*(void *)(*(void *)(result + 32) + 48);
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = [(MapsSuggestionsBaseTrigger *)self uniqueName];
  BOOL v5 = [(MapsSuggestionsTriggeringToggle *)self state];
  unint64_t v6 = [(MapsSuggestionsTriggeringToggle *)self timesUpdated];
  v7 = "NO";
  if (v5) {
    v7 = "YES";
  }
  objc_super v8 = (void *)[v3 initWithFormat:@"%@ state=%s (%u updates)", v4, v7, v6];

  return (NSString *)v8;
}

@end