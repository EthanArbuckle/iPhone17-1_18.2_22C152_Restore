@interface STKImageGlyphDataSource
+ (STKImageGlyphDataSource)sharedInstance;
- (BOOL)canShowEmoji;
- (BOOL)canShowMemoji;
- (BOOL)canShowStickers;
- (BOOL)isEmojiSection:(int64_t)a3;
- (BOOL)isMemojiSection:(int64_t)a3;
- (BOOL)isRecentSection:(int64_t)a3;
- (BOOL)isStickerSection:(int64_t)a3;
- (NSDiffableDataSourceSnapshot)snapshot;
- (STKImageGlyphDataSource)init;
- (STKImageGlyphDataSource)initWithDataSources:(id)a3;
- (id)imageGlyphCompositionalLayout;
- (id)indexPathForCategoryIndex:(int64_t)a3;
- (int64_t)emojiCategoryIndex;
- (int64_t)emojiPrefixSectionCount;
- (int64_t)memojiCategoryIndex;
- (int64_t)recentCategoryIndex;
- (int64_t)stickersCategoryIndex;
- (void)configureWith:(id)a3;
- (void)dealloc;
- (void)donateImageGlyphToRecents:(id)a3;
- (void)makeSnapshot;
- (void)refresh;
- (void)setSnapshot:(id)a3;
@end

@implementation STKImageGlyphDataSource

+ (STKImageGlyphDataSource)sharedInstance
{
  if (qword_268ECECB8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_268ECECB0;

  return (STKImageGlyphDataSource *)v2;
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECED80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = *(os_unfair_lock_s **)((char *)&self->super.super.isa + OBJC_IVAR___STKImageGlyphDataSource_lock);
  v16 = self;
  v13 = sub_245373DF4;
  v14 = &v15;
  v8 = v7 + 4;
  v9 = self;
  os_unfair_lock_lock(v8);
  sub_245373E14();
  os_unfair_lock_unlock(v8);

  v10 = (void *)sub_2453FDE88();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSDiffableDataSourceSnapshot *)v10;
}

- (void)setSnapshot:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECED80);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (uint8_t *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245203D98(0, (unint64_t *)&qword_268ECEE88);
  sub_245372E4C();
  sub_2453FDE98();
  v7 = self;
  sub_24536BA28(v6);
}

- (STKImageGlyphDataSource)init
{
  return (STKImageGlyphDataSource *)ImageGlyphDataSource.init()();
}

- (void)dealloc
{
  v2 = self;
  ImageGlyphDataSource.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___STKImageGlyphDataSource__currentSnapshot;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECED80);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)configureWith:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_24536CAAC((uint64_t)v5);
}

- (void)refresh
{
  uint64_t v2 = qword_268ECECF0;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  qword_268EE2EF0 = (uint64_t)sub_2453AB524();
  swift_bridgeObjectRelease();
  sub_24524B748();
  if (qword_268ECF428 != -1) {
    swift_once();
  }
  sub_24539D400();
}

- (BOOL)canShowMemoji
{
  return sub_24536D230(self, (uint64_t)a2, (char **)2);
}

- (BOOL)canShowStickers
{
  return sub_24536D230(self, (uint64_t)a2, (char **)1);
}

- (BOOL)canShowEmoji
{
  return sub_24536D230(self, (uint64_t)a2, (char **)1);
}

- (int64_t)memojiCategoryIndex
{
  uint64_t v2 = self;
  sub_24536D31C();
  int64_t v4 = v3;

  return v4;
}

- (int64_t)stickersCategoryIndex
{
  uint64_t v2 = self;
  sub_24536D49C();
  int64_t v4 = v3;

  return v4;
}

- (int64_t)recentCategoryIndex
{
  uint64_t v2 = self;
  sub_24536D61C();
  int64_t v4 = v3;

  return v4;
}

- (int64_t)emojiCategoryIndex
{
  uint64_t v2 = self;
  sub_24536D79C();
  int64_t v4 = v3;

  return v4;
}

- (int64_t)emojiPrefixSectionCount
{
  uint64_t v2 = self;
  unint64_t v3 = sub_245251B08((char **)3);
  int64_t v5 = v4;

  if (!v3) {
    return 0;
  }
  swift_unknownObjectRelease();
  return v5;
}

- (BOOL)isEmojiSection:(int64_t)a3
{
  int64_t v4 = self;
  LOBYTE(a3) = sub_24536D980(a3);

  return a3 & 1;
}

- (BOOL)isRecentSection:(int64_t)a3
{
  int64_t v4 = self;
  LOBYTE(a3) = sub_24536DAFC(a3);

  return a3 & 1;
}

- (BOOL)isMemojiSection:(int64_t)a3
{
  int64_t v4 = self;
  LOBYTE(a3) = sub_24536DC78(a3);

  return a3 & 1;
}

- (BOOL)isStickerSection:(int64_t)a3
{
  int64_t v4 = self;
  LOBYTE(a3) = sub_24536DDF4(a3);

  return a3 & 1;
}

- (id)indexPathForCategoryIndex:(int64_t)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268ECEC80);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = self;
  sub_24536DF70(a3, (uint64_t)v7);

  uint64_t v9 = sub_2453FCDC8();
  uint64_t v10 = *(void *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) != 1)
  {
    v11 = (void *)sub_2453FCD58();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
  }

  return v11;
}

- (void)makeSnapshot
{
  uint64_t v2 = self;
  sub_24536E2C0();
}

- (void)donateImageGlyphToRecents:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(qword_26B0D60C0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2453FFE78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = a3;
  id v10 = a3;
  v11 = self;
  sub_2451F0A50((uint64_t)v7, (uint64_t)&unk_268ED5020, (uint64_t)v9);
  swift_release();
  sub_245203CD8((uint64_t)v7, qword_26B0D60C0);
}

- (id)imageGlyphCompositionalLayout
{
  uint64_t v2 = self;
  id v3 = sub_2453729C0();

  return v3;
}

- (STKImageGlyphDataSource)initWithDataSources:(id)a3
{
  result = (STKImageGlyphDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end