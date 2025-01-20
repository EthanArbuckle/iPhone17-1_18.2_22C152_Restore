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
  id v2 = sub_1001A76D8();

  return (CNContact *)v2;
}

- (void)setContact:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001A7740((uint64_t)v4);
}

- (CNContactMatchInfo)matchInfo
{
  id v2 = sub_1001A7780();

  return (CNContactMatchInfo *)v2;
}

- (void)setMatchInfo:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001A77E8((uint64_t)v4);
}

- (id)preferredPhoneNumber
{
  id v2 = sub_1001A7828();

  return v2;
}

- (void)setPreferredPhoneNumber:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1001A78B4((uint64_t)a3);
}

- (MPContactSearchResult)initWithContact:(id)a3 matchInfo:(id)a4 preferredPhoneNumber:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  return (MPContactSearchResult *)sub_1001A78C0(v7, v8, a5);
}

- (MPContactSearchResult)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPContactSearchResult_preferredPhoneNumber);
}

@end