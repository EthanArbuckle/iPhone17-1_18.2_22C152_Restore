@interface MapsSuggestionsGCDTimer
- (MapsSuggestionsGCDTimer)initWithName:(id)a3 queue:(id)a4 block:(id)a5;
- (MapsSuggestionsGCDTimer)initWithName:(id)a3 queue:(id)a4 timerReturningBlock:(id)a5;
- (NSString)uniqueName;
- (id).cxx_construct;
- (id)objectForJSON;
- (void)dealloc;
- (void)scheduleWithInterval:(Duration)a3 leeway:(Duration)a4;
- (void)scheduleWithInterval:(Duration)a3 repeatAfter:(Duration)a4 leeway:(Duration)a5;
- (void)scheduleWithTimeInterval:(double)a3 leeway:(double)a4;
- (void)scheduleWithTimeInterval:(double)a3 repeatAfter:(double)a4 leeway:(double)a5;
- (void)unschedule;
@end

@implementation MapsSuggestionsGCDTimer

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((void *)self + 8) = 0;
  return self;
}

- (NSString)uniqueName
{
  return self->_timer._name;
}

- (MapsSuggestionsGCDTimer)initWithName:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsGCDTimer;
  v11 = [(MapsSuggestionsBaseTrigger *)&v20 initWithName:@"MapsSuggestionsGCDTimer"];
  if (v11)
  {
    objc_initWeak(&location, v11);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__MapsSuggestionsGCDTimer_initWithName_queue_block___block_invoke;
    aBlock[3] = &unk_1E5CB84F0;
    objc_copyWeak(&v18, &location);
    id v17 = v10;
    v12 = _Block_copy(aBlock);
    MSg::Queue::Queue(v14, v9);
    MSg::Timer::Timer((uint64_t)v15, v8, (id *)v14, v12);
    MSg::Timer::operator=((uint64_t)&v11->_timer, (uint64_t *)v15);
    MSg::Timer::~Timer(v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)scheduleWithTimeInterval:(double)a3 repeatAfter:(double)a4 leeway:(double)a5
{
  *(void *)v7 = (uint64_t)(a3 * 1000000000.0);
  *(void *)v5 = (uint64_t)(a4 * 1000000000.0);
  *(void *)v6 = (uint64_t)(a5 * 1000000000.0);
  MSg::Timer::schedule((MSg::Timer *)&self->_timer, v7, v6, v5);
}

- (void)scheduleWithTimeInterval:(double)a3 leeway:(double)a4
{
  *(void *)v6 = (uint64_t)(a3 * 1000000000.0);
  *(void *)v4 = -1;
  *(void *)v5 = (uint64_t)(a4 * 1000000000.0);
  MSg::Timer::schedule((MSg::Timer *)&self->_timer, v6, v5, v4);
}

void __52__MapsSuggestionsGCDTimer_initWithName_queue_block___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained triggerMyObservers];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "MapsSuggestionsTimer.mm";
      __int16 v7 = 1026;
      int v8 = 33;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsGCDTimer initWithName:queue:block:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (id)objectForJSON
{
  v10[2] = *MEMORY[0x1E4F143B8];
  name = self->_timer._name;
  firesAt = self->_timer._state.firesAt;
  v9[0] = @"name";
  v9[1] = @"firesInSec";
  v10[0] = name;
  if (firesAt)
  {
    double v4 = MapsSuggestionsSecondsTo(firesAt);
    MSg::jsonFor(v5, v4);
  }
  else
  {
    [MEMORY[0x1E4F1CA98] null];
  v6 = };
  v10[1] = v6;
  __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (void)scheduleWithInterval:(Duration)a3 leeway:(Duration)a4
{
  *(void *)v6 = *(void *)&a3;
  *(void *)double v4 = -1;
  *(void *)int v5 = *(void *)&a4;
  MSg::Timer::schedule((MSg::Timer *)&self->_timer, v6, v5, v4);
}

- (MapsSuggestionsGCDTimer)initWithName:(id)a3 queue:(id)a4 timerReturningBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsGCDTimer;
  uint64_t v11 = [(MapsSuggestionsBaseTrigger *)&v20 initWithName:@"MapsSuggestionsGCDTimer"];
  if (v11)
  {
    objc_initWeak(&location, v11);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__MapsSuggestionsGCDTimer_initWithName_queue_timerReturningBlock___block_invoke;
    aBlock[3] = &unk_1E5CB84F0;
    objc_copyWeak(&v18, &location);
    id v17 = v10;
    v12 = _Block_copy(aBlock);
    MSg::Queue::Queue(v14, v9);
    MSg::Timer::Timer((uint64_t)v15, v8, (id *)v14, v12);
    MSg::Timer::operator=((uint64_t)&v11->_timer, (uint64_t *)v15);
    MSg::Timer::~Timer(v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __66__MapsSuggestionsGCDTimer_initWithName_queue_timerReturningBlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained triggerMyObservers];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    GEOFindOrCreateLog();
    double v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      v6 = "MapsSuggestionsTimer.mm";
      __int16 v7 = 1026;
      int v8 = 51;
      __int16 v9 = 2082;
      id v10 = "-[MapsSuggestionsGCDTimer initWithName:queue:timerReturningBlock:]_block_invoke";
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongSelf went away in %{public}s", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)scheduleWithInterval:(Duration)a3 repeatAfter:(Duration)a4 leeway:(Duration)a5
{
  *(void *)__int16 v7 = *(void *)&a3;
  *(void *)int v5 = *(void *)&a5;
  *(void *)v6 = *(void *)&a4;
  MSg::Timer::schedule((MSg::Timer *)&self->_timer, v7, v5, v6);
}

- (void)unschedule
{
}

- (void)dealloc
{
  MSg::Timer::unschedule((MSg::Timer *)&self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsGCDTimer;
  [(MapsSuggestionsGCDTimer *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end