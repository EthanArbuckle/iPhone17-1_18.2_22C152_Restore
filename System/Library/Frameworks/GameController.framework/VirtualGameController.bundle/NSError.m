@interface NSError
+ (id)gc_VirtualControllerError:(void *)a3 userInfo:;
@end

@implementation NSError

+ (id)gc_VirtualControllerError:(void *)a3 userInfo:
{
  id v4 = a3;
  self;
  v5 = +[NSError errorWithDomain:@"GCVirtualControllerError" code:a2 userInfo:v4];

  return v5;
}

@end