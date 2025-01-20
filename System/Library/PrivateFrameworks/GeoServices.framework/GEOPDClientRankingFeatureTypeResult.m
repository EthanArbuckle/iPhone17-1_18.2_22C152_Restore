@interface GEOPDClientRankingFeatureTypeResult
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

@implementation GEOPDClientRankingFeatureTypeResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientRankingFeatureTypeResult;
  v4 = [(GEOPDClientRankingFeatureTypeResult *)&v8 description];
  v5 = [(GEOPDClientRankingFeatureTypeResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientRankingFeatureTypeResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      uint64_t v5 = *(int *)(a1 + 16);
      if (v5 >= 0x2A)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E53DD738[v5];
      }
      if (a2) {
        v7 = @"resultFeature";
      }
      else {
        v7 = @"result_feature";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __65__GEOPDClientRankingFeatureTypeResult__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
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
  return -[GEOPDClientRankingFeatureTypeResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __65__GEOPDClientRankingFeatureTypeResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
      v7 = @"resultFeature";
    }
    else {
      v7 = @"result_feature";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      if ([v9 isEqualToString:@"UNKNOWN_RESULT_FEATURE"])
      {
        int v10 = 0;
      }
      else if ([v9 isEqualToString:@"SHOWN_TO_USER"])
      {
        int v10 = 1;
      }
      else if ([v9 isEqualToString:@"FRACTION_OF_MATCH"])
      {
        int v10 = 2;
      }
      else if ([v9 isEqualToString:@"DISTANCE_TO_SUGGESTION"])
      {
        int v10 = 3;
      }
      else if ([v9 isEqualToString:@"CONTACT_RELEVANCE_SCORE"])
      {
        int v10 = 4;
      }
      else if ([v9 isEqualToString:@"MATCHED_USING_NAME"])
      {
        int v10 = 5;
      }
      else if ([v9 isEqualToString:@"MATCHED_USING_ORGANIZATION"])
      {
        int v10 = 6;
      }
      else if ([v9 isEqualToString:@"MATCHED_USING_ADDRESS"])
      {
        int v10 = 7;
      }
      else if ([v9 isEqualToString:@"MATCHED_USING_LABEL"])
      {
        int v10 = 8;
      }
      else if ([v9 isEqualToString:@"MATCHED_USING_EVENT_NAME"])
      {
        int v10 = 9;
      }
      else if ([v9 isEqualToString:@"PEOPLE_SUGGESTER_RANK"])
      {
        int v10 = 10;
      }
      else if ([v9 isEqualToString:@"AGE"])
      {
        int v10 = 11;
      }
      else if ([v9 isEqualToString:@"IS_FAVORITE"])
      {
        int v10 = 12;
      }
      else if ([v9 isEqualToString:@"POI_OPEN_STATE_CURRENTLY_CLOSED"])
      {
        int v10 = 13;
      }
      else if ([v9 isEqualToString:@"POI_OPEN_STATE_PERMANENTLY_CLOSED"])
      {
        int v10 = 14;
      }
      else if ([v9 isEqualToString:@"POI_OPEN_STATE_IS_OPENING_SOON"])
      {
        int v10 = 15;
      }
      else if ([v9 isEqualToString:@"POI_OPEN_STATE_IS_CLOSING_SOON"])
      {
        int v10 = 16;
      }
      else if ([v9 isEqualToString:@"MAPS_SUGGEST_CONTACT_RELEVANCE_SCORE"])
      {
        int v10 = 17;
      }
      else if ([v9 isEqualToString:@"MAPS_SUGGEST_POI_RELEVANCE_SCORE"])
      {
        int v10 = 18;
      }
      else if ([v9 isEqualToString:@"MAPS_SUGGEST_IS_TOURIST_SCORE"])
      {
        int v10 = 19;
      }
      else if ([v9 isEqualToString:@"MAPS_SUGGEST_TIME_SINCE_LAST_INTERACTED"])
      {
        int v10 = 20;
      }
      else if ([v9 isEqualToString:@"DISTANCE_TO_SUGGESTION_FROM_VIEWPORT_CENTER"])
      {
        int v10 = 21;
      }
      else if ([v9 isEqualToString:@"IS_CONTAINED_IN_VIEWPORT"])
      {
        int v10 = 22;
      }
      else if ([v9 isEqualToString:@"TIME_SINCE_MAP_VIEWPORT_CHANGED_SECONDS"])
      {
        int v10 = 23;
      }
      else if ([v9 isEqualToString:@"CONTACT_WITH_HOME_LOCATION"])
      {
        int v10 = 24;
      }
      else if ([v9 isEqualToString:@"CONTACT_WITH_WORK_LOCATION"])
      {
        int v10 = 25;
      }
      else if ([v9 isEqualToString:@"CONTACT_WITH_SCHOOL_LOCATION"])
      {
        int v10 = 26;
      }
      else if ([v9 isEqualToString:@"CONTACT_WITH_OTHER_LOCATION"])
      {
        int v10 = 27;
      }
      else if ([v9 isEqualToString:@"CONTACT_WITH_LIVE_LOCATION"])
      {
        int v10 = 28;
      }
      else if ([v9 isEqualToString:@"CONTACT_WITH_NO_LOCATION"])
      {
        int v10 = 29;
      }
      else if ([v9 isEqualToString:@"PREFIX_LAST_TOKEN_MATCH_COVER"])
      {
        int v10 = 30;
      }
      else if ([v9 isEqualToString:@"PREFIX_MATCH_COVER"])
      {
        int v10 = 31;
      }
      else if ([v9 isEqualToString:@"PREFIX_MATCH_POSITION"])
      {
        int v10 = 32;
      }
      else if ([v9 isEqualToString:@"PREFIX_MATCH_WORD_BOUNDARY"])
      {
        int v10 = 33;
      }
      else if ([v9 isEqualToString:@"PREFIX_TOKEN_MATCH_LENGTH_FIRST_QUERY_TOKEN"])
      {
        int v10 = 34;
      }
      else if ([v9 isEqualToString:@"PREFIX_TOKEN_MATCH_POSITION_FIRST_QUERY_TOKEN"])
      {
        int v10 = 35;
      }
      else if ([v9 isEqualToString:@"PREFIX_TOKEN_IS_NUMBER_FIRST_QUERY_TOKEN"])
      {
        int v10 = 36;
      }
      else if ([v9 isEqualToString:@"PREFIX_TOKEN_MATCH_LOCATION_FIRST_QUERY_TOKEN"])
      {
        int v10 = 37;
      }
      else if ([v9 isEqualToString:@"PREFIX_TOKEN_MATCH_LENGTH_SECOND_QUERY_TOKEN"])
      {
        int v10 = 38;
      }
      else if ([v9 isEqualToString:@"PREFIX_TOKEN_MATCH_POSITION_SECOND_QUERY_TOKEN"])
      {
        int v10 = 39;
      }
      else if ([v9 isEqualToString:@"PREFIX_TOKEN_IS_NUMBER_SECOND_QUERY_TOKEN"])
      {
        int v10 = 40;
      }
      else if ([v9 isEqualToString:@"PREFIX_TOKEN_MATCH_LOCATION_SECOND_QUERY_TOKEN"])
      {
        int v10 = 41;
      }
      else
      {
        int v10 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_95:

        goto LABEL_96;
      }
      int v10 = [v8 intValue];
    }
    *(unsigned char *)(v6 + 20) |= 1u;
    *(_DWORD *)(v6 + 16) = v10;
    goto LABEL_95;
  }
LABEL_96:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientRankingFeatureTypeResultReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 16) = self->_resultFeature;
    *(unsigned char *)(v4 + 20) |= 1u;
  }
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_resultFeature == *((_DWORD *)v4 + 4))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_resultFeature;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
}

@end