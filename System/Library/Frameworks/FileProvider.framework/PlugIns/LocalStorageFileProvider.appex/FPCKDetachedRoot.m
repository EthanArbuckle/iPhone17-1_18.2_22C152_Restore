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
  sub_10096AD20((NSURL *)OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_physicalLocation);

  return (NSURL *)v2;
}

- (NSURL)logicalLocation
{
  uint64_t v3 = sub_10002B7CC(&qword_100ACA8C0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B70C((uint64_t)self + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_logicalLocation, (uint64_t)v5, &qword_100ACA8C0);
  uint64_t v6 = sub_10096AE50();
  uint64_t v7 = *(void *)(v6 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    sub_10096AD20(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }

  return (NSURL *)v9;
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
  uint64_t v5 = sub_10096AE50();
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  v10 = &v12[-v9];
  sub_10096ADD0();
  sub_10096ADD0();
  return (_TtC9libfssync16FPCKDetachedRoot *)sub_10045A52C((uint64_t)v10, (uint64_t)v8);
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
  uint64_t v4 = sub_10096AE50();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10002B770((uint64_t)self + OBJC_IVAR____TtC9libfssync16FPCKDetachedRoot_logicalLocation, &qword_100ACA8C0);
}

@end