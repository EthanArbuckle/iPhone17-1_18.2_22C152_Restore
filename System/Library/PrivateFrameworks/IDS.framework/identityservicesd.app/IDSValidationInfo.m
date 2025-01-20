@interface IDSValidationInfo
- (BOOL)isBuildingContext;
- (BOOL)validationContextDisabled;
- (IDSValidationSession)validationSession;
- (NACContextOpaque_)validationContext;
- (NSDate)validateContextDate;
- (NSMutableArray)validationContextQueue;
- (NSNumber)validateContextTTL;
- (void)setIsBuildingContext:(BOOL)a3;
- (void)setValidateContextDate:(id)a3;
- (void)setValidateContextTTL:(id)a3;
- (void)setValidationContext:(NACContextOpaque_ *)a3;
- (void)setValidationContextDisabled:(BOOL)a3;
- (void)setValidationContextQueue:(id)a3;
- (void)setValidationSession:(id)a3;
@end

@implementation IDSValidationInfo

- (NSDate)validateContextDate
{
  return self->_validateContextDate;
}

- (void)setValidateContextDate:(id)a3
{
}

- (NSNumber)validateContextTTL
{
  return self->_validateContextTTL;
}

- (void)setValidateContextTTL:(id)a3
{
}

- (BOOL)isBuildingContext
{
  return self->_isBuildingContext;
}

- (void)setIsBuildingContext:(BOOL)a3
{
  self->_isBuildingContext = a3;
}

- (NACContextOpaque_)validationContext
{
  return self->_validationContext;
}

- (void)setValidationContext:(NACContextOpaque_ *)a3
{
  self->_validationContext = a3;
}

- (BOOL)validationContextDisabled
{
  return self->_validationContextDisabled;
}

- (void)setValidationContextDisabled:(BOOL)a3
{
  self->_validationContextDisabled = a3;
}

- (IDSValidationSession)validationSession
{
  return self->_validationSession;
}

- (void)setValidationSession:(id)a3
{
}

- (NSMutableArray)validationContextQueue
{
  return self->_validationContextQueue;
}

- (void)setValidationContextQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationContextQueue, 0);
  objc_storeStrong((id *)&self->_validationSession, 0);
  objc_storeStrong((id *)&self->_validateContextTTL, 0);

  objc_storeStrong((id *)&self->_validateContextDate, 0);
}

@end