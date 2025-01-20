@interface HFAnalyticsFaceRecognitionNamedPersonEvent
- (HFAnalyticsFaceRecognitionNamedPersonEvent)initWithData:(id)a3;
- (NSNumber)errorCode;
- (NSNumber)isNewPerson;
- (NSNumber)personType;
- (NSString)errorDomain;
- (id)payload;
- (unint64_t)_namedPersonTypeForPerson:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setIsNewPerson:(id)a3;
- (void)setPersonType:(id)a3;
@end

@implementation HFAnalyticsFaceRecognitionNamedPersonEvent

- (HFAnalyticsFaceRecognitionNamedPersonEvent)initWithData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:@"isNewPerson"];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (!v7) {
    NSLog(&cfstr_ErrorHfanalyti_6.isa);
  }
  objc_opt_class();
  v8 = [v4 objectForKeyedSubscript:@"person"];
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  unint64_t v11 = [(HFAnalyticsFaceRecognitionNamedPersonEvent *)self _namedPersonTypeForPerson:v10];
  v12 = [NSNumber numberWithUnsignedInteger:v11];
  v26.receiver = self;
  v26.super_class = (Class)HFAnalyticsFaceRecognitionNamedPersonEvent;
  v13 = [(HFAnalyticsEvent *)&v26 initWithEventType:4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_isNewPerson, v6);
    objc_storeStrong((id *)&v14->_personType, v12);
    objc_opt_class();
    v15 = [v4 objectForKeyedSubscript:@"error"];
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    uint64_t v18 = [v17 domain];
    v19 = (void *)v18;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    else {
      v20 = @"nil";
    }
    objc_storeStrong((id *)&v14->_errorDomain, v20);

    v21 = NSNumber;
    uint64_t v22 = [v17 code];

    uint64_t v23 = [v21 numberWithInteger:v22];
    errorCode = v14->_errorCode;
    v14->_errorCode = (NSNumber *)v23;
  }
  return v14;
}

- (id)payload
{
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsFaceRecognitionNamedPersonEvent;
  v3 = [(HFAnalyticsEvent *)&v10 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsFaceRecognitionNamedPersonEvent *)self isNewPerson];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"namedPersonIsNew");

  v6 = [(HFAnalyticsFaceRecognitionNamedPersonEvent *)self personType];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"namedPersonType");

  id v7 = [(HFAnalyticsFaceRecognitionNamedPersonEvent *)self errorDomain];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"errorDomain");

  v8 = [(HFAnalyticsFaceRecognitionNamedPersonEvent *)self errorCode];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"errorCode");

  return v4;
}

- (unint64_t)_namedPersonTypeForPerson:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 name];

    if (v5)
    {
      v6 = [v4 name];
      NSLog(&cfstr_ExpectedHmpers.isa, v4, v6);

      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 1;
  }

  return v5;
}

- (NSNumber)isNewPerson
{
  return self->_isNewPerson;
}

- (void)setIsNewPerson:(id)a3
{
}

- (NSNumber)personType
{
  return self->_personType;
}

- (void)setPersonType:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_personType, 0);
  objc_storeStrong((id *)&self->_isNewPerson, 0);
}

@end