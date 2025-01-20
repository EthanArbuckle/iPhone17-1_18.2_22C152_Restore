@interface CHDMonotonicTimer
- (void)activateWithTime:(unint64_t)a3 repeat:(int64_t)a4 block:(id)a5;
- (void)invalidate;
@end

@implementation CHDMonotonicTimer

- (void)activateWithTime:(unint64_t)a3 repeat:(int64_t)a4 block:(id)a5
{
  id v9 = a5;
  _CHDMonotonicNSEC(a3, (uint64_t)"time");
  if (a4 < 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"CHDMonotonicTimer.m" lineNumber:55 description:@"invalid interval"];

    if (v9) {
      goto LABEL_3;
    }
  }
  else if (v9)
  {
    goto LABEL_3;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"CHDMonotonicTimer.m", 56, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

LABEL_3:
  if (self->_timer)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"CHDMonotonicTimer.m" lineNumber:57 description:@"already have a timer"];
  }
  v10 = dispatch_get_global_queue(17, 0);
  v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v10);
  timer = self->_timer;
  self->_timer = v11;

  if (a4 <= 0) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = a4;
  }
  dispatch_source_set_timer((dispatch_source_t)self->_timer, a3, v13, 0);
  dispatch_source_set_event_handler((dispatch_source_t)self->_timer, v9);

  v14 = self->_timer;

  dispatch_activate(v14);
}

- (void)invalidate
{
  timer = self->_timer;
  if (!timer)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CHDMonotonicTimer.m" lineNumber:65 description:@"must have called activate"];

    timer = self->_timer;
  }
  dispatch_source_cancel(timer);
  v4 = self->_timer;

  dispatch_source_set_event_handler(v4, &__block_literal_global);
}

- (void).cxx_destruct
{
}

@end