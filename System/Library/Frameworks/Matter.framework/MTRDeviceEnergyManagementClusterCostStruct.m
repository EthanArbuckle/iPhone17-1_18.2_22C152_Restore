@interface MTRDeviceEnergyManagementClusterCostStruct
- (MTRDeviceEnergyManagementClusterCostStruct)init;
- (NSNumber)costType;
- (NSNumber)currency;
- (NSNumber)decimalPoints;
- (NSNumber)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCostType:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setDecimalPoints:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MTRDeviceEnergyManagementClusterCostStruct

- (MTRDeviceEnergyManagementClusterCostStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRDeviceEnergyManagementClusterCostStruct;
  v2 = [(MTRDeviceEnergyManagementClusterCostStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    costType = v2->_costType;
    v2->_costType = (NSNumber *)&unk_26F9C8620;

    value = v3->_value;
    v3->_value = (NSNumber *)&unk_26F9C8620;

    decimalPoints = v3->_decimalPoints;
    v3->_decimalPoints = (NSNumber *)&unk_26F9C8620;

    currency = v3->_currency;
    v3->_currency = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDeviceEnergyManagementClusterCostStruct);
  v7 = objc_msgSend_costType(self, v5, v6);
  objc_msgSend_setCostType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_value(self, v9, v10);
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_decimalPoints(self, v13, v14);
  objc_msgSend_setDecimalPoints_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_currency(self, v17, v18);
  objc_msgSend_setCurrency_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: costType:%@; value:%@; decimalPoints:%@; currency:%@; >",
    v5,
    self->_costType,
    self->_value,
    self->_decimalPoints,
  v7 = self->_currency);

  return v7;
}

- (NSNumber)costType
{
  return self->_costType;
}

- (void)setCostType:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSNumber)decimalPoints
{
  return self->_decimalPoints;
}

- (void)setDecimalPoints:(id)a3
{
}

- (NSNumber)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_decimalPoints, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_costType, 0);
}

@end