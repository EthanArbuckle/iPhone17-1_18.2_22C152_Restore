@interface ATStatus
+ (BOOL)supportsSecureCoding;
- (ATStatus)initWithCoder:(id)a3;
- (ATStatus)initWithLibraryID:(id)a3 dataClass:(id)a4;
- (BOOL)isAutomaticSync;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWirelessSync;
- (NSString)dataClass;
- (NSString)libraryID;
- (NSString)localizedDescription;
- (float)progress;
- (id)description;
- (unint64_t)completedAssetCount;
- (unint64_t)hash;
- (unint64_t)totalAssetCount;
- (unint64_t)totalItemCount;
- (unsigned)syncStage;
- (unsigned)syncType;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomaticSync:(BOOL)a3;
- (void)setCompletedAssetCount:(unint64_t)a3;
- (void)setDataClass:(id)a3;
- (void)setLibraryID:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setProgress:(float)a3;
- (void)setSyncStage:(unsigned int)a3;
- (void)setSyncType:(unsigned int)a3;
- (void)setTotalAssetCount:(unint64_t)a3;
- (void)setTotalItemCount:(unint64_t)a3;
- (void)setWirelessSync:(BOOL)a3;
@end

@implementation ATStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_dataClass, 0);
  objc_storeStrong((id *)&self->_libraryID, 0);
}

- (void)setAutomaticSync:(BOOL)a3
{
  self->_automaticSync = a3;
}

- (BOOL)isAutomaticSync
{
  return self->_automaticSync;
}

- (void)setWirelessSync:(BOOL)a3
{
  self->_wirelessSync = a3;
}

- (BOOL)isWirelessSync
{
  return self->_wirelessSync;
}

- (void)setTotalItemCount:(unint64_t)a3
{
  self->_totalItemCount = a3;
}

- (unint64_t)totalItemCount
{
  return self->_totalItemCount;
}

- (void)setTotalAssetCount:(unint64_t)a3
{
  self->_totalAssetCount = a3;
}

- (unint64_t)totalAssetCount
{
  return self->_totalAssetCount;
}

- (void)setCompletedAssetCount:(unint64_t)a3
{
  self->_completedAssetCount = a3;
}

- (unint64_t)completedAssetCount
{
  return self->_completedAssetCount;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setSyncType:(unsigned int)a3
{
  self->_syncType = a3;
}

- (unsigned)syncType
{
  return self->_syncType;
}

- (void)setSyncStage:(unsigned int)a3
{
  self->_syncStage = a3;
}

- (unsigned)syncStage
{
  return self->_syncStage;
}

- (void)setDataClass:(id)a3
{
}

- (NSString)dataClass
{
  return self->_dataClass;
}

- (void)setLibraryID:(id)a3
{
}

- (NSString)libraryID
{
  return self->_libraryID;
}

- (void)encodeWithCoder:(id)a3
{
  dataClass = self->_dataClass;
  id v6 = a3;
  [v6 encodeObject:dataClass forKey:@"dataClass"];
  [v6 encodeObject:self->_libraryID forKey:@"libraryID"];
  [v6 encodeInteger:self->_syncStage forKey:@"syncStage"];
  [v6 encodeInteger:self->_syncType forKey:@"syncType"];
  *(float *)&double v5 = self->_progress;
  [v6 encodeFloat:@"progress" forKey:v5];
  [v6 encodeInteger:self->_totalAssetCount forKey:@"totalAssetCount"];
  [v6 encodeInteger:self->_totalItemCount forKey:@"totalItemCount"];
  [v6 encodeInteger:self->_completedAssetCount forKey:@"completedAssetCount"];
  [v6 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
}

- (ATStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ATStatus;
  double v5 = [(ATStatus *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataClass"];
    dataClass = v5->_dataClass;
    v5->_dataClass = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryID"];
    libraryID = v5->_libraryID;
    v5->_libraryID = (NSString *)v8;

    v5->_syncStage = [v4 decodeIntegerForKey:@"syncStage"];
    v5->_syncType = [v4 decodeIntegerForKey:@"syncType"];
    [v4 decodeFloatForKey:@"progress"];
    v5->_progress = v10;
    v5->_totalAssetCount = [v4 decodeIntegerForKey:@"totalAssetCount"];
    v5->_totalItemCount = [v4 decodeIntegerForKey:@"totalItemCount"];
    v5->_completedAssetCount = [v4 decodeIntegerForKey:@"completedAssetCount"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v11;
  }
  return v5;
}

- (id)description
{
  v3 = objc_opt_new();
  id v4 = v3;
  libraryID = self->_libraryID;
  if (libraryID) {
    [v3 setObject:libraryID forKeyedSubscript:@"libraryID"];
  }
  dataClass = self->_dataClass;
  if (dataClass) {
    [v4 setObject:dataClass forKeyedSubscript:@"dataClass"];
  }
  v7 = [NSNumber numberWithUnsignedInt:self->_syncStage];
  [v4 setObject:v7 forKeyedSubscript:@"syncStage"];

  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_syncType];
  [v4 setObject:v8 forKeyedSubscript:@"syncType"];

  *(float *)&double v9 = self->_progress;
  float v10 = [NSNumber numberWithFloat:v9];
  [v4 setObject:v10 forKeyedSubscript:@"progress"];

  uint64_t v11 = [NSNumber numberWithUnsignedInteger:self->_totalAssetCount];
  [v4 setObject:v11 forKeyedSubscript:@"totalAssetCount"];

  v12 = [NSNumber numberWithUnsignedInteger:self->_totalItemCount];
  [v4 setObject:v12 forKeyedSubscript:@"totalItemCount"];

  v13 = [NSNumber numberWithUnsignedInteger:self->_completedAssetCount];
  [v4 setObject:v13 forKeyedSubscript:@"completedAssetCount"];

  localizedDescription = self->_localizedDescription;
  if (localizedDescription) {
    [v4 setObject:localizedDescription forKeyedSubscript:@"localizedDescription"];
  }
  v15 = [v4 description];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v4 dataClass];
    if ([v5 isEqualToString:self->_dataClass])
    {
      uint64_t v6 = [v4 libraryID];
      char v7 = [v6 isEqualToString:self->_libraryID];
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_dataClass hash];
  return [(NSString *)self->_libraryID hash] ^ v3;
}

- (ATStatus)initWithLibraryID:(id)a3 dataClass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATStatus;
  double v9 = [(ATStatus *)&v12 init];
  float v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_libraryID, a3);
    objc_storeStrong((id *)&v10->_dataClass, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end