@interface AVScrubbingGesturePlatformAdapter
- (AVScrubbingGesturePlatformAdapterDelegate)delegate;
- (BOOL)gestureActive;
- (BOOL)gestureEnabled;
- (CGPoint)translation;
- (float)timelineVelocity;
- (id)_abstractInit;
- (void)setDelegate:(id)a3;
- (void)setGestureEnabled:(BOOL)a3;
@end

@implementation AVScrubbingGesturePlatformAdapter

- (void).cxx_destruct
{
}

- (void)setGestureEnabled:(BOOL)a3
{
  self->_gestureEnabled = a3;
}

- (BOOL)gestureEnabled
{
  return self->_gestureEnabled;
}

- (void)setDelegate:(id)a3
{
}

- (AVScrubbingGesturePlatformAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVScrubbingGesturePlatformAdapterDelegate *)WeakRetained;
}

- (BOOL)gestureActive
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"You must override %@ in a subclass.", v4 format];

  return 0;
}

- (float)timelineVelocity
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"You must override %@ in a subclass.", v4 format];

  return 0.0;
}

- (CGPoint)translation
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"You must override %@ in a subclass.", v4 format];

  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)_abstractInit
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"AVScrubbingGesturePlatformAdapter cannot be instantiated directly. You must subclass it."];
  }
  v6.receiver = self;
  v6.super_class = (Class)AVScrubbingGesturePlatformAdapter;
  v4 = [(AVScrubbingGesturePlatformAdapter *)&v6 init];

  return v4;
}

@end