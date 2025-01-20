@interface ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)styles;
- (int)stylesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)stylesCount;
- (void)addStyles:(int)a3;
- (void)clearStyles;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setStyles:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles;
  [(ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles *)&v3 dealloc];
}

- (unint64_t)stylesCount
{
  return self->_styles.count;
}

- (int)styles
{
  return self->_styles.list;
}

- (void)clearStyles
{
}

- (void)addStyles:(int)a3
{
}

- (int)stylesAtIndex:(unint64_t)a3
{
  p_styles = &self->_styles;
  unint64_t count = self->_styles.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_styles->list[a3];
}

- (void)setStyles:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles;
  v4 = [(ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles *)&v8 description];
  v5 = [(ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  objc_super v3 = PBRepeatedInt32NSArray();
  [v2 setObject:v3 forKey:@"styles"];

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableDatabaseCompetitionPreferredVictoryBadgeStylesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  p_styles = &self->_styles;
  if (self->_styles.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_styles->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles *)self stylesCount])
  {
    [v7 clearStyles];
    unint64_t v4 = [(ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles *)self stylesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addStyles:", -[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles stylesAtIndex:](self, "stylesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]) {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 stylesCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[ASCodableDatabaseCompetitionPreferredVictoryBadgeStyles addStyles:](self, "addStyles:", [v7 stylesAtIndex:i]);
  }
}

@end