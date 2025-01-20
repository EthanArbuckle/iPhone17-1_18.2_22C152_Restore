@interface SNCopyFilesRequest
- (SNCopyFilesRequest)init;
- (SNCopyFilesRequest)initWithServerInfo:(id)a3 serverBasePath:(id)a4 serverFilePaths:(id)a5 localDestinationPath:(id)a6;
@end

@implementation SNCopyFilesRequest

- (SNCopyFilesRequest)initWithServerInfo:(id)a3 serverBasePath:(id)a4 serverFilePaths:(id)a5 localDestinationPath:(id)a6
{
  uint64_t v7 = sub_1DCB87938();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1DCB87C38();
  uint64_t v11 = sub_1DCB87938();
  return (SNCopyFilesRequest *)sub_1DCB2A5A4((char *)a3, v7, v9, v10, v11, v12);
}

- (SNCopyFilesRequest)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end