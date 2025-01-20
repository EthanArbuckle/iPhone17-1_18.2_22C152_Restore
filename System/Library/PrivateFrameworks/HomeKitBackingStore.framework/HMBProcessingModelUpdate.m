@interface HMBProcessingModelUpdate
- (HMBModel)previousModel;
- (HMBProcessingModelUpdate)initWithModel:(id)a3 previousModel:(id)a4 options:(id)a5 mirrorOutputFuture:(id)a6;
- (id)attributeDescriptions;
@end

@implementation HMBProcessingModelUpdate

- (void).cxx_destruct
{
}

- (HMBModel)previousModel
{
  return (HMBModel *)objc_getProperty(self, a2, 32, 1);
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMBProcessingModelUpdate;
  v3 = [(HMBProcessingModelResult *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMBProcessingModelUpdate *)self previousModel];
  v6 = (void *)[v4 initWithName:@"Previous Model" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMBProcessingModelUpdate)initWithModel:(id)a3 previousModel:(id)a4 options:(id)a5 mirrorOutputFuture:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    v14 = v13;
    v20.receiver = self;
    v20.super_class = (Class)HMBProcessingModelUpdate;
    v15 = [(HMBProcessingModelResult *)&v20 initWithModel:v10 options:v12 mirrorOutputFuture:v13];
    v16 = v15;
    if (v15) {
      objc_storeStrong((id *)&v15->_previousModel, a4);
    }

    return v16;
  }
  else
  {
    v18 = (HMBCloudZoneFetchRecordsContext *)_HMFPreconditionFailure();
    [(HMBCloudZoneFetchRecordsContext *)v18 .cxx_destruct];
  }
  return result;
}

@end