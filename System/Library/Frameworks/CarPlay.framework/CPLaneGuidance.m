@interface CPLaneGuidance
+ (BOOL)supportsSecureCoding;
+ (NSArray)accNavParameters;
+ (NSDictionary)accNavParameterKeysIndexed;
+ (NSDictionary)accNavParametersIndexed;
- (BOOL)isEqual:(id)a3;
- (CPLaneGuidance)init;
- (CPLaneGuidance)initWithCoder:(id)a3;
- (CPLaneGuidance)laneGuidanceWithComponent:(id)a3;
- (NSArray)instructionVariants;
- (NSArray)lanes;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)componentID;
- (unsigned)index;
- (void)clearValueForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setComponentID:(unsigned __int16)a3;
- (void)setIndex:(unsigned __int16)a3;
- (void)setInstructionVariants:(id)a3;
- (void)setLanes:(id)a3;
@end

@implementation CPLaneGuidance

- (CPLaneGuidance)laneGuidanceWithComponent:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F22E88];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 component];
  v8 = (void *)[v6 initWithLaneGuidance:self component:v7];

  v9 = (void *)[objc_alloc(MEMORY[0x263F30EC0]) initWithComponent:v5 accNavInfo:v8];

  return (CPLaneGuidance *)v9;
}

- (CPLaneGuidance)init
{
  v4.receiver = self;
  v4.super_class = (Class)CPLaneGuidance;
  v2 = [(CPLaneGuidance *)&v4 init];
  if (v2) {
    +[CPAccNavUpdate resetUpdate:v2];
  }
  return v2;
}

- (CPLaneGuidance)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLaneGuidance *)self init];
  if (v5) {
    +[CPAccNavUpdate decodeUpdate:v5 withCoder:v4];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return +[CPAccNavUpdate copyUpdate:self];
}

- (BOOL)isEqual:(id)a3
{
  return +[CPAccNavUpdate isUpdate:self equalTo:a3];
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CPLaneGuidance;
  id v4 = [(CPLaneGuidance *)&v8 description];
  id v5 = +[CPAccNavUpdate description:self];
  id v6 = [v3 stringWithFormat:@"%@ {\n%@\n}", v4, v5];

  return (NSString *)v6;
}

- (void)setLanes:(id)a3
{
  id v14 = a3;
  id v4 = (NSArray *)[v14 copy];
  lanes = self->_lanes;
  self->_lanes = v4;

  if ([v14 count])
  {
    uint64_t v6 = 0;
    unsigned __int16 v7 = 0;
    do
    {
      objc_super v8 = NSNumber;
      v9 = [(NSArray *)self->_lanes objectAtIndexedSubscript:v6];
      v10 = objc_msgSend(v8, "numberWithUnsignedShort:", objc_msgSend(v9, "index"));
      v11 = NotSetFromCPAccNavType(2uLL);
      int v12 = [v10 isEqual:v11];

      if (v12)
      {
        v13 = [(NSArray *)self->_lanes objectAtIndexedSubscript:v6];
        [v13 setIndex:v7];
      }
      uint64_t v6 = ++v7;
    }
    while ([v14 count] > (unint64_t)v7);
  }
}

- (NSArray)lanes
{
  return self->_lanes;
}

- (NSArray)instructionVariants
{
  return self->_instructionVariants;
}

- (void)setInstructionVariants:(id)a3
{
}

- (unsigned)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(unsigned __int16)a3
{
  self->_componentID = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned __int16)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionVariants, 0);

  objc_storeStrong((id *)&self->_lanes, 0);
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken_3 != -1) {
    dispatch_once(&accNavParameters_onceToken_3, &__block_literal_global_21);
  }
  v2 = (void *)accNavParameters__accNavParameters_3;

  return (NSArray *)v2;
}

void __50__CPLaneGuidance_CPAccNavUpdate__accNavParameters__block_invoke()
{
  v27[4] = *MEMORY[0x263EF8340];
  v20 = NSStringFromSelector(sel_componentID);
  v22 = +[CPAccNavParamKey paramKey:0];
  v21 = (void *)[v22 copySettingIsIntegerValue:1];
  v26 = v21;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v18 = +[CPAccNavParam paramWithProperty:v20 keys:v19];
  v27[0] = v18;
  v15 = NSStringFromSelector(sel_index);
  v17 = +[CPAccNavParamKey paramKey:1];
  v16 = (void *)[v17 copySettingIsIntegerValue:1];
  v25 = v16;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  v13 = +[CPAccNavParam paramWithProperty:v15 keys:v14];
  v27[1] = v13;
  int v12 = NSStringFromSelector(sel_lanes);
  v11 = +[CPAccNavParamKey paramKey:2];
  v24 = v11;
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  v1 = +[CPAccNavParam paramWithProperty:v12 keys:v0];
  v2 = (void *)[v1 copySettingCollectionGeneric:objc_opt_class()];
  v27[2] = v2;
  v3 = NSStringFromSelector(sel_instructionVariants);
  id v4 = +[CPAccNavParamKey paramKey:3];
  id v5 = (void *)[v4 copySettingHasVariants:1];
  v23 = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  unsigned __int16 v7 = +[CPAccNavParam paramWithProperty:v3 keys:v6];
  objc_super v8 = (void *)[v7 copySettingCollectionGeneric:objc_opt_class()];
  v27[3] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
  v10 = (void *)accNavParameters__accNavParameters_3;
  accNavParameters__accNavParameters_3 = v9;
}

+ (NSDictionary)accNavParametersIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CPLaneGuidance_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken_3 != -1) {
    dispatch_once(&accNavParametersIndexed_onceToken_3, block);
  }
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed_3;

  return (NSDictionary *)v2;
}

uint64_t __57__CPLaneGuidance_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1 = +[CPAccNavUpdate accNavParametersIndexedForUpdate:*(void *)(a1 + 32)];
  uint64_t v2 = accNavParametersIndexed__accNavParametersIndexed_3;
  accNavParametersIndexed__accNavParametersIndexed_3 = v1;

  return MEMORY[0x270F9A758](v1, v2);
}

+ (NSDictionary)accNavParameterKeysIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CPLaneGuidance_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken_3 != -1) {
    dispatch_once(&accNavParameterKeysIndexed_onceToken_3, block);
  }
  uint64_t v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed_3;

  return (NSDictionary *)v2;
}

uint64_t __60__CPLaneGuidance_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  uint64_t v1 = +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:*(void *)(a1 + 32)];
  uint64_t v2 = accNavParameterKeysIndexed__accNavParameterKeysIndexed_3;
  accNavParameterKeysIndexed__accNavParameterKeysIndexed_3 = v1;

  return MEMORY[0x270F9A758](v1, v2);
}

- (void)clearValueForKey:(id)a3
{
}

@end