@interface NSXPCInterface(Enum)
- (uint64_t)ln_updateWithEnumInterface;
@end

@implementation NSXPCInterface(Enum)

- (uint64_t)ln_updateWithEnumInterface
{
  [a1 setClass:objc_opt_class() forSelector:sel_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [a1 setClass:objc_opt_class() forSelector:sel_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler_ argumentIndex:1 ofReply:1];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  [a1 setClasses:v5 forSelector:sel_fetchURLsForEnumWithIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  uint64_t v6 = objc_opt_class();
  return [a1 setClass:v6 forSelector:sel_fetchURLsForEnumWithIdentifier_completionHandler_ argumentIndex:1 ofReply:1];
}

@end