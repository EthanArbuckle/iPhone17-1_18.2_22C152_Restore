@interface CPAnalyticsMetricEventRoute
- (BOOL)includeEventProperties;
- (CPAnalyticsMetricEventRoute)initWithConfig:(id)a3;
- (NSArray)propertiesToInclude;
- (NSString)destination;
- (NSString)destinationEventKey;
@end

@implementation CPAnalyticsMetricEventRoute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesToInclude, 0);
  objc_storeStrong((id *)&self->_destinationEventKey, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (BOOL)includeEventProperties
{
  return self->_includeEventProperties;
}

- (NSArray)propertiesToInclude
{
  return self->_propertiesToInclude;
}

- (NSString)destinationEventKey
{
  return self->_destinationEventKey;
}

- (NSString)destination
{
  return self->_destination;
}

- (CPAnalyticsMetricEventRoute)initWithConfig:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPAnalyticsMetricEventRoute;
  v5 = [(CPAnalyticsMetricEventRoute *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 valueForKey:@"destination"];
    destination = v5->_destination;
    v5->_destination = (NSString *)v6;

    v8 = [v4 valueForKey:@"destinationEventKey"];
    if ([v8 length]) {
      objc_storeStrong((id *)&v5->_destinationEventKey, v8);
    }
    uint64_t v9 = [v4 objectForKey:@"includeProperties"];
    propertiesToInclude = v5->_propertiesToInclude;
    v5->_propertiesToInclude = (NSArray *)v9;

    if (!v5->_propertiesToInclude) {
      v5->_propertiesToInclude = (NSArray *)MEMORY[0x263EFFA68];
    }
    v11 = [v4 objectForKey:@"includeEventProperties"];
    v5->_includeEventProperties = [v11 BOOLValue];
  }
  return v5;
}

@end