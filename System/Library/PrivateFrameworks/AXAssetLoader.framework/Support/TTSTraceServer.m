@interface TTSTraceServer
+ (_TtC9axassetsd14TTSTraceServer)shared;
+ (void)setShared:(id)a3;
- (_TtC9axassetsd14TTSTraceServer)init;
@end

@implementation TTSTraceServer

+ (_TtC9axassetsd14TTSTraceServer)shared
{
  if (qword_100027A88 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (_TtC9axassetsd14TTSTraceServer *)(id)qword_100027A90;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_100027A88;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_100027A90;
  qword_100027A90 = (uint64_t)v4;
}

- (_TtC9axassetsd14TTSTraceServer)init
{
  return (_TtC9axassetsd14TTSTraceServer *)sub_100011124();
}

- (void).cxx_destruct
{
}

@end