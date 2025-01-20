@interface HFAnalyticsAccessCodeEvent
- (HFAnalyticsAccessCodeEvent)initWithData:(id)a3;
- (HFPinCodeItem)pinCodeItem;
- (HMHome)home;
- (NSNumber)duringOnboarding;
- (NSNumber)errorCode;
- (NSNumber)ratioOfUserPINCodes;
- (NSNumber)totalGuestPINCodes;
- (NSString)errorDomain;
- (id)payload;
- (unint64_t)operationType;
- (void)setDuringOnboarding:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setHome:(id)a3;
- (void)setOperationType:(unint64_t)a3;
- (void)setPinCodeItem:(id)a3;
- (void)setRatioOfUserPINCodes:(id)a3;
- (void)setTotalGuestPINCodes:(id)a3;
@end

@implementation HFAnalyticsAccessCodeEvent

- (HFAnalyticsAccessCodeEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"home"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_ErrorHfanalyti_12.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"operationType"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v10) {
    NSLog(&cfstr_ErrorHfanalyti_13.isa);
  }
  objc_opt_class();
  v11 = [v4 objectForKeyedSubscript:@"pinCodeItem"];
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v42 = v12;

  v13 = [v4 objectForKeyedSubscript:@"pinCodeItem"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    NSLog(&cfstr_ErrorHfanalyti_14.isa);
  }
  objc_opt_class();
  v15 = [v4 objectForKeyedSubscript:@"duringOnboarding"];
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17) {
    v18 = v15;
  }
  else {
    v18 = (void *)MEMORY[0x263EFFA80];
  }
  objc_opt_class();
  v19 = [v4 objectForKeyedSubscript:@"error"];
  if (objc_opt_isKindOfClass()) {
    v20 = v19;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  v48.receiver = self;
  v48.super_class = (Class)HFAnalyticsAccessCodeEvent;
  v22 = [(HFAnalyticsEvent *)&v48 initWithEventType:26];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_home, v6);
    v23->_operationType = [v10 integerValue];
    objc_storeStrong((id *)&v23->_pinCodeItem, v12);
    objc_storeStrong((id *)&v23->_duringOnboarding, v18);
    uint64_t v24 = [v21 domain];
    v25 = (void *)v24;
    if (v24) {
      v26 = (__CFString *)v24;
    }
    else {
      v26 = @"nil";
    }
    objc_storeStrong((id *)&v23->_errorDomain, v26);

    uint64_t v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "code"));
    errorCode = v23->_errorCode;
    v23->_errorCode = (NSNumber *)v27;

    v29 = +[HFHomeKitDispatcher sharedDispatcher];
    v30 = [(HFAnalyticsAccessCodeEvent *)v23 home];
    v31 = [v29 pinCodeManagerForHome:v30];

    v32 = (void *)MEMORY[0x263EFF9C0];
    v33 = [v7 users];
    v34 = [v32 setWithArray:v33];

    v35 = [v7 currentUser];
    [v34 addObject:v35];

    unint64_t v36 = [v34 count];
    objc_initWeak(&location, v23);
    v37 = [v31 userPinCodes];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __43__HFAnalyticsAccessCodeEvent_initWithData___block_invoke;
    v45[3] = &unk_264097740;
    objc_copyWeak(v46, &location);
    *(double *)&v46[1] = (double)v36;
    id v38 = (id)[v37 addSuccessBlock:v45];

    v39 = [v31 guestPinCodes];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __43__HFAnalyticsAccessCodeEvent_initWithData___block_invoke_2;
    v43[3] = &unk_264097768;
    objc_copyWeak(&v44, &location);
    id v40 = (id)[v39 addSuccessBlock:v43];

    objc_destroyWeak(&v44);
    objc_destroyWeak(v46);
    objc_destroyWeak(&location);
  }
  return v23;
}

void __43__HFAnalyticsAccessCodeEvent_initWithData___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  unint64_t v5 = [v4 count];

  double v6 = (double)v5 / *(double *)(a1 + 40);
  if (v6 > 1.0) {
    NSLog(&cfstr_ErrorRatioOfUs.isa);
  }
  id v7 = [NSNumber numberWithDouble:v6];
  [WeakRetained setRatioOfUserPINCodes:v7];
}

void __43__HFAnalyticsAccessCodeEvent_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = NSNumber;
  uint64_t v5 = [v3 count];

  double v6 = [v4 numberWithUnsignedInteger:v5];
  [WeakRetained setTotalGuestPINCodes:v6];
}

- (id)payload
{
  v31.receiver = self;
  v31.super_class = (Class)HFAnalyticsAccessCodeEvent;
  id v3 = [(HFAnalyticsEvent *)&v31 payload];
  id v4 = (void *)[v3 mutableCopy];

  switch([(HFAnalyticsAccessCodeEvent *)self operationType])
  {
    case 0uLL:
      uint64_t v5 = @"add";
      break;
    case 1uLL:
      uint64_t v5 = @"remove";
      break;
    case 2uLL:
      uint64_t v5 = @"modifyValue";
      break;
    case 3uLL:
      uint64_t v5 = @"modifyAccessories";
      break;
    case 4uLL:
      double v6 = [(HFAnalyticsAccessCodeEvent *)self duringOnboarding];
      char v7 = [v6 BOOLValue];

      if ((v7 & 1) == 0) {
        NSLog(&cfstr_ErrorDuringonb.isa);
      }
      uint64_t v5 = @"skippedOnboarding";
      break;
    case 5uLL:
      uint64_t v5 = @"share";
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"operationType");
  v8 = [(HFAnalyticsAccessCodeEvent *)self duringOnboarding];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"duringOnboarding");

  v9 = [(HFAnalyticsAccessCodeEvent *)self errorCode];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v9, @"errorCode");

  id v10 = [(HFAnalyticsAccessCodeEvent *)self errorDomain];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v10, @"errorDomain");

  v11 = [(HFAnalyticsAccessCodeEvent *)self pinCodeItem];

  if (v11)
  {
    v12 = [(HFAnalyticsAccessCodeEvent *)self pinCodeItem];
    int v13 = [v12 isGuest];
    v14 = @"user";
    if (v13) {
      v14 = @"guest";
    }
    v15 = v14;
  }
  else
  {
    v15 = @"none";
  }
  objc_msgSend(v4, "na_safeSetObject:forKey:", v15, @"userType");
  v16 = NSNumber;
  id v17 = [(HFAnalyticsAccessCodeEvent *)self pinCodeItem];
  v18 = [v17 pinCodeValue];
  v19 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v18, "length"));
  objc_msgSend(v4, "na_safeSetObject:forKey:", v19, @"codeLength");

  v20 = [(HFAnalyticsAccessCodeEvent *)self pinCodeItem];
  id v21 = [v20 accessories];
  double v22 = (double)(unint64_t)[v21 count];

  v23 = [NSNumber numberWithDouble:v22];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v23, @"countOfAccessoriesEnabled");

  uint64_t v24 = [(HFAnalyticsAccessCodeEvent *)self home];
  v25 = objc_msgSend(v24, "hf_accessoriesSupportingAccessCodes");
  double v26 = (double)(unint64_t)[v25 count];

  uint64_t v27 = [NSNumber numberWithDouble:v22 / v26];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v27, @"ratioOfAccessoriesEnabled");

  v28 = [(HFAnalyticsAccessCodeEvent *)self totalGuestPINCodes];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v28, @"totalCountGuests");

  v29 = [(HFAnalyticsAccessCodeEvent *)self ratioOfUserPINCodes];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v29, @"ratioOfUsersWithPIN");

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (HFPinCodeItem)pinCodeItem
{
  return self->_pinCodeItem;
}

- (void)setPinCodeItem:(id)a3
{
}

- (NSNumber)duringOnboarding
{
  return self->_duringOnboarding;
}

- (void)setDuringOnboarding:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSNumber)totalGuestPINCodes
{
  return self->_totalGuestPINCodes;
}

- (void)setTotalGuestPINCodes:(id)a3
{
}

- (NSNumber)ratioOfUserPINCodes
{
  return self->_ratioOfUserPINCodes;
}

- (void)setRatioOfUserPINCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratioOfUserPINCodes, 0);
  objc_storeStrong((id *)&self->_totalGuestPINCodes, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_duringOnboarding, 0);
  objc_storeStrong((id *)&self->_pinCodeItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end