@interface IDEDataProvider
+ (id)sharedDataProvider;
- (id)captureAttributes:(id)a3 forPIDs:(id)a4;
- (id)initialQueryTimeForPidDictionary;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
- (id)supportedAttributes;
@end

@implementation IDEDataProvider

+ (id)sharedDataProvider
{
  return 0;
}

- (id)supportedAttributes
{
  return +[NSSet set];
}

- (id)startSamplingForPIDs:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)captureAttributes:(id)a3 forPIDs:(id)a4
{
  return &__NSDictionary0__struct;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)initialQueryTimeForPidDictionary
{
  initialQueryTimeForPidDictionary = self->_initialQueryTimeForPidDictionary;
  if (!initialQueryTimeForPidDictionary)
  {
    v4 = +[NSMutableDictionary dictionary];
    v5 = self->_initialQueryTimeForPidDictionary;
    self->_initialQueryTimeForPidDictionary = v4;

    initialQueryTimeForPidDictionary = self->_initialQueryTimeForPidDictionary;
  }
  return initialQueryTimeForPidDictionary;
}

- (void).cxx_destruct
{
}

@end