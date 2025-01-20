@interface CSInstantAnswer
+ (id)dataFromInstantAnswers:(id)a3;
+ (id)instantAnswersFromData:(id)a3;
- (CSDonatedEvent)event;
- (CSInstantAnswer)initWithAttributes:(id)a3;
- (CSInstantAnswer)initWithEvent:(id)a3;
- (NSMutableArray)actions;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)addAction:(id)a3;
- (void)setActions:(id)a3;
- (void)setEvent:(id)a3;
@end

@implementation CSInstantAnswer

- (CSInstantAnswer)initWithEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSInstantAnswer;
  v5 = [(CSInstantAnswer *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CSInstantAnswer *)v5 setEvent:v4];
  }

  return v6;
}

- (CSInstantAnswer)initWithAttributes:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSInstantAnswer;
  v5 = [(CSInstantAnswer *)&v21 init];
  if (v5)
  {
    v6 = [CSDonatedEvent alloc];
    v7 = [v4 objectForKeyedSubscript:@"event"];
    objc_super v8 = [(CSDonatedEvent *)v6 initWithAttributes:v7];
    [(CSInstantAnswer *)v5 setEvent:v8];

    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = objc_msgSend(v4, "objectForKeyedSubscript:", @"actions", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[CSInstantAnswerAction alloc] initWithAttributes:*(void *)(*((void *)&v17 + 1) + 8 * v14)];
          [v9 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }

    [(CSInstantAnswer *)v5 setActions:v9];
  }

  return v5;
}

- (id)attributes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(CSInstantAnswer *)self event];
  v5 = [v4 attributes];
  [v3 setObject:v5 forKeyedSubscript:@"event"];

  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = [(CSInstantAnswer *)self actions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) attributes];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [v3 setObject:v6 forKeyedSubscript:@"actions"];

  return v3;
}

- (void)addAction:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v8 = v4;
  if (!actions)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_actions;
    self->_actions = v6;

    id v4 = v8;
    actions = self->_actions;
  }
  [(NSMutableArray *)actions addObject:v4];
}

- (NSMutableArray)actions
{
  actions = self->_actions;
  if (actions) {
    actions = (NSMutableArray *)[(NSMutableArray *)actions copy];
  }

  return actions;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(CSInstantAnswer *)self event];
  v6 = (void *)[v5 copyWithZone:a3];

  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithEvent:v6];
  id v8 = [(CSInstantAnswer *)self actions];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v7 setActions:v9];

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CSInstantAnswer *)self event];
  v6 = [(CSInstantAnswer *)self actions];
  v7 = [v6 componentsJoinedByString:@", "];
  id v8 = [v3 stringWithFormat:@"<%@:%p %@ <%@>", v4, self, v5, v7];

  return v8;
}

+ (id)instantAnswersFromData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v20[0] = 0;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  id v19 = 0;
  v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:v20 error:&v19];
  id v6 = v19;
  if (!v6)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v12 = [CSInstantAnswer alloc];
          uint64_t v13 = -[CSInstantAnswer initWithAttributes:](v12, "initWithAttributes:", v11, (void)v15);
          [v4 addObject:v13];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }
  }

  return v4;
}

+ (id)dataFromInstantAnswers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) attributes];
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([v5 count])
  {
    id v13 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v13];
    id v11 = v13;
    if (v11)
    {

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    id v11 = 0;
  }

  return v10;
}

- (void)setActions:(id)a3
{
}

- (CSDonatedEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

@end