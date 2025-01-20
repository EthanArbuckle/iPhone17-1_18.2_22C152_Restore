@interface NSPredicate(CNVisitation)
- (uint64_t)_cn_acceptVisitor:()CNVisitation;
@end

@implementation NSPredicate(CNVisitation)

- (uint64_t)_cn_acceptVisitor:()CNVisitation
{
  return [a3 visitNSPredicate:a1];
}

@end