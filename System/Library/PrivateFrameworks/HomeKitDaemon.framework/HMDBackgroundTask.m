@interface HMDBackgroundTask
- (HMDBackgroundTask)initWithIdentifier:(id)a3 expectedFireDate:(id)a4 scheduledDate:(id)a5;
- (NSDate)expectedFireDate;
- (NSDate)scheduledDate;
- (NSString)identifier;
- (id)attributeDescriptions;
@end

@implementation HMDBackgroundTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scheduledDate, 0);
  objc_storeStrong((id *)&self->_expectedFireDate, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)scheduledDate
{
  return self->_scheduledDate;
}

- (NSDate)expectedFireDate
{
  return self->_expectedFireDate;
}

- (id)attributeDescriptions
{
  v16[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDBackgroundTask *)self identifier];
  v5 = (void *)[v3 initWithName:@"identifier" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDBackgroundTask *)self expectedFireDate];
  v8 = objc_msgSend(v7, "hmf_localTimeDescription");
  v9 = (void *)[v6 initWithName:@"expected fire date" value:v8];
  v16[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMDBackgroundTask *)self scheduledDate];
  v12 = objc_msgSend(v11, "hmf_localTimeDescription");
  v13 = (void *)[v10 initWithName:@"scheduled date" value:v12];
  v16[2] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];

  return v14;
}

- (HMDBackgroundTask)initWithIdentifier:(id)a3 expectedFireDate:(id)a4 scheduledDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDBackgroundTask;
  v12 = [(HMDBackgroundTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_expectedFireDate, a4);
    objc_storeStrong((id *)&v13->_scheduledDate, a5);
  }

  return v13;
}

@end