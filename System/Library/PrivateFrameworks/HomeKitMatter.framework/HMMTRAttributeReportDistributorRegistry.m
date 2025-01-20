@interface HMMTRAttributeReportDistributorRegistry
- (HMMTRAttributeReportDistributorRegistry)initWithQueue:(id)a3 receiver:(id)a4;
- (OS_dispatch_queue)queue;
- (id)receiver;
@end

@implementation HMMTRAttributeReportDistributorRegistry

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)receiver
{
  return self->_receiver;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMMTRAttributeReportDistributorRegistry)initWithQueue:(id)a3 receiver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.id receiver = self;
  v14.super_class = (Class)HMMTRAttributeReportDistributorRegistry;
  v9 = [(HMMTRAttributeReportDistributorRegistry *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = MEMORY[0x2533B66E0](v8);
    id receiver = v10->_receiver;
    v10->_id receiver = (id)v11;
  }
  return v10;
}

@end