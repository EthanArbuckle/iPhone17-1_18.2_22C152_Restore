@interface QLPXNumberFilter
- (BOOL)_needsUpdate;
- (QLPXNumberFilter)init;
- (QLPXNumberFilter)initWithInput:(double)a3;
- (double)currentTime;
- (double)input;
- (double)lastTime;
- (double)output;
- (double)time;
- (double)updatedOutput;
- (void)_invalidateOutput;
- (void)_setLastTime:(double)a3;
- (void)_setNeedsUpdate;
- (void)_setOutput:(double)a3;
- (void)_updateIfNeeded;
- (void)_updateOutputIfNeeded;
- (void)didPerformChanges;
- (void)invalidateOutput;
- (void)performChanges:(id)a3;
- (void)setInput:(double)a3;
- (void)setTime:(double)a3;
@end

@implementation QLPXNumberFilter

- (QLPXNumberFilter)init
{
  return [(QLPXNumberFilter *)self initWithInput:0.0];
}

- (QLPXNumberFilter)initWithInput:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QLPXNumberFilter;
  v4 = [(QLPXObservable *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_input = a3;
    [(QLPXNumberFilter *)v4 initialOutputForInput:a3];
    v5->_output = v6;
  }
  return v5;
}

- (double)updatedOutput
{
  return 0.0;
}

- (void)_setOutput:(double)a3
{
  if (self->_output != a3)
  {
    self->_output = a3;
    [(QLPXObservable *)self signalChange:2];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)QLPXNumberFilter;
  [(QLPXObservable *)&v3 performChanges:a3];
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)QLPXNumberFilter;
  [(QLPXObservable *)&v3 didPerformChanges];
  [(QLPXNumberFilter *)self _updateIfNeeded];
}

- (void)_setLastTime:(double)a3
{
  self->_lastTime = a3;
}

- (void)setInput:(double)a3
{
  if (self->_input != a3)
  {
    self->_input = a3;
    [(QLPXObservable *)self signalChange:1];
    [(QLPXNumberFilter *)self _invalidateOutput];
  }
}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
  {
    self->_time = a3;
    [(QLPXNumberFilter *)self _invalidateOutput];
  }
}

- (double)currentTime
{
  [(QLPXNumberFilter *)self time];
  if (result == 0.0)
  {
    objc_super v3 = (void *)MEMORY[0x263EFF910];
    [v3 timeIntervalSinceReferenceDate];
  }
  return result;
}

- (void)invalidateOutput
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __36__QLPXNumberFilter_invalidateOutput__block_invoke;
  v2[3] = &unk_2642F60C8;
  v2[4] = self;
  [(QLPXNumberFilter *)self performChanges:v2];
}

uint64_t __36__QLPXNumberFilter_invalidateOutput__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateOutput];
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.output;
}

- (void)_setNeedsUpdate
{
}

- (void)_updateIfNeeded
{
  if ([(QLPXNumberFilter *)self _needsUpdate])
  {
    [(QLPXNumberFilter *)self _updateOutputIfNeeded];
  }
}

- (void)_invalidateOutput
{
  self->_needsUpdateFlags.output = 1;
  [(QLPXNumberFilter *)self _setNeedsUpdate];
}

- (void)_updateOutputIfNeeded
{
  if (self->_needsUpdateFlags.output)
  {
    self->_needsUpdateFlags.output = 0;
    [(QLPXNumberFilter *)self currentTime];
    double v4 = v3;
    [(QLPXNumberFilter *)self updatedOutput];
    -[QLPXNumberFilter _setOutput:](self, "_setOutput:");
    [(QLPXNumberFilter *)self _setLastTime:v4];
  }
}

- (double)input
{
  return self->_input;
}

- (double)time
{
  return self->_time;
}

- (double)output
{
  return self->_output;
}

- (double)lastTime
{
  return self->_lastTime;
}

@end