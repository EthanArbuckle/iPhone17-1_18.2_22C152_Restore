@interface FPCKDetachedRoot
- (BOOL)shouldRefreshBookmark;
- (NSURL)logicalLocation;
- (NSURL)physicalLocation;
- (_TtC9libfssync16FPCKDetachedRoot)init;
- (_TtC9libfssync16FPCKDetachedRoot)initWithPhysicalLocation:(id)a3 rootURL:(id)a4 error:(id *)a5;
- (unint64_t)inode;
@end

@implementation FPCKDetachedRoot

- (NSURL)physicalLocation
{
  v2 = (void *)sub_24DCC8948();

  return (NSURL *)v2;
}

- (NSURL)logicalLocation
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B199050);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24D415FD0((uint64_t)self + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_logicalLocation, (uint64_t)v5, (uint64_t *)&unk_26B199050);
  uint64_t v6 = sub_24DCC8A58();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_24DCC8948();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }

  return (NSURL *)v8;
}

- (unint64_t)inode
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_inode);
}

- (BOOL)shouldRefreshBookmark
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_shouldRefreshBookmark);
}

- (_TtC9libfssync16FPCKDetachedRoot)initWithPhysicalLocation:(id)a3 rootURL:(id)a4 error:(id *)a5
{
  uint64_t v5 = sub_24DCC8A58();
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v12[-v9];
  sub_24DCC89E8();
  sub_24DCC89E8();
  return (_TtC9libfssync16FPCKDetachedRoot *)sub_24D7D8F00((uint64_t)v10, (uint64_t)v8);
}

- (_TtC9libfssync16FPCKDetachedRoot)init
{
  result = (_TtC9libfssync16FPCKDetachedRoot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_physicalLocation;
  uint64_t v4 = sub_24DCC8A58();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_24D415F74((uint64_t)self + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_logicalLocation, (uint64_t *)&unk_26B199050);
}

@end