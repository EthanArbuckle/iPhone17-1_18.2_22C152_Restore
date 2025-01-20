@interface ASCloudKitFetchConfiguration
- (ASCloudKitFetchConfiguration)initWithRecordType:(id)a3 shouldSkip:(BOOL)a4;
- (ASCloudKitFetchConfiguration)initWithRecordType:(id)a3 shouldSkip:(BOOL)a4 shouldCoalesce:(BOOL)a5 oldestAllowedModificationDate:(id)a6;
- (BOOL)shouldCoalesce;
- (BOOL)shouldSkip;
- (NSDate)oldestAllowedModificationDate;
- (NSString)recordType;
- (id)description;
@end

@implementation ASCloudKitFetchConfiguration

- (ASCloudKitFetchConfiguration)initWithRecordType:(id)a3 shouldSkip:(BOOL)a4
{
  return [(ASCloudKitFetchConfiguration *)self initWithRecordType:a3 shouldSkip:a4 shouldCoalesce:0 oldestAllowedModificationDate:0];
}

- (ASCloudKitFetchConfiguration)initWithRecordType:(id)a3 shouldSkip:(BOOL)a4 shouldCoalesce:(BOOL)a5 oldestAllowedModificationDate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ASCloudKitFetchConfiguration;
  v13 = [(ASCloudKitFetchConfiguration *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_recordType, a3);
    v14->_shouldSkip = a4;
    v14->_shouldCoalesce = a5;
    objc_storeStrong((id *)&v14->_oldestAllowedModificationDate, a6);
  }

  return v14;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@, skip: %d, coalesce %d, allowed mod date: %@", self->_recordType, self->_shouldSkip, self->_shouldCoalesce, self->_oldestAllowedModificationDate];
}

- (NSString)recordType
{
  return self->_recordType;
}

- (BOOL)shouldSkip
{
  return self->_shouldSkip;
}

- (BOOL)shouldCoalesce
{
  return self->_shouldCoalesce;
}

- (NSDate)oldestAllowedModificationDate
{
  return self->_oldestAllowedModificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestAllowedModificationDate, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end