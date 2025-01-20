@interface FKBalance
- (BOOL)hasMultipleBalances;
- (BOOL)isEqual:(id)a3;
- (FKBalance)initWithUUID:(id)a3 availableBalance:(id)a4 bookedBalance:(id)a5 lastUpdatedAt:(id)a6;
- (FKBalanceCalculation)availableBalance;
- (FKBalanceCalculation)bookedBalance;
- (NSDate)lastUpdatedAt;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FKBalance

- (FKBalance)initWithUUID:(id)a3 availableBalance:(id)a4 bookedBalance:(id)a5 lastUpdatedAt:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKBalance;
  v14 = [(FKBalance *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    availableBalance = v14->_availableBalance;
    v14->_availableBalance = (FKBalanceCalculation *)v17;

    uint64_t v19 = [v12 copy];
    bookedBalance = v14->_bookedBalance;
    v14->_bookedBalance = (FKBalanceCalculation *)v19;

    uint64_t v21 = [v13 copy];
    lastUpdatedAt = v14->_lastUpdatedAt;
    v14->_lastUpdatedAt = (NSDate *)v21;
  }
  return v14;
}

- (BOOL)hasMultipleBalances
{
  return self->_availableBalance && self->_bookedBalance != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(FKBalance);
  uint64_t v6 = [(NSUUID *)self->_uuid copyWithZone:a3];
  uuid = v5->_uuid;
  v5->_uuid = (NSUUID *)v6;

  v8 = [(FKBalanceCalculation *)self->_availableBalance copyWithZone:a3];
  availableBalance = v5->_availableBalance;
  v5->_availableBalance = v8;

  id v10 = [(FKBalanceCalculation *)self->_bookedBalance copyWithZone:a3];
  bookedBalance = v5->_bookedBalance;
  v5->_bookedBalance = v10;

  uint64_t v12 = [(NSDate *)self->_lastUpdatedAt copyWithZone:a3];
  lastUpdatedAt = v5->_lastUpdatedAt;
  v5->_lastUpdatedAt = (NSDate *)v12;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_uuid];
  [v3 safelyAddObject:self->_availableBalance];
  [v3 safelyAddObject:self->_bookedBalance];
  [v3 safelyAddObject:self->_lastUpdatedAt];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKBalance *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_uuid, v6[1])
      && FKEqualObjects(self->_availableBalance, v6[2])
      && FKEqualObjects(self->_bookedBalance, v6[3]))
    {
      char v7 = FKEqualObjects(self->_lastUpdatedAt, v6[4]);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (FKBalanceCalculation)availableBalance
{
  return self->_availableBalance;
}

- (FKBalanceCalculation)bookedBalance
{
  return self->_bookedBalance;
}

- (NSDate)lastUpdatedAt
{
  return self->_lastUpdatedAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedAt, 0);
  objc_storeStrong((id *)&self->_bookedBalance, 0);
  objc_storeStrong((id *)&self->_availableBalance, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end