@interface DMFDevicePropertyNotificationSubscriptionRequest
+ (BOOL)supportsSecureCoding;
- (DMFDevicePropertyNotificationSubscriptionRequest)initWithCoder:(id)a3;
- (NSArray)propertyKeys;
- (void)encodeWithCoder:(id)a3;
- (void)setPropertyKeys:(id)a3;
@end

@implementation DMFDevicePropertyNotificationSubscriptionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFDevicePropertyNotificationSubscriptionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFDevicePropertyNotificationSubscriptionRequest;
  v5 = [(CATTaskRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"propertyKeys"];
    propertyKeys = v5->_propertyKeys;
    v5->_propertyKeys = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFDevicePropertyNotificationSubscriptionRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v6 encodeWithCoder:v4];
  v5 = [(DMFDevicePropertyNotificationSubscriptionRequest *)self propertyKeys];
  [v4 encodeObject:v5 forKey:@"propertyKeys"];
}

- (NSArray)propertyKeys
{
  return self->_propertyKeys;
}

- (void)setPropertyKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end