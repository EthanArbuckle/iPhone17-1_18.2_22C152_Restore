@interface AMSCarrierOfferRegistrationPrivacyValidator
+ (id)allowedIdentifiersFrom:(id)a3 forAccount:(id)a4;
- (AMSCarrierOfferRegistrationPrivacyValidator)init;
@end

@implementation AMSCarrierOfferRegistrationPrivacyValidator

+ (id)allowedIdentifiersFrom:(id)a3 forAccount:(id)a4
{
  uint64_t v5 = sub_18DD4DDA0();
  swift_getObjCClassMetadata();
  id v6 = a4;
  static CarrierOfferRegistrationPrivacyValidator.allowedIdentifiers(from:forAccount:)(v5, v6);

  swift_bridgeObjectRelease();
  v7 = (void *)sub_18DD4E320();
  swift_bridgeObjectRelease();
  return v7;
}

- (AMSCarrierOfferRegistrationPrivacyValidator)init
{
  return (AMSCarrierOfferRegistrationPrivacyValidator *)CarrierOfferRegistrationPrivacyValidator.init()();
}

@end