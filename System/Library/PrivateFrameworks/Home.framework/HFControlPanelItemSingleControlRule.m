@interface HFControlPanelItemSingleControlRule
- (HFControlPanelItemSingleControlRule)initWithFilter:(id)a3 displayResultsGenerator:(id)a4;
- (id)controlPanelItemForControlItems:(id)a3;
- (id)displayResultsGenerator;
- (id)filter;
@end

@implementation HFControlPanelItemSingleControlRule

- (HFControlPanelItemSingleControlRule)initWithFilter:(id)a3 displayResultsGenerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFControlPanelItemSingleControlRule;
  v8 = [(HFControlPanelItemSingleControlRule *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id filter = v8->_filter;
    v8->_id filter = (id)v9;

    uint64_t v11 = [v7 copy];
    id displayResultsGenerator = v8->_displayResultsGenerator;
    v8->_id displayResultsGenerator = (id)v11;
  }
  return v8;
}

- (id)controlPanelItemForControlItems:(id)a3
{
  id v4 = a3;
  v5 = [(HFControlPanelItemSingleControlRule *)self filter];
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v5);

  if (v6)
  {
    id v7 = [HFControlPanelItem alloc];
    v8 = [MEMORY[0x263EFFA08] setWithObject:v6];
    uint64_t v9 = [(HFControlPanelItemSingleControlRule *)self displayResultsGenerator];
    v10 = ((void (**)(void, void *))v9)[2](v9, v6);
    uint64_t v11 = [(HFControlPanelItem *)v7 initWithControlItems:v8 displayResults:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)filter
{
  return self->_filter;
}

- (id)displayResultsGenerator
{
  return self->_displayResultsGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_displayResultsGenerator, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end