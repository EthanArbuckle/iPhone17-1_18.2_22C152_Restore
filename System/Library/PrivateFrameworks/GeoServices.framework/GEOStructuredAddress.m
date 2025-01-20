@interface GEOStructuredAddress
+ (BOOL)isValid:(id)a3;
+ (Class)areaOfInterestType;
+ (Class)dependentLocalityType;
+ (Class)subPremiseType;
- (BOOL)_isEquivalentURLRepresentationTo:(id)a3;
- (BOOL)hasAdministrativeArea;
- (BOOL)hasAdministrativeAreaCode;
- (BOOL)hasCountry;
- (BOOL)hasCountryCode;
- (BOOL)hasFullThoroughfare;
- (BOOL)hasInlandWater;
- (BOOL)hasLocality;
- (BOOL)hasOcean;
- (BOOL)hasPostCode;
- (BOOL)hasPostCodeExtension;
- (BOOL)hasPostCodeFull;
- (BOOL)hasPremise;
- (BOOL)hasPremises;
- (BOOL)hasSubAdministrativeArea;
- (BOOL)hasSubLocality;
- (BOOL)hasSubThoroughfare;
- (BOOL)hasThoroughfare;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOStructuredAddress)initWithAddressDictionary:(id)a3;
- (GEOStructuredAddress)initWithDictionary:(id)a3;
- (GEOStructuredAddress)initWithJSON:(id)a3;
- (GEOStructuredAddress)initWithPostalAddress:(id)a3;
- (GEOStructuredAddress)initWithUrlRepresentation:(id)a3;
- (NSMutableArray)areaOfInterests;
- (NSMutableArray)dependentLocalitys;
- (NSMutableArray)subPremises;
- (NSString)administrativeArea;
- (NSString)administrativeAreaCode;
- (NSString)country;
- (NSString)countryCode;
- (NSString)description;
- (NSString)fullThoroughfare;
- (NSString)inlandWater;
- (NSString)locality;
- (NSString)ocean;
- (NSString)postCode;
- (NSString)postCodeExtension;
- (NSString)postCodeFull;
- (NSString)premise;
- (NSString)premises;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressDictionary;
- (id)areaOfInterestAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dependentLocalityAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)subPremiseAtIndex:(unint64_t)a3;
- (id)urlRepresentation;
- (int64_t)geoIdAtIndex:(unint64_t)a3;
- (int64_t)geoIds;
- (unint64_t)areaOfInterestsCount;
- (unint64_t)dependentLocalitysCount;
- (unint64_t)geoIdsCount;
- (unint64_t)hash;
- (unint64_t)subPremisesCount;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)addAreaOfInterest:(id)a3;
- (void)addDependentLocality:(id)a3;
- (void)addGeoId:(int64_t)a3;
- (void)addSubPremise:(id)a3;
- (void)clearAreaOfInterests;
- (void)clearDependentLocalitys;
- (void)clearGeoIds;
- (void)clearSubPremises;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAdministrativeArea:(id)a3;
- (void)setAdministrativeAreaCode:(id)a3;
- (void)setAreaOfInterests:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDependentLocalitys:(id)a3;
- (void)setFullThoroughfare:(id)a3;
- (void)setGeoIds:(int64_t *)a3 count:(unint64_t)a4;
- (void)setInlandWater:(id)a3;
- (void)setLocality:(id)a3;
- (void)setOcean:(id)a3;
- (void)setPostCode:(id)a3;
- (void)setPostCodeExtension:(id)a3;
- (void)setPostCodeFull:(id)a3;
- (void)setPremise:(id)a3;
- (void)setPremises:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setSubLocality:(id)a3;
- (void)setSubPremises:(id)a3;
- (void)setSubThoroughfare:(id)a3;
- (void)setThoroughfare:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStructuredAddress

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOStructuredAddress;
  [(GEOStructuredAddress *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thoroughfare, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_subPremises, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_premise, 0);
  objc_storeStrong((id *)&self->_premises, 0);
  objc_storeStrong((id *)&self->_postCode, 0);
  objc_storeStrong((id *)&self->_postCodeFull, 0);
  objc_storeStrong((id *)&self->_postCodeExtension, 0);
  objc_storeStrong((id *)&self->_ocean, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_inlandWater, 0);
  objc_storeStrong((id *)&self->_fullThoroughfare, 0);
  objc_storeStrong((id *)&self->_dependentLocalitys, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_areaOfInterests, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeAreaCode, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_country copyWithZone:a3];
  v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  uint64_t v8 = [(NSString *)self->_countryCode copyWithZone:a3];
  v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  uint64_t v10 = [(NSString *)self->_administrativeArea copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_administrativeAreaCode copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_subAdministrativeArea copyWithZone:a3];
  v15 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v14;

  uint64_t v16 = [(NSString *)self->_locality copyWithZone:a3];
  v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  uint64_t v18 = [(NSString *)self->_postCode copyWithZone:a3];
  v19 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v18;

  uint64_t v20 = [(NSString *)self->_subLocality copyWithZone:a3];
  v21 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v20;

  uint64_t v22 = [(NSString *)self->_premises copyWithZone:a3];
  v23 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v22;

  uint64_t v24 = [(NSString *)self->_thoroughfare copyWithZone:a3];
  v25 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v24;

  uint64_t v26 = [(NSString *)self->_subThoroughfare copyWithZone:a3];
  v27 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v26;

  uint64_t v28 = [(NSString *)self->_fullThoroughfare copyWithZone:a3];
  v29 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v28;

  uint64_t v30 = [(NSString *)self->_postCodeExtension copyWithZone:a3];
  v31 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v30;

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v32 = self->_areaOfInterests;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v68;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v68 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * v36) copyWithZone:a3];
        [(id)v5 addAreaOfInterest:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v34);
  }

  uint64_t v38 = [(NSString *)self->_inlandWater copyWithZone:a3];
  v39 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v38;

  uint64_t v40 = [(NSString *)self->_ocean copyWithZone:a3];
  v41 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v40;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v42 = self->_dependentLocalitys;
  uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v64;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v64 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * v46) copyWithZone:a3];
        [(id)v5 addDependentLocality:v47];

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v44);
  }

  uint64_t v48 = [(NSString *)self->_premise copyWithZone:a3];
  v49 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v48;

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v50 = self->_subPremises;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v60;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v60 != v53) {
          objc_enumerationMutation(v50);
        }
        v55 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * v54), "copyWithZone:", a3, (void)v59);
        [(id)v5 addSubPremise:v55];

        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v52);
  }

  uint64_t v56 = [(NSString *)self->_postCodeFull copyWithZone:a3];
  v57 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v56;

  PBRepeatedInt64Copy();
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (void)addDependentLocality:(id)a3
{
  id v4 = a3;
  dependentLocalitys = self->_dependentLocalitys;
  id v8 = v4;
  if (!dependentLocalitys)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_dependentLocalitys;
    self->_dependentLocalitys = v6;

    id v4 = v8;
    dependentLocalitys = self->_dependentLocalitys;
  }
  [(NSMutableArray *)dependentLocalitys addObject:v4];
}

- (void)addAreaOfInterest:(id)a3
{
  id v4 = a3;
  areaOfInterests = self->_areaOfInterests;
  id v8 = v4;
  if (!areaOfInterests)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_areaOfInterests;
    self->_areaOfInterests = v6;

    id v4 = v8;
    areaOfInterests = self->_areaOfInterests;
  }
  [(NSMutableArray *)areaOfInterests addObject:v4];
}

- (NSMutableArray)areaOfInterests
{
  return self->_areaOfInterests;
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (NSString)locality
{
  return self->_locality;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)fullThoroughfare
{
  return self->_fullThoroughfare;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)postCodeFull
{
  return self->_postCodeFull;
}

- (NSString)administrativeAreaCode
{
  return self->_administrativeAreaCode;
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (NSString)ocean
{
  return self->_ocean;
}

- (NSString)inlandWater
{
  return self->_inlandWater;
}

- (BOOL)hasThoroughfare
{
  return self->_thoroughfare != 0;
}

- (id)addressDictionary
{
  objc_super v3 = _buildGEODictionaryFromStructuredAddress(self);
  id v4 = (void *)[v3 mutableCopy];

  if ([(GEOStructuredAddress *)self hasPostCode]
    && ([(GEOStructuredAddress *)self postCode],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v6))
  {
    v7 = [(GEOStructuredAddress *)self postCode];
    [v4 setObject:v7 forKeyedSubscript:@"ZIP"];
  }
  else
  {
    [v4 removeObjectForKey:@"ZIP"];
  }

  return v4;
}

- (NSString)postCode
{
  return self->_postCode;
}

- (NSString)premises
{
  return self->_premises;
}

- (BOOL)hasPostCode
{
  return self->_postCode != 0;
}

- (BOOL)hasPostCodeExtension
{
  return self->_postCodeExtension != 0;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_country hash];
  NSUInteger v4 = [(NSString *)self->_countryCode hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_administrativeArea hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_administrativeAreaCode hash];
  NSUInteger v7 = [(NSString *)self->_subAdministrativeArea hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_locality hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_postCode hash];
  NSUInteger v10 = [(NSString *)self->_subLocality hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_premises hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_thoroughfare hash];
  NSUInteger v13 = v9 ^ v12 ^ [(NSString *)self->_subThoroughfare hash];
  NSUInteger v14 = [(NSString *)self->_fullThoroughfare hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_postCodeExtension hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_areaOfInterests hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_inlandWater hash];
  NSUInteger v18 = v13 ^ v17 ^ [(NSString *)self->_ocean hash];
  uint64_t v19 = [(NSMutableArray *)self->_dependentLocalitys hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_premise hash];
  uint64_t v21 = v20 ^ [(NSMutableArray *)self->_subPremises hash];
  NSUInteger v22 = v21 ^ [(NSString *)self->_postCodeFull hash];
  return v18 ^ v22 ^ PBRepeatedInt64Hash();
}

- (unint64_t)subPremisesCount
{
  return [(NSMutableArray *)self->_subPremises count];
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (BOOL)hasSubThoroughfare
{
  return self->_subThoroughfare != 0;
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_country) {
    PBDataWriterWriteStringField();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_administrativeArea) {
    PBDataWriterWriteStringField();
  }
  if (self->_administrativeAreaCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_subAdministrativeArea) {
    PBDataWriterWriteStringField();
  }
  if (self->_locality) {
    PBDataWriterWriteStringField();
  }
  if (self->_postCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_subLocality) {
    PBDataWriterWriteStringField();
  }
  if (self->_premises) {
    PBDataWriterWriteStringField();
  }
  if (self->_thoroughfare) {
    PBDataWriterWriteStringField();
  }
  if (self->_subThoroughfare) {
    PBDataWriterWriteStringField();
  }
  if (self->_fullThoroughfare) {
    PBDataWriterWriteStringField();
  }
  if (self->_postCodeExtension) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  NSUInteger v5 = self->_areaOfInterests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  if (self->_inlandWater) {
    PBDataWriterWriteStringField();
  }
  if (self->_ocean) {
    PBDataWriterWriteStringField();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  NSUInteger v10 = self->_dependentLocalitys;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v12);
  }

  if (self->_premise) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  NSUInteger v15 = self->_subPremises;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v17);
  }

  if (self->_postCodeFull) {
    PBDataWriterWriteStringField();
  }
  if (self->_geoIds.count)
  {
    unint64_t v20 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v20;
    }
    while (v20 < self->_geoIds.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v21);
}

- (GEOStructuredAddress)initWithUrlRepresentation:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOStructuredAddress;
  NSUInteger v5 = [(GEOStructuredAddress *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"country"];
    if ([v6 length]) {
      [(GEOStructuredAddress *)v5 setCountryCode:v6];
    }
    uint64_t v7 = [v4 objectForKey:@"state"];
    if ([v7 length]) {
      [(GEOStructuredAddress *)v5 setAdministrativeArea:v7];
    }
    uint64_t v8 = [v4 objectForKey:@"city"];
    if ([v8 length]) {
      [(GEOStructuredAddress *)v5 setLocality:v8];
    }
    uint64_t v9 = [v4 objectForKey:@"zip"];
    if ([v9 length]) {
      [(GEOStructuredAddress *)v5 setPostCode:v9];
    }
    NSUInteger v10 = [v4 objectForKey:@"street"];
    if ([v10 length]) {
      [(GEOStructuredAddress *)v5 setFullThoroughfare:v10];
    }
    uint64_t v11 = v5;
  }
  return v5;
}

- (id)urlRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(GEOStructuredAddress *)self hasCountryCode])
  {
    id v4 = [(GEOStructuredAddress *)self countryCode];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      uint64_t v6 = [(GEOStructuredAddress *)self countryCode];
      [v3 setObject:v6 forKey:@"country"];
    }
  }
  if ([(GEOStructuredAddress *)self hasAdministrativeAreaCode])
  {
    uint64_t v7 = [(GEOStructuredAddress *)self administrativeAreaCode];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      uint64_t v9 = [(GEOStructuredAddress *)self administrativeAreaCode];
LABEL_10:
      uint64_t v12 = (void *)v9;
      [v3 setObject:v9 forKey:@"state"];

      goto LABEL_11;
    }
  }
  if ([(GEOStructuredAddress *)self hasAdministrativeArea])
  {
    NSUInteger v10 = [(GEOStructuredAddress *)self administrativeArea];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      uint64_t v9 = [(GEOStructuredAddress *)self administrativeArea];
      goto LABEL_10;
    }
  }
LABEL_11:
  if ([(GEOStructuredAddress *)self hasLocality])
  {
    objc_super v13 = [(GEOStructuredAddress *)self locality];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      NSUInteger v15 = [(GEOStructuredAddress *)self locality];
      [v3 setObject:v15 forKey:@"city"];
    }
  }
  if ([(GEOStructuredAddress *)self hasPostCode])
  {
    uint64_t v16 = [(GEOStructuredAddress *)self postCode];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      uint64_t v18 = [(GEOStructuredAddress *)self postCode];
      [v3 setObject:v18 forKey:@"zip"];
    }
  }
  if ([(GEOStructuredAddress *)self hasFullThoroughfare])
  {
    uint64_t v19 = [(GEOStructuredAddress *)self fullThoroughfare];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      long long v21 = [(GEOStructuredAddress *)self fullThoroughfare];
      [v3 setObject:v21 forKey:@"street"];
    }
  }

  return v3;
}

- (BOOL)_isEquivalentURLRepresentationTo:(id)a3
{
  id v6 = a3;
  if ([(GEOStructuredAddress *)self hasAdministrativeArea]
    || [v6 hasAdministrativeArea])
  {
    NSUInteger v3 = [(GEOStructuredAddress *)self administrativeArea];
    id v4 = [v6 administrativeArea];
    if (([v3 isEqual:v4] & 1) == 0
      && ([(GEOStructuredAddress *)self hasAdministrativeAreaCode]
       || [v6 hasAdministrativeAreaCode]))
    {
      uint64_t v8 = [(GEOStructuredAddress *)self administrativeAreaCode];
      uint64_t v9 = [v6 administrativeAreaCode];
      uint64_t v7 = [v8 isEqual:v9];
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
  if ([(GEOStructuredAddress *)self hasAdministrativeArea]
    && [v6 hasAdministrativeAreaCode])
  {
    NSUInteger v3 = [(GEOStructuredAddress *)self administrativeArea];
    id v4 = [v6 administrativeAreaCode];
    uint64_t v10 = 1;
    uint64_t v11 = 1;
    if ([v3 isEqual:v4]) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([(GEOStructuredAddress *)self hasAdministrativeAreaCode]
    && ([v6 hasAdministrativeArea] & 1) != 0)
  {
    uint64_t v12 = [(GEOStructuredAddress *)self administrativeAreaCode];
    objc_super v13 = [v6 administrativeArea];
    uint64_t v11 = [v12 isEqual:v13];

    int v14 = v11;
    if (!v10) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v11 = 0;
  int v14 = 0;
  if (v10)
  {
LABEL_20:

    int v14 = v11;
  }
LABEL_21:
  if ([(GEOStructuredAddress *)self hasCountryCode]
    || [v6 hasCountryCode])
  {
    NSUInteger v3 = [(GEOStructuredAddress *)self countryCode];
    id v4 = [v6 countryCode];
    NSUInteger v15 = 0;
    if (![v3 isEqual:v4] || ((v7 | v14) & 1) == 0) {
      goto LABEL_39;
    }
    int v16 = 1;
  }
  else
  {
    int v16 = 0;
    NSUInteger v15 = 0;
    if ((v7 | v14) != 1) {
      goto LABEL_40;
    }
  }
  if (-[GEOStructuredAddress hasLocality](self, "hasLocality") || [v6 hasLocality])
  {
    uint64_t v7 = [(GEOStructuredAddress *)self locality];
    uint64_t v11 = [v6 locality];
    if (![(id)v7 isEqual:v11])
    {
      LOBYTE(v15) = 0;
      goto LABEL_38;
    }
    int v17 = 1;
  }
  else
  {
    int v17 = 0;
  }
  if (-[GEOStructuredAddress hasPostCode](self, "hasPostCode") || [v6 hasPostCode])
  {
    NSUInteger v15 = [(GEOStructuredAddress *)self postCode];
    uint64_t v10 = [v6 postCode];
    if (([v15 isEqual:v10] & 1) == 0)
    {

      LOBYTE(v15) = 0;
      if ((v17 & 1) == 0) {
        goto LABEL_49;
      }
      goto LABEL_38;
    }
    int v27 = 1;
  }
  else
  {
    int v27 = 0;
  }
  long long v25 = (void *)v10;
  long long v26 = v15;
  if ([(GEOStructuredAddress *)self hasFullThoroughfare]
    || ([v6 hasFullThoroughfare] & 1) != 0)
  {
    uint64_t v19 = [(GEOStructuredAddress *)self fullThoroughfare];
    [v6 fullThoroughfare];
    int v20 = v17;
    uint64_t v21 = v11;
    uint64_t v22 = v7;
    long long v24 = v23 = v16;
    LOBYTE(v15) = [v19 isEqual:v24];

    int v16 = v23;
    uint64_t v7 = v22;
    uint64_t v11 = v21;
    int v17 = v20;

    if (v27) {
      goto LABEL_45;
    }
LABEL_48:
    if (!v17) {
      goto LABEL_49;
    }
    goto LABEL_38;
  }
  LOBYTE(v15) = 1;
  if ((v27 & 1) == 0) {
    goto LABEL_48;
  }
LABEL_45:

  if ((v17 & 1) == 0)
  {
LABEL_49:
    if (!v16) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_38:

  if (v16)
  {
LABEL_39:
  }
LABEL_40:

  return (char)v15;
}

- (GEOStructuredAddress)initWithAddressDictionary:(id)a3
{
  _buildStructuredAddressFromAnyAddressDictionary(a3);
  id v4 = (GEOStructuredAddress *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (GEOStructuredAddress)initWithPostalAddress:(id)a3
{
  _buildStructuredAddressFromCNPostalAddress(a3);
  id v4 = (GEOStructuredAddress *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEmpty
{
  NSUInteger v3 = [(GEOStructuredAddress *)self country];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(GEOStructuredAddress *)self countryCode];
    if (v5)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v6 = [(GEOStructuredAddress *)self administrativeArea];
      if (v6)
      {
        BOOL v4 = 0;
      }
      else
      {
        uint64_t v7 = [(GEOStructuredAddress *)self subAdministrativeArea];
        if (v7)
        {
          BOOL v4 = 0;
        }
        else
        {
          uint64_t v8 = [(GEOStructuredAddress *)self locality];
          if (v8)
          {
            BOOL v4 = 0;
          }
          else
          {
            uint64_t v9 = [(GEOStructuredAddress *)self subLocality];
            if (v9)
            {
              BOOL v4 = 0;
            }
            else
            {
              uint64_t v10 = [(GEOStructuredAddress *)self premises];
              if (v10)
              {
                BOOL v4 = 0;
              }
              else
              {
                uint64_t v11 = [(GEOStructuredAddress *)self thoroughfare];
                if (v11)
                {
                  BOOL v4 = 0;
                }
                else
                {
                  uint64_t v12 = [(GEOStructuredAddress *)self subThoroughfare];
                  if (v12)
                  {
                    BOOL v4 = 0;
                  }
                  else
                  {
                    objc_super v13 = [(GEOStructuredAddress *)self fullThoroughfare];
                    if (v13)
                    {
                      BOOL v4 = 0;
                    }
                    else
                    {
                      int v17 = [(GEOStructuredAddress *)self postCode];
                      if (v17 || [(GEOStructuredAddress *)self areaOfInterestsCount])
                      {
                        BOOL v4 = 0;
                      }
                      else
                      {
                        int v16 = [(GEOStructuredAddress *)self inlandWater];
                        if (v16)
                        {
                          BOOL v4 = 0;
                        }
                        else
                        {
                          NSUInteger v15 = [(GEOStructuredAddress *)self ocean];
                          BOOL v4 = v15 == 0;
                        }
                      }

                      objc_super v13 = 0;
                    }

                    uint64_t v12 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (void)setCountry:(id)a3
{
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (void)setCountryCode:(id)a3
{
}

- (BOOL)hasAdministrativeArea
{
  return self->_administrativeArea != 0;
}

- (void)setAdministrativeArea:(id)a3
{
}

- (BOOL)hasAdministrativeAreaCode
{
  return self->_administrativeAreaCode != 0;
}

- (void)setAdministrativeAreaCode:(id)a3
{
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (BOOL)hasLocality
{
  return self->_locality != 0;
}

- (void)setLocality:(id)a3
{
}

- (void)setPostCode:(id)a3
{
}

- (BOOL)hasSubLocality
{
  return self->_subLocality != 0;
}

- (void)setSubLocality:(id)a3
{
}

- (BOOL)hasPremises
{
  return self->_premises != 0;
}

- (void)setPremises:(id)a3
{
}

- (void)setThoroughfare:(id)a3
{
}

- (void)setSubThoroughfare:(id)a3
{
}

- (BOOL)hasFullThoroughfare
{
  return self->_fullThoroughfare != 0;
}

- (void)setFullThoroughfare:(id)a3
{
}

- (NSString)postCodeExtension
{
  return self->_postCodeExtension;
}

- (void)setPostCodeExtension:(id)a3
{
}

- (void)setAreaOfInterests:(id)a3
{
}

- (void)clearAreaOfInterests
{
}

- (unint64_t)areaOfInterestsCount
{
  return [(NSMutableArray *)self->_areaOfInterests count];
}

- (id)areaOfInterestAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_areaOfInterests objectAtIndex:a3];
}

+ (Class)areaOfInterestType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasInlandWater
{
  return self->_inlandWater != 0;
}

- (void)setInlandWater:(id)a3
{
}

- (BOOL)hasOcean
{
  return self->_ocean != 0;
}

- (void)setOcean:(id)a3
{
}

- (NSMutableArray)dependentLocalitys
{
  return self->_dependentLocalitys;
}

- (void)setDependentLocalitys:(id)a3
{
}

- (void)clearDependentLocalitys
{
}

- (unint64_t)dependentLocalitysCount
{
  return [(NSMutableArray *)self->_dependentLocalitys count];
}

- (id)dependentLocalityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dependentLocalitys objectAtIndex:a3];
}

+ (Class)dependentLocalityType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPremise
{
  return self->_premise != 0;
}

- (NSString)premise
{
  return self->_premise;
}

- (void)setPremise:(id)a3
{
}

- (NSMutableArray)subPremises
{
  return self->_subPremises;
}

- (void)setSubPremises:(id)a3
{
}

- (void)clearSubPremises
{
}

- (void)addSubPremise:(id)a3
{
  id v4 = a3;
  subPremises = self->_subPremises;
  id v8 = v4;
  if (!subPremises)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_subPremises;
    self->_subPremises = v6;

    id v4 = v8;
    subPremises = self->_subPremises;
  }
  [(NSMutableArray *)subPremises addObject:v4];
}

- (id)subPremiseAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subPremises objectAtIndex:a3];
}

+ (Class)subPremiseType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPostCodeFull
{
  return self->_postCodeFull != 0;
}

- (void)setPostCodeFull:(id)a3
{
}

- (unint64_t)geoIdsCount
{
  return self->_geoIds.count;
}

- (int64_t)geoIds
{
  return self->_geoIds.list;
}

- (void)clearGeoIds
{
}

- (void)addGeoId:(int64_t)a3
{
}

- (int64_t)geoIdAtIndex:(unint64_t)a3
{
  p_geoIds = &self->_geoIds;
  unint64_t count = self->_geoIds.count;
  if (count <= a3)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    uint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_geoIds->list[a3];
}

- (void)setGeoIds:(int64_t *)a3 count:(unint64_t)a4
{
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStructuredAddress;
  id v4 = [(GEOStructuredAddress *)&v8 description];
  uint64_t v5 = [(GEOStructuredAddress *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStructuredAddress _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [(id)a1 country];
    if (v5) {
      [v4 setObject:v5 forKey:@"country"];
    }

    id v6 = [(id)a1 countryCode];
    if (v6) {
      [v4 setObject:v6 forKey:@"countryCode"];
    }

    uint64_t v7 = [(id)a1 administrativeArea];
    if (v7) {
      [v4 setObject:v7 forKey:@"administrativeArea"];
    }

    objc_super v8 = [(id)a1 administrativeAreaCode];
    if (v8) {
      [v4 setObject:v8 forKey:@"administrativeAreaCode"];
    }

    uint64_t v9 = [(id)a1 subAdministrativeArea];
    if (v9) {
      [v4 setObject:v9 forKey:@"subAdministrativeArea"];
    }

    uint64_t v10 = [(id)a1 locality];
    if (v10) {
      [v4 setObject:v10 forKey:@"locality"];
    }

    uint64_t v11 = [(id)a1 postCode];
    if (v11) {
      [v4 setObject:v11 forKey:@"postCode"];
    }

    uint64_t v12 = [(id)a1 subLocality];
    if (v12) {
      [v4 setObject:v12 forKey:@"subLocality"];
    }

    objc_super v13 = [(id)a1 premises];
    if (v13) {
      [v4 setObject:v13 forKey:@"premises"];
    }

    int v14 = [(id)a1 thoroughfare];
    if (v14) {
      [v4 setObject:v14 forKey:@"thoroughfare"];
    }

    NSUInteger v15 = [(id)a1 subThoroughfare];
    if (v15) {
      [v4 setObject:v15 forKey:@"subThoroughfare"];
    }

    int v16 = [(id)a1 fullThoroughfare];
    if (v16) {
      [v4 setObject:v16 forKey:@"fullThoroughfare"];
    }

    int v17 = [(id)a1 postCodeExtension];
    if (v17) {
      [v4 setObject:v17 forKey:@"postCodeExtension"];
    }

    if (*(void *)(a1 + 56))
    {
      uint64_t v18 = [(id)a1 areaOfInterests];
      [v4 setObject:v18 forKey:@"areaOfInterest"];
    }
    uint64_t v19 = [(id)a1 inlandWater];
    if (v19) {
      [v4 setObject:v19 forKey:@"inlandWater"];
    }

    int v20 = [(id)a1 ocean];
    if (v20) {
      [v4 setObject:v20 forKey:@"ocean"];
    }

    if (*(void *)(a1 + 80))
    {
      uint64_t v21 = [(id)a1 dependentLocalitys];
      [v4 setObject:v21 forKey:@"dependentLocality"];
    }
    uint64_t v22 = [(id)a1 premise];
    if (v22) {
      [v4 setObject:v22 forKey:@"premise"];
    }

    if ([*(id *)(a1 + 176) count])
    {
      int v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v24 = *(id *)(a1 + 176);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v43 != v27) {
              objc_enumerationMutation(v24);
            }
            long long v29 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            long long v30 = [v29 dictionaryRepresentation];
            }
            [v23 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v26);
      }

      [v4 setObject:v23 forKey:@"subPremise"];
    }
    long long v31 = [(id)a1 postCodeFull];
    if (v31) {
      [v4 setObject:v31 forKey:@"postCodeFull"];
    }

    if (*(void *)(a1 + 24))
    {
      long long v32 = PBRepeatedInt64NSArray();
      [v4 setObject:v32 forKey:@"geoId"];
    }
    uint64_t v33 = *(void **)(a1 + 8);
    if (v33)
    {
      uint64_t v34 = [v33 dictionaryRepresentation];
      uint64_t v35 = v34;
      if (a2)
      {
        uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v34, "count"));
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __50__GEOStructuredAddress__dictionaryRepresentation___block_invoke;
        v40[3] = &unk_1E53D8860;
        id v37 = v36;
        id v41 = v37;
        [v35 enumerateKeysAndObjectsUsingBlock:v40];
        id v38 = v37;

        uint64_t v35 = v38;
      }
      [v4 setObject:v35 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOStructuredAddress _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOStructuredAddress__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOStructuredAddress)initWithDictionary:(id)a3
{
  return (GEOStructuredAddress *)-[GEOStructuredAddress _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"country"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = (void *)[v6 copy];
        [a1 setCountry:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"countryCode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = (void *)[v8 copy];
        [a1 setCountryCode:v9];
      }
      id v10 = [v5 objectForKeyedSubscript:@"administrativeArea"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = (void *)[v10 copy];
        [a1 setAdministrativeArea:v11];
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:@"administrativeAreaCode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v13 = (void *)[v12 copy];
        [a1 setAdministrativeAreaCode:v13];
      }
      int v14 = [v5 objectForKeyedSubscript:@"subAdministrativeArea"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        NSUInteger v15 = (void *)[v14 copy];
        [a1 setSubAdministrativeArea:v15];
      }
      int v16 = [v5 objectForKeyedSubscript:@"locality"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v17 = (void *)[v16 copy];
        [a1 setLocality:v17];
      }
      uint64_t v18 = [v5 objectForKeyedSubscript:@"postCode"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = (void *)[v18 copy];
        [a1 setPostCode:v19];
      }
      int v20 = [v5 objectForKeyedSubscript:@"subLocality"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = (void *)[v20 copy];
        [a1 setSubLocality:v21];
      }
      uint64_t v22 = [v5 objectForKeyedSubscript:@"premises"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v23 = (void *)[v22 copy];
        [a1 setPremises:v23];
      }
      id v24 = [v5 objectForKeyedSubscript:@"thoroughfare"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = (void *)[v24 copy];
        [a1 setThoroughfare:v25];
      }
      uint64_t v26 = [v5 objectForKeyedSubscript:@"subThoroughfare"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v27 = (void *)[v26 copy];
        [a1 setSubThoroughfare:v27];
      }
      long long v28 = [v5 objectForKeyedSubscript:@"fullThoroughfare"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v29 = (void *)[v28 copy];
        [a1 setFullThoroughfare:v29];
      }
      long long v30 = [v5 objectForKeyedSubscript:@"postCodeExtension"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v31 = (void *)[v30 copy];
        [a1 setPostCodeExtension:v31];
      }
      long long v32 = [v5 objectForKeyedSubscript:@"areaOfInterest"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v88 objects:v95 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v89;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v89 != v36) {
                objc_enumerationMutation(v33);
              }
              id v38 = *(void **)(*((void *)&v88 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v39 = (void *)[v38 copy];
                [a1 addAreaOfInterest:v39];
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v88 objects:v95 count:16];
          }
          while (v35);
        }
      }
      uint64_t v40 = [v5 objectForKeyedSubscript:@"inlandWater"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v41 = (void *)[v40 copy];
        [a1 setInlandWater:v41];
      }
      long long v42 = [v5 objectForKeyedSubscript:@"ocean"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v43 = (void *)[v42 copy];
        [a1 setOcean:v43];
      }
      long long v44 = [v5 objectForKeyedSubscript:@"dependentLocality"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v45 = v44;
        uint64_t v46 = [v45 countByEnumeratingWithState:&v84 objects:v94 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v85;
          do
          {
            for (uint64_t j = 0; j != v47; ++j)
            {
              if (*(void *)v85 != v48) {
                objc_enumerationMutation(v45);
              }
              v50 = *(void **)(*((void *)&v84 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v51 = (void *)[v50 copy];
                [a1 addDependentLocality:v51];
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v84 objects:v94 count:16];
          }
          while (v47);
        }
      }
      uint64_t v52 = [v5 objectForKeyedSubscript:@"premise"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v53 = (void *)[v52 copy];
        [a1 setPremise:v53];
      }
      uint64_t v54 = [v5 objectForKeyedSubscript:@"subPremise"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v74 = v54;
        id v75 = v5;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v55 = v54;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v80 objects:v93 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = *(void *)v81;
          do
          {
            for (uint64_t k = 0; k != v57; ++k)
            {
              if (*(void *)v81 != v58) {
                objc_enumerationMutation(v55);
              }
              uint64_t v60 = *(void *)(*((void *)&v80 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v61 = [GEOSubPremise alloc];
                if (a3) {
                  uint64_t v62 = [(GEOSubPremise *)v61 initWithJSON:v60];
                }
                else {
                  uint64_t v62 = [(GEOSubPremise *)v61 initWithDictionary:v60];
                }
                long long v63 = (void *)v62;
                objc_msgSend(a1, "addSubPremise:", v62, v74, v75);
              }
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v80 objects:v93 count:16];
          }
          while (v57);
        }

        uint64_t v54 = v74;
        id v5 = v75;
      }

      long long v64 = [v5 objectForKeyedSubscript:@"postCodeFull"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v65 = (void *)[v64 copy];
        [a1 setPostCodeFull:v65];
      }
      long long v66 = [v5 objectForKeyedSubscript:@"geoId"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v67 = v66;
        uint64_t v68 = [v67 countByEnumeratingWithState:&v76 objects:v92 count:16];
        if (v68)
        {
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v77;
          do
          {
            for (uint64_t m = 0; m != v69; ++m)
            {
              if (*(void *)v77 != v70) {
                objc_enumerationMutation(v67);
              }
              v72 = *(void **)(*((void *)&v76 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addGeoId:", objc_msgSend(v72, "longLongValue"));
              }
            }
            uint64_t v69 = [v67 countByEnumeratingWithState:&v76 objects:v92 count:16];
          }
          while (v69);
        }
      }
    }
  }

  return a1;
}

- (GEOStructuredAddress)initWithJSON:(id)a3
{
  return (GEOStructuredAddress *)-[GEOStructuredAddress _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStructuredAddressIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStructuredAddressReadAllFrom(self, a3);
}

- (void)copyTo:(id)a3
{
  id v19 = a3;
  if (self->_country) {
    objc_msgSend(v19, "setCountry:");
  }
  if (self->_countryCode) {
    objc_msgSend(v19, "setCountryCode:");
  }
  if (self->_administrativeArea) {
    objc_msgSend(v19, "setAdministrativeArea:");
  }
  if (self->_administrativeAreaCode) {
    objc_msgSend(v19, "setAdministrativeAreaCode:");
  }
  if (self->_subAdministrativeArea) {
    objc_msgSend(v19, "setSubAdministrativeArea:");
  }
  if (self->_locality) {
    objc_msgSend(v19, "setLocality:");
  }
  if (self->_postCode) {
    objc_msgSend(v19, "setPostCode:");
  }
  if (self->_subLocality) {
    objc_msgSend(v19, "setSubLocality:");
  }
  if (self->_premises) {
    objc_msgSend(v19, "setPremises:");
  }
  if (self->_thoroughfare) {
    objc_msgSend(v19, "setThoroughfare:");
  }
  if (self->_subThoroughfare) {
    objc_msgSend(v19, "setSubThoroughfare:");
  }
  if (self->_fullThoroughfare) {
    objc_msgSend(v19, "setFullThoroughfare:");
  }
  if (self->_postCodeExtension) {
    objc_msgSend(v19, "setPostCodeExtension:");
  }
  if ([(GEOStructuredAddress *)self areaOfInterestsCount])
  {
    [v19 clearAreaOfInterests];
    unint64_t v4 = [(GEOStructuredAddress *)self areaOfInterestsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOStructuredAddress *)self areaOfInterestAtIndex:i];
        [v19 addAreaOfInterest:v7];
      }
    }
  }
  if (self->_inlandWater) {
    objc_msgSend(v19, "setInlandWater:");
  }
  if (self->_ocean) {
    objc_msgSend(v19, "setOcean:");
  }
  if ([(GEOStructuredAddress *)self dependentLocalitysCount])
  {
    [v19 clearDependentLocalitys];
    unint64_t v8 = [(GEOStructuredAddress *)self dependentLocalitysCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOStructuredAddress *)self dependentLocalityAtIndex:j];
        [v19 addDependentLocality:v11];
      }
    }
  }
  if (self->_premise) {
    objc_msgSend(v19, "setPremise:");
  }
  if ([(GEOStructuredAddress *)self subPremisesCount])
  {
    [v19 clearSubPremises];
    unint64_t v12 = [(GEOStructuredAddress *)self subPremisesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        NSUInteger v15 = [(GEOStructuredAddress *)self subPremiseAtIndex:k];
        [v19 addSubPremise:v15];
      }
    }
  }
  if (self->_postCodeFull) {
    objc_msgSend(v19, "setPostCodeFull:");
  }
  if ([(GEOStructuredAddress *)self geoIdsCount])
  {
    [v19 clearGeoIds];
    unint64_t v16 = [(GEOStructuredAddress *)self geoIdsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
        objc_msgSend(v19, "addGeoId:", -[GEOStructuredAddress geoIdAtIndex:](self, "geoIdAtIndex:", m));
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  country = self->_country;
  if ((unint64_t)country | v4[9])
  {
    if (!-[NSString isEqual:](country, "isEqual:")) {
      goto LABEL_43;
    }
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | v4[8] && !-[NSString isEqual:](countryCode, "isEqual:")) {
    goto LABEL_43;
  }
  administrativeArea = self->_administrativeArea;
  if ((unint64_t)administrativeArea | v4[6]
    && !-[NSString isEqual:](administrativeArea, "isEqual:"))
  {
    goto LABEL_43;
  }
  administrativeAreaCode = self->_administrativeAreaCode;
  if ((unint64_t)administrativeAreaCode | v4[5]
    && !-[NSString isEqual:](administrativeAreaCode, "isEqual:"))
  {
    goto LABEL_43;
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if ((unint64_t)subAdministrativeArea | v4[20]
    && !-[NSString isEqual:](subAdministrativeArea, "isEqual:"))
  {
    goto LABEL_43;
  }
  locality = self->_locality;
  if ((unint64_t)locality | v4[13] && !-[NSString isEqual:](locality, "isEqual:")) {
    goto LABEL_43;
  }
  postCode = self->_postCode;
  if ((unint64_t)postCode | v4[17] && !-[NSString isEqual:](postCode, "isEqual:")) {
    goto LABEL_43;
  }
  subLocality = self->_subLocality;
  if ((unint64_t)subLocality | v4[21] && !-[NSString isEqual:](subLocality, "isEqual:")) {
    goto LABEL_43;
  }
  premises = self->_premises;
  if ((unint64_t)premises | v4[18] && !-[NSString isEqual:](premises, "isEqual:")) {
    goto LABEL_43;
  }
  thoroughfare = self->_thoroughfare;
  if ((unint64_t)thoroughfare | v4[24] && !-[NSString isEqual:](thoroughfare, "isEqual:")) {
    goto LABEL_43;
  }
  subThoroughfare = self->_subThoroughfare;
  if ((unint64_t)subThoroughfare | v4[23] && !-[NSString isEqual:](subThoroughfare, "isEqual:")) {
    goto LABEL_43;
  }
  fullThoroughfare = self->_fullThoroughfare;
  if ((unint64_t)fullThoroughfare | v4[11] && !-[NSString isEqual:](fullThoroughfare, "isEqual:")) {
    goto LABEL_43;
  }
  postCodeExtension = self->_postCodeExtension;
  if ((unint64_t)postCodeExtension | v4[15]
    && !-[NSString isEqual:](postCodeExtension, "isEqual:"))
  {
    goto LABEL_43;
  }
  if (((areaOfInterests = self->_areaOfInterests, !((unint64_t)areaOfInterests | v4[7]))
     || -[NSMutableArray isEqual:](areaOfInterests, "isEqual:"))
    && ((inlandWater = self->_inlandWater, !((unint64_t)inlandWater | v4[12]))
     || -[NSString isEqual:](inlandWater, "isEqual:"))
    && ((ocean = self->_ocean, !((unint64_t)ocean | v4[14]))
     || -[NSString isEqual:](ocean, "isEqual:"))
    && ((dependentLocalitys = self->_dependentLocalitys, !((unint64_t)dependentLocalitys | v4[10]))
     || -[NSMutableArray isEqual:](dependentLocalitys, "isEqual:"))
    && ((premise = self->_premise, !((unint64_t)premise | v4[19]))
     || -[NSString isEqual:](premise, "isEqual:"))
    && ((subPremises = self->_subPremises, !((unint64_t)subPremises | v4[22]))
     || -[NSMutableArray isEqual:](subPremises, "isEqual:"))
    && ((postCodeFull = self->_postCodeFull, !((unint64_t)postCodeFull | v4[16]))
     || -[NSString isEqual:](postCodeFull, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt64IsEqual();
  }
  else
  {
LABEL_43:
    char IsEqual = 0;
  }

  return IsEqual;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 9)) {
    -[GEOStructuredAddress setCountry:](self, "setCountry:");
  }
  if (*((void *)v4 + 8)) {
    -[GEOStructuredAddress setCountryCode:](self, "setCountryCode:");
  }
  if (*((void *)v4 + 6)) {
    -[GEOStructuredAddress setAdministrativeArea:](self, "setAdministrativeArea:");
  }
  if (*((void *)v4 + 5)) {
    -[GEOStructuredAddress setAdministrativeAreaCode:](self, "setAdministrativeAreaCode:");
  }
  if (*((void *)v4 + 20)) {
    -[GEOStructuredAddress setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  }
  if (*((void *)v4 + 13)) {
    -[GEOStructuredAddress setLocality:](self, "setLocality:");
  }
  if (*((void *)v4 + 17)) {
    -[GEOStructuredAddress setPostCode:](self, "setPostCode:");
  }
  if (*((void *)v4 + 21)) {
    -[GEOStructuredAddress setSubLocality:](self, "setSubLocality:");
  }
  if (*((void *)v4 + 18)) {
    -[GEOStructuredAddress setPremises:](self, "setPremises:");
  }
  if (*((void *)v4 + 24)) {
    -[GEOStructuredAddress setThoroughfare:](self, "setThoroughfare:");
  }
  if (*((void *)v4 + 23)) {
    -[GEOStructuredAddress setSubThoroughfare:](self, "setSubThoroughfare:");
  }
  if (*((void *)v4 + 11)) {
    -[GEOStructuredAddress setFullThoroughfare:](self, "setFullThoroughfare:");
  }
  if (*((void *)v4 + 15)) {
    -[GEOStructuredAddress setPostCodeExtension:](self, "setPostCodeExtension:");
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOStructuredAddress *)self addAreaOfInterest:*(void *)(*((void *)&v31 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 12)) {
    -[GEOStructuredAddress setInlandWater:](self, "setInlandWater:");
  }
  if (*((void *)v4 + 14)) {
    -[GEOStructuredAddress setOcean:](self, "setOcean:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = *((id *)v4 + 10);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOStructuredAddress *)self addDependentLocality:*(void *)(*((void *)&v27 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 19)) {
    -[GEOStructuredAddress setPremise:](self, "setPremise:");
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = *((id *)v4 + 22);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        -[GEOStructuredAddress addSubPremise:](self, "addSubPremise:", *(void *)(*((void *)&v23 + 1) + 8 * k), (void)v23);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v17);
  }

  if (*((void *)v4 + 16)) {
    -[GEOStructuredAddress setPostCodeFull:](self, "setPostCodeFull:");
  }
  uint64_t v20 = objc_msgSend(v4, "geoIdsCount", (void)v23);
  if (v20)
  {
    uint64_t v21 = v20;
    for (uint64_t m = 0; m != v21; ++m)
      -[GEOStructuredAddress addGeoId:](self, "addGeoId:", [v4 geoIdAtIndex:m]);
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_subPremises;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

@end