@interface NSCompoundPredicate(CNVisitation)
- (uint64_t)_cn_acceptVisitor:()CNVisitation;
@end

@implementation NSCompoundPredicate(CNVisitation)

- (uint64_t)_cn_acceptVisitor:()CNVisitation
{
  return [a3 visitNSCompoundPredicate:a1];
}

@end