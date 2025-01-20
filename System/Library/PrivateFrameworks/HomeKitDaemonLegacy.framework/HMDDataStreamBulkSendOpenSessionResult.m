@interface HMDDataStreamBulkSendOpenSessionResult
- (HMDDataStreamBulkSendOpenSessionResult)initWithSession:(id)a3 payload:(id)a4;
- (HMDDataStreamBulkSendSession)session;
- (NSDictionary)payload;
- (id)attributeDescriptions;
@end

@implementation HMDDataStreamBulkSendOpenSessionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (HMDDataStreamBulkSendSession)session
{
  return self->_session;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDDataStreamBulkSendOpenSessionResult *)self session];
  v5 = (void *)[v3 initWithName:@"session" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDDataStreamBulkSendOpenSessionResult *)self payload];
  v8 = (void *)[v6 initWithName:@"payload" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDDataStreamBulkSendOpenSessionResult)initWithSession:(id)a3 payload:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDDataStreamBulkSendOpenSessionResult;
  v9 = [(HMDDataStreamBulkSendOpenSessionResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

@end