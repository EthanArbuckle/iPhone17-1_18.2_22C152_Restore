@interface GPGenerationRecipeData
+ (BOOL)supportsSecureCoding;
- (GPGenerationRecipeData)init;
- (GPGenerationRecipeData)initWithCoder:(id)a3;
- (GPGenerationRecipeData)initWithUnderlyingData:(id)a3;
- (NSData)underlyingData;
- (id)getDrawOnImageRecipe;
- (id)getRecipeInfo;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GPGenerationRecipeData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPGenerationRecipeData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingData"];

  v6 = [(GPGenerationRecipeData *)self initWithUnderlyingData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(GPGenerationRecipeData *)self underlyingData];
  [v4 encodeObject:v5 forKey:@"underlyingData"];
}

- (NSData)underlyingData
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___GPGenerationRecipeData_underlyingData);
  unint64_t v3 = *(void *)&self->underlyingData[OBJC_IVAR___GPGenerationRecipeData_underlyingData];
  sub_243EE0DAC(v2, v3);
  id v4 = (void *)sub_2443B5370();
  sub_243ECBC38(v2, v3);

  return (NSData *)v4;
}

- (GPGenerationRecipeData)initWithUnderlyingData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_2443B5380();
  uint64_t v7 = v6;

  v8 = (uint64_t *)((char *)self + OBJC_IVAR___GPGenerationRecipeData_underlyingData);
  uint64_t *v8 = v5;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)GPGenerationRecipeData;
  return [(GPGenerationRecipeData *)&v10 init];
}

- (id)getRecipeInfo
{
  uint64_t v2 = self;
  unint64_t v3 = (unint64_t)GPGenerationRecipeData.getRecipeInfo()();

  if (v3)
  {
    id v4 = (void *)sub_2443BA2F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)getDrawOnImageRecipe
{
  uint64_t v2 = self;
  GPGenerationRecipeData.getDrawOnImageRecipe()(v3);
  uint64_t v5 = v4;

  return v5;
}

- (GPGenerationRecipeData)init
{
  result = (GPGenerationRecipeData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end