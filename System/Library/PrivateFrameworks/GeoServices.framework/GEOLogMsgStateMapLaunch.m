@interface GEOLogMsgStateMapLaunch
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsHandoff;
- (BOOL)hasLaunchAction;
- (BOOL)hasLaunchActionInternal;
- (BOOL)hasLaunchUri;
- (BOOL)hasReferringWebsite;
- (BOOL)hasSourceAppId;
- (BOOL)hasSourceHandoffDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHandoff;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateMapLaunch)init;
- (GEOLogMsgStateMapLaunch)initWithData:(id)a3;
- (GEOLogMsgStateMapLaunch)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapLaunch)initWithJSON:(id)a3;
- (NSString)launchUri;
- (NSString)referringWebsite;
- (NSString)sourceAppId;
- (NSString)sourceHandoffDevice;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)launchActionAsString:(int)a3;
- (id)launchActionInternalAsString:(int)a3;
- (int)StringAsLaunchAction:(id)a3;
- (int)StringAsLaunchActionInternal:(id)a3;
- (int)launchAction;
- (int)launchActionInternal;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLaunchUri;
- (void)_readReferringWebsite;
- (void)_readSourceAppId;
- (void)_readSourceHandoffDevice;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIsHandoff:(BOOL)a3;
- (void)setHasLaunchAction:(BOOL)a3;
- (void)setHasLaunchActionInternal:(BOOL)a3;
- (void)setIsHandoff:(BOOL)a3;
- (void)setLaunchAction:(int)a3;
- (void)setLaunchActionInternal:(int)a3;
- (void)setLaunchUri:(id)a3;
- (void)setReferringWebsite:(id)a3;
- (void)setSourceAppId:(id)a3;
- (void)setSourceHandoffDevice:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapLaunch

- (GEOLogMsgStateMapLaunch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateMapLaunch;
  v2 = [(GEOLogMsgStateMapLaunch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateMapLaunch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateMapLaunch;
  v3 = [(GEOLogMsgStateMapLaunch *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSourceAppId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateMapLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceAppId_tags_7521);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSourceAppId
{
  return self->_sourceAppId != 0;
}

- (NSString)sourceAppId
{
  -[GEOLogMsgStateMapLaunch _readSourceAppId]((uint64_t)self);
  sourceAppId = self->_sourceAppId;

  return sourceAppId;
}

- (void)setSourceAppId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_sourceAppId, a3);
}

- (void)_readLaunchUri
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateMapLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLaunchUri_tags_7522);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLaunchUri
{
  return self->_launchUri != 0;
}

- (NSString)launchUri
{
  -[GEOLogMsgStateMapLaunch _readLaunchUri]((uint64_t)self);
  launchUri = self->_launchUri;

  return launchUri;
}

- (void)setLaunchUri:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_launchUri, a3);
}

- (void)_readReferringWebsite
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateMapLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readReferringWebsite_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasReferringWebsite
{
  return self->_referringWebsite != 0;
}

- (NSString)referringWebsite
{
  -[GEOLogMsgStateMapLaunch _readReferringWebsite]((uint64_t)self);
  referringWebsite = self->_referringWebsite;

  return referringWebsite;
}

- (void)setReferringWebsite:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_referringWebsite, a3);
}

- (BOOL)isHandoff
{
  return self->_isHandoff;
}

- (void)setIsHandoff:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  self->_isHandoff = a3;
}

- (void)setHasIsHandoff:(BOOL)a3
{
  if (a3) {
    char v3 = -124;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsHandoff
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void)_readSourceHandoffDevice
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 72) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateMapLaunchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceHandoffDevice_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSourceHandoffDevice
{
  return self->_sourceHandoffDevice != 0;
}

- (NSString)sourceHandoffDevice
{
  -[GEOLogMsgStateMapLaunch _readSourceHandoffDevice]((uint64_t)self);
  sourceHandoffDevice = self->_sourceHandoffDevice;

  return sourceHandoffDevice;
}

- (void)setSourceHandoffDevice:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_sourceHandoffDevice, a3);
}

- (int)launchAction
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_launchAction;
  }
  else {
    return 0;
  }
}

- (void)setLaunchAction:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_launchAction = a3;
}

- (void)setHasLaunchAction:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLaunchAction
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)launchActionAsString:(int)a3
{
  if (a3 >= 0x2A)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F7E60[a3];
  }

  return v3;
}

- (int)StringAsLaunchAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MapLaunchAction_Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowLPROnboardingAction"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowCarDestinationsAction"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_SharedTripAction"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowCollectionAction"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_BrandAction"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_DirectionAction"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_DisplayModeNavAction"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ErrorAction"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ForwardGeocodeAction"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_LowFuelAction"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_MarkUserLocationAction"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_NotificationRestorationAction"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_OpenLookAroundAction"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PlaceRefinementAction"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentAnnouncementAction"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentFlyoverAction"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentNavShareETAAction"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentNearbySearchAction"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentParkedCarAction"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentRAPAction"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentPhotoThumbnailGalleryAction"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentTableBookingAction"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_RefineMapItemAction"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ResetAction"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ResolveMUIDAction"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_RestorationAction"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ReverseGeocodeAction"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_SearchAction"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_SearchSelectionAction"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShareUserLocationAction"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowKeyboardAction"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowSearchInfoAction"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ZoomMapAction"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowCuratedCollectionAction"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowPublisherAction"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_NewWindowAction"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowAllCuratedCollectionsAction"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ReportIncidentAction"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_URLRestorationAction"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_SiriRestorationAction"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_Showcase"])
  {
    int v4 = 41;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)launchActionInternal
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_launchActionInternal;
  }
  else {
    return 0;
  }
}

- (void)setLaunchActionInternal:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_launchActionInternal = a3;
}

- (void)setHasLaunchActionInternal:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasLaunchActionInternal
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)launchActionInternalAsString:(int)a3
{
  if (a3 >= 0x2A)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F7E60[a3];
  }

  return v3;
}

- (int)StringAsLaunchActionInternal:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MapLaunchAction_Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowLPROnboardingAction"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowCarDestinationsAction"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_SharedTripAction"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowCollectionAction"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_BrandAction"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_DirectionAction"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_DisplayModeNavAction"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ErrorAction"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ForwardGeocodeAction"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_LowFuelAction"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_MarkUserLocationAction"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_NotificationRestorationAction"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_OpenLookAroundAction"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PlaceRefinementAction"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentAnnouncementAction"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentFlyoverAction"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentNavShareETAAction"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentNearbySearchAction"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentParkedCarAction"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentRAPAction"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentPhotoThumbnailGalleryAction"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_PresentTableBookingAction"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_RefineMapItemAction"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ResetAction"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ResolveMUIDAction"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_RestorationAction"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ReverseGeocodeAction"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_SearchAction"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_SearchSelectionAction"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShareUserLocationAction"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowKeyboardAction"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowSearchInfoAction"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ZoomMapAction"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowCuratedCollectionAction"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowPublisherAction"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_NewWindowAction"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ShowAllCuratedCollectionsAction"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_ReportIncidentAction"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_URLRestorationAction"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_SiriRestorationAction"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"MapLaunchAction_Showcase"])
  {
    int v4 = 41;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapLaunch;
  int v4 = [(GEOLogMsgStateMapLaunch *)&v8 description];
  v5 = [(GEOLogMsgStateMapLaunch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapLaunch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 sourceAppId];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"sourceAppId";
      }
      else {
        objc_super v6 = @"source_app_id";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [(id)a1 launchUri];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"launchUri";
      }
      else {
        objc_super v8 = @"launch_uri";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 referringWebsite];
    if (v9)
    {
      if (a2) {
        v10 = @"referringWebsite";
      }
      else {
        v10 = @"referring_website";
      }
      [v4 setObject:v9 forKey:v10];
    }

    if ((*(unsigned char *)(a1 + 72) & 4) != 0)
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
      if (a2) {
        v12 = @"isHandoff";
      }
      else {
        v12 = @"is_handoff";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = [(id)a1 sourceHandoffDevice];
    if (v13)
    {
      if (a2) {
        v14 = @"sourceHandoffDevice";
      }
      else {
        v14 = @"source_handoff_device";
      }
      [v4 setObject:v13 forKey:v14];
    }

    char v15 = *(unsigned char *)(a1 + 72);
    if ((v15 & 2) != 0)
    {
      uint64_t v16 = *(int *)(a1 + 64);
      if (v16 >= 0x2A)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_1E53F7E60[v16];
      }
      if (a2) {
        v18 = @"launchAction";
      }
      else {
        v18 = @"launch_action";
      }
      [v4 setObject:v17 forKey:v18];

      char v15 = *(unsigned char *)(a1 + 72);
    }
    if (v15)
    {
      uint64_t v19 = *(int *)(a1 + 60);
      if (v19 >= 0x2A)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = off_1E53F7E60[v19];
      }
      if (a2) {
        v21 = @"launchActionInternal";
      }
      else {
        v21 = @"launch_action_internal";
      }
      [v4 setObject:v20 forKey:v21];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapLaunch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapLaunch)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapLaunch *)-[GEOLogMsgStateMapLaunch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"sourceAppId";
      }
      else {
        objc_super v6 = @"source_app_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setSourceAppId:v8];
      }
      if (a3) {
        v9 = @"launchUri";
      }
      else {
        v9 = @"launch_uri";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setLaunchUri:v11];
      }
      if (a3) {
        v12 = @"referringWebsite";
      }
      else {
        v12 = @"referring_website";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setReferringWebsite:v14];
      }
      if (a3) {
        char v15 = @"isHandoff";
      }
      else {
        char v15 = @"is_handoff";
      }
      uint64_t v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsHandoff:", objc_msgSend(v16, "BOOLValue"));
      }

      if (a3) {
        v17 = @"sourceHandoffDevice";
      }
      else {
        v17 = @"source_handoff_device";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v19 = (void *)[v18 copy];
        [a1 setSourceHandoffDevice:v19];
      }
      if (a3) {
        v20 = @"launchAction";
      }
      else {
        v20 = @"launch_action";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v21;
        if ([v22 isEqualToString:@"MapLaunchAction_Unknown"])
        {
          uint64_t v23 = 0;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShowLPROnboardingAction"])
        {
          uint64_t v23 = 1;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShowCarDestinationsAction"])
        {
          uint64_t v23 = 2;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_SharedTripAction"])
        {
          uint64_t v23 = 3;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShowCollectionAction"])
        {
          uint64_t v23 = 4;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_BrandAction"])
        {
          uint64_t v23 = 5;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_DirectionAction"])
        {
          uint64_t v23 = 6;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_DisplayModeNavAction"])
        {
          uint64_t v23 = 7;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ErrorAction"])
        {
          uint64_t v23 = 8;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ForwardGeocodeAction"])
        {
          uint64_t v23 = 9;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_LowFuelAction"])
        {
          uint64_t v23 = 10;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_MarkUserLocationAction"])
        {
          uint64_t v23 = 11;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_NotificationRestorationAction"])
        {
          uint64_t v23 = 12;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_OpenLookAroundAction"])
        {
          uint64_t v23 = 13;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PlaceRefinementAction"])
        {
          uint64_t v23 = 14;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PresentAnnouncementAction"])
        {
          uint64_t v23 = 15;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PresentFlyoverAction"])
        {
          uint64_t v23 = 16;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PresentNavShareETAAction"])
        {
          uint64_t v23 = 17;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PresentNearbySearchAction"])
        {
          uint64_t v23 = 18;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PresentParkedCarAction"])
        {
          uint64_t v23 = 19;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PresentRAPAction"])
        {
          uint64_t v23 = 20;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PresentPhotoThumbnailGalleryAction"])
        {
          uint64_t v23 = 21;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_PresentTableBookingAction"])
        {
          uint64_t v23 = 22;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_RefineMapItemAction"])
        {
          uint64_t v23 = 23;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ResetAction"])
        {
          uint64_t v23 = 24;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ResolveMUIDAction"])
        {
          uint64_t v23 = 25;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_RestorationAction"])
        {
          uint64_t v23 = 26;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ReverseGeocodeAction"])
        {
          uint64_t v23 = 27;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_SearchAction"])
        {
          uint64_t v23 = 28;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_SearchSelectionAction"])
        {
          uint64_t v23 = 29;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShareUserLocationAction"])
        {
          uint64_t v23 = 30;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShowKeyboardAction"])
        {
          uint64_t v23 = 31;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShowSearchInfoAction"])
        {
          uint64_t v23 = 32;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ZoomMapAction"])
        {
          uint64_t v23 = 33;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShowCuratedCollectionAction"])
        {
          uint64_t v23 = 34;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShowPublisherAction"])
        {
          uint64_t v23 = 35;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_NewWindowAction"])
        {
          uint64_t v23 = 36;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ShowAllCuratedCollectionsAction"])
        {
          uint64_t v23 = 37;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_ReportIncidentAction"])
        {
          uint64_t v23 = 38;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_URLRestorationAction"])
        {
          uint64_t v23 = 39;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_SiriRestorationAction"])
        {
          uint64_t v23 = 40;
        }
        else if ([v22 isEqualToString:@"MapLaunchAction_Showcase"])
        {
          uint64_t v23 = 41;
        }
        else
        {
          uint64_t v23 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_121;
        }
        uint64_t v23 = [v21 intValue];
      }
      [a1 setLaunchAction:v23];
LABEL_121:

      if (a3) {
        v24 = @"launchActionInternal";
      }
      else {
        v24 = @"launch_action_internal";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v25;
        if ([v26 isEqualToString:@"MapLaunchAction_Unknown"])
        {
          uint64_t v27 = 0;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShowLPROnboardingAction"])
        {
          uint64_t v27 = 1;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShowCarDestinationsAction"])
        {
          uint64_t v27 = 2;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_SharedTripAction"])
        {
          uint64_t v27 = 3;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShowCollectionAction"])
        {
          uint64_t v27 = 4;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_BrandAction"])
        {
          uint64_t v27 = 5;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_DirectionAction"])
        {
          uint64_t v27 = 6;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_DisplayModeNavAction"])
        {
          uint64_t v27 = 7;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ErrorAction"])
        {
          uint64_t v27 = 8;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ForwardGeocodeAction"])
        {
          uint64_t v27 = 9;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_LowFuelAction"])
        {
          uint64_t v27 = 10;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_MarkUserLocationAction"])
        {
          uint64_t v27 = 11;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_NotificationRestorationAction"])
        {
          uint64_t v27 = 12;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_OpenLookAroundAction"])
        {
          uint64_t v27 = 13;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PlaceRefinementAction"])
        {
          uint64_t v27 = 14;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PresentAnnouncementAction"])
        {
          uint64_t v27 = 15;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PresentFlyoverAction"])
        {
          uint64_t v27 = 16;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PresentNavShareETAAction"])
        {
          uint64_t v27 = 17;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PresentNearbySearchAction"])
        {
          uint64_t v27 = 18;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PresentParkedCarAction"])
        {
          uint64_t v27 = 19;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PresentRAPAction"])
        {
          uint64_t v27 = 20;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PresentPhotoThumbnailGalleryAction"])
        {
          uint64_t v27 = 21;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_PresentTableBookingAction"])
        {
          uint64_t v27 = 22;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_RefineMapItemAction"])
        {
          uint64_t v27 = 23;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ResetAction"])
        {
          uint64_t v27 = 24;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ResolveMUIDAction"])
        {
          uint64_t v27 = 25;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_RestorationAction"])
        {
          uint64_t v27 = 26;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ReverseGeocodeAction"])
        {
          uint64_t v27 = 27;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_SearchAction"])
        {
          uint64_t v27 = 28;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_SearchSelectionAction"])
        {
          uint64_t v27 = 29;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShareUserLocationAction"])
        {
          uint64_t v27 = 30;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShowKeyboardAction"])
        {
          uint64_t v27 = 31;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShowSearchInfoAction"])
        {
          uint64_t v27 = 32;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ZoomMapAction"])
        {
          uint64_t v27 = 33;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShowCuratedCollectionAction"])
        {
          uint64_t v27 = 34;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShowPublisherAction"])
        {
          uint64_t v27 = 35;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_NewWindowAction"])
        {
          uint64_t v27 = 36;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ShowAllCuratedCollectionsAction"])
        {
          uint64_t v27 = 37;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_ReportIncidentAction"])
        {
          uint64_t v27 = 38;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_URLRestorationAction"])
        {
          uint64_t v27 = 39;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_SiriRestorationAction"])
        {
          uint64_t v27 = 40;
        }
        else if ([v26 isEqualToString:@"MapLaunchAction_Showcase"])
        {
          uint64_t v27 = 41;
        }
        else
        {
          uint64_t v27 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_214:

          goto LABEL_215;
        }
        uint64_t v27 = [v25 intValue];
      }
      [a1 setLaunchActionInternal:v27];
      goto LABEL_214;
    }
  }
LABEL_215:

  return a1;
}

- (GEOLogMsgStateMapLaunch)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapLaunch *)-[GEOLogMsgStateMapLaunch _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_7553;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_7554;
    }
    GEOLogMsgStateMapLaunchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapLaunchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapLaunchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 7u))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgStateMapLaunch *)self readAll:0];
    if (self->_sourceAppId) {
      PBDataWriterWriteStringField();
    }
    if (self->_launchUri) {
      PBDataWriterWriteStringField();
    }
    if (self->_referringWebsite) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_sourceHandoffDevice) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteInt32Field();
    }
  }
}

- (void)copyTo:(id)a3
{
  objc_super v6 = (id *)a3;
  [(GEOLogMsgStateMapLaunch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_sourceAppId) {
    objc_msgSend(v6, "setSourceAppId:");
  }
  if (self->_launchUri) {
    objc_msgSend(v6, "setLaunchUri:");
  }
  int v4 = v6;
  if (self->_referringWebsite)
  {
    objc_msgSend(v6, "setReferringWebsite:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *((unsigned char *)v4 + 68) = self->_isHandoff;
    *((unsigned char *)v4 + 72) |= 4u;
  }
  if (self->_sourceHandoffDevice)
  {
    objc_msgSend(v6, "setSourceHandoffDevice:");
    int v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_launchAction;
    *((unsigned char *)v4 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v4 + 15) = self->_launchActionInternal;
    *((unsigned char *)v4 + 72) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLogMsgStateMapLaunchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgStateMapLaunch *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_sourceAppId copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_launchUri copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  uint64_t v13 = [(NSString *)self->_referringWebsite copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 68) = self->_isHandoff;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  uint64_t v15 = [(NSString *)self->_sourceHandoffDevice copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_launchAction;
    *(unsigned char *)(v5 + 72) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 60) = self->_launchActionInternal;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  [(GEOLogMsgStateMapLaunch *)self readAll:1];
  [v4 readAll:1];
  sourceAppId = self->_sourceAppId;
  if ((unint64_t)sourceAppId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceAppId, "isEqual:")) {
      goto LABEL_28;
    }
  }
  launchUri = self->_launchUri;
  if ((unint64_t)launchUri | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](launchUri, "isEqual:")) {
      goto LABEL_28;
    }
  }
  referringWebsite = self->_referringWebsite;
  if ((unint64_t)referringWebsite | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](referringWebsite, "isEqual:")) {
      goto LABEL_28;
    }
  }
  char flags = (char)self->_flags;
  char v9 = *((unsigned char *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0) {
      goto LABEL_28;
    }
    if (self->_isHandoff)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_28;
  }
  sourceHandoffDevice = self->_sourceHandoffDevice;
  if (!((unint64_t)sourceHandoffDevice | *((void *)v4 + 5))) {
    goto LABEL_19;
  }
  if (!-[NSString isEqual:](sourceHandoffDevice, "isEqual:"))
  {
LABEL_28:
    BOOL v11 = 0;
    goto LABEL_29;
  }
  char flags = (char)self->_flags;
  char v9 = *((unsigned char *)v4 + 72);
LABEL_19:
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_launchAction != *((_DWORD *)v4 + 16)) {
      goto LABEL_28;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_28;
  }
  BOOL v11 = (v9 & 1) == 0;
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_launchActionInternal != *((_DWORD *)v4 + 15)) {
      goto LABEL_28;
    }
    BOOL v11 = 1;
  }
LABEL_29:

  return v11;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMapLaunch *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_sourceAppId hash];
  NSUInteger v4 = [(NSString *)self->_launchUri hash];
  NSUInteger v5 = [(NSString *)self->_referringWebsite hash];
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_isHandoff;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_sourceHandoffDevice hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_launchAction;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_launchActionInternal;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v6 = a3;
  [v6 readAll:0];
  NSUInteger v4 = v6;
  if (v6[4])
  {
    -[GEOLogMsgStateMapLaunch setSourceAppId:](self, "setSourceAppId:");
    NSUInteger v4 = v6;
  }
  if (v4[2])
  {
    -[GEOLogMsgStateMapLaunch setLaunchUri:](self, "setLaunchUri:");
    NSUInteger v4 = v6;
  }
  if (v4[3])
  {
    -[GEOLogMsgStateMapLaunch setReferringWebsite:](self, "setReferringWebsite:");
    NSUInteger v4 = v6;
  }
  if ((v4[9] & 4) != 0)
  {
    self->_isHandoff = *((unsigned char *)v4 + 68);
    *(unsigned char *)&self->_flags |= 4u;
  }
  if (v4[5])
  {
    -[GEOLogMsgStateMapLaunch setSourceHandoffDevice:](self, "setSourceHandoffDevice:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_launchAction = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 72);
  }
  if (v5)
  {
    self->_launchActionInternal = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceHandoffDevice, 0);
  objc_storeStrong((id *)&self->_sourceAppId, 0);
  objc_storeStrong((id *)&self->_referringWebsite, 0);
  objc_storeStrong((id *)&self->_launchUri, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end