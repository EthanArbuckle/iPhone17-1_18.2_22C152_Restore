@interface ActivityDigitalSeparationSource
- (NSString)name;
- (_TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource)init;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation ActivityDigitalSeparationSource

- (NSString)name
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_name));
}

- (_TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource)init
{
  return (_TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource *)sub_293C();
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_7574(v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_3C60((uint64_t)sub_80A4, v5);
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_name));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_healthStore));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationSource_client);
}

@end