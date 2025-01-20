@interface ATXMPBBlendingCaptureRateTracker
- (BOOL)captured;
- (BOOL)hasAbGroup;
- (BOOL)hasCaptureType;
- (BOOL)hasCaptured;
- (BOOL)hasConsumerSubType;
- (BOOL)hasExecutableType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)consumerSubType;
- (NSString)executableType;
- (id)captureTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCaptureType:(id)a3;
- (int)captureType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setCaptureType:(int)a3;
- (void)setCaptured:(BOOL)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setExecutableType:(id)a3;
- (void)setHasCaptureType:(BOOL)a3;
- (void)setHasCaptured:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBBlendingCaptureRateTracker

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (void)setCaptured:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_captured = a3;
}

- (void)setHasCaptured:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCaptured
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)captureType
{
  if (*(unsigned char *)&self->_has) {
    return self->_captureType;
  }
  else {
    return 1;
  }
}

- (void)setCaptureType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_captureType = a3;
}

- (void)setHasCaptureType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaptureType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)captureTypeAsString:(int)a3
{
  if (a3 > 4999)
  {
    switch(a3)
    {
      case 5000:
        v4 = @"HomeScreenDiverted_AppLaunchedFromHomeScreen";
        break;
      case 5001:
        v4 = @"HomeScreenDiverted_AppLaunchedFromShortcutExecution";
        break;
      case 5002:
        v4 = @"HomeScreenDiverted_AppLaunchedFromWidgetTap";
        break;
      case 5003:
        v4 = @"HomeScreenDiverted_AppLaunchedFromSuggestionsWidget";
        break;
      case 5004:
        v4 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenDock";
        break;
      case 5005:
        v4 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenSamePage";
        break;
      case 5006:
        v4 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenSamePageFolder";
        break;
      case 5007:
        v4 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPage";
        break;
      case 5008:
        v4 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPageFolder";
        break;
      default:
        goto LABEL_37;
    }
  }
  else
  {
    if (a3 > 2999)
    {
      switch(a3)
      {
        case 4000:
          v4 = @"AppLibraryDiverted_AppLaunchedFromSearch";
          break;
        case 4001:
          v4 = @"AppLibraryDiverted_AppLaunchedFromCategoryPreview";
          break;
        case 4002:
          v4 = @"AppLibraryDiverted_AppLaunchedFromExpandedCategory";
          break;
        case 4003:
          v4 = @"AppLibraryDiverted_AppLaunchedFromRecents";
          break;
        case 4004:
          v4 = @"AppLibraryDiverted_AppLaunchedFromSearch_Deduped";
          break;
        case 4005:
          v4 = @"AppLibraryDiverted_AppLaunchedFromCategoryPreview_Deduped";
          break;
        case 4006:
          v4 = @"AppLibraryDiverted_AppLaunchedFromExpandedCategory_Deduped";
          break;
        case 4007:
          v4 = @"AppLibraryDiverted_AppLaunchedFromRecents_Deduped";
          break;
        default:
          if (a3 == 3000)
          {
            v4 = @"SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch";
          }
          else
          {
            if (a3 != 3001) {
              goto LABEL_37;
            }
            v4 = @"SpotlightDiverted_ActionExecutedFromSearch";
          }
          break;
      }
      return v4;
    }
    if (a3 <= 1999)
    {
      if (a3 == 1)
      {
        v4 = @"Captured";
      }
      else
      {
        if (a3 != 1000) {
          goto LABEL_37;
        }
        v4 = @"Diverted";
      }
    }
    else
    {
      switch(a3)
      {
        case 2000:
          v4 = @"SpotlightDiverted_AppLaunchedFromShortcutExecution";
          break;
        case 2001:
          v4 = @"SpotlightDiverted_AppLaunchedFromSearch";
          break;
        case 2002:
          v4 = @"SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp";
          return v4;
        default:
LABEL_37:
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
          return v4;
      }
    }
  }
  return v4;
}

- (int)StringAsCaptureType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Captured"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Diverted"])
  {
    int v4 = 1000;
  }
  else if ([v3 isEqualToString:@"SpotlightDiverted_AppLaunchedFromShortcutExecution"])
  {
    int v4 = 2000;
  }
  else if ([v3 isEqualToString:@"SpotlightDiverted_AppLaunchedFromSearch"])
  {
    int v4 = 2001;
  }
  else if ([v3 isEqualToString:@"SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp"])
  {
    int v4 = 2002;
  }
  else if ([v3 isEqualToString:@"SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch"])
  {
    int v4 = 3000;
  }
  else if ([v3 isEqualToString:@"SpotlightDiverted_ActionExecutedFromSearch"])
  {
    int v4 = 3001;
  }
  else if ([v3 isEqualToString:@"AppLibraryDiverted_AppLaunchedFromSearch"])
  {
    int v4 = 4000;
  }
  else if ([v3 isEqualToString:@"AppLibraryDiverted_AppLaunchedFromCategoryPreview"])
  {
    int v4 = 4001;
  }
  else if ([v3 isEqualToString:@"AppLibraryDiverted_AppLaunchedFromExpandedCategory"])
  {
    int v4 = 4002;
  }
  else if ([v3 isEqualToString:@"AppLibraryDiverted_AppLaunchedFromRecents"])
  {
    int v4 = 4003;
  }
  else if ([v3 isEqualToString:@"AppLibraryDiverted_AppLaunchedFromSearch_Deduped"])
  {
    int v4 = 4004;
  }
  else if ([v3 isEqualToString:@"AppLibraryDiverted_AppLaunchedFromCategoryPreview_Deduped"])
  {
    int v4 = 4005;
  }
  else if ([v3 isEqualToString:@"AppLibraryDiverted_AppLaunchedFromExpandedCategory_Deduped"])
  {
    int v4 = 4006;
  }
  else if ([v3 isEqualToString:@"AppLibraryDiverted_AppLaunchedFromRecents_Deduped"])
  {
    int v4 = 4007;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromHomeScreen"])
  {
    int v4 = 5000;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromShortcutExecution"])
  {
    int v4 = 5001;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromWidgetTap"])
  {
    int v4 = 5002;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromSuggestionsWidget"])
  {
    int v4 = 5003;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromHomeScreenDock"])
  {
    int v4 = 5004;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromHomeScreenSamePage"])
  {
    int v4 = 5005;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromHomeScreenSamePageFolder"])
  {
    int v4 = 5006;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPage"])
  {
    int v4 = 5007;
  }
  else if ([v3 isEqualToString:@"HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPageFolder"])
  {
    int v4 = 5008;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBBlendingCaptureRateTracker;
  int v4 = [(ATXMPBBlendingCaptureRateTracker *)&v8 description];
  v5 = [(ATXMPBBlendingCaptureRateTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v3 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_captured];
    [v4 setObject:v7 forKey:@"captured"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int captureType = self->_captureType;
    if (captureType > 4999)
    {
      switch(captureType)
      {
        case 5000:
          v9 = @"HomeScreenDiverted_AppLaunchedFromHomeScreen";
          break;
        case 5001:
          v9 = @"HomeScreenDiverted_AppLaunchedFromShortcutExecution";
          break;
        case 5002:
          v9 = @"HomeScreenDiverted_AppLaunchedFromWidgetTap";
          break;
        case 5003:
          v9 = @"HomeScreenDiverted_AppLaunchedFromSuggestionsWidget";
          break;
        case 5004:
          v9 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenDock";
          break;
        case 5005:
          v9 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenSamePage";
          break;
        case 5006:
          v9 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenSamePageFolder";
          break;
        case 5007:
          v9 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPage";
          break;
        case 5008:
          v9 = @"HomeScreenDiverted_AppLaunchedFromHomeScreenDiffPageFolder";
          break;
        default:
          goto LABEL_26;
      }
      goto LABEL_43;
    }
    if (captureType > 2999)
    {
      switch(captureType)
      {
        case 4000:
          v9 = @"AppLibraryDiverted_AppLaunchedFromSearch";
          break;
        case 4001:
          v9 = @"AppLibraryDiverted_AppLaunchedFromCategoryPreview";
          break;
        case 4002:
          v9 = @"AppLibraryDiverted_AppLaunchedFromExpandedCategory";
          break;
        case 4003:
          v9 = @"AppLibraryDiverted_AppLaunchedFromRecents";
          break;
        case 4004:
          v9 = @"AppLibraryDiverted_AppLaunchedFromSearch_Deduped";
          break;
        case 4005:
          v9 = @"AppLibraryDiverted_AppLaunchedFromCategoryPreview_Deduped";
          break;
        case 4006:
          v9 = @"AppLibraryDiverted_AppLaunchedFromExpandedCategory_Deduped";
          break;
        case 4007:
          v9 = @"AppLibraryDiverted_AppLaunchedFromRecents_Deduped";
          break;
        default:
          if (captureType == 3000)
          {
            v9 = @"SpotlightDiverted_ActionDonatedAfterSpotlightAppLaunch";
          }
          else
          {
            if (captureType != 3001) {
              goto LABEL_26;
            }
            v9 = @"SpotlightDiverted_ActionExecutedFromSearch";
          }
          break;
      }
      goto LABEL_43;
    }
    if (captureType <= 1999)
    {
      if (captureType == 1)
      {
        v9 = @"Captured";
        goto LABEL_43;
      }
      if (captureType == 1000)
      {
        v9 = @"Diverted";
        goto LABEL_43;
      }
    }
    else
    {
      switch(captureType)
      {
        case 2000:
          v9 = @"SpotlightDiverted_AppLaunchedFromShortcutExecution";
          goto LABEL_43;
        case 2001:
          v9 = @"SpotlightDiverted_AppLaunchedFromSearch";
          goto LABEL_43;
        case 2002:
          v9 = @"SpotlightDiverted_AppLaunchedFromSearchMatchingPredictedApp";
LABEL_43:
          [v4 setObject:v9 forKey:@"captureType"];

          goto LABEL_44;
      }
    }
LABEL_26:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_captureType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
LABEL_44:
  executableType = self->_executableType;
  if (executableType) {
    [v4 setObject:executableType forKey:@"executableType"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBBlendingCaptureRateTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_consumerSubType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_consumerSubType)
  {
    objc_msgSend(v4, "setConsumerSubType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_captured;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_captureType;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if (self->_executableType)
  {
    objc_msgSend(v6, "setExecutableType:");
    id v4 = v6;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v6, "setAbGroup:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_captured;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_captureType;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_executableType copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_abGroup copyWithZone:a3];
  v12 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](consumerSubType, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_captured)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_21;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_12;
      }
    }
LABEL_21:
    char v8 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_21;
  }
LABEL_12:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_captureType != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((void *)v4 + 4)
    && !-[NSString isEqual:](executableType, "isEqual:"))
  {
    goto LABEL_21;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](abGroup, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_consumerSubType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_captured;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_captureType;
LABEL_6:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_executableType hash];
  return v6 ^ [(NSString *)self->_abGroup hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[ATXMPBBlendingCaptureRateTracker setConsumerSubType:](self, "setConsumerSubType:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_captured = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if (v5)
  {
    self->_int captureType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXMPBBlendingCaptureRateTracker setExecutableType:](self, "setExecutableType:");
    id v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBBlendingCaptureRateTracker setAbGroup:](self, "setAbGroup:");
    id v4 = v6;
  }
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (BOOL)captured
{
  return self->_captured;
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);

  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end