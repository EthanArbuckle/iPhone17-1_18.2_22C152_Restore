@interface _ATXChronoServicesProviderGuardedData
@end

@implementation _ATXChronoServicesProviderGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureWidgetLastReloadDates, 0);
  objc_storeStrong((id *)&self->_currentWidgetRecords, 0);

  objc_storeStrong((id *)&self->_currentCachedSuggestions, 0);
}

@end