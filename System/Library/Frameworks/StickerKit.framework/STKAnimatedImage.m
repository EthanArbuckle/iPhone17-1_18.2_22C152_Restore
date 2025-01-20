@interface STKAnimatedImage
- (STKAnimatedImage)init;
- (STKAnimatedImage)initWithData:(id)a3 maxCount:(int64_t)a4 maxDimension:(double)a5 identifier:(id)a6;
- (STKAnimatedImage)initWithImages:(id)a3 durations:(id)a4 identifier:(id)a5;
- (STKAnimatedImage)initWithURL:(id)a3 maxCount:(int64_t)a4 maxDimension:(double)a5 identifier:(id)a6;
@end

@implementation STKAnimatedImage

- (STKAnimatedImage)initWithData:(id)a3 maxCount:(int64_t)a4 maxDimension:(double)a5 identifier:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = sub_2453FCBE8();
  unint64_t v13 = v12;

  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v14 - 8);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v10)
  {
    sub_2453FCC98();

    uint64_t v17 = sub_2453FCCB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_2453FCCB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  v19 = (STKAnimatedImage *)sub_24522796C(a5, v11, v13, a4, (uint64_t)v16);
  sub_24520E508(v11, v13);
  return v19;
}

- (STKAnimatedImage)initWithImages:(id)a3 durations:(id)a4 identifier:(id)a5
{
  sub_245203D98(0, &qword_268ECFF08);
  unint64_t v6 = sub_2453FFD18();
  sub_245203D98(0, (unint64_t *)&qword_268ECEE88);
  unint64_t v7 = sub_2453FFD18();
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_2453FCC98();
    uint64_t v11 = sub_2453FCCB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = sub_2453FCCB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  return (STKAnimatedImage *)AnimatedImage.init(images:durations:identifier:)(v6, v7, (uint64_t)v10);
}

- (STKAnimatedImage)initWithURL:(id)a3 maxCount:(int64_t)a4 maxDimension:(double)a5 identifier:(id)a6
{
  uint64_t v9 = sub_2453FCBA8();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCB38();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268ECEC40);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    sub_2453FCC98();
    uint64_t v15 = sub_2453FCCB8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_2453FCCB8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  return (STKAnimatedImage *)AnimatedImage.init(url:maxCount:maxDimension:identifier:)((uint64_t)v11, a4, (uint64_t)v14, a5);
}

- (STKAnimatedImage)init
{
  result = (STKAnimatedImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___STKAnimatedImage_identifier;

  sub_245212E2C((uint64_t)v3);
}

@end