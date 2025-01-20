@interface HMBLocalZoneProcessModelContext
- (HMBLocalZoneProcessModelContext)initWithModel:(id)a3 outputBlockRow:(id)a4 externalData:(id)a5;
- (HMBModel)model;
- (NSData)externalData;
- (NSNumber)outputBlockRow;
@end

@implementation HMBLocalZoneProcessModelContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalData, 0);
  objc_storeStrong((id *)&self->_outputBlockRow, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (NSData)externalData
{
  return self->_externalData;
}

- (NSNumber)outputBlockRow
{
  return self->_outputBlockRow;
}

- (HMBModel)model
{
  return self->_model;
}

- (HMBLocalZoneProcessModelContext)initWithModel:(id)a3 outputBlockRow:(id)a4 externalData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v12 = v11;
    v20.receiver = self;
    v20.super_class = (Class)HMBLocalZoneProcessModelContext;
    v13 = [(HMBLocalZoneProcessModelContext *)&v20 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_model, a3);
      uint64_t v15 = [v10 copy];
      outputBlockRow = v14->_outputBlockRow;
      v14->_outputBlockRow = (NSNumber *)v15;

      objc_storeStrong((id *)&v14->_externalData, a5);
    }

    return v14;
  }
  else
  {
    v18 = (HMBLocalZoneProcessTuple *)_HMFPreconditionFailure();
    [(HMBLocalZoneProcessTuple *)v18 .cxx_destruct];
  }
  return result;
}

@end