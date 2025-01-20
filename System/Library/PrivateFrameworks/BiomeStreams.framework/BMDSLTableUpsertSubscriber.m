@interface BMDSLTableUpsertSubscriber
+ (BOOL)supportsSecureCoding;
- (BMDSLTableUpsertSubscriber)initWithCoder:(id)a3;
- (BMDSLTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4;
- (BMDSLTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6;
- (NSString)tableName;
- (id)bpsSubscriber;
- (id)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setTableName:(id)a3;
@end

@implementation BMDSLTableUpsertSubscriber

- (BMDSLTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4 name:(id)a5 version:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BMDSLTableUpsertSubscriber;
  v12 = [(BMDSLBaseCodable *)&v18 initWithName:a5 version:v6];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    tableName = v12->_tableName;
    v12->_tableName = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v15;
  }
  return v12;
}

- (BMDSLTableUpsertSubscriber)initWithTableName:(id)a3 identifier:(id)a4
{
  return [(BMDSLTableUpsertSubscriber *)self initWithTableName:a3 identifier:a4 name:@"tableUpsertSubscriber" version:1];
}

- (id)bpsSubscriber
{
  v3 = [(BMDSLTableUpsertSubscriber *)self identifier];
  v4 = +[BMComputeXPCSubscription storageForIdentifier:v3];

  id v5 = objc_alloc(MEMORY[0x1E4F4FAB0]);
  uint64_t v6 = [(BMDSLTableUpsertSubscriber *)self tableName];
  v7 = [(BMDSLTableUpsertSubscriber *)self identifier];
  v8 = (void *)[v5 initWithTableName:v6 identifier:v7 keyValueStore:v4];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BMDSLTableUpsertSubscriber;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v7 encodeWithCoder:v4];
  id v5 = [(BMDSLTableUpsertSubscriber *)self tableName];
  [v4 encodeObject:v5 forKey:@"tableName"];

  uint64_t v6 = [(BMDSLTableUpsertSubscriber *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];
}

- (BMDSLTableUpsertSubscriber)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDSLTableUpsertSubscriber;
  id v5 = [(BMDSLBaseCodable *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tableName"];
    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    id v5 = [(BMDSLTableUpsertSubscriber *)v5 initWithTableName:v6 identifier:v7 name:@"tableUpsertSubscriber" version:1];
  }
  return v5;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end