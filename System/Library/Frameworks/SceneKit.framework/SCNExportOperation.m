@interface SCNExportOperation
- (BOOL)succeded;
- (double)progress;
- (id)error;
@end

@implementation SCNExportOperation

- (id)error
{
  return 0;
}

- (BOOL)succeded
{
  return 1;
}

- (double)progress
{
  return 0.0;
}

@end