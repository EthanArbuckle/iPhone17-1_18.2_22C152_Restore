@interface ATXMPBAppLaunchOverallCaptureRateTracker
- (BOOL)appLibraryEnabled;
- (BOOL)appPredictionPanelEnabled;
- (BOOL)appPredictionPanelTodayEnabled;
- (BOOL)hasAppLibraryEnabled;
- (BOOL)hasAppPredictionPanelEnabled;
- (BOOL)hasAppPredictionPanelTodayEnabled;
- (BOOL)hasCaptureType;
- (BOOL)hasIconLocation;
- (BOOL)hasSpotlightEnabled;
- (BOOL)hasSuggestionsWidgetEnabled;
- (BOOL)hasSuggestionsWidgetTodayEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)spotlightEnabled;
- (BOOL)suggestionsWidgetEnabled;
- (BOOL)suggestionsWidgetTodayEnabled;
- (id)captureTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)iconLocationAsString:(int)a3;
- (int)StringAsCaptureType:(id)a3;
- (int)StringAsIconLocation:(id)a3;
- (int)captureType;
- (int)iconLocation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppLibraryEnabled:(BOOL)a3;
- (void)setAppPredictionPanelEnabled:(BOOL)a3;
- (void)setAppPredictionPanelTodayEnabled:(BOOL)a3;
- (void)setCaptureType:(int)a3;
- (void)setHasAppLibraryEnabled:(BOOL)a3;
- (void)setHasAppPredictionPanelEnabled:(BOOL)a3;
- (void)setHasAppPredictionPanelTodayEnabled:(BOOL)a3;
- (void)setHasCaptureType:(BOOL)a3;
- (void)setHasIconLocation:(BOOL)a3;
- (void)setHasSpotlightEnabled:(BOOL)a3;
- (void)setHasSuggestionsWidgetEnabled:(BOOL)a3;
- (void)setHasSuggestionsWidgetTodayEnabled:(BOOL)a3;
- (void)setIconLocation:(int)a3;
- (void)setSpotlightEnabled:(BOOL)a3;
- (void)setSuggestionsWidgetEnabled:(BOOL)a3;
- (void)setSuggestionsWidgetTodayEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBAppLaunchOverallCaptureRateTracker

- (int)captureType
{
  if (*(unsigned char *)&self->_has) {
    return self->_captureType;
  }
  else {
    return 0;
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
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5D0A8C8[a3];
  }

  return v3;
}

- (int)StringAsCaptureType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HomeScreen"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HomeScreenDock"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Spotlight"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AppLibrary"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HomeScreenOrTodayWidget"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"AppPredictionPanel"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"AppPredictionPanelToday"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SuggestionsWidget"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SuggestionsWidgetToday"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)iconLocation
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_iconLocation;
  }
  else {
    return 0;
  }
}

- (void)setIconLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_iconLocation = a3;
}

- (void)setHasIconLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIconLocation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)iconLocationAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5D0A918[a3];
  }

  return v3;
}

- (int)StringAsIconLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NotOnHomeScreen"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Dock"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Page1"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Page2"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Page3"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Page4"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Page5"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Page6"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"OtherPages"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSpotlightEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_spotlightEnabled = a3;
}

- (void)setHasSpotlightEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSpotlightEnabled
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAppLibraryEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_appLibraryEnabled = a3;
}

- (void)setHasAppLibraryEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAppLibraryEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAppPredictionPanelEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_appPredictionPanelEnabled = a3;
}

- (void)setHasAppPredictionPanelEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAppPredictionPanelEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAppPredictionPanelTodayEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_appPredictionPanelTodayEnabled = a3;
}

- (void)setHasAppPredictionPanelTodayEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAppPredictionPanelTodayEnabled
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSuggestionsWidgetEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_suggestionsWidgetEnabled = a3;
}

- (void)setHasSuggestionsWidgetEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSuggestionsWidgetEnabled
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSuggestionsWidgetTodayEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_suggestionsWidgetTodayEnabled = a3;
}

- (void)setHasSuggestionsWidgetTodayEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSuggestionsWidgetTodayEnabled
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBAppLaunchOverallCaptureRateTracker;
  int v4 = [(ATXMPBAppLaunchOverallCaptureRateTracker *)&v8 description];
  v5 = [(ATXMPBAppLaunchOverallCaptureRateTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t captureType = self->_captureType;
    if (captureType >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_captureType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5D0A8C8[captureType];
    }
    [v3 setObject:v6 forKey:@"captureType"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t iconLocation = self->_iconLocation;
    if (iconLocation >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_iconLocation);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5D0A918[iconLocation];
    }
    [v3 setObject:v8 forKey:@"iconLocation"];

    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_spotlightEnabled];
    [v3 setObject:v10 forKey:@"spotlightEnabled"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_13;
  }
  v11 = [NSNumber numberWithBool:self->_appLibraryEnabled];
  [v3 setObject:v11 forKey:@"appLibraryEnabled"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  v12 = [NSNumber numberWithBool:self->_appPredictionPanelEnabled];
  [v3 setObject:v12 forKey:@"appPredictionPanelEnabled"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0) {
      goto LABEL_16;
    }
LABEL_24:
    v14 = [NSNumber numberWithBool:self->_suggestionsWidgetEnabled];
    [v3 setObject:v14 forKey:@"suggestionsWidgetEnabled"];

    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_23:
  v13 = [NSNumber numberWithBool:self->_appPredictionPanelTodayEnabled];
  [v3 setObject:v13 forKey:@"appPredictionPanelTodayEnabled"];

  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_24;
  }
LABEL_16:
  if ((has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_25:
  v15 = [NSNumber numberWithBool:self->_suggestionsWidgetTodayEnabled];
  [v3 setObject:v15 forKey:@"suggestionsWidgetTodayEnabled"];

LABEL_17:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAppLaunchOverallCaptureRateTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_captureType;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_iconLocation;
  *((unsigned char *)v4 + 24) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v4 + 19) = self->_spotlightEnabled;
  *((unsigned char *)v4 + 24) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)v4 + 16) = self->_appLibraryEnabled;
  *((unsigned char *)v4 + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((unsigned char *)v4 + 17) = self->_appPredictionPanelEnabled;
  *((unsigned char *)v4 + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    *((unsigned char *)v4 + 20) = self->_suggestionsWidgetEnabled;
    *((unsigned char *)v4 + 24) |= 0x40u;
    if ((*(unsigned char *)&self->_has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  *((unsigned char *)v4 + 18) = self->_appPredictionPanelTodayEnabled;
  *((unsigned char *)v4 + 24) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((has & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  *((unsigned char *)v4 + 21) = self->_suggestionsWidgetTodayEnabled;
  *((unsigned char *)v4 + 24) |= 0x80u;
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_captureType;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_iconLocation;
  *((unsigned char *)result + 24) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 19) = self->_spotlightEnabled;
  *((unsigned char *)result + 24) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 16) = self->_appLibraryEnabled;
  *((unsigned char *)result + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 17) = self->_appPredictionPanelEnabled;
  *((unsigned char *)result + 24) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)result + 18) = self->_appPredictionPanelTodayEnabled;
  *((unsigned char *)result + 24) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      return result;
    }
LABEL_17:
    *((unsigned char *)result + 21) = self->_suggestionsWidgetTodayEnabled;
    *((unsigned char *)result + 24) |= 0x80u;
    return result;
  }
LABEL_16:
  *((unsigned char *)result + 20) = self->_suggestionsWidgetEnabled;
  *((unsigned char *)result + 24) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    goto LABEL_17;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[24] & 1) == 0 || self->_captureType != *((_DWORD *)v4 + 2)) {
      goto LABEL_54;
    }
  }
  else if (v4[24])
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[24] & 2) == 0 || self->_iconLocation != *((_DWORD *)v4 + 3)) {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 2) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[24] & 0x20) == 0) {
      goto LABEL_54;
    }
    if (self->_spotlightEnabled)
    {
      if (!v4[19]) {
        goto LABEL_54;
      }
    }
    else if (v4[19])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 0x20) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[24] & 4) == 0) {
      goto LABEL_54;
    }
    if (self->_appLibraryEnabled)
    {
      if (!v4[16]) {
        goto LABEL_54;
      }
    }
    else if (v4[16])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 4) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[24] & 8) == 0) {
      goto LABEL_54;
    }
    if (self->_appPredictionPanelEnabled)
    {
      if (!v4[17]) {
        goto LABEL_54;
      }
    }
    else if (v4[17])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 8) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[24] & 0x10) == 0) {
      goto LABEL_54;
    }
    if (self->_appPredictionPanelTodayEnabled)
    {
      if (!v4[18]) {
        goto LABEL_54;
      }
    }
    else if (v4[18])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 0x10) != 0)
  {
    goto LABEL_54;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[24] & 0x40) == 0) {
      goto LABEL_54;
    }
    if (self->_suggestionsWidgetEnabled)
    {
      if (!v4[20]) {
        goto LABEL_54;
      }
    }
    else if (v4[20])
    {
      goto LABEL_54;
    }
  }
  else if ((v4[24] & 0x40) != 0)
  {
    goto LABEL_54;
  }
  BOOL v5 = v4[24] >= 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if (v4[24] < 0)
    {
      if (self->_suggestionsWidgetTodayEnabled)
      {
        if (!v4[21]) {
          goto LABEL_54;
        }
      }
      else if (v4[21])
      {
        goto LABEL_54;
      }
      BOOL v5 = 1;
      goto LABEL_55;
    }
LABEL_54:
    BOOL v5 = 0;
  }
LABEL_55:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_captureType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_iconLocation;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_spotlightEnabled;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_appLibraryEnabled;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_appPredictionPanelEnabled;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_appPredictionPanelTodayEnabled;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_suggestionsWidgetEnabled;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_suggestionsWidgetTodayEnabled;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_uint64_t captureType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t iconLocation = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_spotlightEnabled = *((unsigned char *)v4 + 19);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_appLibraryEnabled = *((unsigned char *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_appPredictionPanelEnabled = *((unsigned char *)v4 + 17);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_18:
    self->_suggestionsWidgetEnabled = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 0x40u;
    if ((*((unsigned char *)v4 + 24) & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_17:
  self->_appPredictionPanelTodayEnabled = *((unsigned char *)v4 + 18);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 0x40) != 0) {
    goto LABEL_18;
  }
LABEL_8:
  if ((v5 & 0x80) == 0) {
    goto LABEL_9;
  }
LABEL_19:
  self->_suggestionsWidgetTodayEnabled = *((unsigned char *)v4 + 21);
  *(unsigned char *)&self->_has |= 0x80u;
LABEL_9:
}

- (BOOL)spotlightEnabled
{
  return self->_spotlightEnabled;
}

- (BOOL)appLibraryEnabled
{
  return self->_appLibraryEnabled;
}

- (BOOL)appPredictionPanelEnabled
{
  return self->_appPredictionPanelEnabled;
}

- (BOOL)appPredictionPanelTodayEnabled
{
  return self->_appPredictionPanelTodayEnabled;
}

- (BOOL)suggestionsWidgetEnabled
{
  return self->_suggestionsWidgetEnabled;
}

- (BOOL)suggestionsWidgetTodayEnabled
{
  return self->_suggestionsWidgetTodayEnabled;
}

@end