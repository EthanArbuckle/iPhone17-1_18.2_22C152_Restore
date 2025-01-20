@interface HMCRedirectorChangeItem
- (BOOL)isObjectType:(id)a3;
- (MKFObjectDatabaseID)databaseID;
- (NSSet)changedProperties;
- (NSUUID)modelID;
- (Protocol)modelType;
- (id)description;
@end

@implementation HMCRedirectorChangeItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedProperties, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
}

- (NSSet)changedProperties
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (MKFObjectDatabaseID)databaseID
{
  return (MKFObjectDatabaseID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)modelID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (Protocol)modelType
{
  return (Protocol *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = [(HMCRedirectorChangeItem *)self modelType];
  v5 = NSStringFromProtocol(v4);
  v6 = [(HMCRedirectorChangeItem *)self modelID];
  v7 = [(HMCRedirectorChangeItem *)self changedProperties];
  v8 = [v7 allObjects];
  v9 = [v8 componentsJoinedByString:@", "];
  v10 = [v3 stringWithFormat:@"%@.%@: [%@]", v5, v6, v9];

  return v10;
}

- (BOOL)isObjectType:(id)a3
{
  v4 = (Protocol *)a3;
  v5 = [(HMCRedirectorChangeItem *)self modelType];
  BOOL isEqual = protocol_isEqual(v5, v4);

  return isEqual;
}

@end