@interface DNDSLocationTriggerConfiguration
+ (id)emptyConfiguration;
- (DNDSLocationTriggerConfiguration)init;
- (id)modeIdentifierForRegion:(id)a3;
- (id)regionForRegionIdentifier:(id)a3;
- (id)regionIdentifiers;
- (id)regions;
- (void)addTriggerForModeWithIdentifier:(id)a3 forRegion:(id)a4;
@end

@implementation DNDSLocationTriggerConfiguration

+ (id)emptyConfiguration
{
  v2 = objc_alloc_init(DNDSLocationTriggerConfiguration);
  return v2;
}

- (DNDSLocationTriggerConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)DNDSLocationTriggerConfiguration;
  v2 = [(DNDSLocationTriggerConfiguration *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    modeIdentifierByRegionIdentifier = v2->_modeIdentifierByRegionIdentifier;
    v2->_modeIdentifierByRegionIdentifier = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    regionByRegionIdentifier = v2->_regionByRegionIdentifier;
    v2->_regionByRegionIdentifier = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)regions
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(NSMutableDictionary *)self->_regionByRegionIdentifier allValues];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)regionIdentifiers
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(NSMutableDictionary *)self->_regionByRegionIdentifier allKeys];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)regionForRegionIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_regionByRegionIdentifier objectForKeyedSubscript:a3];
}

- (id)modeIdentifierForRegion:(id)a3
{
  modeIdentifierByRegionIdentifier = self->_modeIdentifierByRegionIdentifier;
  v4 = [a3 identifier];
  uint64_t v5 = [(NSMutableDictionary *)modeIdentifierByRegionIdentifier objectForKeyedSubscript:v4];

  return v5;
}

- (void)addTriggerForModeWithIdentifier:(id)a3 forRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 identifier];
  [(NSMutableDictionary *)self->_modeIdentifierByRegionIdentifier setObject:v7 forKeyedSubscript:v8];

  [(NSMutableDictionary *)self->_regionByRegionIdentifier setObject:v6 forKeyedSubscript:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionByRegionIdentifier, 0);
  objc_storeStrong((id *)&self->_modeIdentifierByRegionIdentifier, 0);
}

@end