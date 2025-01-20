@interface GEOClientACSuggestionEntry
+ (BOOL)isValid:(id)a3;
- (BOOL)discreteFeatureValuesAvailable;
- (BOOL)hasAge;
- (BOOL)hasAutocompleteResultCellType;
- (BOOL)hasContactRelevanceScore;
- (BOOL)hasDiscreteFeatureValuesAvailable;
- (BOOL)hasDistanceToSuggestion;
- (BOOL)hasDistanceToSuggestionFromViewportCenter;
- (BOOL)hasFractionOfMatch;
- (BOOL)hasHyperlinkMetadata;
- (BOOL)hasIsContactWithHomeLocation;
- (BOOL)hasIsContactWithLiveLocation;
- (BOOL)hasIsContactWithNoLocation;
- (BOOL)hasIsContactWithOtherLocation;
- (BOOL)hasIsContactWithSchoolLocation;
- (BOOL)hasIsContactWithWorkLocation;
- (BOOL)hasIsContainedInViewport;
- (BOOL)hasIsFavorite;
- (BOOL)hasIsProminentResult;
- (BOOL)hasMapsSuggestionsContactRevelanceScore;
- (BOOL)hasMapsSuggestionsIsTouristScore;
- (BOOL)hasMapsSuggestionsPoiRevelanceScore;
- (BOOL)hasMatchedUsingAddress;
- (BOOL)hasMatchedUsingEventName;
- (BOOL)hasMatchedUsingLabel;
- (BOOL)hasMatchedUsingName;
- (BOOL)hasMatchedUsingOrganization;
- (BOOL)hasPeopleSuggesterRank;
- (BOOL)hasPoiOpenState;
- (BOOL)hasPrefixLastTokenMatchCover;
- (BOOL)hasPrefixMatchCover;
- (BOOL)hasPrefixMatchPosition;
- (BOOL)hasPrefixMatchWordBoundary;
- (BOOL)hasPrefixTokenIsNumberFirstQueryToken;
- (BOOL)hasPrefixTokenIsNumberSecondQueryToken;
- (BOOL)hasPrefixTokenMatchLengthFirstQueryToken;
- (BOOL)hasPrefixTokenMatchLengthSecondQueryToken;
- (BOOL)hasPrefixTokenMatchLocationFirstQueryToken;
- (BOOL)hasPrefixTokenMatchLocationSecondQueryToken;
- (BOOL)hasPrefixTokenMatchPositionFirstQueryToken;
- (BOOL)hasPrefixTokenMatchPositionSecondQueryToken;
- (BOOL)hasServerEntryType;
- (BOOL)hasServerItemIndexInSection;
- (BOOL)hasServerSectionIndex;
- (BOOL)hasShownToUser;
- (BOOL)hasSubactionMetaData;
- (BOOL)hasSuggestionSectionType;
- (BOOL)hasSuggestionType;
- (BOOL)hasTapBehavior;
- (BOOL)hasTimeSinceLastInteractedSeconds;
- (BOOL)hasTimeSinceMapViewportChangedSeconds;
- (BOOL)isContactWithHomeLocation;
- (BOOL)isContactWithLiveLocation;
- (BOOL)isContactWithNoLocation;
- (BOOL)isContactWithOtherLocation;
- (BOOL)isContactWithSchoolLocation;
- (BOOL)isContactWithWorkLocation;
- (BOOL)isContainedInViewport;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isProminentResult;
- (BOOL)matchedUsingAddress;
- (BOOL)matchedUsingEventName;
- (BOOL)matchedUsingLabel;
- (BOOL)matchedUsingName;
- (BOOL)matchedUsingOrganization;
- (BOOL)prefixTokenIsNumberFirstQueryToken;
- (BOOL)prefixTokenIsNumberSecondQueryToken;
- (BOOL)readFrom:(id)a3;
- (BOOL)shownToUser;
- (GEOClientACSuggestionEntry)init;
- (GEOClientACSuggestionEntry)initWithData:(id)a3;
- (GEOClientACSuggestionEntry)initWithDictionary:(id)a3;
- (GEOClientACSuggestionEntry)initWithJSON:(id)a3;
- (GEOHyperlinkMetaData)hyperlinkMetadata;
- (GEOSubactionMetaData)subactionMetaData;
- (NSString)suggestionSectionType;
- (double)contactRelevanceScore;
- (double)distanceToSuggestionFromViewportCenter;
- (double)fractionOfMatch;
- (double)mapsSuggestionsContactRevelanceScore;
- (double)mapsSuggestionsIsTouristScore;
- (double)mapsSuggestionsPoiRevelanceScore;
- (double)timeSinceLastInteractedSeconds;
- (double)timeSinceMapViewportChangedSeconds;
- (float)prefixLastTokenMatchCover;
- (float)prefixMatchCover;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)autocompleteResultCellTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)poiOpenStateAsString:(int)a3;
- (id)serverEntryTypeAsString:(int)a3;
- (id)suggestionTypeAsString:(int)a3;
- (id)tapBehaviorAsString:(int)a3;
- (int)StringAsAutocompleteResultCellType:(id)a3;
- (int)StringAsPoiOpenState:(id)a3;
- (int)StringAsServerEntryType:(id)a3;
- (int)StringAsSuggestionType:(id)a3;
- (int)StringAsTapBehavior:(id)a3;
- (int)age;
- (int)autocompleteResultCellType;
- (int)distanceToSuggestion;
- (int)peopleSuggesterRank;
- (int)poiOpenState;
- (int)prefixMatchPosition;
- (int)prefixMatchWordBoundary;
- (int)prefixTokenMatchLengthFirstQueryToken;
- (int)prefixTokenMatchLengthSecondQueryToken;
- (int)prefixTokenMatchLocationFirstQueryToken;
- (int)prefixTokenMatchLocationSecondQueryToken;
- (int)prefixTokenMatchPositionFirstQueryToken;
- (int)prefixTokenMatchPositionSecondQueryToken;
- (int)serverEntryType;
- (int)serverItemIndexInSection;
- (int)serverSectionIndex;
- (int)suggestionType;
- (int)tapBehavior;
- (unint64_t)hash;
- (void)_readHyperlinkMetadata;
- (void)_readSubactionMetaData;
- (void)_readSuggestionSectionType;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAge:(int)a3;
- (void)setAutocompleteResultCellType:(int)a3;
- (void)setContactRelevanceScore:(double)a3;
- (void)setDiscreteFeatureValuesAvailable:(BOOL)a3;
- (void)setDistanceToSuggestion:(int)a3;
- (void)setDistanceToSuggestionFromViewportCenter:(double)a3;
- (void)setFractionOfMatch:(double)a3;
- (void)setHasAge:(BOOL)a3;
- (void)setHasAutocompleteResultCellType:(BOOL)a3;
- (void)setHasContactRelevanceScore:(BOOL)a3;
- (void)setHasDiscreteFeatureValuesAvailable:(BOOL)a3;
- (void)setHasDistanceToSuggestion:(BOOL)a3;
- (void)setHasDistanceToSuggestionFromViewportCenter:(BOOL)a3;
- (void)setHasFractionOfMatch:(BOOL)a3;
- (void)setHasIsContactWithHomeLocation:(BOOL)a3;
- (void)setHasIsContactWithLiveLocation:(BOOL)a3;
- (void)setHasIsContactWithNoLocation:(BOOL)a3;
- (void)setHasIsContactWithOtherLocation:(BOOL)a3;
- (void)setHasIsContactWithSchoolLocation:(BOOL)a3;
- (void)setHasIsContactWithWorkLocation:(BOOL)a3;
- (void)setHasIsContainedInViewport:(BOOL)a3;
- (void)setHasIsFavorite:(BOOL)a3;
- (void)setHasIsProminentResult:(BOOL)a3;
- (void)setHasMapsSuggestionsContactRevelanceScore:(BOOL)a3;
- (void)setHasMapsSuggestionsIsTouristScore:(BOOL)a3;
- (void)setHasMapsSuggestionsPoiRevelanceScore:(BOOL)a3;
- (void)setHasMatchedUsingAddress:(BOOL)a3;
- (void)setHasMatchedUsingEventName:(BOOL)a3;
- (void)setHasMatchedUsingLabel:(BOOL)a3;
- (void)setHasMatchedUsingName:(BOOL)a3;
- (void)setHasMatchedUsingOrganization:(BOOL)a3;
- (void)setHasPeopleSuggesterRank:(BOOL)a3;
- (void)setHasPoiOpenState:(BOOL)a3;
- (void)setHasPrefixLastTokenMatchCover:(BOOL)a3;
- (void)setHasPrefixMatchCover:(BOOL)a3;
- (void)setHasPrefixMatchPosition:(BOOL)a3;
- (void)setHasPrefixMatchWordBoundary:(BOOL)a3;
- (void)setHasPrefixTokenIsNumberFirstQueryToken:(BOOL)a3;
- (void)setHasPrefixTokenIsNumberSecondQueryToken:(BOOL)a3;
- (void)setHasPrefixTokenMatchLengthFirstQueryToken:(BOOL)a3;
- (void)setHasPrefixTokenMatchLengthSecondQueryToken:(BOOL)a3;
- (void)setHasPrefixTokenMatchLocationFirstQueryToken:(BOOL)a3;
- (void)setHasPrefixTokenMatchLocationSecondQueryToken:(BOOL)a3;
- (void)setHasPrefixTokenMatchPositionFirstQueryToken:(BOOL)a3;
- (void)setHasPrefixTokenMatchPositionSecondQueryToken:(BOOL)a3;
- (void)setHasServerEntryType:(BOOL)a3;
- (void)setHasServerItemIndexInSection:(BOOL)a3;
- (void)setHasServerSectionIndex:(BOOL)a3;
- (void)setHasShownToUser:(BOOL)a3;
- (void)setHasSuggestionType:(BOOL)a3;
- (void)setHasTapBehavior:(BOOL)a3;
- (void)setHasTimeSinceLastInteractedSeconds:(BOOL)a3;
- (void)setHasTimeSinceMapViewportChangedSeconds:(BOOL)a3;
- (void)setHyperlinkMetadata:(id)a3;
- (void)setIsContactWithHomeLocation:(BOOL)a3;
- (void)setIsContactWithLiveLocation:(BOOL)a3;
- (void)setIsContactWithNoLocation:(BOOL)a3;
- (void)setIsContactWithOtherLocation:(BOOL)a3;
- (void)setIsContactWithSchoolLocation:(BOOL)a3;
- (void)setIsContactWithWorkLocation:(BOOL)a3;
- (void)setIsContainedInViewport:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsProminentResult:(BOOL)a3;
- (void)setMapsSuggestionsContactRevelanceScore:(double)a3;
- (void)setMapsSuggestionsIsTouristScore:(double)a3;
- (void)setMapsSuggestionsPoiRevelanceScore:(double)a3;
- (void)setMatchedUsingAddress:(BOOL)a3;
- (void)setMatchedUsingEventName:(BOOL)a3;
- (void)setMatchedUsingLabel:(BOOL)a3;
- (void)setMatchedUsingName:(BOOL)a3;
- (void)setMatchedUsingOrganization:(BOOL)a3;
- (void)setPeopleSuggesterRank:(int)a3;
- (void)setPoiOpenState:(int)a3;
- (void)setPrefixLastTokenMatchCover:(float)a3;
- (void)setPrefixMatchCover:(float)a3;
- (void)setPrefixMatchPosition:(int)a3;
- (void)setPrefixMatchWordBoundary:(int)a3;
- (void)setPrefixTokenIsNumberFirstQueryToken:(BOOL)a3;
- (void)setPrefixTokenIsNumberSecondQueryToken:(BOOL)a3;
- (void)setPrefixTokenMatchLengthFirstQueryToken:(int)a3;
- (void)setPrefixTokenMatchLengthSecondQueryToken:(int)a3;
- (void)setPrefixTokenMatchLocationFirstQueryToken:(int)a3;
- (void)setPrefixTokenMatchLocationSecondQueryToken:(int)a3;
- (void)setPrefixTokenMatchPositionFirstQueryToken:(int)a3;
- (void)setPrefixTokenMatchPositionSecondQueryToken:(int)a3;
- (void)setServerEntryType:(int)a3;
- (void)setServerItemIndexInSection:(int)a3;
- (void)setServerSectionIndex:(int)a3;
- (void)setShownToUser:(BOOL)a3;
- (void)setSubactionMetaData:(id)a3;
- (void)setSuggestionSectionType:(id)a3;
- (void)setSuggestionType:(int)a3;
- (void)setTapBehavior:(int)a3;
- (void)setTimeSinceLastInteractedSeconds:(double)a3;
- (void)setTimeSinceMapViewportChangedSeconds:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOClientACSuggestionEntry

- (GEOClientACSuggestionEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOClientACSuggestionEntry;
  v2 = [(GEOClientACSuggestionEntry *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOClientACSuggestionEntry)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOClientACSuggestionEntry;
  v3 = [(GEOClientACSuggestionEntry *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)suggestionType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x4000000) != 0) {
    return self->_suggestionType;
  }
  else {
    return 0;
  }
}

- (void)setSuggestionType:(int)a3
{
  *(void *)&self->_flags |= 0x2000004000000uLL;
  self->_suggestionType = a3;
}

- (void)setHasSuggestionType:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000004000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSuggestionType
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (id)suggestionTypeAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    uint64_t v3 = (void *)*((void *)&off_1E53EC708 + a3);
  }

  return v3;
}

- (int)StringAsSuggestionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AC_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_COREROUTINE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MESSAGES"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MAIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_QUERY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_PLACE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_CONTACTS"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_FAVORITE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_SERVER"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_USER_LOCATION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_PARKED_CAR"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_MARKED_LOCATION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"AC_TYPE_CLIENT_PROACTIVE"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)shownToUser
{
  return self->_shownToUser;
}

- (void)setShownToUser:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2200000000000uLL;
  self->_shownToUser = a3;
}

- (void)setHasShownToUser:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2200000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasShownToUser
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 5) & 1;
}

- (double)fractionOfMatch
{
  return self->_fractionOfMatch;
}

- (void)setFractionOfMatch:(double)a3
{
  *(void *)&self->_flags |= 0x2000000000004uLL;
  self->_fractionOfMatch = a3;
}

- (void)setHasFractionOfMatch:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000004;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasFractionOfMatch
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)distanceToSuggestion
{
  return self->_distanceToSuggestion;
}

- (void)setDistanceToSuggestion:(int)a3
{
  *(void *)&self->_flags |= 0x2000000000400uLL;
  self->_distanceToSuggestion = a3;
}

- (void)setHasDistanceToSuggestion:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000400;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasDistanceToSuggestion
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (double)contactRelevanceScore
{
  return self->_contactRelevanceScore;
}

- (void)setContactRelevanceScore:(double)a3
{
  *(void *)&self->_flags |= 0x2000000000001uLL;
  self->_contactRelevanceScore = a3;
}

- (void)setHasContactRelevanceScore:(BOOL)a3
{
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x2000000000000);
}

- (BOOL)hasContactRelevanceScore
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)matchedUsingName
{
  return self->_matchedUsingName;
}

- (void)setMatchedUsingName:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2020000000000uLL;
  self->_matchedUsingName = a3;
}

- (void)setHasMatchedUsingName:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2020000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingName
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 1) & 1;
}

- (BOOL)matchedUsingOrganization
{
  return self->_matchedUsingOrganization;
}

- (void)setMatchedUsingOrganization:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2040000000000uLL;
  self->_matchedUsingOrganization = a3;
}

- (void)setHasMatchedUsingOrganization:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2040000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingOrganization
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 2) & 1;
}

- (BOOL)matchedUsingAddress
{
  return self->_matchedUsingAddress;
}

- (void)setMatchedUsingAddress:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2004000000000uLL;
  self->_matchedUsingAddress = a3;
}

- (void)setHasMatchedUsingAddress:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2004000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingAddress
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 6) & 1;
}

- (BOOL)matchedUsingLabel
{
  return self->_matchedUsingLabel;
}

- (void)setMatchedUsingLabel:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2010000000000uLL;
  self->_matchedUsingLabel = a3;
}

- (void)setHasMatchedUsingLabel:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2010000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingLabel
{
  return *((unsigned char *)&self->_flags + 5) & 1;
}

- (BOOL)matchedUsingEventName
{
  return self->_matchedUsingEventName;
}

- (void)setMatchedUsingEventName:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2008000000000uLL;
  self->_matchedUsingEventName = a3;
}

- (void)setHasMatchedUsingEventName:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2008000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasMatchedUsingEventName
{
  return *((unsigned __int8 *)&self->_flags + 4) >> 7;
}

- (int)peopleSuggesterRank
{
  return self->_peopleSuggesterRank;
}

- (void)setPeopleSuggesterRank:(int)a3
{
  *(void *)&self->_flags |= 0x2000000000800uLL;
  self->_peopleSuggesterRank = a3;
}

- (void)setHasPeopleSuggesterRank:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000800;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasPeopleSuggesterRank
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (int)age
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0) {
    return self->_age;
  }
  else {
    return -1;
  }
}

- (void)setAge:(int)a3
{
  *(void *)&self->_flags |= 0x2000000000100uLL;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000100;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasAge
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (int)serverEntryType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x800000) != 0) {
    return self->_serverEntryType;
  }
  else {
    return 0;
  }
}

- (void)setServerEntryType:(int)a3
{
  *(void *)&self->_flags |= 0x2000000800000uLL;
  self->_serverEntryType = a3;
}

- (void)setHasServerEntryType:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000800000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasServerEntryType
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (id)serverEntryTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    uint64_t v3 = (void *)*((void *)&off_1E53EC780 + a3);
  }

  return v3;
}

- (int)StringAsServerEntryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"QUERY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BUSINESS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADDRESS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CATEGORY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2001000000000uLL;
  self->_isFavorite = a3;
}

- (void)setHasIsFavorite:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2001000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasIsFavorite
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 4) & 1;
}

- (int)poiOpenState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0) {
    return self->_poiOpenState;
  }
  else {
    return 0;
  }
}

- (void)setPoiOpenState:(int)a3
{
  *(void *)&self->_flags |= 0x2000000001000uLL;
  self->_poiOpenState = a3;
}

- (void)setHasPoiOpenState:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000001000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasPoiOpenState
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)poiOpenStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    uint64_t v3 = (void *)*((void *)&off_1E53EC7A0 + a3);
  }

  return v3;
}

- (int)StringAsPoiOpenState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"POI_IS_CURRENTLY_CLOSED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"POI_IS_PERMANENTLY_CLOSED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"POI_IS_CURRENTLY_OPEN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"POI_IS_OPENING_SOON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"POI_IS_CLOSING_SOON"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)mapsSuggestionsContactRevelanceScore
{
  return self->_mapsSuggestionsContactRevelanceScore;
}

- (void)setMapsSuggestionsContactRevelanceScore:(double)a3
{
  *(void *)&self->_flags |= 0x2000000000008uLL;
  self->_mapsSuggestionsContactRevelanceScore = a3;
}

- (void)setHasMapsSuggestionsContactRevelanceScore:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000008;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasMapsSuggestionsContactRevelanceScore
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)mapsSuggestionsPoiRevelanceScore
{
  return self->_mapsSuggestionsPoiRevelanceScore;
}

- (void)setMapsSuggestionsPoiRevelanceScore:(double)a3
{
  *(void *)&self->_flags |= 0x2000000000020uLL;
  self->_mapsSuggestionsPoiRevelanceScore = a3;
}

- (void)setHasMapsSuggestionsPoiRevelanceScore:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000020;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasMapsSuggestionsPoiRevelanceScore
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (double)mapsSuggestionsIsTouristScore
{
  return self->_mapsSuggestionsIsTouristScore;
}

- (void)setMapsSuggestionsIsTouristScore:(double)a3
{
  *(void *)&self->_flags |= 0x2000000000010uLL;
  self->_mapsSuggestionsIsTouristScore = a3;
}

- (void)setHasMapsSuggestionsIsTouristScore:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000010;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasMapsSuggestionsIsTouristScore
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)discreteFeatureValuesAvailable
{
  return self->_discreteFeatureValuesAvailable;
}

- (void)setDiscreteFeatureValuesAvailable:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2000010000000uLL;
  self->_discreteFeatureValuesAvailable = a3;
}

- (void)setHasDiscreteFeatureValuesAvailable:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000010000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasDiscreteFeatureValuesAvailable
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (void)_readSuggestionSectionType
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 222) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientACSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuggestionSectionType_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasSuggestionSectionType
{
  return self->_suggestionSectionType != 0;
}

- (NSString)suggestionSectionType
{
  -[GEOClientACSuggestionEntry _readSuggestionSectionType]((uint64_t)self);
  suggestionSectionType = self->_suggestionSectionType;

  return suggestionSectionType;
}

- (void)setSuggestionSectionType:(id)a3
{
  *(void *)&self->_flags |= 0x3000000000000uLL;
  objc_storeStrong((id *)&self->_suggestionSectionType, a3);
}

- (BOOL)isProminentResult
{
  return self->_isProminentResult;
}

- (void)setIsProminentResult:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2002000000000uLL;
  self->_isProminentResult = a3;
}

- (void)setHasIsProminentResult:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2002000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasIsProminentResult
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 5) & 1;
}

- (void)_readSubactionMetaData
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 221) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientACSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubactionMetaData_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasSubactionMetaData
{
  return self->_subactionMetaData != 0;
}

- (GEOSubactionMetaData)subactionMetaData
{
  -[GEOClientACSuggestionEntry _readSubactionMetaData]((uint64_t)self);
  subactionMetaData = self->_subactionMetaData;

  return subactionMetaData;
}

- (void)setSubactionMetaData:(id)a3
{
  *(void *)&self->_flags |= 0x2800000000000uLL;
  objc_storeStrong((id *)&self->_subactionMetaData, a3);
}

- (int)autocompleteResultCellType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0) {
    return self->_autocompleteResultCellType;
  }
  else {
    return 0;
  }
}

- (void)setAutocompleteResultCellType:(int)a3
{
  *(void *)&self->_flags |= 0x2000000000200uLL;
  self->_autocompleteResultCellType = a3;
}

- (void)setHasAutocompleteResultCellType:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000200;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasAutocompleteResultCellType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)autocompleteResultCellTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    uint64_t v3 = (void *)*((void *)&off_1E53EC7C8 + a3);
  }

  return v3;
}

- (int)StringAsAutocompleteResultCellType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)serverSectionIndex
{
  return self->_serverSectionIndex;
}

- (void)setServerSectionIndex:(int)a3
{
  *(void *)&self->_flags |= 0x2000002000000uLL;
  self->_serverSectionIndex = a3;
}

- (void)setHasServerSectionIndex:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000002000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasServerSectionIndex
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (int)serverItemIndexInSection
{
  return self->_serverItemIndexInSection;
}

- (void)setServerItemIndexInSection:(int)a3
{
  *(void *)&self->_flags |= 0x2000001000000uLL;
  self->_serverItemIndexInSection = a3;
}

- (void)setHasServerItemIndexInSection:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000001000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasServerItemIndexInSection
{
  return *((unsigned char *)&self->_flags + 3) & 1;
}

- (int)tapBehavior
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x8000000) != 0) {
    return self->_tapBehavior;
  }
  else {
    return 0;
  }
}

- (void)setTapBehavior:(int)a3
{
  *(void *)&self->_flags |= 0x2000008000000uLL;
  self->_tapBehavior = a3;
}

- (void)setHasTapBehavior:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000008000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasTapBehavior
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (id)tapBehaviorAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"SHOW_RESULTS_IN_LIST_VIEW";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"SHOW_RESULTS_ON_MAP";
  }
  return v4;
}

- (int)StringAsTapBehavior:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SHOW_RESULTS_ON_MAP"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SHOW_RESULTS_IN_LIST_VIEW"];
  }

  return v4;
}

- (double)distanceToSuggestionFromViewportCenter
{
  return self->_distanceToSuggestionFromViewportCenter;
}

- (void)setDistanceToSuggestionFromViewportCenter:(double)a3
{
  *(void *)&self->_flags |= 0x2000000000002uLL;
  self->_distanceToSuggestionFromViewportCenter = a3;
}

- (void)setHasDistanceToSuggestionFromViewportCenter:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000002;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasDistanceToSuggestionFromViewportCenter
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)timeSinceLastInteractedSeconds
{
  return self->_timeSinceLastInteractedSeconds;
}

- (void)setTimeSinceLastInteractedSeconds:(double)a3
{
  *(void *)&self->_flags |= 0x2000000000040uLL;
  self->_timeSinceLastInteractedSeconds = a3;
}

- (void)setHasTimeSinceLastInteractedSeconds:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000040;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasTimeSinceLastInteractedSeconds
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (BOOL)isContainedInViewport
{
  return self->_isContainedInViewport;
}

- (void)setIsContainedInViewport:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2000800000000uLL;
  self->_isContainedInViewport = a3;
}

- (void)setHasIsContainedInViewport:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000800000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasIsContainedInViewport
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 3) & 1;
}

- (double)timeSinceMapViewportChangedSeconds
{
  return self->_timeSinceMapViewportChangedSeconds;
}

- (void)setTimeSinceMapViewportChangedSeconds:(double)a3
{
  *(void *)&self->_flags |= 0x2000000000080uLL;
  self->_timeSinceMapViewportChangedSeconds = a3;
}

- (void)setHasTimeSinceMapViewportChangedSeconds:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000000080;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasTimeSinceMapViewportChangedSeconds
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)_readHyperlinkMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(unsigned char *)(a1 + 221) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOClientACSuggestionEntryReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readHyperlinkMetadata_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasHyperlinkMetadata
{
  return self->_hyperlinkMetadata != 0;
}

- (GEOHyperlinkMetaData)hyperlinkMetadata
{
  -[GEOClientACSuggestionEntry _readHyperlinkMetadata]((uint64_t)self);
  hyperlinkMetadata = self->_hyperlinkMetadata;

  return hyperlinkMetadata;
}

- (void)setHyperlinkMetadata:(id)a3
{
  *(void *)&self->_flags |= 0x2400000000000uLL;
  objc_storeStrong((id *)&self->_hyperlinkMetadata, a3);
}

- (BOOL)isContactWithHomeLocation
{
  return self->_isContactWithHomeLocation;
}

- (void)setIsContactWithHomeLocation:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2000020000000uLL;
  self->_isContactWithHomeLocation = a3;
}

- (void)setHasIsContactWithHomeLocation:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000020000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithHomeLocation
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (BOOL)isContactWithWorkLocation
{
  return self->_isContactWithWorkLocation;
}

- (void)setIsContactWithWorkLocation:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2000400000000uLL;
  self->_isContactWithWorkLocation = a3;
}

- (void)setHasIsContactWithWorkLocation:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000400000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithWorkLocation
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 2) & 1;
}

- (BOOL)isContactWithSchoolLocation
{
  return self->_isContactWithSchoolLocation;
}

- (void)setIsContactWithSchoolLocation:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2000200000000uLL;
  self->_isContactWithSchoolLocation = a3;
}

- (void)setHasIsContactWithSchoolLocation:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000200000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithSchoolLocation
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 1) & 1;
}

- (BOOL)isContactWithOtherLocation
{
  return self->_isContactWithOtherLocation;
}

- (void)setIsContactWithOtherLocation:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2000100000000uLL;
  self->_isContactWithOtherLocation = a3;
}

- (void)setHasIsContactWithOtherLocation:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000100000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithOtherLocation
{
  return *((unsigned char *)&self->_flags + 4) & 1;
}

- (BOOL)isContactWithLiveLocation
{
  return self->_isContactWithLiveLocation;
}

- (void)setIsContactWithLiveLocation:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2000040000000uLL;
  self->_isContactWithLiveLocation = a3;
}

- (void)setHasIsContactWithLiveLocation:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000040000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithLiveLocation
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (BOOL)isContactWithNoLocation
{
  return self->_isContactWithNoLocation;
}

- (void)setIsContactWithNoLocation:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2000080000000uLL;
  self->_isContactWithNoLocation = a3;
}

- (void)setHasIsContactWithNoLocation:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000080000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsContactWithNoLocation
{
  return *((unsigned __int8 *)&self->_flags + 3) >> 7;
}

- (float)prefixLastTokenMatchCover
{
  return self->_prefixLastTokenMatchCover;
}

- (void)setPrefixLastTokenMatchCover:(float)a3
{
  *(void *)&self->_flags |= 0x2000000002000uLL;
  self->_prefixLastTokenMatchCover = a3;
}

- (void)setHasPrefixLastTokenMatchCover:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000002000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasPrefixLastTokenMatchCover
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (float)prefixMatchCover
{
  return self->_prefixMatchCover;
}

- (void)setPrefixMatchCover:(float)a3
{
  *(void *)&self->_flags |= 0x2000000004000uLL;
  self->_prefixMatchCover = a3;
}

- (void)setHasPrefixMatchCover:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000004000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasPrefixMatchCover
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)prefixMatchPosition
{
  return self->_prefixMatchPosition;
}

- (void)setPrefixMatchPosition:(int)a3
{
  *(void *)&self->_flags |= 0x2000000008000uLL;
  self->_prefixMatchPosition = a3;
}

- (void)setHasPrefixMatchPosition:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000008000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasPrefixMatchPosition
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (int)prefixMatchWordBoundary
{
  return self->_prefixMatchWordBoundary;
}

- (void)setPrefixMatchWordBoundary:(int)a3
{
  *(void *)&self->_flags |= 0x2000000010000uLL;
  self->_prefixMatchWordBoundary = a3;
}

- (void)setHasPrefixMatchWordBoundary:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000010000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasPrefixMatchWordBoundary
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (int)prefixTokenMatchLengthFirstQueryToken
{
  return self->_prefixTokenMatchLengthFirstQueryToken;
}

- (void)setPrefixTokenMatchLengthFirstQueryToken:(int)a3
{
  *(void *)&self->_flags |= 0x2000000020000uLL;
  self->_prefixTokenMatchLengthFirstQueryToken = a3;
}

- (void)setHasPrefixTokenMatchLengthFirstQueryToken:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000020000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFDFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchLengthFirstQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (int)prefixTokenMatchPositionFirstQueryToken
{
  return self->_prefixTokenMatchPositionFirstQueryToken;
}

- (void)setPrefixTokenMatchPositionFirstQueryToken:(int)a3
{
  *(void *)&self->_flags |= 0x2000000200000uLL;
  self->_prefixTokenMatchPositionFirstQueryToken = a3;
}

- (void)setHasPrefixTokenMatchPositionFirstQueryToken:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000200000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchPositionFirstQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (BOOL)prefixTokenIsNumberFirstQueryToken
{
  return self->_prefixTokenIsNumberFirstQueryToken;
}

- (void)setPrefixTokenIsNumberFirstQueryToken:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2080000000000uLL;
  self->_prefixTokenIsNumberFirstQueryToken = a3;
}

- (void)setHasPrefixTokenIsNumberFirstQueryToken:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2080000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenIsNumberFirstQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 3) & 1;
}

- (int)prefixTokenMatchLocationFirstQueryToken
{
  return self->_prefixTokenMatchLocationFirstQueryToken;
}

- (void)setPrefixTokenMatchLocationFirstQueryToken:(int)a3
{
  *(void *)&self->_flags |= 0x2000000080000uLL;
  self->_prefixTokenMatchLocationFirstQueryToken = a3;
}

- (void)setHasPrefixTokenMatchLocationFirstQueryToken:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000080000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchLocationFirstQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (int)prefixTokenMatchLengthSecondQueryToken
{
  return self->_prefixTokenMatchLengthSecondQueryToken;
}

- (void)setPrefixTokenMatchLengthSecondQueryToken:(int)a3
{
  *(void *)&self->_flags |= 0x2000000040000uLL;
  self->_prefixTokenMatchLengthSecondQueryToken = a3;
}

- (void)setHasPrefixTokenMatchLengthSecondQueryToken:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000040000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchLengthSecondQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (int)prefixTokenMatchPositionSecondQueryToken
{
  return self->_prefixTokenMatchPositionSecondQueryToken;
}

- (void)setPrefixTokenMatchPositionSecondQueryToken:(int)a3
{
  *(void *)&self->_flags |= 0x2000000400000uLL;
  self->_prefixTokenMatchPositionSecondQueryToken = a3;
}

- (void)setHasPrefixTokenMatchPositionSecondQueryToken:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000400000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchPositionSecondQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (BOOL)prefixTokenIsNumberSecondQueryToken
{
  return self->_prefixTokenIsNumberSecondQueryToken;
}

- (void)setPrefixTokenIsNumberSecondQueryToken:(BOOL)a3
{
  *(void *)&self->_flags |= 0x2100000000000uLL;
  self->_prefixTokenIsNumberSecondQueryToken = a3;
}

- (void)setHasPrefixTokenIsNumberSecondQueryToken:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2100000000000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenIsNumberSecondQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 4) & 1;
}

- (int)prefixTokenMatchLocationSecondQueryToken
{
  return self->_prefixTokenMatchLocationSecondQueryToken;
}

- (void)setPrefixTokenMatchLocationSecondQueryToken:(int)a3
{
  *(void *)&self->_flags |= 0x2000000100000uLL;
  self->_prefixTokenMatchLocationSecondQueryToken = a3;
}

- (void)setHasPrefixTokenMatchLocationSecondQueryToken:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (a3) {
    uint64_t v3 = 0x2000000100000;
  }
  self->_$CD8BBF1E49DB7E485009711ADA3FCADB flags = ($CD8BBF1E49DB7E485009711ADA3FCADB)(*(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasPrefixTokenMatchLocationSecondQueryToken
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOClientACSuggestionEntry;
  int v4 = [(GEOClientACSuggestionEntry *)&v8 description];
  v5 = [(GEOClientACSuggestionEntry *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOClientACSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x4000000) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 188);
      if (v6 >= 0xF)
      {
        objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 188));
      }
      else
      {
        objc_super v7 = (void *)*((void *)&off_1E53EC708 + v6);
      }
      if (a2) {
        objc_super v8 = @"suggestionType";
      }
      else {
        objc_super v8 = @"suggestion_type";
      }
      [v4 setObject:v7 forKey:v8];

      uint64_t v5 = *(void *)(a1 + 216);
    }
    if ((v5 & 0x200000000000) != 0)
    {
      v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 213)];
      if (a2) {
        v20 = @"shownToUser";
      }
      else {
        v20 = @"shown_to_user";
      }
      [v4 setObject:v19 forKey:v20];

      uint64_t v5 = *(void *)(a1 + 216);
      if ((v5 & 4) == 0)
      {
LABEL_12:
        if ((v5 & 0x400) == 0) {
          goto LABEL_13;
        }
        goto LABEL_53;
      }
    }
    else if ((v5 & 4) == 0)
    {
      goto LABEL_12;
    }
    v21 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v22 = @"fractionOfMatch";
    }
    else {
      v22 = @"fraction_of_match";
    }
    [v4 setObject:v21 forKey:v22];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x400) == 0)
    {
LABEL_13:
      if ((v5 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_57;
    }
LABEL_53:
    v23 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 124)];
    if (a2) {
      v24 = @"distanceToSuggestion";
    }
    else {
      v24 = @"distance_to_suggestion";
    }
    [v4 setObject:v23 forKey:v24];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 1) == 0)
    {
LABEL_14:
      if ((v5 & 0x20000000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_61;
    }
LABEL_57:
    v25 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    if (a2) {
      v26 = @"contactRelevanceScore";
    }
    else {
      v26 = @"contact_relevance_score";
    }
    [v4 setObject:v25 forKey:v26];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x20000000000) == 0)
    {
LABEL_15:
      if ((v5 & 0x40000000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_62;
    }
LABEL_61:
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 209)];
    [v4 setObject:v27 forKey:@"matchedUsingName"];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x40000000000) == 0)
    {
LABEL_16:
      if ((v5 & 0x4000000000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_63;
    }
LABEL_62:
    v28 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 210)];
    [v4 setObject:v28 forKey:@"matchedUsingOrganization"];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x4000000000) == 0)
    {
LABEL_17:
      if ((v5 & 0x10000000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_64;
    }
LABEL_63:
    v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 206)];
    [v4 setObject:v29 forKey:@"matchedUsingAddress"];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x10000000000) == 0)
    {
LABEL_18:
      if ((v5 & 0x8000000000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_65;
    }
LABEL_64:
    v30 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 208)];
    [v4 setObject:v30 forKey:@"matchedUsingLabel"];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x8000000000) == 0)
    {
LABEL_19:
      if ((v5 & 0x800) == 0) {
        goto LABEL_20;
      }
      goto LABEL_66;
    }
LABEL_65:
    v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 207)];
    [v4 setObject:v31 forKey:@"matchedUsingEventName"];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x800) == 0)
    {
LABEL_20:
      if ((v5 & 0x100) == 0) {
        goto LABEL_21;
      }
      goto LABEL_70;
    }
LABEL_66:
    v32 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 128)];
    if (a2) {
      v33 = @"peopleSuggesterRank";
    }
    else {
      v33 = @"people_suggester_rank";
    }
    [v4 setObject:v32 forKey:v33];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x100) == 0)
    {
LABEL_21:
      if ((v5 & 0x800000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_71;
    }
LABEL_70:
    v34 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 116)];
    [v4 setObject:v34 forKey:@"age"];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x800000) == 0)
    {
LABEL_22:
      if ((v5 & 0x1000000000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_194;
    }
LABEL_71:
    uint64_t v35 = *(int *)(a1 + 176);
    if (v35 >= 4)
    {
      v36 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 176));
    }
    else
    {
      v36 = (void *)*((void *)&off_1E53EC780 + v35);
    }
    if (a2) {
      v88 = @"serverEntryType";
    }
    else {
      v88 = @"server_entry_type";
    }
    [v4 setObject:v36 forKey:v88];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x1000000000) == 0)
    {
LABEL_23:
      if ((v5 & 0x1000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_198;
    }
LABEL_194:
    v89 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 204)];
    if (a2) {
      v90 = @"isFavorite";
    }
    else {
      v90 = @"is_favorite";
    }
    [v4 setObject:v89 forKey:v90];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x1000) == 0)
    {
LABEL_24:
      if ((v5 & 8) == 0) {
        goto LABEL_25;
      }
      goto LABEL_221;
    }
LABEL_198:
    uint64_t v91 = *(int *)(a1 + 132);
    if (v91 >= 5)
    {
      v92 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
    }
    else
    {
      v92 = (void *)*((void *)&off_1E53EC7A0 + v91);
    }
    if (a2) {
      v100 = @"poiOpenState";
    }
    else {
      v100 = @"poi_open_state";
    }
    [v4 setObject:v92 forKey:v100];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 8) == 0)
    {
LABEL_25:
      if ((v5 & 0x20) == 0) {
        goto LABEL_26;
      }
      goto LABEL_225;
    }
LABEL_221:
    v101 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    if (a2) {
      v102 = @"mapsSuggestionsContactRevelanceScore";
    }
    else {
      v102 = @"maps_suggestions_contact_revelance_score";
    }
    [v4 setObject:v101 forKey:v102];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x20) == 0)
    {
LABEL_26:
      if ((v5 & 0x10) == 0) {
        goto LABEL_27;
      }
      goto LABEL_229;
    }
LABEL_225:
    v103 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    if (a2) {
      v104 = @"mapsSuggestionsPoiRevelanceScore";
    }
    else {
      v104 = @"maps_suggestions_poi_revelance_score";
    }
    [v4 setObject:v103 forKey:v104];

    uint64_t v5 = *(void *)(a1 + 216);
    if ((v5 & 0x10) == 0)
    {
LABEL_27:
      if ((v5 & 0x10000000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_28;
    }
LABEL_229:
    v105 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
    if (a2) {
      v106 = @"mapsSuggestionsIsTouristScore";
    }
    else {
      v106 = @"maps_suggestions_is_tourist_score";
    }
    [v4 setObject:v105 forKey:v106];

    if ((*(void *)(a1 + 216) & 0x10000000) == 0)
    {
LABEL_32:
      v11 = [(id)a1 suggestionSectionType];
      if (v11)
      {
        if (a2) {
          v12 = @"suggestionSectionType";
        }
        else {
          v12 = @"suggestion_section_type";
        }
        [v4 setObject:v11 forKey:v12];
      }

      if ((*(unsigned char *)(a1 + 220) & 0x20) != 0)
      {
        v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 205)];
        if (a2) {
          v14 = @"isProminentResult";
        }
        else {
          v14 = @"is_prominent_result";
        }
        [v4 setObject:v13 forKey:v14];
      }
      v15 = [(id)a1 subactionMetaData];
      v16 = v15;
      if (v15)
      {
        if (a2)
        {
          v17 = [v15 jsonRepresentation];
          v18 = @"subactionMetaData";
        }
        else
        {
          v17 = [v15 dictionaryRepresentation];
          v18 = @"subaction_meta_data";
        }
        id v37 = v17;

        [v4 setObject:v37 forKey:v18];
      }

      uint64_t v38 = *(void *)(a1 + 216);
      if ((v38 & 0x200) != 0)
      {
        uint64_t v45 = *(int *)(a1 + 120);
        if (v45 >= 5)
        {
          v46 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 120));
        }
        else
        {
          v46 = (void *)*((void *)&off_1E53EC7C8 + v45);
        }
        if (a2) {
          v93 = @"autocompleteResultCellType";
        }
        else {
          v93 = @"autocomplete_result_cell_type";
        }
        [v4 setObject:v46 forKey:v93];

        uint64_t v38 = *(void *)(a1 + 216);
        if ((v38 & 0x2000000) == 0)
        {
LABEL_77:
          if ((v38 & 0x1000000) == 0) {
            goto LABEL_78;
          }
          goto LABEL_209;
        }
      }
      else if ((v38 & 0x2000000) == 0)
      {
        goto LABEL_77;
      }
      v94 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 184)];
      if (a2) {
        v95 = @"serverSectionIndex";
      }
      else {
        v95 = @"server_section_index";
      }
      [v4 setObject:v94 forKey:v95];

      uint64_t v38 = *(void *)(a1 + 216);
      if ((v38 & 0x1000000) == 0)
      {
LABEL_78:
        if ((v38 & 0x8000000) == 0) {
          goto LABEL_79;
        }
        goto LABEL_213;
      }
LABEL_209:
      v96 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 180)];
      if (a2) {
        v97 = @"serverItemIndexInSection";
      }
      else {
        v97 = @"server_item_index_in_section";
      }
      [v4 setObject:v96 forKey:v97];

      uint64_t v38 = *(void *)(a1 + 216);
      if ((v38 & 0x8000000) == 0)
      {
LABEL_79:
        if ((v38 & 2) == 0) {
          goto LABEL_80;
        }
        goto LABEL_240;
      }
LABEL_213:
      int v98 = *(_DWORD *)(a1 + 192);
      if (v98)
      {
        if (v98 == 1)
        {
          v99 = @"SHOW_RESULTS_IN_LIST_VIEW";
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 192));
          v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v99 = @"SHOW_RESULTS_ON_MAP";
      }
      if (a2) {
        v107 = @"tapBehavior";
      }
      else {
        v107 = @"tap_behavior";
      }
      [v4 setObject:v99 forKey:v107];

      uint64_t v38 = *(void *)(a1 + 216);
      if ((v38 & 2) == 0)
      {
LABEL_80:
        if ((v38 & 0x40) == 0) {
          goto LABEL_81;
        }
        goto LABEL_244;
      }
LABEL_240:
      v108 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
      if (a2) {
        v109 = @"distanceToSuggestionFromViewportCenter";
      }
      else {
        v109 = @"distance_to_suggestion_from_viewport_center";
      }
      [v4 setObject:v108 forKey:v109];

      uint64_t v38 = *(void *)(a1 + 216);
      if ((v38 & 0x40) == 0)
      {
LABEL_81:
        if ((v38 & 0x800000000) == 0) {
          goto LABEL_82;
        }
        goto LABEL_248;
      }
LABEL_244:
      v110 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
      if (a2) {
        v111 = @"timeSinceLastInteractedSeconds";
      }
      else {
        v111 = @"time_since_last_interacted_seconds";
      }
      [v4 setObject:v110 forKey:v111];

      uint64_t v38 = *(void *)(a1 + 216);
      if ((v38 & 0x800000000) == 0)
      {
LABEL_82:
        if ((v38 & 0x80) == 0) {
          goto LABEL_87;
        }
        goto LABEL_83;
      }
LABEL_248:
      v112 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 203)];
      if (a2) {
        v113 = @"isContainedInViewport";
      }
      else {
        v113 = @"is_contained_in_viewport";
      }
      [v4 setObject:v112 forKey:v113];

      if ((*(void *)(a1 + 216) & 0x80) == 0)
      {
LABEL_87:
        v41 = [(id)a1 hyperlinkMetadata];
        v42 = v41;
        if (v41)
        {
          if (a2)
          {
            v43 = [v41 jsonRepresentation];
            v44 = @"hyperlinkMetadata";
          }
          else
          {
            v43 = [v41 dictionaryRepresentation];
            v44 = @"hyperlink_metadata";
          }
          id v47 = v43;

          [v4 setObject:v47 forKey:v44];
        }

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x20000000) != 0)
        {
          v54 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 197)];
          if (a2) {
            v55 = @"isContactWithHomeLocation";
          }
          else {
            v55 = @"is_contact_with_home_location";
          }
          [v4 setObject:v54 forKey:v55];

          uint64_t v49 = *(void *)(a1 + 216);
          if ((v49 & 0x400000000) == 0)
          {
LABEL_96:
            if ((v49 & 0x200000000) == 0) {
              goto LABEL_97;
            }
            goto LABEL_128;
          }
        }
        else if ((v49 & 0x400000000) == 0)
        {
          goto LABEL_96;
        }
        v56 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 202)];
        if (a2) {
          v57 = @"isContactWithWorkLocation";
        }
        else {
          v57 = @"is_contact_with_work_location";
        }
        [v4 setObject:v56 forKey:v57];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x200000000) == 0)
        {
LABEL_97:
          if ((v49 & 0x100000000) == 0) {
            goto LABEL_98;
          }
          goto LABEL_132;
        }
LABEL_128:
        v58 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 201)];
        if (a2) {
          v59 = @"isContactWithSchoolLocation";
        }
        else {
          v59 = @"is_contact_with_school_location";
        }
        [v4 setObject:v58 forKey:v59];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x100000000) == 0)
        {
LABEL_98:
          if ((v49 & 0x40000000) == 0) {
            goto LABEL_99;
          }
          goto LABEL_136;
        }
LABEL_132:
        v60 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 200)];
        if (a2) {
          v61 = @"isContactWithOtherLocation";
        }
        else {
          v61 = @"is_contact_with_other_location";
        }
        [v4 setObject:v60 forKey:v61];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x40000000) == 0)
        {
LABEL_99:
          if ((v49 & 0x80000000) == 0) {
            goto LABEL_100;
          }
          goto LABEL_140;
        }
LABEL_136:
        v62 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 198)];
        if (a2) {
          v63 = @"isContactWithLiveLocation";
        }
        else {
          v63 = @"is_contact_with_live_location";
        }
        [v4 setObject:v62 forKey:v63];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x80000000) == 0)
        {
LABEL_100:
          if ((v49 & 0x2000) == 0) {
            goto LABEL_101;
          }
          goto LABEL_144;
        }
LABEL_140:
        v64 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 199)];
        if (a2) {
          v65 = @"isContactWithNoLocation";
        }
        else {
          v65 = @"is_contact_with_no_location";
        }
        [v4 setObject:v64 forKey:v65];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x2000) == 0)
        {
LABEL_101:
          if ((v49 & 0x4000) == 0) {
            goto LABEL_102;
          }
          goto LABEL_148;
        }
LABEL_144:
        LODWORD(v48) = *(_DWORD *)(a1 + 136);
        v66 = [NSNumber numberWithFloat:v48];
        if (a2) {
          v67 = @"prefixLastTokenMatchCover";
        }
        else {
          v67 = @"prefix_last_token_match_cover";
        }
        [v4 setObject:v66 forKey:v67];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x4000) == 0)
        {
LABEL_102:
          if ((v49 & 0x8000) == 0) {
            goto LABEL_103;
          }
          goto LABEL_152;
        }
LABEL_148:
        LODWORD(v48) = *(_DWORD *)(a1 + 140);
        v68 = [NSNumber numberWithFloat:v48];
        if (a2) {
          v69 = @"prefixMatchCover";
        }
        else {
          v69 = @"prefix_match_cover";
        }
        [v4 setObject:v68 forKey:v69];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x8000) == 0)
        {
LABEL_103:
          if ((v49 & 0x10000) == 0) {
            goto LABEL_104;
          }
          goto LABEL_156;
        }
LABEL_152:
        v70 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 144)];
        if (a2) {
          v71 = @"prefixMatchPosition";
        }
        else {
          v71 = @"prefix_match_position";
        }
        [v4 setObject:v70 forKey:v71];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x10000) == 0)
        {
LABEL_104:
          if ((v49 & 0x20000) == 0) {
            goto LABEL_105;
          }
          goto LABEL_160;
        }
LABEL_156:
        v72 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 148)];
        if (a2) {
          v73 = @"prefixMatchWordBoundary";
        }
        else {
          v73 = @"prefix_match_word_boundary";
        }
        [v4 setObject:v72 forKey:v73];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x20000) == 0)
        {
LABEL_105:
          if ((v49 & 0x200000) == 0) {
            goto LABEL_106;
          }
          goto LABEL_164;
        }
LABEL_160:
        v74 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 152)];
        if (a2) {
          v75 = @"prefixTokenMatchLengthFirstQueryToken";
        }
        else {
          v75 = @"prefix_token_match_length_first_query_token";
        }
        [v4 setObject:v74 forKey:v75];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x200000) == 0)
        {
LABEL_106:
          if ((v49 & 0x80000000000) == 0) {
            goto LABEL_107;
          }
          goto LABEL_168;
        }
LABEL_164:
        v76 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 168)];
        if (a2) {
          v77 = @"prefixTokenMatchPositionFirstQueryToken";
        }
        else {
          v77 = @"prefix_token_match_position_first_query_token";
        }
        [v4 setObject:v76 forKey:v77];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x80000000000) == 0)
        {
LABEL_107:
          if ((v49 & 0x80000) == 0) {
            goto LABEL_108;
          }
          goto LABEL_172;
        }
LABEL_168:
        v78 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 211)];
        if (a2) {
          v79 = @"prefixTokenIsNumberFirstQueryToken";
        }
        else {
          v79 = @"prefix_token_is_number_first_query_token";
        }
        [v4 setObject:v78 forKey:v79];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x80000) == 0)
        {
LABEL_108:
          if ((v49 & 0x40000) == 0) {
            goto LABEL_109;
          }
          goto LABEL_176;
        }
LABEL_172:
        v80 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 160)];
        if (a2) {
          v81 = @"prefixTokenMatchLocationFirstQueryToken";
        }
        else {
          v81 = @"prefix_token_match_location_first_query_token";
        }
        [v4 setObject:v80 forKey:v81];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x40000) == 0)
        {
LABEL_109:
          if ((v49 & 0x400000) == 0) {
            goto LABEL_110;
          }
          goto LABEL_180;
        }
LABEL_176:
        v82 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 156)];
        if (a2) {
          v83 = @"prefixTokenMatchLengthSecondQueryToken";
        }
        else {
          v83 = @"prefix_token_match_length_second_query_token";
        }
        [v4 setObject:v82 forKey:v83];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x400000) == 0)
        {
LABEL_110:
          if ((v49 & 0x100000000000) == 0) {
            goto LABEL_111;
          }
          goto LABEL_184;
        }
LABEL_180:
        v84 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 172)];
        if (a2) {
          v85 = @"prefixTokenMatchPositionSecondQueryToken";
        }
        else {
          v85 = @"prefix_token_match_position_second_query_token";
        }
        [v4 setObject:v84 forKey:v85];

        uint64_t v49 = *(void *)(a1 + 216);
        if ((v49 & 0x100000000000) == 0)
        {
LABEL_111:
          if ((v49 & 0x100000) == 0)
          {
LABEL_116:
            id v52 = v4;

            goto LABEL_117;
          }
LABEL_112:
          v50 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 164)];
          if (a2) {
            v51 = @"prefixTokenMatchLocationSecondQueryToken";
          }
          else {
            v51 = @"prefix_token_match_location_second_query_token";
          }
          [v4 setObject:v50 forKey:v51];

          goto LABEL_116;
        }
LABEL_184:
        v86 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 212)];
        if (a2) {
          v87 = @"prefixTokenIsNumberSecondQueryToken";
        }
        else {
          v87 = @"prefix_token_is_number_second_query_token";
        }
        [v4 setObject:v86 forKey:v87];

        if ((*(void *)(a1 + 216) & 0x100000) == 0) {
          goto LABEL_116;
        }
        goto LABEL_112;
      }
LABEL_83:
      v39 = [NSNumber numberWithDouble:*(double *)(a1 + 96)];
      if (a2) {
        v40 = @"timeSinceMapViewportChangedSeconds";
      }
      else {
        v40 = @"time_since_map_viewport_changed_seconds";
      }
      [v4 setObject:v39 forKey:v40];

      goto LABEL_87;
    }
LABEL_28:
    v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 196)];
    if (a2) {
      v10 = @"discreteFeatureValuesAvailable";
    }
    else {
      v10 = @"discrete_feature_values_available";
    }
    [v4 setObject:v9 forKey:v10];

    goto LABEL_32;
  }
  id v52 = 0;
LABEL_117:

  return v52;
}

- (id)jsonRepresentation
{
  return -[GEOClientACSuggestionEntry _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOClientACSuggestionEntry)initWithDictionary:(id)a3
{
  return (GEOClientACSuggestionEntry *)-[GEOClientACSuggestionEntry _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_317;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_317;
  }
  if (a3) {
    uint64_t v6 = @"suggestionType";
  }
  else {
    uint64_t v6 = @"suggestion_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"AC_TYPE_UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_COREROUTINE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MESSAGES"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_CORERECENT_MAIL"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_QUERY"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_DIRECTIONS"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_MAPSRECENT_PLACE"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_CONTACTS"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_FAVORITE"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_SERVER"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_USER_LOCATION"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_PARKED_CAR"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_MARKED_LOCATION"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"AC_TYPE_CLIENT_PROACTIVE"])
    {
      uint64_t v9 = 14;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_42;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setSuggestionType:v9];
LABEL_42:

  if (a3) {
    v10 = @"shownToUser";
  }
  else {
    v10 = @"shown_to_user";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShownToUser:", objc_msgSend(v11, "BOOLValue"));
  }

  if (a3) {
    v12 = @"fractionOfMatch";
  }
  else {
    v12 = @"fraction_of_match";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    objc_msgSend(a1, "setFractionOfMatch:");
  }

  if (a3) {
    v14 = @"distanceToSuggestion";
  }
  else {
    v14 = @"distance_to_suggestion";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDistanceToSuggestion:", objc_msgSend(v15, "intValue"));
  }

  if (a3) {
    v16 = @"contactRelevanceScore";
  }
  else {
    v16 = @"contact_relevance_score";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v17 doubleValue];
    objc_msgSend(a1, "setContactRelevanceScore:");
  }

  v18 = [v5 objectForKeyedSubscript:@"matchedUsingName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMatchedUsingName:", objc_msgSend(v18, "BOOLValue"));
  }

  v19 = [v5 objectForKeyedSubscript:@"matchedUsingOrganization"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMatchedUsingOrganization:", objc_msgSend(v19, "BOOLValue"));
  }

  v20 = [v5 objectForKeyedSubscript:@"matchedUsingAddress"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMatchedUsingAddress:", objc_msgSend(v20, "BOOLValue"));
  }

  v21 = [v5 objectForKeyedSubscript:@"matchedUsingLabel"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMatchedUsingLabel:", objc_msgSend(v21, "BOOLValue"));
  }

  v22 = [v5 objectForKeyedSubscript:@"matchedUsingEventName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMatchedUsingEventName:", objc_msgSend(v22, "BOOLValue"));
  }

  if (a3) {
    v23 = @"peopleSuggesterRank";
  }
  else {
    v23 = @"people_suggester_rank";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPeopleSuggesterRank:", objc_msgSend(v24, "intValue"));
  }

  v25 = [v5 objectForKeyedSubscript:@"age"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAge:", objc_msgSend(v25, "intValue"));
  }

  if (a3) {
    v26 = @"serverEntryType";
  }
  else {
    v26 = @"server_entry_type";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = v27;
    if ([v28 isEqualToString:@"QUERY"])
    {
      uint64_t v29 = 0;
    }
    else if ([v28 isEqualToString:@"BUSINESS"])
    {
      uint64_t v29 = 1;
    }
    else if ([v28 isEqualToString:@"ADDRESS"])
    {
      uint64_t v29 = 2;
    }
    else if ([v28 isEqualToString:@"CATEGORY"])
    {
      uint64_t v29 = 3;
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_96;
    }
    uint64_t v29 = [v27 intValue];
  }
  [a1 setServerEntryType:v29];
LABEL_96:

  if (a3) {
    v30 = @"isFavorite";
  }
  else {
    v30 = @"is_favorite";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsFavorite:", objc_msgSend(v31, "BOOLValue"));
  }

  if (a3) {
    v32 = @"poiOpenState";
  }
  else {
    v32 = @"poi_open_state";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v33;
    if ([v34 isEqualToString:@"POI_IS_CURRENTLY_CLOSED"])
    {
      uint64_t v35 = 0;
    }
    else if ([v34 isEqualToString:@"POI_IS_PERMANENTLY_CLOSED"])
    {
      uint64_t v35 = 1;
    }
    else if ([v34 isEqualToString:@"POI_IS_CURRENTLY_OPEN"])
    {
      uint64_t v35 = 2;
    }
    else if ([v34 isEqualToString:@"POI_IS_OPENING_SOON"])
    {
      uint64_t v35 = 3;
    }
    else if ([v34 isEqualToString:@"POI_IS_CLOSING_SOON"])
    {
      uint64_t v35 = 4;
    }
    else
    {
      uint64_t v35 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_120;
    }
    uint64_t v35 = [v33 intValue];
  }
  [a1 setPoiOpenState:v35];
LABEL_120:

  if (a3) {
    v36 = @"mapsSuggestionsContactRevelanceScore";
  }
  else {
    v36 = @"maps_suggestions_contact_revelance_score";
  }
  id v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v37 doubleValue];
    objc_msgSend(a1, "setMapsSuggestionsContactRevelanceScore:");
  }

  if (a3) {
    uint64_t v38 = @"mapsSuggestionsPoiRevelanceScore";
  }
  else {
    uint64_t v38 = @"maps_suggestions_poi_revelance_score";
  }
  v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v39 doubleValue];
    objc_msgSend(a1, "setMapsSuggestionsPoiRevelanceScore:");
  }

  if (a3) {
    v40 = @"mapsSuggestionsIsTouristScore";
  }
  else {
    v40 = @"maps_suggestions_is_tourist_score";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v41 doubleValue];
    objc_msgSend(a1, "setMapsSuggestionsIsTouristScore:");
  }

  if (a3) {
    v42 = @"discreteFeatureValuesAvailable";
  }
  else {
    v42 = @"discrete_feature_values_available";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDiscreteFeatureValuesAvailable:", objc_msgSend(v43, "BOOLValue"));
  }

  if (a3) {
    v44 = @"suggestionSectionType";
  }
  else {
    v44 = @"suggestion_section_type";
  }
  uint64_t v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46 = (void *)[v45 copy];
    [a1 setSuggestionSectionType:v46];
  }
  if (a3) {
    id v47 = @"isProminentResult";
  }
  else {
    id v47 = @"is_prominent_result";
  }
  double v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsProminentResult:", objc_msgSend(v48, "BOOLValue"));
  }

  if (a3) {
    uint64_t v49 = @"subactionMetaData";
  }
  else {
    uint64_t v49 = @"subaction_meta_data";
  }
  v50 = [v5 objectForKeyedSubscript:v49];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = [GEOSubactionMetaData alloc];
    if (a3) {
      uint64_t v52 = [(GEOSubactionMetaData *)v51 initWithJSON:v50];
    }
    else {
      uint64_t v52 = [(GEOSubactionMetaData *)v51 initWithDictionary:v50];
    }
    v53 = (void *)v52;
    [a1 setSubactionMetaData:v52];
  }
  if (a3) {
    v54 = @"autocompleteResultCellType";
  }
  else {
    v54 = @"autocomplete_result_cell_type";
  }
  v55 = [v5 objectForKeyedSubscript:v54];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v56 = v55;
    if ([v56 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_DEFAULT"])
    {
      uint64_t v57 = 0;
    }
    else if ([v56 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_QUERY"])
    {
      uint64_t v57 = 1;
    }
    else if ([v56 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT"])
    {
      uint64_t v57 = 2;
    }
    else if ([v56 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_TWO_LINE"])
    {
      uint64_t v57 = 3;
    }
    else if ([v56 isEqualToString:@"AUTOCOMPLETE_RESULT_CELL_TYPE_PROMINENT_RESULT_TWO_LINE"])
    {
      uint64_t v57 = 4;
    }
    else
    {
      uint64_t v57 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_177;
    }
    uint64_t v57 = [v55 intValue];
  }
  [a1 setAutocompleteResultCellType:v57];
LABEL_177:

  if (a3) {
    v58 = @"serverSectionIndex";
  }
  else {
    v58 = @"server_section_index";
  }
  v59 = [v5 objectForKeyedSubscript:v58];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setServerSectionIndex:", objc_msgSend(v59, "intValue"));
  }

  if (a3) {
    v60 = @"serverItemIndexInSection";
  }
  else {
    v60 = @"server_item_index_in_section";
  }
  v61 = [v5 objectForKeyedSubscript:v60];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setServerItemIndexInSection:", objc_msgSend(v61, "intValue"));
  }

  if (a3) {
    v62 = @"tapBehavior";
  }
  else {
    v62 = @"tap_behavior";
  }
  v63 = [v5 objectForKeyedSubscript:v62];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v64 = v63;
    if ([v64 isEqualToString:@"SHOW_RESULTS_ON_MAP"]) {
      uint64_t v65 = 0;
    }
    else {
      uint64_t v65 = [v64 isEqualToString:@"SHOW_RESULTS_IN_LIST_VIEW"];
    }

    goto LABEL_197;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v65 = [v63 intValue];
LABEL_197:
    [a1 setTapBehavior:v65];
  }

  if (a3) {
    v66 = @"distanceToSuggestionFromViewportCenter";
  }
  else {
    v66 = @"distance_to_suggestion_from_viewport_center";
  }
  v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v67 doubleValue];
    objc_msgSend(a1, "setDistanceToSuggestionFromViewportCenter:");
  }

  if (a3) {
    v68 = @"timeSinceLastInteractedSeconds";
  }
  else {
    v68 = @"time_since_last_interacted_seconds";
  }
  v69 = [v5 objectForKeyedSubscript:v68];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v69 doubleValue];
    objc_msgSend(a1, "setTimeSinceLastInteractedSeconds:");
  }

  if (a3) {
    v70 = @"isContainedInViewport";
  }
  else {
    v70 = @"is_contained_in_viewport";
  }
  v71 = [v5 objectForKeyedSubscript:v70];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsContainedInViewport:", objc_msgSend(v71, "BOOLValue"));
  }

  if (a3) {
    v72 = @"timeSinceMapViewportChangedSeconds";
  }
  else {
    v72 = @"time_since_map_viewport_changed_seconds";
  }
  v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v73 doubleValue];
    objc_msgSend(a1, "setTimeSinceMapViewportChangedSeconds:");
  }

  if (a3) {
    v74 = @"hyperlinkMetadata";
  }
  else {
    v74 = @"hyperlink_metadata";
  }
  v75 = [v5 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v76 = [GEOHyperlinkMetaData alloc];
    if (a3) {
      uint64_t v77 = [(GEOHyperlinkMetaData *)v76 initWithJSON:v75];
    }
    else {
      uint64_t v77 = [(GEOHyperlinkMetaData *)v76 initWithDictionary:v75];
    }
    v78 = (void *)v77;
    [a1 setHyperlinkMetadata:v77];
  }
  if (a3) {
    v79 = @"isContactWithHomeLocation";
  }
  else {
    v79 = @"is_contact_with_home_location";
  }
  v80 = [v5 objectForKeyedSubscript:v79];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsContactWithHomeLocation:", objc_msgSend(v80, "BOOLValue"));
  }

  if (a3) {
    v81 = @"isContactWithWorkLocation";
  }
  else {
    v81 = @"is_contact_with_work_location";
  }
  v82 = [v5 objectForKeyedSubscript:v81];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsContactWithWorkLocation:", objc_msgSend(v82, "BOOLValue"));
  }

  if (a3) {
    v83 = @"isContactWithSchoolLocation";
  }
  else {
    v83 = @"is_contact_with_school_location";
  }
  v84 = [v5 objectForKeyedSubscript:v83];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsContactWithSchoolLocation:", objc_msgSend(v84, "BOOLValue"));
  }

  if (a3) {
    v85 = @"isContactWithOtherLocation";
  }
  else {
    v85 = @"is_contact_with_other_location";
  }
  v86 = [v5 objectForKeyedSubscript:v85];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsContactWithOtherLocation:", objc_msgSend(v86, "BOOLValue"));
  }

  if (a3) {
    v87 = @"isContactWithLiveLocation";
  }
  else {
    v87 = @"is_contact_with_live_location";
  }
  v88 = [v5 objectForKeyedSubscript:v87];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsContactWithLiveLocation:", objc_msgSend(v88, "BOOLValue"));
  }

  if (a3) {
    v89 = @"isContactWithNoLocation";
  }
  else {
    v89 = @"is_contact_with_no_location";
  }
  v90 = [v5 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsContactWithNoLocation:", objc_msgSend(v90, "BOOLValue"));
  }

  if (a3) {
    uint64_t v91 = @"prefixLastTokenMatchCover";
  }
  else {
    uint64_t v91 = @"prefix_last_token_match_cover";
  }
  v92 = [v5 objectForKeyedSubscript:v91];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v92 floatValue];
    objc_msgSend(a1, "setPrefixLastTokenMatchCover:");
  }

  if (a3) {
    v93 = @"prefixMatchCover";
  }
  else {
    v93 = @"prefix_match_cover";
  }
  v94 = [v5 objectForKeyedSubscript:v93];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v94 floatValue];
    objc_msgSend(a1, "setPrefixMatchCover:");
  }

  if (a3) {
    v95 = @"prefixMatchPosition";
  }
  else {
    v95 = @"prefix_match_position";
  }
  v96 = [v5 objectForKeyedSubscript:v95];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixMatchPosition:", objc_msgSend(v96, "intValue"));
  }

  if (a3) {
    v97 = @"prefixMatchWordBoundary";
  }
  else {
    v97 = @"prefix_match_word_boundary";
  }
  int v98 = [v5 objectForKeyedSubscript:v97];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixMatchWordBoundary:", objc_msgSend(v98, "intValue"));
  }

  if (a3) {
    v99 = @"prefixTokenMatchLengthFirstQueryToken";
  }
  else {
    v99 = @"prefix_token_match_length_first_query_token";
  }
  v100 = [v5 objectForKeyedSubscript:v99];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixTokenMatchLengthFirstQueryToken:", objc_msgSend(v100, "intValue"));
  }

  if (a3) {
    v101 = @"prefixTokenMatchPositionFirstQueryToken";
  }
  else {
    v101 = @"prefix_token_match_position_first_query_token";
  }
  v102 = [v5 objectForKeyedSubscript:v101];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixTokenMatchPositionFirstQueryToken:", objc_msgSend(v102, "intValue"));
  }

  if (a3) {
    v103 = @"prefixTokenIsNumberFirstQueryToken";
  }
  else {
    v103 = @"prefix_token_is_number_first_query_token";
  }
  v104 = [v5 objectForKeyedSubscript:v103];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixTokenIsNumberFirstQueryToken:", objc_msgSend(v104, "BOOLValue"));
  }

  if (a3) {
    v105 = @"prefixTokenMatchLocationFirstQueryToken";
  }
  else {
    v105 = @"prefix_token_match_location_first_query_token";
  }
  v106 = [v5 objectForKeyedSubscript:v105];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixTokenMatchLocationFirstQueryToken:", objc_msgSend(v106, "intValue"));
  }

  if (a3) {
    v107 = @"prefixTokenMatchLengthSecondQueryToken";
  }
  else {
    v107 = @"prefix_token_match_length_second_query_token";
  }
  v108 = [v5 objectForKeyedSubscript:v107];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixTokenMatchLengthSecondQueryToken:", objc_msgSend(v108, "intValue"));
  }

  if (a3) {
    v109 = @"prefixTokenMatchPositionSecondQueryToken";
  }
  else {
    v109 = @"prefix_token_match_position_second_query_token";
  }
  v110 = [v5 objectForKeyedSubscript:v109];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixTokenMatchPositionSecondQueryToken:", objc_msgSend(v110, "intValue"));
  }

  if (a3) {
    v111 = @"prefixTokenIsNumberSecondQueryToken";
  }
  else {
    v111 = @"prefix_token_is_number_second_query_token";
  }
  v112 = [v5 objectForKeyedSubscript:v111];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixTokenIsNumberSecondQueryToken:", objc_msgSend(v112, "BOOLValue"));
  }

  if (a3) {
    v113 = @"prefixTokenMatchLocationSecondQueryToken";
  }
  else {
    v113 = @"prefix_token_match_location_second_query_token";
  }
  v114 = [v5 objectForKeyedSubscript:v113];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPrefixTokenMatchLocationSecondQueryToken:", objc_msgSend(v114, "intValue"));
  }

  a1 = a1;
LABEL_317:

  return a1;
}

- (GEOClientACSuggestionEntry)initWithJSON:(id)a3
{
  return (GEOClientACSuggestionEntry *)-[GEOClientACSuggestionEntry _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_75;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_75;
    }
    GEOClientACSuggestionEntryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOSubactionMetaData *)self->_subactionMetaData readAll:1];
    [(GEOHyperlinkMetaData *)self->_hyperlinkMetadata readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOClientACSuggestionEntryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOClientACSuggestionEntryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOClientACSuggestionEntryIsDirty((uint64_t)self) & 1) == 0)
  {
    id v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v10 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
    goto LABEL_105;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOClientACSuggestionEntry *)self readAll:0];
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(void *)&flags & 0x200000000000) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_61;
    }
  }
  else if ((*(void *)&flags & 0x200000000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteDoubleField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(void *)&flags & 0x20000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteDoubleField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x20000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&flags & 0x40000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x40000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&flags & 0x4000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x4000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&flags & 0x10000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x10000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&flags & 0x8000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x8000000000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x800000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x800000) == 0)
  {
LABEL_16:
    if ((*(void *)&flags & 0x1000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x1000000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_20;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteDoubleField();
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&flags & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  if ((*(void *)&self->_flags & 0x10000000) != 0) {
LABEL_22:
  }
    PBDataWriterWriteBOOLField();
LABEL_23:
  if (self->_suggestionSectionType) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_flags + 4) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_subactionMetaData) {
    PBDataWriterWriteSubmessage();
  }
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
    {
LABEL_31:
      if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_80;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_34;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_35;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteDoubleField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_35:
    if ((*(void *)&v6 & 0x800000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteDoubleField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(void *)&v6 & 0x800000000) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_flags & 0x80) != 0) {
LABEL_37:
  }
    PBDataWriterWriteDoubleField();
LABEL_38:
  if (self->_hyperlinkMetadata) {
    PBDataWriterWriteSubmessage();
  }
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
    if ((*(void *)&v7 & 0x400000000) == 0)
    {
LABEL_42:
      if ((*(void *)&v7 & 0x200000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_88;
    }
  }
  else if ((*(void *)&v7 & 0x400000000) == 0)
  {
    goto LABEL_42;
  }
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(void *)&v7 & 0x200000000) == 0)
  {
LABEL_43:
    if ((*(void *)&v7 & 0x100000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(void *)&v7 & 0x100000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteFloatField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteFloatField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_52:
    if ((*(void *)&v7 & 0x80000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(void *)&v7 & 0x80000000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteBOOLField();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_56:
    if ((*(void *)&v7 & 0x100000000000) == 0) {
      goto LABEL_57;
    }
LABEL_102:
    PBDataWriterWriteBOOLField();
    if ((*(void *)&self->_flags & 0x100000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_103;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(void *)&v7 & 0x100000000000) != 0) {
    goto LABEL_102;
  }
LABEL_57:
  if ((*(_DWORD *)&v7 & 0x100000) != 0) {
LABEL_103:
  }
    PBDataWriterWriteInt32Field();
LABEL_105:
}

- (void)copyTo:(id)a3
{
  id v8 = (id *)a3;
  [(GEOClientACSuggestionEntry *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 26) = self->_readerMarkPos;
  *((_DWORD *)v8 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v8;
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
  {
    *((_DWORD *)v8 + 47) = self->_suggestionType;
    v8[27] = (id)((unint64_t)v8[27] | 0x4000000);
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(void *)&flags & 0x200000000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_62;
    }
  }
  else if ((*(void *)&flags & 0x200000000000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v8 + 213) = self->_shownToUser;
  v8[27] = (id)((unint64_t)v8[27] | 0x200000000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_63;
  }
LABEL_62:
  v8[4] = *(id *)&self->_fractionOfMatch;
  v8[27] = (id)((unint64_t)v8[27] | 4);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v8 + 31) = self->_distanceToSuggestion;
  v8[27] = (id)((unint64_t)v8[27] | 0x400);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_6:
    if ((*(void *)&flags & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_65;
  }
LABEL_64:
  v8[2] = *(id *)&self->_contactRelevanceScore;
  v8[27] = (id)((unint64_t)v8[27] | 1);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(void *)&flags & 0x40000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((unsigned char *)v8 + 209) = self->_matchedUsingName;
  v8[27] = (id)((unint64_t)v8[27] | 0x20000000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&flags & 0x4000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((unsigned char *)v8 + 210) = self->_matchedUsingOrganization;
  v8[27] = (id)((unint64_t)v8[27] | 0x40000000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x4000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&flags & 0x10000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((unsigned char *)v8 + 206) = self->_matchedUsingAddress;
  v8[27] = (id)((unint64_t)v8[27] | 0x4000000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x10000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&flags & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((unsigned char *)v8 + 208) = self->_matchedUsingLabel;
  v8[27] = (id)((unint64_t)v8[27] | 0x10000000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x8000000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((unsigned char *)v8 + 207) = self->_matchedUsingEventName;
  v8[27] = (id)((unint64_t)v8[27] | 0x8000000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v8 + 32) = self->_peopleSuggesterRank;
  v8[27] = (id)((unint64_t)v8[27] | 0x800);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&flags & 0x800000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v8 + 29) = self->_age;
  v8[27] = (id)((unint64_t)v8[27] | 0x100);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x800000) == 0)
  {
LABEL_14:
    if ((*(void *)&flags & 0x1000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v8 + 44) = self->_serverEntryType;
  v8[27] = (id)((unint64_t)v8[27] | 0x800000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(void *)&flags & 0x1000000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&flags & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((unsigned char *)v8 + 204) = self->_isFavorite;
  v8[27] = (id)((unint64_t)v8[27] | 0x1000000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)v8 + 33) = self->_poiOpenState;
  v8[27] = (id)((unint64_t)v8[27] | 0x1000);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_76;
  }
LABEL_75:
  v8[6] = *(id *)&self->_mapsSuggestionsContactRevelanceScore;
  v8[27] = (id)((unint64_t)v8[27] | 8);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x20) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&flags & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_77;
  }
LABEL_76:
  v8[8] = *(id *)&self->_mapsSuggestionsPoiRevelanceScore;
  v8[27] = (id)((unint64_t)v8[27] | 0x20);
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&flags & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_77:
  v8[7] = *(id *)&self->_mapsSuggestionsIsTouristScore;
  v8[27] = (id)((unint64_t)v8[27] | 0x10);
  if ((*(void *)&self->_flags & 0x10000000) != 0)
  {
LABEL_20:
    *((unsigned char *)v8 + 196) = self->_discreteFeatureValuesAvailable;
    v8[27] = (id)((unint64_t)v8[27] | 0x10000000);
  }
LABEL_21:
  if (self->_suggestionSectionType)
  {
    objc_msgSend(v8, "setSuggestionSectionType:");
    int v4 = v8;
  }
  if ((*((unsigned char *)&self->_flags + 4) & 0x20) != 0)
  {
    *((unsigned char *)v4 + 205) = self->_isProminentResult;
    v4[27] = (id)((unint64_t)v4[27] | 0x2000000000);
  }
  if (self->_subactionMetaData)
  {
    objc_msgSend(v8, "setSubactionMetaData:");
    int v4 = v8;
  }
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_autocompleteResultCellType;
    v4[27] = (id)((unint64_t)v4[27] | 0x200);
    $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
    if ((*(_DWORD *)&v6 & 0x2000000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_81;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
    goto LABEL_29;
  }
  *((_DWORD *)v4 + 46) = self->_serverSectionIndex;
  v4[27] = (id)((unint64_t)v4[27] | 0x2000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)v4 + 45) = self->_serverItemIndexInSection;
  v4[27] = (id)((unint64_t)v4[27] | 0x1000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_32;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)v4 + 48) = self->_tapBehavior;
  v4[27] = (id)((unint64_t)v4[27] | 0x8000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_84;
  }
LABEL_83:
  v4[3] = *(id *)&self->_distanceToSuggestionFromViewportCenter;
  v4[27] = (id)((unint64_t)v4[27] | 2);
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_33:
    if ((*(void *)&v6 & 0x800000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_85;
  }
LABEL_84:
  v4[11] = *(id *)&self->_timeSinceLastInteractedSeconds;
  v4[27] = (id)((unint64_t)v4[27] | 0x40);
  $CD8BBF1E49DB7E485009711ADA3FCADB v6 = self->_flags;
  if ((*(void *)&v6 & 0x800000000) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_85:
  *((unsigned char *)v4 + 203) = self->_isContainedInViewport;
  v4[27] = (id)((unint64_t)v4[27] | 0x800000000);
  if ((*(void *)&self->_flags & 0x80) != 0)
  {
LABEL_35:
    v4[12] = *(id *)&self->_timeSinceMapViewportChangedSeconds;
    v4[27] = (id)((unint64_t)v4[27] | 0x80);
  }
LABEL_36:
  if (self->_hyperlinkMetadata)
  {
    objc_msgSend(v8, "setHyperlinkMetadata:");
    int v4 = v8;
  }
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x20000000) != 0)
  {
    *((unsigned char *)v4 + 197) = self->_isContactWithHomeLocation;
    v4[27] = (id)((unint64_t)v4[27] | 0x20000000);
    $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
    if ((*(void *)&v7 & 0x400000000) == 0)
    {
LABEL_40:
      if ((*(void *)&v7 & 0x200000000) == 0) {
        goto LABEL_41;
      }
      goto LABEL_89;
    }
  }
  else if ((*(void *)&v7 & 0x400000000) == 0)
  {
    goto LABEL_40;
  }
  *((unsigned char *)v4 + 202) = self->_isContactWithWorkLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x400000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(void *)&v7 & 0x200000000) == 0)
  {
LABEL_41:
    if ((*(void *)&v7 & 0x100000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((unsigned char *)v4 + 201) = self->_isContactWithSchoolLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x200000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(void *)&v7 & 0x100000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((unsigned char *)v4 + 200) = self->_isContactWithOtherLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x100000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((unsigned char *)v4 + 198) = self->_isContactWithLiveLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x40000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v7 & 0x2000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((unsigned char *)v4 + 199) = self->_isContactWithNoLocation;
  v4[27] = (id)((unint64_t)v4[27] | 0x80000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x2000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v7 & 0x4000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v4 + 34) = LODWORD(self->_prefixLastTokenMatchCover);
  v4[27] = (id)((unint64_t)v4[27] | 0x2000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v7 & 0x8000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v4 + 35) = LODWORD(self->_prefixMatchCover);
  v4[27] = (id)((unint64_t)v4[27] | 0x4000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v7 & 0x10000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v4 + 36) = self->_prefixMatchPosition;
  v4[27] = (id)((unint64_t)v4[27] | 0x8000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x10000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v7 & 0x20000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)v4 + 37) = self->_prefixMatchWordBoundary;
  v4[27] = (id)((unint64_t)v4[27] | 0x10000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x20000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v7 & 0x200000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)v4 + 38) = self->_prefixTokenMatchLengthFirstQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x20000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x200000) == 0)
  {
LABEL_50:
    if ((*(void *)&v7 & 0x80000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)v4 + 42) = self->_prefixTokenMatchPositionFirstQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x200000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(void *)&v7 & 0x80000000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v7 & 0x80000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((unsigned char *)v4 + 211) = self->_prefixTokenIsNumberFirstQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x80000000000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x80000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v7 & 0x40000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)v4 + 40) = self->_prefixTokenMatchLocationFirstQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x80000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x40000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v7 & 0x400000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)v4 + 39) = self->_prefixTokenMatchLengthSecondQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x40000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(_DWORD *)&v7 & 0x400000) == 0)
  {
LABEL_54:
    if ((*(void *)&v7 & 0x100000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)v4 + 43) = self->_prefixTokenMatchPositionSecondQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x400000);
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = self->_flags;
  if ((*(void *)&v7 & 0x100000000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v7 & 0x100000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }
LABEL_103:
  *((unsigned char *)v4 + 212) = self->_prefixTokenIsNumberSecondQueryToken;
  v4[27] = (id)((unint64_t)v4[27] | 0x100000000000);
  if ((*(void *)&self->_flags & 0x100000) != 0)
  {
LABEL_56:
    *((_DWORD *)v4 + 41) = self->_prefixTokenMatchLocationSecondQueryToken;
    v4[27] = (id)((unint64_t)v4[27] | 0x100000);
  }
LABEL_57:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOClientACSuggestionEntry *)self readAll:0];
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x4000000) != 0)
    {
      *(_DWORD *)(v5 + 188) = self->_suggestionType;
      *(void *)(v5 + 216) |= 0x4000000uLL;
      $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
      if ((*(void *)&flags & 0x200000000000) == 0)
      {
LABEL_7:
        if ((*(unsigned char *)&flags & 4) == 0) {
          goto LABEL_8;
        }
        goto LABEL_59;
      }
    }
    else if ((*(void *)&flags & 0x200000000000) == 0)
    {
      goto LABEL_7;
    }
    *(unsigned char *)(v5 + 213) = self->_shownToUser;
    *(void *)(v5 + 216) |= 0x200000000000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&flags & 0x400) == 0) {
        goto LABEL_9;
      }
      goto LABEL_60;
    }
LABEL_59:
    *(double *)(v5 + 32) = self->_fractionOfMatch;
    *(void *)(v5 + 216) |= 4uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_61;
    }
LABEL_60:
    *(_DWORD *)(v5 + 124) = self->_distanceToSuggestion;
    *(void *)(v5 + 216) |= 0x400uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_10:
      if ((*(void *)&flags & 0x20000000000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_62;
    }
LABEL_61:
    *(double *)(v5 + 16) = self->_contactRelevanceScore;
    *(void *)(v5 + 216) |= 1uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(void *)&flags & 0x20000000000) == 0)
    {
LABEL_11:
      if ((*(void *)&flags & 0x40000000000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_63;
    }
LABEL_62:
    *(unsigned char *)(v5 + 209) = self->_matchedUsingName;
    *(void *)(v5 + 216) |= 0x20000000000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(void *)&flags & 0x40000000000) == 0)
    {
LABEL_12:
      if ((*(void *)&flags & 0x4000000000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_64;
    }
LABEL_63:
    *(unsigned char *)(v5 + 210) = self->_matchedUsingOrganization;
    *(void *)(v5 + 216) |= 0x40000000000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(void *)&flags & 0x4000000000) == 0)
    {
LABEL_13:
      if ((*(void *)&flags & 0x10000000000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_65;
    }
LABEL_64:
    *(unsigned char *)(v5 + 206) = self->_matchedUsingAddress;
    *(void *)(v5 + 216) |= 0x4000000000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(void *)&flags & 0x10000000000) == 0)
    {
LABEL_14:
      if ((*(void *)&flags & 0x8000000000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_66;
    }
LABEL_65:
    *(unsigned char *)(v5 + 208) = self->_matchedUsingLabel;
    *(void *)(v5 + 216) |= 0x10000000000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(void *)&flags & 0x8000000000) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&flags & 0x800) == 0) {
        goto LABEL_16;
      }
      goto LABEL_67;
    }
LABEL_66:
    *(unsigned char *)(v5 + 207) = self->_matchedUsingEventName;
    *(void *)(v5 + 216) |= 0x8000000000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_16:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_17;
      }
      goto LABEL_68;
    }
LABEL_67:
    *(_DWORD *)(v5 + 128) = self->_peopleSuggesterRank;
    *(void *)(v5 + 216) |= 0x800uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&flags & 0x800000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_69;
    }
LABEL_68:
    *(_DWORD *)(v5 + 116) = self->_age;
    *(void *)(v5 + 216) |= 0x100uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x800000) == 0)
    {
LABEL_18:
      if ((*(void *)&flags & 0x1000000000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_70;
    }
LABEL_69:
    *(_DWORD *)(v5 + 176) = self->_serverEntryType;
    *(void *)(v5 + 216) |= 0x800000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(void *)&flags & 0x1000000000) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&flags & 0x1000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_71;
    }
LABEL_70:
    *(unsigned char *)(v5 + 204) = self->_isFavorite;
    *(void *)(v5 + 216) |= 0x1000000000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_20:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_72;
    }
LABEL_71:
    *(_DWORD *)(v5 + 132) = self->_poiOpenState;
    *(void *)(v5 + 216) |= 0x1000uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&flags & 0x20) == 0) {
        goto LABEL_22;
      }
      goto LABEL_73;
    }
LABEL_72:
    *(double *)(v5 + 48) = self->_mapsSuggestionsContactRevelanceScore;
    *(void *)(v5 + 216) |= 8uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_22:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_74;
    }
LABEL_73:
    *(double *)(v5 + 64) = self->_mapsSuggestionsPoiRevelanceScore;
    *(void *)(v5 + 216) |= 0x20uLL;
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&flags & 0x10000000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_74:
    *(double *)(v5 + 56) = self->_mapsSuggestionsIsTouristScore;
    *(void *)(v5 + 216) |= 0x10uLL;
    if ((*(void *)&self->_flags & 0x10000000) == 0)
    {
LABEL_25:
      uint64_t v10 = [(NSString *)self->_suggestionSectionType copyWithZone:a3];
      v11 = *(void **)(v5 + 80);
      *(void *)(v5 + 80) = v10;

      if ((*((unsigned char *)&self->_flags + 4) & 0x20) != 0)
      {
        *(unsigned char *)(v5 + 205) = self->_isProminentResult;
        *(void *)(v5 + 216) |= 0x2000000000uLL;
      }
      id v12 = [(GEOSubactionMetaData *)self->_subactionMetaData copyWithZone:a3];
      v13 = *(void **)(v5 + 72);
      *(void *)(v5 + 72) = v12;

      $CD8BBF1E49DB7E485009711ADA3FCADB v14 = self->_flags;
      if ((*(_WORD *)&v14 & 0x200) != 0)
      {
        *(_DWORD *)(v5 + 120) = self->_autocompleteResultCellType;
        *(void *)(v5 + 216) |= 0x200uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v14 = self->_flags;
        if ((*(_DWORD *)&v14 & 0x2000000) == 0)
        {
LABEL_29:
          if ((*(_DWORD *)&v14 & 0x1000000) == 0) {
            goto LABEL_30;
          }
          goto LABEL_78;
        }
      }
      else if ((*(_DWORD *)&v14 & 0x2000000) == 0)
      {
        goto LABEL_29;
      }
      *(_DWORD *)(v5 + 184) = self->_serverSectionIndex;
      *(void *)(v5 + 216) |= 0x2000000uLL;
      $CD8BBF1E49DB7E485009711ADA3FCADB v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      {
LABEL_30:
        if ((*(_DWORD *)&v14 & 0x8000000) == 0) {
          goto LABEL_31;
        }
        goto LABEL_79;
      }
LABEL_78:
      *(_DWORD *)(v5 + 180) = self->_serverItemIndexInSection;
      *(void *)(v5 + 216) |= 0x1000000uLL;
      $CD8BBF1E49DB7E485009711ADA3FCADB v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x8000000) == 0)
      {
LABEL_31:
        if ((*(unsigned char *)&v14 & 2) == 0) {
          goto LABEL_32;
        }
        goto LABEL_80;
      }
LABEL_79:
      *(_DWORD *)(v5 + 192) = self->_tapBehavior;
      *(void *)(v5 + 216) |= 0x8000000uLL;
      $CD8BBF1E49DB7E485009711ADA3FCADB v14 = self->_flags;
      if ((*(unsigned char *)&v14 & 2) == 0)
      {
LABEL_32:
        if ((*(unsigned char *)&v14 & 0x40) == 0) {
          goto LABEL_33;
        }
        goto LABEL_81;
      }
LABEL_80:
      *(double *)(v5 + 24) = self->_distanceToSuggestionFromViewportCenter;
      *(void *)(v5 + 216) |= 2uLL;
      $CD8BBF1E49DB7E485009711ADA3FCADB v14 = self->_flags;
      if ((*(unsigned char *)&v14 & 0x40) == 0)
      {
LABEL_33:
        if ((*(void *)&v14 & 0x800000000) == 0) {
          goto LABEL_34;
        }
        goto LABEL_82;
      }
LABEL_81:
      *(double *)(v5 + 88) = self->_timeSinceLastInteractedSeconds;
      *(void *)(v5 + 216) |= 0x40uLL;
      $CD8BBF1E49DB7E485009711ADA3FCADB v14 = self->_flags;
      if ((*(void *)&v14 & 0x800000000) == 0)
      {
LABEL_34:
        if ((*(unsigned char *)&v14 & 0x80) == 0) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
LABEL_82:
      *(unsigned char *)(v5 + 203) = self->_isContainedInViewport;
      *(void *)(v5 + 216) |= 0x800000000uLL;
      if ((*(void *)&self->_flags & 0x80) == 0)
      {
LABEL_36:
        id v15 = [(GEOHyperlinkMetaData *)self->_hyperlinkMetadata copyWithZone:a3];
        v16 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v15;

        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x20000000) != 0)
        {
          *(unsigned char *)(v5 + 197) = self->_isContactWithHomeLocation;
          *(void *)(v5 + 216) |= 0x20000000uLL;
          $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
          if ((*(void *)&v17 & 0x400000000) == 0)
          {
LABEL_38:
            if ((*(void *)&v17 & 0x200000000) == 0) {
              goto LABEL_39;
            }
            goto LABEL_86;
          }
        }
        else if ((*(void *)&v17 & 0x400000000) == 0)
        {
          goto LABEL_38;
        }
        *(unsigned char *)(v5 + 202) = self->_isContactWithWorkLocation;
        *(void *)(v5 + 216) |= 0x400000000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(void *)&v17 & 0x200000000) == 0)
        {
LABEL_39:
          if ((*(void *)&v17 & 0x100000000) == 0) {
            goto LABEL_40;
          }
          goto LABEL_87;
        }
LABEL_86:
        *(unsigned char *)(v5 + 201) = self->_isContactWithSchoolLocation;
        *(void *)(v5 + 216) |= 0x200000000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(void *)&v17 & 0x100000000) == 0)
        {
LABEL_40:
          if ((*(_DWORD *)&v17 & 0x40000000) == 0) {
            goto LABEL_41;
          }
          goto LABEL_88;
        }
LABEL_87:
        *(unsigned char *)(v5 + 200) = self->_isContactWithOtherLocation;
        *(void *)(v5 + 216) |= 0x100000000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x40000000) == 0)
        {
LABEL_41:
          if ((*(_DWORD *)&v17 & 0x80000000) == 0) {
            goto LABEL_42;
          }
          goto LABEL_89;
        }
LABEL_88:
        *(unsigned char *)(v5 + 198) = self->_isContactWithLiveLocation;
        *(void *)(v5 + 216) |= 0x40000000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x80000000) == 0)
        {
LABEL_42:
          if ((*(_WORD *)&v17 & 0x2000) == 0) {
            goto LABEL_43;
          }
          goto LABEL_90;
        }
LABEL_89:
        *(unsigned char *)(v5 + 199) = self->_isContactWithNoLocation;
        *(void *)(v5 + 216) |= 0x80000000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_WORD *)&v17 & 0x2000) == 0)
        {
LABEL_43:
          if ((*(_WORD *)&v17 & 0x4000) == 0) {
            goto LABEL_44;
          }
          goto LABEL_91;
        }
LABEL_90:
        *(float *)(v5 + 136) = self->_prefixLastTokenMatchCover;
        *(void *)(v5 + 216) |= 0x2000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_WORD *)&v17 & 0x4000) == 0)
        {
LABEL_44:
          if ((*(_WORD *)&v17 & 0x8000) == 0) {
            goto LABEL_45;
          }
          goto LABEL_92;
        }
LABEL_91:
        *(float *)(v5 + 140) = self->_prefixMatchCover;
        *(void *)(v5 + 216) |= 0x4000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_WORD *)&v17 & 0x8000) == 0)
        {
LABEL_45:
          if ((*(_DWORD *)&v17 & 0x10000) == 0) {
            goto LABEL_46;
          }
          goto LABEL_93;
        }
LABEL_92:
        *(_DWORD *)(v5 + 144) = self->_prefixMatchPosition;
        *(void *)(v5 + 216) |= 0x8000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x10000) == 0)
        {
LABEL_46:
          if ((*(_DWORD *)&v17 & 0x20000) == 0) {
            goto LABEL_47;
          }
          goto LABEL_94;
        }
LABEL_93:
        *(_DWORD *)(v5 + 148) = self->_prefixMatchWordBoundary;
        *(void *)(v5 + 216) |= 0x10000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x20000) == 0)
        {
LABEL_47:
          if ((*(_DWORD *)&v17 & 0x200000) == 0) {
            goto LABEL_48;
          }
          goto LABEL_95;
        }
LABEL_94:
        *(_DWORD *)(v5 + 152) = self->_prefixTokenMatchLengthFirstQueryToken;
        *(void *)(v5 + 216) |= 0x20000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x200000) == 0)
        {
LABEL_48:
          if ((*(void *)&v17 & 0x80000000000) == 0) {
            goto LABEL_49;
          }
          goto LABEL_96;
        }
LABEL_95:
        *(_DWORD *)(v5 + 168) = self->_prefixTokenMatchPositionFirstQueryToken;
        *(void *)(v5 + 216) |= 0x200000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(void *)&v17 & 0x80000000000) == 0)
        {
LABEL_49:
          if ((*(_DWORD *)&v17 & 0x80000) == 0) {
            goto LABEL_50;
          }
          goto LABEL_97;
        }
LABEL_96:
        *(unsigned char *)(v5 + 211) = self->_prefixTokenIsNumberFirstQueryToken;
        *(void *)(v5 + 216) |= 0x80000000000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x80000) == 0)
        {
LABEL_50:
          if ((*(_DWORD *)&v17 & 0x40000) == 0) {
            goto LABEL_51;
          }
          goto LABEL_98;
        }
LABEL_97:
        *(_DWORD *)(v5 + 160) = self->_prefixTokenMatchLocationFirstQueryToken;
        *(void *)(v5 + 216) |= 0x80000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x40000) == 0)
        {
LABEL_51:
          if ((*(_DWORD *)&v17 & 0x400000) == 0) {
            goto LABEL_52;
          }
          goto LABEL_99;
        }
LABEL_98:
        *(_DWORD *)(v5 + 156) = self->_prefixTokenMatchLengthSecondQueryToken;
        *(void *)(v5 + 216) |= 0x40000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(_DWORD *)&v17 & 0x400000) == 0)
        {
LABEL_52:
          if ((*(void *)&v17 & 0x100000000000) == 0) {
            goto LABEL_53;
          }
          goto LABEL_100;
        }
LABEL_99:
        *(_DWORD *)(v5 + 172) = self->_prefixTokenMatchPositionSecondQueryToken;
        *(void *)(v5 + 216) |= 0x400000uLL;
        $CD8BBF1E49DB7E485009711ADA3FCADB v17 = self->_flags;
        if ((*(void *)&v17 & 0x100000000000) == 0)
        {
LABEL_53:
          if ((*(_DWORD *)&v17 & 0x100000) == 0)
          {
LABEL_55:
            id v18 = (id)v5;
            goto LABEL_56;
          }
LABEL_54:
          *(_DWORD *)(v5 + 164) = self->_prefixTokenMatchLocationSecondQueryToken;
          *(void *)(v5 + 216) |= 0x100000uLL;
          goto LABEL_55;
        }
LABEL_100:
        *(unsigned char *)(v5 + 212) = self->_prefixTokenIsNumberSecondQueryToken;
        *(void *)(v5 + 216) |= 0x100000000000uLL;
        if ((*(void *)&self->_flags & 0x100000) == 0) {
          goto LABEL_55;
        }
        goto LABEL_54;
      }
LABEL_35:
      *(double *)(v5 + 96) = self->_timeSinceMapViewportChangedSeconds;
      *(void *)(v5 + 216) |= 0x80uLL;
      goto LABEL_36;
    }
LABEL_24:
    *(unsigned char *)(v5 + 196) = self->_discreteFeatureValuesAvailable;
    *(void *)(v5 + 216) |= 0x10000000uLL;
    goto LABEL_25;
  }
  $CD8BBF1E49DB7E485009711ADA3FCADB v7 = reader;
  objc_sync_enter(v7);
  if ((*((unsigned char *)&self->_flags + 6) & 2) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOClientACSuggestionEntryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_56:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_295;
  }
  [(GEOClientACSuggestionEntry *)self readAll:1];
  [v4 readAll:1];
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  uint64_t v6 = *((void *)v4 + 27);
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_suggestionType != *((_DWORD *)v4 + 47)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x200000000000) != 0)
  {
    if ((v6 & 0x200000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_shownToUser)
    {
      if (!*((unsigned char *)v4 + 213)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 213))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x200000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_fractionOfMatch != *((double *)v4 + 4)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_distanceToSuggestion != *((_DWORD *)v4 + 31)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_295;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_contactRelevanceScore != *((double *)v4 + 2)) {
      goto LABEL_295;
    }
  }
  else if (v6)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x20000000000) != 0)
  {
    if ((v6 & 0x20000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_matchedUsingName)
    {
      if (!*((unsigned char *)v4 + 209)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 209))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x20000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x40000000000) != 0)
  {
    if ((v6 & 0x40000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_matchedUsingOrganization)
    {
      if (!*((unsigned char *)v4 + 210)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 210))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x40000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x4000000000) != 0)
  {
    if ((v6 & 0x4000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_matchedUsingAddress)
    {
      if (!*((unsigned char *)v4 + 206)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 206))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x4000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x10000000000) != 0)
  {
    if ((v6 & 0x10000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_matchedUsingLabel)
    {
      if (!*((unsigned char *)v4 + 208)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 208))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x10000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x8000000000) != 0)
  {
    if ((v6 & 0x8000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_matchedUsingEventName)
    {
      if (!*((unsigned char *)v4 + 207)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 207))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x8000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_peopleSuggesterRank != *((_DWORD *)v4 + 32)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_age != *((_DWORD *)v4 + 29)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_serverEntryType != *((_DWORD *)v4 + 44)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x1000000000) != 0)
  {
    if ((v6 & 0x1000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isFavorite)
    {
      if (!*((unsigned char *)v4 + 204)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 204))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x1000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_poiOpenState != *((_DWORD *)v4 + 33)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mapsSuggestionsContactRevelanceScore != *((double *)v4 + 6)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_295;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_mapsSuggestionsPoiRevelanceScore != *((double *)v4 + 8)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_295;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mapsSuggestionsIsTouristScore != *((double *)v4 + 7)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_295;
    }
    if (self->_discreteFeatureValuesAvailable)
    {
      if (!*((unsigned char *)v4 + 196)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 196))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_295;
  }
  suggestionSectionType = self->_suggestionSectionType;
  if ((unint64_t)suggestionSectionType | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](suggestionSectionType, "isEqual:")) {
      goto LABEL_295;
    }
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    uint64_t v6 = *((void *)v4 + 27);
  }
  if ((*(void *)&flags & 0x2000000000) != 0)
  {
    if ((v6 & 0x2000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isProminentResult)
    {
      if (!*((unsigned char *)v4 + 205)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 205))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x2000000000) != 0)
  {
    goto LABEL_295;
  }
  subactionMetaData = self->_subactionMetaData;
  if ((unint64_t)subactionMetaData | *((void *)v4 + 9))
  {
    if (!-[GEOSubactionMetaData isEqual:](subactionMetaData, "isEqual:")) {
      goto LABEL_295;
    }
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    uint64_t v6 = *((void *)v4 + 27);
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_autocompleteResultCellType != *((_DWORD *)v4 + 30)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_serverSectionIndex != *((_DWORD *)v4 + 46)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_serverItemIndexInSection != *((_DWORD *)v4 + 45)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_tapBehavior != *((_DWORD *)v4 + 48)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_distanceToSuggestionFromViewportCenter != *((double *)v4 + 3)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_295;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_timeSinceLastInteractedSeconds != *((double *)v4 + 11)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x800000000) != 0)
  {
    if ((v6 & 0x800000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isContainedInViewport)
    {
      if (!*((unsigned char *)v4 + 203)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 203))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x800000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_timeSinceMapViewportChangedSeconds != *((double *)v4 + 12)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_295;
  }
  hyperlinkMetadata = self->_hyperlinkMetadata;
  if ((unint64_t)hyperlinkMetadata | *((void *)v4 + 5))
  {
    if (!-[GEOHyperlinkMetaData isEqual:](hyperlinkMetadata, "isEqual:")) {
      goto LABEL_295;
    }
    $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
    uint64_t v6 = *((void *)v4 + 27);
  }
  if ((*(_DWORD *)&flags & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isContactWithHomeLocation)
    {
      if (!*((unsigned char *)v4 + 197)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 197))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x400000000) != 0)
  {
    if ((v6 & 0x400000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isContactWithWorkLocation)
    {
      if (!*((unsigned char *)v4 + 202)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 202))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x400000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x200000000) != 0)
  {
    if ((v6 & 0x200000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isContactWithSchoolLocation)
    {
      if (!*((unsigned char *)v4 + 201)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 201))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x200000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x100000000) != 0)
  {
    if ((v6 & 0x100000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isContactWithOtherLocation)
    {
      if (!*((unsigned char *)v4 + 200)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 200))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x100000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x40000000) != 0)
  {
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isContactWithLiveLocation)
    {
      if (!*((unsigned char *)v4 + 198)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 198))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x40000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x80000000) != 0)
  {
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_295;
    }
    if (self->_isContactWithNoLocation)
    {
      if (!*((unsigned char *)v4 + 199)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 199))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x80000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_prefixLastTokenMatchCover != *((float *)v4 + 34)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_prefixMatchCover != *((float *)v4 + 35)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_prefixMatchPosition != *((_DWORD *)v4 + 36)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_prefixMatchWordBoundary != *((_DWORD *)v4 + 37)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_prefixTokenMatchLengthFirstQueryToken != *((_DWORD *)v4 + 38)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_prefixTokenMatchPositionFirstQueryToken != *((_DWORD *)v4 + 42)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x80000000000) != 0)
  {
    if ((v6 & 0x80000000000) == 0) {
      goto LABEL_295;
    }
    if (self->_prefixTokenIsNumberFirstQueryToken)
    {
      if (!*((unsigned char *)v4 + 211)) {
        goto LABEL_295;
      }
    }
    else if (*((unsigned char *)v4 + 211))
    {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x80000000000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_prefixTokenMatchLocationFirstQueryToken != *((_DWORD *)v4 + 40)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_prefixTokenMatchLengthSecondQueryToken != *((_DWORD *)v4 + 39)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_prefixTokenMatchPositionSecondQueryToken != *((_DWORD *)v4 + 43)) {
      goto LABEL_295;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_295;
  }
  if ((*(void *)&flags & 0x100000000000) == 0)
  {
    if ((v6 & 0x100000000000) == 0) {
      goto LABEL_290;
    }
LABEL_295:
    BOOL v10 = 0;
    goto LABEL_296;
  }
  if ((v6 & 0x100000000000) == 0) {
    goto LABEL_295;
  }
  if (!self->_prefixTokenIsNumberSecondQueryToken)
  {
    if (!*((unsigned char *)v4 + 212)) {
      goto LABEL_290;
    }
    goto LABEL_295;
  }
  if (!*((unsigned char *)v4 + 212)) {
    goto LABEL_295;
  }
LABEL_290:
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_prefixTokenMatchLocationSecondQueryToken != *((_DWORD *)v4 + 41)) {
      goto LABEL_295;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (v6 & 0x100000) == 0;
  }
LABEL_296:

  return v10;
}

- (unint64_t)hash
{
  [(GEOClientACSuggestionEntry *)self readAll:1];
  $CD8BBF1E49DB7E485009711ADA3FCADB flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
  {
    uint64_t v101 = 0;
    if ((*(void *)&flags & 0x200000000000) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v100 = 0;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  uint64_t v101 = 2654435761 * self->_suggestionType;
  if ((*(void *)&flags & 0x200000000000) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v100 = 2654435761 * self->_shownToUser;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double fractionOfMatch = self->_fractionOfMatch;
  double v5 = -fractionOfMatch;
  if (fractionOfMatch >= 0.0) {
    double v5 = self->_fractionOfMatch;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    uint64_t v98 = 2654435761 * self->_distanceToSuggestion;
    if (*(unsigned char *)&flags) {
      goto LABEL_15;
    }
LABEL_20:
    unint64_t v13 = 0;
    goto LABEL_23;
  }
  uint64_t v98 = 0;
  if ((*(unsigned char *)&flags & 1) == 0) {
    goto LABEL_20;
  }
LABEL_15:
  double contactRelevanceScore = self->_contactRelevanceScore;
  double v10 = -contactRelevanceScore;
  if (contactRelevanceScore >= 0.0) {
    double v10 = self->_contactRelevanceScore;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_23:
  if ((*(void *)&flags & 0x20000000000) != 0)
  {
    uint64_t v97 = 2654435761 * self->_matchedUsingName;
    if ((*(void *)&flags & 0x40000000000) != 0)
    {
LABEL_25:
      uint64_t v96 = 2654435761 * self->_matchedUsingOrganization;
      if ((*(void *)&flags & 0x4000000000) != 0) {
        goto LABEL_26;
      }
      goto LABEL_40;
    }
  }
  else
  {
    uint64_t v97 = 0;
    if ((*(void *)&flags & 0x40000000000) != 0) {
      goto LABEL_25;
    }
  }
  uint64_t v96 = 0;
  if ((*(void *)&flags & 0x4000000000) != 0)
  {
LABEL_26:
    uint64_t v95 = 2654435761 * self->_matchedUsingAddress;
    if ((*(void *)&flags & 0x10000000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v95 = 0;
  if ((*(void *)&flags & 0x10000000000) != 0)
  {
LABEL_27:
    uint64_t v94 = 2654435761 * self->_matchedUsingLabel;
    if ((*(void *)&flags & 0x8000000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v94 = 0;
  if ((*(void *)&flags & 0x8000000000) != 0)
  {
LABEL_28:
    uint64_t v93 = 2654435761 * self->_matchedUsingEventName;
    if ((*(_WORD *)&flags & 0x800) != 0) {
      goto LABEL_29;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v93 = 0;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
LABEL_29:
    uint64_t v92 = 2654435761 * self->_peopleSuggesterRank;
    if ((*(_WORD *)&flags & 0x100) != 0) {
      goto LABEL_30;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v92 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_30:
    uint64_t v91 = 2654435761 * self->_age;
    if ((*(_DWORD *)&flags & 0x800000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v91 = 0;
  if ((*(_DWORD *)&flags & 0x800000) != 0)
  {
LABEL_31:
    uint64_t v90 = 2654435761 * self->_serverEntryType;
    if ((*(void *)&flags & 0x1000000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v90 = 0;
  if ((*(void *)&flags & 0x1000000000) != 0)
  {
LABEL_32:
    uint64_t v89 = 2654435761 * self->_isFavorite;
    if ((*(_WORD *)&flags & 0x1000) != 0) {
      goto LABEL_33;
    }
LABEL_47:
    uint64_t v88 = 0;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_34;
    }
LABEL_48:
    unint64_t v18 = 0;
    goto LABEL_51;
  }
LABEL_46:
  uint64_t v89 = 0;
  if ((*(_WORD *)&flags & 0x1000) == 0) {
    goto LABEL_47;
  }
LABEL_33:
  uint64_t v88 = 2654435761 * self->_poiOpenState;
  if ((*(unsigned char *)&flags & 8) == 0) {
    goto LABEL_48;
  }
LABEL_34:
  double mapsSuggestionsContactRevelanceScore = self->_mapsSuggestionsContactRevelanceScore;
  double v15 = -mapsSuggestionsContactRevelanceScore;
  if (mapsSuggestionsContactRevelanceScore >= 0.0) {
    double v15 = self->_mapsSuggestionsContactRevelanceScore;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_51:
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    double mapsSuggestionsPoiRevelanceScore = self->_mapsSuggestionsPoiRevelanceScore;
    double v21 = -mapsSuggestionsPoiRevelanceScore;
    if (mapsSuggestionsPoiRevelanceScore >= 0.0) {
      double v21 = self->_mapsSuggestionsPoiRevelanceScore;
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
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    double mapsSuggestionsIsTouristScore = self->_mapsSuggestionsIsTouristScore;
    double v26 = -mapsSuggestionsIsTouristScore;
    if (mapsSuggestionsIsTouristScore >= 0.0) {
      double v26 = self->_mapsSuggestionsIsTouristScore;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  unint64_t v87 = v24;
  if ((*(_DWORD *)&flags & 0x10000000) != 0) {
    uint64_t v86 = 2654435761 * self->_discreteFeatureValuesAvailable;
  }
  else {
    uint64_t v86 = 0;
  }
  NSUInteger v85 = [(NSString *)self->_suggestionSectionType hash];
  if ((*((unsigned char *)&self->_flags + 4) & 0x20) != 0) {
    uint64_t v84 = 2654435761 * self->_isProminentResult;
  }
  else {
    uint64_t v84 = 0;
  }
  unint64_t v83 = [(GEOSubactionMetaData *)self->_subactionMetaData hash];
  $CD8BBF1E49DB7E485009711ADA3FCADB v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x200) != 0)
  {
    uint64_t v82 = 2654435761 * self->_autocompleteResultCellType;
    if ((*(_DWORD *)&v29 & 0x2000000) != 0)
    {
LABEL_75:
      uint64_t v81 = 2654435761 * self->_serverSectionIndex;
      if ((*(_DWORD *)&v29 & 0x1000000) != 0) {
        goto LABEL_76;
      }
      goto LABEL_84;
    }
  }
  else
  {
    uint64_t v82 = 0;
    if ((*(_DWORD *)&v29 & 0x2000000) != 0) {
      goto LABEL_75;
    }
  }
  uint64_t v81 = 0;
  if ((*(_DWORD *)&v29 & 0x1000000) != 0)
  {
LABEL_76:
    uint64_t v80 = 2654435761 * self->_serverItemIndexInSection;
    if ((*(_DWORD *)&v29 & 0x8000000) != 0) {
      goto LABEL_77;
    }
LABEL_85:
    uint64_t v79 = 0;
    if ((*(unsigned char *)&v29 & 2) != 0) {
      goto LABEL_78;
    }
LABEL_86:
    unint64_t v34 = 0;
    goto LABEL_89;
  }
LABEL_84:
  uint64_t v80 = 0;
  if ((*(_DWORD *)&v29 & 0x8000000) == 0) {
    goto LABEL_85;
  }
LABEL_77:
  uint64_t v79 = 2654435761 * self->_tapBehavior;
  if ((*(unsigned char *)&v29 & 2) == 0) {
    goto LABEL_86;
  }
LABEL_78:
  double distanceToSuggestionFromViewportCenter = self->_distanceToSuggestionFromViewportCenter;
  double v31 = -distanceToSuggestionFromViewportCenter;
  if (distanceToSuggestionFromViewportCenter >= 0.0) {
    double v31 = self->_distanceToSuggestionFromViewportCenter;
  }
  long double v32 = floor(v31 + 0.5);
  double v33 = (v31 - v32) * 1.84467441e19;
  unint64_t v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
  if (v33 >= 0.0)
  {
    if (v33 > 0.0) {
      v34 += (unint64_t)v33;
    }
  }
  else
  {
    v34 -= (unint64_t)fabs(v33);
  }
LABEL_89:
  unint64_t v99 = v8;
  if ((*(unsigned char *)&v29 & 0x40) != 0)
  {
    double timeSinceLastInteractedSeconds = self->_timeSinceLastInteractedSeconds;
    double v37 = -timeSinceLastInteractedSeconds;
    if (timeSinceLastInteractedSeconds >= 0.0) {
      double v37 = self->_timeSinceLastInteractedSeconds;
    }
    long double v38 = floor(v37 + 0.5);
    double v39 = (v37 - v38) * 1.84467441e19;
    unint64_t v35 = 2654435761u * (unint64_t)fmod(v38, 1.84467441e19);
    if (v39 >= 0.0)
    {
      if (v39 > 0.0) {
        v35 += (unint64_t)v39;
      }
    }
    else
    {
      v35 -= (unint64_t)fabs(v39);
    }
  }
  else
  {
    unint64_t v35 = 0;
  }
  if ((*(void *)&v29 & 0x800000000) != 0) {
    uint64_t v76 = 2654435761 * self->_isContainedInViewport;
  }
  else {
    uint64_t v76 = 0;
  }
  unint64_t v77 = v35;
  unint64_t v78 = v34;
  if ((*(unsigned char *)&v29 & 0x80) != 0)
  {
    double timeSinceMapViewportChangedSeconds = self->_timeSinceMapViewportChangedSeconds;
    double v42 = -timeSinceMapViewportChangedSeconds;
    if (timeSinceMapViewportChangedSeconds >= 0.0) {
      double v42 = self->_timeSinceMapViewportChangedSeconds;
    }
    long double v43 = floor(v42 + 0.5);
    double v44 = (v42 - v43) * 1.84467441e19;
    unint64_t v40 = 2654435761u * (unint64_t)fmod(v43, 1.84467441e19);
    if (v44 >= 0.0)
    {
      if (v44 > 0.0) {
        v40 += (unint64_t)v44;
      }
    }
    else
    {
      v40 -= (unint64_t)fabs(v44);
    }
  }
  else
  {
    unint64_t v40 = 0;
  }
  unint64_t v75 = [(GEOHyperlinkMetaData *)self->_hyperlinkMetadata hash];
  $CD8BBF1E49DB7E485009711ADA3FCADB v45 = self->_flags;
  if ((*(_DWORD *)&v45 & 0x20000000) != 0)
  {
    uint64_t v74 = 2654435761 * self->_isContactWithHomeLocation;
    if ((*(void *)&v45 & 0x400000000) != 0)
    {
LABEL_110:
      uint64_t v73 = 2654435761 * self->_isContactWithWorkLocation;
      if ((*(void *)&v45 & 0x200000000) != 0) {
        goto LABEL_111;
      }
      goto LABEL_116;
    }
  }
  else
  {
    uint64_t v74 = 0;
    if ((*(void *)&v45 & 0x400000000) != 0) {
      goto LABEL_110;
    }
  }
  uint64_t v73 = 0;
  if ((*(void *)&v45 & 0x200000000) != 0)
  {
LABEL_111:
    uint64_t v72 = 2654435761 * self->_isContactWithSchoolLocation;
    if ((*(void *)&v45 & 0x100000000) != 0) {
      goto LABEL_112;
    }
LABEL_117:
    uint64_t v71 = 0;
    if ((*(_DWORD *)&v45 & 0x40000000) != 0) {
      goto LABEL_113;
    }
    goto LABEL_118;
  }
LABEL_116:
  uint64_t v72 = 0;
  if ((*(void *)&v45 & 0x100000000) == 0) {
    goto LABEL_117;
  }
LABEL_112:
  uint64_t v71 = 2654435761 * self->_isContactWithOtherLocation;
  if ((*(_DWORD *)&v45 & 0x40000000) != 0)
  {
LABEL_113:
    uint64_t v46 = 2654435761 * self->_isContactWithLiveLocation;
    goto LABEL_119;
  }
LABEL_118:
  uint64_t v46 = 0;
LABEL_119:
  unint64_t v47 = v19;
  if ((*(_DWORD *)&v45 & 0x80000000) != 0) {
    uint64_t v48 = 2654435761 * self->_isContactWithNoLocation;
  }
  else {
    uint64_t v48 = 0;
  }
  unint64_t v49 = v18;
  if ((*(_WORD *)&v45 & 0x2000) != 0)
  {
    float prefixLastTokenMatchCover = self->_prefixLastTokenMatchCover;
    double v52 = prefixLastTokenMatchCover;
    if (prefixLastTokenMatchCover < 0.0) {
      double v52 = -prefixLastTokenMatchCover;
    }
    long double v53 = floor(v52 + 0.5);
    double v54 = (v52 - v53) * 1.84467441e19;
    unint64_t v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      if (v54 > 0.0) {
        v50 += (unint64_t)v54;
      }
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
    }
  }
  else
  {
    unint64_t v50 = 0;
  }
  if ((*(_WORD *)&v45 & 0x4000) != 0)
  {
    float prefixMatchCover = self->_prefixMatchCover;
    double v57 = prefixMatchCover;
    if (prefixMatchCover < 0.0) {
      double v57 = -prefixMatchCover;
    }
    long double v58 = floor(v57 + 0.5);
    double v59 = (v57 - v58) * 1.84467441e19;
    unint64_t v55 = 2654435761u * (unint64_t)fmod(v58, 1.84467441e19);
    if (v59 >= 0.0)
    {
      if (v59 > 0.0) {
        v55 += (unint64_t)v59;
      }
    }
    else
    {
      v55 -= (unint64_t)fabs(v59);
    }
  }
  else
  {
    unint64_t v55 = 0;
  }
  if ((*(_WORD *)&v45 & 0x8000) != 0)
  {
    uint64_t v60 = 2654435761 * self->_prefixMatchPosition;
    if ((*(_DWORD *)&v45 & 0x10000) != 0)
    {
LABEL_140:
      uint64_t v61 = 2654435761 * self->_prefixMatchWordBoundary;
      if ((*(_DWORD *)&v45 & 0x20000) != 0) {
        goto LABEL_141;
      }
      goto LABEL_151;
    }
  }
  else
  {
    uint64_t v60 = 0;
    if ((*(_DWORD *)&v45 & 0x10000) != 0) {
      goto LABEL_140;
    }
  }
  uint64_t v61 = 0;
  if ((*(_DWORD *)&v45 & 0x20000) != 0)
  {
LABEL_141:
    uint64_t v62 = 2654435761 * self->_prefixTokenMatchLengthFirstQueryToken;
    if ((*(_DWORD *)&v45 & 0x200000) != 0) {
      goto LABEL_142;
    }
    goto LABEL_152;
  }
LABEL_151:
  uint64_t v62 = 0;
  if ((*(_DWORD *)&v45 & 0x200000) != 0)
  {
LABEL_142:
    uint64_t v63 = 2654435761 * self->_prefixTokenMatchPositionFirstQueryToken;
    if ((*(void *)&v45 & 0x80000000000) != 0) {
      goto LABEL_143;
    }
    goto LABEL_153;
  }
LABEL_152:
  uint64_t v63 = 0;
  if ((*(void *)&v45 & 0x80000000000) != 0)
  {
LABEL_143:
    uint64_t v64 = 2654435761 * self->_prefixTokenIsNumberFirstQueryToken;
    if ((*(_DWORD *)&v45 & 0x80000) != 0) {
      goto LABEL_144;
    }
    goto LABEL_154;
  }
LABEL_153:
  uint64_t v64 = 0;
  if ((*(_DWORD *)&v45 & 0x80000) != 0)
  {
LABEL_144:
    uint64_t v65 = 2654435761 * self->_prefixTokenMatchLocationFirstQueryToken;
    if ((*(_DWORD *)&v45 & 0x40000) != 0) {
      goto LABEL_145;
    }
    goto LABEL_155;
  }
LABEL_154:
  uint64_t v65 = 0;
  if ((*(_DWORD *)&v45 & 0x40000) != 0)
  {
LABEL_145:
    uint64_t v66 = 2654435761 * self->_prefixTokenMatchLengthSecondQueryToken;
    if ((*(_DWORD *)&v45 & 0x400000) != 0) {
      goto LABEL_146;
    }
    goto LABEL_156;
  }
LABEL_155:
  uint64_t v66 = 0;
  if ((*(_DWORD *)&v45 & 0x400000) != 0)
  {
LABEL_146:
    uint64_t v67 = 2654435761 * self->_prefixTokenMatchPositionSecondQueryToken;
    if ((*(void *)&v45 & 0x100000000000) != 0) {
      goto LABEL_147;
    }
LABEL_157:
    uint64_t v68 = 0;
    if ((*(_DWORD *)&v45 & 0x100000) != 0) {
      goto LABEL_148;
    }
LABEL_158:
    uint64_t v69 = 0;
    return v100 ^ v101 ^ v99 ^ v98 ^ v13 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v49 ^ v47 ^ v87 ^ v86 ^ v84 ^ v85 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v40 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v46 ^ v48 ^ v50 ^ v55 ^ v60 ^ v61 ^ v62 ^ v63 ^ v64 ^ v65 ^ v66 ^ v67 ^ v68 ^ v69;
  }
LABEL_156:
  uint64_t v67 = 0;
  if ((*(void *)&v45 & 0x100000000000) == 0) {
    goto LABEL_157;
  }
LABEL_147:
  uint64_t v68 = 2654435761 * self->_prefixTokenIsNumberSecondQueryToken;
  if ((*(_DWORD *)&v45 & 0x100000) == 0) {
    goto LABEL_158;
  }
LABEL_148:
  uint64_t v69 = 2654435761 * self->_prefixTokenMatchLocationSecondQueryToken;
  return v100 ^ v101 ^ v99 ^ v98 ^ v13 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v49 ^ v47 ^ v87 ^ v86 ^ v84 ^ v85 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v40 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v46 ^ v48 ^ v50 ^ v55 ^ v60 ^ v61 ^ v62 ^ v63 ^ v64 ^ v65 ^ v66 ^ v67 ^ v68 ^ v69;
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  [v12 readAll:0];
  id v4 = v12;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x4000000) != 0)
  {
    self->_suggestionType = *((_DWORD *)v12 + 47);
    *(void *)&self->_flags |= 0x4000000uLL;
    uint64_t v5 = *((void *)v12 + 27);
    if ((v5 & 0x200000000000) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x200000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_shownToUser = *((unsigned char *)v12 + 213);
  *(void *)&self->_flags |= 0x200000000000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double fractionOfMatch = *((double *)v12 + 4);
  *(void *)&self->_flags |= 4uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_distanceToSuggestion = *((_DWORD *)v12 + 31);
  *(void *)&self->_flags |= 0x400uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double contactRelevanceScore = *((double *)v12 + 2);
  *(void *)&self->_flags |= 1uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_matchedUsingName = *((unsigned char *)v12 + 209);
  *(void *)&self->_flags |= 0x20000000000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x4000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_matchedUsingOrganization = *((unsigned char *)v12 + 210);
  *(void *)&self->_flags |= 0x40000000000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_matchedUsingAddress = *((unsigned char *)v12 + 206);
  *(void *)&self->_flags |= 0x4000000000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x8000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_matchedUsingLabel = *((unsigned char *)v12 + 208);
  *(void *)&self->_flags |= 0x10000000000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x8000000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_matchedUsingEventName = *((unsigned char *)v12 + 207);
  *(void *)&self->_flags |= 0x8000000000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_peopleSuggesterRank = *((_DWORD *)v12 + 32);
  *(void *)&self->_flags |= 0x800uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x100) == 0)
  {
LABEL_13:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_age = *((_DWORD *)v12 + 29);
  *(void *)&self->_flags |= 0x100uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x800000) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_serverEntryType = *((_DWORD *)v12 + 44);
  *(void *)&self->_flags |= 0x800000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_isFavorite = *((unsigned char *)v12 + 204);
  *(void *)&self->_flags |= 0x1000000000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x1000) == 0)
  {
LABEL_16:
    if ((v5 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_poiOpenState = *((_DWORD *)v12 + 33);
  *(void *)&self->_flags |= 0x1000uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 8) == 0)
  {
LABEL_17:
    if ((v5 & 0x20) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_double mapsSuggestionsContactRevelanceScore = *((double *)v12 + 6);
  *(void *)&self->_flags |= 8uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x20) == 0)
  {
LABEL_18:
    if ((v5 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_double mapsSuggestionsPoiRevelanceScore = *((double *)v12 + 8);
  *(void *)&self->_flags |= 0x20uLL;
  uint64_t v5 = *((void *)v12 + 27);
  if ((v5 & 0x10) == 0)
  {
LABEL_19:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_45:
  self->_double mapsSuggestionsIsTouristScore = *((double *)v12 + 7);
  *(void *)&self->_flags |= 0x10uLL;
  if ((*((void *)v12 + 27) & 0x10000000) != 0)
  {
LABEL_20:
    self->_discreteFeatureValuesAvailable = *((unsigned char *)v12 + 196);
    *(void *)&self->_flags |= 0x10000000uLL;
  }
LABEL_21:
  if (*((void *)v12 + 10))
  {
    -[GEOClientACSuggestionEntry setSuggestionSectionType:](self, "setSuggestionSectionType:");
    id v4 = v12;
  }
  if ((*((unsigned char *)v4 + 220) & 0x20) != 0)
  {
    self->_isProminentResult = *((unsigned char *)v4 + 205);
    *(void *)&self->_flags |= 0x2000000000uLL;
  }
  subactionMetaData = self->_subactionMetaData;
  uint64_t v7 = *((void *)v4 + 9);
  if (subactionMetaData)
  {
    if (!v7) {
      goto LABEL_50;
    }
    -[GEOSubactionMetaData mergeFrom:](subactionMetaData, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_50;
    }
    -[GEOClientACSuggestionEntry setSubactionMetaData:](self, "setSubactionMetaData:");
  }
  id v4 = v12;
LABEL_50:
  uint64_t v8 = *((void *)v4 + 27);
  if ((v8 & 0x200) != 0)
  {
    self->_autocompleteResultCellType = *((_DWORD *)v4 + 30);
    *(void *)&self->_flags |= 0x200uLL;
    uint64_t v8 = *((void *)v4 + 27);
    if ((v8 & 0x2000000) == 0)
    {
LABEL_52:
      if ((v8 & 0x1000000) == 0) {
        goto LABEL_53;
      }
      goto LABEL_64;
    }
  }
  else if ((v8 & 0x2000000) == 0)
  {
    goto LABEL_52;
  }
  self->_serverSectionIndex = *((_DWORD *)v4 + 46);
  *(void *)&self->_flags |= 0x2000000uLL;
  uint64_t v8 = *((void *)v4 + 27);
  if ((v8 & 0x1000000) == 0)
  {
LABEL_53:
    if ((v8 & 0x8000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_serverItemIndexInSection = *((_DWORD *)v4 + 45);
  *(void *)&self->_flags |= 0x1000000uLL;
  uint64_t v8 = *((void *)v4 + 27);
  if ((v8 & 0x8000000) == 0)
  {
LABEL_54:
    if ((v8 & 2) == 0) {
      goto LABEL_55;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_tapBehavior = *((_DWORD *)v4 + 48);
  *(void *)&self->_flags |= 0x8000000uLL;
  uint64_t v8 = *((void *)v4 + 27);
  if ((v8 & 2) == 0)
  {
LABEL_55:
    if ((v8 & 0x40) == 0) {
      goto LABEL_56;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_double distanceToSuggestionFromViewportCenter = *((double *)v4 + 3);
  *(void *)&self->_flags |= 2uLL;
  uint64_t v8 = *((void *)v4 + 27);
  if ((v8 & 0x40) == 0)
  {
LABEL_56:
    if ((v8 & 0x800000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_double timeSinceLastInteractedSeconds = *((double *)v4 + 11);
  *(void *)&self->_flags |= 0x40uLL;
  uint64_t v8 = *((void *)v4 + 27);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_57:
    if ((v8 & 0x80) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_68:
  self->_isContainedInViewport = *((unsigned char *)v4 + 203);
  *(void *)&self->_flags |= 0x800000000uLL;
  if ((*((void *)v4 + 27) & 0x80) != 0)
  {
LABEL_58:
    self->_double timeSinceMapViewportChangedSeconds = *((double *)v4 + 12);
    *(void *)&self->_flags |= 0x80uLL;
  }
LABEL_59:
  hyperlinkMetadata = self->_hyperlinkMetadata;
  uint64_t v10 = *((void *)v4 + 5);
  if (hyperlinkMetadata)
  {
    if (!v10) {
      goto LABEL_73;
    }
    -[GEOHyperlinkMetaData mergeFrom:](hyperlinkMetadata, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_73;
    }
    -[GEOClientACSuggestionEntry setHyperlinkMetadata:](self, "setHyperlinkMetadata:");
  }
  id v4 = v12;
LABEL_73:
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x20000000) != 0)
  {
    self->_isContactWithHomeLocation = *((unsigned char *)v4 + 197);
    *(void *)&self->_flags |= 0x20000000uLL;
    uint64_t v11 = *((void *)v4 + 27);
    if ((v11 & 0x400000000) == 0)
    {
LABEL_75:
      if ((v11 & 0x200000000) == 0) {
        goto LABEL_76;
      }
      goto LABEL_97;
    }
  }
  else if ((v11 & 0x400000000) == 0)
  {
    goto LABEL_75;
  }
  self->_isContactWithWorkLocation = *((unsigned char *)v4 + 202);
  *(void *)&self->_flags |= 0x400000000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x200000000) == 0)
  {
LABEL_76:
    if ((v11 & 0x100000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_isContactWithSchoolLocation = *((unsigned char *)v4 + 201);
  *(void *)&self->_flags |= 0x200000000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x100000000) == 0)
  {
LABEL_77:
    if ((v11 & 0x40000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_isContactWithOtherLocation = *((unsigned char *)v4 + 200);
  *(void *)&self->_flags |= 0x100000000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x40000000) == 0)
  {
LABEL_78:
    if ((v11 & 0x80000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_isContactWithLiveLocation = *((unsigned char *)v4 + 198);
  *(void *)&self->_flags |= 0x40000000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x80000000) == 0)
  {
LABEL_79:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_isContactWithNoLocation = *((unsigned char *)v4 + 199);
  *(void *)&self->_flags |= 0x80000000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x2000) == 0)
  {
LABEL_80:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_float prefixLastTokenMatchCover = *((float *)v4 + 34);
  *(void *)&self->_flags |= 0x2000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x4000) == 0)
  {
LABEL_81:
    if ((v11 & 0x8000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_float prefixMatchCover = *((float *)v4 + 35);
  *(void *)&self->_flags |= 0x4000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x8000) == 0)
  {
LABEL_82:
    if ((v11 & 0x10000) == 0) {
      goto LABEL_83;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_prefixMatchPosition = *((_DWORD *)v4 + 36);
  *(void *)&self->_flags |= 0x8000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x10000) == 0)
  {
LABEL_83:
    if ((v11 & 0x20000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_prefixMatchWordBoundary = *((_DWORD *)v4 + 37);
  *(void *)&self->_flags |= 0x10000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x20000) == 0)
  {
LABEL_84:
    if ((v11 & 0x200000) == 0) {
      goto LABEL_85;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_prefixTokenMatchLengthFirstQueryToken = *((_DWORD *)v4 + 38);
  *(void *)&self->_flags |= 0x20000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x200000) == 0)
  {
LABEL_85:
    if ((v11 & 0x80000000000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_prefixTokenMatchPositionFirstQueryToken = *((_DWORD *)v4 + 42);
  *(void *)&self->_flags |= 0x200000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x80000000000) == 0)
  {
LABEL_86:
    if ((v11 & 0x80000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_prefixTokenIsNumberFirstQueryToken = *((unsigned char *)v4 + 211);
  *(void *)&self->_flags |= 0x80000000000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x80000) == 0)
  {
LABEL_87:
    if ((v11 & 0x40000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_prefixTokenMatchLocationFirstQueryToken = *((_DWORD *)v4 + 40);
  *(void *)&self->_flags |= 0x80000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x40000) == 0)
  {
LABEL_88:
    if ((v11 & 0x400000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_prefixTokenMatchLengthSecondQueryToken = *((_DWORD *)v4 + 39);
  *(void *)&self->_flags |= 0x40000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x400000) == 0)
  {
LABEL_89:
    if ((v11 & 0x100000000000) == 0) {
      goto LABEL_90;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_prefixTokenMatchPositionSecondQueryToken = *((_DWORD *)v4 + 43);
  *(void *)&self->_flags |= 0x400000uLL;
  uint64_t v11 = *((void *)v4 + 27);
  if ((v11 & 0x100000000000) == 0)
  {
LABEL_90:
    if ((v11 & 0x100000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
LABEL_111:
  self->_prefixTokenIsNumberSecondQueryToken = *((unsigned char *)v4 + 212);
  *(void *)&self->_flags |= 0x100000000000uLL;
  if ((*((void *)v4 + 27) & 0x100000) != 0)
  {
LABEL_91:
    self->_prefixTokenMatchLocationSecondQueryToken = *((_DWORD *)v4 + 41);
    *(void *)&self->_flags |= 0x100000uLL;
  }
LABEL_92:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionSectionType, 0);
  objc_storeStrong((id *)&self->_subactionMetaData, 0);
  objc_storeStrong((id *)&self->_hyperlinkMetadata, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end