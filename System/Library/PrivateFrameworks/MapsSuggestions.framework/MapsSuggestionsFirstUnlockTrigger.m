@interface MapsSuggestionsFirstUnlockTrigger
- (BOOL)isTrue;
- (MapsSuggestionsFirstUnlockTrigger)init;
- (MapsSuggestionsFirstUnlockTrigger)initWithFirstLock:(id)a3;
- (id)objectForJSON;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
- (void)triggerFired:(id)a3;
@end

@implementation MapsSuggestionsFirstUnlockTrigger

- (id)objectForJSON
{
  v2 = (MSg *)[(MapsSuggestionsFirstUnlockTrigger *)self isTrue];
  return MSg::jsonFor(v2);
}

- (BOOL)isTrue
{
  return [(MapsSuggestionsFirstUnlockProtocol *)self->_firstUnlock hasDeviceBeenUnlocked];
}

- (MapsSuggestionsFirstUnlockTrigger)init
{
  v3 = objc_alloc_init(MapsSuggestionsFirstUnlock);
  v4 = [(MapsSuggestionsFirstUnlockTrigger *)self initWithFirstLock:v3];

  return v4;
}

- (MapsSuggestionsFirstUnlockTrigger)initWithFirstLock:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsFirstUnlockTrigger;
  v6 = [(MapsSuggestionsBaseTrigger *)&v9 initWithName:@"MapsSuggestionsFirstUnlockTrigger"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_firstUnlock, a3);
  }

  return v7;
}

- (void)didAddFirstObserver
{
}

- (void)didRemoveLastObserver
{
}

- (void)triggerFired:(id)a3
{
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "Device First time Unlocked", v5, 2u);
  }

  [(MapsSuggestionsBaseTrigger *)self triggerMyObservers];
}

- (void).cxx_destruct
{
}

@end