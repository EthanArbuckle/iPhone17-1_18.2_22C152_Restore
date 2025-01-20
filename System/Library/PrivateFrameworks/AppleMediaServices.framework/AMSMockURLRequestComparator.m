@interface AMSMockURLRequestComparator
- (AMSMockURLRequestComparator)initWithCriteriaBlock:(id)a3;
- (BOOL)shouldOverrideURLRequest:(id)a3;
- (id)criteriaBlock;
- (void)setCriteriaBlock:(id)a3;
@end

@implementation AMSMockURLRequestComparator

- (AMSMockURLRequestComparator)initWithCriteriaBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMockURLRequestComparator;
  v5 = [(AMSMockURLRequestComparator *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id criteriaBlock = v5->_criteriaBlock;
    v5->_id criteriaBlock = v6;
  }
  return v5;
}

- (BOOL)shouldOverrideURLRequest:(id)a3
{
  id v4 = a3;
  v5 = [(AMSMockURLRequestComparator *)self criteriaBlock];
  char v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)criteriaBlock
{
  return self->_criteriaBlock;
}

- (void)setCriteriaBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end