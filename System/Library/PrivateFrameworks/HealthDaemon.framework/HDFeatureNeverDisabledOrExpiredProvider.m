@interface HDFeatureNeverDisabledOrExpiredProvider
- (HDFeatureDisableAndExpiryProvidingDelegate)delegate;
- (id)rescindedStatusForCountryCode:(id)a3 device:(id)a4 error:(id *)a5;
- (id)rescindedStatusOnActivePairedDeviceForCountryCode:(id)a3 error:(id *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HDFeatureNeverDisabledOrExpiredProvider

- (id)rescindedStatusOnActivePairedDeviceForCountryCode:(id)a3 error:(id *)a4
{
  return &unk_1F17EAFF8;
}

- (id)rescindedStatusForCountryCode:(id)a3 device:(id)a4 error:(id *)a5
{
  return &unk_1F17EAFF8;
}

- (HDFeatureDisableAndExpiryProvidingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDFeatureDisableAndExpiryProvidingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end