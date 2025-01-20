@interface WFContactLabeledValue
+ (WFContactLabeledValue)labeledValueWithLabel:(id)a3 value:(id)a4;
+ (id)localizedStringForLabel:(id)a3;
- (NSString)label;
- (WFContactLabeledValue)initWithLabel:(id)a3 value:(id)a4;
- (id)description;
- (id)value;
@end

@implementation WFContactLabeledValue

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (id)value
{
  return self->_value;
}

- (NSString)label
{
  return self->_label;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)WFContactLabeledValue;
  v4 = [(WFContactLabeledValue *)&v9 description];
  v5 = [(WFContactLabeledValue *)self label];
  v6 = [(WFContactLabeledValue *)self value];
  v7 = [v3 stringWithFormat:@"%@: label=%@, value=%@", v4, v5, v6];

  return v7;
}

- (WFContactLabeledValue)initWithLabel:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && (v12.receiver = self,
        v12.super_class = (Class)WFContactLabeledValue,
        (self = [(WFContactLabeledValue *)&v12 init]) != 0))
  {
    v8 = (NSString *)[v6 copy];
    label = self->_label;
    self->_label = v8;

    objc_storeStrong(&self->_value, a4);
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)localizedStringForLabel:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)getCNLabeledValueClass_softClass;
  uint64_t v12 = getCNLabeledValueClass_softClass;
  if (!getCNLabeledValueClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getCNLabeledValueClass_block_invoke;
    v8[3] = &unk_26428AC60;
    v8[4] = &v9;
    __getCNLabeledValueClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [v5 localizedStringForLabel:v3];

  return v6;
}

+ (WFContactLabeledValue)labeledValueWithLabel:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithLabel:v7 value:v6];

  return (WFContactLabeledValue *)v8;
}

@end