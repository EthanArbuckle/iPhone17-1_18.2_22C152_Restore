@interface SNListFilesRequest
- (SNListFilesRequest)init;
- (SNListFilesRequest)initWithServerInfo:(id)a3 queryPath:(id)a4;
@end

@implementation SNListFilesRequest

- (SNListFilesRequest)initWithServerInfo:(id)a3 queryPath:(id)a4
{
  uint64_t v5 = sub_1DCB87938();
  return (SNListFilesRequest *)sub_1DCABCBC0((char *)a3, v5, v6);
}

- (SNListFilesRequest)init
{
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