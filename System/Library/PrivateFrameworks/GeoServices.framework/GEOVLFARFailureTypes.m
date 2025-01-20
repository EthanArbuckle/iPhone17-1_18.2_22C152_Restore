@interface GEOVLFARFailureTypes
+ (BOOL)isValid:(id)a3;
- (BOOL)arWalkingNoLabels;
- (BOOL)arWalkingUndulationFailure;
- (BOOL)hasArWalkingNoLabels;
- (BOOL)hasArWalkingUndulationFailure;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFARFailureTypes)initWithDictionary:(id)a3;
- (GEOVLFARFailureTypes)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArWalkingNoLabels:(BOOL)a3;
- (void)setArWalkingUndulationFailure:(BOOL)a3;
- (void)setHasArWalkingNoLabels:(BOOL)a3;
- (void)setHasArWalkingUndulationFailure:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFARFailureTypes

- (BOOL)arWalkingNoLabels
{
  return self->_arWalkingNoLabels;
}

- (void)setArWalkingNoLabels:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_arWalkingNoLabels = a3;
}

- (void)setHasArWalkingNoLabels:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasArWalkingNoLabels
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)arWalkingUndulationFailure
{
  return self->_arWalkingUndulationFailure;
}

- (void)setArWalkingUndulationFailure:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_arWalkingUndulationFailure = a3;
}

- (void)setHasArWalkingUndulationFailure:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasArWalkingUndulationFailure
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFARFailureTypes;
  v4 = [(GEOVLFARFailureTypes *)&v8 description];
  v5 = [(GEOVLFARFailureTypes *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFARFailureTypes _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    unsigned __int8 v5 = a1[12];
    if (v5)
    {
      v6 = [NSNumber numberWithBool:a1[8]];
      if (a2) {
        v7 = @"arWalkingNoLabels";
      }
      else {
        v7 = @"ar_walking_no_labels";
      }
      [v4 setObject:v6 forKey:v7];

      unsigned __int8 v5 = a1[12];
    }
    if ((v5 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithBool:a1[9]];
      if (a2) {
        v9 = @"arWalkingUndulationFailure";
      }
      else {
        v9 = @"ar_walking_undulation_failure";
      }
      [v4 setObject:v8 forKey:v9];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFARFailureTypes _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOVLFARFailureTypes)initWithDictionary:(id)a3
{
  return (GEOVLFARFailureTypes *)-[GEOVLFARFailureTypes _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"arWalkingNoLabels";
      }
      else {
        v6 = @"ar_walking_no_labels";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setArWalkingNoLabels:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"arWalkingUndulationFailure";
      }
      else {
        objc_super v8 = @"ar_walking_undulation_failure";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setArWalkingUndulationFailure:", objc_msgSend(v9, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOVLFARFailureTypes)initWithJSON:(id)a3
{
  return (GEOVLFARFailureTypes *)-[GEOVLFARFailureTypes _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFARFailureTypesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFARFailureTypesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if (flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOVLFARFailureTypes *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[8] = self->_arWalkingNoLabels;
    v5[12] |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v5[9] = self->_arWalkingUndulationFailure;
    v5[12] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((unsigned char *)result + 8) = self->_arWalkingNoLabels;
    *((unsigned char *)result + 12) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_arWalkingUndulationFailure;
    *((unsigned char *)result + 12) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEOVLFARFailureTypes *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_12;
    }
    if (self->_arWalkingNoLabels)
    {
      if (!v4[8]) {
        goto LABEL_12;
      }
    }
    else if (v4[8])
    {
      goto LABEL_12;
    }
  }
  else if (v4[12])
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[12] & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_arWalkingUndulationFailure)
      {
        if (!v4[9]) {
          goto LABEL_12;
        }
      }
      else if (v4[9])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  [(GEOVLFARFailureTypes *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_arWalkingNoLabels;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    return v4 ^ v3;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_arWalkingUndulationFailure;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v5 = (BOOL *)a3;
  [v5 readAll:0];
  BOOL v4 = v5[12];
  if (v4)
  {
    self->_arWalkingNoLabels = v5[8];
    *(unsigned char *)&self->_flags |= 1u;
    BOOL v4 = v5[12];
  }
  if ((v4 & 2) != 0)
  {
    self->_arWalkingUndulationFailure = v5[9];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

@end