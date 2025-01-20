@interface CNPRPosterLevelSet
- (CNPRPosterLevelSet)initWithWrappedLevelSet:(id)a3;
- (PRPosterLevelSet)wrappedLevelSet;
@end

@implementation CNPRPosterLevelSet

- (void).cxx_destruct
{
}

- (PRPosterLevelSet)wrappedLevelSet
{
  return self->_wrappedLevelSet;
}

- (CNPRPosterLevelSet)initWithWrappedLevelSet:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRPosterLevelSet;
  v6 = [(CNPRPosterLevelSet *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedLevelSet, a3);
  }

  return v7;
}

@end