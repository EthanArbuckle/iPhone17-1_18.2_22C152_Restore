@interface HTHang
- (HTHang)initWithXPCDictionary:(id)a3;
- (NSDate)createdAt;
- (NSDate)creationDate;
- (NSString)bundleID;
- (NSString)bundleId;
- (NSString)hangId;
- (NSString)identifier;
- (NSString)processPath;
- (double)duration;
- (int64_t)durationLevel;
@end

@implementation HTHang

- (HTHang)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HTHang;
  v5 = [(HTHang *)&v20 init];
  if (v5)
  {
    uint64_t v6 = stringFromXpcDictionary(v4, (id)*MEMORY[0x263F427D0]);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = stringFromXpcDictionary(v4, (id)*MEMORY[0x263F427B8]);
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    v10 = stringFromXpcDictionary(v4, (id)*MEMORY[0x263F427C0]);
    [v10 doubleValue];
    double v12 = v11;

    if (v12 == 0.0)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v12];
    }
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v13;

    v15 = stringFromXpcDictionary(v4, (id)*MEMORY[0x263F427C8]);
    [v15 doubleValue];
    v5->_duration = v16;

    uint64_t v17 = stringFromXpcDictionary(v4, (id)*MEMORY[0x263F427D8]);
    processPath = v5->_processPath;
    v5->_processPath = (NSString *)v17;

    objc_storeStrong((id *)&v5->_bundleId, v5->_bundleID);
    objc_storeStrong((id *)&v5->_hangId, v5->_identifier);
    objc_storeStrong((id *)&v5->_createdAt, v5->_creationDate);
  }

  return v5;
}

- (int64_t)durationLevel
{
  return HTLevelForHangDuration(self->_duration);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)processPath
{
  return self->_processPath;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)hangId
{
  return self->_hangId;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_hangId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_processPath, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end