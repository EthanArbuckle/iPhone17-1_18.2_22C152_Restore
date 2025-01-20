@interface HUDConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (BOOL)areProcessTerminationsMonitored;
- (HTProcessExitFilteringConfiguration)processTerminationsFiltering;
- (HUDConfiguration)init;
- (HUDConfiguration)initWithCoder:(id)a3;
- (HUDConfiguration)initWithRunloopHangTimeoutDurationMSec:(unint64_t)a3 thirdPartyDevPreferredLanguages:(id)a4 areProcessTerminationsMonitored:(BOOL)a5 processTerminationsFiltering:(id)a6;
- (NSArray)thirdPartyDevPreferredLanguages;
- (unint64_t)runloopHangTimeoutDurationMSec;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithHUDConfiguration:(id)a3;
@end

@implementation HUDConfiguration

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013040;
  block[3] = &unk_100030840;
  block[4] = a1;
  if (qword_10003EA18 != -1) {
    dispatch_once(&qword_10003EA18, block);
  }
  v2 = (void *)qword_10003EA10;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HUDConfiguration)init
{
  thirdPartyDevPreferredLanguages = self->_thirdPartyDevPreferredLanguages;
  self->_runloopHangTimeoutDurationMSec = 9000;
  self->_thirdPartyDevPreferredLanguages = 0;

  self->_areProcessTerminationsMonitored = 0;
  return self;
}

- (HUDConfiguration)initWithRunloopHangTimeoutDurationMSec:(unint64_t)a3 thirdPartyDevPreferredLanguages:(id)a4 areProcessTerminationsMonitored:(BOOL)a5 processTerminationsFiltering:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HUDConfiguration;
  v13 = [(HUDConfiguration *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_runloopHangTimeoutDurationMSec = a3;
    objc_storeStrong((id *)&v13->_thirdPartyDevPreferredLanguages, a4);
    v14->_areProcessTerminationsMonitored = a5;
    objc_storeStrong((id *)&v14->_processTerminationsFiltering, a6);
  }

  return v14;
}

- (void)updateWithHUDConfiguration:(id)a3
{
  id v4 = a3;
  self->_runloopHangTimeoutDurationMSec = (unint64_t)[v4 runloopHangTimeoutDurationMSec];
  v5 = [v4 thirdPartyDevPreferredLanguages];
  thirdPartyDevPreferredLanguages = self->_thirdPartyDevPreferredLanguages;
  self->_thirdPartyDevPreferredLanguages = v5;

  self->_areProcessTerminationsMonitored = [v4 areProcessTerminationsMonitored];
  v7 = [v4 processTerminationsFiltering];

  processTerminationsFiltering = self->_processTerminationsFiltering;
  self->_processTerminationsFiltering = v7;
}

- (HUDConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntegerForKey:@"runloopHangTimeoutDurationMSec"];
  v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"thirdPartyDevPreferredLanguages"];
  id v7 = [v4 decodeBoolForKey:@"areProcessTerminationsMonitored"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processTerminationsFiltering"];

  v9 = [(HUDConfiguration *)self initWithRunloopHangTimeoutDurationMSec:v5 thirdPartyDevPreferredLanguages:v6 areProcessTerminationsMonitored:v7 processTerminationsFiltering:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t runloopHangTimeoutDurationMSec = self->_runloopHangTimeoutDurationMSec;
  id v5 = a3;
  [v5 encodeInt64:runloopHangTimeoutDurationMSec forKey:@"runloopHangTimeoutDurationMSec"];
  [v5 encodeObject:self->_thirdPartyDevPreferredLanguages forKey:@"thirdPartyDevPreferredLanguages"];
  [v5 encodeBool:self->_areProcessTerminationsMonitored forKey:@"areProcessTerminationsMonitored"];
  [v5 encodeObject:self->_processTerminationsFiltering forKey:@"processTerminationsFiltering"];
}

- (unint64_t)runloopHangTimeoutDurationMSec
{
  return self->_runloopHangTimeoutDurationMSec;
}

- (NSArray)thirdPartyDevPreferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)areProcessTerminationsMonitored
{
  return self->_areProcessTerminationsMonitored;
}

- (HTProcessExitFilteringConfiguration)processTerminationsFiltering
{
  return (HTProcessExitFilteringConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processTerminationsFiltering, 0);

  objc_storeStrong((id *)&self->_thirdPartyDevPreferredLanguages, 0);
}

@end