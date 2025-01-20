@interface STRecommendation
- (BOOL)mayCauseDataLoss;
- (Class)detailClass;
- (NSString)additionalButtonTitle;
- (NSString)bundleID;
- (NSString)confirmationButtonTitle;
- (NSString)confirmationText;
- (NSString)enableButtonTitle;
- (NSString)explanaition;
- (NSString)identifier;
- (NSString)title;
- (float)progress;
- (int64_t)gain;
- (void)setAdditionalButtonTitle:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConfirmationButtonTitle:(id)a3;
- (void)setConfirmationText:(id)a3;
- (void)setDetailClass:(Class)a3;
- (void)setEnableButtonTitle:(id)a3;
- (void)setExplanaition:(id)a3;
- (void)setGain:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMayCauseDataLoss:(BOOL)a3;
- (void)setProgress:(float)a3;
- (void)setTitle:(id)a3;
@end

@implementation STRecommendation

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)explanaition
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExplanaition:(id)a3
{
}

- (int64_t)gain
{
  return self->_gain;
}

- (void)setGain:(int64_t)a3
{
  self->_gain = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (BOOL)mayCauseDataLoss
{
  return self->_mayCauseDataLoss;
}

- (void)setMayCauseDataLoss:(BOOL)a3
{
  self->_mayCauseDataLoss = a3;
}

- (NSString)confirmationText
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConfirmationText:(id)a3
{
}

- (NSString)confirmationButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfirmationButtonTitle:(id)a3
{
}

- (NSString)additionalButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAdditionalButtonTitle:(id)a3
{
}

- (Class)detailClass
{
  return self->_detailClass;
}

- (void)setDetailClass:(Class)a3
{
  self->_detailClass = a3;
}

- (NSString)enableButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEnableButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableButtonTitle, 0);
  objc_storeStrong((id *)&self->_additionalButtonTitle, 0);
  objc_storeStrong((id *)&self->_confirmationButtonTitle, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_explanaition, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end