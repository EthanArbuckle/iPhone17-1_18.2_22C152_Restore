@interface AnnounceServer
- (_TtC14AnnounceDaemon14AnnounceServer)init;
@end

@implementation AnnounceServer

- (_TtC14AnnounceDaemon14AnnounceServer)init
{
  return (_TtC14AnnounceDaemon14AnnounceServer *)AnnounceServer.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceServiceListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_playbackSessionServiceListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_announceReachabilityServiceListener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_systemNotificationObserver));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14AnnounceDaemon14AnnounceServer_tonePlayerServiceListener);
}

@end