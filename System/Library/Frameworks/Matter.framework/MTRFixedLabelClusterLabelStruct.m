@interface MTRFixedLabelClusterLabelStruct
- (MTRFixedLabelClusterLabelStruct)init;
- (NSString)label;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLabel:(NSString *)label;
- (void)setValue:(NSString *)value;
@end

@implementation MTRFixedLabelClusterLabelStruct

- (MTRFixedLabelClusterLabelStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRFixedLabelClusterLabelStruct;
  v2 = [(MTRFixedLabelClusterLabelStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    label = v2->_label;
    v2->_label = (NSString *)&stru_26F969DC8;

    value = v3->_value;
    v3->_value = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRFixedLabelClusterLabelStruct);
  objc_super v7 = objc_msgSend_label(self, v5, v6);
  objc_msgSend_setLabel_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_value(self, v9, v10);
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: label:%@ value:%@; >", v5, self->_label, self->_value);;

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(NSString *)value
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end