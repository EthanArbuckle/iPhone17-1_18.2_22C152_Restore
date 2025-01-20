@interface CPLane
+ (BOOL)supportsSecureCoding;
+ (NSArray)accNavParameters;
+ (NSDictionary)accNavParameterKeysIndexed;
+ (NSDictionary)accNavParametersIndexed;
- (BOOL)isEqual:(id)a3;
- (CPLane)init;
- (CPLane)initWithAngles:(id)a3;
- (CPLane)initWithAngles:(id)a3 highlightedAngle:(id)a4 isPreferred:(BOOL)a5;
- (CPLane)initWithCoder:(id)a3;
- (NSArray)angles;
- (NSMeasurement)highlightedAngle;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)status;
- (unsigned)index;
- (void)clearValueForKey:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAngles:(id)a3;
- (void)setHighlightedAngle:(id)a3;
- (void)setIndex:(unsigned __int16)a3;
- (void)setPrimaryAngle:(id)a3;
- (void)setSecondaryAngles:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation CPLane

- (CPLane)init
{
  v4.receiver = self;
  v4.super_class = (Class)CPLane;
  v2 = [(CPLane *)&v4 init];
  if (v2) {
    +[CPAccNavUpdate resetUpdate:v2];
  }
  return v2;
}

- (CPLane)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CPLane;
  v5 = [(CPLane *)&v7 init];
  if (v5)
  {
    +[CPAccNavUpdate resetUpdate:v5];
    +[CPAccNavUpdate decodeUpdate:v5 withCoder:v4];
  }

  return v5;
}

- (CPLane)initWithAngles:(id)a3 highlightedAngle:(id)a4 isPreferred:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLane;
  v11 = [(CPLane *)&v14 init];
  if (v11)
  {
    +[CPAccNavUpdate resetUpdate:v11];
    objc_storeStrong((id *)&v11->_highlightedAngle, a4);
    objc_storeStrong((id *)&v11->_angles, a3);
    uint64_t v12 = 1;
    if (v5) {
      uint64_t v12 = 2;
    }
    v11->_status = v12;
  }

  return v11;
}

- (CPLane)initWithAngles:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLane;
  v6 = [(CPLane *)&v9 init];
  if (v6)
  {
    +[CPAccNavUpdate resetUpdate:v6];
    highlightedAngle = v6->_highlightedAngle;
    v6->_highlightedAngle = 0;

    objc_storeStrong((id *)&v6->_angles, a3);
    v6->_status = 0;
  }

  return v6;
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
  v8.super_class = (Class)CPLane;
  id v4 = [(CPLane *)&v8 description];
  id v5 = +[CPAccNavUpdate description:self];
  v6 = [v3 stringWithFormat:@"%@ {\n%@\n}", v4, v5];

  return (NSString *)v6;
}

- (NSMeasurement)highlightedAngle
{
  highlightedAngle = self->_highlightedAngle;
  if (highlightedAngle) {
    goto LABEL_4;
  }
  if (self->_status)
  {
    highlightedAngle = self->_primaryAngle;
LABEL_4:
    v3 = highlightedAngle;
    goto LABEL_5;
  }
  v3 = 0;
LABEL_5:

  return v3;
}

- (void)setHighlightedAngle:(id)a3
{
  id v4 = (NSMeasurement *)a3;
  if (!self->_status) {
    self->_status = 2;
  }
  self->_highlightedAngle = v4;

  MEMORY[0x270F9A758]();
}

- (NSArray)angles
{
  angles = self->_angles;
  if (angles) {
    goto LABEL_4;
  }
  if (self->_status || !self->_primaryAngle)
  {
    angles = self->_secondaryAngles;
LABEL_4:
    v3 = angles;
    goto LABEL_5;
  }
  -[NSArray arrayByAddingObject:](self->_secondaryAngles, "arrayByAddingObject:");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
LABEL_5:

  return v3;
}

- (void)setAngles:(id)a3
{
}

- (void)setPrimaryAngle:(id)a3
{
}

- (void)setSecondaryAngles:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
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
  objc_storeStrong((id *)&self->_secondaryAngles, 0);
  objc_storeStrong((id *)&self->_angles, 0);
  objc_storeStrong((id *)&self->_primaryAngle, 0);

  objc_storeStrong((id *)&self->_highlightedAngle, 0);
}

+ (NSArray)accNavParameters
{
  if (accNavParameters_onceToken_1 != -1) {
    dispatch_once(&accNavParameters_onceToken_1, &__block_literal_global_14);
  }
  v2 = (void *)accNavParameters__accNavParameters_1;

  return (NSArray *)v2;
}

void __42__CPLane_CPAccNavUpdate__accNavParameters__block_invoke()
{
  v29[4] = *MEMORY[0x263EF8340];
  v22 = NSStringFromSelector(sel_index);
  v24 = +[CPAccNavParamKey paramKey:0];
  v23 = (void *)[v24 copySettingIsIntegerValue:1];
  v28 = v23;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  v20 = +[CPAccNavParam paramWithProperty:v22 keys:v21];
  v29[0] = v20;
  v17 = NSStringFromSelector(sel_status);
  v19 = +[CPAccNavParamKey paramKey:1];
  v18 = (void *)[v19 copySettingEnumType:4];
  v27 = v18;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
  v15 = +[CPAccNavParam paramWithProperty:v17 keys:v16];
  v29[1] = v15;
  uint64_t v12 = NSStringFromSelector(sel_angles);
  objc_super v14 = +[CPAccNavParamKey paramKey:2];
  v13 = [MEMORY[0x263F08C70] degrees];
  v11 = (void *)[v14 copySettingDimension:v13];
  v26 = v11;
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v1 = +[CPAccNavParam paramWithProperty:v12 keys:v0];
  v2 = (void *)[v1 copySettingCollectionGeneric:objc_opt_class()];
  v29[2] = v2;
  v3 = NSStringFromSelector(sel_highlightedAngle);
  id v4 = +[CPAccNavParamKey paramKey:3];
  id v5 = [MEMORY[0x263F08C70] degrees];
  v6 = (void *)[v4 copySettingDimension:v5];
  v25 = v6;
  objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
  objc_super v8 = +[CPAccNavParam paramWithProperty:v3 keys:v7];
  v29[3] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
  id v10 = (void *)accNavParameters__accNavParameters_1;
  accNavParameters__accNavParameters_1 = v9;
}

+ (NSDictionary)accNavParametersIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CPLane_CPAccNavUpdate__accNavParametersIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParametersIndexed_onceToken_1 != -1) {
    dispatch_once(&accNavParametersIndexed_onceToken_1, block);
  }
  v2 = (void *)accNavParametersIndexed__accNavParametersIndexed_1;

  return (NSDictionary *)v2;
}

uint64_t __49__CPLane_CPAccNavUpdate__accNavParametersIndexed__block_invoke(uint64_t a1)
{
  accNavParametersIndexed__accNavParametersIndexed_1 = +[CPAccNavUpdate accNavParametersIndexedForUpdate:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

+ (NSDictionary)accNavParameterKeysIndexed
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CPLane_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (accNavParameterKeysIndexed_onceToken_1 != -1) {
    dispatch_once(&accNavParameterKeysIndexed_onceToken_1, block);
  }
  v2 = (void *)accNavParameterKeysIndexed__accNavParameterKeysIndexed_1;

  return (NSDictionary *)v2;
}

uint64_t __52__CPLane_CPAccNavUpdate__accNavParameterKeysIndexed__block_invoke(uint64_t a1)
{
  accNavParameterKeysIndexed__accNavParameterKeysIndexed_1 = +[CPAccNavUpdate accNavParameterKeysIndexedForUpdate:*(void *)(a1 + 32)];

  return MEMORY[0x270F9A758]();
}

- (void)clearValueForKey:(id)a3
{
}

@end