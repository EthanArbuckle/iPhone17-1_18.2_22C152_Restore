@interface ENUserAuthorization
+ (BOOL)supportsSecureCoding;
- (ENUserAuthorization)initWithCoder:(id)a3;
- (ENUserAuthorization)initWithIdentifier:(id)a3;
- (NSDate)expirationDate;
- (NSDate)symptomOnsetDate;
- (NSDate)testDateToday;
- (NSNumber)didUserTravel;
- (NSNumber)isUserVaccinated;
- (NSString)identifier;
- (NSString)verificationCode;
- (double)lastUpdatedTimestamp;
- (id)description;
- (int64_t)expirationStatus;
- (int64_t)userAuthorization;
- (unsigned)reportType;
- (void)encodeWithCoder:(id)a3;
- (void)setDidUserTravel:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsUserVaccinated:(id)a3;
- (void)setReportType:(unsigned int)a3;
- (void)setSymptomOnsetDate:(id)a3;
- (void)setTestDateToday:(id)a3;
- (void)setUserAuthorization:(int64_t)a3;
- (void)setUserAuthorization:(int64_t)a3 withExpiration:(id)a4;
- (void)setVerificationCode:(id)a3;
@end

@implementation ENUserAuthorization

- (ENUserAuthorization)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENUserAuthorization;
  v5 = [(ENUserAuthorization *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ENUserAuthorization *)v5 setIdentifier:v4];
  }

  return v6;
}

- (id)description
{
  NSAppendPrintF_safe();
  id v39 = 0;
  v29 = [(ENUserAuthorization *)self identifier];
  NSAppendPrintF_safe();
  id v3 = v39;

  unint64_t v4 = [(ENUserAuthorization *)self userAuthorization];
  if (v4 > 2) {
    v5 = "?";
  }
  else {
    v5 = off_264245320[v4];
  }
  v30 = v5;
  NSAppendPrintF_safe();
  id v6 = v3;

  v31 = [(ENUserAuthorization *)self expirationDate];
  NSAppendPrintF_safe();
  id v7 = v6;

  unint64_t v8 = [(ENUserAuthorization *)self expirationStatus];
  if (v8 > 2) {
    v9 = "?";
  }
  else {
    v9 = off_264245338[v8];
  }
  v32 = v9;
  NSAppendPrintF_safe();
  id v10 = v7;

  v11 = [(ENUserAuthorization *)self testDateToday];

  if (v11)
  {
    v33 = [(ENUserAuthorization *)self testDateToday];
    NSAppendPrintF_safe();
    id v12 = v10;

    id v10 = v12;
  }
  v13 = [(ENUserAuthorization *)self symptomOnsetDate];

  if (v13)
  {
    v34 = [(ENUserAuthorization *)self symptomOnsetDate];
    NSAppendPrintF_safe();
    id v14 = v10;

    id v10 = v14;
  }
  v15 = [(ENUserAuthorization *)self didUserTravel];

  if (v15)
  {
    v16 = [(ENUserAuthorization *)self didUserTravel];
    if ([v16 BOOLValue]) {
      v17 = "yes";
    }
    else {
      v17 = "no";
    }
    v35 = v17;
    NSAppendPrintF_safe();
    id v18 = v10;

    id v10 = v18;
  }
  v19 = [(ENUserAuthorization *)self isUserVaccinated];

  if (v19)
  {
    v20 = [(ENUserAuthorization *)self isUserVaccinated];
    if ([v20 BOOLValue]) {
      v21 = "yes";
    }
    else {
      v21 = "no";
    }
    v36 = v21;
    NSAppendPrintF_safe();
    id v22 = v10;

    id v10 = v22;
  }
  if ([(ENUserAuthorization *)self reportType])
  {
    unsigned int v23 = [(ENUserAuthorization *)self reportType];
    if (v23 > 5) {
      v24 = "?";
    }
    else {
      v24 = off_264245350[v23];
    }
    v37 = v24;
    NSAppendPrintF_safe();
    id v25 = v10;

    id v10 = v25;
  }
  v26 = [(ENUserAuthorization *)self verificationCode];

  if (v26)
  {
    v38 = [(ENUserAuthorization *)self verificationCode];
    NSAppendPrintF_safe();
    id v27 = v10;

    id v10 = v27;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  unint64_t v4 = [(ENUserAuthorization *)self identifier];
  [v16 encodeObject:v4 forKey:@"UserAuthorizationKeyIdentifier"];

  objc_msgSend(v16, "encodeInteger:forKey:", -[ENUserAuthorization userAuthorization](self, "userAuthorization"), @"UserAuthorizationKeyAuthorization");
  [(ENUserAuthorization *)self lastUpdatedTimestamp];
  objc_msgSend(v16, "encodeDouble:forKey:", @"UserAuthorizationKeyAuthorizationTimestamp");
  v5 = [(ENUserAuthorization *)self expirationDate];
  [v5 timeIntervalSince1970];
  objc_msgSend(v16, "encodeDouble:forKey:", @"UserAuthorizationKeyExpiration");

  id v6 = [(ENUserAuthorization *)self testDateToday];
  if (v6)
  {
    id v7 = [(ENUserAuthorization *)self testDateToday];
    [v16 encodeObject:v7 forKey:@"UserAuthorizationKeyTestDateToday"];
  }
  unint64_t v8 = [(ENUserAuthorization *)self symptomOnsetDate];
  if (v8)
  {
    v9 = [(ENUserAuthorization *)self symptomOnsetDate];
    [v16 encodeObject:v9 forKey:@"PreArmSymptomOnsetDate"];
  }
  id v10 = [(ENUserAuthorization *)self didUserTravel];
  if (v10)
  {
    v11 = [(ENUserAuthorization *)self didUserTravel];
    [v16 encodeObject:v11 forKey:@"PreArmDidUserTravel"];
  }
  id v12 = [(ENUserAuthorization *)self isUserVaccinated];
  if (v12)
  {
    v13 = [(ENUserAuthorization *)self isUserVaccinated];
    [v16 encodeObject:v13 forKey:@"PreArmIsUserVaccinated"];
  }
  if ([(ENUserAuthorization *)self reportType]) {
    objc_msgSend(v16, "encodeInt64:forKey:", -[ENUserAuthorization reportType](self, "reportType"), @"PreArmReportType");
  }
  id v14 = [(ENUserAuthorization *)self verificationCode];
  if (v14)
  {
    v15 = [(ENUserAuthorization *)self verificationCode];
    [v16 encodeObject:v15 forKey:@"PreArmVerificationCode"];
  }
}

- (ENUserAuthorization)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ENUserAuthorization;
  v5 = [(ENUserAuthorization *)&v24 init];
  if (!v5)
  {
LABEL_18:
    id v7 = v5;
    goto LABEL_19;
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserAuthorizationKeyIdentifier"];
  [(ENUserAuthorization *)v5 setIdentifier:v6];

  id v7 = [(ENUserAuthorization *)v5 identifier];

  if (v7)
  {
    [v4 decodeDoubleForKey:@"UserAuthorizationKeyExpiration"];
    if (v8 != 0.0)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:");
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v9;
    }
    if ([v4 containsValueForKey:@"UserAuthorizationKeyTestDateToday"])
    {
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserAuthorizationKeyTestDateToday"];
      testDateToday = v5->_testDateToday;
      v5->_testDateToday = (NSDate *)v11;
    }
    [v4 decodeDoubleForKey:@"UserAuthorizationKeyAuthorizationTimestamp"];
    v5->_lastUpdatedTimestamp = v13;
    -[ENUserAuthorization setUserAuthorization:](v5, "setUserAuthorization:", [v4 decodeIntegerForKey:@"UserAuthorizationKeyAuthorization"]);
    if ([v4 containsValueForKey:@"PreArmSymptomOnsetDate"])
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreArmSymptomOnsetDate"];
      symptomOnsetDate = v5->_symptomOnsetDate;
      v5->_symptomOnsetDate = (NSDate *)v14;
    }
    if ([v4 containsValueForKey:@"PreArmDidUserTravel"])
    {
      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreArmDidUserTravel"];
      didUserTravel = v5->_didUserTravel;
      v5->_didUserTravel = (NSNumber *)v16;
    }
    if ([v4 containsValueForKey:@"PreArmIsUserVaccinated"])
    {
      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreArmIsUserVaccinated"];
      isUserVaccinated = v5->_isUserVaccinated;
      v5->_isUserVaccinated = (NSNumber *)v18;
    }
    if ([v4 containsValueForKey:@"PreArmReportType"])
    {
      unint64_t v20 = [v4 decodeInt64ForKey:@"PreArmReportType"];
      if (v20 <= 5) {
        v5->_reportType = v20;
      }
    }
    if ([v4 containsValueForKey:@"PreArmVerificationCode"])
    {
      uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreArmVerificationCode"];
      verificationCode = v5->_verificationCode;
      v5->_verificationCode = (NSString *)v21;
    }
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

- (int64_t)userAuthorization
{
  if ([(ENUserAuthorization *)self expirationStatus] == 1)
  {
    if (gLogCategory_ENUserAuthorization <= 30
      && (gLogCategory_ENUserAuthorization != -1 || _LogCategory_Initialize()))
    {
      v5 = [(ENUserAuthorization *)self identifier];
      LogPrintF_safe();

      -[ENUserAuthorization setUserAuthorization:](self, "setUserAuthorization:", 2, v5);
    }
    else
    {
      -[ENUserAuthorization setUserAuthorization:](self, "setUserAuthorization:", 2, v4);
    }
  }
  return self->_authorization;
}

- (void)setUserAuthorization:(int64_t)a3
{
  self->_authorization = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  [v5 timeIntervalSince1970];
  self->_lastUpdatedTimestamp = v4;
}

- (int64_t)expirationStatus
{
  uint64_t v3 = [(ENUserAuthorization *)self expirationDate];
  if (!v3) {
    return 0;
  }
  double v4 = (void *)v3;
  id v5 = [(ENUserAuthorization *)self testDateToday];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF910] date];
  }
  uint64_t v9 = v7;

  [v9 timeIntervalSince1970];
  if (v10 - self->_lastUpdatedTimestamp <= 0.0)
  {
    int64_t v8 = 1;
  }
  else if ([v9 compare:v4] == 1)
  {
    int64_t v8 = 1;
  }
  else
  {
    int64_t v8 = 2;
  }

  return v8;
}

- (void)setUserAuthorization:(int64_t)a3 withExpiration:(id)a4
{
  id v6 = a4;
  [(ENUserAuthorization *)self setUserAuthorization:a3];
  [(ENUserAuthorization *)self setExpirationDate:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (double)lastUpdatedTimestamp
{
  return self->_lastUpdatedTimestamp;
}

- (NSDate)testDateToday
{
  return self->_testDateToday;
}

- (void)setTestDateToday:(id)a3
{
}

- (NSNumber)didUserTravel
{
  return self->_didUserTravel;
}

- (void)setDidUserTravel:(id)a3
{
}

- (NSNumber)isUserVaccinated
{
  return self->_isUserVaccinated;
}

- (void)setIsUserVaccinated:(id)a3
{
}

- (unsigned)reportType
{
  return self->_reportType;
}

- (void)setReportType:(unsigned int)a3
{
  self->_reportType = a3;
}

- (NSDate)symptomOnsetDate
{
  return self->_symptomOnsetDate;
}

- (void)setSymptomOnsetDate:(id)a3
{
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_symptomOnsetDate, 0);
  objc_storeStrong((id *)&self->_isUserVaccinated, 0);
  objc_storeStrong((id *)&self->_didUserTravel, 0);
  objc_storeStrong((id *)&self->_testDateToday, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end