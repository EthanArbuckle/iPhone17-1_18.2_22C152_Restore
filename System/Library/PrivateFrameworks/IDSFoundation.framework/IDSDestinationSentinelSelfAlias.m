@interface IDSDestinationSentinelSelfAlias
+ (BOOL)supportsSecureCoding;
- (id)description;
- (id)destinationURIs;
@end

@implementation IDSDestinationSentinelSelfAlias

- (id)destinationURIs
{
  return (id)objc_msgSend_setWithObject_(MEMORY[0x1E4F1CAD0], a2, @"____--SENTINEL--SELF--ALIAS--V0--____", v2);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p>", v6, v4, self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end