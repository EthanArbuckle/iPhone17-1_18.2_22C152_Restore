@interface AKAvailabilityInvitation
- (AKAvailabilityInvitation)initWithAvailableDuringActivityIdentifiers:(id)a3;
- (AKAvailabilityInvitation)initWithAvailableDuringActivityIdentifiers:(id)a3 unavailableDuringActivityIdentifiers:(id)a4;
- (AKAvailabilityInvitation)initWithStatusKitInvitationPayload:(id)a3;
- (NSArray)availableDuringActivityIdentifiers;
- (NSArray)unavailableDuringActivityIdentifiers;
- (id)_payloadDictionary;
- (id)statusKitInvitationPayloadWithDateCreated:(id)a3;
@end

@implementation AKAvailabilityInvitation

- (AKAvailabilityInvitation)initWithAvailableDuringActivityIdentifiers:(id)a3 unavailableDuringActivityIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKAvailabilityInvitation;
  v8 = [(AKAvailabilityInvitation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    availableDuringActivityIdentifiers = v8->_availableDuringActivityIdentifiers;
    v8->_availableDuringActivityIdentifiers = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    unavailableDuringActivityIdentifiers = v8->_unavailableDuringActivityIdentifiers;
    v8->_unavailableDuringActivityIdentifiers = (NSArray *)v11;
  }
  return v8;
}

- (NSArray)availableDuringActivityIdentifiers
{
  return self->_availableDuringActivityIdentifiers;
}

- (NSArray)unavailableDuringActivityIdentifiers
{
  return self->_unavailableDuringActivityIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailableDuringActivityIdentifiers, 0);

  objc_storeStrong((id *)&self->_availableDuringActivityIdentifiers, 0);
}

- (AKAvailabilityInvitation)initWithAvailableDuringActivityIdentifiers:(id)a3
{
  return [(AKAvailabilityInvitation *)self initWithAvailableDuringActivityIdentifiers:a3 unavailableDuringActivityIdentifiers:MEMORY[0x263EFFA68]];
}

- (AKAvailabilityInvitation)initWithStatusKitInvitationPayload:(id)a3
{
  v4 = [a3 payloadDictionary];
  v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend(v4, "availabilityKit_stringArrayForKey:allowEmptyString:", @"a", 0);
    id v7 = objc_msgSend(v5, "availabilityKit_stringArrayForKey:allowEmptyString:", @"u", 0);
    self = [(AKAvailabilityInvitation *)self initWithAvailableDuringActivityIdentifiers:v6 unavailableDuringActivityIdentifiers:v7];

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)statusKitInvitationPayloadWithDateCreated:(id)a3
{
  id v4 = a3;
  v5 = [(AKAvailabilityInvitation *)self _payloadDictionary];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F797D0]) initWithDictionary:v5 dateCreated:v4];

  return v6;
}

- (id)_payloadDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(AKAvailabilityInvitation *)self availableDuringActivityIdentifiers];
  v5 = (void *)[v4 copy];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"a"];
  }
  id v6 = [(AKAvailabilityInvitation *)self unavailableDuringActivityIdentifiers];
  id v7 = (void *)[v6 copy];

  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:@"u"];
  }
  v8 = (void *)[v3 copy];

  return v8;
}

@end