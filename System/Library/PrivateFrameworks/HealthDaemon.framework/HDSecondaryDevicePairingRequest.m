@interface HDSecondaryDevicePairingRequest
- (void)dealloc;
@end

@implementation HDSecondaryDevicePairingRequest

- (void)dealloc
{
  [(HKDaemonTransaction *)self->_transaction invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDSecondaryDevicePairingRequest;
  [(HDSecondaryDevicePairingRequest *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardianAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end