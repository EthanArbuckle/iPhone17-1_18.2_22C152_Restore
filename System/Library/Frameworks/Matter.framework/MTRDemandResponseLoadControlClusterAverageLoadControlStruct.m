@interface MTRDemandResponseLoadControlClusterAverageLoadControlStruct
- (MTRDemandResponseLoadControlClusterAverageLoadControlStruct)init;
- (NSNumber)loadAdjustment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLoadAdjustment:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterAverageLoadControlStruct

- (MTRDemandResponseLoadControlClusterAverageLoadControlStruct)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTRDemandResponseLoadControlClusterAverageLoadControlStruct;
  v2 = [(MTRDemandResponseLoadControlClusterAverageLoadControlStruct *)&v6 init];
  v3 = v2;
  if (v2)
  {
    loadAdjustment = v2->_loadAdjustment;
    v2->_loadAdjustment = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterAverageLoadControlStruct);
  v7 = objc_msgSend_loadAdjustment(self, v5, v6);
  objc_msgSend_setLoadAdjustment_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: loadAdjustment:%@ >", v5, self->_loadAdjustment);;

  return v7;
}

- (NSNumber)loadAdjustment
{
  return self->_loadAdjustment;
}

- (void)setLoadAdjustment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end