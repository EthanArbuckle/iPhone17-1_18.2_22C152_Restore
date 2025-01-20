@interface PADSWFrame
- (_TtC10CoreIDVPAD10PADSWFrame)init;
- (void)dealloc;
@end

@implementation PADSWFrame

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  if (qword_267EBABB8 != -1) {
    swift_once();
  }
  objc_msgSend(v5, sel_postNotificationName_object_, qword_267EBB170, 0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PADSWFrame();
  [(PADSWFrame *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (_TtC10CoreIDVPAD10PADSWFrame)init
{
  result = (_TtC10CoreIDVPAD10PADSWFrame *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end