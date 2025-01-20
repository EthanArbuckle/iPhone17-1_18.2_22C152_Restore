@interface GEOPDClientRankingFeatureFunctionTypeLinear
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDClientRankingFeatureFunctionTypeLinear

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"featureWeight";
    }
    else {
      v7 = @"feature_weight";
    }
    v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      *(unsigned char *)(v6 + 28) |= 4u;
      *(_DWORD *)(v6 + 24) = v9;
    }

    if (a3) {
      v10 = @"featureMaxRelativeValue";
    }
    else {
      v10 = @"feature_max_relative_value";
    }
    v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      *(unsigned char *)(v6 + 28) |= 1u;
      *(_DWORD *)(v6 + 16) = v12;
    }

    if (a3) {
      v13 = @"featureMeanValue";
    }
    else {
      v13 = @"feature_mean_value";
    }
    v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      *(unsigned char *)(v6 + 28) |= 2u;
      *(_DWORD *)(v6 + 20) = v15;
    }
  }
  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_13;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v6 = *(unsigned char *)(a1 + 28);
  if ((v6 & 4) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 24);
    v16 = [NSNumber numberWithFloat:v5];
    if (a2) {
      v17 = @"featureWeight";
    }
    else {
      v17 = @"feature_weight";
    }
    [v4 setObject:v16 forKey:v17];

    char v6 = *(unsigned char *)(a1 + 28);
    if ((v6 & 1) == 0)
    {
LABEL_4:
      if ((v6 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 1) == 0)
  {
    goto LABEL_4;
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 16);
  v18 = [NSNumber numberWithFloat:v5];
  if (a2) {
    v19 = @"featureMaxRelativeValue";
  }
  else {
    v19 = @"feature_max_relative_value";
  }
  [v4 setObject:v18 forKey:v19];

  if ((*(unsigned char *)(a1 + 28) & 2) != 0)
  {
LABEL_5:
    LODWORD(v5) = *(_DWORD *)(a1 + 20);
    v7 = [NSNumber numberWithFloat:v5];
    if (a2) {
      v8 = @"featureMeanValue";
    }
    else {
      v8 = @"feature_mean_value";
    }
    [v4 setObject:v7 forKey:v8];
  }
LABEL_9:
  int v9 = *(void **)(a1 + 8);
  if (v9)
  {
    v10 = [v9 dictionaryRepresentation];
    v11 = v10;
    if (a2)
    {
      int v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __73__GEOPDClientRankingFeatureFunctionTypeLinear__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E53D8860;
      id v13 = v12;
      id v21 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v20];
      id v14 = v13;

      v11 = v14;
    }
    [v4 setObject:v11 forKey:@"Unknown Fields"];
  }
LABEL_13:

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureFunctionTypeLinear;
  v4 = [(GEOPDClientRankingFeatureFunctionTypeLinear *)&v8 description];
  double v5 = [(GEOPDClientRankingFeatureFunctionTypeLinear *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureFunctionTypeLinear _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureFunctionTypeLinear _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __73__GEOPDClientRankingFeatureFunctionTypeLinear__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    int v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureFunctionTypeLinearReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteFloatField();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(float *)(v4 + 16) = self->_featureMaxRelativeValue;
    *(unsigned char *)(v4 + 28) |= 1u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(float *)(v4 + 24) = self->_featureWeight;
  *(unsigned char *)(v4 + 28) |= 4u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(float *)(v4 + 20) = self->_featureMeanValue;
    *(unsigned char *)(v4 + 28) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_featureWeight != *((float *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_featureMaxRelativeValue != *((float *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_featureMeanValue != *((float *)v4 + 5)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    float featureWeight = self->_featureWeight;
    double v6 = featureWeight;
    if (featureWeight < 0.0) {
      double v6 = -featureWeight;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (flags)
  {
    float featureMaxRelativeValue = self->_featureMaxRelativeValue;
    double v11 = featureMaxRelativeValue;
    if (featureMaxRelativeValue < 0.0) {
      double v11 = -featureMaxRelativeValue;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((flags & 2) != 0)
  {
    float featureMeanValue = self->_featureMeanValue;
    double v16 = featureMeanValue;
    if (featureMeanValue < 0.0) {
      double v16 = -featureMeanValue;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  return v9 ^ v4 ^ v14;
}

- (void).cxx_destruct
{
}

@end