@interface SKPaymentDiscountInternal
@end

@implementation SKPaymentDiscountInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end