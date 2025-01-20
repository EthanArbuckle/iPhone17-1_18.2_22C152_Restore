@interface GDVUContext
- (GDVUContext)init;
- (NSUUID)asset;
- (NSUUID)moment;
- (int64_t)source;
- (void)setAsset:(id)a3;
- (void)setMoment:(id)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation GDVUContext

- (GDVUContext)init
{
  return (GDVUContext *)sub_1B2E2BCD0();
}

- (NSUUID)moment
{
  return (NSUUID *)sub_1B2E2F04C(self, (uint64_t)a2, (void (*)(void))GDVUContext.moment.getter);
}

- (void)setMoment:(id)a3
{
}

- (NSUUID)asset
{
  return (NSUUID *)sub_1B2E2F04C(self, (uint64_t)a2, (void (*)(void))GDVUContext.asset.getter);
}

- (void)setAsset:(id)a3
{
}

- (int64_t)source
{
  return GDVUContext.source.getter();
}

- (void)setSource:(int64_t)a3
{
  v4 = self;
  GDVUContext.source.setter(a3);
}

- (void).cxx_destruct
{
}

@end