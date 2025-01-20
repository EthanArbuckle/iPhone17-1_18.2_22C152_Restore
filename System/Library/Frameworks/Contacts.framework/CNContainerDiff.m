@interface CNContainerDiff
+ (id)diffContainer:(id)a3 to:(id)a4;
- (CNContainerDiff)initWithUpdates:(id)a3;
- (NSArray)updates;
- (id)description;
- (void)setUpdates:(id)a3;
@end

@implementation CNContainerDiff

+ (id)diffContainer:(id)a3 to:(id)a4
{
  v4 = +[CNContainerDiffCalculator diffContainer:a3 to:a4];
  v5 = [[CNContainerDiff alloc] initWithUpdates:v4];

  return v5;
}

- (CNContainerDiff)initWithUpdates:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContainerDiff;
  v5 = [(CNContainerDiff *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    updates = v5->_updates;
    v5->_updates = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"updates" object:self->_updates];
  v5 = [v3 build];

  return v5;
}

- (NSArray)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end