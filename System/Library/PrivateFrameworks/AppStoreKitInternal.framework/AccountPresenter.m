@interface AccountPresenter
- (void)automaticUpdatesEnabledDidChange;
- (void)familyInfoDidChange;
- (void)iCloudAccountsDidChange;
- (void)profilePictureStoreDidChange;
- (void)restrictionsDidChange:(id)a3;
- (void)storeAccountsDidChange;
@end

@implementation AccountPresenter

- (void)storeAccountsDidChange
{
}

- (void)iCloudAccountsDidChange
{
}

- (void)restrictionsDidChange:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1E1D0BA48((uint64_t)sub_1E1D127C8, (uint64_t)&block_descriptor_230);

  swift_release();
}

- (void)automaticUpdatesEnabledDidChange
{
}

- (void)profilePictureStoreDidChange
{
  swift_retain();
  sub_1E1D0BF20(0, 0);
  swift_release();
}

- (void)familyInfoDidChange
{
}

@end