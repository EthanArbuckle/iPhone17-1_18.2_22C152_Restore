@interface GEOEVChargerPlug
+ (id)plugsFromPDPlugs:(id)a3;
- (GEOEVChargerPlug)initWithPDPlug:(id)a3;
- (NSString)connectorTypeDisplayText;
- (NSString)currentTypeDisplayText;
- (int)connectorType;
- (int)realtimeStatus;
- (unint64_t)availableNumberOfChargers;
- (unint64_t)powerWatts;
- (unint64_t)totalNumberOfChargers;
@end

@implementation GEOEVChargerPlug

- (GEOEVChargerPlug)initWithPDPlug:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOEVChargerPlug;
  v6 = [(GEOEVChargerPlug *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pdPlug, a3);
  }

  return v7;
}

- (int)connectorType
{
  unsigned int v2 = -[GEOPDPlug connectorType]((uint64_t)self->_pdPlug) - 1;
  if (v2 > 9) {
    return 0;
  }
  else {
    return dword_18A640D50[v2];
  }
}

- (NSString)connectorTypeDisplayText
{
  return -[GEOPDPlug connectorTypeDisplayText]((id *)&self->_pdPlug->super.super.isa);
}

- (NSString)currentTypeDisplayText
{
  return -[GEOPDPlug currentTypeDisplayText]((id *)&self->_pdPlug->super.super.isa);
}

- (unint64_t)powerWatts
{
  pdPlug = self->_pdPlug;
  if (pdPlug) {
    return pdPlug->_powerWatts;
  }
  else {
    return 0;
  }
}

- (unint64_t)totalNumberOfChargers
{
  -[GEOPDPlug availabilityInfo]((id *)&self->_pdPlug->super.super.isa);
  unsigned int v2 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unint64_t v3 = v2[6];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (unint64_t)availableNumberOfChargers
{
  -[GEOPDPlug availabilityInfo]((id *)&self->_pdPlug->super.super.isa);
  unsigned int v2 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  if (v2) {
    unint64_t v3 = v2[4];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (int)realtimeStatus
{
  uint64_t v2 = -[GEOPDPlug availabilityInfo]((id *)&self->_pdPlug->super.super.isa);
  if (v2 && (*(unsigned char *)(v2 + 28) & 2) != 0)
  {
    int v4 = *(_DWORD *)(v2 + 20);

    if (v4 == 2) {
      return 2;
    }
    else {
      return v4 == 1;
    }
  }
  else
  {

    return 0;
  }
}

+ (id)plugsFromPDPlugs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v11 = [GEOEVChargerPlug alloc];
        v12 = -[GEOEVChargerPlug initWithPDPlug:](v11, "initWithPDPlug:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];

  return v13;
}

- (void).cxx_destruct
{
}

@end