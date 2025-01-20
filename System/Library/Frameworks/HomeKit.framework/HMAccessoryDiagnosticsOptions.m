@interface HMAccessoryDiagnosticsOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)enableAudioClips;
- (BOOL)metadataRequired;
- (BOOL)recordAudio;
- (HMAccessoryDiagnosticsOptions)initWithCoder:(id)a3;
- (HMAccessoryDiagnosticsOptions)initWithLogSizeBytes:(id)a3 delaySeconds:(id)a4 snapshotType:(int64_t)a5 recordAudio:(BOOL)a6 enableAudioClips:(BOOL)a7 cloudkitMetadataRequired:(BOOL)a8;
- (NSNumber)delay;
- (NSNumber)logSize;
- (NSNumber)matterLogType;
- (id)payloadMetadata;
- (int64_t)snapshotType;
- (void)encodeWithCoder:(id)a3;
- (void)setMatterLogType:(id)a3;
@end

@implementation HMAccessoryDiagnosticsOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delay, 0);
  objc_storeStrong((id *)&self->_logSize, 0);

  objc_storeStrong((id *)&self->_matterLogType, 0);
}

- (int64_t)snapshotType
{
  return self->_snapshotType;
}

- (NSNumber)delay
{
  return self->_delay;
}

- (BOOL)enableAudioClips
{
  return self->_enableAudioClips;
}

- (BOOL)recordAudio
{
  return self->_recordAudio;
}

- (NSNumber)logSize
{
  return self->_logSize;
}

- (BOOL)metadataRequired
{
  return self->_metadataRequired;
}

- (void)setMatterLogType:(id)a3
{
}

- (NSNumber)matterLogType
{
  return self->_matterLogType;
}

- (void)encodeWithCoder:(id)a3
{
  logSize = self->_logSize;
  id v9 = a3;
  [v9 encodeObject:logSize forKey:@"HMA.diagnostics.ck.ls"];
  [v9 encodeObject:self->_delay forKey:@"HMA.diagnostics.ck.d"];
  v5 = [NSNumber numberWithInteger:self->_snapshotType];
  [v9 encodeObject:v5 forKey:@"HMA.diagnostics.ck.st"];

  v6 = [NSNumber numberWithBool:self->_recordAudio];
  [v9 encodeObject:v6 forKey:@"HMA.diagnostics.ck.ra"];

  v7 = [NSNumber numberWithBool:self->_enableAudioClips];
  [v9 encodeObject:v7 forKey:@"HMA.diagnostics.ck.ec"];

  v8 = [NSNumber numberWithBool:self->_metadataRequired];
  [v9 encodeObject:v8 forKey:@"HMA.diagnostics.ck.mr"];

  [v9 encodeObject:self->_matterLogType forKey:@"LogType"];
}

- (HMAccessoryDiagnosticsOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.ls"];
  uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.d"];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.st"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.ra"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.ec"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMA.diagnostics.ck.mr"];
  if ([v5 integerValue] > 2 || objc_msgSend(v5, "integerValue") <= 0)
  {

    v5 = &unk_1EEF07E00;
  }
  uint64_t v9 = objc_msgSend(v5, "integerValue", v15);
  v10 = v6;
  v11 = -[HMAccessoryDiagnosticsOptions initWithLogSizeBytes:delaySeconds:snapshotType:recordAudio:enableAudioClips:cloudkitMetadataRequired:](self, "initWithLogSizeBytes:delaySeconds:snapshotType:recordAudio:enableAudioClips:cloudkitMetadataRequired:", v17, v16, v9, [v6 BOOLValue], objc_msgSend(v7, "BOOLValue"), objc_msgSend(v8, "BOOLValue"));
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LogType"];
  matterLogType = v11->_matterLogType;
  v11->_matterLogType = (NSNumber *)v12;

  return v11;
}

- (id)payloadMetadata
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(HMAccessoryDiagnosticsOptions *)self logSize];

  if (v4)
  {
    v5 = [(HMAccessoryDiagnosticsOptions *)self logSize];
    [v3 setObject:v5 forKeyedSubscript:@"maxLogSize"];
  }
  v6 = [(HMAccessoryDiagnosticsOptions *)self delay];

  if (v6)
  {
    v7 = [(HMAccessoryDiagnosticsOptions *)self delay];
    [v3 setObject:v7 forKeyedSubscript:@"delay"];
  }
  if ([(HMAccessoryDiagnosticsOptions *)self recordAudio])
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HMAccessoryDiagnosticsOptions recordAudio](self, "recordAudio"));
    [v3 setObject:v8 forKeyedSubscript:@"recordAudio"];
  }
  if ([(HMAccessoryDiagnosticsOptions *)self enableAudioClips])
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HMAccessoryDiagnosticsOptions enableAudioClips](self, "enableAudioClips"));
    [v3 setObject:v9 forKeyedSubscript:@"audioClips"];
  }
  if ([(HMAccessoryDiagnosticsOptions *)self snapshotType] != 1)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMAccessoryDiagnosticsOptions snapshotType](self, "snapshotType"));
    [v3 setObject:v10 forKeyedSubscript:@"snapshotType"];
  }
  v11 = [(HMAccessoryDiagnosticsOptions *)self matterLogType];
  [v3 setObject:v11 forKeyedSubscript:@"LogType"];

  return v3;
}

- (HMAccessoryDiagnosticsOptions)initWithLogSizeBytes:(id)a3 delaySeconds:(id)a4 snapshotType:(int64_t)a5 recordAudio:(BOOL)a6 enableAudioClips:(BOOL)a7 cloudkitMetadataRequired:(BOOL)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMAccessoryDiagnosticsOptions;
  v17 = [(HMAccessoryDiagnosticsOptions *)&v20 init];
  if (!v17) {
    goto LABEL_11;
  }
  if ((!v15 || [v15 integerValue] <= 0x40000000 && objc_msgSend(v15, "integerValue") >= 5242880)
    && ([v16 integerValue] & 0x8000000000000000) == 0
    && [v16 integerValue] <= 3600
    && (a5 != 1 || !v10 && !v9))
  {
    objc_storeStrong((id *)&v17->_logSize, a3);
    objc_storeStrong((id *)&v17->_delay, a4);
    v17->_snapshotType = a5;
    v17->_recordAudio = v10;
    v17->_enableAudioClips = v9;
    v17->_metadataRequired = a8;
LABEL_11:
    v18 = v17;
    goto LABEL_12;
  }
  v18 = 0;
LABEL_12:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end