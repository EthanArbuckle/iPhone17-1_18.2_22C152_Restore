@interface MTLFunctionStitchingAttributeAlwaysInline
- (NSString)description;
- (id)formattedDescription:(unint64_t)a3;
@end

@implementation MTLFunctionStitchingAttributeAlwaysInline

- (id)formattedDescription:(unint64_t)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingAttributeAlwaysInline;
  v6 = [(MTLFunctionStitchingAttributeAlwaysInline *)&v8 description];
  v9[0] = v4;
  v9[1] = @"alwaysInline";
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 2), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(MTLFunctionStitchingAttributeAlwaysInline *)self formattedDescription:0];
}

@end