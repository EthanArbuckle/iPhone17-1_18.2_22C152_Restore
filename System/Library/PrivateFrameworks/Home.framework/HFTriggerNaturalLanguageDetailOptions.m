@interface HFTriggerNaturalLanguageDetailOptions
+ (id)detailOptionsWithOptions:(id)a3;
- (void)_copyFromOptions:(id)a3;
@end

@implementation HFTriggerNaturalLanguageDetailOptions

+ (id)detailOptionsWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [v3 home];
  v6 = objc_msgSend(v4, "initWithHome:nameType:", v5, objc_msgSend(v3, "nameType"));

  [v6 _copyFromOptions:v3];
  return v6;
}

- (void)_copyFromOptions:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HFTriggerNaturalLanguageDetailOptions;
  [(HFTriggerNaturalLanguageOptions *)&v3 _copyFromOptions:a3];
}

@end