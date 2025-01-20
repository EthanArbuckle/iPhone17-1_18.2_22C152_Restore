@interface ATXModeDimensionSet
- (ATXModeDimensionSet)initWithMode:(id)a3;
- (NSString)mode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreAnalyticsDictionary;
- (id)powerset;
@end

@implementation ATXModeDimensionSet

- (ATXModeDimensionSet)initWithMode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXModeDimensionSet;
  v6 = [(ATXModeDimensionSet *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mode, a3);
  }

  return v7;
}

- (id)powerset
{
  v3 = objc_opt_new();
  [v3 addObject:self];
  v4 = [[ATXModeDimensionSet alloc] initWithMode:self->_mode];
  [v3 addObject:v4];

  id v5 = [v3 allObjects];

  return v5;
}

- (id)coreAnalyticsDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"mode";
  mode = self->_mode;
  v3 = mode;
  if (!mode)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!mode) {

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ATXModeDimensionSet allocWithZone:a3];
  mode = self->_mode;
  return [(ATXModeDimensionSet *)v4 initWithMode:mode];
}

- (NSString)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
}

@end