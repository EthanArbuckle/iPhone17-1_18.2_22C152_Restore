@interface CBABCurveConfiguration
- (BOOL)isBuiltin;
- (BOOL)isEnergySaving;
- (NSNumber)maxBrightness;
- (NSNumber)minBrightness;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)uuid;
- (id)description;
- (void)dealloc;
- (void)setIsBuiltin:(BOOL)a3;
- (void)setIsEnergySaving:(BOOL)a3;
- (void)setMaxBrightness:(id)a3;
- (void)setMinBrightness:(id)a3;
- (void)setProductID:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVendorID:(id)a3;
@end

@implementation CBABCurveConfiguration

- (id)description
{
  return (id)[NSString stringWithFormat:@"uuid=%@ vendor=%@ productID=%@ maxB=%@ minB=%@ builtin=%d energySaving=%d", self->_uuid, self->_vendorID, self->_productID, self->_maxBrightness, self->_minBrightness, self->_isBuiltin, self->_isEnergySaving];
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBABCurveConfiguration;
  [(CBABCurveConfiguration *)&v2 dealloc];
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSNumber)maxBrightness
{
  return self->_maxBrightness;
}

- (void)setMaxBrightness:(id)a3
{
}

- (NSNumber)minBrightness
{
  return self->_minBrightness;
}

- (void)setMinBrightness:(id)a3
{
}

- (BOOL)isBuiltin
{
  return self->_isBuiltin;
}

- (void)setIsBuiltin:(BOOL)a3
{
  self->_isBuiltin = a3;
}

- (BOOL)isEnergySaving
{
  return self->_isEnergySaving;
}

- (void)setIsEnergySaving:(BOOL)a3
{
  self->_isEnergySaving = a3;
}

@end