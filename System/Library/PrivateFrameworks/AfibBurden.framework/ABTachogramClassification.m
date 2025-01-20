@interface ABTachogramClassification
- (BOOL)aFibDetected;
- (NSDate)date;
- (NSUUID)uuid;
- (void)setAFibDetected:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation ABTachogramClassification

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)aFibDetected
{
  return self->_aFibDetected;
}

- (void)setAFibDetected:(BOOL)a3
{
  self->_aFibDetected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end