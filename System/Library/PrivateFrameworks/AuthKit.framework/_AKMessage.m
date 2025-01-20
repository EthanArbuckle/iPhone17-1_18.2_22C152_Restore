@interface _AKMessage
+ (id)messageFromTransportRepresentation:(id)a3;
+ (unint64_t)typeForMessageWithTransportRepresentation:(id)a3;
- (NSString)identifier;
- (_AKMessage)init;
- (id)transportRepresentation;
- (unint64_t)type;
@end

@implementation _AKMessage

+ (unint64_t)typeForMessageWithTransportRepresentation:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"aktyp"];
  id v4 = [v3 unsignedIntegerValue];

  return (unint64_t)v4;
}

+ (id)messageFromTransportRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [v3 mutableCopy];

  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (_AKMessage)init
{
  v8.receiver = self;
  v8.super_class = (Class)_AKMessage;
  v2 = [(_AKMessage *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    properties = v2->_properties;
    v2->_properties = v3;

    id v5 = +[NSUUID UUID];
    v6 = [v5 UUIDString];
    [(NSMutableDictionary *)v2->_properties setObject:v6 forKeyedSubscript:@"akid"];
  }
  return v2;
}

- (NSString)identifier
{
  return (NSString *)[(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"akid"];
}

- (unint64_t)type
{
  v2 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:@"aktyp"];
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (id)transportRepresentation
{
  return self->_properties;
}

- (void).cxx_destruct
{
}

@end