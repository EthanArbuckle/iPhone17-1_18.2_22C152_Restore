@interface CKInMemoryWriteBatch
- (BOOL)writeAndReturnError:(id *)a3;
- (void)writeWithCompletionHandler:(id)a3;
@end

@implementation CKInMemoryWriteBatch

- (void)writeWithCompletionHandler:(id)a3
{
}

- (BOOL)writeAndReturnError:(id *)a3
{
  return sub_1A7813694((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1A7811874);
}

@end