@interface HKInteractiveChartOverlayPredicate
- (HKInteractiveChartOverlayPredicate)initWithPredicate:(id)a3 name:(id)a4;
- (NSPredicate)predicate;
- (NSString)localizedNameKey;
@end

@implementation HKInteractiveChartOverlayPredicate

- (HKInteractiveChartOverlayPredicate)initWithPredicate:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKInteractiveChartOverlayPredicate;
  v9 = [(HKInteractiveChartOverlayPredicate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    objc_storeStrong((id *)&v10->_localizedNameKey, a4);
  }

  return v10;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSString)localizedNameKey
{
  return self->_localizedNameKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedNameKey, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end