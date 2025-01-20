@interface ASDAggregateClusterMappingData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)clusterAppCountAtIndex:(unint64_t)a3;
- (int)clusterAppCounts;
- (int)clusterIDAtIndex:(unint64_t)a3;
- (int)clusterIDs;
- (int)clusterVersionAtIndex:(unint64_t)a3;
- (int)clusterVersions;
- (int)encodingVersion;
- (int)weightedAppForgroundUsageAtIndex:(unint64_t)a3;
- (int)weightedAppForgroundUsages;
- (int)weightedAppLaunches;
- (int)weightedAppLaunchesAtIndex:(unint64_t)a3;
- (unint64_t)clusterAppCountsCount;
- (unint64_t)clusterIDsCount;
- (unint64_t)clusterVersionsCount;
- (unint64_t)hash;
- (unint64_t)weightedAppForgroundUsagesCount;
- (unint64_t)weightedAppLaunchesCount;
- (void)addClusterAppCount:(int)a3;
- (void)addClusterID:(int)a3;
- (void)addClusterVersion:(int)a3;
- (void)addWeightedAppForgroundUsage:(int)a3;
- (void)addWeightedAppLaunches:(int)a3;
- (void)clearClusterAppCounts;
- (void)clearClusterIDs;
- (void)clearClusterVersions;
- (void)clearWeightedAppForgroundUsages;
- (void)clearWeightedAppLaunches;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClusterAppCounts:(int *)a3 count:(unint64_t)a4;
- (void)setClusterIDs:(int *)a3 count:(unint64_t)a4;
- (void)setClusterVersions:(int *)a3 count:(unint64_t)a4;
- (void)setEncodingVersion:(int)a3;
- (void)setWeightedAppForgroundUsages:(int *)a3 count:(unint64_t)a4;
- (void)setWeightedAppLaunches:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation ASDAggregateClusterMappingData

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ASDAggregateClusterMappingData;
  [(ASDAggregateClusterMappingData *)&v3 dealloc];
}

- (unint64_t)clusterIDsCount
{
  return self->_clusterIDs.count;
}

- (int)clusterIDs
{
  return self->_clusterIDs.list;
}

- (void)clearClusterIDs
{
}

- (void)addClusterID:(int)a3
{
}

- (int)clusterIDAtIndex:(unint64_t)a3
{
  p_clusterIDs = &self->_clusterIDs;
  unint64_t count = self->_clusterIDs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_clusterIDs->list[a3];
}

- (void)setClusterIDs:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)clusterVersionsCount
{
  return self->_clusterVersions.count;
}

- (int)clusterVersions
{
  return self->_clusterVersions.list;
}

- (void)clearClusterVersions
{
}

- (void)addClusterVersion:(int)a3
{
}

- (int)clusterVersionAtIndex:(unint64_t)a3
{
  p_clusterVersions = &self->_clusterVersions;
  unint64_t count = self->_clusterVersions.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_clusterVersions->list[a3];
}

- (void)setClusterVersions:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)clusterAppCountsCount
{
  return self->_clusterAppCounts.count;
}

- (int)clusterAppCounts
{
  return self->_clusterAppCounts.list;
}

- (void)clearClusterAppCounts
{
}

- (void)addClusterAppCount:(int)a3
{
}

- (int)clusterAppCountAtIndex:(unint64_t)a3
{
  p_clusterAppCounts = &self->_clusterAppCounts;
  unint64_t count = self->_clusterAppCounts.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_clusterAppCounts->list[a3];
}

- (void)setClusterAppCounts:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)weightedAppLaunchesCount
{
  return self->_weightedAppLaunches.count;
}

- (int)weightedAppLaunches
{
  return self->_weightedAppLaunches.list;
}

- (void)clearWeightedAppLaunches
{
}

- (void)addWeightedAppLaunches:(int)a3
{
}

- (int)weightedAppLaunchesAtIndex:(unint64_t)a3
{
  p_weightedAppLaunches = &self->_weightedAppLaunches;
  unint64_t count = self->_weightedAppLaunches.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_weightedAppLaunches->list[a3];
}

- (void)setWeightedAppLaunches:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)weightedAppForgroundUsagesCount
{
  return self->_weightedAppForgroundUsages.count;
}

- (int)weightedAppForgroundUsages
{
  return self->_weightedAppForgroundUsages.list;
}

- (void)clearWeightedAppForgroundUsages
{
}

- (void)addWeightedAppForgroundUsage:(int)a3
{
}

- (int)weightedAppForgroundUsageAtIndex:(unint64_t)a3
{
  p_weightedAppForgroundUsages = &self->_weightedAppForgroundUsages;
  unint64_t count = self->_weightedAppForgroundUsages.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_weightedAppForgroundUsages->list[a3];
}

- (void)setWeightedAppForgroundUsages:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASDAggregateClusterMappingData;
  v4 = [(ASDAggregateClusterMappingData *)&v8 description];
  v5 = [(ASDAggregateClusterMappingData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithInt:self->_encodingVersion];
  [v3 setObject:v4 forKey:@"encodingVersion"];

  v5 = PBRepeatedInt32NSArray();
  [v3 setObject:v5 forKey:@"clusterID"];

  v6 = PBRepeatedInt32NSArray();
  [v3 setObject:v6 forKey:@"clusterVersion"];

  uint64_t v7 = PBRepeatedInt32NSArray();
  [v3 setObject:v7 forKey:@"clusterAppCount"];

  objc_super v8 = PBRepeatedInt32NSArray();
  [v3 setObject:v8 forKey:@"weightedAppLaunches"];

  v9 = PBRepeatedInt32NSArray();
  [v3 setObject:v9 forKey:@"weightedAppForgroundUsage"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASDAggregateClusterMappingDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_clusterIDs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clusterIDs.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v5;
      }
      while (v5 < self->_clusterIDs.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_clusterVersions.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clusterVersions.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_clusterVersions.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_clusterAppCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clusterAppCounts.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_clusterAppCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_weightedAppLaunches.count)
  {
    PBDataWriterPlaceMark();
    if (self->_weightedAppLaunches.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v8;
      }
      while (v8 < self->_weightedAppLaunches.count);
    }
    PBDataWriterRecallMark();
  }
  p_weightedAppForgroundUsages = &self->_weightedAppForgroundUsages;
  if (p_weightedAppForgroundUsages->count)
  {
    PBDataWriterPlaceMark();
    if (p_weightedAppForgroundUsages->count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < p_weightedAppForgroundUsages->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  v19 = a3;
  v19[32] = self->_encodingVersion;
  if ([(ASDAggregateClusterMappingData *)self clusterIDsCount])
  {
    [v19 clearClusterIDs];
    unint64_t v4 = [(ASDAggregateClusterMappingData *)self clusterIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v19, "addClusterID:", -[ASDAggregateClusterMappingData clusterIDAtIndex:](self, "clusterIDAtIndex:", i));
    }
  }
  if ([(ASDAggregateClusterMappingData *)self clusterVersionsCount])
  {
    [v19 clearClusterVersions];
    unint64_t v7 = [(ASDAggregateClusterMappingData *)self clusterVersionsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v19, "addClusterVersion:", -[ASDAggregateClusterMappingData clusterVersionAtIndex:](self, "clusterVersionAtIndex:", j));
    }
  }
  if ([(ASDAggregateClusterMappingData *)self clusterAppCountsCount])
  {
    [v19 clearClusterAppCounts];
    unint64_t v10 = [(ASDAggregateClusterMappingData *)self clusterAppCountsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v19, "addClusterAppCount:", -[ASDAggregateClusterMappingData clusterAppCountAtIndex:](self, "clusterAppCountAtIndex:", k));
    }
  }
  if ([(ASDAggregateClusterMappingData *)self weightedAppLaunchesCount])
  {
    [v19 clearWeightedAppLaunches];
    unint64_t v13 = [(ASDAggregateClusterMappingData *)self weightedAppLaunchesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0; m != v14; ++m)
        objc_msgSend(v19, "addWeightedAppLaunches:", -[ASDAggregateClusterMappingData weightedAppLaunchesAtIndex:](self, "weightedAppLaunchesAtIndex:", m));
    }
  }
  if ([(ASDAggregateClusterMappingData *)self weightedAppForgroundUsagesCount])
  {
    [v19 clearWeightedAppForgroundUsages];
    unint64_t v16 = [(ASDAggregateClusterMappingData *)self weightedAppForgroundUsagesCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t n = 0; n != v17; ++n)
        objc_msgSend(v19, "addWeightedAppForgroundUsage:", -[ASDAggregateClusterMappingData weightedAppForgroundUsageAtIndex:](self, "weightedAppForgroundUsageAtIndex:", n));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[32] = self->_encodingVersion;
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_encodingVersion == v4[32]
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual())
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_encodingVersion;
  uint64_t v3 = PBRepeatedInt32Hash();
  uint64_t v4 = v3 ^ PBRepeatedInt32Hash();
  uint64_t v5 = v4 ^ PBRepeatedInt32Hash();
  uint64_t v6 = v5 ^ PBRepeatedInt32Hash();
  return v2 ^ v6 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  self->_encodingVersiouint64_t n = v4[32];
  id v20 = v4;
  uint64_t v5 = [v4 clusterIDsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[ASDAggregateClusterMappingData addClusterID:](self, "addClusterID:", [v20 clusterIDAtIndex:i]);
  }
  uint64_t v8 = [v20 clusterVersionsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[ASDAggregateClusterMappingData addClusterVersion:](self, "addClusterVersion:", [v20 clusterVersionAtIndex:j]);
  }
  uint64_t v11 = [v20 clusterAppCountsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[ASDAggregateClusterMappingData addClusterAppCount:](self, "addClusterAppCount:", [v20 clusterAppCountAtIndex:k]);
  }
  uint64_t v14 = [v20 weightedAppLaunchesCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[ASDAggregateClusterMappingData addWeightedAppLaunches:](self, "addWeightedAppLaunches:", [v20 weightedAppLaunchesAtIndex:m]);
  }
  uint64_t v17 = [v20 weightedAppForgroundUsagesCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[ASDAggregateClusterMappingData addWeightedAppForgroundUsage:](self, "addWeightedAppForgroundUsage:", [v20 weightedAppForgroundUsageAtIndex:n]);
  }
}

- (int)encodingVersion
{
  return self->_encodingVersion;
}

- (void)setEncodingVersion:(int)a3
{
  self->_encodingVersiouint64_t n = a3;
}

@end