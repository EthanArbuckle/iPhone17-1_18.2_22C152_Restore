@interface SFMDeviceSyncHandler
- (SFMDeviceSyncHandler)init;
- (void)beginSyncWithInfo:(id)a3 configuration:(id)a4;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)syncDidEnd;
@end

@implementation SFMDeviceSyncHandler

- (void)beginSyncWithInfo:(id)a3 configuration:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_6C54(a3);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  if (a3)
  {
    int v6 = sub_9E00();
    uint64_t v8 = v7;
  }
  else
  {
    int v6 = 0;
    uint64_t v8 = 0;
  }
  swift_unknownObjectRetain();
  v9 = self;
  sub_7BF0(v6, v8, a4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)syncDidEnd
{
  v2 = self;
  sub_7DD4();
}

- (SFMDeviceSyncHandler)init
{
  return (SFMDeviceSyncHandler *)sub_7EE0();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end