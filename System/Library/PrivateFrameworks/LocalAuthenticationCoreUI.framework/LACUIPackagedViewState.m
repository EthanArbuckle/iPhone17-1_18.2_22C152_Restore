@interface LACUIPackagedViewState
- (BOOL)containsStateNamed:(id)a3;
- (BOOL)finishesWithStateNamed:(id)a3;
- (LACUIPackagedViewState)initWithName:(id)a3;
- (LACUIPackagedViewState)initWithName:(id)a3 animationOptions:(id)a4;
- (LACUIPackagedViewStateAnimationOptions)animationOptions;
- (NSMutableArray)substates;
- (NSString)name;
- (id)description;
- (void)addSubstate:(id)a3;
- (void)setAnimationOptions:(id)a3;
- (void)setName:(id)a3;
- (void)setSubstates:(id)a3;
@end

@implementation LACUIPackagedViewState

- (LACUIPackagedViewState)initWithName:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(LACUIPackagedViewStateAnimationOptions);
  v6 = [(LACUIPackagedViewState *)self initWithName:v4 animationOptions:v5];

  return v6;
}

- (LACUIPackagedViewState)initWithName:(id)a3 animationOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LACUIPackagedViewState;
  v9 = [(LACUIPackagedViewState *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    substates = v10->_substates;
    v10->_substates = v11;

    objc_storeStrong((id *)&v10->_animationOptions, a4);
  }

  return v10;
}

- (void)addSubstate:(id)a3
{
  id v4 = a3;
  id v5 = [(LACUIPackagedViewState *)self substates];
  [v5 addObject:v4];
}

- (BOOL)finishesWithStateNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(LACUIPackagedViewState *)self substates];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(LACUIPackagedViewState *)self substates];
    id v8 = [v7 lastObject];
    char v9 = [v8 finishesWithStateNamed:v4];

    id v4 = v8;
  }
  else
  {
    id v7 = [(LACUIPackagedViewState *)self name];
    char v9 = [v4 isEqualToString:v7];
  }

  return v9;
}

- (BOOL)containsStateNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(LACUIPackagedViewState *)self name];
  char v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(LACUIPackagedViewState *)self substates];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__LACUIPackagedViewState_containsStateNamed___block_invoke;
    v10[3] = &unk_2653BCD40;
    id v11 = v4;
    BOOL v7 = [v8 indexOfObjectPassingTest:v10] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

uint64_t __45__LACUIPackagedViewState_containsStateNamed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsStateNamed:*(void *)(a1 + 32)];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(LACUIPackagedViewState *)self name];
  char v6 = [(LACUIPackagedViewState *)self substates];
  BOOL v7 = [(LACUIPackagedViewState *)self animationOptions];
  objc_msgSend(v3, "stringWithFormat:", @"<%@; %p; name:%@; substates:%@; animationOptons:%@>",
    v4,
    self,
    v5,
    v6,
  id v8 = v7);

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (LACUIPackagedViewStateAnimationOptions)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(id)a3
{
}

- (NSMutableArray)substates
{
  return self->_substates;
}

- (void)setSubstates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substates, 0);
  objc_storeStrong((id *)&self->_animationOptions, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end