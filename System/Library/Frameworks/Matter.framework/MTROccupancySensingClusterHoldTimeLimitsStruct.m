@interface MTROccupancySensingClusterHoldTimeLimitsStruct
- (MTROccupancySensingClusterHoldTimeLimitsStruct)init;
- (NSNumber)holdTimeDefault;
- (NSNumber)holdTimeMax;
- (NSNumber)holdTimeMin;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHoldTimeDefault:(id)a3;
- (void)setHoldTimeMax:(id)a3;
- (void)setHoldTimeMin:(id)a3;
@end

@implementation MTROccupancySensingClusterHoldTimeLimitsStruct

- (MTROccupancySensingClusterHoldTimeLimitsStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTROccupancySensingClusterHoldTimeLimitsStruct;
  v2 = [(MTROccupancySensingClusterHoldTimeLimitsStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    holdTimeMin = v2->_holdTimeMin;
    v2->_holdTimeMin = (NSNumber *)&unk_26F9C8620;

    holdTimeMax = v3->_holdTimeMax;
    v3->_holdTimeMax = (NSNumber *)&unk_26F9C8620;

    holdTimeDefault = v3->_holdTimeDefault;
    v3->_holdTimeDefault = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROccupancySensingClusterHoldTimeLimitsStruct);
  v7 = objc_msgSend_holdTimeMin(self, v5, v6);
  objc_msgSend_setHoldTimeMin_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_holdTimeMax(self, v9, v10);
  objc_msgSend_setHoldTimeMax_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_holdTimeDefault(self, v13, v14);
  objc_msgSend_setHoldTimeDefault_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: holdTimeMin:%@; holdTimeMax:%@; holdTimeDefault:%@; >",
    v5,
    self->_holdTimeMin,
    self->_holdTimeMax,
  v7 = self->_holdTimeDefault);

  return v7;
}

- (NSNumber)holdTimeMin
{
  return self->_holdTimeMin;
}

- (void)setHoldTimeMin:(id)a3
{
}

- (NSNumber)holdTimeMax
{
  return self->_holdTimeMax;
}

- (void)setHoldTimeMax:(id)a3
{
}

- (NSNumber)holdTimeDefault
{
  return self->_holdTimeDefault;
}

- (void)setHoldTimeDefault:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holdTimeDefault, 0);
  objc_storeStrong((id *)&self->_holdTimeMax, 0);

  objc_storeStrong((id *)&self->_holdTimeMin, 0);
}

@end