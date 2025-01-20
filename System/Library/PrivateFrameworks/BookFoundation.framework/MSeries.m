@interface MSeries
- (BOOL)hasUniqueAuthors;
- (BOOL)isAudiobookSeries;
- (BOOL)isBookSeries;
- (BOOL)isExplicit;
- (BOOL)isOrdered;
- (NSArray)assets;
- (NSArray)authorNames;
- (NSArray)genres;
- (NSNumber)authorCount;
- (NSString)name;
- (NSURL)url;
@end

@implementation MSeries

- (NSNumber)authorCount
{
  v2 = self;
  MSeries.authorCount.getter();
  if (v3) {
    v4 = 0;
  }
  else {
    v4 = (void *)sub_2289DEFA0();
  }

  return (NSNumber *)v4;
}

- (NSArray)assets
{
  v2 = self;
  if (MSeries.assetsResourceSet.getter() && (unint64_t v3 = sub_2289D4810(), swift_release(), v3))
  {
    sub_2289817D4(v3, (uint64_t *)&unk_268284580);

    swift_bridgeObjectRelease();
    sub_228952BB0((uint64_t *)&unk_268284580);
    v4 = (void *)sub_2289DEE10();
    swift_bridgeObjectRelease();
  }
  else
  {

    v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSArray)genres
{
  v2 = self;
  unint64_t v3 = sub_22896BAE0(@"genres");
  v4 = (void *)v3;
  if (v3)
  {
    sub_2289817D4(v3, (uint64_t *)&unk_268284B10);

    swift_bridgeObjectRelease();
    sub_228952BB0((uint64_t *)&unk_268284B10);
    v4 = (void *)sub_2289DEE10();
    swift_bridgeObjectRelease();
  }
  else
  {
  }

  return (NSArray *)v4;
}

- (BOOL)hasUniqueAuthors
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC14BookFoundation7MSeries_hasUniqueAuthors);
}

- (BOOL)isOrdered
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC14BookFoundation7MSeries_isOrdered);
}

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2289DEB90();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSURL)url
{
  v2 = (void *)sub_2289DE820();

  return (NSURL *)v2;
}

- (BOOL)isBookSeries
{
  void (*v3)(uint64_t *__return_ptr);
  _TtC14BookFoundation7MSeries *v4;
  int v5;
  uint64_t v7;

  unint64_t v3 = *(void (**)(uint64_t *__return_ptr))(swift_getObjectType() + 136);
  v4 = self;
  v3(&v7);
  v5 = v7;

  return v5 == 4;
}

- (BOOL)isAudiobookSeries
{
  void (*v3)(uint64_t *__return_ptr);
  _TtC14BookFoundation7MSeries *v4;
  int v5;
  uint64_t v7;

  unint64_t v3 = *(void (**)(uint64_t *__return_ptr))(swift_getObjectType() + 136);
  v4 = self;
  v3(&v7);
  v5 = v7;

  return v5 == 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  unint64_t v3 = (char *)self + OBJC_IVAR____TtC14BookFoundation7MSeries_url;
  uint64_t v4 = sub_2289DE880();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (BOOL)isExplicit
{
  v2 = self;
  char v3 = MSeries.isExplicit.getter();

  return v3 & 1;
}

- (NSArray)authorNames
{
  v2 = self;
  uint64_t v3 = MSeries.authorNames.getter();

  if (v3)
  {
    uint64_t v4 = (void *)sub_2289DEE10();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSArray *)v4;
}

@end