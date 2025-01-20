@interface IDSSIMDeactivationInfoMessage
- (NSArray)events;
- (NSString)homePlmn;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int64_t)deviceTime;
- (void)setDeviceTime:(int64_t)a3;
- (void)setEvents:(id)a3;
- (void)setHomePlmn:(id)a3;
@end

@implementation IDSSIMDeactivationInfoMessage

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IDSSIMDeactivationInfoMessage;
  id v4 = [(IDSSIMDeactivationInfoMessage *)&v8 copyWithZone:a3];
  objc_msgSend(v4, "setDeviceTime:", -[IDSSIMDeactivationInfoMessage deviceTime](self, "deviceTime"));
  v5 = [(IDSSIMDeactivationInfoMessage *)self homePlmn];
  [v4 setHomePlmn:v5];

  v6 = [(IDSSIMDeactivationInfoMessage *)self events];
  [v4 setEvents:v6];

  return v4;
}

- (id)bagKey
{
  return @"id-sim-deactivation";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:@"device-time"];

  return v2;
}

- (id)messageBody
{
  v28.receiver = self;
  v28.super_class = (Class)IDSSIMDeactivationInfoMessage;
  v3 = [(IDSSIMDeactivationInfoMessage *)&v28 messageBody];
  Mutable = (__CFDictionary *)[v3 mutableCopy];

  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  v5 = +[NSNumber numberWithLong:[(IDSSIMDeactivationInfoMessage *)self deviceTime]];
  if (v5)
  {
    CFDictionarySetValue(Mutable, @"device-time", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100709058();
  }

  v6 = [(IDSSIMDeactivationInfoMessage *)self homePlmn];
  if (v6) {
    CFDictionarySetValue(Mutable, @"home-plmn", v6);
  }
  theDict = Mutable;

  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  objc_super v8 = [(IDSSIMDeactivationInfoMessage *)self events];
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v12);
        v14 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 sourceType]);
        if (v15) {
          CFDictionarySetValue(v14, @"source", v15);
        }

        v16 = [v13 reasonCode];
        if (v16) {
          CFDictionarySetValue(v14, @"code", v16);
        }

        v17 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v13 timeOfEvent]);
        if (v17) {
          CFDictionarySetValue(v14, @"event-time", v17);
        }

        v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 isNetworkInitiated]);
        if (v18)
        {
          CFDictionarySetValue(v14, @"network-initiated", v18);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v30 = @"network-initiated";
          __int16 v31 = 2080;
          v32 = "dict";
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", buf, 0x16u);
        }

        v19 = [v13 networkPlmn];
        if (v19) {
          CFDictionarySetValue(v14, @"network-plmn", v19);
        }

        v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 isRoaming]);
        if (v20) {
          CFDictionarySetValue(v14, @"roaming", v20);
        }

        v21 = [v13 rat];
        if (v21) {
          CFDictionarySetValue(v14, @"rat", v21);
        }

        [v7 addObject:v14];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v10);
  }

  if (v7) {
    CFDictionarySetValue(theDict, @"events", v7);
  }

  return theDict;
}

- (int64_t)deviceTime
{
  return self->_deviceTime;
}

- (void)setDeviceTime:(int64_t)a3
{
  self->_deviceTime = a3;
}

- (NSString)homePlmn
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setHomePlmn:(id)a3
{
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_homePlmn, 0);
}

@end