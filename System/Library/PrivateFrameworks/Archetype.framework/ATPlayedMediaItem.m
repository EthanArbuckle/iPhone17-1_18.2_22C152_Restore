@interface ATPlayedMediaItem
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9Archetype17ATPlayedMediaItem)init;
- (_TtC9Archetype17ATPlayedMediaItem)initWithCoder:(id)a3;
- (_TtC9Archetype17ATPlayedMediaItem)initWithTitle:(id)a3 artist:(id)a4 album:(id)a5 link:(id)a6 bundleID:(id)a7 mediaType:(id)a8 playTime:(double)a9;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATPlayedMediaItem

+ (BOOL)supportsSecureCoding
{
  return byte_26931CF92;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26931CF92 = a3;
}

- (_TtC9Archetype17ATPlayedMediaItem)initWithTitle:(id)a3 artist:(id)a4 album:(id)a5 link:(id)a6 bundleID:(id)a7 mediaType:(id)a8 playTime:(double)a9
{
  uint64_t v34 = sub_24867FD18();
  uint64_t v12 = v11;
  uint64_t v13 = sub_24867FD18();
  uint64_t v15 = v14;
  uint64_t v16 = sub_24867FD18();
  uint64_t v18 = v17;
  uint64_t v19 = sub_24867FD18();
  uint64_t v21 = v20;
  uint64_t v22 = sub_24867FD18();
  uint64_t v24 = v23;
  uint64_t v25 = sub_24867FD18();
  v26 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_title);
  uint64_t *v26 = v34;
  v26[1] = v12;
  v27 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_artist);
  uint64_t *v27 = v13;
  v27[1] = v15;
  v28 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_album);
  uint64_t *v28 = v16;
  v28[1] = v18;
  v29 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_link);
  uint64_t *v29 = v19;
  v29[1] = v21;
  v30 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_bundleID);
  uint64_t *v30 = v22;
  v30[1] = v24;
  v31 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_mediaType);
  uint64_t *v31 = v25;
  v31[1] = v32;
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC9Archetype17ATPlayedMediaItem_playTime) = a9;
  v35.receiver = self;
  v35.super_class = (Class)type metadata accessor for ATPlayedMediaItem();
  return [(ATPlayedMediaItem *)&v35 init];
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_24867ABB8(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_24867FE58();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24867ADB8(v4);
}

- (_TtC9Archetype17ATPlayedMediaItem)initWithCoder:(id)a3
{
  return (_TtC9Archetype17ATPlayedMediaItem *)ATPlayedMediaItem.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_24867C7D0(self, (uint64_t)a2, (void (*)(void))sub_24867B4C8);
}

- (_TtC9Archetype17ATPlayedMediaItem)init
{
  result = (_TtC9Archetype17ATPlayedMediaItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end