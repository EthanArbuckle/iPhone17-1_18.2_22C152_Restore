@interface NSError(GCIPCErrorDomain)
+ (NSError)gc_IPCError:()GCIPCErrorDomain userInfo:;
@end

@implementation NSError(GCIPCErrorDomain)

+ (NSError)gc_IPCError:()GCIPCErrorDomain userInfo:
{
  return +[NSError errorWithDomain:@"GCIPCError" code:a3 userInfo:a4];
}

@end