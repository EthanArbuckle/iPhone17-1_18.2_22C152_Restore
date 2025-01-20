@interface ATXPBAppModeEntityScoreMetrics
- (BOOL)hasActivityState;
- (BOOL)hasBundleId;
- (BOOL)hasModelVersion;
- (BOOL)hasNumDaysSinceStartOfMetricsLogging;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activityState;
- (NSString)bundleId;
- (NSString)modelVersion;
- (NSString)numDaysSinceStartOfMetricsLogging;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityState:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setNumDaysSinceStartOfMetricsLogging:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBAppModeEntityScoreMetrics

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (BOOL)hasActivityState
{
  return self->_activityState != 0;
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

- (BOOL)hasNumDaysSinceStartOfMetricsLogging
{
  return self->_numDaysSinceStartOfMetricsLogging != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBAppModeEntityScoreMetrics;
  v4 = [(ATXPBAppModeEntityScoreMetrics *)&v8 description];
  v5 = [(ATXPBAppModeEntityScoreMetrics *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  activityState = self->_activityState;
  if (activityState) {
    [v4 setObject:activityState forKey:@"activityState"];
  }
  modelVersion = self->_modelVersion;
  if (modelVersion) {
    [v4 setObject:modelVersion forKey:@"modelVersion"];
  }
  numDaysSinceStartOfMetricsLogging = self->_numDaysSinceStartOfMetricsLogging;
  if (numDaysSinceStartOfMetricsLogging) {
    [v4 setObject:numDaysSinceStartOfMetricsLogging forKey:@"numDaysSinceStartOfMetricsLogging"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBAppModeEntityScoreMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_activityState)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_modelVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_numDaysSinceStartOfMetricsLogging)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_bundleId)
  {
    objc_msgSend(v4, "setBundleId:");
    id v4 = v5;
  }
  if (self->_activityState)
  {
    objc_msgSend(v5, "setActivityState:");
    id v4 = v5;
  }
  if (self->_modelVersion)
  {
    objc_msgSend(v5, "setModelVersion:");
    id v4 = v5;
  }
  if (self->_numDaysSinceStartOfMetricsLogging)
  {
    objc_msgSend(v5, "setNumDaysSinceStartOfMetricsLogging:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_activityState copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_modelVersion copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_numDaysSinceStartOfMetricsLogging copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[2]))
     || -[NSString isEqual:](bundleId, "isEqual:"))
    && ((activityState = self->_activityState, !((unint64_t)activityState | v4[1]))
     || -[NSString isEqual:](activityState, "isEqual:"))
    && ((modelVersion = self->_modelVersion, !((unint64_t)modelVersion | v4[3]))
     || -[NSString isEqual:](modelVersion, "isEqual:")))
  {
    numDaysSinceStartOfMetricsLogging = self->_numDaysSinceStartOfMetricsLogging;
    if ((unint64_t)numDaysSinceStartOfMetricsLogging | v4[4]) {
      char v9 = -[NSString isEqual:](numDaysSinceStartOfMetricsLogging, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  NSUInteger v4 = [(NSString *)self->_activityState hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_modelVersion hash];
  return v4 ^ v5 ^ [(NSString *)self->_numDaysSinceStartOfMetricsLogging hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[ATXPBAppModeEntityScoreMetrics setBundleId:](self, "setBundleId:");
  }
  if (v4[1]) {
    -[ATXPBAppModeEntityScoreMetrics setActivityState:](self, "setActivityState:");
  }
  if (v4[3]) {
    -[ATXPBAppModeEntityScoreMetrics setModelVersion:](self, "setModelVersion:");
  }
  if (v4[4]) {
    -[ATXPBAppModeEntityScoreMetrics setNumDaysSinceStartOfMetricsLogging:](self, "setNumDaysSinceStartOfMetricsLogging:");
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)numDaysSinceStartOfMetricsLogging
{
  return self->_numDaysSinceStartOfMetricsLogging;
}

- (void)setNumDaysSinceStartOfMetricsLogging:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numDaysSinceStartOfMetricsLogging, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_activityState, 0);
}

@end