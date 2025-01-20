@interface IMRichCard
- (BOOL)isEqual:(id)a3;
- (IMChipList)chipList;
- (IMRichCard)init;
- (IMRichCard)initWithDictionary:(id)a3;
- (IMRichCard)initWithLayout:(id)a3 media:(id)a4 title:(id)a5 cardDescription:(id)a6 chipList:(id)a7;
- (IMRichCardLayout)layout;
- (IMRichCardMedia)media;
- (IMUrlToTransferMap)urlToTransferMap;
- (NSString)cardDescription;
- (NSString)title;
- (id)copyWithZone:(void *)a3;
- (id)dictionaryRepresentation;
- (void)setUrlToTransferMap:(id)a3;
- (void)updateUrlToTransferMap:(id)a3;
@end

@implementation IMRichCard

- (IMRichCardLayout)layout
{
  return (IMRichCardLayout *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___IMRichCard_layout));
}

- (IMRichCardMedia)media
{
  return (IMRichCardMedia *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___IMRichCard_media));
}

- (NSString)title
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCard_title);
}

- (NSString)cardDescription
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCard_cardDescription);
}

- (IMChipList)chipList
{
  return (IMChipList *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___IMRichCard_chipList));
}

- (IMUrlToTransferMap)urlToTransferMap
{
  return (IMUrlToTransferMap *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___IMRichCard_urlToTransferMap));
}

- (void)setUrlToTransferMap:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_urlToTransferMap);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_urlToTransferMap) = (Class)a3;
  id v3 = a3;
}

- (IMRichCard)initWithLayout:(id)a3 media:(id)a4 title:(id)a5 cardDescription:(id)a6 chipList:(id)a7
{
  if (!a5)
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = sub_1A09F3E18();
  uint64_t v14 = v13;
  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v15 = sub_1A09F3E18();
LABEL_6:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_urlToTransferMap) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_layout) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_media) = (Class)a4;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCard_title);
  uint64_t *v17 = v12;
  v17[1] = v14;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCard_cardDescription);
  uint64_t *v18 = v15;
  v18[1] = v16;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_chipList) = (Class)a7;
  v23.receiver = self;
  v23.super_class = (Class)IMRichCard;
  id v19 = a3;
  id v20 = a4;
  id v21 = a7;
  return [(IMRichCard *)&v23 init];
}

- (IMRichCard)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMRichCard *)IMRichCard.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A08D87C4();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (void)updateUrlToTransferMap:(id)a3
{
  id v4 = (IMUrlToTransferMap *)a3;
  v5 = self;
  IMRichCard.update(urlToTransferMap:)(v4);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  sub_1A08D8F14(v6);

  sub_1A086F45C(v6, v6[3]);
  id v4 = (void *)sub_1A09F4B18();
  _s17IMSharedUtilities29RemoteIntentBroadcastEncodingVwxx_0((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = IMRichCard.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCard)init
{
  result = (IMRichCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCard_urlToTransferMap);
}

@end