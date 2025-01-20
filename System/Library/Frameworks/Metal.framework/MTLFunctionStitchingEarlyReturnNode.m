@interface MTLFunctionStitchingEarlyReturnNode
- (MTLFunctionStitchingEarlyReturnNode)initWithCondition:(id)a3 controlDependencies:(id)a4;
- (MTLFunctionStitchingNode)condition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedDescription:(unint64_t)a3;
- (void)setCondition:(id)a3;
@end

@implementation MTLFunctionStitchingEarlyReturnNode

- (MTLFunctionStitchingEarlyReturnNode)initWithCondition:(id)a3 controlDependencies:(id)a4
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = a3;
  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingEarlyReturnNode;
  return -[MTLFunctionStitchingFunctionNode initWithName:arguments:controlDependencies:](&v5, sel_initWithName_arguments_controlDependencies_, &stru_1ECAC84A8, [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1], a4);
}

- (MTLFunctionStitchingNode)condition
{
  v2 = [(MTLFunctionStitchingFunctionNode *)self arguments];

  return (MTLFunctionStitchingNode *)[(NSArray *)v2 objectAtIndexedSubscript:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setName:", -[NSString copy](-[MTLFunctionStitchingFunctionNode name](self, "name"), "copy"));
  objc_msgSend(v4, "setArguments:", -[NSArray copy](-[MTLFunctionStitchingFunctionNode arguments](self, "arguments"), "copy"));
  objc_msgSend(v4, "setControlDependencies:", -[NSArray copy](-[MTLFunctionStitchingFunctionNode controlDependencies](self, "controlDependencies"), "copy"));
  return v4;
}

- (void)setCondition:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  -[MTLFunctionStitchingFunctionNode setArguments:](self, "setArguments:", [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1]);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [(MTLFunctionStitchingFunctionNode *)self controlDependencies];
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v9) {
          [v9 appendString:v5];
        }
        else {
          id v9 = (id)objc_opt_new();
        }
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  v13 = NSString;
  uint64_t v14 = objc_opt_class();
  v21[0] = v5;
  v21[1] = @"condition =";
  v21[2] = [(MTLFunctionStitchingNode *)[(MTLFunctionStitchingEarlyReturnNode *)self condition] formattedDescription:v4];
  v21[3] = v5;
  id v15 = (id)MEMORY[0x1E4F1CBF0];
  if (v9) {
    id v15 = v9;
  }
  v21[4] = @"controlDependencies =";
  v21[5] = v15;
  return (id)[v13 stringWithFormat:@"<%@: %p>\n%@", v14, self, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v21, 6), "componentsJoinedByString:", @" "];
}

@end