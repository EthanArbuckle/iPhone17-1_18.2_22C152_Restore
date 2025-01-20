@interface AEAssessmentParticipantConfiguration
+ (AEAssessmentParticipantConfiguration)new;
+ (id)instanceFromIndividualConfiguration:(id)a3;
- (AEAssessmentParticipantConfiguration)init;
- (BOOL)allowsNetworkAccess;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)configurationInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)individualConfiguration;
- (uint64_t)isEqualToConfiguration:(uint64_t)a1;
- (unint64_t)hash;
- (void)setAllowsNetworkAccess:(BOOL)allowsNetworkAccess;
- (void)setConfigurationInfo:(id)a3;
@end

@implementation AEAssessmentParticipantConfiguration

- (AEAssessmentParticipantConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)AEAssessmentParticipantConfiguration;
  v2 = [(AEAssessmentParticipantConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_allowsNetworkAccess = 1;
    configurationInfo = v2->_configurationInfo;
    v2->_configurationInfo = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v3;
}

+ (AEAssessmentParticipantConfiguration)new
{
  return (AEAssessmentParticipantConfiguration *)MEMORY[0x270F9A540](a1, a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AEAssessmentParticipantConfiguration allocWithZone:a3] init];
  v4->_allowsNetworkAccess = self->_allowsNetworkAccess;
  uint64_t v5 = [(NSDictionary *)self->_configurationInfo copy];
  configurationInfo = v4->_configurationInfo;
  v4->_configurationInfo = (NSDictionary *)v5;

  return v4;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithBool:self->_allowsNetworkAccess];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSDictionary *)self->_configurationInfo hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AEAssessmentParticipantConfiguration *)a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  if ([(AEAssessmentParticipantConfiguration *)v4 isMemberOfClass:objc_opt_class()]) {
    char v6 = -[AEAssessmentParticipantConfiguration isEqualToConfiguration:]((uint64_t)self, v5);
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToConfiguration:(uint64_t)a1
{
  v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 8) == *((unsigned __int8 *)v3 + 8))
    {
      unint64_t v5 = *(void *)(a1 + 16);
      if (v5 | v4[2]) {
        a1 = objc_msgSend((id)v5, "isEqual:");
      }
      else {
        a1 = 1;
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = @"Yes";
  if (!self->_allowsNetworkAccess) {
    unint64_t v5 = @"No";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p { allowsNetworkAccess = %@, configurationInfo = %@ }>", v4, self, v5, self->_configurationInfo];
}

- (id)individualConfiguration
{
  v3 = objc_opt_new();
  [v3 setAllowsNetworkAccess:self->_allowsNetworkAccess];
  uint64_t v4 = (void *)[(NSDictionary *)self->_configurationInfo copy];
  [v3 setConfigurationInfo:v4];

  return v3;
}

+ (id)instanceFromIndividualConfiguration:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = objc_opt_new();
    *(unsigned char *)(v4 + 8) = [v3 allowsNetworkAccess];
    unint64_t v5 = [v3 configurationInfo];

    uint64_t v6 = [v5 copy];
    v7 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v6;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (id)v4;
}

- (BOOL)allowsNetworkAccess
{
  return self->_allowsNetworkAccess;
}

- (void)setAllowsNetworkAccess:(BOOL)allowsNetworkAccess
{
  self->_allowsNetworkAccess = allowsNetworkAccess;
}

- (NSDictionary)configurationInfo
{
  return self->_configurationInfo;
}

- (void)setConfigurationInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end