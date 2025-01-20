@interface RSSessionDelegateWrapper
- (_TtC8RoomPlan24RSSessionDelegateWrapper)init;
- (void)session:(id)a3 didFailWithError:(int64_t)a4;
- (void)session:(id)a3 didUpdateAsset:(id)a4;
- (void)session:(id)a3 didUpdateFloorPlan:(id)a4;
- (void)session:(id)a3 didUpdateMarkerCoaching:(id)a4;
- (void)session:(id)a3 didUpdateTextCoaching:(id)a4;
@end

@implementation RSSessionDelegateWrapper

- (void)session:(id)a3 didUpdateFloorPlan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2347B2FE0(v7);
}

- (void)session:(id)a3 didUpdateAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2347B32C0(v7, (uint64_t)&unk_26E777098, (uint64_t)sub_2347B3E10, (uint64_t)&block_descriptor_227);
}

- (void)session:(id)a3 didUpdateTextCoaching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2347B32C0(v7, (uint64_t)&unk_26E777048, (uint64_t)sub_2347B3E08, (uint64_t)&block_descriptor_221);
}

- (void)session:(id)a3 didFailWithError:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_2347B3A1C(a4, (uint64_t)&OBJC_IVAR____TtC8RoomPlan24RSSessionDelegateWrapper_captureSession, (uint64_t)&unk_26E776FF8, (uint64_t)sub_2347B3E00, (uint64_t)&block_descriptor_215);
}

- (void)session:(id)a3 didUpdateMarkerCoaching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2347B32C0(v7, (uint64_t)&unk_26E776FA8, (uint64_t)sub_2347B3DF8, (uint64_t)&block_descriptor_209_0);
}

- (_TtC8RoomPlan24RSSessionDelegateWrapper)init
{
  swift_weakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan24RSSessionDelegateWrapper_initializationState) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RSSessionDelegateWrapper();
  return [(RSSessionDelegateWrapper *)&v4 init];
}

- (void).cxx_destruct
{
}

@end