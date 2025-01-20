@interface _CPQueryUnderstandingParse
- (BOOL)hasActionTokens;
- (BOOL)hasCaptureDeviceTokens;
- (BOOL)hasEventTokens;
- (BOOL)hasFavoritedTokens;
- (BOOL)hasGenericLocationTokens;
- (BOOL)hasLocationTokens;
- (BOOL)hasMediaTypeTokens;
- (BOOL)hasNounTokens;
- (BOOL)hasPersonSenderTokens;
- (BOOL)hasPersonTokens;
- (BOOL)hasSortCriteriaTokens;
- (BOOL)hasSourceAppTokens;
- (BOOL)hasTimeTokens;
- (BOOL)hasUnspecifiedTokens;
- (BOOL)hasVisualQualityTokens;
- (BOOL)isBlocklistedQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnsafeQuery;
- (BOOL)readFrom:(id)a3;
- (_CPQueryUnderstandingParse)initWithFacade:(id)a3;
- (int)queryIntentType;
- (int)spotlightQueryIntent;
- (unint64_t)hash;
- (void)setHasActionTokens:(BOOL)a3;
- (void)setHasCaptureDeviceTokens:(BOOL)a3;
- (void)setHasEventTokens:(BOOL)a3;
- (void)setHasFavoritedTokens:(BOOL)a3;
- (void)setHasGenericLocationTokens:(BOOL)a3;
- (void)setHasLocationTokens:(BOOL)a3;
- (void)setHasMediaTypeTokens:(BOOL)a3;
- (void)setHasNounTokens:(BOOL)a3;
- (void)setHasPersonSenderTokens:(BOOL)a3;
- (void)setHasPersonTokens:(BOOL)a3;
- (void)setHasSortCriteriaTokens:(BOOL)a3;
- (void)setHasSourceAppTokens:(BOOL)a3;
- (void)setHasTimeTokens:(BOOL)a3;
- (void)setHasUnspecifiedTokens:(BOOL)a3;
- (void)setHasVisualQualityTokens:(BOOL)a3;
- (void)setIsBlocklistedQuery:(BOOL)a3;
- (void)setIsUnsafeQuery:(BOOL)a3;
- (void)setQueryIntentType:(int)a3;
- (void)setSpotlightQueryIntent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _CPQueryUnderstandingParse

- (void)setIsBlocklistedQuery:(BOOL)a3
{
  self->_isBlocklistedQuery = a3;
}

- (BOOL)isBlocklistedQuery
{
  return self->_isBlocklistedQuery;
}

- (void)setIsUnsafeQuery:(BOOL)a3
{
  self->_isUnsafeQuery = a3;
}

- (BOOL)isUnsafeQuery
{
  return self->_isUnsafeQuery;
}

- (void)setSpotlightQueryIntent:(int)a3
{
  self->_spotlightQueryIntent = a3;
}

- (int)spotlightQueryIntent
{
  return self->_spotlightQueryIntent;
}

- (void)setHasPersonSenderTokens:(BOOL)a3
{
  self->_hasPersonSenderTokens = a3;
}

- (BOOL)hasPersonSenderTokens
{
  return self->_hasPersonSenderTokens;
}

- (void)setHasPersonTokens:(BOOL)a3
{
  self->_hasPersonTokens = a3;
}

- (BOOL)hasPersonTokens
{
  return self->_hasPersonTokens;
}

- (void)setHasSourceAppTokens:(BOOL)a3
{
  self->_hasSourceAppTokens = a3;
}

- (BOOL)hasSourceAppTokens
{
  return self->_hasSourceAppTokens;
}

- (void)setHasFavoritedTokens:(BOOL)a3
{
  self->_hasFavoritedTokens = a3;
}

- (BOOL)hasFavoritedTokens
{
  return self->_hasFavoritedTokens;
}

- (void)setHasCaptureDeviceTokens:(BOOL)a3
{
  self->_hasCaptureDeviceTokens = a3;
}

- (BOOL)hasCaptureDeviceTokens
{
  return self->_hasCaptureDeviceTokens;
}

- (void)setHasGenericLocationTokens:(BOOL)a3
{
  self->_hasGenericLocationTokens = a3;
}

- (BOOL)hasGenericLocationTokens
{
  return self->_hasGenericLocationTokens;
}

- (void)setHasEventTokens:(BOOL)a3
{
  self->_hasEventTokens = a3;
}

- (BOOL)hasEventTokens
{
  return self->_hasEventTokens;
}

- (void)setHasTimeTokens:(BOOL)a3
{
  self->_hasTimeTokens = a3;
}

- (BOOL)hasTimeTokens
{
  return self->_hasTimeTokens;
}

- (void)setHasNounTokens:(BOOL)a3
{
  self->_hasNounTokens = a3;
}

- (BOOL)hasNounTokens
{
  return self->_hasNounTokens;
}

- (void)setHasVisualQualityTokens:(BOOL)a3
{
  self->_hasVisualQualityTokens = a3;
}

- (BOOL)hasVisualQualityTokens
{
  return self->_hasVisualQualityTokens;
}

- (void)setHasMediaTypeTokens:(BOOL)a3
{
  self->_hasMediaTypeTokens = a3;
}

- (BOOL)hasMediaTypeTokens
{
  return self->_hasMediaTypeTokens;
}

- (void)setHasActionTokens:(BOOL)a3
{
  self->_hasActionTokens = a3;
}

- (BOOL)hasActionTokens
{
  return self->_hasActionTokens;
}

- (void)setHasLocationTokens:(BOOL)a3
{
  self->_hasLocationTokens = a3;
}

- (BOOL)hasLocationTokens
{
  return self->_hasLocationTokens;
}

- (void)setHasSortCriteriaTokens:(BOOL)a3
{
  self->_hasSortCriteriaTokens = a3;
}

- (BOOL)hasSortCriteriaTokens
{
  return self->_hasSortCriteriaTokens;
}

- (void)setHasUnspecifiedTokens:(BOOL)a3
{
  self->_hasUnspecifiedTokens = a3;
}

- (BOOL)hasUnspecifiedTokens
{
  return self->_hasUnspecifiedTokens;
}

- (void)setQueryIntentType:(int)a3
{
  self->_queryIntentType = a3;
}

- (int)queryIntentType
{
  return self->_queryIntentType;
}

- (unint64_t)hash
{
  return (2654435761 * self->_hasUnspecifiedTokens) ^ (2654435761 * self->_hasSortCriteriaTokens) ^ (2654435761 * self->_queryIntentType) ^ (2654435761 * self->_hasLocationTokens) ^ (2654435761 * self->_hasActionTokens) ^ (2654435761 * self->_hasMediaTypeTokens) ^ (2654435761 * self->_hasVisualQualityTokens) ^ (2654435761 * self->_hasNounTokens) ^ (2654435761 * self->_hasTimeTokens) ^ (2654435761 * self->_hasEventTokens) ^ (2654435761 * self->_hasGenericLocationTokens) ^ (2654435761 * self->_hasCaptureDeviceTokens) ^ (2654435761 * self->_hasFavoritedTokens) ^ (2654435761 * self->_hasSourceAppTokens) ^ (2654435761 * self->_hasPersonTokens) ^ (2654435761 * self->_hasPersonSenderTokens) ^ (2654435761 * self->_spotlightQueryIntent) ^ (2654435761 * self->_isUnsafeQuery) ^ (2654435761 * self->_isBlocklistedQuery);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int queryIntentType = self->_queryIntentType;
  if (queryIntentType != [v4 queryIntentType]) {
    goto LABEL_21;
  }
  int hasUnspecifiedTokens = self->_hasUnspecifiedTokens;
  if (hasUnspecifiedTokens != [v4 hasUnspecifiedTokens]) {
    goto LABEL_21;
  }
  int hasSortCriteriaTokens = self->_hasSortCriteriaTokens;
  if (hasSortCriteriaTokens != [v4 hasSortCriteriaTokens]) {
    goto LABEL_21;
  }
  int hasLocationTokens = self->_hasLocationTokens;
  if (hasLocationTokens != [v4 hasLocationTokens]) {
    goto LABEL_21;
  }
  int hasActionTokens = self->_hasActionTokens;
  if (hasActionTokens != [v4 hasActionTokens]) {
    goto LABEL_21;
  }
  int hasMediaTypeTokens = self->_hasMediaTypeTokens;
  if (hasMediaTypeTokens != [v4 hasMediaTypeTokens]) {
    goto LABEL_21;
  }
  int hasVisualQualityTokens = self->_hasVisualQualityTokens;
  if (hasVisualQualityTokens != [v4 hasVisualQualityTokens]) {
    goto LABEL_21;
  }
  int hasNounTokens = self->_hasNounTokens;
  if (hasNounTokens != [v4 hasNounTokens]) {
    goto LABEL_21;
  }
  int hasTimeTokens = self->_hasTimeTokens;
  if (hasTimeTokens != [v4 hasTimeTokens]) {
    goto LABEL_21;
  }
  int hasEventTokens = self->_hasEventTokens;
  if (hasEventTokens != [v4 hasEventTokens]) {
    goto LABEL_21;
  }
  int hasGenericLocationTokens = self->_hasGenericLocationTokens;
  if (hasGenericLocationTokens != [v4 hasGenericLocationTokens]) {
    goto LABEL_21;
  }
  int hasCaptureDeviceTokens = self->_hasCaptureDeviceTokens;
  if (hasCaptureDeviceTokens == [v4 hasCaptureDeviceTokens]
    && (int hasFavoritedTokens = self->_hasFavoritedTokens,
        hasFavoritedTokens == [v4 hasFavoritedTokens])
    && (int hasSourceAppTokens = self->_hasSourceAppTokens,
        hasSourceAppTokens == [v4 hasSourceAppTokens])
    && (int hasPersonTokens = self->_hasPersonTokens, hasPersonTokens == [v4 hasPersonTokens])
    && (int hasPersonSenderTokens = self->_hasPersonSenderTokens,
        hasPersonSenderTokens == [v4 hasPersonSenderTokens])
    && (int spotlightQueryIntent = self->_spotlightQueryIntent,
        spotlightQueryIntent == [v4 spotlightQueryIntent])
    && (int isUnsafeQuery = self->_isUnsafeQuery, isUnsafeQuery == [v4 isUnsafeQuery]))
  {
    int isBlocklistedQuery = self->_isBlocklistedQuery;
    BOOL v24 = isBlocklistedQuery == [v4 isBlocklistedQuery];
  }
  else
  {
LABEL_21:
    BOOL v24 = 0;
  }

  return v24;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_CPQueryUnderstandingParse *)self queryIntentType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPQueryUnderstandingParse *)self hasUnspecifiedTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasSortCriteriaTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasLocationTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasActionTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasMediaTypeTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasVisualQualityTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasNounTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasTimeTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasEventTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasGenericLocationTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasCaptureDeviceTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasFavoritedTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasSourceAppTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasPersonTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self hasPersonSenderTokens]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self spotlightQueryIntent]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_CPQueryUnderstandingParse *)self isUnsafeQuery]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_CPQueryUnderstandingParse *)self isBlocklistedQuery]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _CPQueryUnderstandingParseReadFrom(self, (uint64_t)a3);
}

- (_CPQueryUnderstandingParse)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_CPQueryUnderstandingParse *)self init];
  if (v5)
  {
    -[_CPQueryUnderstandingParse setQueryIntentType:](v5, "setQueryIntentType:", [v4 queryIntentType]);
    -[_CPQueryUnderstandingParse setHasUnspecifiedTokens:](v5, "setHasUnspecifiedTokens:", [v4 hasUnspecifiedTokens]);
    -[_CPQueryUnderstandingParse setHasSortCriteriaTokens:](v5, "setHasSortCriteriaTokens:", [v4 hasSortCriteriaTokens]);
    -[_CPQueryUnderstandingParse setHasLocationTokens:](v5, "setHasLocationTokens:", [v4 hasLocationTokens]);
    -[_CPQueryUnderstandingParse setHasPersonTokens:](v5, "setHasPersonTokens:", [v4 hasPersonTokens]);
    -[_CPQueryUnderstandingParse setHasPersonSenderTokens:](v5, "setHasPersonSenderTokens:", [v4 hasPersonSenderTokens]);
    -[_CPQueryUnderstandingParse setHasActionTokens:](v5, "setHasActionTokens:", [v4 hasActionTokens]);
    -[_CPQueryUnderstandingParse setHasMediaTypeTokens:](v5, "setHasMediaTypeTokens:", [v4 hasMediaTypeTokens]);
    -[_CPQueryUnderstandingParse setHasVisualQualityTokens:](v5, "setHasVisualQualityTokens:", [v4 hasVisualQualityTokens]);
    -[_CPQueryUnderstandingParse setHasNounTokens:](v5, "setHasNounTokens:", [v4 hasNounTokens]);
    -[_CPQueryUnderstandingParse setHasTimeTokens:](v5, "setHasTimeTokens:", [v4 hasTimeTokens]);
    -[_CPQueryUnderstandingParse setHasEventTokens:](v5, "setHasEventTokens:", [v4 hasEventTokens]);
    -[_CPQueryUnderstandingParse setHasGenericLocationTokens:](v5, "setHasGenericLocationTokens:", [v4 hasGenericLocationTokens]);
    -[_CPQueryUnderstandingParse setHasCaptureDeviceTokens:](v5, "setHasCaptureDeviceTokens:", [v4 hasCaptureDeviceTokens]);
    -[_CPQueryUnderstandingParse setHasFavoritedTokens:](v5, "setHasFavoritedTokens:", [v4 hasFavoritedTokens]);
    -[_CPQueryUnderstandingParse setHasSourceAppTokens:](v5, "setHasSourceAppTokens:", [v4 hasSourceAppTokens]);
    v6 = v5;
  }

  return v5;
}

@end