@interface ActivityClass
- (OS_xpc_object)rawCriteria;
- (_TtC9appstored13ActivityClass)init;
- (const)rawRegisteredName;
@end

@implementation ActivityClass

- (OS_xpc_object)rawCriteria
{
  uint64_t v3 = type metadata accessor for XPCDictionary();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x50);
  v8 = self;
  v7();
  sub_10001644C(&qword_1005A3F18);
  XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v9 = (void *)v11[1];
  return (OS_xpc_object *)v9;
}

- (const)rawRegisteredName
{
  return (const char *)sub_100037858();
}

- (_TtC9appstored13ActivityClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityClass();
  return [(ActivityClass *)&v3 init];
}

@end