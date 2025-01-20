@interface NSError(GC)
- (id)gc_failingKeyPath;
@end

@implementation NSError(GC)

- (id)gc_failingKeyPath
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "gc_objectForKey:ofClass:error:", @"GCFailingKeyPathErrorKey", objc_opt_class(), 0);

  return v2;
}

@end