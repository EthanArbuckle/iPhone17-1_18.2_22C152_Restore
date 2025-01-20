@interface ATXMPBScreenLogUnlockSessionTracker
- (BOOL)appLibraryEnabled;
- (BOOL)appLibraryViewed;
- (BOOL)appPredictionPanelEnabled;
- (BOOL)appPredictionPanelTodayPageEnabled;
- (BOOL)appPredictionPanelTodayPageViewed;
- (BOOL)appPredictionPanelViewed;
- (BOOL)hasAppLibraryEnabled;
- (BOOL)hasAppLibraryViewed;
- (BOOL)hasAppPredictionPanelEnabled;
- (BOOL)hasAppPredictionPanelTodayPageEnabled;
- (BOOL)hasAppPredictionPanelTodayPageViewed;
- (BOOL)hasAppPredictionPanelViewed;
- (BOOL)hasNumEngagementsInAppLibrary;
- (BOOL)hasNumEngagementsInAppPredictionPanel;
- (BOOL)hasNumEngagementsInAppPredictionPanelTodayPage;
- (BOOL)hasNumEngagementsInSpotlightActions;
- (BOOL)hasNumEngagementsInSpotlightApps;
- (BOOL)hasNumEngagementsInSuggestionsWidget;
- (BOOL)hasNumEngagementsInSuggestionsWidgetTodayPage;
- (BOOL)hasSessionLengthInSeconds;
- (BOOL)hasSpotlightActionsViewed;
- (BOOL)hasSpotlightAppsViewed;
- (BOOL)hasSpotlightEnabled;
- (BOOL)hasSuggestionsWidgetEnabled;
- (BOOL)hasSuggestionsWidgetTodayPageEnabled;
- (BOOL)hasSuggestionsWidgetTodayPageViewed;
- (BOOL)hasSuggestionsWidgetViewed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)spotlightActionsViewed;
- (BOOL)spotlightAppsViewed;
- (BOOL)spotlightEnabled;
- (BOOL)suggestionsWidgetEnabled;
- (BOOL)suggestionsWidgetTodayPageEnabled;
- (BOOL)suggestionsWidgetTodayPageViewed;
- (BOOL)suggestionsWidgetViewed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)numEngagementsInAppLibrary;
- (unsigned)numEngagementsInAppPredictionPanel;
- (unsigned)numEngagementsInAppPredictionPanelTodayPage;
- (unsigned)numEngagementsInSpotlightActions;
- (unsigned)numEngagementsInSpotlightApps;
- (unsigned)numEngagementsInSuggestionsWidget;
- (unsigned)numEngagementsInSuggestionsWidgetTodayPage;
- (unsigned)sessionLengthInSeconds;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppLibraryEnabled:(BOOL)a3;
- (void)setAppLibraryViewed:(BOOL)a3;
- (void)setAppPredictionPanelEnabled:(BOOL)a3;
- (void)setAppPredictionPanelTodayPageEnabled:(BOOL)a3;
- (void)setAppPredictionPanelTodayPageViewed:(BOOL)a3;
- (void)setAppPredictionPanelViewed:(BOOL)a3;
- (void)setHasAppLibraryEnabled:(BOOL)a3;
- (void)setHasAppLibraryViewed:(BOOL)a3;
- (void)setHasAppPredictionPanelEnabled:(BOOL)a3;
- (void)setHasAppPredictionPanelTodayPageEnabled:(BOOL)a3;
- (void)setHasAppPredictionPanelTodayPageViewed:(BOOL)a3;
- (void)setHasAppPredictionPanelViewed:(BOOL)a3;
- (void)setHasNumEngagementsInAppLibrary:(BOOL)a3;
- (void)setHasNumEngagementsInAppPredictionPanel:(BOOL)a3;
- (void)setHasNumEngagementsInAppPredictionPanelTodayPage:(BOOL)a3;
- (void)setHasNumEngagementsInSpotlightActions:(BOOL)a3;
- (void)setHasNumEngagementsInSpotlightApps:(BOOL)a3;
- (void)setHasNumEngagementsInSuggestionsWidget:(BOOL)a3;
- (void)setHasNumEngagementsInSuggestionsWidgetTodayPage:(BOOL)a3;
- (void)setHasSessionLengthInSeconds:(BOOL)a3;
- (void)setHasSpotlightActionsViewed:(BOOL)a3;
- (void)setHasSpotlightAppsViewed:(BOOL)a3;
- (void)setHasSpotlightEnabled:(BOOL)a3;
- (void)setHasSuggestionsWidgetEnabled:(BOOL)a3;
- (void)setHasSuggestionsWidgetTodayPageEnabled:(BOOL)a3;
- (void)setHasSuggestionsWidgetTodayPageViewed:(BOOL)a3;
- (void)setHasSuggestionsWidgetViewed:(BOOL)a3;
- (void)setNumEngagementsInAppLibrary:(unsigned int)a3;
- (void)setNumEngagementsInAppPredictionPanel:(unsigned int)a3;
- (void)setNumEngagementsInAppPredictionPanelTodayPage:(unsigned int)a3;
- (void)setNumEngagementsInSpotlightActions:(unsigned int)a3;
- (void)setNumEngagementsInSpotlightApps:(unsigned int)a3;
- (void)setNumEngagementsInSuggestionsWidget:(unsigned int)a3;
- (void)setNumEngagementsInSuggestionsWidgetTodayPage:(unsigned int)a3;
- (void)setSessionLengthInSeconds:(unsigned int)a3;
- (void)setSpotlightActionsViewed:(BOOL)a3;
- (void)setSpotlightAppsViewed:(BOOL)a3;
- (void)setSpotlightEnabled:(BOOL)a3;
- (void)setSuggestionsWidgetEnabled:(BOOL)a3;
- (void)setSuggestionsWidgetTodayPageEnabled:(BOOL)a3;
- (void)setSuggestionsWidgetTodayPageViewed:(BOOL)a3;
- (void)setSuggestionsWidgetViewed:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBScreenLogUnlockSessionTracker

- (void)setSessionLengthInSeconds:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_sessionLengthInSeconds = a3;
}

- (void)setHasSessionLengthInSeconds:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasSessionLengthInSeconds
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setNumEngagementsInSpotlightApps:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_numEngagementsInSpotlightApps = a3;
}

- (void)setHasNumEngagementsInSpotlightApps:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNumEngagementsInSpotlightApps
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setNumEngagementsInSpotlightActions:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_numEngagementsInSpotlightActions = a3;
}

- (void)setHasNumEngagementsInSpotlightActions:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNumEngagementsInSpotlightActions
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumEngagementsInSuggestionsWidget:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_numEngagementsInSuggestionsWidget = a3;
}

- (void)setHasNumEngagementsInSuggestionsWidget:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNumEngagementsInSuggestionsWidget
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNumEngagementsInAppPredictionPanel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_numEngagementsInAppPredictionPanel = a3;
}

- (void)setHasNumEngagementsInAppPredictionPanel:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasNumEngagementsInAppPredictionPanel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumEngagementsInAppLibrary:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_numEngagementsInAppLibrary = a3;
}

- (void)setHasNumEngagementsInAppLibrary:(BOOL)a3
{
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasNumEngagementsInAppLibrary
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSpotlightEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_spotlightEnabled = a3;
}

- (void)setHasSpotlightEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSpotlightEnabled
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSuggestionsWidgetEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_suggestionsWidgetEnabled = a3;
}

- (void)setHasSuggestionsWidgetEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSuggestionsWidgetEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAppPredictionPanelEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_appPredictionPanelEnabled = a3;
}

- (void)setHasAppPredictionPanelEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasAppPredictionPanelEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAppLibraryEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_appLibraryEnabled = a3;
}

- (void)setHasAppLibraryEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasAppLibraryEnabled
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setSpotlightAppsViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_spotlightAppsViewed = a3;
}

- (void)setHasSpotlightAppsViewed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSpotlightAppsViewed
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSpotlightActionsViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_spotlightActionsViewed = a3;
}

- (void)setHasSpotlightActionsViewed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSpotlightActionsViewed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSuggestionsWidgetViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_suggestionsWidgetViewed = a3;
}

- (void)setHasSuggestionsWidgetViewed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSuggestionsWidgetViewed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setAppPredictionPanelViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_appPredictionPanelViewed = a3;
}

- (void)setHasAppPredictionPanelViewed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAppPredictionPanelViewed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setAppLibraryViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_appLibraryViewed = a3;
}

- (void)setHasAppLibraryViewed:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasAppLibraryViewed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSuggestionsWidgetTodayPageViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_suggestionsWidgetTodayPageViewed = a3;
}

- (void)setHasSuggestionsWidgetTodayPageViewed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSuggestionsWidgetTodayPageViewed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAppPredictionPanelTodayPageViewed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_appPredictionPanelTodayPageViewed = a3;
}

- (void)setHasAppPredictionPanelTodayPageViewed:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasAppPredictionPanelTodayPageViewed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setNumEngagementsInSuggestionsWidgetTodayPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_numEngagementsInSuggestionsWidgetTodayPage = a3;
}

- (void)setHasNumEngagementsInSuggestionsWidgetTodayPage:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNumEngagementsInSuggestionsWidgetTodayPage
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setNumEngagementsInAppPredictionPanelTodayPage:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_numEngagementsInAppPredictionPanelTodayPage = a3;
}

- (void)setHasNumEngagementsInAppPredictionPanelTodayPage:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNumEngagementsInAppPredictionPanelTodayPage
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSuggestionsWidgetTodayPageEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_suggestionsWidgetTodayPageEnabled = a3;
}

- (void)setHasSuggestionsWidgetTodayPageEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSuggestionsWidgetTodayPageEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setAppPredictionPanelTodayPageEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_appPredictionPanelTodayPageEnabled = a3;
}

- (void)setHasAppPredictionPanelTodayPageEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($DEF734E8A820C4B152ECF3079B765D50)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasAppPredictionPanelTodayPageEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBScreenLogUnlockSessionTracker;
  v4 = [(ATXMPBScreenLogUnlockSessionTracker *)&v8 description];
  v5 = [(ATXMPBScreenLogUnlockSessionTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_sessionLengthInSeconds];
    [v3 setObject:v7 forKey:@"sessionLengthInSeconds"];

    $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_numEngagementsInSpotlightApps];
  [v3 setObject:v8 forKey:@"numEngagementsInSpotlightApps"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  v9 = [NSNumber numberWithUnsignedInt:self->_numEngagementsInSpotlightActions];
  [v3 setObject:v9 forKey:@"numEngagementsInSpotlightActions"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  v10 = [NSNumber numberWithUnsignedInt:self->_numEngagementsInSuggestionsWidget];
  [v3 setObject:v10 forKey:@"numEngagementsInSuggestionsWidget"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  v11 = [NSNumber numberWithUnsignedInt:self->_numEngagementsInAppPredictionPanel];
  [v3 setObject:v11 forKey:@"numEngagementsInAppPredictionPanel"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  v12 = [NSNumber numberWithUnsignedInt:self->_numEngagementsInAppLibrary];
  [v3 setObject:v12 forKey:@"numEngagementsInAppLibrary"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  v13 = [NSNumber numberWithBool:self->_spotlightEnabled];
  [v3 setObject:v13 forKey:@"spotlightEnabled"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  v14 = [NSNumber numberWithBool:self->_suggestionsWidgetEnabled];
  [v3 setObject:v14 forKey:@"suggestionsWidgetEnabled"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  v15 = [NSNumber numberWithBool:self->_appPredictionPanelEnabled];
  [v3 setObject:v15 forKey:@"appPredictionPanelEnabled"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  v16 = [NSNumber numberWithBool:self->_appLibraryEnabled];
  [v3 setObject:v16 forKey:@"appLibraryEnabled"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  v17 = [NSNumber numberWithBool:self->_spotlightAppsViewed];
  [v3 setObject:v17 forKey:@"spotlightAppsViewed"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  v18 = [NSNumber numberWithBool:self->_spotlightActionsViewed];
  [v3 setObject:v18 forKey:@"spotlightActionsViewed"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  v19 = [NSNumber numberWithBool:self->_suggestionsWidgetViewed];
  [v3 setObject:v19 forKey:@"suggestionsWidgetViewed"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  v20 = [NSNumber numberWithBool:self->_appPredictionPanelViewed];
  [v3 setObject:v20 forKey:@"appPredictionPanelViewed"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  v21 = [NSNumber numberWithBool:self->_appLibraryViewed];
  [v3 setObject:v21 forKey:@"appLibraryViewed"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  v22 = [NSNumber numberWithBool:self->_suggestionsWidgetTodayPageViewed];
  [v3 setObject:v22 forKey:@"suggestionsWidgetTodayPageViewed"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  v23 = [NSNumber numberWithBool:self->_appPredictionPanelTodayPageViewed];
  [v3 setObject:v23 forKey:@"appPredictionPanelTodayPageViewed"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  v24 = [NSNumber numberWithUnsignedInt:self->_numEngagementsInSuggestionsWidgetTodayPage];
  [v3 setObject:v24 forKey:@"numEngagementsInSuggestionsWidgetTodayPage"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  v25 = [NSNumber numberWithUnsignedInt:self->_numEngagementsInAppPredictionPanelTodayPage];
  [v3 setObject:v25 forKey:@"numEngagementsInAppPredictionPanelTodayPage"];

  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  v26 = [NSNumber numberWithBool:self->_suggestionsWidgetTodayPageEnabled];
  [v3 setObject:v26 forKey:@"suggestionsWidgetTodayPageEnabled"];

  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_22:
    v5 = [NSNumber numberWithBool:self->_appPredictionPanelTodayPageEnabled];
    [v3 setObject:v5 forKey:@"appPredictionPanelTodayPageEnabled"];
  }
LABEL_23:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBScreenLogUnlockSessionTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint32Field();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_22:
  }
    PBDataWriterWriteBOOLField();
LABEL_23:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v4[9] = self->_sessionLengthInSeconds;
    v4[14] |= 0x80u;
    $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = self->_numEngagementsInSpotlightApps;
  v4[14] |= 0x10u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[5] = self->_numEngagementsInSpotlightActions;
  v4[14] |= 8u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[7] = self->_numEngagementsInSuggestionsWidget;
  v4[14] |= 0x20u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[3] = self->_numEngagementsInAppPredictionPanel;
  v4[14] |= 2u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[2] = self->_numEngagementsInAppLibrary;
  v4[14] |= 1u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)v4 + 48) = self->_spotlightEnabled;
  v4[14] |= 0x10000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((unsigned char *)v4 + 49) = self->_suggestionsWidgetEnabled;
  v4[14] |= 0x20000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((unsigned char *)v4 + 42) = self->_appPredictionPanelEnabled;
  v4[14] |= 0x400u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((unsigned char *)v4 + 40) = self->_appLibraryEnabled;
  v4[14] |= 0x100u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)v4 + 47) = self->_spotlightAppsViewed;
  v4[14] |= 0x8000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)v4 + 46) = self->_spotlightActionsViewed;
  v4[14] |= 0x4000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)v4 + 52) = self->_suggestionsWidgetViewed;
  v4[14] |= 0x100000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((unsigned char *)v4 + 45) = self->_appPredictionPanelViewed;
  v4[14] |= 0x2000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((unsigned char *)v4 + 41) = self->_appLibraryViewed;
  v4[14] |= 0x200u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((unsigned char *)v4 + 51) = self->_suggestionsWidgetTodayPageViewed;
  v4[14] |= 0x80000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v4 + 44) = self->_appPredictionPanelTodayPageViewed;
  v4[14] |= 0x1000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  v4[8] = self->_numEngagementsInSuggestionsWidgetTodayPage;
  v4[14] |= 0x40u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  v4[4] = self->_numEngagementsInAppPredictionPanelTodayPage;
  v4[14] |= 4u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  *((unsigned char *)v4 + 50) = self->_suggestionsWidgetTodayPageEnabled;
  v4[14] |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_22:
    *((unsigned char *)v4 + 43) = self->_appPredictionPanelTodayPageEnabled;
    v4[14] |= 0x800u;
  }
LABEL_23:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    *((_DWORD *)result + 9) = self->_sessionLengthInSeconds;
    *((_DWORD *)result + 14) |= 0x80u;
    $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_numEngagementsInSpotlightApps;
  *((_DWORD *)result + 14) |= 0x10u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 5) = self->_numEngagementsInSpotlightActions;
  *((_DWORD *)result + 14) |= 8u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 7) = self->_numEngagementsInSuggestionsWidget;
  *((_DWORD *)result + 14) |= 0x20u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 3) = self->_numEngagementsInAppPredictionPanel;
  *((_DWORD *)result + 14) |= 2u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 2) = self->_numEngagementsInAppLibrary;
  *((_DWORD *)result + 14) |= 1u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((unsigned char *)result + 48) = self->_spotlightEnabled;
  *((_DWORD *)result + 14) |= 0x10000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((unsigned char *)result + 49) = self->_suggestionsWidgetEnabled;
  *((_DWORD *)result + 14) |= 0x20000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)result + 42) = self->_appPredictionPanelEnabled;
  *((_DWORD *)result + 14) |= 0x400u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((unsigned char *)result + 40) = self->_appLibraryEnabled;
  *((_DWORD *)result + 14) |= 0x100u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((unsigned char *)result + 47) = self->_spotlightAppsViewed;
  *((_DWORD *)result + 14) |= 0x8000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((unsigned char *)result + 46) = self->_spotlightActionsViewed;
  *((_DWORD *)result + 14) |= 0x4000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)result + 52) = self->_suggestionsWidgetViewed;
  *((_DWORD *)result + 14) |= 0x100000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)result + 45) = self->_appPredictionPanelViewed;
  *((_DWORD *)result + 14) |= 0x2000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)result + 41) = self->_appLibraryViewed;
  *((_DWORD *)result + 14) |= 0x200u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((unsigned char *)result + 51) = self->_suggestionsWidgetTodayPageViewed;
  *((_DWORD *)result + 14) |= 0x80000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((unsigned char *)result + 44) = self->_appPredictionPanelTodayPageViewed;
  *((_DWORD *)result + 14) |= 0x1000u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 8) = self->_numEngagementsInSuggestionsWidgetTodayPage;
  *((_DWORD *)result + 14) |= 0x40u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 4) = self->_numEngagementsInAppPredictionPanelTodayPage;
  *((_DWORD *)result + 14) |= 4u;
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      return result;
    }
    goto LABEL_22;
  }
LABEL_43:
  *((unsigned char *)result + 50) = self->_suggestionsWidgetTodayPageEnabled;
  *((_DWORD *)result + 14) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    return result;
  }
LABEL_22:
  *((unsigned char *)result + 43) = self->_appPredictionPanelTodayPageEnabled;
  *((_DWORD *)result + 14) |= 0x800u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_141;
  }
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  int v6 = *((_DWORD *)v4 + 14);
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_sessionLengthInSeconds != *((_DWORD *)v4 + 9)) {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_numEngagementsInSpotlightApps != *((_DWORD *)v4 + 6)) {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_numEngagementsInSpotlightActions != *((_DWORD *)v4 + 5)) {
      goto LABEL_141;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_numEngagementsInSuggestionsWidget != *((_DWORD *)v4 + 7)) {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_numEngagementsInAppPredictionPanel != *((_DWORD *)v4 + 3)) {
      goto LABEL_141;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_141;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_numEngagementsInAppLibrary != *((_DWORD *)v4 + 2)) {
      goto LABEL_141;
    }
  }
  else if (v6)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0) {
      goto LABEL_141;
    }
    if (self->_spotlightEnabled)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0) {
      goto LABEL_141;
    }
    if (self->_suggestionsWidgetEnabled)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0) {
      goto LABEL_141;
    }
    if (self->_appPredictionPanelEnabled)
    {
      if (!*((unsigned char *)v4 + 42)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 42))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0) {
      goto LABEL_141;
    }
    if (self->_appLibraryEnabled)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0) {
      goto LABEL_141;
    }
    if (self->_spotlightAppsViewed)
    {
      if (!*((unsigned char *)v4 + 47)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 47))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0) {
      goto LABEL_141;
    }
    if (self->_spotlightActionsViewed)
    {
      if (!*((unsigned char *)v4 + 46)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 46))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0) {
      goto LABEL_141;
    }
    if (self->_suggestionsWidgetViewed)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0) {
      goto LABEL_141;
    }
    if (self->_appPredictionPanelViewed)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0) {
      goto LABEL_141;
    }
    if (self->_appLibraryViewed)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0) {
      goto LABEL_141;
    }
    if (self->_suggestionsWidgetTodayPageViewed)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0) {
      goto LABEL_141;
    }
    if (self->_appPredictionPanelTodayPageViewed)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_numEngagementsInSuggestionsWidgetTodayPage != *((_DWORD *)v4 + 8)) {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_141;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_numEngagementsInAppPredictionPanelTodayPage != *((_DWORD *)v4 + 4)) {
      goto LABEL_141;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0) {
      goto LABEL_141;
    }
    if (self->_suggestionsWidgetTodayPageEnabled)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_141;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_141;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_141;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) != 0)
    {
      if (self->_appPredictionPanelTodayPageEnabled)
      {
        if (!*((unsigned char *)v4 + 43)) {
          goto LABEL_141;
        }
      }
      else if (*((unsigned char *)v4 + 43))
      {
        goto LABEL_141;
      }
      BOOL v7 = 1;
      goto LABEL_142;
    }
LABEL_141:
    BOOL v7 = 0;
    goto LABEL_142;
  }
  BOOL v7 = (*((_DWORD *)v4 + 14) & 0x800) == 0;
LABEL_142:

  return v7;
}

- (unint64_t)hash
{
  $DEF734E8A820C4B152ECF3079B765D50 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    uint64_t v3 = 2654435761 * self->_sessionLengthInSeconds;
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_numEngagementsInSpotlightApps;
      if ((*(unsigned char *)&has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_numEngagementsInSpotlightActions;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_numEngagementsInSuggestionsWidget;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_numEngagementsInAppPredictionPanel;
    if (*(unsigned char *)&has) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v7 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_numEngagementsInAppLibrary;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_spotlightEnabled;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_suggestionsWidgetEnabled;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_appPredictionPanelEnabled;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_appLibraryEnabled;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_spotlightAppsViewed;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_spotlightActionsViewed;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_suggestionsWidgetViewed;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_appPredictionPanelViewed;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_appLibraryViewed;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_suggestionsWidgetTodayPageViewed;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_appPredictionPanelTodayPageViewed;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v19 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_19:
    uint64_t v20 = 2654435761 * self->_numEngagementsInSuggestionsWidgetTodayPage;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_20;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_20:
    uint64_t v21 = 2654435761 * self->_numEngagementsInAppPredictionPanelTodayPage;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_21;
    }
LABEL_42:
    uint64_t v22 = 0;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_22;
    }
LABEL_43:
    uint64_t v23 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_41:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_42;
  }
LABEL_21:
  uint64_t v22 = 2654435761 * self->_suggestionsWidgetTodayPageEnabled;
  if ((*(_WORD *)&has & 0x800) == 0) {
    goto LABEL_43;
  }
LABEL_22:
  uint64_t v23 = 2654435761 * self->_appPredictionPanelTodayPageEnabled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x80) != 0)
  {
    self->_sessionLengthInSeconds = *((_DWORD *)v4 + 9);
    *(_DWORD *)&self->_has |= 0x80u;
    int v5 = *((_DWORD *)v4 + 14);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_numEngagementsInSpotlightApps = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_numEngagementsInSpotlightActions = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_numEngagementsInSuggestionsWidget = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_numEngagementsInAppPredictionPanel = *((_DWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_numEngagementsInAppLibrary = *((_DWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x10000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_spotlightEnabled = *((unsigned char *)v4 + 48);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x20000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_suggestionsWidgetEnabled = *((unsigned char *)v4 + 49);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_appPredictionPanelEnabled = *((unsigned char *)v4 + 42);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_appLibraryEnabled = *((unsigned char *)v4 + 40);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x8000) == 0)
  {
LABEL_12:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_spotlightAppsViewed = *((unsigned char *)v4 + 47);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x4000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_spotlightActionsViewed = *((unsigned char *)v4 + 46);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x100000) == 0)
  {
LABEL_14:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_suggestionsWidgetViewed = *((unsigned char *)v4 + 52);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x2000) == 0)
  {
LABEL_15:
    if ((v5 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_appPredictionPanelViewed = *((unsigned char *)v4 + 45);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x200) == 0)
  {
LABEL_16:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_appLibraryViewed = *((unsigned char *)v4 + 41);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x80000) == 0)
  {
LABEL_17:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_suggestionsWidgetTodayPageViewed = *((unsigned char *)v4 + 51);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x1000) == 0)
  {
LABEL_18:
    if ((v5 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_appPredictionPanelTodayPageViewed = *((unsigned char *)v4 + 44);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x40) == 0)
  {
LABEL_19:
    if ((v5 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_numEngagementsInSuggestionsWidgetTodayPage = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 4) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_numEngagementsInAppPredictionPanelTodayPage = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 14);
  if ((v5 & 0x40000) == 0)
  {
LABEL_21:
    if ((v5 & 0x800) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_45:
  self->_suggestionsWidgetTodayPageEnabled = *((unsigned char *)v4 + 50);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)v4 + 14) & 0x800) != 0)
  {
LABEL_22:
    self->_appPredictionPanelTodayPageEnabled = *((unsigned char *)v4 + 43);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_23:
}

- (unsigned)sessionLengthInSeconds
{
  return self->_sessionLengthInSeconds;
}

- (unsigned)numEngagementsInSpotlightApps
{
  return self->_numEngagementsInSpotlightApps;
}

- (unsigned)numEngagementsInSpotlightActions
{
  return self->_numEngagementsInSpotlightActions;
}

- (unsigned)numEngagementsInSuggestionsWidget
{
  return self->_numEngagementsInSuggestionsWidget;
}

- (unsigned)numEngagementsInAppPredictionPanel
{
  return self->_numEngagementsInAppPredictionPanel;
}

- (unsigned)numEngagementsInAppLibrary
{
  return self->_numEngagementsInAppLibrary;
}

- (BOOL)spotlightEnabled
{
  return self->_spotlightEnabled;
}

- (BOOL)suggestionsWidgetEnabled
{
  return self->_suggestionsWidgetEnabled;
}

- (BOOL)appPredictionPanelEnabled
{
  return self->_appPredictionPanelEnabled;
}

- (BOOL)appLibraryEnabled
{
  return self->_appLibraryEnabled;
}

- (BOOL)spotlightAppsViewed
{
  return self->_spotlightAppsViewed;
}

- (BOOL)spotlightActionsViewed
{
  return self->_spotlightActionsViewed;
}

- (BOOL)suggestionsWidgetViewed
{
  return self->_suggestionsWidgetViewed;
}

- (BOOL)appPredictionPanelViewed
{
  return self->_appPredictionPanelViewed;
}

- (BOOL)appLibraryViewed
{
  return self->_appLibraryViewed;
}

- (BOOL)suggestionsWidgetTodayPageViewed
{
  return self->_suggestionsWidgetTodayPageViewed;
}

- (BOOL)appPredictionPanelTodayPageViewed
{
  return self->_appPredictionPanelTodayPageViewed;
}

- (unsigned)numEngagementsInSuggestionsWidgetTodayPage
{
  return self->_numEngagementsInSuggestionsWidgetTodayPage;
}

- (unsigned)numEngagementsInAppPredictionPanelTodayPage
{
  return self->_numEngagementsInAppPredictionPanelTodayPage;
}

- (BOOL)suggestionsWidgetTodayPageEnabled
{
  return self->_suggestionsWidgetTodayPageEnabled;
}

- (BOOL)appPredictionPanelTodayPageEnabled
{
  return self->_appPredictionPanelTodayPageEnabled;
}

@end