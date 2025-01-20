@interface SNFileDeletionResult
- (NSError)error;
- (NSString)fileName;
- (SNFileDeletionResult)init;
@end

@implementation SNFileDeletionResult

- (NSString)fileName
{
  sub_1DC8F6860();
  v2 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSError)error
{
  uint64_t v2 = sub_1DC8F68F4();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)sub_1DCB86888();
  }
  else
  {
    v4 = 0;
  }

  return (NSError *)v4;
}

- (SNFileDeletionResult)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end