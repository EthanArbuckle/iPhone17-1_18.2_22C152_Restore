@interface NSString(FSFileHandle)
- (FSFileHandle)fsFileHandle;
@end

@implementation NSString(FSFileHandle)

- (FSFileHandle)fsFileHandle
{
  v1 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:a1 options:0];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
    [v3 bytes];
    [v3 length];
    __memcpy_chk();
  }
  v4 = [[FSFileHandle alloc] initWithValue:0];

  return v4;
}

@end