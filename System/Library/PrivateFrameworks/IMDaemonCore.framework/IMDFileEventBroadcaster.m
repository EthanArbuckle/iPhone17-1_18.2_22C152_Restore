@interface IMDFileEventBroadcaster
+ (id)sharedInstance;
- (IMDFileEventBroadcaster)init;
- (void)observeChangesInPath:(id)a3;
- (void)stopObserving;
@end

@implementation IMDFileEventBroadcaster

+ (id)sharedInstance
{
  if (qword_1EBE2AEA8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBE2AE98;

  return v2;
}

- (void)observeChangesInPath:(id)a3
{
  uint64_t v4 = sub_1D9906DA0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  IMDFileEventBroadcaster.observeChanges(in:)(v8);

  swift_bridgeObjectRelease();
}

- (void)stopObserving
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDFileEventBroadcaster_fileEventStream))
  {
    v2 = self;
    swift_retain();
    FileEventStream.stop()();

    swift_release();
  }
}

- (IMDFileEventBroadcaster)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDFileEventBroadcaster_fileEventStream) = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDFileEventBroadcaster;
  return [(IMDFileEventBroadcaster *)&v3 init];
}

- (void).cxx_destruct
{
}

@end