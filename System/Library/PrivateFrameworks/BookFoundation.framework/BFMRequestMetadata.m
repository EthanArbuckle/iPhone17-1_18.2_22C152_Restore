@interface BFMRequestMetadata
- (BFMRequestMetadata)init;
- (BFMRequestMetadata)initWithFileID:(id)a3 line:(int)a4;
- (NSString)fileID;
- (int)line;
@end

@implementation BFMRequestMetadata

- (BFMRequestMetadata)initWithFileID:(id)a3 line:(int)a4
{
  uint64_t v6 = sub_2289DEBC0();
  v7 = (char *)self + OBJC_IVAR___BFMRequestMetadata_impl;
  *(void *)v7 = v6;
  *((void *)v7 + 1) = v8;
  *((_DWORD *)v7 + 4) = a4;
  v10.receiver = self;
  v10.super_class = (Class)BFMRequestMetadata;
  return [(BFMRequestMetadata *)&v10 init];
}

- (NSString)fileID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2289DEB90();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int)line
{
  return *(_DWORD *)&self->impl[OBJC_IVAR___BFMRequestMetadata_impl + 8];
}

- (BFMRequestMetadata)init
{
  result = (BFMRequestMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end