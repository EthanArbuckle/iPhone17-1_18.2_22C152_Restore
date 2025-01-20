@interface MKTransitShield
- (MKTransitShield)initWithShieldType:(int64_t)a3 text:(id)a4 color:(id)a5;
- (NSString)shieldColorString;
- (NSString)shieldText;
- (int64_t)shieldType;
@end

@implementation MKTransitShield

- (MKTransitShield)initWithShieldType:(int64_t)a3 text:(id)a4 color:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MKTransitShield;
  v10 = [(MKTransitShield *)&v18 init];
  v11 = v10;
  if (v10)
  {
    v10->_shieldType = a3;
    uint64_t v12 = [v8 copy];
    shieldText = v11->_shieldText;
    v11->_shieldText = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    shieldColorString = v11->_shieldColorString;
    v11->_shieldColorString = (NSString *)v14;

    v16 = v11;
  }

  return v11;
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (NSString)shieldColorString
{
  return self->_shieldColorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldColorString, 0);

  objc_storeStrong((id *)&self->_shieldText, 0);
}

@end