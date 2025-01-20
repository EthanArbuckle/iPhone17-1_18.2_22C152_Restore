@interface HKOnboardingSequence
- (HKOnboardingSequence)initWithPages:(id)a3;
- (NSArray)pages;
@end

@implementation HKOnboardingSequence

- (HKOnboardingSequence)initWithPages:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKOnboardingSequence;
  v6 = [(HKOnboardingSequence *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pages, a3);
    v8 = [(NSArray *)v7->_pages lastObject];
    [v8 setLastPage:1];
  }
  return v7;
}

- (NSArray)pages
{
  return self->_pages;
}

- (void).cxx_destruct
{
}

@end