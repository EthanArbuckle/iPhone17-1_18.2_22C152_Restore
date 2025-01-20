@interface BRCMigrationParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)cloneOnly;
- (BOOL)dropAccountFile;
- (BOOL)dropClientState;
- (BRCMigrationParameters)initWithCoder:(id)a3;
- (NSError)errorOverride;
- (unint64_t)originatorIdOverride;
- (void)encodeWithCoder:(id)a3;
- (void)setCloneOnly:(BOOL)a3;
- (void)setDropAccountFile:(BOOL)a3;
- (void)setDropClientState:(BOOL)a3;
- (void)setErrorOverride:(id)a3;
- (void)setOriginatorIdOverride:(unint64_t)a3;
@end

@implementation BRCMigrationParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL cloneOnly = self->cloneOnly;
  id v5 = a3;
  [v5 encodeBool:cloneOnly forKey:@"cloneOnly"];
  [v5 encodeObject:self->errorOverride forKey:@"errorOverride"];
  [v5 encodeInt64:self->originatorIdOverride forKey:@"originatorIdOverride"];
  [v5 encodeBool:self->dropAccountFile forKey:@"dropAccountFile"];
  [v5 encodeBool:self->dropClientState forKey:@"dropClientState"];
}

- (BRCMigrationParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCMigrationParameters;
  id v5 = [(BRCMigrationParameters *)&v9 init];
  if (v5)
  {
    v5->BOOL cloneOnly = [v4 decodeBoolForKey:@"cloneOnly"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorOverride"];
    errorOverride = v5->errorOverride;
    v5->errorOverride = (NSError *)v6;

    v5->originatorIdOverride = [v4 decodeInt64ForKey:@"originatorIdOverride"];
    v5->dropAccountFile = [v4 decodeBoolForKey:@"dropAccountFile"];
    v5->dropClientState = [v4 decodeBoolForKey:@"dropClientState"];
  }

  return v5;
}

- (BOOL)cloneOnly
{
  return self->cloneOnly;
}

- (void)setCloneOnly:(BOOL)a3
{
  self->BOOL cloneOnly = a3;
}

- (NSError)errorOverride
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setErrorOverride:(id)a3
{
}

- (unint64_t)originatorIdOverride
{
  return self->originatorIdOverride;
}

- (void)setOriginatorIdOverride:(unint64_t)a3
{
  self->originatorIdOverride = a3;
}

- (BOOL)dropAccountFile
{
  return self->dropAccountFile;
}

- (void)setDropAccountFile:(BOOL)a3
{
  self->dropAccountFile = a3;
}

- (BOOL)dropClientState
{
  return self->dropClientState;
}

- (void)setDropClientState:(BOOL)a3
{
  self->dropClientState = a3;
}

- (void).cxx_destruct
{
}

@end