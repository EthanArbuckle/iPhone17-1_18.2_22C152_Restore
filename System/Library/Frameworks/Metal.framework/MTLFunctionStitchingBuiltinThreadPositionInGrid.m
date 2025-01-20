@interface MTLFunctionStitchingBuiltinThreadPositionInGrid
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)hash;
@end

@implementation MTLFunctionStitchingBuiltinThreadPositionInGrid

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v3);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (unint64_t)hash
{
  return 1146191283;
}

- (id)formattedDescription:(unint64_t)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingBuiltinThreadPositionInGrid;
  v6 = [(MTLFunctionStitchingBuiltinThreadPositionInGrid *)&v8 description];
  v9[0] = v4;
  v9[1] = &stru_1ECAC84A8;
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 2), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(MTLFunctionStitchingBuiltinThreadPositionInGrid *)self formattedDescription:0];
}

@end