@interface NSCompoundPredicate(_EmailFoundationAdditions)
- (id)_ef_parenthesizedPublicDescription;
@end

@implementation NSCompoundPredicate(_EmailFoundationAdditions)

- (id)_ef_parenthesizedPublicDescription
{
  id v2 = [NSString alloc];
  v3 = objc_msgSend(a1, "ef_publicDescription");
  v4 = (void *)[v2 initWithFormat:@"(%@)", v3];

  return v4;
}

@end