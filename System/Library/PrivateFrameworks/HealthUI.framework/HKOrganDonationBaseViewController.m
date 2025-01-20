@interface HKOrganDonationBaseViewController
- (HKOrganDonationBaseViewController)initWithMedicalIDData:(id)a3;
- (NSString)completionButtonTitle;
- (_HKMedicalIDData)medicalIDData;
- (id)registrationCompletionHandler;
- (void)setCompletionButtonTitle:(id)a3;
- (void)setMedicalIDData:(id)a3;
- (void)setRegistrationCompletionHandler:(id)a3;
@end

@implementation HKOrganDonationBaseViewController

- (HKOrganDonationBaseViewController)initWithMedicalIDData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKOrganDonationBaseViewController;
  v6 = [(HKTitledBuddyViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_medicalIDData, a3);
  }

  return v7;
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
}

- (NSString)completionButtonTitle
{
  return self->_completionButtonTitle;
}

- (void)setCompletionButtonTitle:(id)a3
{
}

- (id)registrationCompletionHandler
{
  return self->_registrationCompletionHandler;
}

- (void)setRegistrationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_completionButtonTitle, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
}

@end