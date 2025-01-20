@interface AMSUIDynamicImpressionMetrics
- (AMSUIDynamicImpressionMetrics)initWithIdentifier:(id)a3 fields:(id)a4 custom:(id)a5;
- (AMSUIDynamicImpressionMetricsIdentifier)identifier;
- (NSDictionary)custom;
- (NSDictionary)fields;
- (void)setCustom:(id)a3;
- (void)setFields:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation AMSUIDynamicImpressionMetrics

- (AMSUIDynamicImpressionMetrics)initWithIdentifier:(id)a3 fields:(id)a4 custom:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v11 = (void *)getAMSUIDDynamicImpressionMetricsClass_softClass;
  uint64_t v19 = getAMSUIDDynamicImpressionMetricsClass_softClass;
  if (!getAMSUIDDynamicImpressionMetricsClass_softClass)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getAMSUIDDynamicImpressionMetricsClass_block_invoke;
    v15[3] = &unk_2643E33D8;
    v15[4] = &v16;
    __getAMSUIDDynamicImpressionMetricsClass_block_invoke((uint64_t)v15);
    v11 = (void *)v17[3];
  }
  v12 = v11;
  _Block_object_dispose(&v16, 8);
  v13 = (AMSUIDynamicImpressionMetrics *)[[v12 alloc] initWithIdentifier:v8 fields:v9 custom:v10];

  return v13;
}

- (NSDictionary)custom
{
  return self->_custom;
}

- (void)setCustom:(id)a3
{
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (AMSUIDynamicImpressionMetricsIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_custom, 0);
}

@end