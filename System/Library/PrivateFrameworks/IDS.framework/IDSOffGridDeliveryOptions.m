@interface IDSOffGridDeliveryOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)encryptPayload;
- (IDSOffGridDeliveryOptions)init;
- (IDSOffGridDeliveryOptions)initWithCoder:(id)a3;
- (IDSURI)senderURI;
- (NSString)identifier;
- (NSString)originalUUID;
- (id)dictionaryRepresentation;
- (int64_t)command;
- (int64_t)sendMode;
- (int64_t)transportType;
- (void)encodeWithCoder:(id)a3;
- (void)setCommand:(int64_t)a3;
- (void)setDefaultOptionsForTransportType:(int64_t)a3;
- (void)setEncryptPayload:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setOriginalUUID:(id)a3;
- (void)setSendMode:(int64_t)a3;
- (void)setSenderURI:(id)a3;
- (void)setTransportType:(int64_t)a3;
@end

@implementation IDSOffGridDeliveryOptions

- (IDSOffGridDeliveryOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridDeliveryOptions;
  return [(IDSOffGridDeliveryOptions *)&v3 init];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [NSNumber numberWithInteger:self->_command];
  if (v4) {
    CFDictionarySetValue(v3, @"IDSSendMessageOptionCommand", v4);
  }

  v5 = [NSNumber numberWithInteger:self->_transportType];
  if (v5) {
    CFDictionarySetValue(v3, @"IDSSendMessageOptionsOffGridDeliveryTransportType", v5);
  }

  v6 = IDSGetUUIDData();
  if (v6) {
    CFDictionarySetValue(v3, @"IDSSendMessageOptionsOffGridDeliveryOriginalUUID", v6);
  }

  v7 = IDSGetUUIDData();
  if (v7) {
    CFDictionarySetValue(v3, @"IDSSendMessageOptionUUID", v7);
  }

  v8 = [NSNumber numberWithInteger:self->_sendMode];
  if (v8) {
    CFDictionarySetValue(v3, @"IDSSendMessageOptionSendModeKey", v8);
  }

  v9 = [NSNumber numberWithBool:self->_encryptPayload];
  if (v9) {
    CFDictionarySetValue(v3, @"IDSSendMessageOptionEncryptPayload", v9);
  }

  CFDictionarySetValue(v3, @"IDSSendMessageOptionWantsCertifiedDelivery", MEMORY[0x1E4F1CC38]);
  v10 = (void *)[(__CFDictionary *)v3 mutableCopy];

  return v10;
}

- (void)setDefaultOptionsForTransportType:(int64_t)a3
{
  if (a3) {
    self->_sendMode = 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t command = self->_command;
  id v6 = a3;
  v7 = [v4 numberWithInteger:command];
  [v6 encodeObject:v7 forKey:@"command"];

  v8 = [NSNumber numberWithInteger:self->_transportType];
  [v6 encodeObject:v8 forKey:@"transport-type"];

  [v6 encodeObject:self->_originalUUID forKey:@"originalUUID"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  v9 = [NSNumber numberWithInteger:self->_sendMode];
  [v6 encodeObject:v9 forKey:@"send-mode"];

  id v10 = [NSNumber numberWithBool:self->_encryptPayload];
  [v6 encodeObject:v10 forKey:@"encrypt-payload"];
}

- (IDSOffGridDeliveryOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(IDSOffGridDeliveryOptions);
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"command"];
  -[IDSOffGridDeliveryOptions setCommand:](v5, "setCommand:", (int)[v6 intValue]);

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transport-type"];
  -[IDSOffGridDeliveryOptions setTransportType:](v5, "setTransportType:", (int)[v7 intValue]);

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalUUID"];
  [(IDSOffGridDeliveryOptions *)v5 setOriginalUUID:v8];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [(IDSOffGridDeliveryOptions *)v5 setIdentifier:v9];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"send-mode"];
  -[IDSOffGridDeliveryOptions setSendMode:](v5, "setSendMode:", (int)[v10 intValue]);

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encrypt-payload"];

  -[IDSOffGridDeliveryOptions setEncryptPayload:](v5, "setEncryptPayload:", [v11 BOOLValue]);
  return v5;
}

- (IDSURI)senderURI
{
  return self->_senderURI;
}

- (void)setSenderURI:(id)a3
{
}

- (int64_t)command
{
  return self->_command;
}

- (void)setCommand:(int64_t)a3
{
  self->_int64_t command = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSString)originalUUID
{
  return self->_originalUUID;
}

- (void)setOriginalUUID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)sendMode
{
  return self->_sendMode;
}

- (void)setSendMode:(int64_t)a3
{
  self->_sendMode = a3;
}

- (BOOL)encryptPayload
{
  return self->_encryptPayload;
}

- (void)setEncryptPayload:(BOOL)a3
{
  self->_encryptPayload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_originalUUID, 0);

  objc_storeStrong((id *)&self->_senderURI, 0);
}

@end