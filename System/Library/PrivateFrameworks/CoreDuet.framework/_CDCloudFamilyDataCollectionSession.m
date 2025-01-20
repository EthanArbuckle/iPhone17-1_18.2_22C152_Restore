@interface _CDCloudFamilyDataCollectionSession
+ (BOOL)supportsSecureCoding;
+ (void)generateNewSession;
- (_CDCloudFamilyDataCollectionSession)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)isValidForCollectionDate:(uint64_t)a1;
- (void)encodeWithCoder:(id)a3;
- (void)initWithIdentifier:(void *)a3 salt:(void *)a4 latestStartDate:(void *)a5 lastCollectionDate:(uint64_t)a6 batchNumber:;
- (void)subsequentSessionWithlatestStartDate:(void *)a3 lastCollectionDate:;
@end

@implementation _CDCloudFamilyDataCollectionSession

+ (void)generateNewSession
{
  v0 = objc_alloc((Class)self);
  v1 = [MEMORY[0x1E4F29128] UUID];
  v2 = [v1 UUIDString];
  v3 = [v2 lowercaseString];
  v4 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  v5 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v6 = v4;
  if (SecRandomCopyBytes(v5, 0x20uLL, (void *)[v6 mutableBytes]))
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x1E4F1C9B8] dataWithData:v6];
  }

  v8 = -[_CDCloudFamilyDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v0, v3, v7, 0, 0, 1);
  return v8;
}

- (void)initWithIdentifier:(void *)a3 salt:(void *)a4 latestStartDate:(void *)a5 lastCollectionDate:(uint64_t)a6 batchNumber:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)_CDCloudFamilyDataCollectionSession;
    a1 = objc_msgSendSuper2(&v24, sel_init);
    if (a1)
    {
      uint64_t v15 = [v11 copy];
      v16 = (void *)a1[1];
      a1[1] = v15;

      uint64_t v17 = [v12 copy];
      v18 = (void *)a1[2];
      a1[2] = v17;

      uint64_t v19 = [v13 copy];
      v20 = (void *)a1[3];
      a1[3] = v19;

      uint64_t v21 = [v14 copy];
      v22 = (void *)a1[4];
      a1[4] = v21;

      a1[5] = a6;
    }
  }

  return a1;
}

- (void)subsequentSessionWithlatestStartDate:(void *)a3 lastCollectionDate:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      id v7 = (id)a1[3];
      v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
      }
      id v5 = v9;
    }
    v10 = objc_alloc((Class)objc_opt_class());
    id v11 = (void *)a1[1];
    id v12 = (void *)a1[2];
    uint64_t v13 = a1[5] + 1;
    id v14 = v11;
    a1 = -[_CDCloudFamilyDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v10, v14, v12, v5, v6, v13);
  }
  return a1;
}

- (uint64_t)isValidForCollectionDate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 24);
      id v6 = v4;
      BOOL v7 = [v3 compare:v5] != -1;
    }
    else
    {
      BOOL v7 = 1;
    }
    id v8 = *(id *)(a1 + 32);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = [v3 compare:*(void *)(a1 + 32)];

      if (v10 == -1) {
        BOOL v7 = 0;
      }
    }
    if (*(void *)(a1 + 8) && *(void *)(a1 + 16))
    {
      if (*(void *)(a1 + 40)) {
        a1 = v7;
      }
      else {
        a1 = 0;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_CDCloudFamilyDataCollectionSession allocWithZone:a3];
  if (self)
  {
    uint64_t v5 = self->_identifier;
    id v6 = self->_salt;
    BOOL v7 = self->_latestStartDate;
    id v8 = self->_lastCollectionDate;
    unint64_t batchNumber = self->_batchNumber;
  }
  else
  {
    id v8 = 0;
    id v6 = 0;
    uint64_t v5 = 0;
    BOOL v7 = 0;
    unint64_t batchNumber = 0;
  }
  uint64_t v10 = -[_CDCloudFamilyDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](v4, v5, v6, v7, v8, batchNumber);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self)
  {
    [v4 encodeObject:self->_identifier forKey:@"identifier"];
    salt = self->_salt;
  }
  else
  {
    [v4 encodeObject:0 forKey:@"identifier"];
    salt = 0;
  }
  [v8 encodeObject:salt forKey:@"salt"];
  if (self)
  {
    [v8 encodeObject:self->_latestStartDate forKey:@"latestStartDate"];
    lastCollectionDate = self->_lastCollectionDate;
  }
  else
  {
    [v8 encodeObject:0 forKey:@"latestStartDate"];
    lastCollectionDate = 0;
  }
  [v8 encodeObject:lastCollectionDate forKey:@"lastCollectionDate"];
  if (self) {
    unint64_t batchNumber = self->_batchNumber;
  }
  else {
    unint64_t batchNumber = 0;
  }
  [v8 encodeInteger:batchNumber forKey:@"batchNumber"];
}

- (_CDCloudFamilyDataCollectionSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"salt"];
  BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latestStartDate"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastCollectionDate"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"batchNumber"];

  uint64_t v10 = (_CDCloudFamilyDataCollectionSession *)-[_CDCloudFamilyDataCollectionSession initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:](self, v5, v6, v7, v8, v9);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCollectionDate, 0);
  objc_storeStrong((id *)&self->_latestStartDate, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end