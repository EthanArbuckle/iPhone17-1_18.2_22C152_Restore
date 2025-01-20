@interface OUSessionDelegateWrapper
- (_TtC8RoomPlan24OUSessionDelegateWrapper)init;
- (void)session:(id)a3 didFailWithError:(int64_t)a4;
- (void)session:(id)a3 didUpdateDetectedObjects:(id)a4;
@end

@implementation OUSessionDelegateWrapper

- (void)session:(id)a3 didUpdateDetectedObjects:(id)a4
{
}

- (void)session:(id)a3 didFailWithError:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_2347B3A1C(a4, (uint64_t)&OBJC_IVAR____TtC8RoomPlan24OUSessionDelegateWrapper_captureSession, (uint64_t)&unk_26E776EE0, (uint64_t)sub_2347B3D24, (uint64_t)&block_descriptor_194_0);
}

- (_TtC8RoomPlan24OUSessionDelegateWrapper)init
{
  return (_TtC8RoomPlan24OUSessionDelegateWrapper *)sub_2347AA028(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8RoomPlan24OUSessionDelegateWrapper_captureSession, (uint64_t (*)(uint64_t))type metadata accessor for OUSessionDelegateWrapper);
}

- (void).cxx_destruct
{
}

@end