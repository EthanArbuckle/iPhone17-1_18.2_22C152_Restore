@interface DEDCompressionDebouncer
- (BOOL)finished;
- (DEDCompressionDebouncer)initWithTrigger:(id)a3 interval:(double)a4;
- (double)interval;
- (double)lastTriggerTime;
- (id)handler;
- (id)trigger;
- (unint64_t)lastKnownCompressedBytes;
- (unint64_t)lastKnownTotalBytes;
- (unint64_t)lastSentCompressedBytes;
- (unint64_t)lastSentTotalBytes;
- (void)sendTriggerIfStateChanged;
- (void)sendTriggerIfTimeElapsed;
- (void)setFinished:(BOOL)a3;
- (void)setInterval:(double)a3;
- (void)setLastKnownCompressedBytes:(unint64_t)a3;
- (void)setLastKnownTotalBytes:(unint64_t)a3;
- (void)setLastSentCompressedBytes:(unint64_t)a3;
- (void)setLastSentTotalBytes:(unint64_t)a3;
- (void)setLastTriggerTime:(double)a3;
- (void)setTrigger:(id)a3;
@end

@implementation DEDCompressionDebouncer

- (DEDCompressionDebouncer)initWithTrigger:(id)a3 interval:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DEDCompressionDebouncer;
  v7 = [(DEDCompressionDebouncer *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(DEDCompressionDebouncer *)v7 setTrigger:v6];
    [(DEDCompressionDebouncer *)v8 setInterval:a4];
    [(DEDCompressionDebouncer *)v8 setLastTriggerTime:0.0];
    [(DEDCompressionDebouncer *)v8 setFinished:0];
  }

  return v8;
}

- (void)sendTriggerIfStateChanged
{
  v3 = [MEMORY[0x263EFF910] now];
  [v3 timeIntervalSince1970];
  -[DEDCompressionDebouncer setLastTriggerTime:](self, "setLastTriggerTime:");

  unint64_t v4 = [(DEDCompressionDebouncer *)self lastSentCompressedBytes];
  if (v4 != [(DEDCompressionDebouncer *)self lastKnownCompressedBytes]
    || (unint64_t v5 = [(DEDCompressionDebouncer *)self lastSentTotalBytes],
        v5 != [(DEDCompressionDebouncer *)self lastKnownTotalBytes]))
  {
    id v6 = [(DEDCompressionDebouncer *)self trigger];
    v6[2](v6, [(DEDCompressionDebouncer *)self lastKnownCompressedBytes], [(DEDCompressionDebouncer *)self lastKnownTotalBytes]);

    [(DEDCompressionDebouncer *)self setLastSentCompressedBytes:[(DEDCompressionDebouncer *)self lastKnownCompressedBytes]];
    unint64_t v7 = [(DEDCompressionDebouncer *)self lastKnownTotalBytes];
    [(DEDCompressionDebouncer *)self setLastSentTotalBytes:v7];
  }
}

- (void)sendTriggerIfTimeElapsed
{
  unint64_t v3 = [(DEDCompressionDebouncer *)self lastKnownCompressedBytes];
  if (v3 < [(DEDCompressionDebouncer *)self lastKnownTotalBytes]
    || ([(DEDCompressionDebouncer *)self lastKnownTotalBytes],
        [(DEDCompressionDebouncer *)self finished]))
  {
    id v10 = [MEMORY[0x263EFF910] now];
    [v10 timeIntervalSince1970];
    double v5 = v4;
    [(DEDCompressionDebouncer *)self lastTriggerTime];
    double v7 = v5 - v6;
    [(DEDCompressionDebouncer *)self interval];
    if (v7 < v8)
    {

      return;
    }
    BOOL v9 = [(DEDCompressionDebouncer *)self finished];

    if (v9) {
      return;
    }
  }
  else
  {
    [(DEDCompressionDebouncer *)self setFinished:1];
  }
  [(DEDCompressionDebouncer *)self sendTriggerIfStateChanged];
}

- (id)handler
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__DEDCompressionDebouncer_handler__block_invoke;
  v4[3] = &unk_26453B208;
  v4[4] = self;
  v2 = (void *)MEMORY[0x223C5FFB0](v4, a2);
  return v2;
}

uint64_t __34__DEDCompressionDebouncer_handler__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setLastKnownCompressedBytes:a2];
  [*(id *)(a1 + 32) setLastKnownTotalBytes:a3];
  double v5 = *(void **)(a1 + 32);
  return [v5 sendTriggerIfTimeElapsed];
}

- (id)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (unint64_t)lastSentTotalBytes
{
  return self->_lastSentTotalBytes;
}

- (void)setLastSentTotalBytes:(unint64_t)a3
{
  self->_lastSentTotalBytes = a3;
}

- (unint64_t)lastSentCompressedBytes
{
  return self->_lastSentCompressedBytes;
}

- (void)setLastSentCompressedBytes:(unint64_t)a3
{
  self->_lastSentCompressedBytes = a3;
}

- (unint64_t)lastKnownTotalBytes
{
  return self->_lastKnownTotalBytes;
}

- (void)setLastKnownTotalBytes:(unint64_t)a3
{
  self->_lastKnownTotalBytes = a3;
}

- (unint64_t)lastKnownCompressedBytes
{
  return self->_lastKnownCompressedBytes;
}

- (void)setLastKnownCompressedBytes:(unint64_t)a3
{
  self->_lastKnownCompressedBytes = a3;
}

- (double)lastTriggerTime
{
  return self->_lastTriggerTime;
}

- (void)setLastTriggerTime:(double)a3
{
  self->_lastTriggerTime = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void).cxx_destruct
{
}

@end