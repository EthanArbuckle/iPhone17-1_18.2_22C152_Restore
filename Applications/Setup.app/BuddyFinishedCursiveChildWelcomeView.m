@interface BuddyFinishedCursiveChildWelcomeView
- (BuddyCursiveTextView)cursiveTextView;
- (BuddyFinishedCursiveChildWelcomeView)initWithFrame:(CGRect)a3;
- (CADisplayLink)displayLink;
- (UITraitChangeRegistration)traitChangeRegistration;
- (double)customDelayDuration;
- (double)startTime;
- (void)_animateCursiveForTimePassed;
- (void)_createDisplayLink;
- (void)_onDisplayLink:(id)a3;
- (void)_removeDisplayLink;
- (void)_updateFillColor;
- (void)setAccessibilityLabel:(id)a3;
- (void)setCursiveTextView:(id)a3;
- (void)setCustomDelayDuration:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)startAnimation;
@end

@implementation BuddyFinishedCursiveChildWelcomeView

- (BuddyFinishedCursiveChildWelcomeView)initWithFrame:(CGRect)a3
{
  CGRect v19 = a3;
  SEL v17 = a2;
  id location = 0;
  v16.receiver = self;
  v16.super_class = (Class)BuddyFinishedCursiveChildWelcomeView;
  id location = -[BuddyFinishedCursiveChildWelcomeView initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = objc_alloc_init(BuddyCursiveTextView);
    v4 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v3;

    [location _updateFillColor];
    [*((id *)location + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
    [location addSubview:*((void *)location + 1)];
    [*((id *)location + 1) pinToEdges:location];
    id v5 = location;
    uint64_t v20 = objc_opt_class();
    v6 = +[NSArray arrayWithObjects:&v20 count:1];
    v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_10013055C;
    v14 = &unk_1002B3740;
    id v15 = location;
    id v7 = [v5 registerForTraitChanges:v6 withHandler:&v10];
    [location setTraitChangeRegistration:v7];

    objc_storeStrong(&v15, 0);
  }
  v8 = (BuddyFinishedCursiveChildWelcomeView *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)startAnimation
{
  v6 = self;
  location[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  location[0] = [(NSBundle *)v2 URLForResource:@"BuddyCursive" withExtension:@"plist" subdirectory:0];

  v3 = [(BuddyFinishedCursiveChildWelcomeView *)v6 cursiveTextView];
  [(BuddyCursiveTextView *)v3 loadText:location[0] pointSize:64.0];

  v4 = [(BuddyFinishedCursiveChildWelcomeView *)v6 cursiveTextView];
  [(BuddyCursiveTextView *)v4 duration];
  -[BuddyFinishedCursiveChildWelcomeView setCustomDelayDuration:](v6, "setCustomDelayDuration:");

  [(BuddyFinishedCursiveChildWelcomeView *)v6 setStartTime:CFAbsoluteTimeGetCurrent()];
  [(BuddyFinishedCursiveChildWelcomeView *)v6 _createDisplayLink];
  [(BuddyFinishedCursiveChildWelcomeView *)v6 setNeedsLayout];
  objc_storeStrong(location, 0);
}

- (void)setAccessibilityLabel:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)BuddyFinishedCursiveChildWelcomeView;
  [(BuddyFinishedCursiveChildWelcomeView *)&v4 setAccessibilityLabel:location[0]];
  v3 = [(BuddyFinishedCursiveChildWelcomeView *)v6 cursiveTextView];
  [(BuddyCursiveTextView *)v3 setAccessibilityLabel:location[0]];

  objc_storeStrong(location, 0);
}

- (void)_createDisplayLink
{
  if (self->_displayLink) {
    [(BuddyFinishedCursiveChildWelcomeView *)self _removeDisplayLink];
  }
  v2 = +[CADisplayLink displayLinkWithTarget:self selector:"_onDisplayLink:"];
  [(BuddyFinishedCursiveChildWelcomeView *)self setDisplayLink:v2];

  v3 = [(BuddyFinishedCursiveChildWelcomeView *)self displayLink];
  CAFrameRateRange v7 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[CADisplayLink setPreferredFrameRateRange:](v3, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);

  objc_super v4 = [(BuddyFinishedCursiveChildWelcomeView *)self displayLink];
  id v5 = +[NSRunLoop mainRunLoop];
  [(CADisplayLink *)v4 addToRunLoop:v5 forMode:NSRunLoopCommonModes];
}

- (void)_removeDisplayLink
{
  v2 = [(BuddyFinishedCursiveChildWelcomeView *)self displayLink];
  [(CADisplayLink *)v2 invalidate];

  [(BuddyFinishedCursiveChildWelcomeView *)self setDisplayLink:0];
}

- (void)_onDisplayLink:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (CADisplayLink *)location[0];
  objc_super v4 = [(BuddyFinishedCursiveChildWelcomeView *)v6 displayLink];

  if (v3 == v4) {
    [(BuddyFinishedCursiveChildWelcomeView *)v6 _animateCursiveForTimePassed];
  }
  objc_storeStrong(location, 0);
}

- (void)_animateCursiveForTimePassed
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(BuddyFinishedCursiveChildWelcomeView *)self startTime];
  double v6 = Current - v3;
  objc_super v4 = [(BuddyFinishedCursiveChildWelcomeView *)self cursiveTextView];
  HIDWORD(v5) = HIDWORD(v6);
  *(float *)&double v5 = v6;
  [(BuddyCursiveTextView *)v4 setTime:v5];

  [(BuddyFinishedCursiveChildWelcomeView *)self customDelayDuration];
  if (BSFloatGreaterThanFloat()) {
    [(BuddyFinishedCursiveChildWelcomeView *)self _removeDisplayLink];
  }
}

- (void)_updateFillColor
{
  id v2 = [(BuddyFinishedCursiveChildWelcomeView *)self traitCollection];
  id v3 = [v2 userInterfaceStyle];

  objc_super v4 = [(BuddyFinishedCursiveChildWelcomeView *)self cursiveTextView];
  if (v3 == (id)2) {
    double v5 = +[UIColor whiteColor];
  }
  else {
    double v5 = +[UIColor blackColor];
  }
  [(BuddyCursiveTextView *)v4 setFillColor:v5];
}

- (BuddyCursiveTextView)cursiveTextView
{
  return self->_cursiveTextView;
}

- (void)setCursiveTextView:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)customDelayDuration
{
  return self->_customDelayDuration;
}

- (void)setCustomDelayDuration:(double)a3
{
  self->_customDelayDuration = a3;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end