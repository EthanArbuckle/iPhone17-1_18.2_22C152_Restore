@interface LSPlugInQueryAllUnitsResult
+ (BOOL)supportsSecureCoding;
- (LSPlugInQueryAllUnitsResult)initWithCoder:(id)a3;
- (LSPlugInQueryAllUnitsResult)initWithPlugInUnits:(id)a3 forDatabaseWithUUID:(id)a4;
- (NSArray)pluginUnits;
- (NSUUID)dbUUID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSPlugInQueryAllUnitsResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInQueryAllUnitsResult)initWithPlugInUnits:(id)a3 forDatabaseWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryAllUnitsResult;
  v8 = [(_LSQueryResult *)&v12 _init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    pluginUnits = v8->_pluginUnits;
    v8->_pluginUnits = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dbUUID, a4);
  }

  return v8;
}

- (LSPlugInQueryAllUnitsResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSPlugInQueryAllUnitsResult;
  v5 = [(_LSQueryResult *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeArrayWithValuesOfClass:forKey:", objc_opt_class(), @"pluginUnits");
    pluginUnits = v5->_pluginUnits;
    v5->_pluginUnits = (NSArray *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"dbUUID");
    dbUUID = v5->_dbUUID;
    v5->_dbUUID = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pluginUnits = self->_pluginUnits;
  id v5 = a3;
  [v5 encodeObject:pluginUnits forKey:@"pluginUnits"];
  [v5 encodeObject:self->_dbUUID forKey:@"dbUUID"];
}

- (NSArray)pluginUnits
{
  return self->_pluginUnits;
}

- (NSUUID)dbUUID
{
  return self->_dbUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbUUID, 0);

  objc_storeStrong((id *)&self->_pluginUnits, 0);
}

@end