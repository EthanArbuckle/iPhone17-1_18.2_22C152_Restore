@interface NSObject(SwiftUI)
+ (uint64_t)_isFromSwiftUI;
- (void)_performSelector:()SwiftUI withObject:;
@end

@implementation NSObject(SwiftUI)

+ (uint64_t)_isFromSwiftUI
{
  return 0;
}

- (void)_performSelector:()SwiftUI withObject:
{
  if (a4)
  {
    id v5 = a4;
    ((void (*)(id, uint64_t))[v5 methodForSelector:a3])(v5, a3);
  }
}

@end