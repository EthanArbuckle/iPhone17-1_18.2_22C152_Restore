@interface ArtworkLoader
- (void)imageRequest:(id)a3 didFailWithError:(id)a4;
- (void)imageRequest:(id)a3 didLoadImage:(id)a4;
- (void)resourceLoaderDidBeginLoading;
- (void)resourceLoaderDidBeginLoadingForReason:(id)a3;
- (void)resourceLoaderDidFinishLoadingForReason:(id)a3;
- (void)resourceLoaderDidIdle;
- (void)resourceLoaderDidLoadAllForReason:(id)a3;
@end

@implementation ArtworkLoader

- (void)imageRequest:(id)a3 didLoadImage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_1E1D1DDB0(v5, a4, 0);

  swift_release();
}

- (void)imageRequest:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  ArtworkLoader.imageRequest(_:didFailWithError:)(v5, v6);

  swift_release();
}

- (void)resourceLoaderDidBeginLoading
{
  v3 = &self->assetObserver[7];
  swift_beginAccess();
  if (MEMORY[0x1E4E54870](v3))
  {
    uint64_t v4 = *(void *)&self->assetObserver[15];
    uint64_t ObjectType = swift_getObjectType();
    id v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    swift_retain();
    v6(ObjectType, v4);
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)resourceLoaderDidLoadAllForReason:(id)a3
{
  uint64_t v4 = sub_1E1D56898();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E1D56848();
  swift_retain();
  if (sub_1E1D20EB8() && (swift_beginAccess(), MEMORY[0x1E4E54870](&self->assetObserver[7])))
  {
    uint64_t v8 = *(void *)&self->assetObserver[15];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(ObjectType, v8);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)resourceLoaderDidIdle
{
  v3 = &self->assetObserver[7];
  swift_beginAccess();
  if (MEMORY[0x1E4E54870](v3))
  {
    uint64_t v4 = *(void *)&self->assetObserver[15];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 24);
    swift_retain();
    v6(ObjectType, v4);
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)resourceLoaderDidBeginLoadingForReason:(id)a3
{
}

- (void)resourceLoaderDidFinishLoadingForReason:(id)a3
{
}

@end