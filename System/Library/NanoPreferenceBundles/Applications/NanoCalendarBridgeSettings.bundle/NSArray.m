@interface NSArray
- (id)nanoPrivacyAwareDescriptionForCalendars;
- (id)nanoPrivacyAwareDescriptionForEvents;
@end

@implementation NSArray

- (id)nanoPrivacyAwareDescriptionForEvents
{
  uint64_t v3 = objc_opt_class();

  return +[NCSLogging nanoPrivacyAwareDescriptionForCollection:self expectedClass:v3];
}

- (id)nanoPrivacyAwareDescriptionForCalendars
{
  uint64_t v3 = objc_opt_class();

  return +[NCSLogging nanoPrivacyAwareDescriptionForCollection:self expectedClass:v3];
}

@end