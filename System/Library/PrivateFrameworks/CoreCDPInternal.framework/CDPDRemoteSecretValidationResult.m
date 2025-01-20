@interface CDPDRemoteSecretValidationResult
- (BOOL)userDidCancel;
- (BOOL)userDidReset;
- (CDPDevice)device;
- (CDPLocalSecret)cachedSecretForReenrollment;
- (NSDictionary)recoveredInfo;
- (NSString)validSecret;
- (OTClique)recoveredClique;
- (unint64_t)escapeOffersPresentedMask;
- (unint64_t)requiredEscapeOffers;
- (unint64_t)secretType;
- (void)setCachedSecretForReenrollment:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEscapeOffersPresentedMask:(unint64_t)a3;
- (void)setRecoveredClique:(id)a3;
- (void)setRecoveredInfo:(id)a3;
- (void)setRequiredEscapeOffers:(unint64_t)a3;
- (void)setSecretType:(unint64_t)a3;
- (void)setUserDidCancel:(BOOL)a3;
- (void)setUserDidReset:(BOOL)a3;
- (void)setValidSecret:(id)a3;
@end

@implementation CDPDRemoteSecretValidationResult

- (unint64_t)secretType
{
  return self->_secretType;
}

- (void)setSecretType:(unint64_t)a3
{
  self->_secretType = a3;
}

- (BOOL)userDidCancel
{
  return self->_userDidCancel;
}

- (void)setUserDidCancel:(BOOL)a3
{
  self->_userDidCancel = a3;
}

- (BOOL)userDidReset
{
  return self->_userDidReset;
}

- (void)setUserDidReset:(BOOL)a3
{
  self->_userDidReset = a3;
}

- (unint64_t)requiredEscapeOffers
{
  return self->_requiredEscapeOffers;
}

- (void)setRequiredEscapeOffers:(unint64_t)a3
{
  self->_requiredEscapeOffers = a3;
}

- (unint64_t)escapeOffersPresentedMask
{
  return self->_escapeOffersPresentedMask;
}

- (void)setEscapeOffersPresentedMask:(unint64_t)a3
{
  self->_escapeOffersPresentedMask = a3;
}

- (CDPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSString)validSecret
{
  return self->_validSecret;
}

- (void)setValidSecret:(id)a3
{
}

- (CDPLocalSecret)cachedSecretForReenrollment
{
  return self->_cachedSecretForReenrollment;
}

- (void)setCachedSecretForReenrollment:(id)a3
{
}

- (NSDictionary)recoveredInfo
{
  return self->_recoveredInfo;
}

- (void)setRecoveredInfo:(id)a3
{
}

- (OTClique)recoveredClique
{
  return self->_recoveredClique;
}

- (void)setRecoveredClique:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveredClique, 0);
  objc_storeStrong((id *)&self->_recoveredInfo, 0);
  objc_storeStrong((id *)&self->_cachedSecretForReenrollment, 0);
  objc_storeStrong((id *)&self->_validSecret, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end