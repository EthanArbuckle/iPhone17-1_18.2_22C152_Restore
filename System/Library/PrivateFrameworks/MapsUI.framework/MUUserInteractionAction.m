@interface MUUserInteractionAction
- (BOOL)hasArpRatingArgument;
- (BOOL)hasArpSuggestionArgument;
- (BOOL)hasExploreGuidesArgument;
- (BOOL)hasUserGuideArgument;
- (BOOL)hasUserInteractionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MUUserInteractionARPRating)arpRatingArgument;
- (MUUserInteractionARPSuggestion)arpSuggestionArgument;
- (MUUserInteractionExploreGuide)exploreGuidesArgument;
- (MUUserInteractionUserGuide)userGuideArgument;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)userInteractionTypeAsString:(int)a3;
- (int)StringAsUserInteractionType:(id)a3;
- (int)userInteractionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArpRatingArgument:(id)a3;
- (void)setArpSuggestionArgument:(id)a3;
- (void)setExploreGuidesArgument:(id)a3;
- (void)setHasUserInteractionType:(BOOL)a3;
- (void)setUserGuideArgument:(id)a3;
- (void)setUserInteractionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MUUserInteractionAction

- (int)userInteractionType
{
  if (*(unsigned char *)&self->_has) {
    return self->_userInteractionType;
  }
  else {
    return 0;
  }
}

- (void)setUserInteractionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_userInteractionType = a3;
}

- (void)setHasUserInteractionType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserInteractionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)userInteractionTypeAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57508B8[a3];
  }
  return v3;
}

- (int)StringAsUserInteractionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"USER_GUIDE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXPLORE_GUIDES"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ARP_RATING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ARP_SUGGESTIONS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RAPS_IN_REVIEW"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"REPORT_AN_ISSUE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SHARE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CALL"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MESSAGE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WEBSITE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ACTION_GROUP"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"DIRECTIONS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FLYOVER"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"OFFLINE_DOWNLOAD"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ADD_PHOTOS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ADD_TO_FAVORITES"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ADD_TO_GUIDES"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasArpSuggestionArgument
{
  return self->_arpSuggestionArgument != 0;
}

- (BOOL)hasExploreGuidesArgument
{
  return self->_exploreGuidesArgument != 0;
}

- (BOOL)hasUserGuideArgument
{
  return self->_userGuideArgument != 0;
}

- (BOOL)hasArpRatingArgument
{
  return self->_arpRatingArgument != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MUUserInteractionAction;
  int v4 = [(MUUserInteractionAction *)&v8 description];
  v5 = [(MUUserInteractionAction *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t userInteractionType = self->_userInteractionType;
    if (userInteractionType >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_userInteractionType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E57508B8[userInteractionType];
    }
    [v3 setObject:v5 forKey:@"user_interaction_type"];
  }
  arpSuggestionArgument = self->_arpSuggestionArgument;
  if (arpSuggestionArgument)
  {
    v7 = [(MUUserInteractionARPSuggestion *)arpSuggestionArgument dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"arp_suggestion_argument"];
  }
  exploreGuidesArgument = self->_exploreGuidesArgument;
  if (exploreGuidesArgument)
  {
    v9 = [(MUUserInteractionExploreGuide *)exploreGuidesArgument dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"explore_guides_argument"];
  }
  userGuideArgument = self->_userGuideArgument;
  if (userGuideArgument)
  {
    v11 = [(MUUserInteractionUserGuide *)userGuideArgument dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"user_guide_argument"];
  }
  arpRatingArgument = self->_arpRatingArgument;
  if (arpRatingArgument)
  {
    v13 = [(MUUserInteractionARPRating *)arpRatingArgument dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"arp_rating_argument"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MUUserInteractionActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_arpSuggestionArgument)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_exploreGuidesArgument)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userGuideArgument)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_arpRatingArgument)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[10] = self->_userInteractionType;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v5 = v4;
  if (self->_arpSuggestionArgument)
  {
    objc_msgSend(v4, "setArpSuggestionArgument:");
    id v4 = v5;
  }
  if (self->_exploreGuidesArgument)
  {
    objc_msgSend(v5, "setExploreGuidesArgument:");
    id v4 = v5;
  }
  if (self->_userGuideArgument)
  {
    objc_msgSend(v5, "setUserGuideArgument:");
    id v4 = v5;
  }
  if (self->_arpRatingArgument)
  {
    objc_msgSend(v5, "setArpRatingArgument:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_userInteractionType;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  id v7 = [(MUUserInteractionARPSuggestion *)self->_arpSuggestionArgument copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  id v9 = [(MUUserInteractionExploreGuide *)self->_exploreGuidesArgument copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  id v11 = [(MUUserInteractionUserGuide *)self->_userGuideArgument copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  id v13 = [(MUUserInteractionARPRating *)self->_arpRatingArgument copyWithZone:a3];
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_userInteractionType != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  arpSuggestionArgument = self->_arpSuggestionArgument;
  if ((unint64_t)arpSuggestionArgument | *((void *)v4 + 2)
    && !-[MUUserInteractionARPSuggestion isEqual:](arpSuggestionArgument, "isEqual:"))
  {
    goto LABEL_15;
  }
  exploreGuidesArgument = self->_exploreGuidesArgument;
  if ((unint64_t)exploreGuidesArgument | *((void *)v4 + 3))
  {
    if (!-[MUUserInteractionExploreGuide isEqual:](exploreGuidesArgument, "isEqual:")) {
      goto LABEL_15;
    }
  }
  userGuideArgument = self->_userGuideArgument;
  if ((unint64_t)userGuideArgument | *((void *)v4 + 4))
  {
    if (!-[MUUserInteractionUserGuide isEqual:](userGuideArgument, "isEqual:")) {
      goto LABEL_15;
    }
  }
  arpRatingArgument = self->_arpRatingArgument;
  if ((unint64_t)arpRatingArgument | *((void *)v4 + 1)) {
    char v9 = -[MUUserInteractionARPRating isEqual:](arpRatingArgument, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_userInteractionType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(MUUserInteractionARPSuggestion *)self->_arpSuggestionArgument hash] ^ v3;
  unint64_t v5 = [(MUUserInteractionExploreGuide *)self->_exploreGuidesArgument hash];
  unint64_t v6 = v4 ^ v5 ^ [(MUUserInteractionUserGuide *)self->_userGuideArgument hash];
  return v6 ^ [(MUUserInteractionARPRating *)self->_arpRatingArgument hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (*((unsigned char *)v4 + 44))
  {
    self->_uint64_t userInteractionType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
  }
  arpSuggestionArgument = self->_arpSuggestionArgument;
  uint64_t v7 = v5[2];
  v14 = v5;
  if (arpSuggestionArgument)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MUUserInteractionARPSuggestion mergeFrom:](arpSuggestionArgument, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[MUUserInteractionAction setArpSuggestionArgument:](self, "setArpSuggestionArgument:");
  }
  unint64_t v5 = v14;
LABEL_9:
  exploreGuidesArgument = self->_exploreGuidesArgument;
  uint64_t v9 = v5[3];
  if (exploreGuidesArgument)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MUUserInteractionExploreGuide mergeFrom:](exploreGuidesArgument, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[MUUserInteractionAction setExploreGuidesArgument:](self, "setExploreGuidesArgument:");
  }
  unint64_t v5 = v14;
LABEL_15:
  userGuideArgument = self->_userGuideArgument;
  uint64_t v11 = v5[4];
  if (userGuideArgument)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MUUserInteractionUserGuide mergeFrom:](userGuideArgument, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[MUUserInteractionAction setUserGuideArgument:](self, "setUserGuideArgument:");
  }
  unint64_t v5 = v14;
LABEL_21:
  arpRatingArgument = self->_arpRatingArgument;
  uint64_t v13 = v5[1];
  if (arpRatingArgument)
  {
    if (!v13) {
      goto LABEL_27;
    }
    arpRatingArgument = (MUUserInteractionARPRating *)-[MUUserInteractionARPRating mergeFrom:](arpRatingArgument, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    arpRatingArgument = (MUUserInteractionARPRating *)-[MUUserInteractionAction setArpRatingArgument:](self, "setArpRatingArgument:");
  }
  unint64_t v5 = v14;
LABEL_27:
  MEMORY[0x1F41817F8](arpRatingArgument, v5);
}

- (MUUserInteractionARPSuggestion)arpSuggestionArgument
{
  return self->_arpSuggestionArgument;
}

- (void)setArpSuggestionArgument:(id)a3
{
}

- (MUUserInteractionExploreGuide)exploreGuidesArgument
{
  return self->_exploreGuidesArgument;
}

- (void)setExploreGuidesArgument:(id)a3
{
}

- (MUUserInteractionUserGuide)userGuideArgument
{
  return self->_userGuideArgument;
}

- (void)setUserGuideArgument:(id)a3
{
}

- (MUUserInteractionARPRating)arpRatingArgument
{
  return self->_arpRatingArgument;
}

- (void)setArpRatingArgument:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userGuideArgument, 0);
  objc_storeStrong((id *)&self->_exploreGuidesArgument, 0);
  objc_storeStrong((id *)&self->_arpSuggestionArgument, 0);
  objc_storeStrong((id *)&self->_arpRatingArgument, 0);
}

@end