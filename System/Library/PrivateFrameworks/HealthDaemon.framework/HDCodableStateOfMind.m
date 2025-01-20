@interface HDCodableStateOfMind
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasContext;
- (BOOL)hasReflectiveInterval;
- (BOOL)hasSample;
- (BOOL)hasValence;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSString)context;
- (NSString)description;
- (double)valence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)domains;
- (int64_t)domainsAtIndex:(unint64_t)a3;
- (int64_t)labels;
- (int64_t)labelsAtIndex:(unint64_t)a3;
- (int64_t)reflectiveInterval;
- (unint64_t)domainsCount;
- (unint64_t)hash;
- (unint64_t)labelsCount;
- (void)addDomains:(int64_t)a3;
- (void)addLabels:(int64_t)a3;
- (void)clearDomains;
- (void)clearLabels;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setContext:(id)a3;
- (void)setDomains:(int64_t *)a3 count:(unint64_t)a4;
- (void)setHasReflectiveInterval:(BOOL)a3;
- (void)setHasValence:(BOOL)a3;
- (void)setLabels:(int64_t *)a3 count:(unint64_t)a4;
- (void)setReflectiveInterval:(int64_t)a3;
- (void)setSample:(id)a3;
- (void)setValence:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableStateOfMind

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HDCodableStateOfMind;
  [(HDCodableStateOfMind *)&v3 dealloc];
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setReflectiveInterval:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reflectiveInterval = a3;
}

- (void)setHasReflectiveInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReflectiveInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setValence:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_valence = a3;
}

- (void)setHasValence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)labelsCount
{
  return self->_labels.count;
}

- (int64_t)labels
{
  return self->_labels.list;
}

- (void)clearLabels
{
}

- (void)addLabels:(int64_t)a3
{
}

- (int64_t)labelsAtIndex:(unint64_t)a3
{
  p_labels = &self->_labels;
  unint64_t count = self->_labels.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_labels->list[a3];
}

- (void)setLabels:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)domainsCount
{
  return self->_domains.count;
}

- (int64_t)domains
{
  return self->_domains.list;
}

- (void)clearDomains
{
}

- (void)addDomains:(int64_t)a3
{
}

- (int64_t)domainsAtIndex:(unint64_t)a3
{
  p_domains = &self->_domains;
  unint64_t count = self->_domains.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_domains->list[a3];
}

- (void)setDomains:(int64_t *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableStateOfMind;
  v4 = [(HDCodableStateOfMind *)&v8 description];
  v5 = [(HDCodableStateOfMind *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v7 = [NSNumber numberWithLongLong:self->_reflectiveInterval];
    [v3 setObject:v7 forKey:@"reflectiveInterval"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_valence];
    [v3 setObject:v8 forKey:@"valence"];
  }
  v9 = PBRepeatedInt64NSArray();
  [v3 setObject:v9 forKey:@"labels"];

  v10 = PBRepeatedInt64NSArray();
  [v3 setObject:v10 forKey:@"domains"];

  context = self->_context;
  if (context) {
    [v3 setObject:context forKey:@"context"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableStateOfMindReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v8;
  }
  if (self->_labels.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v8;
      ++v6;
    }
    while (v6 < self->_labels.count);
  }
  if (self->_domains.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < self->_domains.count);
  }
  if (self->_context)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v12;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 7) = self->_reflectiveInterval;
    *((unsigned char *)v4 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 8) = *(void *)&self->_valence;
    *((unsigned char *)v4 + 88) |= 2u;
  }
  if ([(HDCodableStateOfMind *)self labelsCount])
  {
    [v12 clearLabels];
    unint64_t v6 = [(HDCodableStateOfMind *)self labelsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v12, "addLabels:", -[HDCodableStateOfMind labelsAtIndex:](self, "labelsAtIndex:", i));
    }
  }
  if ([(HDCodableStateOfMind *)self domainsCount])
  {
    [v12 clearDomains];
    unint64_t v9 = [(HDCodableStateOfMind *)self domainsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v12, "addDomains:", -[HDCodableStateOfMind domainsAtIndex:](self, "domainsAtIndex:", j));
    }
  }
  if (self->_context) {
    objc_msgSend(v12, "setContext:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 56) = self->_reflectiveInterval;
    *(unsigned char *)(v5 + 88) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 64) = self->_valence;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  uint64_t v9 = [(NSString *)self->_context copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 10))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_reflectiveInterval != *((void *)v4 + 7)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_18:
    char v7 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_valence != *((double *)v4 + 8)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_18;
  }
  if (!PBRepeatedInt64IsEqual() || !PBRepeatedInt64IsEqual()) {
    goto LABEL_18;
  }
  context = self->_context;
  if ((unint64_t)context | *((void *)v4 + 9)) {
    char v7 = -[NSString isEqual:](context, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_19:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_reflectiveInterval;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double valence = self->_valence;
  double v6 = -valence;
  if (valence >= 0.0) {
    double v6 = self->_valence;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  unint64_t v10 = v4 ^ v3;
  uint64_t v11 = v9 ^ PBRepeatedInt64Hash();
  uint64_t v12 = v11 ^ PBRepeatedInt64Hash();
  return v10 ^ v12 ^ [(NSString *)self->_context hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 10);
  v15 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableStateOfMind setSample:](self, "setSample:");
  }
  id v4 = v15;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 88);
  if (v7)
  {
    self->_reflectiveInterval = *((void *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 88);
  }
  if ((v7 & 2) != 0)
  {
    self->_double valence = *((double *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v8 = [v4 labelsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[HDCodableStateOfMind addLabels:](self, "addLabels:", [v15 labelsAtIndex:i]);
  }
  uint64_t v11 = [v15 domainsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
      -[HDCodableStateOfMind addDomains:](self, "addDomains:", [v15 domainsAtIndex:j]);
  }
  v14 = v15;
  if (v15[9])
  {
    -[HDCodableStateOfMind setContext:](self, "setContext:");
    v14 = v15;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (int64_t)reflectiveInterval
{
  return self->_reflectiveInterval;
}

- (double)valence
{
  return self->_valence;
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(HDCodableStateOfMind *)self sample],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 applyToObject:v4],
        v5,
        v6))
  {
    [(HDCodableStateOfMind *)self reflectiveInterval];
    [v4 _setKind:HKStateOfMindKindFromReflectiveInterval()];
    [(HDCodableStateOfMind *)self valence];
    objc_msgSend(v4, "_setValence:");
    char v7 = [MEMORY[0x1E4F1CA48] array];
    if ([(HDCodableStateOfMind *)self labelsCount])
    {
      unint64_t v8 = 0;
      do
      {
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCodableStateOfMind labels](self, "labels")[8 * v8]);
        [v7 addObject:v9];

        ++v8;
      }
      while (v8 < [(HDCodableStateOfMind *)self labelsCount]);
    }
    unint64_t v10 = (void *)[v7 copy];
    [v4 _setLabels:v10];

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    if ([(HDCodableStateOfMind *)self domainsCount])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = NSNumber;
        [(HDCodableStateOfMind *)self domains];
        v14 = [v13 numberWithInteger:HKStateOfMindAssociationFromDomain()];
        [v11 addObject:v14];

        ++v12;
      }
      while (v12 < [(HDCodableStateOfMind *)self domainsCount]);
    }
    v15 = (void *)[v11 copy];
    [v4 _setAssociations:v15];

    v16 = [(HDCodableStateOfMind *)self context];
    [v4 _setContext:v16];

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

@end