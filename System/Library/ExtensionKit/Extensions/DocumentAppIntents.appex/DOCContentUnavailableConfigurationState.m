@interface DOCContentUnavailableConfigurationState
+ (Class)implClass;
- (DOCContentUnavailableConfigurationState)initWithTraitCollection:(id)a3;
- (NSString)searchControllerText;
- (UITraitCollection)traitCollection;
- (id)asUIKit;
- (id)customStateForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setCustomState:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setSearchControllerText:(id)a3;
@end

@implementation DOCContentUnavailableConfigurationState

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

- (NSString)searchControllerText
{
  v2 = [(DOCContentUnavailableConfigurationState *)self asUIKit];
  v3 = [v2 searchControllerText];

  return (NSString *)v3;
}

- (void)setSearchControllerText:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCContentUnavailableConfigurationState *)self asUIKit];
  [v5 setSearchControllerText:v4];
}

- (DOCContentUnavailableConfigurationState)initWithTraitCollection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)UIContentUnavailableConfigurationState) initWithTraitCollection:v4];

  v6 = [(id)objc_opt_class() instanceWrappingImpl:v5];

  return v6;
}

- (UITraitCollection)traitCollection
{
  v2 = [(DOCContentUnavailableConfigurationState *)self asUIKit];
  v3 = [v2 traitCollection];

  return (UITraitCollection *)v3;
}

- (id)customStateForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCContentUnavailableConfigurationState *)self asUIKit];
  v6 = [v5 customStateForKey:v4];

  return v6;
}

- (void)setCustomState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DOCContentUnavailableConfigurationState *)self asUIKit];
  [v8 setCustomState:v7 forKey:v6];
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCContentUnavailableConfigurationState *)self asUIKit];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DOCContentUnavailableConfigurationState *)self asUIKit];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

@end