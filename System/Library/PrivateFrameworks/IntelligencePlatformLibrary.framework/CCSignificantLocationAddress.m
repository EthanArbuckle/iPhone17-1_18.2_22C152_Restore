@interface CCSignificantLocationAddress
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasIsIsland;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (BOOL)isIsland;
- (CCSignificantLocationAddress)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCSignificantLocationAddress)initWithThoroughfare:(id)a3 subLocality:(id)a4 locality:(id)a5 country:(id)a6 error:(id *)a7;
- (CCSignificantLocationAddress)initWithThoroughfare:(id)a3 subLocality:(id)a4 locality:(id)a5 country:(id)a6 subPremises:(id)a7 subThoroughfare:(id)a8 subAministrativeArea:(id)a9 administrativeArea:(id)a10 administrativeAreaCode:(id)a11 postalCode:(id)a12 countryCode:(id)a13 inlandWater:(id)a14 ocean:(id)a15 areasOfInterest:(id)a16 isIsland:(id)a17 iso3166CountryCode:(id)a18 iso3166SubdivisionCode:(id)a19 mergedThoroughfare:(id)a20 error:(id *)a21;
- (NSArray)areasOfInterest;
- (NSArray)subPremises;
- (NSString)administrativeArea;
- (NSString)administrativeAreaCode;
- (NSString)country;
- (NSString)countryCode;
- (NSString)inlandWater;
- (NSString)iso3166CountryCode;
- (NSString)iso3166SubdivisionCode;
- (NSString)locality;
- (NSString)mergedThoroughfare;
- (NSString)ocean;
- (NSString)postalCode;
- (NSString)subAministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasIsIsland:(BOOL)a3;
@end

@implementation CCSignificantLocationAddress

- (CCSignificantLocationAddress)initWithThoroughfare:(id)a3 subLocality:(id)a4 locality:(id)a5 country:(id)a6 error:(id *)a7
{
  return -[CCSignificantLocationAddress initWithThoroughfare:subLocality:locality:country:subPremises:subThoroughfare:subAministrativeArea:administrativeArea:administrativeAreaCode:postalCode:countryCode:inlandWater:ocean:areasOfInterest:isIsland:iso3166CountryCode:iso3166SubdivisionCode:mergedThoroughfare:error:](self, "initWithThoroughfare:subLocality:locality:country:subPremises:subThoroughfare:subAministrativeArea:administrativeArea:administrativeAreaCode:postalCode:countryCode:inlandWater:ocean:areasOfInterest:isIsland:iso3166CountryCode:iso3166SubdivisionCode:mergedThoroughfare:error:", a3, a4, a5, a6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           0,
           0,
           0,
           a7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedThoroughfare, 0);
  objc_storeStrong((id *)&self->_iso3166SubdivisionCode, 0);
  objc_storeStrong((id *)&self->_iso3166CountryCode, 0);
  objc_storeStrong((id *)&self->_areasOfInterest, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subAministrativeArea, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_subPremises, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
}

- (void)setHasIsIsland:(BOOL)a3
{
  self->_hasIsIsland = a3;
}

- (BOOL)hasIsIsland
{
  return self->_hasIsIsland;
}

- (BOOL)isIsland
{
  return self->_isIsland;
}

- (CCSignificantLocationAddress)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  uint64_t v57 = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"thoroughfare"];
    v10 = [v6 objectForKeyedSubscript:@"subLocality"];
    v11 = [v6 objectForKeyedSubscript:@"locality"];
    v12 = [v6 objectForKeyedSubscript:@"country"];
    uint64_t v13 = [v6 objectForKeyedSubscript:@"subPremises"];
    v50 = (void *)v9;
    if (v13)
    {
      id v14 = (id)v13;
      objc_opt_class();
      id v56 = v8;
      char v15 = CCValidateIsInstanceOfExpectedClass();
      id v16 = v8;

      if ((v15 & 1) == 0)
      {
        CCSetError();
        v31 = 0;
        id v8 = v16;
        v32 = v50;
LABEL_22:

        goto LABEL_23;
      }
      id v41 = v16;
      v42 = v11;
      v49 = v12;
      v43 = v10;
      v44 = self;
      v17 = objc_opt_new();
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v14 = v14;
      uint64_t v18 = [v14 countByEnumeratingWithState:&v52 objects:v58 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v53 != v20) {
              objc_enumerationMutation(v14);
            }
            uint64_t v22 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            v23 = [CCSignificantLocationSubPremise alloc];
            id v51 = 0;
            v24 = [(CCSignificantLocationSubPremise *)v23 initWithJSONDictionary:v22 error:&v51];
            id v25 = v51;
            if (v24) {
              BOOL v26 = v25 == 0;
            }
            else {
              BOOL v26 = 0;
            }
            if (!v26)
            {
              v30 = v25;
              CCSetError();

              v31 = 0;
              self = v44;
              v12 = v49;
              v32 = v50;
              v11 = v42;
              goto LABEL_21;
            }
            [v17 addObject:v24];
          }
          uint64_t v19 = [v14 countByEnumeratingWithState:&v52 objects:v58 count:16];
        }
        while (v19);
      }
      v40 = a4;
    }
    else
    {
      v40 = a4;
      id v41 = v8;
      v49 = v12;
      v42 = v11;
      v43 = v10;
      v44 = self;
      v17 = 0;
    }
    v39 = [v6 objectForKeyedSubscript:@"subThoroughfare"];
    v48 = [v6 objectForKeyedSubscript:@"subAministrativeArea"];
    v47 = [v6 objectForKeyedSubscript:@"administrativeArea"];
    v46 = [v6 objectForKeyedSubscript:@"administrativeAreaCode"];
    v45 = [v6 objectForKeyedSubscript:@"postalCode"];
    v38 = [v6 objectForKeyedSubscript:@"countryCode"];
    v37 = [v6 objectForKeyedSubscript:@"inlandWater"];
    v36 = [v6 objectForKeyedSubscript:@"ocean"];
    v35 = [v6 objectForKeyedSubscript:@"areasOfInterest"];
    v34 = [v6 objectForKeyedSubscript:@"isIsland"];
    v27 = [v6 objectForKeyedSubscript:@"iso3166CountryCode"];
    v28 = [v6 objectForKeyedSubscript:@"iso3166SubdivisionCode"];
    v29 = [v6 objectForKeyedSubscript:@"mergedThoroughfare"];
    v32 = v50;
    v11 = v42;
    v10 = v43;
    v31 = -[CCSignificantLocationAddress initWithThoroughfare:subLocality:locality:country:subPremises:subThoroughfare:subAministrativeArea:administrativeArea:administrativeAreaCode:postalCode:countryCode:inlandWater:ocean:areasOfInterest:isIsland:iso3166CountryCode:iso3166SubdivisionCode:mergedThoroughfare:error:]([CCSignificantLocationAddress alloc], "initWithThoroughfare:subLocality:locality:country:subPremises:subThoroughfare:subAministrativeArea:administrativeArea:administrativeAreaCode:postalCode:countryCode:inlandWater:ocean:areasOfInterest:isIsland:iso3166CountryCode:iso3166SubdivisionCode:mergedThoroughfare:error:", v50, v43, v42, v49, v17, v39, v48, v47, v46, v45, v38, v37, v36, v35, v34,
            v27,
            v28,
            v29,
            v40);

    id v14 = v17;
    v12 = v49;
    self = v44;
LABEL_21:
    id v8 = v41;
    goto LABEL_22;
  }
  CCSetError();
  v31 = 0;
LABEL_23:

  return v31;
}

- (id)jsonDictionary
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (self->_thoroughfare)
  {
    v4 = [(CCSignificantLocationAddress *)self thoroughfare];
    [v3 setObject:v4 forKeyedSubscript:@"thoroughfare"];
  }
  if (self->_subLocality)
  {
    v5 = [(CCSignificantLocationAddress *)self subLocality];
    [v3 setObject:v5 forKeyedSubscript:@"subLocality"];
  }
  if (self->_locality)
  {
    id v6 = [(CCSignificantLocationAddress *)self locality];
    [v3 setObject:v6 forKeyedSubscript:@"locality"];
  }
  if (self->_country)
  {
    v7 = [(CCSignificantLocationAddress *)self country];
    [v3 setObject:v7 forKeyedSubscript:@"country"];
  }
  id v8 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v9 = [(CCSignificantLocationAddress *)self subPremises];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v31 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v30 + 1) + 8 * i) jsonDictionary];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v11);
  }

  [v3 setObject:v8 forKeyedSubscript:@"subPremises"];
  if (self->_subThoroughfare)
  {
    char v15 = [(CCSignificantLocationAddress *)self subThoroughfare];
    [v3 setObject:v15 forKeyedSubscript:@"subThoroughfare"];
  }
  if (self->_subAministrativeArea)
  {
    id v16 = [(CCSignificantLocationAddress *)self subAministrativeArea];
    [v3 setObject:v16 forKeyedSubscript:@"subAministrativeArea"];
  }
  if (self->_administrativeArea)
  {
    v17 = [(CCSignificantLocationAddress *)self administrativeArea];
    [v3 setObject:v17 forKeyedSubscript:@"administrativeArea"];
  }
  if (self->_administrativeAreaCode)
  {
    uint64_t v18 = [(CCSignificantLocationAddress *)self administrativeAreaCode];
    [v3 setObject:v18 forKeyedSubscript:@"administrativeAreaCode"];
  }
  if (self->_postalCode)
  {
    uint64_t v19 = [(CCSignificantLocationAddress *)self postalCode];
    [v3 setObject:v19 forKeyedSubscript:@"postalCode"];
  }
  if (self->_countryCode)
  {
    uint64_t v20 = [(CCSignificantLocationAddress *)self countryCode];
    [v3 setObject:v20 forKeyedSubscript:@"countryCode"];
  }
  if (self->_inlandWater)
  {
    v21 = [(CCSignificantLocationAddress *)self inlandWater];
    [v3 setObject:v21 forKeyedSubscript:@"inlandWater"];
  }
  if (self->_ocean)
  {
    uint64_t v22 = [(CCSignificantLocationAddress *)self ocean];
    [v3 setObject:v22 forKeyedSubscript:@"ocean"];
  }
  if (self->_areasOfInterest)
  {
    v23 = [(CCSignificantLocationAddress *)self areasOfInterest];
    [v3 setObject:v23 forKeyedSubscript:@"areasOfInterest"];
  }
  if (self->_hasIsIsland)
  {
    v24 = objc_msgSend(NSNumber, "numberWithBool:", -[CCSignificantLocationAddress isIsland](self, "isIsland"));
    [v3 setObject:v24 forKeyedSubscript:@"isIsland"];
  }
  if (self->_iso3166CountryCode)
  {
    id v25 = [(CCSignificantLocationAddress *)self iso3166CountryCode];
    [v3 setObject:v25 forKeyedSubscript:@"iso3166CountryCode"];
  }
  if (self->_iso3166SubdivisionCode)
  {
    BOOL v26 = [(CCSignificantLocationAddress *)self iso3166SubdivisionCode];
    [v3 setObject:v26 forKeyedSubscript:@"iso3166SubdivisionCode"];
  }
  if (self->_mergedThoroughfare)
  {
    v27 = [(CCSignificantLocationAddress *)self mergedThoroughfare];
    [v3 setObject:v27 forKeyedSubscript:@"mergedThoroughfare"];
  }
  v28 = (void *)[v3 copy];

  return v28;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v23 = (void (**)(id, void *))a3;
  if (self->_thoroughfare)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15770 stringValue:self->_thoroughfare];
    v23[2](v23, v5);
  }
  if (self->_subLocality)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15771 stringValue:self->_subLocality];
    v23[2](v23, v6);
  }
  if (self->_locality)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15772 stringValue:self->_locality];
    v23[2](v23, v7);
  }
  if (self->_country)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15773 stringValue:self->_country];
    v23[2](v23, v8);
  }
  if (self->_subPremises)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15774 repeatedSubMessageValue:self->_subPremises];
    v23[2](v23, v9);
  }
  if (self->_subThoroughfare)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15777 stringValue:self->_subThoroughfare];
    v23[2](v23, v10);
  }
  if (self->_subAministrativeArea)
  {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15778 stringValue:self->_subAministrativeArea];
    v23[2](v23, v11);
  }
  if (self->_administrativeArea)
  {
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15779 stringValue:self->_administrativeArea];
    v23[2](v23, v12);
  }
  if (self->_administrativeAreaCode)
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15780 stringValue:self->_administrativeAreaCode];
    v23[2](v23, v13);
  }
  if (self->_postalCode)
  {
    id v14 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15781 stringValue:self->_postalCode];
    v23[2](v23, v14);
  }
  if (self->_countryCode)
  {
    char v15 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15782 stringValue:self->_countryCode];
    v23[2](v23, v15);
  }
  if (self->_inlandWater)
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15783 stringValue:self->_inlandWater];
    v23[2](v23, v16);
  }
  if (self->_ocean)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15784 stringValue:self->_ocean];
    v23[2](v23, v17);
  }
  if (self->_areasOfInterest)
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15785 repeatedStringValue:self->_areasOfInterest];
    v23[2](v23, v18);
  }
  if (self->_hasIsIsland)
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15786 BOOLValue:self->_isIsland];
    v23[2](v23, v19);
  }
  if (self->_iso3166CountryCode)
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15787 stringValue:self->_iso3166CountryCode];
    v23[2](v23, v20);
  }
  if (self->_iso3166SubdivisionCode)
  {
    v21 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15788 stringValue:self->_iso3166SubdivisionCode];
    v23[2](v23, v21);
  }
  if (self->_mergedThoroughfare)
  {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15789 stringValue:self->_mergedThoroughfare];
    v23[2](v23, v22);
  }
}

- (NSString)mergedThoroughfare
{
  v2 = (void *)[(NSString *)self->_mergedThoroughfare copy];
  return (NSString *)v2;
}

- (NSString)iso3166SubdivisionCode
{
  v2 = (void *)[(NSString *)self->_iso3166SubdivisionCode copy];
  return (NSString *)v2;
}

- (NSString)iso3166CountryCode
{
  v2 = (void *)[(NSString *)self->_iso3166CountryCode copy];
  return (NSString *)v2;
}

- (NSArray)areasOfInterest
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_areasOfInterest copyItems:1];
  return (NSArray *)v2;
}

- (NSString)ocean
{
  v2 = (void *)[(NSString *)self->_ocean copy];
  return (NSString *)v2;
}

- (NSString)inlandWater
{
  v2 = (void *)[(NSString *)self->_inlandWater copy];
  return (NSString *)v2;
}

- (NSString)countryCode
{
  v2 = (void *)[(NSString *)self->_countryCode copy];
  return (NSString *)v2;
}

- (NSString)postalCode
{
  v2 = (void *)[(NSString *)self->_postalCode copy];
  return (NSString *)v2;
}

- (NSString)administrativeAreaCode
{
  v2 = (void *)[(NSString *)self->_administrativeAreaCode copy];
  return (NSString *)v2;
}

- (NSString)administrativeArea
{
  v2 = (void *)[(NSString *)self->_administrativeArea copy];
  return (NSString *)v2;
}

- (NSString)subAministrativeArea
{
  v2 = (void *)[(NSString *)self->_subAministrativeArea copy];
  return (NSString *)v2;
}

- (NSString)subThoroughfare
{
  v2 = (void *)[(NSString *)self->_subThoroughfare copy];
  return (NSString *)v2;
}

- (NSArray)subPremises
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_subPremises copyItems:1];
  return (NSArray *)v2;
}

- (NSString)country
{
  v2 = (void *)[(NSString *)self->_country copy];
  return (NSString *)v2;
}

- (NSString)locality
{
  v2 = (void *)[(NSString *)self->_locality copy];
  return (NSString *)v2;
}

- (NSString)subLocality
{
  v2 = (void *)[(NSString *)self->_subLocality copy];
  return (NSString *)v2;
}

- (NSString)thoroughfare
{
  v2 = (void *)[(NSString *)self->_thoroughfare copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]])
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0;
LABEL_66:
    id v11 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    id v11 = 0;
    uint64_t v12 = (int *)MEMORY[0x263F317B8];
    uint64_t v13 = (int *)MEMORY[0x263F317B0];
    do
    {
      if (*(void *)&v6[*v12]) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = v11 == 0;
      }
      if (!v14) {
        break;
      }
      char v15 = 0;
      unsigned int v16 = 0;
      unint64_t v17 = 0;
      while (1)
      {
        uint64_t v18 = *v7;
        unint64_t v19 = *(void *)&v6[v18];
        if (v19 == -1 || v19 >= *(void *)&v6[*v8]) {
          break;
        }
        char v20 = *(unsigned char *)(*(void *)&v6[*v13] + v19);
        *(void *)&v6[v18] = v19 + 1;
        v17 |= (unint64_t)(v20 & 0x7F) << v15;
        if ((v20 & 0x80) == 0) {
          goto LABEL_17;
        }
        v15 += 7;
        BOOL v21 = v16++ >= 9;
        if (v21)
        {
          unint64_t v17 = 0;
          if (*(void *)&v6[*v12]) {
            goto LABEL_66;
          }
          goto LABEL_18;
        }
      }
      *(void *)&v6[*v12] = 1;
LABEL_17:
      if (*(void *)&v6[*v12]) {
        goto LABEL_66;
      }
LABEL_18:
      switch((v17 >> 3))
      {
        case 1u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 24;
          goto LABEL_54;
        case 2u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 32;
          goto LABEL_54;
        case 3u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 40;
          goto LABEL_54;
        case 4u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 48;
          goto LABEL_54;
        case 5u:
          id v50 = v5;
          id v51 = v9;
          uint64_t v25 = CCPBReaderReadDataNoCopy();
          BOOL v26 = v10;
          v27 = (void *)v25;
          v24 = v26;
          if (!v26) {
            v24 = objc_opt_new();
          }
          v28 = [CCSignificantLocationSubPremise alloc];
          id v52 = 0;
          v29 = [(CCItemMessage *)v28 initWithData:v27 error:&v52];
          id v11 = v52;
          if (!v11 && v29) {
            [v24 addObject:v29];
          }

          goto LABEL_63;
        case 6u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 64;
          goto LABEL_54;
        case 7u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 72;
          goto LABEL_54;
        case 8u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 80;
          goto LABEL_54;
        case 9u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 88;
          goto LABEL_54;
        case 0xAu:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 96;
          goto LABEL_54;
        case 0xBu:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 104;
          goto LABEL_54;
        case 0xCu:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 112;
          goto LABEL_54;
        case 0xDu:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 120;
          goto LABEL_54;
        case 0xEu:
          long long v30 = CCPBReaderReadStringNoCopy();
          if (!v9) {
            uint64_t v9 = objc_opt_new();
          }
          if (v30) {
            [v9 addObject:v30];
          }

          goto LABEL_55;
        case 0xFu:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          break;
        case 0x10u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 136;
          goto LABEL_54;
        case 0x11u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 144;
          goto LABEL_54;
        case 0x12u:
          CCPBReaderReadStringNoCopy();
          uint64_t v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v23 = 152;
LABEL_54:
          v37 = *(Class *)((char *)&self->super.super.isa + v23);
          *(Class *)((char *)&self->super.super.isa + v23) = v22;

LABEL_55:
          id v11 = 0;
          continue;
        default:
          id v51 = v9;
          v24 = v10;
          if (CCPBReaderSkipValueWithTag())
          {
            id v11 = 0;
          }
          else
          {
            v38 = (objc_class *)objc_opt_class();
            NSStringFromClass(v38);
            v39 = id v50 = v5;
            CCSkipFieldErrorForMessage();
            id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_63:
            id v5 = v50;
          }
          uint64_t v10 = v24;
          uint64_t v9 = v51;
          continue;
      }
      while (1)
      {
        uint64_t v34 = *v7;
        unint64_t v35 = *(void *)&v6[v34];
        if (v35 == -1 || v35 >= *(void *)&v6[*v8]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v6[*v13] + v35);
        *(void *)&v6[v34] = v35 + 1;
        v33 |= (unint64_t)(v36 & 0x7F) << v31;
        if ((v36 & 0x80) == 0) {
          goto LABEL_59;
        }
        v31 += 7;
        BOOL v21 = v32++ >= 9;
        if (v21)
        {
          uint64_t v33 = 0;
          goto LABEL_61;
        }
      }
      *(void *)&v6[*v12] = 1;
LABEL_59:
      if (*(void *)&v6[*v12]) {
        uint64_t v33 = 0;
      }
LABEL_61:
      id v11 = 0;
      self->_isIsland = v33 != 0;
      self->_hasIsIsland = 1;
    }
    while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  }
  v40 = (NSArray *)objc_msgSend(v10, "copy", v50);
  subPremises = self->_subPremises;
  self->_subPremises = v40;

  v42 = (NSArray *)[v9 copy];
  areasOfInterest = self->_areasOfInterest;
  self->_areasOfInterest = v42;

  if (v11)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v6[*MEMORY[0x263F317B8]])
    {
      BOOL v48 = 1;
      goto LABEL_72;
    }
    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    CCInvalidBufferErrorForMessage();
    v47 = v46 = v10;
    CCSetError();

    uint64_t v10 = v46;
  }
  BOOL v48 = 0;
LABEL_72:

  return v48;
}

- (CCSignificantLocationAddress)initWithThoroughfare:(id)a3 subLocality:(id)a4 locality:(id)a5 country:(id)a6 subPremises:(id)a7 subThoroughfare:(id)a8 subAministrativeArea:(id)a9 administrativeArea:(id)a10 administrativeAreaCode:(id)a11 postalCode:(id)a12 countryCode:(id)a13 inlandWater:(id)a14 ocean:(id)a15 areasOfInterest:(id)a16 isIsland:(id)a17 iso3166CountryCode:(id)a18 iso3166SubdivisionCode:(id)a19 mergedThoroughfare:(id)a20 error:(id *)a21
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v27 = a4;
  id v28 = a5;
  id v29 = a6;
  id v85 = a7;
  id v87 = a8;
  id v86 = a9;
  id v84 = a10;
  id v83 = a11;
  id v82 = a12;
  id v81 = a13;
  id v80 = a14;
  id v79 = a15;
  id v78 = a16;
  id v77 = a17;
  id v76 = a18;
  id v75 = a19;
  id v73 = a20;
  long long v30 = objc_opt_new();
  if (v26)
  {
    objc_opt_class();
    uint64_t v109 = 0;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v32 = 0;
    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      v37 = 0;
      uint64_t v33 = v85;
LABEL_84:
      v49 = v87;
      goto LABEL_85;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v32 = 0;
  }
  uint64_t v33 = v85;
  if (v27)
  {
    objc_opt_class();
    id v108 = v32;
    int v34 = CCValidateIsInstanceOfExpectedClass();
    id v35 = v32;

    if (!v34) {
      goto LABEL_77;
    }
    CCPBDataWriterWriteStringField();
    if (!v28)
    {
LABEL_8:
      id v32 = v35;
      if (v29) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v35 = v32;
    if (!v28) {
      goto LABEL_8;
    }
  }
  objc_opt_class();
  id v107 = v35;
  int v38 = CCValidateIsInstanceOfExpectedClass();
  id v32 = v35;

  if (!v38) {
    goto LABEL_83;
  }
  CCPBDataWriterWriteStringField();
  if (v29)
  {
LABEL_9:
    objc_opt_class();
    id v106 = v32;
    int v36 = CCValidateIsInstanceOfExpectedClass();
    id v35 = v32;

    if (!v36) {
      goto LABEL_77;
    }
    CCPBDataWriterWriteStringField();
    if (!v85) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
LABEL_16:
  id v35 = v32;
  if (!v85)
  {
LABEL_11:
    id v32 = v35;
    goto LABEL_26;
  }
LABEL_17:
  objc_opt_class();
  id v105 = v35;
  int v39 = CCValidateArrayValues();
  id v32 = v35;

  if (!v39) {
    goto LABEL_83;
  }
  id v71 = v26;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v40 = v85;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v101 objects:v111 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v102 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = [*(id *)(*((void *)&v101 + 1) + 8 * i) data];
        CCPBDataWriterWriteDataField();
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v101 objects:v111 count:16];
    }
    while (v42);
  }

  id v26 = v71;
  uint64_t v33 = v85;
LABEL_26:
  if (v87)
  {
    objc_opt_class();
    id v100 = v32;
    int v46 = CCValidateIsInstanceOfExpectedClass();
    id v47 = v32;

    if (!v46)
    {
      CCSetError();
      v37 = 0;
      id v32 = v47;
      v49 = v87;
      goto LABEL_85;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v47 = v32;
  }
  if (v86)
  {
    objc_opt_class();
    id v99 = v47;
    int v48 = CCValidateIsInstanceOfExpectedClass();
    id v32 = v47;

    if (!v48) {
      goto LABEL_83;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v32 = v47;
  }
  if (v84)
  {
    objc_opt_class();
    id v98 = v32;
    int v50 = CCValidateIsInstanceOfExpectedClass();
    id v35 = v32;

    if (!v50) {
      goto LABEL_77;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v35 = v32;
  }
  if (v83)
  {
    objc_opt_class();
    id v97 = v35;
    int v51 = CCValidateIsInstanceOfExpectedClass();
    id v32 = v35;

    if (!v51) {
      goto LABEL_83;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v32 = v35;
  }
  if (v82)
  {
    objc_opt_class();
    id v96 = v32;
    int v52 = CCValidateIsInstanceOfExpectedClass();
    id v35 = v32;

    if (!v52) {
      goto LABEL_77;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v35 = v32;
  }
  if (v81)
  {
    objc_opt_class();
    id v95 = v35;
    int v53 = CCValidateIsInstanceOfExpectedClass();
    id v32 = v35;

    if (!v53) {
      goto LABEL_83;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v32 = v35;
  }
  if (v80)
  {
    objc_opt_class();
    id v94 = v32;
    int v54 = CCValidateIsInstanceOfExpectedClass();
    id v35 = v32;

    if (!v54) {
      goto LABEL_77;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v35 = v32;
  }
  if (v79)
  {
    objc_opt_class();
    id v93 = v35;
    int v55 = CCValidateIsInstanceOfExpectedClass();
    id v32 = v35;

    if (v55)
    {
      CCPBDataWriterWriteStringField();
      goto LABEL_59;
    }
LABEL_83:
    CCSetError();
    v37 = 0;
    goto LABEL_84;
  }
  id v32 = v35;
LABEL_59:
  if (!v78)
  {
    v72 = v32;
    id v59 = v77;
    goto LABEL_70;
  }
  objc_opt_class();
  id v92 = v32;
  int v56 = CCValidateArrayValues();
  id v35 = v32;

  if (!v56)
  {
LABEL_77:
    CCSetError();
    v37 = 0;
    id v32 = v35;
    goto LABEL_84;
  }
  v72 = v35;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v57 = v78;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v88 objects:v110 count:16];
  id v59 = v77;
  if (v58)
  {
    uint64_t v60 = v58;
    uint64_t v61 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v89 != v61) {
          objc_enumerationMutation(v57);
        }
        CCPBDataWriterWriteStringField();
      }
      uint64_t v60 = [v57 countByEnumeratingWithState:&v88 objects:v110 count:16];
    }
    while (v60);
  }

  uint64_t v33 = v85;
LABEL_70:
  v49 = v87;
  if (v59)
  {
    objc_opt_class();
    int v63 = CCValidateIsInstanceOfExpectedClass();
    id v32 = v72;

    if (!v63)
    {
      CCSetError();
      v37 = 0;
      goto LABEL_85;
    }
    [v77 BOOLValue];
    CCPBDataWriterWriteBOOLField();
  }
  else
  {
    id v32 = v72;
  }
  if (v76)
  {
    objc_opt_class();
    int v64 = CCValidateIsInstanceOfExpectedClass();
    id v35 = v32;

    if (v64)
    {
      CCPBDataWriterWriteStringField();
      goto LABEL_80;
    }
    goto LABEL_77;
  }
  id v35 = v32;
LABEL_80:
  if (!v75)
  {
    id v32 = v35;
    v49 = v87;
    goto LABEL_87;
  }
  objc_opt_class();
  int v65 = CCValidateIsInstanceOfExpectedClass();
  id v32 = v35;

  if (!v65) {
    goto LABEL_83;
  }
  CCPBDataWriterWriteStringField();
  v49 = v87;
LABEL_87:
  if (v73)
  {
    objc_opt_class();
    int v67 = CCValidateIsInstanceOfExpectedClass();
    id v68 = v32;

    if (!v67)
    {
      CCSetError();
      v37 = 0;
      id v32 = v68;
      goto LABEL_85;
    }
    CCPBDataWriterWriteStringField();
    id v32 = v68;
  }
  v69 = [v30 immutableData];
  v70 = [(CCItemMessage *)self initWithData:v69 error:a21];

  self = v70;
  v37 = v70;
  uint64_t v33 = v85;
LABEL_85:

  return v37;
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (unsigned)itemType
{
  return 15757;
}

@end