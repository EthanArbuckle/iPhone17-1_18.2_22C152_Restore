@interface HFActionSetSuggestionFilter
+ (HFActionSetSuggestionFilter)filterWithServices:(id)a3;
- (NSArray)services;
- (void)setServices:(id)a3;
@end

@implementation HFActionSetSuggestionFilter

+ (HFActionSetSuggestionFilter)filterWithServices:(id)a3
{
  id v3 = a3;
  v4 = [[HFActionSetSuggestionFilter alloc] init];
  [(HFActionSetSuggestionFilter *)v4 setServices:v3];

  return v4;
}

- (NSArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end