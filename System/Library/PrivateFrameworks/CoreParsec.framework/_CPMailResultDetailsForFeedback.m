@interface _CPMailResultDetailsForFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_CPMailResultDetailsForFeedback)initWithFacade:(id)a3;
- (float)suggestionScore;
- (int)dataSources;
- (int)skgMegadomeSpotlightIndexEntries;
- (unint64_t)hash;
- (void)setDataSources:(int)a3;
- (void)setSkgMegadomeSpotlightIndexEntries:(int)a3;
- (void)setSuggestionScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPMailResultDetailsForFeedback

- (void)setSkgMegadomeSpotlightIndexEntries:(int)a3
{
  self->_skgMegadomeSpotlightIndexEntries = a3;
}

- (int)skgMegadomeSpotlightIndexEntries
{
  return self->_skgMegadomeSpotlightIndexEntries;
}

- (void)setSuggestionScore:(float)a3
{
  self->_suggestionScore = a3;
}

- (float)suggestionScore
{
  return self->_suggestionScore;
}

- (void)setDataSources:(int)a3
{
  self->_dataSources = a3;
}

- (int)dataSources
{
  return self->_dataSources;
}

- (unint64_t)hash
{
  float suggestionScore = self->_suggestionScore;
  double v4 = suggestionScore;
  if (suggestionScore < 0.0) {
    double v4 = -suggestionScore;
  }
  long double v5 = round(v4);
  uint64_t v2 = 2654435761 * self->_dataSources;
  return (2654435761 * self->_skgMegadomeSpotlightIndexEntries) ^ v2 ^ ((unint64_t)(fmod(v5, 1.84467441e19)
                                                                                           * 2654435760.0)
                                                                        + vcvtd_n_u64_f64(v4 - v5, 0x40uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int dataSources = self->_dataSources, dataSources == [v4 dataSources])
    && (float suggestionScore = self->_suggestionScore, [v4 suggestionScore], suggestionScore == v7))
  {
    int skgMegadomeSpotlightIndexEntries = self->_skgMegadomeSpotlightIndexEntries;
    BOOL v8 = skgMegadomeSpotlightIndexEntries == [v4 skgMegadomeSpotlightIndexEntries];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  a3;
  if ([(_CPMailResultDetailsForFeedback *)self dataSources]) {
    PBDataWriterWriteInt32Field();
  }
  [(_CPMailResultDetailsForFeedback *)self suggestionScore];
  if (v4 != 0.0) {
    PBDataWriterWriteFloatField();
  }
  if ([(_CPMailResultDetailsForFeedback *)self skgMegadomeSpotlightIndexEntries]) {
    PBDataWriterWriteInt32Field();
  }

  MEMORY[0x1F4181820]();
}

- (BOOL)readFrom:(id)a3
{
  return _CPMailResultDetailsForFeedbackReadFrom(self, (uint64_t)a3, v3);
}

- (_CPMailResultDetailsForFeedback)initWithFacade:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CPMailResultDetailsForFeedback;
  long double v5 = [(_CPMailResultDetailsForFeedback *)&v12 init];
  if (v5)
  {
    -[_CPMailResultDetailsForFeedback setDataSources:](v5, "setDataSources:", [v4 dataSources]);
    v6 = [v4 suggestionScore];

    if (v6)
    {
      float v7 = [v4 suggestionScore];
      [v7 floatValue];
      -[_CPMailResultDetailsForFeedback setSuggestionScore:](v5, "setSuggestionScore:");
    }
    BOOL v8 = [v4 skgMegadomeSpotlightIndexEntries];

    if (v8)
    {
      v9 = [v4 skgMegadomeSpotlightIndexEntries];
      -[_CPMailResultDetailsForFeedback setSkgMegadomeSpotlightIndexEntries:](v5, "setSkgMegadomeSpotlightIndexEntries:", [v9 intValue]);
    }
    v10 = v5;
  }

  return v5;
}

@end