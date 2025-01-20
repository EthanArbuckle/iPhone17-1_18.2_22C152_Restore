@interface MapsSyncMutableRAPRecord
- (NSData)contentData;
- (NSData)rapResponse;
- (NSDate)statusLastUpdatedDate;
- (NSString)countryCode;
- (NSString)reportId;
- (NSString)summary;
- (_TtC8MapsSync19MapsSyncCommunityID)communityID;
- (_TtC8MapsSync24MapsSyncMutableRAPRecord)initWithProxyObject:(id)a3;
- (signed)clientRevision;
- (signed)status;
- (signed)type;
- (void)setClientRevision:(signed __int16)a3;
- (void)setCommunityID:(id)a3;
- (void)setContentData:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setRapResponse:(id)a3;
- (void)setReportId:(id)a3;
- (void)setStatus:(signed __int16)a3;
- (void)setStatusLastUpdatedDate:(id)a3;
- (void)setSummary:(id)a3;
- (void)setType:(signed __int16)a3;
@end

@implementation MapsSyncMutableRAPRecord

- (_TtC8MapsSync24MapsSyncMutableRAPRecord)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedRAPRecord();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSString)countryCode
{
  return (NSString *)sub_1A6F3A4F8((char *)self, (uint64_t)a2, (SEL *)&selRef_countryCode);
}

- (void)setCountryCode:(id)a3
{
}

- (signed)type
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_type);
}

- (void)setType:(signed __int16)a3
{
}

- (NSString)summary
{
  return (NSString *)sub_1A6F3A4F8((char *)self, (uint64_t)a2, (SEL *)&selRef_summary);
}

- (void)setSummary:(id)a3
{
}

- (NSString)reportId
{
  return (NSString *)sub_1A6F3A4F8((char *)self, (uint64_t)a2, (SEL *)&selRef_reportId);
}

- (void)setReportId:(id)a3
{
}

- (signed)status
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_status);
}

- (void)setStatus:(signed __int16)a3
{
}

- (NSDate)statusLastUpdatedDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy);
  v10 = self;
  id v11 = objc_msgSend(v9, sel_statusLastUpdatedDate);
  if (v11)
  {
    v12 = v11;
    sub_1A709D1D8();

    uint64_t v13 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_1A6F0EF6C((uint64_t)v6, (uint64_t)v8);

  sub_1A709D1F8();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_1A709D1B8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSDate *)v15;
}

- (void)setStatusLastUpdatedDate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  v10 = (char *)&v17 - v9;
  if (a3)
  {
    sub_1A709D1D8();
    uint64_t v11 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v11 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  v12 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy);
  sub_1A6F235F8((uint64_t)v10, (uint64_t)v8, &qword_1EB670330);
  sub_1A709D1F8();
  uint64_t v13 = *(void *)(v11 - 8);
  int v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v11);
  v15 = self;
  v16 = 0;
  if (v14 != 1)
  {
    v16 = (void *)sub_1A709D1B8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v11);
  }
  objc_msgSend(v12, sel_setStatusLastUpdatedDate_, v16);

  sub_1A6F22460((uint64_t)v10, &qword_1EB670330);
}

- (NSData)contentData
{
  return (NSData *)sub_1A6F3B89C((char *)self, (uint64_t)a2, (SEL *)&selRef_contentData);
}

- (void)setContentData:(id)a3
{
}

- (signed)clientRevision
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_clientRevision);
}

- (void)setClientRevision:(signed __int16)a3
{
}

- (NSData)rapResponse
{
  return (NSData *)sub_1A6F3B89C((char *)self, (uint64_t)a2, (SEL *)&selRef_rapResponse);
}

- (void)setRapResponse:(id)a3
{
}

- (_TtC8MapsSync19MapsSyncCommunityID)communityID
{
  v2 = self;
  id v3 = sub_1A6F3BE50();

  return (_TtC8MapsSync19MapsSyncCommunityID *)v3;
}

- (void)setCommunityID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1A6F3BF80((char *)a3);
}

- (void).cxx_destruct
{
}

@end