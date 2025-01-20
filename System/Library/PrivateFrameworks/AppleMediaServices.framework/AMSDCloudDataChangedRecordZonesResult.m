@interface AMSDCloudDataChangedRecordZonesResult
- (AMSDCloudDataChangeToken)changeToken;
- (AMSDCloudDataChangedRecordZonesResult)initWithChangedRecordZones:(id)a3 deletedRecordZones:(id)a4 changeToken:(id)a5;
- (NSArray)changedRecordZones;
- (NSArray)deletedRecordZones;
- (NSString)hashedDescription;
@end

@implementation AMSDCloudDataChangedRecordZonesResult

- (AMSDCloudDataChangedRecordZonesResult)initWithChangedRecordZones:(id)a3 deletedRecordZones:(id)a4 changeToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDCloudDataChangedRecordZonesResult;
  v12 = [(AMSDCloudDataChangedRecordZonesResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_changedRecordZones, a3);
    objc_storeStrong((id *)&v13->_changeToken, a5);
    objc_storeStrong((id *)&v13->_deletedRecordZones, a4);
  }

  return v13;
}

- (NSString)hashedDescription
{
  v3 = +[NSMutableString stringWithFormat:@"<%@: %p> {", objc_opt_class(), self];
  v4 = [(AMSDCloudDataChangedRecordZonesResult *)self changedRecordZones];
  v5 = AMSHashIfNeeded();
  [v3 appendFormat:@"  changedRecordZones = %@,\n", v5];

  v6 = [(AMSDCloudDataChangedRecordZonesResult *)self deletedRecordZones];
  v7 = AMSHashIfNeeded();
  [v3 appendFormat:@"  deletedRecordZones = %@,\n", v7];

  v8 = [(AMSDCloudDataChangedRecordZonesResult *)self changeToken];
  id v9 = AMSHashIfNeeded();
  [v3 appendFormat:@"  changeToken = %@\n", v9];

  [v3 appendString:@"}"];
  return (NSString *)v3;
}

- (NSArray)changedRecordZones
{
  return self->_changedRecordZones;
}

- (NSArray)deletedRecordZones
{
  return self->_deletedRecordZones;
}

- (AMSDCloudDataChangeToken)changeToken
{
  return self->_changeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_deletedRecordZones, 0);
  objc_storeStrong((id *)&self->_changedRecordZones, 0);
}

@end