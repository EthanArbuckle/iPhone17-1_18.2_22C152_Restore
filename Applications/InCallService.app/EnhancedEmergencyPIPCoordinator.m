@interface EnhancedEmergencyPIPCoordinator
- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3;
- (_TtC13InCallService31EnhancedEmergencyPIPCoordinator)init;
- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3;
- (int64_t)pictureInPictureProxyContentType:(id)a3;
- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5;
@end

@implementation EnhancedEmergencyPIPCoordinator

- (_TtC13InCallService31EnhancedEmergencyPIPCoordinator)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService31EnhancedEmergencyPIPCoordinator_pictureInPictureProxy));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService31EnhancedEmergencyPIPCoordinator_presentationController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallService31EnhancedEmergencyPIPCoordinator_sourceView));
  v3 = (char *)self + OBJC_IVAR____TtC13InCallService31EnhancedEmergencyPIPCoordinator_delegate;

  sub_1001443AC((uint64_t)v3);
}

- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  id v7 = a3;
  v9 = self;
  sub_100143C88((uint64_t)v9, v8, a5);
}

- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100143D58();

  return v6;
}

- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3
{
  id v4 = a3;
  v5 = self;
  double v6 = sub_100144128();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int64_t)pictureInPictureProxyContentType:(id)a3
{
  return 4;
}

@end