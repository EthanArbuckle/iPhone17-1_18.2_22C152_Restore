@interface BRCIntAndZoneJobIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIntAndZoneJobIdentifier:(id)a3;
- (BRCIntAndZoneJobIdentifier)initWithIntID:(int64_t)a3 zoneRowID:(id)a4;
- (BRCZoneRowID)zoneRowID;
- (NSString)description;
- (id)columns;
- (id)columnsValues;
- (id)matchingJobsWhereSQLClause;
- (int64_t)intID;
- (unint64_t)hash;
@end

@implementation BRCIntAndZoneJobIdentifier

- (BRCIntAndZoneJobIdentifier)initWithIntID:(int64_t)a3 zoneRowID:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BRCIntAndZoneJobIdentifier;
  v8 = [(BRCIntAndZoneJobIdentifier *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_intID = a3;
    objc_storeStrong((id *)&v8->_zoneRowID, a4);
    if (!v7)
    {
      v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCIntAndZoneJobIdentifier initWithIntID:zoneRowID:]((uint64_t)v11, v12);
      }
    }
  }

  return v9;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@:%lld", self->_zoneRowID, self->_intID];
}

- (id)matchingJobsWhereSQLClause
{
  return (id)[MEMORY[0x1E4FBA8F8] formatInjection:@"throttle_id = %lld AND zone_rowid = %@", self->_intID, self->_zoneRowID];
}

- (id)columns
{
  return (id)objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "throttle_id, zone_rowid", 23);
}

- (id)columnsValues
{
  return (id)[MEMORY[0x1E4FBA8F8] formatInjection:@"%lld, %@", self->_intID, self->_zoneRowID];
}

- (unint64_t)hash
{
  int64_t intID = self->_intID;
  return [(BRCZoneRowID *)self->_zoneRowID hash] ^ intID;
}

- (BOOL)isEqualToIntAndZoneJobIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && self->_intID == *((void *)v4 + 1)) {
    char v6 = [(BRCZoneRowID *)self->_zoneRowID br_isEqualToNumber:*((void *)v4 + 2)];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BRCIntAndZoneJobIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BRCIntAndZoneJobIdentifier *)self isEqualToIntAndZoneJobIdentifier:v4];
  }

  return v5;
}

- (int64_t)intID
{
  return self->_intID;
}

- (BRCZoneRowID)zoneRowID
{
  return self->_zoneRowID;
}

- (void).cxx_destruct
{
}

- (void)initWithIntID:(uint64_t)a1 zoneRowID:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: zoneRowID%@", (uint8_t *)&v2, 0xCu);
}

@end