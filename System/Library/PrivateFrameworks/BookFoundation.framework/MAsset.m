@interface MAsset
- (BFMSeries)seriesResource;
- (BOOL)hasSupplementalContent;
- (BOOL)isAudiobook;
- (BOOL)isBook;
- (BOOL)isExplicit;
- (BOOL)isPreorder;
- (BOOL)isSG;
- (BOOL)pagesAreRTL;
- (BOOL)supportsUnifiedProductPage;
- (NSArray)genres;
- (NSDate)expectedReleaseDate;
- (NSDate)releaseDate;
- (NSDecimalNumber)sequenceNumber;
- (NSDictionary)offer;
- (NSNumber)height;
- (NSNumber)price;
- (NSNumber)width;
- (NSString)artistName;
- (NSString)artworkURL;
- (NSString)buyParams;
- (NSString)contentRating;
- (NSString)editionKind;
- (NSString)genreName;
- (NSString)name;
- (NSString)pageProgressionDirection;
- (NSString)priceFormatted;
- (NSString)sequenceDisplayLabel;
- (NSString)seriesName;
- (NSString)standardDescription;
- (NSString)standardNotes;
- (NSString)version;
- (NSURL)bookSampleDownloadURL;
- (NSURL)previewURL;
- (NSURL)url;
- (double)averageRating;
- (int64_t)fileSize;
- (unint64_t)ratingCount;
- (unint64_t)ratingCountForAnalytics;
@end

@implementation MAsset

- (NSString)artistName
{
  return (NSString *)sub_228974E88();
}

- (NSString)name
{
  return (NSString *)sub_228974E88();
}

- (NSURL)url
{
  v2 = (void *)sub_2289DE820();

  return (NSURL *)v2;
}

- (BOOL)isBook
{
  void (*v3)(uint64_t *__return_ptr);
  _TtC14BookFoundation6MAsset *v4;
  int v5;
  uint64_t v7;

  v3 = *(void (**)(uint64_t *__return_ptr))(swift_getObjectType() + 136);
  v4 = self;
  v3(&v7);
  v5 = v7;

  return v5 == 3;
}

- (BOOL)isAudiobook
{
  void (*v3)(uint64_t *__return_ptr);
  _TtC14BookFoundation6MAsset *v4;
  int v5;
  uint64_t v7;

  v3 = *(void (**)(uint64_t *__return_ptr))(swift_getObjectType() + 136);
  v4 = self;
  v3(&v7);
  v5 = v7;

  return v5 == 0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14BookFoundation6MAsset_url;
  uint64_t v4 = sub_2289DE880();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (NSString)seriesName
{
  return (NSString *)sub_228976408(self);
}

- (NSString)sequenceDisplayLabel
{
  return (NSString *)sub_228976408(self);
}

- (NSString)contentRating
{
  return (NSString *)sub_2289778D8(self);
}

- (BOOL)isExplicit
{
  v2 = self;
  v3 = [(MAsset *)v2 contentRating];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_2289DEBC0();
    uint64_t v7 = v6;

    if (v5 == 0x746963696C707865 && v7 == 0xE800000000000000)
    {

      swift_bridgeObjectRelease();
      char v9 = 1;
    }
    else
    {
      char v9 = sub_2289DF480();

      swift_bridgeObjectRelease();
    }
  }
  else
  {

    char v9 = 0;
  }
  return v9 & 1;
}

- (NSString)editionKind
{
  return (NSString *)sub_2289778D8(self);
}

- (NSString)genreName
{
  return (NSString *)sub_228979B7C(self, (uint64_t)a2, (void (*)(void))MAsset.genreName.getter);
}

- (NSString)buyParams
{
  return (NSString *)sub_228979B7C(self, (uint64_t)a2, (void (*)(void))MAsset.buyParams.getter);
}

- (NSDate)releaseDate
{
  swift_getObjectType();
  uint64_t v3 = sub_228952BB0(&qword_26AECF7E0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13[15] = 21;
  uint64_t v6 = self;
  uint64_t v7 = sub_2289D49E0(0);
  sub_22897B7A0();
  sub_2289B3B60(v7, MEMORY[0x263F8D310], (uint64_t)v14);
  swift_bridgeObjectRelease();
  if (v14[1])
  {
    sub_2289771A4(v14[0], 1, v5);
  }
  else
  {
    uint64_t v8 = sub_2289DE910();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  }

  uint64_t v9 = sub_2289DE910();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) != 1)
  {
    v11 = (void *)sub_2289DE8C0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
  }

  return (NSDate *)v11;
}

- (BOOL)hasSupplementalContent
{
  return sub_228977AFC(self, (uint64_t)a2, 12);
}

- (BOOL)isSG
{
  return sub_228977AFC(self, (uint64_t)a2, 14);
}

- (NSURL)bookSampleDownloadURL
{
  return (NSURL *)sub_228979268(self, (uint64_t)a2, &qword_2682841E0, (void (*)(void))MAsset.bookSampleDownloadURL.getter, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (NSString)pageProgressionDirection
{
  return (NSString *)sub_2289778D8(self);
}

- (BOOL)pagesAreRTL
{
  v2 = self;
  uint64_t v3 = [(MAsset *)v2 pageProgressionDirection];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = sub_2289DEBC0();
    uint64_t v7 = v6;

    if (v5 == 7107698 && v7 == 0xE300000000000000)
    {

      swift_bridgeObjectRelease();
      char v9 = 1;
    }
    else
    {
      char v9 = sub_2289DF480();

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    char v9 = _s14BookFoundation23LocaleLanguageDirectionV5isRTLSbvgZ_0();
  }
  return v9 & 1;
}

- (NSString)version
{
  return (NSString *)sub_2289778D8(self);
}

- (BOOL)supportsUnifiedProductPage
{
  return sub_228977AFC(self, (uint64_t)a2, 23);
}

- (double)averageRating
{
  v2 = self;
  double v3 = MAsset.averageRating.getter();

  return v3;
}

- (unint64_t)ratingCount
{
  v2 = self;
  unint64_t v3 = MAsset.ratingCount.getter();

  return v3;
}

- (unint64_t)ratingCountForAnalytics
{
  v2 = self;
  unint64_t v3 = MAsset.ratingCountForAnalytics.getter();

  return v3;
}

- (NSString)standardNotes
{
  return (NSString *)sub_228979B7C(self, (uint64_t)a2, (void (*)(void))MAsset.standardNotes.getter);
}

- (NSString)standardDescription
{
  return (NSString *)sub_228979B7C(self, (uint64_t)a2, (void (*)(void))MAsset.standardDescription.getter);
}

- (NSDate)expectedReleaseDate
{
  return (NSDate *)sub_228979268(self, (uint64_t)a2, &qword_26AECF7E0, (void (*)(void))MAsset.expectedReleaseDate.getter, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (int64_t)fileSize
{
  swift_getObjectType();
  unint64_t v3 = self;
  uint64_t v4 = sub_228979080();
  sub_22897C044();
  sub_2289B3B60(v4, MEMORY[0x263F8E5C0], (uint64_t)&v6);

  swift_bridgeObjectRelease();
  if (v7) {
    return 0;
  }
  else {
    return v6;
  }
}

- (NSDictionary)offer
{
  v2 = self;
  uint64_t v3 = MAsset.offer.getter();

  if (v3)
  {
    uint64_t v4 = (void *)sub_2289DEA70();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (BOOL)isPreorder
{
  v2 = self;
  char v3 = MAsset.isPreorder.getter();

  return v3 & 1;
}

- (NSString)priceFormatted
{
  return (NSString *)sub_228979B7C(self, (uint64_t)a2, (void (*)(void))MAsset.priceFormatted.getter);
}

- (NSURL)previewURL
{
  swift_getObjectType();
  uint64_t v3 = sub_228952BB0(&qword_2682841E0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = self;
  uint64_t v7 = MAsset.preview.getter();
  sub_22897C098();
  sub_2289B3B60(v7, MEMORY[0x263F8D310], (uint64_t)v13);
  swift_bridgeObjectRelease();
  if (v13[1])
  {
    sub_2289DE860();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = sub_2289DE880();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  }
  uint64_t v9 = sub_2289DE880();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) != 1)
  {
    v11 = (void *)sub_2289DE820();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v5, v9);
  }

  return (NSURL *)v11;
}

- (NSString)artworkURL
{
  swift_getObjectType();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14BookFoundation6MAsset_artwork);
  sub_22897C0EC();
  uint64_t v4 = self;
  sub_2289B3B60(v3, MEMORY[0x263F8D310], (uint64_t)v7);

  if (v7[1])
  {
    uint64_t v5 = (void *)sub_2289DEB90();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (NSDecimalNumber)sequenceNumber
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.isa) + 0x140);
  uint64_t v3 = self;
  uint64_t v4 = v2();
  sub_22897BAAC(1, v4);
  uint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 0x100000000) != 0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (void *)sub_2289DF100();
  }

  return (NSDecimalNumber *)v7;
}

- (NSArray)genres
{
  v2 = self;
  unint64_t v3 = sub_22896BAE0(@"genres");
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    sub_2289817C8(v3);

    swift_bridgeObjectRelease();
    sub_228952BB0((uint64_t *)&unk_268284B10);
    uint64_t v4 = (void *)sub_2289DEE10();
    swift_bridgeObjectRelease();
  }
  else
  {
  }

  return (NSArray *)v4;
}

- (NSNumber)price
{
  v2 = self;
  unint64_t v3 = (void *)MAsset.__price.getter();

  return (NSNumber *)v3;
}

- (NSNumber)width
{
  return (NSNumber *)sub_2289B0454((char *)self, (uint64_t)a2, 2);
}

- (NSNumber)height
{
  return (NSNumber *)sub_2289B0454((char *)self, (uint64_t)a2, 0);
}

- (BFMSeries)seriesResource
{
  v2 = self;
  unint64_t v3 = (void *)MAsset.__seriesResource.getter();

  return (BFMSeries *)v3;
}

@end