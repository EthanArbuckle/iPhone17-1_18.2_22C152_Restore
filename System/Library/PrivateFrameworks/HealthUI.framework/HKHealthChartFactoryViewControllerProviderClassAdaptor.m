@interface HKHealthChartFactoryViewControllerProviderClassAdaptor
- (HKHealthChartFactoryViewControllerProviderClassAdaptor)initWithProviderClass:(Class)a3;
- (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
@end

@implementation HKHealthChartFactoryViewControllerProviderClassAdaptor

- (HKHealthChartFactoryViewControllerProviderClassAdaptor)initWithProviderClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKHealthChartFactoryViewControllerProviderClassAdaptor;
  result = [(HKHealthChartFactoryViewControllerProviderClassAdaptor *)&v5 init];
  if (result) {
    result->_providerClass = a3;
  }
  return result;
}

- (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  return (id)-[objc_class createInteractiveChartViewControllerForTypeIdentifier:chartFactory:applicationItems:displayDate:preferredOverlay:restorationUserActivity:trendModel:factorDisplayTypes:additionalChartOptions:](self->_providerClass, "createInteractiveChartViewControllerForTypeIdentifier:chartFactory:applicationItems:displayDate:preferredOverlay:restorationUserActivity:trendModel:factorDisplayTypes:additionalChartOptions:", a3, a4, a5, a6, a7, a8);
}

@end