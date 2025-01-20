@interface BWSecureMetadataOutputConfiguration
- (BOOL)attentionDetectionEnabled;
- (BOOL)eyeReliefStatusDetectionEnabled;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)objectDetectionEnabled;
- (BWSecureMetadataOutputConfiguration)init;
- (NSDictionary)metadataOutputConfigurationDictionary;
- (NSSet)enabledDetectedObjectTypes;
- (float)objectDetectionTargetFrameRate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setAttentionDetectionEnabled:(BOOL)a3;
- (void)setEnabledDetectedObjectTypes:(id)a3;
- (void)setEyeReliefStatusDetectionEnabled:(BOOL)a3;
- (void)setObjectDetectionEnabled:(BOOL)a3;
- (void)setObjectDetectionTargetFrameRate:(float)a3;
@end

@implementation BWSecureMetadataOutputConfiguration

- (void)setEnabledDetectedObjectTypes:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  BOOL result = (objc_opt_isKindOfClass() & 1) != 0
        && self->_objectDetectionEnabled == [a3 objectDetectionEnabled]
        && (NSSet *)[a3 enabledDetectedObjectTypes] == self->_enabledDetectedObjectTypes
        && ([a3 objectDetectionTargetFrameRate], v5 == self->_objectDetectionTargetFrameRate)
        && self->_attentionDetectionEnabled == [a3 attentionDetectionEnabled]
        && self->_eyeReliefStatusDetectionEnabled == [a3 eyeReliefStatusDetectionEnabled];
  return result;
}

- (BWSecureMetadataOutputConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWSecureMetadataOutputConfiguration;
  return [(BWSecureMetadataOutputConfiguration *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSecureMetadataOutputConfiguration;
  [(BWSecureMetadataOutputConfiguration *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[BWSecureMetadataOutputConfiguration allocWithZone:a3] init];
  [(BWSecureMetadataOutputConfiguration *)v4 setObjectDetectionEnabled:self->_objectDetectionEnabled];
  [(BWSecureMetadataOutputConfiguration *)v4 setEnabledDetectedObjectTypes:self->_enabledDetectedObjectTypes];
  *(float *)&double v5 = self->_objectDetectionTargetFrameRate;
  [(BWSecureMetadataOutputConfiguration *)v4 setObjectDetectionTargetFrameRate:v5];
  [(BWSecureMetadataOutputConfiguration *)v4 setAttentionDetectionEnabled:self->_attentionDetectionEnabled];
  [(BWSecureMetadataOutputConfiguration *)v4 setEyeReliefStatusDetectionEnabled:self->_eyeReliefStatusDetectionEnabled];
  return v4;
}

- (float)objectDetectionTargetFrameRate
{
  return self->_objectDetectionTargetFrameRate;
}

- (void)setObjectDetectionTargetFrameRate:(float)a3
{
  self->_objectDetectionTargetFrameRate = a3;
}

- (NSDictionary)metadataOutputConfigurationDictionary
{
  objc_super v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [NSNumber numberWithBool:self->_objectDetectionEnabled];
  [(NSDictionary *)v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F53B28]];
  if (self->_objectDetectionEnabled)
  {
    double v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538C8]]) {
      [v5 setObject:&unk_1EFB004A0 forKeyedSubscript:*MEMORY[0x1E4F54490]];
    }
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538D8]]) {
      [v5 setObject:&unk_1EFB004B8 forKeyedSubscript:*MEMORY[0x1E4F544A0]];
    }
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538E0]]) {
      [v5 setObject:&unk_1EFB004A0 forKeyedSubscript:*MEMORY[0x1E4F544A8]];
    }
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538C0]]) {
      [v5 setObject:&unk_1EFB004A0 forKeyedSubscript:*MEMORY[0x1E4F54488]];
    }
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538D0]]) {
      [v5 setObject:&unk_1EFB004A0 forKeyedSubscript:*MEMORY[0x1E4F54498]];
    }
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538B0]]) {
      [v5 setObject:&unk_1EFB004A0 forKeyedSubscript:*MEMORY[0x1E4F54478]];
    }
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538B8]]) {
      [v5 setObject:&unk_1EFB004A0 forKeyedSubscript:*MEMORY[0x1E4F54480]];
    }
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538A0]]) {
      [v5 setObject:&unk_1EFB004A0 forKeyedSubscript:*MEMORY[0x1E4F54468]];
    }
    if ([(NSSet *)self->_enabledDetectedObjectTypes containsObject:*MEMORY[0x1E4F538A8]]) {
      [v5 setObject:&unk_1EFB004A0 forKeyedSubscript:*MEMORY[0x1E4F54470]];
    }
    if (self->_objectDetectionTargetFrameRate > 0.0)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithFloat:");
      [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F550D0]];
    }
    uint64_t v7 = [NSNumber numberWithBool:self->_attentionDetectionEnabled];
    [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F54DA0]];
    [(NSDictionary *)v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F53B20]];
  }
  uint64_t v8 = [NSNumber numberWithBool:self->_eyeReliefStatusDetectionEnabled];
  [(NSDictionary *)v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F53B18]];
  return v3;
}

- (BOOL)isEmpty
{
  return !self->_objectDetectionEnabled && !self->_eyeReliefStatusDetectionEnabled;
}

- (BOOL)objectDetectionEnabled
{
  return self->_objectDetectionEnabled;
}

- (void)setObjectDetectionEnabled:(BOOL)a3
{
  self->_objectDetectionEnabled = a3;
}

- (NSSet)enabledDetectedObjectTypes
{
  return self->_enabledDetectedObjectTypes;
}

- (BOOL)attentionDetectionEnabled
{
  return self->_attentionDetectionEnabled;
}

- (void)setAttentionDetectionEnabled:(BOOL)a3
{
  self->_attentionDetectionEnabled = a3;
}

- (BOOL)eyeReliefStatusDetectionEnabled
{
  return self->_eyeReliefStatusDetectionEnabled;
}

- (void)setEyeReliefStatusDetectionEnabled:(BOOL)a3
{
  self->_eyeReliefStatusDetectionEnabled = a3;
}

@end