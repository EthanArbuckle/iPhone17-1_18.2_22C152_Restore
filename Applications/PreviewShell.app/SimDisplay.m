@interface SimDisplay
- (FBSDisplayConfiguration)displayConfiguration;
- (NSString)name;
- (UISDeviceContext)deviceContext;
- (UISDisplayContext)displayContext;
- (_TtC12PreviewShell10SimDisplay)init;
- (_TtC12PreviewShell10SimDisplay)initWithName:(id)a3 displayID:(unsigned int)a4 displayConfiguration:(id)a5 capabilitiesPath:(id)a6;
- (unsigned)displayID;
@end

@implementation SimDisplay

- (NSString)name
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (unsigned)displayID
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12PreviewShell10SimDisplay_displayID);
}

- (UISDeviceContext)deviceContext
{
  return (UISDeviceContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities));
}

- (UISDisplayContext)displayContext
{
  return (UISDisplayContext *)*(id *)&self->name[OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities];
}

- (FBSDisplayConfiguration)displayConfiguration
{
  id v2 = [*(id *)&self->name[OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities] displayConfiguration];

  return (FBSDisplayConfiguration *)v2;
}

- (_TtC12PreviewShell10SimDisplay)initWithName:(id)a3 displayID:(unsigned int)a4 displayConfiguration:(id)a5 capabilitiesPath:(id)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a6) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v12 = a5;
  v13 = (_TtC12PreviewShell10SimDisplay *)sub_100011334(v9, v11, a4, v12);

  return v13;
}

- (_TtC12PreviewShell10SimDisplay)init
{
  result = (_TtC12PreviewShell10SimDisplay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PreviewShell10SimDisplay_capabilities);
}

@end