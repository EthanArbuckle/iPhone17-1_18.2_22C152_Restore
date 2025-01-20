@interface SKGroup
+ (BOOL)supportsSecureCoding;
+ (id)groupWithActions:(id)a3;
- (BOOL)finished;
- (SKGroup)init;
- (SKGroup)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (id)subactions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKGroup;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKGroup)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKGroup;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKGroup;
  [(SKAction *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_actions forKey:@"_actions"];
}

- (id)subactions
{
  return self->_actions;
}

+ (id)groupWithActions:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    objc_super v5 = objc_alloc_init(SKGroup);
    objc_opt_class();
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            v12 = +[SKSequence sequenceWithActions:v11];
          }
          else
          {
            v12 = (void *)[v11 copy];
          }
          [v6 addObject:v12];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    uint64_t v13 = [v6 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v13;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v15 = v5->_actions;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v24;
      double v18 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          SKCGroup::addCAction((void *)v5->_mycaction, (SKCAction *)objc_msgSend(v20, "caction", (void)v23));
          [v20 duration];
          if (v18 < v21) {
            double v18 = v21;
          }
        }
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 0.0;
    }

    [(SKAction *)v5 setDuration:v18];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SKGroup groupWithActions:self->_actions];
  objc_msgSend(v4, "setTimingMode:", -[SKAction timingMode](self, "timingMode"));
  objc_super v5 = [(SKAction *)self timingFunction];
  [v4 setTimingFunction:v5];

  return v4;
}

- (id)reversedAction
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_actions = &self->_actions;
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_actions, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *p_actions;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "reversedAction", (void)v11);
        [v3 addObject:v8];
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = +[SKGroup groupWithActions:v3];

  return v9;
}

- (BOOL)finished
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_actions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7++), "finished", (void)v10) ^ 1;
      }
      while (v4 != v7);
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
    char v8 = v5 ^ 1;
  }
  else
  {
    char v8 = 1;
  }

  [(SKAction *)self setFinished:v8 & 1];
  return v8 & 1;
}

- (void).cxx_destruct
{
}

@end