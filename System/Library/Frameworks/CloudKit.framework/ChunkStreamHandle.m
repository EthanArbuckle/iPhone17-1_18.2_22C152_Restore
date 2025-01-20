@interface ChunkStreamHandle
- (_TtC8CloudKit17ChunkStreamHandle)init;
@end

@implementation ChunkStreamHandle

- (_TtC8CloudKit17ChunkStreamHandle)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8CloudKit17ChunkStreamHandle_downloadURL;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_18AF5AF68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8CloudKit17ChunkStreamHandle_key), *(void *)&self->_anon_0[OBJC_IVAR____TtC8CloudKit17ChunkStreamHandle_key]);
  swift_bridgeObjectRelease();

  swift_release();
}

@end