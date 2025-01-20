@interface IDSProfileGetHandlesMessage
- (BOOL)wantsExtraTimeoutRetry;
- (IDSProfileGetHandlesMessage)init;
- (NSArray)responseHandles;
- (NSDictionary)selfHandle;
- (double)anisetteHeadersTimeout;
- (id)additionalMessageHeaders;
- (id)bagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)messageBody;
- (id)requiredKeys;
- (int)maxTimeoutRetries;
- (void)handleResponseDictionary:(id)a3;
- (void)setResponseHandles:(id)a3;
- (void)setSelfHandle:(id)a3;
@end

@implementation IDSProfileGetHandlesMessage

- (IDSProfileGetHandlesMessage)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSProfileGetHandlesMessage;
  v2 = [(IDSProfileGetHandlesMessage *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IDSProfileGetHandlesMessage *)v2 setTimeout:240.0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IDSProfileGetHandlesMessage;
  id v4 = [(IDSProfileGetHandlesMessage *)&v7 copyWithZone:a3];
  objc_super v5 = [(IDSProfileGetHandlesMessage *)self responseHandles];
  [v4 setResponseHandles:v5];

  return v4;
}

- (id)additionalMessageHeaders
{
  v7.receiver = self;
  v7.super_class = (Class)IDSProfileGetHandlesMessage;
  v3 = [(IDSProfileGetHandlesMessage *)&v7 additionalMessageHeaders];
  id v4 = (__CFDictionary *)[v3 mutableCopy];

  if (!v4) {
    id v4 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  objc_super v5 = [(IDSProfileGetHandlesMessage *)self dsAuthID];
  if (v5)
  {
    CFDictionarySetValue(v4, @"x-ds-client-id", v5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10072320C();
  }

  return v4;
}

- (BOOL)wantsExtraTimeoutRetry
{
  return 1;
}

- (int)maxTimeoutRetries
{
  return 2;
}

- (id)bagKey
{
  return @"id-get-handles";
}

- (id)requiredKeys
{
  id v2 = objc_alloc_init((Class)NSMutableArray);

  return v2;
}

- (id)messageBody
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);

  return v2;
}

- (double)anisetteHeadersTimeout
{
  return 5.0;
}

- (void)handleResponseDictionary:(id)a3
{
  id v4 = a3;
  if (_IMWillLog())
  {
    id v7 = v4;
    _IMAlwaysLog();
  }
  v8.receiver = self;
  v8.super_class = (Class)IDSProfileGetHandlesMessage;
  -[IDSProfileGetHandlesMessage handleResponseDictionary:](&v8, "handleResponseDictionary:", v4, v7);
  objc_super v5 = [v4 objectForKey:@"handles"];
  [(IDSProfileGetHandlesMessage *)self setResponseHandles:v5];

  v6 = [v4 objectForKey:@"self-handle"];
  [(IDSProfileGetHandlesMessage *)self setSelfHandle:v6];
}

- (NSArray)responseHandles
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setResponseHandles:(id)a3
{
}

- (NSDictionary)selfHandle
{
  return (NSDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSelfHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfHandle, 0);

  objc_storeStrong((id *)&self->_responseHandles, 0);
}

@end