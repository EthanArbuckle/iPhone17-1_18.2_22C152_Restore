@interface HDCodableUserDomainConcept
+ (Class)codingsType;
+ (Class)linksType;
+ (Class)localizedStringPropertiesType;
+ (Class)namedQuantitiesType;
+ (Class)propertiesType;
- (BOOL)deleted;
- (BOOL)hasBuild;
- (BOOL)hasCreationDate;
- (BOOL)hasDeleted;
- (BOOL)hasIdentifier;
- (BOOL)hasLinksData;
- (BOOL)hasMajorVersion;
- (BOOL)hasMinorVersion;
- (BOOL)hasModificationDate;
- (BOOL)hasOntologyLocalizedEducationContent;
- (BOOL)hasPatchVersion;
- (BOOL)hasSyncIdentity;
- (BOOL)hasTypeData;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableOntologyLocalizedEducationContent)ontologyLocalizedEducationContent;
- (HDCodableSyncIdentity)syncIdentity;
- (HDCodableUserDomainConceptTypeIdentifier)identifier;
- (NSData)linksData;
- (NSData)typeData;
- (NSData)uuid;
- (NSMutableArray)codings;
- (NSMutableArray)links;
- (NSMutableArray)localizedStringProperties;
- (NSMutableArray)namedQuantities;
- (NSMutableArray)properties;
- (NSString)build;
- (double)creationDate;
- (double)modificationDate;
- (id)codingsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)linksAtIndex:(unint64_t)a3;
- (id)localizedStringPropertiesAtIndex:(unint64_t)a3;
- (id)namedQuantitiesAtIndex:(unint64_t)a3;
- (id)propertiesAtIndex:(unint64_t)a3;
- (int)majorVersion;
- (int)minorVersion;
- (int)patchVersion;
- (unint64_t)codingsCount;
- (unint64_t)hash;
- (unint64_t)linksCount;
- (unint64_t)localizedStringPropertiesCount;
- (unint64_t)namedQuantitiesCount;
- (unint64_t)propertiesCount;
- (void)addCodings:(id)a3;
- (void)addLinks:(id)a3;
- (void)addLocalizedStringProperties:(id)a3;
- (void)addNamedQuantities:(id)a3;
- (void)addProperties:(id)a3;
- (void)clearCodings;
- (void)clearLinks;
- (void)clearLocalizedStringProperties;
- (void)clearNamedQuantities;
- (void)clearProperties;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuild:(id)a3;
- (void)setCodings:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasDeleted:(BOOL)a3;
- (void)setHasMajorVersion:(BOOL)a3;
- (void)setHasMinorVersion:(BOOL)a3;
- (void)setHasModificationDate:(BOOL)a3;
- (void)setHasPatchVersion:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLinks:(id)a3;
- (void)setLinksData:(id)a3;
- (void)setLocalizedStringProperties:(id)a3;
- (void)setMajorVersion:(int)a3;
- (void)setMinorVersion:(int)a3;
- (void)setModificationDate:(double)a3;
- (void)setNamedQuantities:(id)a3;
- (void)setOntologyLocalizedEducationContent:(id)a3;
- (void)setPatchVersion:(int)a3;
- (void)setProperties:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTypeData:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableUserDomainConcept

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setModificationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_modificationDate = a3;
}

- (void)setHasModificationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModificationDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeleted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_deleted = a3;
}

- (void)setHasDeleted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDeleted
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (void)setMajorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_majorVersion = a3;
}

- (void)setHasMajorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMajorVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMinorVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_minorVersion = a3;
}

- (void)setHasMinorVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinorVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPatchVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_patchVersion = a3;
}

- (void)setHasPatchVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPatchVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasLinksData
{
  return self->_linksData != 0;
}

- (void)clearCodings
{
}

- (void)addCodings:(id)a3
{
  id v4 = a3;
  codings = self->_codings;
  id v8 = v4;
  if (!codings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_codings;
    self->_codings = v6;

    id v4 = v8;
    codings = self->_codings;
  }
  [(NSMutableArray *)codings addObject:v4];
}

- (unint64_t)codingsCount
{
  return [(NSMutableArray *)self->_codings count];
}

- (id)codingsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_codings objectAtIndex:a3];
}

+ (Class)codingsType
{
  return (Class)objc_opt_class();
}

- (void)clearLinks
{
}

- (void)addLinks:(id)a3
{
  id v4 = a3;
  links = self->_links;
  id v8 = v4;
  if (!links)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_links;
    self->_links = v6;

    id v4 = v8;
    links = self->_links;
  }
  [(NSMutableArray *)links addObject:v4];
}

- (unint64_t)linksCount
{
  return [(NSMutableArray *)self->_links count];
}

- (id)linksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_links objectAtIndex:a3];
}

+ (Class)linksType
{
  return (Class)objc_opt_class();
}

- (void)clearProperties
{
}

- (void)addProperties:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  id v8 = v4;
  if (!properties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_properties;
    self->_properties = v6;

    id v4 = v8;
    properties = self->_properties;
  }
  [(NSMutableArray *)properties addObject:v4];
}

- (unint64_t)propertiesCount
{
  return [(NSMutableArray *)self->_properties count];
}

- (id)propertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_properties objectAtIndex:a3];
}

+ (Class)propertiesType
{
  return (Class)objc_opt_class();
}

- (void)clearLocalizedStringProperties
{
}

- (void)addLocalizedStringProperties:(id)a3
{
  id v4 = a3;
  localizedStringProperties = self->_localizedStringProperties;
  id v8 = v4;
  if (!localizedStringProperties)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_localizedStringProperties;
    self->_localizedStringProperties = v6;

    id v4 = v8;
    localizedStringProperties = self->_localizedStringProperties;
  }
  [(NSMutableArray *)localizedStringProperties addObject:v4];
}

- (unint64_t)localizedStringPropertiesCount
{
  return [(NSMutableArray *)self->_localizedStringProperties count];
}

- (id)localizedStringPropertiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_localizedStringProperties objectAtIndex:a3];
}

+ (Class)localizedStringPropertiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasOntologyLocalizedEducationContent
{
  return self->_ontologyLocalizedEducationContent != 0;
}

- (void)clearNamedQuantities
{
}

- (void)addNamedQuantities:(id)a3
{
  id v4 = a3;
  namedQuantities = self->_namedQuantities;
  id v8 = v4;
  if (!namedQuantities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_namedQuantities;
    self->_namedQuantities = v6;

    id v4 = v8;
    namedQuantities = self->_namedQuantities;
  }
  [(NSMutableArray *)namedQuantities addObject:v4];
}

- (unint64_t)namedQuantitiesCount
{
  return [(NSMutableArray *)self->_namedQuantities count];
}

- (id)namedQuantitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_namedQuantities objectAtIndex:a3];
}

+ (Class)namedQuantitiesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
}

- (BOOL)hasTypeData
{
  return self->_typeData != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableUserDomainConcept;
  id v4 = [(HDCodableUserDomainConcept *)&v8 description];
  v5 = [(HDCodableUserDomainConcept *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  identifier = self->_identifier;
  if (identifier)
  {
    v7 = [(HDCodableUserDomainConceptTypeIdentifier *)identifier dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v55 = [NSNumber numberWithDouble:self->_creationDate];
    [v4 setObject:v55 forKey:@"creationDate"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v56 = [NSNumber numberWithDouble:self->_modificationDate];
  [v4 setObject:v56 forKey:@"modificationDate"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v9 = [NSNumber numberWithBool:self->_deleted];
    [v4 setObject:v9 forKey:@"deleted"];
  }
LABEL_9:
  build = self->_build;
  if (build) {
    [v4 setObject:build forKey:@"build"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 4) != 0)
  {
    v57 = [NSNumber numberWithInt:self->_majorVersion];
    [v4 setObject:v57 forKey:@"majorVersion"];

    char v11 = (char)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_13:
      if ((v11 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  v58 = [NSNumber numberWithInt:self->_minorVersion];
  [v4 setObject:v58 forKey:@"minorVersion"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v12 = [NSNumber numberWithInt:self->_patchVersion];
    [v4 setObject:v12 forKey:@"patchVersion"];
  }
LABEL_15:
  linksData = self->_linksData;
  if (linksData) {
    [v4 setObject:linksData forKey:@"linksData"];
  }
  if ([(NSMutableArray *)self->_codings count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_codings, "count"));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v15 = self->_codings;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v75 objects:v83 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v76;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v76 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v75 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v75 objects:v83 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"codings"];
  }
  if ([(NSMutableArray *)self->_links count])
  {
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_links, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v22 = self->_links;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v71 objects:v82 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v72;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v72 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v71 + 1) + 8 * j) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v71 objects:v82 count:16];
      }
      while (v24);
    }

    [v4 setObject:v21 forKey:@"links"];
  }
  if ([(NSMutableArray *)self->_properties count])
  {
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_properties, "count"));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v29 = self->_properties;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v67 objects:v81 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v68;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v68 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v67 + 1) + 8 * k) dictionaryRepresentation];
          [v28 addObject:v34];
        }
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v67 objects:v81 count:16];
      }
      while (v31);
    }

    [v4 setObject:v28 forKey:@"properties"];
  }
  if ([(NSMutableArray *)self->_localizedStringProperties count])
  {
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_localizedStringProperties, "count"));
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v36 = self->_localizedStringProperties;
    uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v63 objects:v80 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v64;
      do
      {
        for (uint64_t m = 0; m != v38; ++m)
        {
          if (*(void *)v64 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = [*(id *)(*((void *)&v63 + 1) + 8 * m) dictionaryRepresentation];
          [v35 addObject:v41];
        }
        uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v63 objects:v80 count:16];
      }
      while (v38);
    }

    [v4 setObject:v35 forKey:@"localizedStringProperties"];
  }
  ontologyLocalizedEducationContent = self->_ontologyLocalizedEducationContent;
  if (ontologyLocalizedEducationContent)
  {
    v43 = [(HDCodableOntologyLocalizedEducationContent *)ontologyLocalizedEducationContent dictionaryRepresentation];
    [v4 setObject:v43 forKey:@"ontologyLocalizedEducationContent"];
  }
  if ([(NSMutableArray *)self->_namedQuantities count])
  {
    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_namedQuantities, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v45 = self->_namedQuantities;
    uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v59 objects:v79 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v60;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v60 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * n), "dictionaryRepresentation", (void)v59);
          [v44 addObject:v50];
        }
        uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v59 objects:v79 count:16];
      }
      while (v47);
    }

    [v4 setObject:v44 forKey:@"namedQuantities"];
  }
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    v52 = [(HDCodableSyncIdentity *)syncIdentity dictionaryRepresentation];
    [v4 setObject:v52 forKey:@"syncIdentity"];
  }
  typeData = self->_typeData;
  if (typeData) {
    [v4 setObject:typeData forKey:@"typeData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableUserDomainConceptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteDataField();
  }
  if (self->_identifier) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
  if (self->_build) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_14:
  }
    PBDataWriterWriteInt32Field();
LABEL_15:
  if (self->_linksData) {
    PBDataWriterWriteDataField();
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v7 = self->_codings;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v9);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v12 = self->_links;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v14);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v17 = self->_properties;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v19);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v22 = self->_localizedStringProperties;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v24);
  }

  if (self->_ontologyLocalizedEducationContent) {
    PBDataWriterWriteSubmessage();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v27 = self->_namedQuantities;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v29);
  }

  if (self->_syncIdentity) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_typeData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v28 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v28;
  }
  if (self->_identifier)
  {
    objc_msgSend(v28, "setIdentifier:");
    id v4 = v28;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_creationDate;
    *((unsigned char *)v4 + 140) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = *(void *)&self->_modificationDate;
  *((unsigned char *)v4 + 140) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 136) = self->_deleted;
    *((unsigned char *)v4 + 140) |= 0x20u;
  }
LABEL_9:
  if (self->_build)
  {
    objc_msgSend(v28, "setBuild:");
    id v4 = v28;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_majorVersion;
    *((unsigned char *)v4 + 140) |= 4u;
    char v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 19) = self->_minorVersion;
  *((unsigned char *)v4 + 140) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *((_DWORD *)v4 + 24) = self->_patchVersion;
    *((unsigned char *)v4 + 140) |= 0x10u;
  }
LABEL_15:
  if (self->_linksData) {
    objc_msgSend(v28, "setLinksData:");
  }
  if ([(HDCodableUserDomainConcept *)self codingsCount])
  {
    [v28 clearCodings];
    unint64_t v7 = [(HDCodableUserDomainConcept *)self codingsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(HDCodableUserDomainConcept *)self codingsAtIndex:i];
        [v28 addCodings:v10];
      }
    }
  }
  if ([(HDCodableUserDomainConcept *)self linksCount])
  {
    [v28 clearLinks];
    unint64_t v11 = [(HDCodableUserDomainConcept *)self linksCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(HDCodableUserDomainConcept *)self linksAtIndex:j];
        [v28 addLinks:v14];
      }
    }
  }
  if ([(HDCodableUserDomainConcept *)self propertiesCount])
  {
    [v28 clearProperties];
    unint64_t v15 = [(HDCodableUserDomainConcept *)self propertiesCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t k = 0; k != v16; ++k)
      {
        uint64_t v18 = [(HDCodableUserDomainConcept *)self propertiesAtIndex:k];
        [v28 addProperties:v18];
      }
    }
  }
  if ([(HDCodableUserDomainConcept *)self localizedStringPropertiesCount])
  {
    [v28 clearLocalizedStringProperties];
    unint64_t v19 = [(HDCodableUserDomainConcept *)self localizedStringPropertiesCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        v22 = [(HDCodableUserDomainConcept *)self localizedStringPropertiesAtIndex:m];
        [v28 addLocalizedStringProperties:v22];
      }
    }
  }
  if (self->_ontologyLocalizedEducationContent) {
    objc_msgSend(v28, "setOntologyLocalizedEducationContent:");
  }
  if ([(HDCodableUserDomainConcept *)self namedQuantitiesCount])
  {
    [v28 clearNamedQuantities];
    unint64_t v23 = [(HDCodableUserDomainConcept *)self namedQuantitiesCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (uint64_t n = 0; n != v24; ++n)
      {
        v26 = [(HDCodableUserDomainConcept *)self namedQuantitiesAtIndex:n];
        [v28 addNamedQuantities:v26];
      }
    }
  }
  if (self->_syncIdentity) {
    objc_msgSend(v28, "setSyncIdentity:");
  }
  v27 = v28;
  if (self->_typeData)
  {
    objc_msgSend(v28, "setTypeData:");
    v27 = v28;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v6;

  id v8 = [(HDCodableUserDomainConceptTypeIdentifier *)self->_identifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(unsigned char *)(v5 + 140) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_modificationDate;
  *(unsigned char *)(v5 + 140) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 136) = self->_deleted;
    *(unsigned char *)(v5 + 140) |= 0x20u;
  }
LABEL_5:
  uint64_t v11 = [(NSString *)self->_build copyWithZone:a3];
  unint64_t v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  char v13 = (char)self->_has;
  if ((v13 & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_majorVersion;
    *(unsigned char *)(v5 + 140) |= 4u;
    char v13 = (char)self->_has;
    if ((v13 & 8) == 0)
    {
LABEL_7:
      if ((v13 & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 76) = self->_minorVersion;
  *(unsigned char *)(v5 + 140) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 96) = self->_patchVersion;
    *(unsigned char *)(v5 + 140) |= 0x10u;
  }
LABEL_9:
  uint64_t v14 = [(NSData *)self->_linksData copyWithZone:a3];
  unint64_t v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  unint64_t v16 = self->_codings;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v70 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addCodings:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v18);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v22 = self->_links;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v66 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addLinks:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v24);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v28 = self->_properties;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v62 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addProperties:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v30);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v34 = self->_localizedStringProperties;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v58 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * m) copyWithZone:a3];
        [(id)v5 addLocalizedStringProperties:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v57 objects:v74 count:16];
    }
    while (v36);
  }

  id v40 = [(HDCodableOntologyLocalizedEducationContent *)self->_ontologyLocalizedEducationContent copyWithZone:a3];
  long long v41 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v40;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v42 = self->_namedQuantities;
  uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v53 objects:v73 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v54;
    do
    {
      for (uint64_t n = 0; n != v44; ++n)
      {
        if (*(void *)v54 != v45) {
          objc_enumerationMutation(v42);
        }
        long long v47 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * n), "copyWithZone:", a3, (void)v53);
        [(id)v5 addNamedQuantities:v47];
      }
      uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v53 objects:v73 count:16];
    }
    while (v44);
  }

  id v48 = [(HDCodableSyncIdentity *)self->_syncIdentity copyWithZone:a3];
  long long v49 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v48;

  uint64_t v50 = [(NSData *)self->_typeData copyWithZone:a3];
  long long v51 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v50;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 16))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_60;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[HDCodableUserDomainConceptTypeIdentifier isEqual:](identifier, "isEqual:")) {
      goto LABEL_60;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 140);
  if (has)
  {
    if ((*((unsigned char *)v4 + 140) & 1) == 0 || self->_creationDate != *((double *)v4 + 1)) {
      goto LABEL_60;
    }
  }
  else if (*((unsigned char *)v4 + 140))
  {
    goto LABEL_60;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 140) & 2) == 0 || self->_modificationDate != *((double *)v4 + 2)) {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 140) & 0x20) == 0) {
      goto LABEL_60;
    }
    if (self->_deleted)
    {
      if (!*((unsigned char *)v4 + 136)) {
        goto LABEL_60;
      }
    }
    else if (*((unsigned char *)v4 + 136))
    {
      goto LABEL_60;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 0x20) != 0)
  {
    goto LABEL_60;
  }
  build = self->_build;
  if (!((unint64_t)build | *((void *)v4 + 3))) {
    goto LABEL_27;
  }
  if (!-[NSString isEqual:](build, "isEqual:"))
  {
LABEL_60:
    char v19 = 0;
    goto LABEL_61;
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 140);
LABEL_27:
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_majorVersion != *((_DWORD *)v4 + 18)) {
      goto LABEL_60;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_minorVersion != *((_DWORD *)v4 + 19)) {
      goto LABEL_60;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_patchVersion != *((_DWORD *)v4 + 24)) {
      goto LABEL_60;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  linksData = self->_linksData;
  if ((unint64_t)linksData | *((void *)v4 + 7) && !-[NSData isEqual:](linksData, "isEqual:")) {
    goto LABEL_60;
  }
  codings = self->_codings;
  if ((unint64_t)codings | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](codings, "isEqual:")) {
      goto LABEL_60;
    }
  }
  links = self->_links;
  if ((unint64_t)links | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](links, "isEqual:")) {
      goto LABEL_60;
    }
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](properties, "isEqual:")) {
      goto LABEL_60;
    }
  }
  localizedStringProperties = self->_localizedStringProperties;
  if ((unint64_t)localizedStringProperties | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](localizedStringProperties, "isEqual:")) {
      goto LABEL_60;
    }
  }
  ontologyLocalizedEducationContent = self->_ontologyLocalizedEducationContent;
  if ((unint64_t)ontologyLocalizedEducationContent | *((void *)v4 + 11))
  {
    if (!-[HDCodableOntologyLocalizedEducationContent isEqual:](ontologyLocalizedEducationContent, "isEqual:")) {
      goto LABEL_60;
    }
  }
  namedQuantities = self->_namedQuantities;
  if ((unint64_t)namedQuantities | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](namedQuantities, "isEqual:")) {
      goto LABEL_60;
    }
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((void *)v4 + 14))
  {
    if (!-[HDCodableSyncIdentity isEqual:](syncIdentity, "isEqual:")) {
      goto LABEL_60;
    }
  }
  typeData = self->_typeData;
  if ((unint64_t)typeData | *((void *)v4 + 15)) {
    char v19 = -[NSData isEqual:](typeData, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_61:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  unint64_t v4 = [(HDCodableUserDomainConceptTypeIdentifier *)self->_identifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double creationDate = self->_creationDate;
    double v8 = -creationDate;
    if (creationDate >= 0.0) {
      double v8 = self->_creationDate;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 2) != 0)
  {
    double modificationDate = self->_modificationDate;
    double v13 = -modificationDate;
    if (modificationDate >= 0.0) {
      double v13 = self->_modificationDate;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if ((has & 0x20) != 0) {
    uint64_t v16 = 2654435761 * self->_deleted;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_build hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v18 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_22;
    }
LABEL_25:
    uint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v20 = 0;
    goto LABEL_27;
  }
  uint64_t v18 = 2654435761 * self->_majorVersion;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_25;
  }
LABEL_22:
  uint64_t v19 = 2654435761 * self->_minorVersion;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v20 = 2654435761 * self->_patchVersion;
LABEL_27:
  unint64_t v21 = v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17;
  uint64_t v22 = v18 ^ v19 ^ v20 ^ [(NSData *)self->_linksData hash];
  uint64_t v23 = v21 ^ v22 ^ [(NSMutableArray *)self->_codings hash];
  uint64_t v24 = [(NSMutableArray *)self->_links hash];
  uint64_t v25 = v24 ^ [(NSMutableArray *)self->_properties hash];
  uint64_t v26 = v25 ^ [(NSMutableArray *)self->_localizedStringProperties hash];
  unint64_t v27 = v23 ^ v26 ^ [(HDCodableOntologyLocalizedEducationContent *)self->_ontologyLocalizedEducationContent hash];
  uint64_t v28 = [(NSMutableArray *)self->_namedQuantities hash];
  unint64_t v29 = v28 ^ [(HDCodableSyncIdentity *)self->_syncIdentity hash];
  return v27 ^ v29 ^ [(NSData *)self->_typeData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 16)) {
    -[HDCodableUserDomainConcept setUuid:](self, "setUuid:");
  }
  identifier = self->_identifier;
  uint64_t v6 = *((void *)v4 + 5);
  if (identifier)
  {
    if (v6) {
      -[HDCodableUserDomainConceptTypeIdentifier mergeFrom:](identifier, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HDCodableUserDomainConcept setIdentifier:](self, "setIdentifier:");
  }
  char v7 = *((unsigned char *)v4 + 140);
  if (v7)
  {
    self->_double creationDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 140);
    if ((v7 & 2) == 0)
    {
LABEL_10:
      if ((v7 & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 2) == 0)
  {
    goto LABEL_10;
  }
  self->_double modificationDate = *((double *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 140) & 0x20) != 0)
  {
LABEL_11:
    self->_deleted = *((unsigned char *)v4 + 136);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_12:
  if (*((void *)v4 + 3)) {
    -[HDCodableUserDomainConcept setBuild:](self, "setBuild:");
  }
  char v8 = *((unsigned char *)v4 + 140);
  if ((v8 & 4) != 0)
  {
    self->_majorVersiouint64_t n = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 4u;
    char v8 = *((unsigned char *)v4 + 140);
    if ((v8 & 8) == 0)
    {
LABEL_16:
      if ((v8 & 0x10) == 0) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 140) & 8) == 0)
  {
    goto LABEL_16;
  }
  self->_minorVersiouint64_t n = *((_DWORD *)v4 + 19);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 140) & 0x10) != 0)
  {
LABEL_17:
    self->_patchVersiouint64_t n = *((_DWORD *)v4 + 24);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_18:
  if (*((void *)v4 + 7)) {
    -[HDCodableUserDomainConcept setLinksData:](self, "setLinksData:");
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v9 = *((id *)v4 + 4);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v55 != v12) {
          objc_enumerationMutation(v9);
        }
        [(HDCodableUserDomainConcept *)self addCodings:*(void *)(*((void *)&v54 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v11);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v14 = *((id *)v4 + 6);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v14);
        }
        [(HDCodableUserDomainConcept *)self addLinks:*(void *)(*((void *)&v50 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v16);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = *((id *)v4 + 13);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v19);
        }
        [(HDCodableUserDomainConcept *)self addProperties:*(void *)(*((void *)&v46 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v21);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v24 = *((id *)v4 + 8);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v43;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(v24);
        }
        [(HDCodableUserDomainConcept *)self addLocalizedStringProperties:*(void *)(*((void *)&v42 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v59 count:16];
    }
    while (v26);
  }

  ontologyLocalizedEducationContent = self->_ontologyLocalizedEducationContent;
  uint64_t v30 = *((void *)v4 + 11);
  if (ontologyLocalizedEducationContent)
  {
    if (v30) {
      -[HDCodableOntologyLocalizedEducationContent mergeFrom:](ontologyLocalizedEducationContent, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[HDCodableUserDomainConcept setOntologyLocalizedEducationContent:](self, "setOntologyLocalizedEducationContent:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v31 = *((id *)v4 + 10);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v58 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        -[HDCodableUserDomainConcept addNamedQuantities:](self, "addNamedQuantities:", *(void *)(*((void *)&v38 + 1) + 8 * n), (void)v38);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v38 objects:v58 count:16];
    }
    while (v33);
  }

  syncIdentity = self->_syncIdentity;
  uint64_t v37 = *((void *)v4 + 14);
  if (syncIdentity)
  {
    if (v37) {
      -[HDCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[HDCodableUserDomainConcept setSyncIdentity:](self, "setSyncIdentity:");
  }
  if (*((void *)v4 + 15)) {
    -[HDCodableUserDomainConcept setTypeData:](self, "setTypeData:");
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (HDCodableUserDomainConceptTypeIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (int)majorVersion
{
  return self->_majorVersion;
}

- (int)minorVersion
{
  return self->_minorVersion;
}

- (int)patchVersion
{
  return self->_patchVersion;
}

- (NSData)linksData
{
  return self->_linksData;
}

- (void)setLinksData:(id)a3
{
}

- (NSMutableArray)codings
{
  return self->_codings;
}

- (void)setCodings:(id)a3
{
}

- (NSMutableArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (NSMutableArray)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSMutableArray)localizedStringProperties
{
  return self->_localizedStringProperties;
}

- (void)setLocalizedStringProperties:(id)a3
{
}

- (HDCodableOntologyLocalizedEducationContent)ontologyLocalizedEducationContent
{
  return self->_ontologyLocalizedEducationContent;
}

- (void)setOntologyLocalizedEducationContent:(id)a3
{
}

- (NSMutableArray)namedQuantities
{
  return self->_namedQuantities;
}

- (void)setNamedQuantities:(id)a3
{
}

- (HDCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- (NSData)typeData
{
  return self->_typeData;
}

- (void)setTypeData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_typeData, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_ontologyLocalizedEducationContent, 0);
  objc_storeStrong((id *)&self->_namedQuantities, 0);
  objc_storeStrong((id *)&self->_localizedStringProperties, 0);
  objc_storeStrong((id *)&self->_linksData, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_codings, 0);

  objc_storeStrong((id *)&self->_build, 0);
}

@end