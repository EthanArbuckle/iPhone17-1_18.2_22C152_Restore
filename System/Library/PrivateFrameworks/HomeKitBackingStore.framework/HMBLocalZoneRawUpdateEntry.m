@interface HMBLocalZoneRawUpdateEntry
- (HMBLocalZoneRawUpdateEntry)initWithModel:(id)a3 encoded:(id)a4;
- (HMBModel)model;
- (NSData)encoded;
- (void)setEncoded:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation HMBLocalZoneRawUpdateEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_encoded, 0);
}

- (void)setModel:(id)a3
{
}

- (HMBModel)model
{
  return self->_model;
}

- (void)setEncoded:(id)a3
{
}

- (NSData)encoded
{
  return self->_encoded;
}

- (HMBLocalZoneRawUpdateEntry)initWithModel:(id)a3 encoded:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBLocalZoneRawUpdateEntry;
  v9 = [(HMBLocalZoneRawUpdateEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_model, a3);
    objc_storeStrong((id *)&v10->_encoded, a4);
  }

  return v10;
}

@end