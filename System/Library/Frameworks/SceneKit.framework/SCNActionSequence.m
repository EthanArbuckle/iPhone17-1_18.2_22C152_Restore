@interface SCNActionSequence
+ (BOOL)supportsSecureCoding;
+ (id)sequenceWithActions:(id)a3;
- (BOOL)isCustom;
- (SCNActionSequence)init;
- (SCNActionSequence)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)reversedAction;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCNActionSequence

- (SCNActionSequence)init
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionSequence;
  if ([(SCNAction *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (SCNActionSequence)initWithCoder:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v4.receiver = self;
  v4.super_class = (Class)SCNActionSequence;
  if (-[SCNAction initWithCoder:](&v4, sel_initWithCoder_)) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNActionSequence;
  [(SCNAction *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SCNActionSequence;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", *((void *)self->_mycaction + 21)), @"_mycaction->_animIndex");
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

+ (id)sequenceWithActions:(id)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  if (a3 && [a3 count])
  {
    objc_opt_class();
    id v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v40 != v6) {
            objc_enumerationMutation(a3);
          }
          long long v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v4, "addObject:", +[SCNActionGroup groupWithActions:](SCNActionGroup, "groupWithActions:", v8));
          }
          else
          {
            long long v9 = (void *)[v8 copy];
            [v4 addObject:v9];
          }
        }
        uint64_t v5 = [a3 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v5);
    }
    long long v10 = objc_alloc_init(SCNActionSequence);
    long long v11 = (NSArray *)[v4 copy];
    v10->_actions = v11;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v36;
      double v14 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          mycaction = v10->_mycaction;
          uint64_t v18 = [v16 caction];
          unint64_t v19 = mycaction[20];
          v20 = (uint64_t *)mycaction[19];
          if ((unint64_t)v20 >= v19)
          {
            uint64_t v22 = mycaction[18];
            uint64_t v23 = ((uint64_t)v20 - v22) >> 3;
            if ((unint64_t)(v23 + 1) >> 61) {
              abort();
            }
            uint64_t v24 = v19 - v22;
            uint64_t v25 = v24 >> 2;
            if (v24 >> 2 <= (unint64_t)(v23 + 1)) {
              uint64_t v25 = v23 + 1;
            }
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v26 = v25;
            }
            if (v26) {
              v27 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(mycaction + 20), v26);
            }
            else {
              v27 = 0;
            }
            v28 = (uint64_t *)&v27[8 * v23];
            uint64_t *v28 = v18;
            v21 = v28 + 1;
            v30 = (char *)mycaction[18];
            v29 = (char *)mycaction[19];
            if (v29 != v30)
            {
              do
              {
                uint64_t v31 = *((void *)v29 - 1);
                v29 -= 8;
                *--v28 = v31;
              }
              while (v29 != v30);
              v29 = (char *)mycaction[18];
            }
            mycaction[18] = v28;
            mycaction[19] = v21;
            mycaction[20] = &v27[8 * v26];
            if (v29) {
              operator delete(v29);
            }
          }
          else
          {
            uint64_t *v20 = v18;
            v21 = v20 + 1;
          }
          mycaction[19] = v21;
          [v16 duration];
          double v14 = v14 + v32;
        }
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v12);
    }
    else
    {
      double v14 = 0.0;
    }
    [(SCNAction *)v10 setDuration:v14];
  }
  else
  {
    v33 = scn_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      +[SCNActionSequence sequenceWithActions:](v33);
    }
    v45[0] = +[SCNAction waitForDuration:0.0];
    return +[SCNActionSequence sequenceWithActions:](SCNActionSequence, "sequenceWithActions:", [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1]);
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SCNActionSequence sequenceWithActions:self->_actions];
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
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](self->_actions, "count"));
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
        objc_msgSend(v3, "insertObject:atIndex:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "reversedAction"), 0);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)actions countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return +[SCNActionSequence sequenceWithActions:v3];
}

+ (void)sequenceWithActions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: [SCNAction sequence:] invoked with nil", v1, 2u);
}

@end