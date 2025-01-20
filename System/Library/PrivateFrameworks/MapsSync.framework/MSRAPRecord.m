@interface MSRAPRecord
+ (Class)managedClass;
- (MSCommunityID)communityID;
- (MSRAPRecord)initWithClientRevision:(signed __int16)a3 contentData:(id)a4 countryCode:(id)a5 positionIndex:(int64_t)a6 rapResponse:(id)a7 reportId:(id)a8 status:(signed __int16)a9 statusLastUpdatedDate:(id)a10 summary:(id)a11 type:(signed __int16)a12;
- (MSRAPRecord)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSRAPRecord)initWithStore:(id)a3 clientRevision:(signed __int16)a4 contentData:(id)a5 countryCode:(id)a6 positionIndex:(int64_t)a7 rapResponse:(id)a8 reportId:(id)a9 status:(signed __int16)a10 statusLastUpdatedDate:(id)a11 summary:(id)a12 type:(signed __int16)a13;
- (NSData)contentData;
- (NSData)rapResponse;
- (NSDate)statusLastUpdatedDate;
- (NSString)countryCode;
- (NSString)reportId;
- (NSString)summary;
- (int64_t)positionIndex;
- (signed)clientRevision;
- (signed)status;
- (signed)type;
- (void)setClientRevision:(signed __int16)a3;
- (void)setCommunityID:(id)a3;
- (void)setContentData:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setRapResponse:(id)a3;
- (void)setReportId:(id)a3;
- (void)setStatus:(signed __int16)a3;
- (void)setStatusLastUpdatedDate:(id)a3;
- (void)setSummary:(id)a3;
- (void)setType:(signed __int16)a3;
@end

@implementation MSRAPRecord

- (MSRAPRecord)initWithClientRevision:(signed __int16)a3 contentData:(id)a4 countryCode:(id)a5 positionIndex:(int64_t)a6 rapResponse:(id)a7 reportId:(id)a8 status:(signed __int16)a9 statusLastUpdatedDate:(id)a10 summary:(id)a11 type:(signed __int16)a12
{
  v56 = self;
  uint64_t v57 = a6;
  int v55 = a3;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v16 - 8);
  v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    id v19 = a5;
    id v20 = a7;
    id v21 = a8;
    id v22 = a10;
    id v23 = a11;
    id v24 = a4;
    uint64_t v25 = sub_1A709D198();
    unint64_t v53 = v26;
    uint64_t v54 = v25;

    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v36 = a5;
    id v37 = a7;
    id v38 = a8;
    id v39 = a10;
    id v40 = a11;
    unint64_t v53 = 0xF000000000000000;
    uint64_t v54 = 0;
    if (a5)
    {
LABEL_3:
      uint64_t v27 = sub_1A709D438();
      uint64_t v51 = v28;
      uint64_t v52 = v27;

      if (a7) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  if (a7)
  {
LABEL_4:
    uint64_t v29 = sub_1A709D198();
    unint64_t v31 = v30;

    if (a8) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v32 = 0;
    uint64_t v34 = 0;
    if (a10) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v29 = 0;
  unint64_t v31 = 0xF000000000000000;
  if (!a8) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v32 = sub_1A709D438();
  uint64_t v34 = v33;

  if (a10)
  {
LABEL_6:
    sub_1A709D1D8();

    uint64_t v35 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v18, 0, 1, v35);
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v41 = sub_1A709D1F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v41 - 8) + 56))(v18, 1, 1, v41);
LABEL_12:
  if (a11)
  {
    uint64_t v42 = sub_1A709D438();
    uint64_t v44 = v43;
  }
  else
  {
    uint64_t v42 = 0;
    uint64_t v44 = 0;
  }
  uint64_t v49 = (uint64_t)v18;
  unint64_t v46 = v53;
  uint64_t v45 = v54;
  v47 = (MSRAPRecord *)sub_1A6F0E2F4(v55, v54, v53, v52, v51, v57, v29, v31, v32, v34, a9, v49, v42, v44, a12);
  sub_1A6EEF5F4(v29, v31);
  sub_1A6EEF5F4(v45, v46);
  return v47;
}

- (MSRAPRecord)initWithStore:(id)a3 clientRevision:(signed __int16)a4 contentData:(id)a5 countryCode:(id)a6 positionIndex:(int64_t)a7 rapResponse:(id)a8 reportId:(id)a9 status:(signed __int16)a10 statusLastUpdatedDate:(id)a11 summary:(id)a12 type:(signed __int16)a13
{
  int v55 = self;
  uint64_t v56 = a7;
  int v54 = a4;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v17 - 8);
  id v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v53 = a3;
  if (a5)
  {
    id v20 = a3;
    id v21 = a6;
    id v22 = a8;
    id v23 = a9;
    id v24 = a11;
    id v25 = a12;
    id v26 = a5;
    uint64_t v27 = sub_1A709D198();
    unint64_t v51 = v28;
    uint64_t v52 = v27;

    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v38 = a3;
    id v39 = a6;
    id v40 = a8;
    id v41 = a9;
    id v42 = a11;
    id v43 = a12;
    unint64_t v51 = 0xF000000000000000;
    uint64_t v52 = 0;
    if (a6)
    {
LABEL_3:
      uint64_t v29 = sub_1A709D438();
      uint64_t v49 = v30;
      uint64_t v50 = v29;

      if (a8) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  if (a8)
  {
LABEL_4:
    uint64_t v31 = sub_1A709D198();
    unint64_t v33 = v32;

    if (a9) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v34 = 0;
    uint64_t v36 = 0;
    if (a11) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v31 = 0;
  unint64_t v33 = 0xF000000000000000;
  if (!a9) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v34 = sub_1A709D438();
  uint64_t v36 = v35;

  if (a11)
  {
LABEL_6:
    sub_1A709D1D8();

    uint64_t v37 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v19, 0, 1, v37);
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v44 = sub_1A709D1F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v19, 1, 1, v44);
LABEL_12:
  if (a12)
  {
    uint64_t v45 = sub_1A709D438();
    uint64_t v47 = v46;
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v47 = 0;
  }
  return (MSRAPRecord *)RAPRecord.init(store:clientRevision:contentData:countryCode:positionIndex:rapResponse:reportId:status:statusLastUpdatedDate:summary:type:)(v53, v54, v52, v51, v50, v49, v56, v31, v33, v34, v36, a10, (uint64_t)v19, v45, v47, a13);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedRAPRecord();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6F09DE4(v6, a4);
}

- (signed)clientRevision
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSRAPRecord__clientRevision);
}

- (void)setClientRevision:(signed __int16)a3
{
  v4 = self;
  sub_1A6F0A338(a3);
}

- (NSData)contentData
{
  return (NSData *)sub_1A6F0B18C(self, (uint64_t)a2, sub_1A6F0A59C);
}

- (void)setContentData:(id)a3
{
}

- (NSString)countryCode
{
  return (NSString *)sub_1A6F0B9C0(self, (uint64_t)a2, (void (*)(void))sub_1A6F0A9C4);
}

- (void)setCountryCode:(id)a3
{
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSRAPRecord__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A6F0AEC8(a3);
}

- (NSData)rapResponse
{
  return (NSData *)sub_1A6F0B18C(self, (uint64_t)a2, sub_1A6F0B218);
}

- (void)setRapResponse:(id)a3
{
}

- (NSString)reportId
{
  return (NSString *)sub_1A6F0B9C0(self, (uint64_t)a2, (void (*)(void))sub_1A6F0BA40);
}

- (void)setReportId:(id)a3
{
}

- (signed)status
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSRAPRecord__status);
}

- (void)setStatus:(signed __int16)a3
{
  int64_t v4 = self;
  sub_1A6F0BE98(a3);
}

- (NSDate)statusLastUpdatedDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = self;
  sub_1A6F0C208((uint64_t)v5);

  uint64_t v7 = sub_1A709D1F8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A709D1B8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setStatusLastUpdatedDate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1A709D1D8();
    uint64_t v8 = sub_1A709D1F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1A709D1F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_1A6F0C794((uint64_t)v7);
}

- (NSString)summary
{
  return (NSString *)sub_1A6F0B9C0(self, (uint64_t)a2, (void (*)(void))sub_1A6F0D020);
}

- (void)setSummary:(id)a3
{
}

- (signed)type
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSRAPRecord__type);
}

- (void)setType:(signed __int16)a3
{
  uint64_t v4 = self;
  sub_1A6F0D880(a3);
}

- (MSCommunityID)communityID
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6F0DB80();

  return (MSCommunityID *)v3;
}

- (void)setCommunityID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1A6F0DE28(a3);
}

- (MSRAPRecord)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSRAPRecord *)sub_1A6F0E010(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSRAPRecord__contentData), *(void *)&self->super._store[OBJC_IVAR___MSRAPRecord__contentData]);
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___MSRAPRecord__rapResponse), *(void *)&self->super._store[OBJC_IVAR___MSRAPRecord__rapResponse]);
  swift_bridgeObjectRelease();
  sub_1A6F0E5CC((uint64_t)self + OBJC_IVAR___MSRAPRecord__statusLastUpdatedDate);
  swift_bridgeObjectRelease();
}

@end