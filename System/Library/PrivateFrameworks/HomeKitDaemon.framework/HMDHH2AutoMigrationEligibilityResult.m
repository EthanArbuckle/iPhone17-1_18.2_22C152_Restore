@interface HMDHH2AutoMigrationEligibilityResult
- (BOOL)hasOnlyEmptyHomes;
- (BOOL)isEligible;
- (BOOL)isEqual:(id)a3;
- (HMDHH2AutoMigrationEligibilityResult)initWithStatus:(unint64_t)a3 iCloudAccountStatus:(unint64_t)a4 unsupportedDevices:(unint64_t)a5 hasOnlyEmptyHomes:(BOOL)a6 numberOwnedNonEmptyHomes:(unint64_t)a7 numberUnownedSharedHomes:(unint64_t)a8 numberOwnedSharedHomes:(unint64_t)a9;
- (id)attributeDescriptions;
- (unint64_t)iCloudAccountStatus;
- (unint64_t)numberOwnedNonEmptyHomes;
- (unint64_t)numberOwnedSharedHomes;
- (unint64_t)numberUnownedSharedHomes;
- (unint64_t)status;
- (unint64_t)unsupportedDevices;
@end

@implementation HMDHH2AutoMigrationEligibilityResult

- (unint64_t)numberOwnedSharedHomes
{
  return self->_numberOwnedSharedHomes;
}

- (unint64_t)numberUnownedSharedHomes
{
  return self->_numberUnownedSharedHomes;
}

- (unint64_t)numberOwnedNonEmptyHomes
{
  return self->_numberOwnedNonEmptyHomes;
}

- (BOOL)hasOnlyEmptyHomes
{
  return self->_hasOnlyEmptyHomes;
}

- (unint64_t)unsupportedDevices
{
  return self->_unsupportedDevices;
}

- (unint64_t)iCloudAccountStatus
{
  return self->_iCloudAccountStatus;
}

- (unint64_t)status
{
  return self->_status;
}

- (BOOL)isEligible
{
  return self->_eligible;
}

- (id)attributeDescriptions
{
  v29[8] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDHH2AutoMigrationEligibilityResult *)self isEligible];
  v28 = HMFBooleanToString();
  v27 = (void *)[v3 initWithName:@"isEligible" value:v28];
  v29[0] = v27;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult status](self, "status"));
  v25 = (void *)[v4 initWithName:@"status" value:v26];
  v29[1] = v25;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult iCloudAccountStatus](self, "iCloudAccountStatus"));
  v23 = (void *)[v5 initWithName:@"iCloudAccountStatus" value:v24];
  v29[2] = v23;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult unsupportedDevices](self, "unsupportedDevices"));
  v7 = (void *)[v6 initWithName:@"unsupportedDevices" value:v22];
  v29[3] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDHH2AutoMigrationEligibilityResult *)self hasOnlyEmptyHomes];
  v9 = HMFBooleanToString();
  v10 = (void *)[v8 initWithName:@"hasOnlyEmptyHomes" value:v9];
  v29[4] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult numberOwnedNonEmptyHomes](self, "numberOwnedNonEmptyHomes"));
  v13 = (void *)[v11 initWithName:@"numberOwnedNonEmptyHomes" value:v12];
  v29[5] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult numberUnownedSharedHomes](self, "numberUnownedSharedHomes"));
  v16 = (void *)[v14 initWithName:@"numberUnownedSharedHomes" value:v15];
  v29[6] = v16;
  id v17 = objc_alloc(MEMORY[0x263F424F8]);
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHH2AutoMigrationEligibilityResult numberOwnedSharedHomes](self, "numberOwnedSharedHomes"));
  v19 = (void *)[v17 initWithName:@"numberOwnedSharedHomes" value:v18];
  v29[7] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:8];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (unint64_t v7 = -[HMDHH2AutoMigrationEligibilityResult status](self, "status"), v7 == [v6 status])
    && (unint64_t v8 = [(HMDHH2AutoMigrationEligibilityResult *)self iCloudAccountStatus],
        v8 == [v6 iCloudAccountStatus])
    && (unint64_t v9 = [(HMDHH2AutoMigrationEligibilityResult *)self unsupportedDevices],
        v9 == [v6 unsupportedDevices])
    && (int v10 = [(HMDHH2AutoMigrationEligibilityResult *)self hasOnlyEmptyHomes],
        v10 == [v6 hasOnlyEmptyHomes])
    && (unint64_t v11 = [(HMDHH2AutoMigrationEligibilityResult *)self numberOwnedNonEmptyHomes],
        v11 == [v6 numberOwnedNonEmptyHomes])
    && (unint64_t v12 = [(HMDHH2AutoMigrationEligibilityResult *)self numberUnownedSharedHomes],
        v12 == [v6 numberUnownedSharedHomes])
    && (unint64_t v13 = [(HMDHH2AutoMigrationEligibilityResult *)self numberOwnedSharedHomes],
        v13 == [v6 numberOwnedSharedHomes]))
  {
    BOOL v14 = [(HMDHH2AutoMigrationEligibilityResult *)self isEligible];
    int v15 = v14 ^ [v6 isEligible] ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (HMDHH2AutoMigrationEligibilityResult)initWithStatus:(unint64_t)a3 iCloudAccountStatus:(unint64_t)a4 unsupportedDevices:(unint64_t)a5 hasOnlyEmptyHomes:(BOOL)a6 numberOwnedNonEmptyHomes:(unint64_t)a7 numberUnownedSharedHomes:(unint64_t)a8 numberOwnedSharedHomes:(unint64_t)a9
{
  v16.receiver = self;
  v16.super_class = (Class)HMDHH2AutoMigrationEligibilityResult;
  result = [(HMDHH2AutoMigrationEligibilityResult *)&v16 init];
  if (result)
  {
    result->_status = a3;
    result->_iCloudAccountStatus = a4;
    result->_unsupportedDevices = a5;
    result->_hasOnlyEmptyHomes = a6;
    result->_numberOwnedNonEmptyHomes = a7;
    result->_numberUnownedSharedHomes = a8;
    result->_numberOwnedSharedHomes = a9;
    result->_eligible = a3 == 0;
  }
  return result;
}

@end