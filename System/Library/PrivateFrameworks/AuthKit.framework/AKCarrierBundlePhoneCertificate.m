@interface AKCarrierBundlePhoneCertificate
- (NSString)phoneCertificate;
- (int64_t)slotID;
- (void)setPhoneCertificate:(id)a3;
- (void)setSlotID:(int64_t)a3;
@end

@implementation AKCarrierBundlePhoneCertificate

- (NSString)phoneCertificate
{
  return self->_phoneCertificate;
}

- (void)setPhoneCertificate:(id)a3
{
}

- (int64_t)slotID
{
  return self->_slotID;
}

- (void)setSlotID:(int64_t)a3
{
  self->_slotID = a3;
}

- (void).cxx_destruct
{
}

@end