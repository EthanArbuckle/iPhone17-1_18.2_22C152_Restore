@interface MTREnergyPreferenceClusterBalanceStruct
- (MTREnergyPreferenceClusterBalanceStruct)init;
- (NSNumber)step;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLabel:(id)a3;
- (void)setStep:(id)a3;
@end

@implementation MTREnergyPreferenceClusterBalanceStruct

- (MTREnergyPreferenceClusterBalanceStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTREnergyPreferenceClusterBalanceStruct;
  v2 = [(MTREnergyPreferenceClusterBalanceStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    step = v2->_step;
    v2->_step = (NSNumber *)&unk_26F9C8620;

    label = v3->_label;
    v3->_label = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTREnergyPreferenceClusterBalanceStruct);
  objc_super v7 = objc_msgSend_step(self, v5, v6);
  objc_msgSend_setStep_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_label(self, v9, v10);
  objc_msgSend_setLabel_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: step:%@ label:%@; >", v5, self->_step, self->_label);;

  return v7;
}

- (NSNumber)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_step, 0);
}

@end