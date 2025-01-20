@interface ActivityDigitalSeparationFriend
- (NSPersonNameComponents)nameComponents;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (_TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend)init;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation ActivityDigitalSeparationFriend

- (int64_t)role
{
  return 2;
}

- (int64_t)permission
{
  return 2;
}

- (NSString)unifiedContactIdentifier
{
  return (NSString *)sub_92D0(self, (uint64_t)a2, (void (*)(void))sub_8E78);
}

- (NSPersonNameComponents)nameComponents
{
  uint64_t v3 = sub_28E8(&qword_118B0);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v18 - v7;
  v9 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend);
  v10 = self;
  id v11 = [v9 displayName];
  if (v11)
  {
    v12 = v11;
    sub_98A8();
  }
  uint64_t v13 = sub_97F8();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  v15(v6, 1, 1, v13);
  sub_97D8();
  v15(v8, 0, 1, v13);

  Class v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    Class v16 = sub_97E8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }

  return (NSPersonNameComponents *)v16;
}

- (NSString)emailAddress
{
  return (NSString *)sub_92D0(self, (uint64_t)a2, (void (*)(void))sub_929C);
}

- (NSString)phoneNumber
{
  return (NSString *)sub_92D0(self, (uint64_t)a2, (void (*)(void))sub_9350);
}

- (_TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend)init
{
  result = (_TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25ActivityDigitalSeparation31ActivityDigitalSeparationFriend_sharingFriend));
}

@end