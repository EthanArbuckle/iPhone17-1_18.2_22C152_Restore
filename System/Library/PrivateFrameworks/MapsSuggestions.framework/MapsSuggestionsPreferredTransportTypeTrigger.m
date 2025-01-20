@interface MapsSuggestionsPreferredTransportTypeTrigger
- (MapsSuggestionsPreferredTransportTypeTrigger)init;
- (void)didAddFirstObserver;
- (void)didRemoveLastObserver;
@end

@implementation MapsSuggestionsPreferredTransportTypeTrigger

- (MapsSuggestionsPreferredTransportTypeTrigger)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsPreferredTransportTypeTrigger;
  return [(MapsSuggestionsBaseTrigger *)&v3 initWithName:@"MapsSuggestionsPreferredTransportTypeTrigger"];
}

- (void)didAddFirstObserver
{
  objc_initWeak(&location, self);
  objc_super v3 = [(MapsSuggestionsBaseTrigger *)self dispatchQueue];
  objc_copyWeak(&v6, &location);
  v4 = _GEOConfigAddBlockListenerForKey();
  id transportTypeChangedListener = self->_transportTypeChangedListener;
  self->_id transportTypeChangedListener = v4;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __67__MapsSuggestionsPreferredTransportTypeTrigger_didAddFirstObserver__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained triggerMyObservers];
  }
  else
  {
    GEOFindOrCreateLog();
    objc_super v3 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136446722;
      v5 = "MapsSuggestionsPreferredTransportTypeTrigger.m";
      __int16 v6 = 1026;
      int v7 = 37;
      __int16 v8 = 2082;
      v9 = "-[MapsSuggestionsPreferredTransportTypeTrigger didAddFirstObserver]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)didRemoveLastObserver
{
}

- (void).cxx_destruct
{
}

@end