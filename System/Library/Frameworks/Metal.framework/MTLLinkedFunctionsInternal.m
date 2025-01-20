@interface MTLLinkedFunctionsInternal
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (id)binaryFunctions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)functions;
- (id)groups;
- (id)privateFunctions;
- (unint64_t)hash;
- (void)dealloc;
- (void)setBinaryFunctions:(id)a3;
- (void)setFunctions:(id)a3;
- (void)setGroups:(id)a3;
- (void)setPrivateFunctions:(id)a3;
@end

@implementation MTLLinkedFunctionsInternal

- (id)functions
{
  return self->_private.functions;
}

- (id)privateFunctions
{
  return self->_private.privateFunctions;
}

- (id)groups
{
  return self->_private.groups;
}

- (id)binaryFunctions
{
  return self->_private.binaryFunctions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if (v4)
  {
    p_private = &self->_private;
    *(void *)(v4 + 16) = [(NSArray *)p_private->functions copy];
    v5[3] = [(NSArray *)p_private->privateFunctions copy];
    v5[4] = [(NSArray *)p_private->binaryFunctions copy];
    v5[5] = [(NSDictionary *)p_private->groups copy];
  }
  return v5;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[MTLLinkedFunctionsInternal allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLLinkedFunctionsInternal;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (void)dealloc
{
  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLLinkedFunctionsInternal;
  [(MTLLinkedFunctionsInternal *)&v4 dealloc];
}

- (void)setPrivateFunctions:(id)a3
{
  p_private = &self->_private;
  privateFunctions = self->_private.privateFunctions;
  if (privateFunctions != a3)
  {

    p_private->privateFunctions = (NSArray *)[a3 copy];
  }
}

- (void)setFunctions:(id)a3
{
  functions = self->_private.functions;
  if (functions != a3)
  {

    self->_private.functions = (NSArray *)[a3 copy];
  }
}

- (void)setBinaryFunctions:(id)a3
{
  p_private = &self->_private;
  binaryFunctions = self->_private.binaryFunctions;
  if (binaryFunctions != a3)
  {

    p_private->binaryFunctions = (NSArray *)[a3 copy];
  }
}

- (void)setGroups:(id)a3
{
  p_private = &self->_private;
  groups = self->_private.groups;
  if (groups != a3)
  {

    p_private->groups = (NSDictionary *)[a3 copy];
  }
}

- (BOOL)isEmpty
{
  return !self->_private.functions
      && !self->_private.privateFunctions
      && !self->_private.binaryFunctions
      && self->_private.groups == 0;
}

- (unint64_t)hash
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(MTLLinkedFunctionsInternal *)self isEmpty]) {
    return 0;
  }
  p_private = &self->_private;
  bzero(v14, 0x20uLL);
  uint64_t v5 = 1;
  v14[0] = MTLHashArray(p_private->functions, 1, 1);
  v14[1] = MTLHashArray(p_private->privateFunctions, 1, 1);
  v14[2] = MTLHashArray(p_private->binaryFunctions, 1, 1);
  groups = p_private->groups;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [(NSDictionary *)groups countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    uint64_t v5 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(groups);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 hash];
        unint64_t v13 = MTLHashArray([(NSDictionary *)groups objectForKeyedSubscript:v11], 1, 1);
        v5 ^= v12 ^ ((v13 >> (v12 & 0x3F ^ 0x3F)) | (v13 << v12));
      }
      uint64_t v8 = [(NSDictionary *)groups countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  v14[3] = v5;
  return _MTLHashState((int *)v14, 0x20uLL);
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
      p_private = &self->_private;
      uint64_t v8 = (NSArray **)((char *)a3 + 16);
      if (p_private->functions == *v8 || (int v6 = -[NSArray isEqual:](p_private->functions, "isEqual:")) != 0)
      {
        privateFunctions = p_private->privateFunctions;
        if (privateFunctions == v8[1] || (int v6 = -[NSArray isEqual:](privateFunctions, "isEqual:")) != 0)
        {
          binaryFunctions = p_private->binaryFunctions;
          if (binaryFunctions == v8[2] || (int v6 = -[NSArray isEqual:](binaryFunctions, "isEqual:")) != 0)
          {
            groups = p_private->groups;
            if (groups == (NSDictionary *)v8[3] || (int v6 = -[NSDictionary isEqual:](groups, "isEqual:")) != 0) {
              LOBYTE(v6) = 1;
            }
          }
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

- (id)formattedDescription:(unint64_t)a3
{
  v14[12] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v5 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)MTLLinkedFunctionsInternal;
  id v6 = [(MTLLinkedFunctionsInternal *)&v13 description];
  v14[0] = v4;
  v14[1] = @"functions =";
  p_private = &self->_private;
  uint64_t functions = (uint64_t)p_private->functions;
  if (!p_private->functions) {
    uint64_t functions = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = functions;
  v14[3] = v4;
  void v14[4] = @"privateFunctions =";
  uint64_t privateFunctions = (uint64_t)p_private->privateFunctions;
  if (!privateFunctions) {
    uint64_t privateFunctions = [MEMORY[0x1E4F1CA98] null];
  }
  v14[5] = privateFunctions;
  v14[6] = v4;
  v14[7] = @"binaryFunctions =";
  uint64_t binaryFunctions = (uint64_t)p_private->binaryFunctions;
  if (!binaryFunctions) {
    uint64_t binaryFunctions = [MEMORY[0x1E4F1CA98] null];
  }
  v14[8] = binaryFunctions;
  v14[9] = v4;
  v14[10] = @"groups =";
  uint64_t groups = (uint64_t)p_private->groups;
  if (!groups) {
    uint64_t groups = [MEMORY[0x1E4F1CA98] null];
  }
  v14[11] = groups;
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 12), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLLinkedFunctionsInternal *)self formattedDescription:0];
}

@end