@interface LumaTrackingBackdropView.Coordinator
- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4;
@end

@implementation LumaTrackingBackdropView.Coordinator

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  v4 = *(void (**)(unint64_t))self->onBackgroundLumaChanged;
  if (v4)
  {
    id v6 = a3;
    swift_retain();
    sub_100030254((uint64_t)v4);
    v4(a4);
    sub_100030180((uint64_t)v4);

    swift_release();
  }
}

@end