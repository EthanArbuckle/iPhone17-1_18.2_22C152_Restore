@interface CMContinuityCaptureCenterStageStateRestorationData
- (CMContinuityCaptureCenterStageStateRestorationData)initWithPreferencesDomain:(id)a3;
- (NSString)preferencesDomain;
- (id)debugDescription;
- (id)description;
@end

@implementation CMContinuityCaptureCenterStageStateRestorationData

- (CMContinuityCaptureCenterStageStateRestorationData)initWithPreferencesDomain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CMContinuityCaptureCenterStageStateRestorationData;
  v6 = [(CMContinuityCaptureCenterStageStateRestorationData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_preferencesDomain, a3);
  }

  return v7;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"preferencesDomain: %@", self->_preferencesDomain];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(CMContinuityCaptureCenterStageStateRestorationData *)self debugDescription];
  v7 = [v3 stringWithFormat:@"<%@: %p %@>", v5, self, v6];

  return v7;
}

- (NSString)preferencesDomain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end