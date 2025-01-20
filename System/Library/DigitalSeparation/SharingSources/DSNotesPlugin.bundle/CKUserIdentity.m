@interface CKUserIdentity
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
@end

@implementation CKUserIdentity

- (NSString)unifiedContactIdentifier
{
  v2 = self;
  v3 = [(CKUserIdentity *)v2 contactIdentifiers];
  uint64_t v4 = sub_12938();

  if (*(void *)(v4 + 16))
  {
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    NSString v5 = sub_128B8();
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)emailAddress
{
  return (NSString *)sub_126A8(self, (uint64_t)a2, (SEL *)&selRef_emailAddress);
}

- (NSString)phoneNumber
{
  return (NSString *)sub_126A8(self, (uint64_t)a2, (SEL *)&selRef_phoneNumber);
}

@end