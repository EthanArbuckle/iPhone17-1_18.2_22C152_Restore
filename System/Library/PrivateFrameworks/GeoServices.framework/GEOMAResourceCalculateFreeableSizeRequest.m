@interface GEOMAResourceCalculateFreeableSizeRequest
+ (Class)replyClass;
- (BOOL)isValid;
- (GEOMAResourceCalculateFreeableSizeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5;
- (GEOMAResourceCalculateFreeableSizeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (int)urgency;
- (unint64_t)reply;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setUrgency:(int)a3;
@end

@implementation GEOMAResourceCalculateFreeableSizeRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMAResourceCalculateFreeableSizeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return [(GEOXPCRequest *)self initWithMessage:@"MAResources.calculateFreeable" traits:a3 auditToken:a4 throttleToken:a5];
}

- (GEOMAResourceCalculateFreeableSizeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMAResourceCalculateFreeableSizeRequest;
  v7 = [(GEOXPCRequest *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_urgency = xpc_dictionary_get_int64(v6, "urgency");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOMAResourceCalculateFreeableSizeRequest;
  id v4 = a3;
  [(GEOXPCRequest *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_int64(v4, "urgency", self->_urgency);
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (int)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int)a3
{
  self->_urgency = a3;
}

@end