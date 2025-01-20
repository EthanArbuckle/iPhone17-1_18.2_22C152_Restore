@interface MTLFunctionStitchingFunctionNode
- (BOOL)isEqual:(id)a3;
- (MTLFunctionStitchingFunctionNode)init;
- (MTLFunctionStitchingFunctionNode)initWithName:(NSString *)name arguments:(NSArray *)arguments controlDependencies:(NSArray *)controlDependencies;
- (NSArray)arguments;
- (NSArray)controlDependencies;
- (NSString)description;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setArguments:(NSArray *)arguments;
- (void)setControlDependencies:(NSArray *)controlDependencies;
- (void)setName:(NSString *)name;
@end

@implementation MTLFunctionStitchingFunctionNode

- (MTLFunctionStitchingFunctionNode)initWithName:(NSString *)name arguments:(NSArray *)arguments controlDependencies:(NSArray *)controlDependencies
{
  v10.receiver = self;
  v10.super_class = (Class)MTLFunctionStitchingFunctionNode;
  v8 = [(MTLFunctionStitchingFunctionNode *)&v10 init];
  v8->_name = (NSString *)[(NSString *)name copy];
  v8->_arguments = (NSArray *)[(NSArray *)arguments copy];
  v8->_controlDependencies = (NSArray *)[(NSArray *)controlDependencies copy];
  return v8;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (NSArray)controlDependencies
{
  return self->_controlDependencies;
}

- (NSString)name
{
  return self->_name;
}

- (MTLFunctionStitchingFunctionNode)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLFunctionStitchingFunctionNode;
  v2 = [(MTLFunctionStitchingFunctionNode *)&v4 init];
  [(MTLFunctionStitchingFunctionNode *)v2 setControlDependencies:MEMORY[0x1E4F1CBF0]];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setName:self->_name];
  [v4 setArguments:self->_arguments];
  [v4 setControlDependencies:self->_controlDependencies];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      int v6 = -[NSString isEqualToString:](-[MTLFunctionStitchingFunctionNode name](self, "name"), "isEqualToString:", [a3 name]);
      if (v6)
      {
        int v6 = MTLCompareArray(-[MTLFunctionStitchingFunctionNode arguments](self, "arguments"), (void *)[a3 arguments], 1, 1);
        if (v6)
        {
          v7 = [(MTLFunctionStitchingFunctionNode *)self controlDependencies];
          v8 = (void *)[a3 controlDependencies];
          LOBYTE(v6) = MTLCompareArray(v7, v8, 1, 0);
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  bzero(v4, 0x18uLL);
  v4[0] = [(NSString *)[(MTLFunctionStitchingFunctionNode *)self name] hash];
  v4[1] = MTLHashArray([(MTLFunctionStitchingFunctionNode *)self arguments], 1, 1);
  v4[2] = MTLHashArray([(MTLFunctionStitchingFunctionNode *)self controlDependencies], 1, 0);
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionStitchingFunctionNode;
  [(MTLFunctionStitchingFunctionNode *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  arguments = self->_arguments;
  uint64_t v7 = [(NSArray *)arguments countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(arguments);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (v9) {
          [v9 appendString:v5];
        }
        else {
          id v9 = (id)objc_opt_new();
        }
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      uint64_t v8 = [(NSArray *)arguments countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v25 = self;
  controlDependencies = self->_controlDependencies;
  uint64_t v14 = [(NSArray *)controlDependencies countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id v16 = 0;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(controlDependencies);
        }
        v19 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        if (v16) {
          [v16 appendString:v5];
        }
        else {
          id v16 = (id)objc_opt_new();
        }
        objc_msgSend(v16, "appendString:", objc_msgSend(v19, "formattedDescription:", v4));
      }
      uint64_t v15 = [(NSArray *)controlDependencies countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v15);
  }
  else
  {
    id v16 = 0;
  }
  v20 = NSString;
  v26.receiver = v25;
  v26.super_class = (Class)MTLFunctionStitchingFunctionNode;
  v21 = [(MTLFunctionStitchingFunctionNode *)&v26 description];
  v35[0] = v5;
  v35[1] = @"name =";
  v35[2] = v25->_name;
  v35[3] = v5;
  if (v9) {
    id v22 = v9;
  }
  else {
    id v22 = (id)MEMORY[0x1E4F1CBF0];
  }
  v35[4] = @"arguments =";
  v35[5] = v22;
  v35[6] = v5;
  v35[7] = @"controlDependencies =";
  if (v16) {
    id v23 = v16;
  }
  else {
    id v23 = (id)MEMORY[0x1E4F1CBF0];
  }
  v35[8] = v23;
  return (id)[v20 stringWithFormat:@"%@%@", v21, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v35, 9), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(MTLFunctionStitchingFunctionNode *)self formattedDescription:0];
}

- (void)setName:(NSString *)name
{
}

- (void)setArguments:(NSArray *)arguments
{
}

- (void)setControlDependencies:(NSArray *)controlDependencies
{
}

@end