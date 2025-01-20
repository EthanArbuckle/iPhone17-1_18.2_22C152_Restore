@interface HMBLocalZoneProcessTuple
- (HMBLocalSQLQueryTable)queryTable;
- (HMBLocalZoneProcessModelContext)mergedContext;
- (HMBLocalZoneProcessModelContext)previousContext;
- (HMBLocalZoneProcessTuple)initWithPreviousContext:(id)a3 mergedContext:(id)a4 updateModel:(id)a5 outputModel:(id)a6 outputBlockRow:(id)a7 recordRow:(unint64_t)a8 itemRow:(unint64_t)a9 modelSchema:(id)a10 modelType:(id)a11 externalID:(id)a12 queryTable:(id)a13;
- (HMBModel)outputModel;
- (HMBModel)updateModel;
- (NSArray)encodedQueryableColumns;
- (NSData)externalID;
- (NSNumber)outputBlockRow;
- (NSString)modelType;
- (NSUUID)modelSchema;
- (unint64_t)itemRow;
- (unint64_t)recordRow;
@end

@implementation HMBLocalZoneProcessTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedQueryableColumns, 0);
  objc_storeStrong((id *)&self->_queryTable, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelSchema, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_outputBlockRow, 0);
  objc_storeStrong((id *)&self->_outputModel, 0);
  objc_storeStrong((id *)&self->_updateModel, 0);
  objc_storeStrong((id *)&self->_mergedContext, 0);
  objc_storeStrong((id *)&self->_previousContext, 0);
}

- (NSArray)encodedQueryableColumns
{
  return self->_encodedQueryableColumns;
}

- (HMBLocalSQLQueryTable)queryTable
{
  return self->_queryTable;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (NSUUID)modelSchema
{
  return self->_modelSchema;
}

- (NSData)externalID
{
  return self->_externalID;
}

- (unint64_t)itemRow
{
  return self->_itemRow;
}

- (unint64_t)recordRow
{
  return self->_recordRow;
}

- (NSNumber)outputBlockRow
{
  return self->_outputBlockRow;
}

- (HMBModel)outputModel
{
  return self->_outputModel;
}

- (HMBModel)updateModel
{
  return self->_updateModel;
}

- (HMBLocalZoneProcessModelContext)mergedContext
{
  return self->_mergedContext;
}

- (HMBLocalZoneProcessModelContext)previousContext
{
  return self->_previousContext;
}

- (HMBLocalZoneProcessTuple)initWithPreviousContext:(id)a3 mergedContext:(id)a4 updateModel:(id)a5 outputModel:(id)a6 outputBlockRow:(id)a7 recordRow:(unint64_t)a8 itemRow:(unint64_t)a9 modelSchema:(id)a10 modelType:(id)a11 externalID:(id)a12 queryTable:(id)a13
{
  id v29 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a10;
  id v31 = a11;
  id v30 = a12;
  id v19 = a13;
  v37.receiver = self;
  v37.super_class = (Class)HMBLocalZoneProcessTuple;
  v20 = [(HMBLocalZoneProcessTuple *)&v37 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_previousContext, a3);
    p_mergedContext = (id *)&v21->_mergedContext;
    objc_storeStrong((id *)&v21->_mergedContext, a4);
    objc_storeStrong((id *)&v21->_outputBlockRow, a7);
    objc_storeStrong((id *)&v21->_outputModel, a6);
    objc_storeStrong((id *)&v21->_updateModel, a5);
    v21->_recordRow = a8;
    v21->_itemRow = a9;
    objc_storeStrong((id *)&v21->_modelSchema, a10);
    objc_storeStrong((id *)&v21->_modelType, a11);
    objc_storeStrong((id *)&v21->_externalID, a12);
    objc_storeStrong((id *)&v21->_queryTable, a13);
    queryTable = v21->_queryTable;
    if (queryTable)
    {
      if (*p_mergedContext)
      {
        v24 = [*p_mergedContext model];
        uint64_t v25 = [(HMBLocalSQLQueryTable *)queryTable buildQueriableFieldsForModel:v24];
        encodedQueryableColumns = v21->_encodedQueryableColumns;
        v21->_encodedQueryableColumns = (NSArray *)v25;
      }
    }
  }

  return v21;
}

@end