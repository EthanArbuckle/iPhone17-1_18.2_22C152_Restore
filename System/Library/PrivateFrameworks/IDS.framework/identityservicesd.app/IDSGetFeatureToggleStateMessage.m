@interface IDSGetFeatureToggleStateMessage
- (NSString)featureID;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (void)setFeatureID:(id)a3;
@end

@implementation IDSGetFeatureToggleStateMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IDSGetFeatureToggleStateMessage;
  id v4 = [(IDSGetFeatureToggleStateMessage *)&v7 copyWithZone:a3];
  v5 = [(IDSGetFeatureToggleStateMessage *)self featureID];
  [v4 setFeatureID:v5];

  return v4;
}

- (id)bagKey
{
  return @"id-get-user-flag";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"user-flag"];

  return v2;
}

- (id)messageBody
{
  v7.receiver = self;
  v7.super_class = (Class)IDSGetFeatureToggleStateMessage;
  v3 = [(IDSGetFeatureToggleStateMessage *)&v7 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSGetFeatureToggleStateMessage *)self featureID];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"user-flag", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E2BC();
  }

  return Mutable;
}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end