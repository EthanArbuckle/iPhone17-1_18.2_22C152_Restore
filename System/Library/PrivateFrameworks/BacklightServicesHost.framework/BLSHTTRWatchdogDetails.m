@interface BLSHTTRWatchdogDetails
- (BLSHTTRWatchdogDetails)init;
- (BOOL)showTTRAlert;
- (NSDate)timeOfIssue;
- (NSString)displayReason;
- (NSString)identifier;
- (NSString)radarDescription;
- (NSString)radarTitle;
- (void)setDisplayReason:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRadarTitle:(id)a3;
- (void)setShowTTRAlert:(BOOL)a3;
- (void)setTimeOfIssue:(id)a3;
@end

@implementation BLSHTTRWatchdogDetails

- (BLSHTTRWatchdogDetails)init
{
  v5.receiver = self;
  v5.super_class = (Class)BLSHTTRWatchdogDetails;
  v2 = [(BLSHTTRWatchdogDetails *)&v5 init];
  v3 = v2;
  if (v2) {
    [(BLSHTTRWatchdogDetails *)v2 setShowTTRAlert:0];
  }
  return v3;
}

- (BOOL)showTTRAlert
{
  return self->_showTTRAlert;
}

- (void)setShowTTRAlert:(BOOL)a3
{
  self->_showTTRAlert = a3;
}

- (NSString)radarTitle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRadarTitle:(id)a3
{
}

- (NSString)radarDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRadarDescription:(id)a3
{
}

- (NSString)displayReason
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDisplayReason:(id)a3
{
}

- (NSDate)timeOfIssue
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimeOfIssue:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_timeOfIssue, 0);
  objc_storeStrong((id *)&self->_displayReason, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);

  objc_storeStrong((id *)&self->_radarTitle, 0);
}

@end