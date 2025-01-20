@interface MPCPlayerResponseParticipant
- (MPCPlayerResponse)response;
- (MPCPlayerResponseParticipant)initWithIdentifier:(id)a3 identifierType:(int64_t)a4 participantIdentifier:(id)a5 displayName:(id)a6 response:(id)a7;
- (MPModelSharedListeningParticipant)modelObject;
- (NSString)description;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)participantIdentifier;
- (id)_stateDumpObject;
- (int64_t)identifierType;
@end

@implementation MPCPlayerResponseParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
  objc_destroyWeak((id *)&self->_response);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

- (int64_t)identifierType
{
  return self->_identifierType;
}

- (MPModelSharedListeningParticipant)modelObject
{
  return self->_modelObject;
}

- (MPCPlayerResponse)response
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_response);

  return (MPCPlayerResponse *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_stateDumpObject
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF9A0];
  identifier = (__CFString *)self->_identifier;
  v8[0] = @"identifier";
  v8[1] = @"modelObject";
  modelObject = (MPModelSharedListeningParticipant *)@"@";
  if (!identifier) {
    identifier = @"@";
  }
  if (self->_modelObject) {
    modelObject = self->_modelObject;
  }
  v9[0] = identifier;
  v9[1] = modelObject;
  v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  v6 = [v2 dictionaryWithDictionary:v5];

  return v6;
}

- (NSString)description
{
  int64_t identifierType = self->_identifierType;
  v3 = @"unknown";
  if (identifierType == 1) {
    v3 = @"resolvable";
  }
  if (identifierType) {
    v4 = v3;
  }
  else {
    v4 = @"basic";
  }
  return (NSString *)[NSString stringWithFormat:@"<%@: %p %@ id[%@]=%@ displayName=\"%@\">", objc_opt_class(), self, self->_identifier, v4, self->_participantIdentifier, self->_displayName];
}

- (MPCPlayerResponseParticipant)initWithIdentifier:(id)a3 identifierType:(int64_t)a4 participantIdentifier:(id)a5 displayName:(id)a6 response:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)MPCPlayerResponseParticipant;
  v16 = [(MPCPlayerResponseParticipant *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    v16->_int64_t identifierType = a4;
    uint64_t v19 = [v13 copy];
    participantIdentifier = v16->_participantIdentifier;
    v16->_participantIdentifier = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    displayName = v16->_displayName;
    v16->_displayName = (NSString *)v21;

    objc_storeWeak((id *)&v16->_response, v15);
  }

  return v16;
}

@end