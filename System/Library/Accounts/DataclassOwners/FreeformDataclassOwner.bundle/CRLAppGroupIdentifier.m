@interface CRLAppGroupIdentifier
@end

@implementation CRLAppGroupIdentifier

void __CRLAppGroupIdentifier_block_invoke(id a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:"group.com.apple.freeform"];
  v2 = (void *)CRLAppGroupIdentifier_identifier;
  CRLAppGroupIdentifier_identifier = v1;

  if (([(id)CRLAppGroupIdentifier_identifier hasPrefix:@"group.com.apple."] & 1) == 0) {
    __CRLAppGroupIdentifier_block_invoke_cold_1();
  }
}

@end