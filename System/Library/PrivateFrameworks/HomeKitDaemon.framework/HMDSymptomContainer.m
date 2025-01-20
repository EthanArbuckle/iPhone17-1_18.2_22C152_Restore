@interface HMDSymptomContainer
- (HMDAccessorySymptomsDelegate)delegate;
- (HMDSymptomContainer)initWithIDSIdentifier:(id)a3;
- (NSSet)symptoms;
- (NSString)idsIdentifier;
- (void)setDelegate:(id)a3;
- (void)setSymptoms:(id)a3;
@end

@implementation HMDSymptomContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symptoms, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

- (void)setSymptoms:(id)a3
{
}

- (NSSet)symptoms
{
  return self->_symptoms;
}

- (void)setDelegate:(id)a3
{
}

- (HMDAccessorySymptomsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDAccessorySymptomsDelegate *)WeakRetained;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (HMDSymptomContainer)initWithIDSIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDSymptomContainer;
    v7 = [(HMDSymptomContainer *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_idsIdentifier, a3);
    }

    return v8;
  }
  else
  {
    v10 = (HMDSymptomManager *)_HMFPreconditionFailure();
    [(HMDSymptomManager *)v10 dealloc];
  }
  return result;
}

@end