@interface IMSharedPersona
+ (BOOL)supportsSecureCoding;
+ (id)personaFromDictionaryRepresentation:(id)a3;
- (IMSharedPersona)initWithCoder:(id)a3;
- (IMSharedPersona)initWithSenderID:(id)a3 suggestedDisplayName:(id)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSString)senderID;
- (NSString)suggestedDisplayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMSharedPersona

+ (id)personaFromDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = [v3 _stringForKey:@"h"];
    v5 = [v3 _stringForKey:@"n"];
    if (v4)
    {
      v6 = [[IMSharedPersona alloc] initWithSenderID:v4 suggestedDisplayName:v5];

      v5 = (void *)v4;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (IMSharedPersona)initWithSenderID:(id)a3 suggestedDisplayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IMSharedPersona;
  v9 = [(IMSharedPersona *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_senderID, a3);
    if ([v8 length]) {
      objc_storeStrong((id *)&v10->_suggestedDisplayName, a4);
    }
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setValue:self->_senderID forKey:@"h"];
  if ([(NSString *)self->_suggestedDisplayName length]) {
    [v3 setValue:self->_suggestedDisplayName forKey:@"n"];
  }

  return (NSDictionary *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [IMSharedPersona alloc];
  senderID = self->_senderID;
  suggestedDisplayName = self->_suggestedDisplayName;

  return [(IMSharedPersona *)v4 initWithSenderID:senderID suggestedDisplayName:suggestedDisplayName];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMSharedPersona)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedName"];

  if (v5)
  {
    self = [(IMSharedPersona *)self initWithSenderID:v5 suggestedDisplayName:v6];
    id v7 = self;
  }
  else
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_senderID forKey:@"senderID"];
  if ([(NSString *)self->_suggestedDisplayName length]) {
    [v4 encodeObject:self->_suggestedDisplayName forKey:@"suggestedName"];
  }
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_senderID withName:@"senderID"];
  [v3 appendString:self->_suggestedDisplayName withName:@"suggestedDisplayName" skipIfEmpty:1];
  id v4 = [v3 build];

  return v4;
}

- (NSString)senderID
{
  return self->_senderID;
}

- (NSString)suggestedDisplayName
{
  return self->_suggestedDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedDisplayName, 0);

  objc_storeStrong((id *)&self->_senderID, 0);
}

@end