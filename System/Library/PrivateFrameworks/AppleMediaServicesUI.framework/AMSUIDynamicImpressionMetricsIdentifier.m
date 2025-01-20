@interface AMSUIDynamicImpressionMetricsIdentifier
- (AMSUIDynamicImpressionMetricsIdentifier)initWithParent:(id)a3 element:(id)a4 index:(int64_t)a5;
- (NSString)element;
- (NSString)parent;
- (int64_t)index;
- (void)setElement:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setParent:(id)a3;
@end

@implementation AMSUIDynamicImpressionMetricsIdentifier

- (AMSUIDynamicImpressionMetricsIdentifier)initWithParent:(id)a3 element:(id)a4 index:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v10 = (void *)getAMSUIDDynamicImpressionMetricsIdentifierClass_softClass;
  uint64_t v18 = getAMSUIDDynamicImpressionMetricsIdentifierClass_softClass;
  if (!getAMSUIDDynamicImpressionMetricsIdentifierClass_softClass)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __getAMSUIDDynamicImpressionMetricsIdentifierClass_block_invoke;
    v14[3] = &unk_2643E33D8;
    v14[4] = &v15;
    __getAMSUIDDynamicImpressionMetricsIdentifierClass_block_invoke((uint64_t)v14);
    v10 = (void *)v16[3];
  }
  v11 = v10;
  _Block_object_dispose(&v15, 8);
  v12 = (AMSUIDynamicImpressionMetricsIdentifier *)[[v11 alloc] initWithParent:v8 element:v9 index:a5];

  return v12;
}

- (NSString)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (NSString)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end