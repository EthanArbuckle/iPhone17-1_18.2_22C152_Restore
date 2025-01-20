@interface CCSignalDoneFetchingMergeableDeltas
+ (id)doneFetchingMergeableDeltasMessageFromPeerToPeerMessage:(id)a3 isReciprocal:(BOOL)a4 rapportIdentifier:(id)a5;
- (BOOL)isReciprocalRequest;
- (NSString)rapportIdentifier;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (void)setIsReciprocalRequest:(BOOL)a3;
- (void)setRapportIdentifier:(id)a3;
@end

@implementation CCSignalDoneFetchingMergeableDeltas

+ (id)doneFetchingMergeableDeltasMessageFromPeerToPeerMessage:(id)a3 isReciprocal:(BOOL)a4 rapportIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = [CCSignalDoneFetchingMergeableDeltas alloc];
  v10 = [v8 device];
  uint64_t v11 = [v8 protocolVersion];
  [v8 walltime];
  double v13 = v12;
  v14 = [v8 peerPublicKey];

  v15 = [(CCPeerToPeerMessage *)v9 initWithDevice:v10 protocolVersion:v11 wallTime:v14 peerPublicKey:v13];
  [(CCSignalDoneFetchingMergeableDeltas *)v15 setIsReciprocalRequest:v5];
  [(CCSignalDoneFetchingMergeableDeltas *)v15 setRapportIdentifier:v7];

  return v15;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CCSignalDoneFetchingMergeableDeltas;
  BOOL v5 = [(CCPeerToPeerMessage *)&v10 initFromDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isReciprocalRequest"];
    v5[40] = [v6 BOOLValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"senderIdsIdentifier"];
    id v8 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v7;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"isReciprocalRequest";
  v3 = [NSNumber numberWithBool:self->_isReciprocalRequest];
  v11[1] = @"senderIdsIdentifier";
  v12[0] = v3;
  rapportIdentifier = self->_rapportIdentifier;
  BOOL v5 = rapportIdentifier;
  if (!rapportIdentifier)
  {
    BOOL v5 = [MEMORY[0x263EFF9D0] null];
  }
  v12[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if (!rapportIdentifier) {
  v10.receiver = self;
  }
  v10.super_class = (Class)CCSignalDoneFetchingMergeableDeltas;
  id v8 = [(CCPeerToPeerMessage *)&v10 dictionaryRepresentation];
  [v7 addEntriesFromDictionary:v8];

  return v7;
}

- (BOOL)isReciprocalRequest
{
  return self->_isReciprocalRequest;
}

- (void)setIsReciprocalRequest:(BOOL)a3
{
  self->_isReciprocalRequest = a3;
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (void)setRapportIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end