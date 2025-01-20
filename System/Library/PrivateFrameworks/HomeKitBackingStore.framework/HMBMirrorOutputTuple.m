@interface HMBMirrorOutputTuple
- (HMBLocalSQLQueryTable)queryTable;
- (HMBMirrorOutputTuple)initWithOutputBlockRow:(unint64_t)a3 recordRow:(unint64_t)a4 model:(id)a5 queryTable:(id)a6 externalID:(id)a7 externalData:(id)a8;
- (HMBModel)model;
- (NSData)externalData;
- (NSData)externalID;
- (id)attributeDescriptions;
- (unint64_t)outputBlockRow;
- (unint64_t)recordRow;
- (void)setExternalData:(id)a3;
- (void)setExternalID:(id)a3;
@end

@implementation HMBMirrorOutputTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryTable, 0);
  objc_storeStrong((id *)&self->_externalData, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (unint64_t)outputBlockRow
{
  return self->_outputBlockRow;
}

- (unint64_t)recordRow
{
  return self->_recordRow;
}

- (HMBLocalSQLQueryTable)queryTable
{
  return self->_queryTable;
}

- (void)setExternalData:(id)a3
{
}

- (NSData)externalData
{
  return self->_externalData;
}

- (void)setExternalID:(id)a3
{
}

- (NSData)externalID
{
  return self->_externalID;
}

- (HMBModel)model
{
  return self->_model;
}

- (id)attributeDescriptions
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBMirrorOutputTuple outputBlockRow](self, "outputBlockRow"));
  v23 = (void *)[v3 initWithName:@"Output Block Row" value:v24];
  v25[0] = v23;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[HMBMirrorOutputTuple recordRow](self, "recordRow"));
  v21 = (void *)[v4 initWithName:@"Record Row" value:v22];
  v25[1] = v21;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v20 = [(HMBMirrorOutputTuple *)self model];
  v6 = (void *)[v5 initWithName:@"Model" value:v20];
  v25[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMBMirrorOutputTuple *)self queryTable];
  v9 = (void *)[v7 initWithName:@"Query Table" value:v8];
  v25[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMBMirrorOutputTuple *)self externalID];
  v12 = [v11 hmbDescription];
  v13 = (void *)[v10 initWithName:@"External ID" value:v12];
  v25[4] = v13;
  id v14 = objc_alloc(MEMORY[0x1E4F653F8]);
  v15 = [(HMBMirrorOutputTuple *)self externalData];
  v16 = [v15 hmbDescription];
  v17 = (void *)[v14 initWithName:@"External Data" value:v16];
  v25[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];

  return v18;
}

- (HMBMirrorOutputTuple)initWithOutputBlockRow:(unint64_t)a3 recordRow:(unint64_t)a4 model:(id)a5 queryTable:(id)a6 externalID:(id)a7 externalData:(id)a8
{
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HMBMirrorOutputTuple;
  v18 = [(HMBMirrorOutputTuple *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_outputBlockRow = a3;
    v18->_recordRow = a4;
    objc_storeStrong((id *)&v18->_model, a5);
    objc_storeStrong((id *)&v19->_queryTable, a6);
    objc_storeStrong((id *)&v19->_externalID, a7);
    objc_storeStrong((id *)&v19->_externalData, a8);
  }

  return v19;
}

@end