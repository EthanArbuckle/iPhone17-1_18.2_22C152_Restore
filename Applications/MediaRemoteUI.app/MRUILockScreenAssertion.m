@interface MRUILockScreenAssertion
- (BOOL)isAnimated;
- (BOOL)isValid;
- (MRUILockScreenAssertion)init;
- (MRUILockScreenAssertion)initWithAnimated:(BOOL)a3;
- (SBSLockScreenBackgroundContentAssertion)backgroundContentAssertion;
- (void)acquire;
- (void)dealloc;
- (void)delayAcquire;
- (void)invalidate;
- (void)setBackgroundContentAssertion:(id)a3;
@end

@implementation MRUILockScreenAssertion

- (MRUILockScreenAssertion)initWithAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRUILockScreenAssertion;
  v4 = [(MRUILockScreenAssertion *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_animated = a3;
    [(MRUILockScreenAssertion *)v4 acquire];
  }
  return v5;
}

- (MRUILockScreenAssertion)init
{
  return [(MRUILockScreenAssertion *)self initWithAnimated:0];
}

- (void)acquire
{
  self->_valid = 1;
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init((Class)SBSBackgroundContentDefinition);
  v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  objc_super v7 = sub_1000050C4;
  v8 = &unk_100049410;
  objc_copyWeak(&v9, &location);
  v4 = +[SBSLockScreenBackgroundContentAssertion acquireBackgroundContentAssertionWithDefinition:v3 errorHandler:&v5];
  -[MRUILockScreenAssertion setBackgroundContentAssertion:](self, "setBackgroundContentAssertion:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)delayAcquire
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005220;
  block[3] = &unk_100049438;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)invalidate
{
  dispatch_time_t v3 = [(MRUILockScreenAssertion *)self backgroundContentAssertion];
  [v3 invalidate];

  [(MRUILockScreenAssertion *)self setBackgroundContentAssertion:0];
  self->_valid = 0;
}

- (void)dealloc
{
  [(MRUILockScreenAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRUILockScreenAssertion;
  [(MRUILockScreenAssertion *)&v3 dealloc];
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (SBSLockScreenBackgroundContentAssertion)backgroundContentAssertion
{
  return self->_backgroundContentAssertion;
}

- (void)setBackgroundContentAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end