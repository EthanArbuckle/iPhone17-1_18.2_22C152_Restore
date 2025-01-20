@interface GEOEVChargerAvailability
- (GEOEVChargerAvailability)initWithPlaceData:(id)a3;
- (int)_availabilityStatus;
- (int)_realTimePlugAvailabilityStatus;
- (int)_realTimePlugStatus:(int)a3;
- (int64_t)aggregatedAvailableCount:(id)a3;
- (int64_t)aggregatedTotalCount:(id)a3;
- (unint64_t)availableEVChargers;
- (unint64_t)totalEVChargers;
- (unint64_t)ttlSeconds;
- (void)_filterAggregatedChargers:(id)a3;
- (void)setAvailableEVChargers:(unint64_t)a3;
- (void)setTotalEVChargers:(unint64_t)a3;
- (void)setTtlSeconds:(unint64_t)a3;
@end

@implementation GEOEVChargerAvailability

- (GEOEVChargerAvailability)initWithPlaceData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOEVChargerAvailability;
  v5 = [(GEOEVChargerAvailability *)&v15 init];
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v6 = +[GEOPDEVCharger evChargerFromPlaceData:v4];
  charger = v5->_charger;
  v5->_charger = (GEOPDEVCharger *)v6;

  -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&v5->_charger->super.super.isa);
  v8 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = v8 ? v8[6] : 0;
  v5->_totalEVChargers = v9;

  -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&v5->_charger->super.super.isa);
  v10 = (unsigned int *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = v10 ? v10[4] : 0;
  v5->_availableEVChargers = v11;

  v12 = v5->_charger;
  if (v12) {
    v12 = (GEOPDEVCharger *)v12->_ttlSeconds;
  }
  v5->_ttlSeconds = (unint64_t)v12;
  v5->_aggregatedAvailable = -1;
  v5->_aggregatedTotal = -1;
  if (v5->_totalEVChargers || v5->_availableEVChargers) {
LABEL_10:
  }
    v13 = v5;
  else {
    v13 = 0;
  }

  return v13;
}

- (int64_t)aggregatedAvailableCount:(id)a3
{
  id v4 = a3;
  int64_t aggregatedAvailable = self->_aggregatedAvailable;
  if (aggregatedAvailable == -1)
  {
    uint64_t v6 = -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    if (v6 && (*(unsigned char *)(v6 + 28) & 2) != 0)
    {
      int v7 = *(_DWORD *)(v6 + 20);

      if (v7)
      {
        [(GEOEVChargerAvailability *)self _filterAggregatedChargers:v4];
LABEL_10:
        int64_t aggregatedAvailable = self->_aggregatedAvailable;
        goto LABEL_11;
      }
    }
    else
    {
    }
    -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    v8 = (unsigned int *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      int64_t v9 = v8[4];
    }
    else {
      int64_t v9 = 0;
    }
    self->_int64_t aggregatedAvailable = v9;

    goto LABEL_10;
  }
LABEL_11:

  return aggregatedAvailable;
}

- (int64_t)aggregatedTotalCount:(id)a3
{
  id v4 = a3;
  if (self->_aggregatedTotal == -1 || ![(NSArray *)self->_supportedTypes isEqualToArray:v4])
  {
    uint64_t v5 = -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    if (v5 && (*(unsigned char *)(v5 + 28) & 2) != 0)
    {
      int v6 = *(_DWORD *)(v5 + 20);

      if (v6)
      {
        [(GEOEVChargerAvailability *)self _filterAggregatedChargers:v4];
        goto LABEL_11;
      }
    }
    else
    {
    }
    -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    int v7 = (unsigned int *)objc_claimAutoreleasedReturnValue();
    if (v7) {
      int64_t v8 = v7[6];
    }
    else {
      int64_t v8 = 0;
    }
    self->_int64_t aggregatedTotal = v8;
  }
LABEL_11:
  int64_t aggregatedTotal = self->_aggregatedTotal;

  return aggregatedTotal;
}

- (int)_availabilityStatus
{
  uint64_t v3 = -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
  if (v3 && (*(unsigned char *)(v3 + 28) & 2) != 0) {
    uint64_t v4 = *(unsigned int *)(v3 + 20);
  }
  else {
    uint64_t v4 = 0;
  }

  return [(GEOEVChargerAvailability *)self _realTimePlugStatus:v4];
}

- (int)_realTimePlugAvailabilityStatus
{
  if (self->_aggregatedTotal != -1 && self->_aggregatedAvailable != -1)
  {
    uint64_t v3 = -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
    if (v3 && (*(unsigned char *)(v3 + 28) & 2) != 0)
    {
      int v4 = *(_DWORD *)(v3 + 20);

      if (v4)
      {
        if (self->_aggregatedAvailable) {
          return 1;
        }
        else {
          return 2;
        }
      }
    }
    else
    {
    }
  }
  uint64_t v6 = -[GEOPDEVCharger aggregatedAvailabilityInfo]((id *)&self->_charger->super.super.isa);
  if (v6 && (*(unsigned char *)(v6 + 28) & 2) != 0) {
    uint64_t v7 = *(unsigned int *)(v6 + 20);
  }
  else {
    uint64_t v7 = 0;
  }

  return [(GEOEVChargerAvailability *)self _realTimePlugStatus:v7];
}

- (void)_filterAggregatedChargers:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v30 = self;
  objc_storeStrong((id *)&self->_supportedTypes, a3);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = v5;
  uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        int v8 = [*(id *)(*((void *)&v39 + 1) + 8 * i) integerValue];
        if (v8)
        {
          uint64_t v33 = i;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          int64_t v9 = -[GEOPDEVCharger plugs]((id *)&v30->_charger->super.super.isa);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v36 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(id **)(*((void *)&v35 + 1) + 8 * j);
                if (-[GEOPDPlug connectorType]((uint64_t)v14) == v8)
                {
                  uint64_t v15 = -[GEOPDPlug chargerInfo](v14);
                  if (v15)
                  {
                    v16 = (void *)v15;
                    -[GEOPDPlug chargerInfo](v14);
                    v17 = (id *)objc_claimAutoreleasedReturnValue();
                    v18 = -[GEOPDChargerInfo totalChargerIds](v17);

                    if (v18)
                    {
                      -[GEOPDPlug chargerInfo](v14);
                      v19 = (id *)objc_claimAutoreleasedReturnValue();
                      v20 = -[GEOPDChargerInfo totalChargerIds](v19);
                      [v6 addObjectsFromArray:v20];
                    }
                  }
                  uint64_t v21 = -[GEOPDPlug chargerInfo](v14);
                  if (v21)
                  {
                    v22 = (void *)v21;
                    -[GEOPDPlug chargerInfo](v14);
                    v23 = (id *)objc_claimAutoreleasedReturnValue();
                    v24 = -[GEOPDChargerInfo availableChargerIds](v23);

                    if (v24)
                    {
                      -[GEOPDPlug chargerInfo](v14);
                      v25 = (id *)objc_claimAutoreleasedReturnValue();
                      v26 = -[GEOPDChargerInfo availableChargerIds](v25);
                      [v34 addObjectsFromArray:v26];
                    }
                  }
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v11);
          }

          uint64_t i = v33;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v32);
  }

  v27 = [v6 allObjects];
  v30->_int64_t aggregatedTotal = [v27 count];

  v28 = [v34 allObjects];
  v30->_int64_t aggregatedAvailable = [v28 count];
}

- (int)_realTimePlugStatus:(int)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (unint64_t)totalEVChargers
{
  return self->_totalEVChargers;
}

- (void)setTotalEVChargers:(unint64_t)a3
{
  self->_totalEVChargers = a3;
}

- (unint64_t)availableEVChargers
{
  return self->_availableEVChargers;
}

- (void)setAvailableEVChargers:(unint64_t)a3
{
  self->_availableEVChargers = a3;
}

- (unint64_t)ttlSeconds
{
  return self->_ttlSeconds;
}

- (void)setTtlSeconds:(unint64_t)a3
{
  self->_ttlSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);

  objc_storeStrong((id *)&self->_charger, 0);
}

@end