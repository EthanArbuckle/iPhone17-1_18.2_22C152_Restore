@interface GEOPOIClaim
- (BOOL)isClaimable;
- (BOOL)isClaimed;
- (GEOPOIClaim)initWithPOIClaim:(id)a3;
- (NSURL)claimURL;
- (id)description;
@end

@implementation GEOPOIClaim

- (GEOPOIClaim)initWithPOIClaim:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOPOIClaim;
    v6 = [(GEOPOIClaim *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_poiClaim, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isClaimed
{
  poiClaim = self->_poiClaim;
  return poiClaim && poiClaim->_isClaimed;
}

- (BOOL)isClaimable
{
  poiClaim = self->_poiClaim;
  if (!poiClaim || !poiClaim->_isClaimable) {
    return 0;
  }
  v3 = -[GEOPDPOIClaim claimUrl]((id *)&poiClaim->super.super.isa);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (NSURL)claimURL
{
  v3 = -[GEOPDPOIClaim claimUrl]((id *)&self->_poiClaim->super.super.isa);
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v6 = -[GEOPDPOIClaim claimUrl]((id *)&self->_poiClaim->super.super.isa);
    v7 = (void *)[v5 initWithString:v6];
  }
  else
  {
    v7 = 0;
  }

  return (NSURL *)v7;
}

- (id)description
{
  return [(GEOPDPOIClaim *)self->_poiClaim description];
}

- (void).cxx_destruct
{
}

@end