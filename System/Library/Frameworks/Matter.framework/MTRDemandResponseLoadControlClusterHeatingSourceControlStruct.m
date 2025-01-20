@interface MTRDemandResponseLoadControlClusterHeatingSourceControlStruct
- (MTRDemandResponseLoadControlClusterHeatingSourceControlStruct)init;
- (NSNumber)heatingSource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHeatingSource:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterHeatingSourceControlStruct

- (MTRDemandResponseLoadControlClusterHeatingSourceControlStruct)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDemandResponseLoadControlClusterHeatingSourceControlStruct;
  v2 = [(MTRDemandResponseLoadControlClusterHeatingSourceControlStruct *)&v6 init];
  v3 = v2;
  if (v2)
  {
    heatingSource = v2->_heatingSource;
    v2->_heatingSource = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterHeatingSourceControlStruct);
  v7 = objc_msgSend_heatingSource(self, v5, v6);
  objc_msgSend_setHeatingSource_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: heatingSource:%@ >", v5, self->_heatingSource);;

  return v7;
}

- (NSNumber)heatingSource
{
  return self->_heatingSource;
}

- (void)setHeatingSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end