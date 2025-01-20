@interface MTRActivatedCarbonFilterMonitoringClusterReplacementProductStruct
- (MTRActivatedCarbonFilterMonitoringClusterReplacementProductStruct)init;
- (NSNumber)productIdentifierType;
- (NSString)productIdentifierValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setProductIdentifierType:(id)a3;
- (void)setProductIdentifierValue:(id)a3;
@end

@implementation MTRActivatedCarbonFilterMonitoringClusterReplacementProductStruct

- (MTRActivatedCarbonFilterMonitoringClusterReplacementProductStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRActivatedCarbonFilterMonitoringClusterReplacementProductStruct;
  v2 = [(MTRActivatedCarbonFilterMonitoringClusterReplacementProductStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    productIdentifierType = v2->_productIdentifierType;
    v2->_productIdentifierType = (NSNumber *)&unk_26F9C8620;

    productIdentifierValue = v3->_productIdentifierValue;
    v3->_productIdentifierValue = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRActivatedCarbonFilterMonitoringClusterReplacementProductStruct);
  objc_super v7 = objc_msgSend_productIdentifierType(self, v5, v6);
  objc_msgSend_setProductIdentifierType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_productIdentifierValue(self, v9, v10);
  objc_msgSend_setProductIdentifierValue_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: productIdentifierType:%@; productIdentifierValue:%@; >",
    v5,
    self->_productIdentifierType,
  objc_super v7 = self->_productIdentifierValue);

  return v7;
}

- (NSNumber)productIdentifierType
{
  return self->_productIdentifierType;
}

- (void)setProductIdentifierType:(id)a3
{
}

- (NSString)productIdentifierValue
{
  return self->_productIdentifierValue;
}

- (void)setProductIdentifierValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifierValue, 0);

  objc_storeStrong((id *)&self->_productIdentifierType, 0);
}

@end