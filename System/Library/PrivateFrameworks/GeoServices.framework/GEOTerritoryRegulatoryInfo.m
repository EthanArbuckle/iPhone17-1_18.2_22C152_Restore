@interface GEOTerritoryRegulatoryInfo
- (BOOL)isDisputed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToGEOTerritoryRegulatoryInfo:(id)a3;
- (GEOTerritoryRegulatoryInfo)initWithUnsafeTerritoryData:(id)a3 nameDB:(id)a4 iso3to2Mapping:(id)a5;
- (NSArray)interestedPartyIso3166CountryCodes;
- (NSArray)interestedPartyIso3166CountryCodes2;
- (NSArray)interestedPartyIso3166CountryCodes3;
- (NSString)disputedTerritoryName;
- (NSString)iso3166CountryCode;
- (NSString)iso3166CountryCode2;
- (NSString)iso3166CountryCode3;
- (id)description;
- (int64_t)isCoastalWaters;
- (unint64_t)hash;
- (unint64_t)uniqueIdentifier;
@end

@implementation GEOTerritoryRegulatoryInfo

- (NSString)iso3166CountryCode2
{
  return self->_iso3166CountryCode2;
}

- (BOOL)isDisputed
{
  return self->_disputed;
}

BOOL __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithData:v4 encoding:4];

  uint64_t v6 = [v5 length];
  if (v6)
  {
    int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = [v5 copy];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v7)
    {
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    else
    {
      v11 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = v8;

      v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:*(void *)(*(void *)(a1 + 32) + 24)];
      uint64_t v12 = [v10 copy];
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 32);
      *(void *)(v13 + 32) = v12;
    }
  }

  return v6 != 0;
}

- (GEOTerritoryRegulatoryInfo)initWithUnsafeTerritoryData:(id)a3 nameDB:(id)a4 iso3to2Mapping:(id)a5
{
  uint64_t v8 = a3;
  id v25 = a4;
  id v24 = a5;
  v40.receiver = self;
  v40.super_class = (Class)GEOTerritoryRegulatoryInfo;
  uint64_t v9 = [(GEOTerritoryRegulatoryInfo *)&v40 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_21;
  }
  if (v8)
  {
    v9->_uniqueIdentifier = v8[8];
    v9->_coastalWaters = 0;
    v9->_disputed = 0;
    -[GEOTerritoryDataTerritoryInfo _readTerritoryTypes]((uint64_t)v8);
    if (v8[6])
    {
      unint64_t v11 = 0;
      do
      {
        int v12 = -[GEOTerritoryDataTerritoryInfo territoryTypeAtIndex:]((uint64_t)v8, v11);
        if (v12 == 3)
        {
          v10->_coastalWaters = 1;
        }
        else if (v12 == 2)
        {
          v10->_disputed = 1;
        }
        ++v11;
        -[GEOTerritoryDataTerritoryInfo _readTerritoryTypes]((uint64_t)v8);
      }
      while (v11 < v8[6]);
    }
    if ((v8[14] & 2) != 0)
    {
      uint64_t v13 = *((unsigned int *)v8 + 27);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke;
      v37[3] = &unk_1E53D8708;
      v38 = v10;
      id v39 = v24;
      LODWORD(v13) = [v25 unsafeDataForQuadKey:v13 result:v37];

      if (!v13) {
        goto LABEL_21;
      }
    }
    if (v10->_disputed)
    {
      unint64_t v14 = 0;
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__1;
      v35 = __Block_byref_object_dispose__1;
      id v36 = 0;
      while (1)
      {
        -[GEOTerritoryDataTerritoryInfo _readInterestedPartys]((uint64_t)v8);
        if (v14 >= v8[3]) {
          break;
        }
        uint64_t v15 = -[GEOTerritoryDataTerritoryInfo interestedPartyAtIndex:]((uint64_t)v8, v14);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke_1;
        v28[3] = &unk_1E53D8730;
        v30 = &v31;
        v29 = v8;
        [v25 unsafeDataForQuadKey:v15 result:v28];

        ++v14;
      }
      uint64_t v16 = [(id)v32[5] sortedArrayUsingSelector:sel_compare_];
      interestedPartyIso3166CountryCodes3 = v10->_interestedPartyIso3166CountryCodes3;
      v10->_interestedPartyIso3166CountryCodes3 = (NSArray *)v16;

      v18 = (void *)v32[5];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke_2;
      v26[3] = &unk_1E53D8758;
      id v27 = v24;
      v19 = objc_msgSend(v18, "_geo_compactMap:", v26);
      uint64_t v20 = [v19 copy];
      interestedPartyIso3166CountryCodes2 = v10->_interestedPartyIso3166CountryCodes2;
      v10->_interestedPartyIso3166CountryCodes2 = (NSArray *)v20;

      _Block_object_dispose(&v31, 8);
    }
  }
  else
  {
    v9->_uniqueIdentifier = 0;
    v9->_coastalWaters = 0;
    v9->_disputed = 0;
  }
  if (![(NSString *)v10->_iso3166CountryCode3 length]
    && ![(NSString *)v10->_disputedTerritoryName length]
    && ![(NSArray *)v10->_interestedPartyIso3166CountryCodes3 count])
  {
LABEL_21:
    v22 = 0;
    goto LABEL_22;
  }
  v22 = v10;
LABEL_22:

  return v22;
}

- (unint64_t)hash
{
  unint64_t result = self->_uniqueIdentifier;
  if (!result)
  {
    unint64_t v4 = (self->_coastalWaters << 10) | ((unint64_t)self->_disputed << 8);
    NSUInteger v5 = v4 ^ [(NSString *)self->_iso3166CountryCode3 hash];
    NSUInteger v6 = ([(NSString *)self->_disputedTerritoryName hash] << 8) ^ (v5 << 16);
    return v6 ^ [(NSArray *)self->_interestedPartyIso3166CountryCodes3 hash];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestedPartyIso3166CountryCodes2, 0);
  objc_storeStrong((id *)&self->_interestedPartyIso3166CountryCodes3, 0);
  objc_storeStrong((id *)&self->_disputedTerritoryName, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode2, 0);

  objc_storeStrong((id *)&self->_iso3166CountryCode3, 0);
}

- (int64_t)isCoastalWaters
{
  return self->_coastalWaters;
}

uint64_t __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke_1(uint64_t a1, void *a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a2;
  NSUInteger v5 = (void *)[[v3 alloc] initWithData:v4 encoding:4];

  if ([v5 length])
  {
    NSUInteger v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      int v7 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8)
      {
        -[GEOTerritoryDataTerritoryInfo _readInterestedPartys](*(void *)(a1 + 32));
        uint64_t v9 = *(void *)(v8 + 24);
      }
      else
      {
        uint64_t v9 = 0;
      }
      uint64_t v10 = [v7 arrayWithCapacity:v9];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      int v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      NSUInteger v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 addObject:v5];
  }

  return 1;
}

id __80__GEOTerritoryRegulatoryInfo_initWithUnsafeTerritoryData_nameDB_iso3to2Mapping___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSString)iso3166CountryCode
{
  return self->_iso3166CountryCode3;
}

- (NSArray)interestedPartyIso3166CountryCodes
{
  return self->_interestedPartyIso3166CountryCodes3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(GEOTerritoryRegulatoryInfo *)self isEqualToGEOTerritoryRegulatoryInfo:v4];

  return v5;
}

- (BOOL)isEqualToGEOTerritoryRegulatoryInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: other != ((void *)0)", v13, 2u);
    }
    goto LABEL_21;
  }
  unint64_t uniqueIdentifier = self->_uniqueIdentifier;
  uint64_t v7 = v4[2];
  if (!uniqueIdentifier)
  {
    if (!v7 && self->_disputed == *((unsigned __int8 *)v4 + 8) && self->_coastalWaters == v4[8])
    {
      if ([(NSString *)self->_iso3166CountryCode3 isEqual:v4[3]])
      {
        NSUInteger v10 = [(NSArray *)self->_interestedPartyIso3166CountryCodes3 count];
        if (v10 == [*((id *)v5 + 6) count])
        {
          interestedPartyIso3166CountryCodes3 = self->_interestedPartyIso3166CountryCodes3;
          if ((!interestedPartyIso3166CountryCodes3
             || [(NSArray *)interestedPartyIso3166CountryCodes3 isEqual:*((void *)v5 + 6)])
            && (!self->_disputed
             || [(NSString *)self->_disputedTerritoryName isEqual:*((void *)v5 + 5)]))
          {
            BOOL v9 = 1;
            goto LABEL_22;
          }
        }
      }
    }
LABEL_21:
    BOOL v9 = 0;
    goto LABEL_22;
  }
  if (v7) {
    BOOL v8 = uniqueIdentifier == v7;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = v8;
LABEL_22:

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"<"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  objc_msgSend(v3, "appendFormat:", @" %p id: %#llx", self, self->_uniqueIdentifier);
  [v3 appendString:@" cc/name: \""];
  uint64_t v6 = 40;
  if (!self->_disputed) {
    uint64_t v6 = 24;
  }
  [v3 appendString:*(Class *)((char *)&self->super.isa + v6)];
  if (self->_disputed)
  {
    p_disputedTerritoryName = &self->_disputedTerritoryName;
    [v3 appendString:@" name: \""];
  }
  else
  {
    [v3 appendString:@" cc3/2: \""];
    [v3 appendString:self->_iso3166CountryCode3];
    [v3 appendString:@"\" / \""];
    p_disputedTerritoryName = &self->_iso3166CountryCode2;
  }
  [v3 appendString:*p_disputedTerritoryName];
  [v3 appendString:@"\" is_disputed: "];
  if (self->_disputed) {
    BOOL v8 = @"yes";
  }
  else {
    BOOL v8 = @"no";
  }
  [v3 appendString:v8];
  if (self->_disputed)
  {
    [v3 appendString:@" by: ["];
    if ([(NSArray *)self->_interestedPartyIso3166CountryCodes3 count])
    {
      BOOL v9 = [(NSArray *)self->_interestedPartyIso3166CountryCodes3 componentsJoinedByString:@", "];
      [v3 appendString:v9];
    }
    [v3 appendString:@"]"];
    [v3 appendString:@" / ["];
    if ([(NSArray *)self->_interestedPartyIso3166CountryCodes2 count])
    {
      NSUInteger v10 = [(NSArray *)self->_interestedPartyIso3166CountryCodes2 componentsJoinedByString:@", "];
      [v3 appendString:v10];
    }
    [v3 appendString:@"]"];
  }
  [v3 appendString:@" is_coastal_waters: "];
  unint64_t v11 = self->_coastalWaters + 1;
  if (v11 > 2) {
    int v12 = @"invalid";
  }
  else {
    int v12 = off_1E53D8778[v11];
  }
  [v3 appendString:v12];
  [v3 appendString:@">"];

  return v3;
}

- (unint64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)iso3166CountryCode3
{
  return self->_iso3166CountryCode3;
}

- (NSString)disputedTerritoryName
{
  return self->_disputedTerritoryName;
}

- (NSArray)interestedPartyIso3166CountryCodes3
{
  return self->_interestedPartyIso3166CountryCodes3;
}

- (NSArray)interestedPartyIso3166CountryCodes2
{
  return self->_interestedPartyIso3166CountryCodes2;
}

@end