@interface IDSFeatureToggleMessage
- (NSString)featureID;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (unint64_t)state;
- (void)setFeatureID:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation IDSFeatureToggleMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IDSFeatureToggleMessage;
  id v4 = [(IDSFeatureToggleMessage *)&v7 copyWithZone:a3];
  v5 = [(IDSFeatureToggleMessage *)self featureID];
  [v4 setFeatureID:v5];

  objc_msgSend(v4, "setState:", -[IDSFeatureToggleMessage state](self, "state"));
  return v4;
}

- (id)bagKey
{
  return @"id-set-user-flag";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"user-flag"];
  [v2 addObject:@"user-flag-status"];

  return v2;
}

- (id)messageBody
{
  v9.receiver = self;
  v9.super_class = (Class)IDSFeatureToggleMessage;
  v3 = [(IDSFeatureToggleMessage *)&v9 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = [(IDSFeatureToggleMessage *)self featureID];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"user-flag", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10071E2BC();
  }

  unint64_t v6 = [(IDSFeatureToggleMessage *)self state];
  if (v6 == 1)
  {
    CFStringRef v7 = @"enabled";
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_12;
    }
    CFStringRef v7 = @"disabled";
  }
  CFDictionarySetValue(Mutable, @"user-flag-status", v7);
LABEL_12:

  return Mutable;
}

- (NSString)featureID
{
  return self->_featureID;
}

- (void)setFeatureID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end