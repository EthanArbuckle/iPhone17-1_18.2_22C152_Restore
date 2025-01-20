@interface GKOOBMessageFactory
+ (id)newMessageFromData:(id)a3;
@end

@implementation GKOOBMessageFactory

+ (id)newMessageFromData:(id)a3
{
  if (!a3 || (unint64_t)[a3 length] < 2) {
    return 0;
  }
  if (*(_WORD *)[a3 bytes] == 16390) {
    v5 = &off_2645B7A30;
  }
  else {
    v5 = &off_2645B7A08;
  }
  id v6 = objc_alloc(*v5);
  uint64_t v7 = [a3 bytes];
  uint64_t v8 = [a3 length];
  return (id)[v6 initWithBytes:v7 length:v8];
}

@end