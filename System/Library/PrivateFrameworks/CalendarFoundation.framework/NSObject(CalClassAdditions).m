@interface NSObject(CalClassAdditions)
- (BOOL)isNull;
- (id)CalClassName;
- (void)performBlockOnMainThreadSynchronously:()CalClassAdditions;
@end

@implementation NSObject(CalClassAdditions)

- (id)CalClassName
{
  v0 = (objc_class *)objc_opt_class();
  v1 = (void *)[[NSString alloc] initWithUTF8String:class_getName(v0)];

  return v1;
}

- (BOOL)isNull
{
  v2 = [MEMORY[0x1E4F1CA98] null];
  BOOL v3 = v2 == a1;

  return v3;
}

- (void)performBlockOnMainThreadSynchronously:()CalClassAdditions
{
  BOOL v3 = (void *)MEMORY[0x1E4F29060];
  block = a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

@end