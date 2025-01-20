@interface GarbageCollectOldRecords
@end

@implementation GarbageCollectOldRecords

BOOL __GarbageCollectOldRecords_block_invoke(id a1, NSString *a2, NSDictionary *a3)
{
  v3 = [(NSString *)a2 pathExtension];
  if ([v3 isEqualToString:@"json"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"desdata"];
  }

  return v4;
}

int64_t __GarbageCollectOldRecords_block_invoke_2(id a1, NSDate *a2, NSDate *a3)
{
  return [(NSDate *)a3 compare:a2];
}

@end