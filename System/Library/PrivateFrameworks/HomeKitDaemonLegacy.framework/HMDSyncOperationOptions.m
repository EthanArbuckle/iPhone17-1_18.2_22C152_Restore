@interface HMDSyncOperationOptions
- (BOOL)isCloudConflict;
- (BOOL)isDelayRespected;
- (HMDSyncOperationOptions)initWithOperationType:(unint64_t)a3 zoneName:(id)a4 cloudConflict:(BOOL)a5 delayRespected:(BOOL)a6;
- (HMDSyncOperationOptions)initWithOperationType:(unint64_t)a3 zoneName:(id)a4 delayRespected:(BOOL)a5;
- (NSString)zoneName;
- (id)description;
- (unint64_t)operationType;
- (void)setCloudConflict:(BOOL)a3;
- (void)setDelayRespected:(BOOL)a3;
@end

@implementation HMDSyncOperationOptions

- (void).cxx_destruct
{
}

- (void)setDelayRespected:(BOOL)a3
{
  self->_delayRespected = a3;
}

- (BOOL)isDelayRespected
{
  return self->_delayRespected;
}

- (void)setCloudConflict:(BOOL)a3
{
  self->_cloudConflict = a3;
}

- (BOOL)isCloudConflict
{
  return self->_cloudConflict;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(HMDSyncOperationOptions *)self operationType] - 1;
  if (v4 > 8) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E6A0E858[v4];
  }
  id v6 = [(HMDSyncOperationOptions *)self zoneName];
  if ([v6 isEqualToString:@"1411CE6C-B4DE-4622-A49D-F66FE296D6B5"])
  {
    v7 = @"HomeManagerZone: ";
    v8 = @"1411CE6C-B4DE-4622-A49D-F66FE296D6B5";
LABEL_8:
    id v9 = [(__CFString *)v7 stringByAppendingString:v8];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"CCF7D3D1-0C20-4207-97D0-9E565EB5E323"])
  {
    v7 = @"MetadataZone: ";
    v8 = @"CCF7D3D1-0C20-4207-97D0-9E565EB5E323";
    goto LABEL_8;
  }
  id v9 = v6;
LABEL_10:
  v10 = v9;

  [(HMDSyncOperationOptions *)self isCloudConflict];
  v11 = HMFBooleanToString();
  [(HMDSyncOperationOptions *)self isDelayRespected];
  v12 = HMFBooleanToString();
  v13 = [v3 stringWithFormat:@"Operation Type = %@, <options: zone=%@/cloudConflict=%@/delayRespected=%@>", v5, v10, v11, v12];

  return v13;
}

- (HMDSyncOperationOptions)initWithOperationType:(unint64_t)a3 zoneName:(id)a4 delayRespected:(BOOL)a5
{
  return [(HMDSyncOperationOptions *)self initWithOperationType:a3 zoneName:a4 cloudConflict:0 delayRespected:a5];
}

- (HMDSyncOperationOptions)initWithOperationType:(unint64_t)a3 zoneName:(id)a4 cloudConflict:(BOOL)a5 delayRespected:(BOOL)a6
{
  id v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDSyncOperationOptions;
  v12 = [(HMDSyncOperationOptions *)&v16 init];
  v13 = v12;
  if (v12)
  {
    v12->_operationType = a3;
    objc_storeStrong((id *)&v12->_zoneName, a4);
    v13->_cloudConflict = a5;
    v13->_delayRespected = a6;
    v14 = v13;
  }

  return v13;
}

@end