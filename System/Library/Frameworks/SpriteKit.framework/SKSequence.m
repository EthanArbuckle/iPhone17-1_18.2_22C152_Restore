@interface SKSequence
+ (BOOL)supportsSecureCoding;
+ (id)sequenceWithActions:(id)a3;
- (SKSequence)init;
- (SKSequence)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (id)subactions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKSequence

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSequence)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKSequence;
  if ([(SKAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SKSequence)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKSequence;
  if ([(SKAction *)&v6 initWithCoder:v4]) {
    operator new();
  }

  return 0;
}

- (id)subactions
{
  return self->_actions;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKSequence;
  [(SKAction *)&v6 encodeWithCoder:v4];
  v5 = [NSNumber numberWithUnsignedLong:*((void *)self->_mycaction + 17)];
  [v4 encodeObject:v5 forKey:@"_mycaction->_animIndex"];

  [v4 encodeObject:self->_actions forKey:@"_actions"];
}

+ (id)sequenceWithActions:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    objc_opt_class();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            v11 = +[SKGroup groupWithActions:v10];
          }
          else
          {
            v11 = (void *)[v10 copy];
          }
          [v5 addObject:v11];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    v12 = objc_alloc_init(SKSequence);
    uint64_t v13 = [v5 copy];
    actions = v12->_actions;
    v12->_actions = (NSArray *)v13;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v15 = v12->_actions;
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
          SKCSequence::addCAction((SKCSequence *)v12->_mycaction, (SKCAction *)objc_msgSend(v20, "caction", (void)v23));
          [v20 duration];
          double v18 = v18 + v21;
        }
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }
    else
    {
      double v18 = 0.0;
    }

    [(SKAction *)v12 setDuration:v18];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SKSequence sequenceWithActions:self->_actions];
  [(SKAction *)self speed];
  objc_msgSend(v4, "setSpeed:");
  objc_msgSend(v4, "setTimingMode:", -[SKAction timingMode](self, "timingMode"));
  v5 = [(SKAction *)self timingFunction];
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
        [v3 insertObject:v8 atIndex:0];
      }
      uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v9 = +[SKSequence sequenceWithActions:v3];

  return v9;
}

- (void).cxx_destruct
{
}

@end