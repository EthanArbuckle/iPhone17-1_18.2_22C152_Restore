@interface SNDeleteFilesRequest
- (SNDeleteFilesRequest)init;
- (SNDeleteFilesRequest)initWithFiles:(id)a3 serverBasePath:(id)a4 serverInfo:(id)a5;
@end

@implementation SNDeleteFilesRequest

- (SNDeleteFilesRequest)initWithFiles:(id)a3 serverBasePath:(id)a4 serverInfo:(id)a5
{
  uint64_t v6 = sub_1DCB87C38();
  uint64_t v7 = sub_1DCB87938();
  return (SNDeleteFilesRequest *)sub_1DC95F53C(v6, v7, v8, (char *)a5);
}

- (SNDeleteFilesRequest)init
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
}

@end