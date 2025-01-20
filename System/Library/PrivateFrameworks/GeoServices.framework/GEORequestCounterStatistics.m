@interface GEORequestCounterStatistics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEORequestCounterStatistics)initWithCoder:(id)a3;
- (id)description;
- (int)durationCount;
- (int64_t)durationUSecondsTotal;
- (unint64_t)bytesReceived;
- (unint64_t)bytesTransmitted;
- (unint64_t)countForResult:(unsigned __int8)a3;
- (unint64_t)hash;
- (unint64_t)usedInterfaces;
- (void)addUsedInterfaces:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementBytesReceived:(unint64_t)a3;
- (void)incrementBytesTransmitted:(unint64_t)a3;
- (void)incrementCountForResult:(unsigned __int8)a3;
- (void)incrementDuration:(double)a3;
@end

@implementation GEORequestCounterStatistics

- (GEORequestCounterStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEORequestCounterStatistics;
  v5 = [(GEORequestCounterStatistics *)&v12 init];
  if (v5)
  {
    v5->_bytesTransmitted = [v4 decodeIntegerForKey:@"bytesTransmitted"];
    v5->_bytesReceived = [v4 decodeIntegerForKey:@"bytesReceived"];
    v5->_durationUSeconds = [v4 decodeInt64ForKey:@"duration"];
    v5->_durationCount = [v4 decodeInt32ForKey:@"durationCount"];
    uint64_t v6 = objc_opt_class();
    v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"resultCounts"];
    uint64_t v8 = [v7 mutableCopy];
    resultCounts = v5->_resultCounts;
    v5->_resultCounts = (NSMutableDictionary *)v8;

    v5->_usedInterfaces = [v4 decodeIntegerForKey:@"interfaces"];
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t bytesTransmitted = self->_bytesTransmitted;
  id v5 = a3;
  [v5 encodeInteger:bytesTransmitted forKey:@"bytesTransmitted"];
  [v5 encodeInteger:self->_bytesReceived forKey:@"bytesReceived"];
  [v5 encodeInt64:self->_durationUSeconds forKey:@"duration"];
  [v5 encodeInt32:self->_durationCount forKey:@"durationCount"];
  [v5 encodeObject:self->_resultCounts forKey:@"resultCounts"];
  [v5 encodeInteger:self->_usedInterfaces forKey:@"interfaces"];
}

- (unint64_t)hash
{
  unint64_t v2 = self->_bytesReceived ^ self->_bytesTransmitted;
  return v2 ^ [(NSMutableDictionary *)self->_resultCounts hash] ^ self->_durationUSeconds ^ self->_durationCount;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = v5;
    if (self->_bytesTransmitted != v5[1] || self->_bytesReceived != v5[2]) {
      goto LABEL_14;
    }
    int64_t v7 = self->_durationUSeconds - v5[3];
    if (v7 < 0) {
      int64_t v7 = v5[3] - self->_durationUSeconds;
    }
    if ((unint64_t)v7 <= 9 && self->_durationCount == *((_DWORD *)v5 + 8) && self->_usedInterfaces == v5[6])
    {
      resultCounts = self->_resultCounts;
      v9 = (NSMutableDictionary *)v6[5];
      if (resultCounts == v9)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if (resultCounts && v9) {
          char v10 = -[NSMutableDictionary isEqualToDictionary:](resultCounts, "isEqualToDictionary:");
        }
      }
    }
    else
    {
LABEL_14:
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)incrementBytesTransmitted:(unint64_t)a3
{
  self->_bytesTransmitted += a3;
}

- (void)incrementBytesReceived:(unint64_t)a3
{
  self->_bytesReceived += a3;
}

- (void)incrementDuration:(double)a3
{
  self->_durationUSeconds += (unint64_t)(a3 * 1000000.0);
}

- (void)incrementCountForResult:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  resultCounts = self->_resultCounts;
  if (!resultCounts)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    int64_t v7 = self->_resultCounts;
    self->_resultCounts = v6;

    resultCounts = self->_resultCounts;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedChar:v3];
  v9 = [(NSMutableDictionary *)resultCounts objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 unsignedIntegerValue];

  id v13 = [NSNumber numberWithUnsignedInteger:v10 + 1];
  v11 = self->_resultCounts;
  objc_super v12 = [NSNumber numberWithUnsignedChar:v3];
  [(NSMutableDictionary *)v11 setObject:v13 forKeyedSubscript:v12];
}

- (void)addUsedInterfaces:(unint64_t)a3
{
  self->_usedInterfaces |= a3;
}

- (unint64_t)countForResult:(unsigned __int8)a3
{
  resultCounts = self->_resultCounts;
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  id v5 = [(NSMutableDictionary *)resultCounts objectForKeyedSubscript:v4];
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)GEORequestCounterStatistics;
  id v4 = [(GEORequestCounterStatistics *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ {xmit: %llu recv: %llu duration: %lld duration count: %d result counts: %@}", v4, self->_bytesTransmitted, self->_bytesReceived, self->_durationUSeconds, self->_durationCount, self->_resultCounts];

  return v5;
}

- (unint64_t)bytesTransmitted
{
  return self->_bytesTransmitted;
}

- (unint64_t)bytesReceived
{
  return self->_bytesReceived;
}

- (int64_t)durationUSecondsTotal
{
  return self->_durationUSeconds;
}

- (int)durationCount
{
  return self->_durationCount;
}

- (unint64_t)usedInterfaces
{
  return self->_usedInterfaces;
}

- (void).cxx_destruct
{
}

@end