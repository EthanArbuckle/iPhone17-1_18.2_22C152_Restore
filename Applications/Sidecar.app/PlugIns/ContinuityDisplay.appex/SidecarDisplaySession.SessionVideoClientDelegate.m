@interface SidecarDisplaySession.SessionVideoClientDelegate
- (_TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate)init;
- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4;
- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4;
- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4;
- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4;
- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3;
- (void)remoteVideoClientDidReceiveLastFrame:(id)a3;
- (void)remoteVideoServerDidDie:(id)a3;
@end

@implementation SidecarDisplaySession.SessionVideoClientDelegate

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100018AEC(v4);
}

- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_100018CE4(v6, v4);
}

- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_100018D60(v6, v4);
}

- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_100018DDC(v6, v4);
}

- (void)remoteVideoClient:(id)a3 videoDidSuspend:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  sub_100018E58(v6, v4);
}

- (void)remoteVideoClientDidReceiveLastFrame:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001901C(v4);
}

- (void)remoteVideoServerDidDie:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000191B0(v4);
}

- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100019414(v6, (uint64_t)v7);
}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10001949C(v6, (uint64_t)v7);
}

- (_TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self
     + OBJC_IVAR____TtCC17ContinuityDisplay21SidecarDisplaySessionP33_72778A0D8780EB3FED7F582200B6777426SessionVideoClientDelegate_logger;
  uint64_t v4 = sub_10005E750();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end