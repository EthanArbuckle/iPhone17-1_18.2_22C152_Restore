@interface HMFHTTPRequestInternal
- (HMFActivity)activity;
- (HMFHTTPRequestInternal)init;
- (NSData)body;
- (NSDictionary)headerFields;
- (NSString)method;
- (NSURL)URL;
- (id)responseWithStatusCode:(int64_t)a3;
- (void)setBody:(id)a3;
- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4;
- (void)setMethod:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation HMFHTTPRequestInternal

- (HMFHTTPRequestInternal)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMFHTTPRequestInternal;
  v2 = [(HMFHTTPRequestInternal *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    headerFields = v2->_headerFields;
    v2->_headerFields = (NSMutableDictionary *)v3;

    v5 = [[HMFActivity alloc] initWithName:@"HTTPRequest"];
    activity = v2->_activity;
    v2->_activity = v5;
  }
  return v2;
}

- (void)setHeaderValue:(id)a3 forHeaderKey:(id)a4
{
}

- (NSDictionary)headerFields
{
  v2 = (void *)[(NSMutableDictionary *)self->_headerFields copy];
  return (NSDictionary *)v2;
}

- (id)responseWithStatusCode:(int64_t)a3
{
  v5 = [HMFActivity alloc];
  v6 = [(HMFHTTPRequestInternal *)self activity];
  v7 = [(HMFActivity *)v5 initWithName:@"HTTPResponse" parent:v6];

  objc_super v8 = [HMFHTTPResponseInternal alloc];
  v9 = [(HMFHTTPResponseInternal *)v8 initWithStatusCode:a3 headerFields:MEMORY[0x1E4F1CC08] body:0 activity:v7];

  return v9;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
}

- (NSData)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
}

@end