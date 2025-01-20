@interface GEOPDClientRankingFeatureFunctionTypeDiscrete
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

@implementation GEOPDClientRankingFeatureFunctionTypeDiscrete

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(float *)(v4 + 20) = self->_featureValueThresholdLow;
    *(unsigned char *)(v4 + 32) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(float *)(v4 + 16) = self->_featureValueThresholdHigh;
      *(unsigned char *)(v4 + 32) |= 1u;
      if ((*(unsigned char *)&self->_flags & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 28) = self->_featureWeightLow;
  *(unsigned char *)(v4 + 32) |= 8u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 4) != 0)
  {
LABEL_5:
    *(float *)(v4 + 24) = self->_featureWeightHigh;
    *(unsigned char *)(v4 + 32) |= 4u;
  }
LABEL_6:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteFloatField();
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteFloatField();
LABEL_6:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureFunctionTypeDiscrete;
  uint64_t v4 = [(GEOPDClientRankingFeatureFunctionTypeDiscrete *)&v8 description];
  id v5 = [(GEOPDClientRankingFeatureFunctionTypeDiscrete *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureFunctionTypeDiscrete _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    uint64_t v4 = 0;
    goto LABEL_14;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v6 = *(unsigned char *)(a1 + 32);
  if ((v6 & 2) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 20);
    v16 = [NSNumber numberWithFloat:v5];
    if (a2) {
      v17 = @"featureValueThresholdLow";
    }
    else {
      v17 = @"feature_value_threshold_low";
    }
    [v4 setObject:v16 forKey:v17];

    char v6 = *(unsigned char *)(a1 + 32);
    if ((v6 & 8) == 0)
    {
LABEL_4:
      if ((v6 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)(a1 + 32) & 8) == 0)
  {
    goto LABEL_4;
  }
  LODWORD(v5) = *(_DWORD *)(a1 + 28);
  v18 = [NSNumber numberWithFloat:v5];
  if (a2) {
    v19 = @"featureWeightLow";
  }
  else {
    v19 = @"feature_weight_low";
  }
  [v4 setObject:v18 forKey:v19];

  char v6 = *(unsigned char *)(a1 + 32);
  if ((v6 & 1) == 0)
  {
LABEL_5:
    if ((v6 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_6;
  }
LABEL_25:
  LODWORD(v5) = *(_DWORD *)(a1 + 16);
  v20 = [NSNumber numberWithFloat:v5];
  if (a2) {
    v21 = @"featureValueThresholdHigh";
  }
  else {
    v21 = @"feature_value_threshold_high";
  }
  [v4 setObject:v20 forKey:v21];

  if ((*(unsigned char *)(a1 + 32) & 4) != 0)
  {
LABEL_6:
    LODWORD(v5) = *(_DWORD *)(a1 + 24);
    v7 = [NSNumber numberWithFloat:v5];
    if (a2) {
      objc_super v8 = @"featureWeightHigh";
    }
    else {
      objc_super v8 = @"feature_weight_high";
    }
    [v4 setObject:v7 forKey:v8];
  }
LABEL_10:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    v10 = [v9 dictionaryRepresentation];
    v11 = v10;
    if (a2)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __75__GEOPDClientRankingFeatureFunctionTypeDiscrete__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E53D8860;
      id v13 = v12;
      id v23 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v22];
      id v14 = v13;

      v11 = v14;
    }
    [v4 setObject:v11 forKey:@"Unknown Fields"];
  }
LABEL_14:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDClientRankingFeatureFunctionTypeDiscrete _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __75__GEOPDClientRankingFeatureFunctionTypeDiscrete__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      v7 = @"featureValueThresholdLow";
    }
    else {
      v7 = @"feature_value_threshold_low";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 floatValue];
      *(unsigned char *)(v6 + 32) |= 2u;
      *(_DWORD *)(v6 + 20) = v9;
    }

    if (a3) {
      id v10 = @"featureWeightLow";
    }
    else {
      id v10 = @"feature_weight_low";
    }
    v11 = [v5 objectForKeyedSubscript:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      *(unsigned char *)(v6 + 32) |= 8u;
      *(_DWORD *)(v6 + 28) = v12;
    }

    if (a3) {
      id v13 = @"featureValueThresholdHigh";
    }
    else {
      id v13 = @"feature_value_threshold_high";
    }
    id v14 = [v5 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      *(unsigned char *)(v6 + 32) |= 1u;
      *(_DWORD *)(v6 + 16) = v15;
    }

    if (a3) {
      v16 = @"featureWeightHigh";
    }
    else {
      v16 = @"feature_weight_high";
    }
    v17 = [v5 objectForKeyedSubscript:v16];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v17 floatValue];
      *(unsigned char *)(v6 + 32) |= 4u;
      *(_DWORD *)(v6 + 24) = v18;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureFunctionTypeDiscreteReadAllFrom((uint64_t)self, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_featureValueThresholdLow != *((float *)v4 + 5)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_featureWeightLow != *((float *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_featureValueThresholdHigh != *((float *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_featureWeightHigh != *((float *)v4 + 6)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    float featureValueThresholdLow = self->_featureValueThresholdLow;
    double v6 = featureValueThresholdLow;
    if (featureValueThresholdLow < 0.0) {
      double v6 = -featureValueThresholdLow;
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
  if ((flags & 8) != 0)
  {
    float featureWeightLow = self->_featureWeightLow;
    double v11 = featureWeightLow;
    if (featureWeightLow < 0.0) {
      double v11 = -featureWeightLow;
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
  if (flags)
  {
    float featureValueThresholdHigh = self->_featureValueThresholdHigh;
    double v16 = featureValueThresholdHigh;
    if (featureValueThresholdHigh < 0.0) {
      double v16 = -featureValueThresholdHigh;
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
  if ((flags & 4) != 0)
  {
    float featureWeightHigh = self->_featureWeightHigh;
    double v21 = featureWeightHigh;
    if (featureWeightHigh < 0.0) {
      double v21 = -featureWeightHigh;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19;
}

- (void).cxx_destruct
{
}

@end