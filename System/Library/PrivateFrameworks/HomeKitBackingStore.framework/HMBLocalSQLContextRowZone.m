@interface HMBLocalSQLContextRowZone
- (HMBLocalSQLContextRowZone)init;
- (HMBLocalSQLContextRowZone)initWithZoneRow:(unint64_t)a3;
- (HMBLocalSQLContextRowZone)initWithZoneRow:(unint64_t)a3 name:(id)a4 token:(id)a5;
- (HMBLocalZoneID)identifier;
- (NSUUID)replication;
- (id)debugDescription;
- (id)description;
- (unint64_t)zoneRow;
- (void)setIdentifier:(id)a3;
- (void)setReplication:(id)a3;
- (void)setZoneRow:(unint64_t)a3;
@end

@implementation HMBLocalSQLContextRowZone

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replication, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setReplication:(id)a3
{
}

- (NSUUID)replication
{
  return self->_replication;
}

- (void)setZoneRow:(unint64_t)a3
{
  self->_zoneRow = a3;
}

- (unint64_t)zoneRow
{
  return self->_zoneRow;
}

- (void)setIdentifier:(id)a3
{
}

- (HMBLocalZoneID)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(HMBLocalSQLContextRowZone *)self zoneRow];
  v5 = [(HMBLocalSQLContextRowZone *)self identifier];
  v6 = [v5 name];
  v7 = [v3 stringWithFormat:@"<%lu.%@>", v4, v6];

  return v7;
}

- (id)debugDescription
{
  v3 = NSString;
  unint64_t v4 = [(HMBLocalSQLContextRowZone *)self zoneRow];
  v5 = [(HMBLocalSQLContextRowZone *)self identifier];
  v6 = [v5 name];
  v7 = [v3 stringWithFormat:@"<%lu: %@>", v4, v6];

  return v7;
}

- (HMBLocalSQLContextRowZone)initWithZoneRow:(unint64_t)a3 name:(id)a4 token:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMBLocalSQLContextRowZone;
  v10 = [(HMBLocalSQLContextRowZone *)&v15 init];
  v11 = v10;
  if (v10)
  {
    v10->_zoneRow = a3;
    v12 = [[HMBLocalZoneIDRow alloc] initWithName:v8 token:v9];
    identifier = v11->_identifier;
    v11->_identifier = (HMBLocalZoneID *)v12;
  }
  return v11;
}

- (HMBLocalSQLContextRowZone)initWithZoneRow:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMBLocalSQLContextRowZone;
  result = [(HMBLocalSQLContextRowZone *)&v5 init];
  if (result) {
    result->_zoneRow = a3;
  }
  return result;
}

- (HMBLocalSQLContextRowZone)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMBLocalSQLContextRowZone;
  return [(HMBLocalSQLContextRowZone *)&v3 init];
}

@end