@interface MRUArtworkBackdropDataSource
- (BOOL)hasLoadedBackdropImageFor:(id)a3;
- (MRUArtworkBackdropDataSource)init;
- (id)backdropImageWithKey:(id)a3;
- (void)addObserver:(id)a3;
- (void)cleanUpWithKey:(id)a3;
- (void)loadBackdropImageWithArtworkImage:(id)a3 backdropSize:(CGSize)a4 key:(id)a5;
- (void)loadBackdropImageWithArtworkImage:(id)a3 backdropSize:(CGSize)a4 key:(id)a5 overrideLoadedImage:(BOOL)a6;
- (void)removeObserver:(id)a3;
@end

@implementation MRUArtworkBackdropDataSource

- (void)addObserver:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  ArtworkBackdropDataSource.addObserver(_:)();
  swift_unknownObjectRelease();
}

- (void)removeObserver:(id)a3
{
  v5 = (unint64_t *)((char *)self + OBJC_IVAR___MRUArtworkBackdropDataSource_observers);
  swift_beginAccess();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1AE8FC490(v5, (uint64_t)a3);
  uint64_t v8 = v7;
  if (*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1AE9477C8();
    swift_bridgeObjectRelease();
    if (v9 >= v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9 >= v7)
    {
LABEL_3:
      sub_1AE923B78(v8, v9);
      swift_endAccess();
      swift_unknownObjectRelease();

      return;
    }
  }
  __break(1u);
}

- (id)backdropImageWithKey:(id)a3
{
  sub_1AE947618();
  v4 = self;
  v5 = ArtworkBackdropDataSource.backdropImage(key:)((uint64_t)v7);

  sub_1AE923F38((uint64_t)v7);

  return v5;
}

- (BOOL)hasLoadedBackdropImageFor:(id)a3
{
  sub_1AE947618();
  v4 = (uint64_t *)((char *)self + OBJC_IVAR___MRUArtworkBackdropDataSource_loadedBackdropImageKeys);
  swift_beginAccess();
  uint64_t v5 = *v4;
  v6 = self;
  swift_bridgeObjectRetain();
  char v7 = sub_1AE91D8AC((uint64_t)v9, v5);

  swift_bridgeObjectRelease();
  sub_1AE923F38((uint64_t)v9);
  return v7 & 1;
}

- (void)cleanUpWithKey:(id)a3
{
  sub_1AE947618();
  v4 = self;
  ArtworkBackdropDataSource.cleanUp(key:)((uint64_t)v5);

  sub_1AE923F38((uint64_t)v5);
}

- (void)loadBackdropImageWithArtworkImage:(id)a3 backdropSize:(CGSize)a4 key:(id)a5 overrideLoadedImage:(BOOL)a6
{
  double height = a4.height;
  double width = a4.width;
  sub_1AE947618();
  id v10 = a3;
  v11 = self;
  _s13MediaControls25ArtworkBackdropDataSourceC04loadD5Image07artworkH012backdropSize3key014overrideLoadedH0ySo7UIImageCSg_So6CGSizeVs11AnyHashableVSbtF_0(a3, (uint64_t)v12, width, height);

  sub_1AE923F38((uint64_t)v12);
}

- (void)loadBackdropImageWithArtworkImage:(id)a3 backdropSize:(CGSize)a4 key:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  sub_1AE947618();
  uint64_t v9 = *(void (**)(id, unsigned char *, void, double, double))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa)
                                                                  + 0x120);
  id v10 = a3;
  v11 = self;
  v9(a3, v12, 0, width, height);

  sub_1AE923F38((uint64_t)v12);
}

- (MRUArtworkBackdropDataSource)init
{
  v2 = (objc_class *)MEMORY[0x1E4FBC868];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_backdropImages) = (Class)MEMORY[0x1E4FBC868];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_loadedArtworkImages) = v2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_loadBackdropImageTasks) = v2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_loadedBackdropImageKeys) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRUArtworkBackdropDataSource_observers) = (Class)MEMORY[0x1E4FBC860];
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ArtworkBackdropDataSource();
  return [(MRUArtworkBackdropDataSource *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end