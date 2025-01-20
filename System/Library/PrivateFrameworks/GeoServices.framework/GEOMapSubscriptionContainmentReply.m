@interface GEOMapSubscriptionContainmentReply
- (BOOL)isValid;
- (BOOL)sufficientlyContained;
- (GEOMapSubscriptionContainmentReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSufficientlyContained:(BOOL)a3;
@end

@implementation GEOMapSubscriptionContainmentReply

- (GEOMapSubscriptionContainmentReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionContainmentReply;
  v7 = [(GEOXPCReply *)&v10 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    v7->_sufficientlyContained = xpc_dictionary_get_BOOL(v6, "sufficientlyContained");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionContainmentReply;
  id v4 = a3;
  [(GEOXPCReply *)&v5 encodeToXPCDictionary:v4];
  xpc_dictionary_set_BOOL(v4, "sufficientlyContained", self->_sufficientlyContained);
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)sufficientlyContained
{
  return self->_sufficientlyContained;
}

- (void)setSufficientlyContained:(BOOL)a3
{
  self->_sufficientlyContained = a3;
}

@end