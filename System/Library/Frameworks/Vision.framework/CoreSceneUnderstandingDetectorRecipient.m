@interface CoreSceneUnderstandingDetectorRecipient
- (VNRequestSpecifier)originatingRequestSpecifier;
- (_TtC6Vision39CoreSceneUnderstandingDetectorRecipient)init;
- (void)receiveObservations:(id)a3;
@end

@implementation CoreSceneUnderstandingDetectorRecipient

- (void)receiveObservations:(id)a3
{
  if (a3)
  {
    sub_1A3C85518();
    uint64_t v4 = sub_1A409630C();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1A3C833FC(v4);

  swift_bridgeObjectRelease();
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC6Vision39CoreSceneUnderstandingDetectorRecipient_originatingRequestSpecifier));
}

- (_TtC6Vision39CoreSceneUnderstandingDetectorRecipient)init
{
  result = (_TtC6Vision39CoreSceneUnderstandingDetectorRecipient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6Vision39CoreSceneUnderstandingDetectorRecipient_originatingRequestSpecifier));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC6Vision39CoreSceneUnderstandingDetectorRecipient_request);

  swift_bridgeObjectRelease();
}

@end