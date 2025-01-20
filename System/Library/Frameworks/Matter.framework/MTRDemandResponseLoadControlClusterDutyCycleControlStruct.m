@interface MTRDemandResponseLoadControlClusterDutyCycleControlStruct
- (MTRDemandResponseLoadControlClusterDutyCycleControlStruct)init;
- (NSNumber)dutyCycle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDutyCycle:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterDutyCycleControlStruct

- (MTRDemandResponseLoadControlClusterDutyCycleControlStruct)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDemandResponseLoadControlClusterDutyCycleControlStruct;
  v2 = [(MTRDemandResponseLoadControlClusterDutyCycleControlStruct *)&v6 init];
  v3 = v2;
  if (v2)
  {
    dutyCycle = v2->_dutyCycle;
    v2->_dutyCycle = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterDutyCycleControlStruct);
  v7 = objc_msgSend_dutyCycle(self, v5, v6);
  objc_msgSend_setDutyCycle_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: dutyCycle:%@ >", v5, self->_dutyCycle);;

  return v7;
}

- (NSNumber)dutyCycle
{
  return self->_dutyCycle;
}

- (void)setDutyCycle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end