@interface _GEOTransitRoutingIncidentMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)transitIncidents;
- (NSString)routingMessage;
- (_GEOTransitRoutingIncidentMessage)initWithCoder:(id)a3;
- (_GEOTransitRoutingIncidentMessage)initWithIncidentMessage:(id)a3 decoderData:(id)a4;
- (_GEOTransitRoutingIncidentMessage)initWithIncidentMessageIndex:(unint64_t)a3 decoderData:(id)a4;
- (id)_fakeTransitLineIncidentInLine:(id)a3;
- (id)initFakeLineIncidentMessageInLine:(id)a3;
- (unint64_t)hash;
- (void)_populateTransitIncidentsWithDecoderData:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GEOTransitRoutingIncidentMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOTransitRoutingIncidentMessage)initWithIncidentMessageIndex:(unint64_t)a3 decoderData:(id)a4
{
  id v6 = a4;
  if ([v6 transitIncidentMessagesCount] <= a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = [v6 transitIncidentMessageAtIndex:a3];
    self = [(_GEOTransitRoutingIncidentMessage *)self initWithIncidentMessage:v7 decoderData:v6];

    v8 = self;
  }

  return v8;
}

- (_GEOTransitRoutingIncidentMessage)initWithIncidentMessage:(id)a3 decoderData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_GEOTransitRoutingIncidentMessage;
  v9 = [(_GEOTransitRoutingIncidentMessage *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_routingIncidentMessage, a3);
    [(_GEOTransitRoutingIncidentMessage *)v10 _populateTransitIncidentsWithDecoderData:v8];
  }

  return v10;
}

- (id)initFakeLineIncidentMessageInLine:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOTransitRoutingIncidentMessage;
  id v5 = [(_GEOTransitRoutingIncidentMessage *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc_init(GEOPBTransitRoutingIncidentMessage);
    id v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    -[GEOPBTransitRoutingIncidentMessage setRoutingMessage:](*((void *)v5 + 1), @"Fake Line Incident");
    id v8 = [v5 _fakeTransitLineIncidentInLine:v4];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v8, 0);
    v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;
  }
  return v5;
}

- (_GEOTransitRoutingIncidentMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GEOTransitRoutingIncidentMessage;
  id v5 = [(_GEOTransitRoutingIncidentMessage *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routingIncidentMessage"];
    routingIncidentMessage = v5->_routingIncidentMessage;
    v5->_routingIncidentMessage = (GEOPBTransitRoutingIncidentMessage *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_transitIncidents"];
    transitIncidents = v5->_transitIncidents;
    v5->_transitIncidents = (NSArray *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  routingIncidentMessage = self->_routingIncidentMessage;
  id v5 = a3;
  [v5 encodeObject:routingIncidentMessage forKey:@"_routingIncidentMessage"];
  [v5 encodeObject:self->_transitIncidents forKey:@"_transitIncidents"];
}

- (void)_populateTransitIncidentsWithDecoderData:(id)a3
{
  id v12 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  for (unint64_t i = 0; ; ++i)
  {
    routingIncidentMessage = self->_routingIncidentMessage;
    if (routingIncidentMessage)
    {
      -[GEOPBTransitRoutingIncidentMessage _readTransitIncidentIndexs]((uint64_t)self->_routingIncidentMessage);
      unint64_t count = routingIncidentMessage->_transitIncidentIndexs.count;
    }
    else
    {
      unint64_t count = 0;
    }
    if (i >= count) {
      break;
    }
    uint64_t v8 = objc_msgSend(v12, "transitIncidentAtIndex:", -[GEOPBTransitRoutingIncidentMessage transitIncidentIndexAtIndex:]((uint64_t)self->_routingIncidentMessage, i));
    uint64_t v9 = [[_GEOTransitIncident alloc] initWithIncident:v8];
    [v4 addObject:v9];
  }
  v10 = (NSArray *)[v4 copy];
  transitIncidents = self->_transitIncidents;
  self->_transitIncidents = v10;
}

- (id)_fakeTransitLineIncidentInLine:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(GEOPBTransitIncident);
  -[GEOPBTransitIncident setTitleString:]((uint64_t)v4, @"Worker Strike (Fake)");
  -[GEOPBTransitIncident setShortDescriptionString:]((uint64_t)v4, @"Possible delays due to strike");
  [(GEOPBTransitIncident *)(uint64_t)v4 setLongDescriptionString:@"Only one train out of three is working due to national strike of public transit workers."];
  if (v4)
  {
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 0x80u;
    v4->_blocking = 0;
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 8u;
    v4->_iconEnum = 0;
    int v5 = time(0);
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 0x20u;
    v4->_startDatetime = v5 - 978307680;
    int v6 = v4->_startDatetime + 1934;
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 2u;
    v4->_creationDatetime = v6;
    int v7 = v4->_startDatetime + 3158;
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 0x40u;
    v4->_updatedDatetime = v7;
    int v8 = v4->_startDatetime + 5163;
    *(_DWORD *)&v4->_flags |= 0x20000u;
    *(_DWORD *)&v4->_flags |= 4u;
    v4->_endDatetime = v8;
  }
  else
  {
    time(0);
  }
  uint64_t v9 = objc_alloc_init(GEOPBTransitIncidentEntity);
  uint64_t v10 = [v3 muid];

  if (v9)
  {
    *(unsigned char *)&v9->_flags |= 1u;
    v9->_affectedMuid = v10;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v9, 0);
  -[GEOPBTransitIncident setAffectedEntitys:]((uint64_t)v4, v11);

  id v12 = [[_GEOTransitIncident alloc] initWithIncident:v4];

  return v12;
}

- (NSString)routingMessage
{
  return -[GEOPBTransitRoutingIncidentMessage routingMessage]((id *)&self->_routingIncidentMessage->super.super.isa);
}

- (NSArray)transitIncidents
{
  return self->_transitIncidents;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  if (![v6 conformsToProtocol:&unk_1ED7E9430])
  {
    char v10 = 0;
    goto LABEL_20;
  }
  id v7 = v6;
  int v8 = [(_GEOTransitRoutingIncidentMessage *)self routingMessage];
  if (v8 || ([v7 routingMessage], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [(_GEOTransitRoutingIncidentMessage *)self routingMessage];
    id v4 = [v7 routingMessage];
    if (![v3 isEqualToString:v4])
    {
      char v10 = 0;
LABEL_16:

      goto LABEL_17;
    }
    int v9 = 1;
  }
  else
  {
    v17 = 0;
    int v9 = 0;
  }
  v11 = [(_GEOTransitRoutingIncidentMessage *)self transitIncidents];
  if (v11 || ([v7 transitIncidents], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v12 = [(_GEOTransitRoutingIncidentMessage *)self transitIncidents];
    v13 = [v7 transitIncidents];
    char v10 = [v12 isEqualToArray:v13];

    if (v11) {
      goto LABEL_15;
    }
  }
  else
  {
    v16 = 0;
    char v10 = 1;
  }

LABEL_15:
  if (v9) {
    goto LABEL_16;
  }
LABEL_17:
  if (!v8) {

  }
LABEL_20:
  return v10;
}

- (unint64_t)hash
{
  id v3 = [(_GEOTransitRoutingIncidentMessage *)self routingMessage];
  uint64_t v4 = [v3 hash];
  int v5 = [(_GEOTransitRoutingIncidentMessage *)self transitIncidents];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIncidents, 0);

  objc_storeStrong((id *)&self->_routingIncidentMessage, 0);
}

@end