@interface MPContactSearchResult
- (CNContact)contact;
- (CNContactMatchInfo)matchInfo;
- (MPContactSearchResult)init;
- (MPContactSearchResult)initWithContact:(id)a3 matchInfo:(id)a4 preferredPhoneNumber:(id)a5;
- (id)preferredPhoneNumber;
- (void)setContact:(id)a3;
- (void)setMatchInfo:(id)a3;
- (void)setPreferredPhoneNumber:(id)a3;
@end

@implementation MPContactSearchResult

- (CNContact)contact
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_contact);
  swift_beginAccess();
  return (CNContact *)*v2;
}

- (void)setContact:(id)a3
{
}

- (CNContactMatchInfo)matchInfo
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_matchInfo);
  swift_beginAccess();
  return (CNContactMatchInfo *)*v2;
}

- (void)setMatchInfo:(id)a3
{
}

- (id)preferredPhoneNumber
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_preferredPhoneNumber);
  swift_beginAccess();
  return *v2;
}

- (void)setPreferredPhoneNumber:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_preferredPhoneNumber);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (MPContactSearchResult)initWithContact:(id)a3 matchInfo:(id)a4 preferredPhoneNumber:(id)a5
{
  v9 = (void **)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_preferredPhoneNumber);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_preferredPhoneNumber) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_contact) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_matchInfo) = (Class)a4;
  swift_beginAccess();
  v10 = *v9;
  *v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v11;
  id v15 = v12;
  id v16 = v13;

  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for ContactSearchResult();
  v17 = [(MPContactSearchResult *)&v19 init];

  return v17;
}

- (MPContactSearchResult)init
{
  result = (MPContactSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_preferredPhoneNumber);
}

@end