@interface MOVStreamWriterStateFailed
- (id)name;
- (int64_t)writerStatus;
- (void)activateWithContext:(id)a3;
@end

@implementation MOVStreamWriterStateFailed

- (void)activateWithContext:(id)a3
{
  id v3 = a3;
  [v3 closeEncodersAfterFailure];
  [v3 deleteMOVFile];
}

- (int64_t)writerStatus
{
  return 8;
}

- (id)name
{
  return @"Failed";
}

@end