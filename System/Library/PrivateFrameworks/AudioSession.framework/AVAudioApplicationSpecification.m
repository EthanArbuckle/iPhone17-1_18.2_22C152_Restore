@interface AVAudioApplicationSpecification
+ (BOOL)supportsSecureCoding;
- ($115C4C562B26FF47E01F9F4EA65B5887)appAuditToken;
- (AVAudioApplicationSpecification)initWithCoder:(id)a3;
- (NSString)attributionBundleID;
- (NSString)processName;
- (int64_t)audioAppType;
- (void)encodeWithCoder:(id)a3;
- (void)setAppAuditToken:(id *)a3;
- (void)setAttributionBundleID:(id)a3;
- (void)setAudioAppType:(int64_t)a3;
- (void)setProcessName:(id)a3;
@end

@implementation AVAudioApplicationSpecification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInteger:self->audioAppType forKey:@"audioAppType"];
  v4 = [MEMORY[0x263EFF8F8] dataWithBytes:&self->_appAuditToken length:32];
  [v5 encodeObject:v4 forKey:@"appAuditToken"];
  [v5 encodeObject:self->attributionBundleID forKey:@"attributionBundleID"];
  [v5 encodeObject:self->processName forKey:@"processName"];
}

- (AVAudioApplicationSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVAudioApplicationSpecification;
  id v5 = [(AVAudioApplicationSpecification *)&v12 init];
  if (v5)
  {
    v5->audioAppType = [v4 decodeIntegerForKey:@"audioAppType"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appAuditToken"];
    [v6 getBytes:&v5->_appAuditToken length:32];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributionBundleID"];
    attributionBundleID = v5->attributionBundleID;
    v5->attributionBundleID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processName"];
    processName = v5->processName;
    v5->processName = (NSString *)v9;
  }
  return v5;
}

- (int64_t)audioAppType
{
  return self->audioAppType;
}

- (void)setAudioAppType:(int64_t)a3
{
  self->audioAppType = a3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)appAuditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[1].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAppAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_appAuditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_appAuditToken.val[4] = v3;
}

- (NSString)attributionBundleID
{
  return self->attributionBundleID;
}

- (void)setAttributionBundleID:(id)a3
{
}

- (NSString)processName
{
  return self->processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->processName, 0);
  objc_storeStrong((id *)&self->attributionBundleID, 0);
}

@end