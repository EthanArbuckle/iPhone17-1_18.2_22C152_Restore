@interface _CDFTCPInteractionDataCollectionSession
+ (BOOL)supportsSecureCoding;
+ (id)generateNewSession;
- (BOOL)isValidForCollectionDate:(id)a3;
- (NSData)salt;
- (NSDate)lastCollectionDate;
- (NSDate)latestStartDate;
- (NSString)identifier;
- (_CDFTCPInteractionDataCollectionSession)initWithCoder:(id)a3;
- (_CDFTCPInteractionDataCollectionSession)initWithIdentifier:(id)a3 salt:(id)a4 latestStartDate:(id)a5 lastCollectionDate:(id)a6 batchNumber:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)subsequentSessionWithlatestStartDate:(id)a3 lastCollectionDate:(id)a4;
- (unint64_t)batchNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CDFTCPInteractionDataCollectionSession

- (_CDFTCPInteractionDataCollectionSession)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_identifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_salt);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_latestStartDate);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  v15 = NSStringFromSelector(sel_lastCollectionDate);
  v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  v17 = NSStringFromSelector(sel_batchNumber);
  uint64_t v18 = [v4 decodeIntegerForKey:v17];

  v19 = [(_CDFTCPInteractionDataCollectionSession *)self initWithIdentifier:v7 salt:v10 latestStartDate:v13 lastCollectionDate:v16 batchNumber:v18];
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_CDFTCPInteractionDataCollectionSession *)self identifier];
  v6 = NSStringFromSelector(sel_identifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(_CDFTCPInteractionDataCollectionSession *)self salt];
  uint64_t v8 = NSStringFromSelector(sel_salt);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(_CDFTCPInteractionDataCollectionSession *)self latestStartDate];
  v10 = NSStringFromSelector(sel_latestStartDate);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(_CDFTCPInteractionDataCollectionSession *)self lastCollectionDate];
  v12 = NSStringFromSelector(sel_lastCollectionDate);
  [v4 encodeObject:v11 forKey:v12];

  unint64_t v13 = [(_CDFTCPInteractionDataCollectionSession *)self batchNumber];
  NSStringFromSelector(sel_batchNumber);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v13 forKey:v14];
}

- (_CDFTCPInteractionDataCollectionSession)initWithIdentifier:(id)a3 salt:(id)a4 latestStartDate:(id)a5 lastCollectionDate:(id)a6 batchNumber:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)_CDFTCPInteractionDataCollectionSession;
  v16 = [(_CDFTCPInteractionDataCollectionSession *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    salt = v16->_salt;
    v16->_salt = (NSData *)v19;

    uint64_t v21 = [v14 copy];
    latestStartDate = v16->_latestStartDate;
    v16->_latestStartDate = (NSDate *)v21;

    uint64_t v23 = [v15 copy];
    lastCollectionDate = v16->_lastCollectionDate;
    v16->_lastCollectionDate = (NSDate *)v23;

    v16->_batchNumber = a7;
  }

  return v16;
}

+ (id)generateNewSession
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  uint64_t v5 = [v4 lowercaseString];
  v6 = _CDRandomDataWithLength();
  v7 = (void *)[v2 initWithIdentifier:v5 salt:v6 latestStartDate:0 lastCollectionDate:0 batchNumber:1];

  return v7;
}

- (id)subsequentSessionWithlatestStartDate:(id)a3 lastCollectionDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v8 = [(_CDFTCPInteractionDataCollectionSession *)self latestStartDate];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v6 = v10;
  }
  id v11 = objc_alloc((Class)objc_opt_class());
  id v12 = [(_CDFTCPInteractionDataCollectionSession *)self identifier];
  id v13 = [(_CDFTCPInteractionDataCollectionSession *)self salt];
  id v14 = objc_msgSend(v11, "initWithIdentifier:salt:latestStartDate:lastCollectionDate:batchNumber:", v12, v13, v6, v7, -[_CDFTCPInteractionDataCollectionSession batchNumber](self, "batchNumber") + 1);

  return v14;
}

- (BOOL)isValidForCollectionDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_CDFTCPInteractionDataCollectionSession *)self latestStartDate];
  if (v5)
  {
    id v6 = [(_CDFTCPInteractionDataCollectionSession *)self latestStartDate];
    BOOL v7 = [v4 compare:v6] != -1;
  }
  else
  {
    BOOL v7 = 1;
  }

  uint64_t v8 = [(_CDFTCPInteractionDataCollectionSession *)self lastCollectionDate];
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [(_CDFTCPInteractionDataCollectionSession *)self lastCollectionDate];
    uint64_t v11 = [v4 compare:v10];

    if (v11 == -1) {
      BOOL v7 = 0;
    }
  }
  id v12 = [(_CDFTCPInteractionDataCollectionSession *)self identifier];
  if (v12)
  {
    id v13 = [(_CDFTCPInteractionDataCollectionSession *)self salt];
    if (v13)
    {
      if ([(_CDFTCPInteractionDataCollectionSession *)self batchNumber]) {
        BOOL v14 = v7;
      }
      else {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_CDFTCPInteractionDataCollectionSession allocWithZone:a3];
  uint64_t v5 = [(_CDFTCPInteractionDataCollectionSession *)self identifier];
  id v6 = [(_CDFTCPInteractionDataCollectionSession *)self salt];
  BOOL v7 = [(_CDFTCPInteractionDataCollectionSession *)self latestStartDate];
  uint64_t v8 = [(_CDFTCPInteractionDataCollectionSession *)self lastCollectionDate];
  v9 = [(_CDFTCPInteractionDataCollectionSession *)v4 initWithIdentifier:v5 salt:v6 latestStartDate:v7 lastCollectionDate:v8 batchNumber:[(_CDFTCPInteractionDataCollectionSession *)self batchNumber]];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)salt
{
  return self->_salt;
}

- (NSDate)latestStartDate
{
  return self->_latestStartDate;
}

- (NSDate)lastCollectionDate
{
  return self->_lastCollectionDate;
}

- (unint64_t)batchNumber
{
  return self->_batchNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCollectionDate, 0);
  objc_storeStrong((id *)&self->_latestStartDate, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end