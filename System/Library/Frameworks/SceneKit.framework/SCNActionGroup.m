@interface SCNActionGroup
+ (BOOL)supportsSecureCoding;
+ (id)groupWithActions:(id)a3;
- (BOOL)finished;
- (BOOL)isCustom;
- (SCNActionGroup)init;
- (SCNActionGroup)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setupWithActions:(id)a3;
@end

@implementation SCNActionGroup

- (SCNActionGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionGroup;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNActionGroup)initWithCoder:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v4.receiver = self;
  v4.super_class = (Class)SCNActionGroup;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionGroup;
  [(SCNAction *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionGroup;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_actions forKey:@"_actions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCustom
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  actions = self->_actions;
  uint64_t v3 = [(NSArray *)actions countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(actions);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) isCustom])
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)actions countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (void)setupWithActions:(id)a3
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  operator new();
}

+ (id)groupWithActions:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  if (a3 && [a3 count])
  {
    uint64_t v4 = objc_alloc_init(SCNActionGroup);
    objc_opt_class();
    uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v6 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(a3);
          }
          long long v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v5, "addObject:", +[SCNActionSequence sequenceWithActions:](SCNActionSequence, "sequenceWithActions:", v9));
          }
          else
          {
            long long v10 = (void *)[v9 copy];
            [v5 addObject:v10];
          }
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v6);
    }
    long long v11 = (NSArray *)[v5 copy];
    v4->_actions = v11;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
      double v14 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          mycaction = v4->_mycaction;
          uint64_t v18 = [v16 caction];
          v19 = operator new(0x18uLL);
          v19[2] = v18;
          uint64_t v20 = mycaction[18];
          void *v19 = v20;
          v19[1] = mycaction + 18;
          *(void *)(v20 + 8) = v19;
          mycaction[18] = v19;
          ++mycaction[20];
          [v16 duration];
          if (v14 < v21) {
            double v14 = v21;
          }
        }
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v12);
    }
    else
    {
      double v14 = 0.0;
    }
    [(SCNAction *)v4 setDuration:v14];
  }
  else
  {
    v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[SCNActionGroup groupWithActions:](v22);
    }
    v34[0] = +[SCNAction waitForDuration:0.0];
    return +[SCNActionGroup groupWithActions:](SCNActionGroup, "groupWithActions:", [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1]);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[SCNActionGroup groupWithActions:self->_actions];
  [(SCNAction *)v4 setTimingMode:[(SCNAction *)self timingMode]];
  [(SCNAction *)v4 setTimingFunction:[(SCNAction *)self timingFunction]];
  [(SCNAction *)self speed];
  -[SCNAction setSpeed:](v4, "setSpeed:");
  [(SCNAction *)self duration];
  -[SCNAction setDuration:](v4, "setDuration:");
  return v4;
}

- (id)reversedAction
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_actions, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  actions = self->_actions;
  uint64_t v5 = [(NSArray *)actions countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(actions);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "reversedAction"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)actions countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return +[SCNActionGroup groupWithActions:v3];
}

- (BOOL)finished
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  actions = self->_actions;
  uint64_t v4 = [(NSArray *)actions countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(actions);
        }
        v6 |= [*(id *)(*((void *)&v12 + 1) + 8 * i) finished] ^ 1;
      }
      uint64_t v5 = [(NSArray *)actions countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
    char v9 = v6 ^ 1;
  }
  else
  {
    char v9 = 1;
  }
  BOOL v10 = v9 & 1;
  [(SCNAction *)self setFinished:v9 & 1];
  return v10;
}

+ (void)groupWithActions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: [SCNAction group:] invoked with nil", v1, 2u);
}

@end