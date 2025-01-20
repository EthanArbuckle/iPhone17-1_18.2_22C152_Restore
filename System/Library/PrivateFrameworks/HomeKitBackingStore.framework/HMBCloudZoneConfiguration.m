@interface HMBCloudZoneConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldRebuildOnManateeKeyLoss;
- (BOOL)shouldSkipCloudPulls;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setShouldRebuildOnManateeKeyLoss:(BOOL)a3;
- (void)setShouldSkipCloudPulls:(BOOL)a3;
@end

@implementation HMBCloudZoneConfiguration

- (void)setShouldSkipCloudPulls:(BOOL)a3
{
  self->_shouldSkipCloudPulls = a3;
}

- (BOOL)shouldSkipCloudPulls
{
  return self->_shouldSkipCloudPulls;
}

- (void)setShouldRebuildOnManateeKeyLoss:(BOOL)a3
{
  self->_shouldRebuildOnManateeKeyLoss = a3;
}

- (BOOL)shouldRebuildOnManateeKeyLoss
{
  return self->_shouldRebuildOnManateeKeyLoss;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[HMBMutableCloudZoneConfiguration allocWithZone:a3] init];
  [(HMBCloudZoneConfiguration *)v4 setShouldRebuildOnManateeKeyLoss:[(HMBCloudZoneConfiguration *)self shouldRebuildOnManateeKeyLoss]];
  [(HMBCloudZoneConfiguration *)v4 setShouldSkipCloudPulls:[(HMBCloudZoneConfiguration *)self shouldSkipCloudPulls]];
  return v4;
}

- (unint64_t)hash
{
  BOOL v3 = [(HMBCloudZoneConfiguration *)self shouldRebuildOnManateeKeyLoss];
  return v3 ^ [(HMBCloudZoneConfiguration *)self shouldSkipCloudPulls];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (int v7 = [(HMBCloudZoneConfiguration *)self shouldRebuildOnManateeKeyLoss],
        v7 == [v6 shouldRebuildOnManateeKeyLoss]))
  {
    BOOL v9 = [(HMBCloudZoneConfiguration *)self shouldSkipCloudPulls];
    int v8 = v9 ^ [v6 shouldSkipCloudPulls] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMBCloudZoneConfiguration *)self shouldRebuildOnManateeKeyLoss];
  id v4 = HMFBooleanToString();
  v5 = (void *)[v3 initWithName:@"Rebuild On Manatee Key Loss" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMBCloudZoneConfiguration *)self shouldSkipCloudPulls];
  int v7 = HMFBooleanToString();
  int v8 = (void *)[v6 initWithName:@"Skip Cloud Pulls" value:v7];
  v11[1] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

@end