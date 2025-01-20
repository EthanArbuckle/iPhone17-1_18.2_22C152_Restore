@interface GEOTrafficBannerText
+ (BOOL)isValid:(id)a3;
+ (Class)buttonType;
+ (Class)localizedIncidentBannerType;
+ (Class)localizedIncidentSpokenTextType;
+ (Class)localizedIncidentSubBannerType;
- (BOOL)defaultToNewRoute;
- (BOOL)disableFasterRerouteByDefault;
- (BOOL)hasAlertDurationSeconds;
- (BOOL)hasAnalyticsMessageValue;
- (BOOL)hasArtworkOverride;
- (BOOL)hasBannerDescription;
- (BOOL)hasBannerId;
- (BOOL)hasBannerLargeText;
- (BOOL)hasBannerSmallText;
- (BOOL)hasBannerStyle;
- (BOOL)hasCameraInput;
- (BOOL)hasDefaultButtonIndex;
- (BOOL)hasDefaultToNewRoute;
- (BOOL)hasDisableFasterRerouteByDefault;
- (BOOL)hasEventInfo;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasHideAtDistance;
- (BOOL)hasIncidentDistance;
- (BOOL)hasIncidentIndex;
- (BOOL)hasMinDisplayTime;
- (BOOL)hasOverlapDelayTime;
- (BOOL)hasPreserveBannerInUpdates;
- (BOOL)hasPreviousBannerChange;
- (BOOL)hasPriority;
- (BOOL)hasProgressBarRange;
- (BOOL)hasSecondsSaved;
- (BOOL)hasShouldShowTimer;
- (BOOL)hasShowAtDistance;
- (BOOL)hasSpokenPrompt;
- (BOOL)hasTriggerRange;
- (BOOL)hasZilchPathIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)preserveBannerInUpdates;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldShowTimer;
- (GEOCameraInput)cameraInput;
- (GEOFormattedString)bannerDescription;
- (GEOFormattedString)bannerLargeText;
- (GEOFormattedString)bannerSmallText;
- (GEOFormattedString)spokenPrompt;
- (GEOPBTransitArtwork)artworkOverride;
- (GEOTrafficBannerText)init;
- (GEOTrafficBannerText)initWithData:(id)a3;
- (GEOTrafficBannerText)initWithDictionary:(id)a3;
- (GEOTrafficBannerText)initWithJSON:(id)a3;
- (GEOTriggerPointRange)progressBarRange;
- (GEOTriggerPointRange)triggerRange;
- (NSData)eventInfo;
- (NSMutableArray)buttons;
- (NSMutableArray)localizedIncidentBanners;
- (NSMutableArray)localizedIncidentSpokenTexts;
- (NSMutableArray)localizedIncidentSubBanners;
- (NSString)analyticsMessageValue;
- (NSString)bannerId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)bannerStyleAsString:(int)a3;
- (id)buttonAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedIncidentBannerAtIndex:(unint64_t)a3;
- (id)localizedIncidentSpokenTextAtIndex:(unint64_t)a3;
- (id)localizedIncidentSubBannerAtIndex:(unint64_t)a3;
- (id)previousBannerChangeAsString:(int)a3;
- (int)StringAsBannerStyle:(id)a3;
- (int)StringAsPreviousBannerChange:(id)a3;
- (int)bannerStyle;
- (int)defaultButtonIndex;
- (int)previousBannerChange;
- (unint64_t)buttonsCount;
- (unint64_t)hash;
- (unint64_t)localizedIncidentBannersCount;
- (unint64_t)localizedIncidentSpokenTextsCount;
- (unint64_t)localizedIncidentSubBannersCount;
- (unsigned)alertDurationSeconds;
- (unsigned)hideAtDistance;
- (unsigned)incidentDistance;
- (unsigned)incidentIndex;
- (unsigned)minDisplayTime;
- (unsigned)overlapDelayTime;
- (unsigned)priority;
- (unsigned)secondsSaved;
- (unsigned)showAtDistance;
- (unsigned)zilchPathIndex;
- (void)_addNoFlagsButton:(uint64_t)a1;
- (void)_addNoFlagsLocalizedIncidentBanner:(uint64_t)a1;
- (void)_addNoFlagsLocalizedIncidentSpokenText:(uint64_t)a1;
- (void)_addNoFlagsLocalizedIncidentSubBanner:(uint64_t)a1;
- (void)_readAnalyticsMessageValue;
- (void)_readArtworkOverride;
- (void)_readBannerDescription;
- (void)_readBannerId;
- (void)_readBannerLargeText;
- (void)_readBannerSmallText;
- (void)_readButtons;
- (void)_readCameraInput;
- (void)_readEventInfo;
- (void)_readLocalizedIncidentBanners;
- (void)_readLocalizedIncidentSpokenTexts;
- (void)_readLocalizedIncidentSubBanners;
- (void)_readProgressBarRange;
- (void)_readSpokenPrompt;
- (void)_readTriggerRange;
- (void)addButton:(id)a3;
- (void)addLocalizedIncidentBanner:(id)a3;
- (void)addLocalizedIncidentSpokenText:(id)a3;
- (void)addLocalizedIncidentSubBanner:(id)a3;
- (void)clearButtons;
- (void)clearLocalizedIncidentBanners;
- (void)clearLocalizedIncidentSpokenTexts;
- (void)clearLocalizedIncidentSubBanners;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlertDurationSeconds:(unsigned int)a3;
- (void)setAnalyticsMessageValue:(id)a3;
- (void)setArtworkOverride:(id)a3;
- (void)setBannerDescription:(id)a3;
- (void)setBannerId:(id)a3;
- (void)setBannerLargeText:(id)a3;
- (void)setBannerSmallText:(id)a3;
- (void)setBannerStyle:(int)a3;
- (void)setButtons:(id)a3;
- (void)setCameraInput:(id)a3;
- (void)setDefaultButtonIndex:(int)a3;
- (void)setDefaultToNewRoute:(BOOL)a3;
- (void)setDisableFasterRerouteByDefault:(BOOL)a3;
- (void)setEventInfo:(id)a3;
- (void)setHasAlertDurationSeconds:(BOOL)a3;
- (void)setHasBannerStyle:(BOOL)a3;
- (void)setHasDefaultButtonIndex:(BOOL)a3;
- (void)setHasDefaultToNewRoute:(BOOL)a3;
- (void)setHasDisableFasterRerouteByDefault:(BOOL)a3;
- (void)setHasHideAtDistance:(BOOL)a3;
- (void)setHasIncidentDistance:(BOOL)a3;
- (void)setHasIncidentIndex:(BOOL)a3;
- (void)setHasMinDisplayTime:(BOOL)a3;
- (void)setHasOverlapDelayTime:(BOOL)a3;
- (void)setHasPreserveBannerInUpdates:(BOOL)a3;
- (void)setHasPreviousBannerChange:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasSecondsSaved:(BOOL)a3;
- (void)setHasShouldShowTimer:(BOOL)a3;
- (void)setHasShowAtDistance:(BOOL)a3;
- (void)setHasZilchPathIndex:(BOOL)a3;
- (void)setHideAtDistance:(unsigned int)a3;
- (void)setIncidentDistance:(unsigned int)a3;
- (void)setIncidentIndex:(unsigned int)a3;
- (void)setLocalizedIncidentBanners:(id)a3;
- (void)setLocalizedIncidentSpokenTexts:(id)a3;
- (void)setLocalizedIncidentSubBanners:(id)a3;
- (void)setMinDisplayTime:(unsigned int)a3;
- (void)setOverlapDelayTime:(unsigned int)a3;
- (void)setPreserveBannerInUpdates:(BOOL)a3;
- (void)setPreviousBannerChange:(int)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setProgressBarRange:(id)a3;
- (void)setSecondsSaved:(unsigned int)a3;
- (void)setShouldShowTimer:(BOOL)a3;
- (void)setShowAtDistance:(unsigned int)a3;
- (void)setSpokenPrompt:(id)a3;
- (void)setTriggerRange:(id)a3;
- (void)setZilchPathIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTrafficBannerText

- (GEOTrafficBannerText)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTrafficBannerText;
  v2 = [(GEOTrafficBannerText *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTrafficBannerText)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTrafficBannerText;
  v3 = [(GEOTrafficBannerText *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocalizedIncidentBanners
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 215) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedIncidentBanners_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)localizedIncidentBanners
{
  -[GEOTrafficBannerText _readLocalizedIncidentBanners]((uint64_t)self);
  localizedIncidentBanners = self->_localizedIncidentBanners;

  return localizedIncidentBanners;
}

- (void)setLocalizedIncidentBanners:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  localizedIncidentBanners = self->_localizedIncidentBanners;
  self->_localizedIncidentBanners = v4;
}

- (void)clearLocalizedIncidentBanners
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  localizedIncidentBanners = self->_localizedIncidentBanners;

  [(NSMutableArray *)localizedIncidentBanners removeAllObjects];
}

- (void)addLocalizedIncidentBanner:(id)a3
{
  id v4 = a3;
  -[GEOTrafficBannerText _readLocalizedIncidentBanners]((uint64_t)self);
  -[GEOTrafficBannerText _addNoFlagsLocalizedIncidentBanner:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsLocalizedIncidentBanner:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 96);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      id v4 = *(void **)(a1 + 96);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)localizedIncidentBannersCount
{
  -[GEOTrafficBannerText _readLocalizedIncidentBanners]((uint64_t)self);
  localizedIncidentBanners = self->_localizedIncidentBanners;

  return [(NSMutableArray *)localizedIncidentBanners count];
}

- (id)localizedIncidentBannerAtIndex:(unint64_t)a3
{
  -[GEOTrafficBannerText _readLocalizedIncidentBanners]((uint64_t)self);
  localizedIncidentBanners = self->_localizedIncidentBanners;

  return (id)[(NSMutableArray *)localizedIncidentBanners objectAtIndex:a3];
}

+ (Class)localizedIncidentBannerType
{
  return (Class)objc_opt_class();
}

- (void)_readLocalizedIncidentSubBanners
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 215) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedIncidentSubBanners_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)localizedIncidentSubBanners
{
  -[GEOTrafficBannerText _readLocalizedIncidentSubBanners]((uint64_t)self);
  localizedIncidentSubBanners = self->_localizedIncidentSubBanners;

  return localizedIncidentSubBanners;
}

- (void)setLocalizedIncidentSubBanners:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  localizedIncidentSubBanners = self->_localizedIncidentSubBanners;
  self->_localizedIncidentSubBanners = v4;
}

- (void)clearLocalizedIncidentSubBanners
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  localizedIncidentSubBanners = self->_localizedIncidentSubBanners;

  [(NSMutableArray *)localizedIncidentSubBanners removeAllObjects];
}

- (void)addLocalizedIncidentSubBanner:(id)a3
{
  id v4 = a3;
  -[GEOTrafficBannerText _readLocalizedIncidentSubBanners]((uint64_t)self);
  -[GEOTrafficBannerText _addNoFlagsLocalizedIncidentSubBanner:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsLocalizedIncidentSubBanner:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 112);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v5;

      id v4 = *(void **)(a1 + 112);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)localizedIncidentSubBannersCount
{
  -[GEOTrafficBannerText _readLocalizedIncidentSubBanners]((uint64_t)self);
  localizedIncidentSubBanners = self->_localizedIncidentSubBanners;

  return [(NSMutableArray *)localizedIncidentSubBanners count];
}

- (id)localizedIncidentSubBannerAtIndex:(unint64_t)a3
{
  -[GEOTrafficBannerText _readLocalizedIncidentSubBanners]((uint64_t)self);
  localizedIncidentSubBanners = self->_localizedIncidentSubBanners;

  return (id)[(NSMutableArray *)localizedIncidentSubBanners objectAtIndex:a3];
}

+ (Class)localizedIncidentSubBannerType
{
  return (Class)objc_opt_class();
}

- (void)_readLocalizedIncidentSpokenTexts
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 215) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedIncidentSpokenTexts_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)localizedIncidentSpokenTexts
{
  -[GEOTrafficBannerText _readLocalizedIncidentSpokenTexts]((uint64_t)self);
  localizedIncidentSpokenTexts = self->_localizedIncidentSpokenTexts;

  return localizedIncidentSpokenTexts;
}

- (void)setLocalizedIncidentSpokenTexts:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  localizedIncidentSpokenTexts = self->_localizedIncidentSpokenTexts;
  self->_localizedIncidentSpokenTexts = v4;
}

- (void)clearLocalizedIncidentSpokenTexts
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  localizedIncidentSpokenTexts = self->_localizedIncidentSpokenTexts;

  [(NSMutableArray *)localizedIncidentSpokenTexts removeAllObjects];
}

- (void)addLocalizedIncidentSpokenText:(id)a3
{
  id v4 = a3;
  -[GEOTrafficBannerText _readLocalizedIncidentSpokenTexts]((uint64_t)self);
  -[GEOTrafficBannerText _addNoFlagsLocalizedIncidentSpokenText:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x10000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsLocalizedIncidentSpokenText:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      id v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)localizedIncidentSpokenTextsCount
{
  -[GEOTrafficBannerText _readLocalizedIncidentSpokenTexts]((uint64_t)self);
  localizedIncidentSpokenTexts = self->_localizedIncidentSpokenTexts;

  return [(NSMutableArray *)localizedIncidentSpokenTexts count];
}

- (id)localizedIncidentSpokenTextAtIndex:(unint64_t)a3
{
  -[GEOTrafficBannerText _readLocalizedIncidentSpokenTexts]((uint64_t)self);
  localizedIncidentSpokenTexts = self->_localizedIncidentSpokenTexts;

  return (id)[(NSMutableArray *)localizedIncidentSpokenTexts objectAtIndex:a3];
}

+ (Class)localizedIncidentSpokenTextType
{
  return (Class)objc_opt_class();
}

- (void)_readBannerLargeText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 214) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBannerLargeText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasBannerLargeText
{
  return self->_bannerLargeText != 0;
}

- (GEOFormattedString)bannerLargeText
{
  -[GEOTrafficBannerText _readBannerLargeText]((uint64_t)self);
  bannerLargeText = self->_bannerLargeText;

  return bannerLargeText;
}

- (void)setBannerLargeText:(id)a3
{
  *(void *)&self->_flags |= 0x200400000uLL;
  objc_storeStrong((id *)&self->_bannerLargeText, a3);
}

- (void)_readBannerSmallText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 214) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBannerSmallText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasBannerSmallText
{
  return self->_bannerSmallText != 0;
}

- (GEOFormattedString)bannerSmallText
{
  -[GEOTrafficBannerText _readBannerSmallText]((uint64_t)self);
  bannerSmallText = self->_bannerSmallText;

  return bannerSmallText;
}

- (void)setBannerSmallText:(id)a3
{
  *(void *)&self->_flags |= 0x200800000uLL;
  objc_storeStrong((id *)&self->_bannerSmallText, a3);
}

- (void)_readSpokenPrompt
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 215) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpokenPrompt_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasSpokenPrompt
{
  return self->_spokenPrompt != 0;
}

- (GEOFormattedString)spokenPrompt
{
  -[GEOTrafficBannerText _readSpokenPrompt]((uint64_t)self);
  spokenPrompt = self->_spokenPrompt;

  return spokenPrompt;
}

- (void)setSpokenPrompt:(id)a3
{
  *(void *)&self->_flags |= 0x280000000uLL;
  objc_storeStrong((id *)&self->_spokenPrompt, a3);
}

- (unsigned)showAtDistance
{
  return self->_showAtDistance;
}

- (void)setShowAtDistance:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000800uLL;
  self->_showAtDistance = a3;
}

- (void)setHasShowAtDistance:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000800;
  }
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasShowAtDistance
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (unsigned)hideAtDistance
{
  return self->_hideAtDistance;
}

- (void)setHideAtDistance:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000008uLL;
  self->_hideAtDistance = a3;
}

- (void)setHasHideAtDistance:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000008;
  }
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasHideAtDistance
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (unsigned)incidentDistance
{
  return self->_incidentDistance;
}

- (void)setIncidentDistance:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000010uLL;
  self->_incidentDistance = a3;
}

- (void)setHasIncidentDistance:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000010;
  }
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasIncidentDistance
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (unsigned)incidentIndex
{
  return self->_incidentIndex;
}

- (void)setIncidentIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000020uLL;
  self->_incidentIndex = a3;
}

- (void)setHasIncidentIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000020;
  }
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasIncidentIndex
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (void)_readCameraInput
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 215) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCameraInput_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasCameraInput
{
  return self->_cameraInput != 0;
}

- (GEOCameraInput)cameraInput
{
  -[GEOTrafficBannerText _readCameraInput]((uint64_t)self);
  cameraInput = self->_cameraInput;

  return cameraInput;
}

- (void)setCameraInput:(id)a3
{
  *(void *)&self->_flags |= 0x202000000uLL;
  objc_storeStrong((id *)&self->_cameraInput, a3);
}

- (void)_readTriggerRange
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 216) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTriggerRange_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasTriggerRange
{
  return self->_triggerRange != 0;
}

- (GEOTriggerPointRange)triggerRange
{
  -[GEOTrafficBannerText _readTriggerRange]((uint64_t)self);
  triggerRange = self->_triggerRange;

  return triggerRange;
}

- (void)setTriggerRange:(id)a3
{
  *(void *)&self->_flags |= 0x300000000uLL;
  objc_storeStrong((id *)&self->_triggerRange, a3);
}

- (void)_readProgressBarRange
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 215) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readProgressBarRange_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasProgressBarRange
{
  return self->_progressBarRange != 0;
}

- (GEOTriggerPointRange)progressBarRange
{
  -[GEOTrafficBannerText _readProgressBarRange]((uint64_t)self);
  progressBarRange = self->_progressBarRange;

  return progressBarRange;
}

- (void)setProgressBarRange:(id)a3
{
  *(void *)&self->_flags |= 0x240000000uLL;
  objc_storeStrong((id *)&self->_progressBarRange, a3);
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000200uLL;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000200;
  }
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasPriority
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (unsigned)minDisplayTime
{
  return self->_minDisplayTime;
}

- (void)setMinDisplayTime:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000040uLL;
  self->_minDisplayTime = a3;
}

- (void)setHasMinDisplayTime:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000040;
  }
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasMinDisplayTime
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (unsigned)overlapDelayTime
{
  return self->_overlapDelayTime;
}

- (void)setOverlapDelayTime:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000080uLL;
  self->_overlapDelayTime = a3;
}

- (void)setHasOverlapDelayTime:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000080;
  }
  self->_flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasOverlapDelayTime
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)previousBannerChange
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0) {
    return self->_previousBannerChange;
  }
  else {
    return 0;
  }
}

- (void)setPreviousBannerChange:(int)a3
{
  *(void *)&self->_flags |= 0x200000100uLL;
  self->_previousBannerChange = a3;
}

- (void)setHasPreviousBannerChange:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000100;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasPreviousBannerChange
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (id)previousBannerChangeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E06F0[a3];
  }

  return v3;
}

- (int)StringAsPreviousBannerChange:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SHOW_NEXT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"REPLACE_IMMEDIATELY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"UPDATE_IN_PLACE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REMOVE_BANNER"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)disableFasterRerouteByDefault
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x4000) == 0 || self->_disableFasterRerouteByDefault;
}

- (void)setDisableFasterRerouteByDefault:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200004000uLL;
  self->_disableFasterRerouteByDefault = a3;
}

- (void)setHasDisableFasterRerouteByDefault:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200004000;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDisableFasterRerouteByDefault
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (int)bannerStyle
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(unsigned char *)&flags & 2) != 0) {
    return self->_bannerStyle;
  }
  else {
    return 0;
  }
}

- (void)setBannerStyle:(int)a3
{
  *(void *)&self->_flags |= 0x200000002uLL;
  self->_bannerStyle = a3;
}

- (void)setHasBannerStyle:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000002;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFDFFFFFFFDLL | v3);
}

- (BOOL)hasBannerStyle
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)bannerStyleAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53E0710[a3];
  }

  return v3;
}

- (int)StringAsBannerStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BANNER_STYLE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BANNER_STYLE_FASTER_ROUTE_AVAILABLE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BANNER_STYLE_INCIDENT_AHEAD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BANNER_STYLE_ROUTE_INVALIDATED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BANNER_STYLE_SUGGEST_NEW_ROUTE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BANNER_STYLE_REROUTE_ALERT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BANNER_STYLE_WARNING"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BANNER_STYLE_SILENT_UPDATE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)secondsSaved
{
  return self->_secondsSaved;
}

- (void)setSecondsSaved:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000400uLL;
  self->_secondsSaved = a3;
}

- (void)setHasSecondsSaved:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000400;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasSecondsSaved
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readButtons
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 215) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtons_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (NSMutableArray)buttons
{
  -[GEOTrafficBannerText _readButtons]((uint64_t)self);
  buttons = self->_buttons;

  return buttons;
}

- (void)setButtons:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  buttons = self->_buttons;
  self->_buttons = v4;
}

- (void)clearButtons
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
  buttons = self->_buttons;

  [(NSMutableArray *)buttons removeAllObjects];
}

- (void)addButton:(id)a3
{
  id v4 = a3;
  -[GEOTrafficBannerText _readButtons]((uint64_t)self);
  -[GEOTrafficBannerText _addNoFlagsButton:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(void *)&self->_flags |= 0x200000000uLL;
}

- (void)_addNoFlagsButton:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)buttonsCount
{
  -[GEOTrafficBannerText _readButtons]((uint64_t)self);
  buttons = self->_buttons;

  return [(NSMutableArray *)buttons count];
}

- (id)buttonAtIndex:(unint64_t)a3
{
  -[GEOTrafficBannerText _readButtons]((uint64_t)self);
  buttons = self->_buttons;

  return (id)[(NSMutableArray *)buttons objectAtIndex:a3];
}

+ (Class)buttonType
{
  return (Class)objc_opt_class();
}

- (int)defaultButtonIndex
{
  return self->_defaultButtonIndex;
}

- (void)setDefaultButtonIndex:(int)a3
{
  *(void *)&self->_flags |= 0x200000004uLL;
  self->_defaultButtonIndex = a3;
}

- (void)setHasDefaultButtonIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200000004;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasDefaultButtonIndex
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)alertDurationSeconds
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (*(unsigned char *)&flags) {
    return self->_alertDurationSeconds;
  }
  else {
    return 20;
  }
}

- (void)setAlertDurationSeconds:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200000001uLL;
  self->_alertDurationSeconds = a3;
}

- (void)setHasAlertDurationSeconds:(BOOL)a3
{
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x200000000);
}

- (BOOL)hasAlertDurationSeconds
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)shouldShowTimer
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_DWORD *)&flags & 0x10000) == 0 || self->_shouldShowTimer;
}

- (void)setShouldShowTimer:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200010000uLL;
  self->_shouldShowTimer = a3;
}

- (void)setHasShouldShowTimer:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200010000;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasShouldShowTimer
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x200001000uLL;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200001000;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasZilchPathIndex
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readBannerDescription
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 214) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBannerDescription_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasBannerDescription
{
  return self->_bannerDescription != 0;
}

- (GEOFormattedString)bannerDescription
{
  -[GEOTrafficBannerText _readBannerDescription]((uint64_t)self);
  bannerDescription = self->_bannerDescription;

  return bannerDescription;
}

- (void)setBannerDescription:(id)a3
{
  *(void *)&self->_flags |= 0x200100000uLL;
  objc_storeStrong((id *)&self->_bannerDescription, a3);
}

- (void)_readBannerId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 214) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBannerId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasBannerId
{
  return self->_bannerId != 0;
}

- (NSString)bannerId
{
  -[GEOTrafficBannerText _readBannerId]((uint64_t)self);
  bannerId = self->_bannerId;

  return bannerId;
}

- (void)setBannerId:(id)a3
{
  *(void *)&self->_flags |= 0x200200000uLL;
  objc_storeStrong((id *)&self->_bannerId, a3);
}

- (BOOL)defaultToNewRoute
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x2000) == 0 || self->_defaultToNewRoute;
}

- (void)setDefaultToNewRoute:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200002000uLL;
  self->_defaultToNewRoute = a3;
}

- (void)setHasDefaultToNewRoute:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200002000;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDefaultToNewRoute
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (void)_readAnalyticsMessageValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 214) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAnalyticsMessageValue_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasAnalyticsMessageValue
{
  return self->_analyticsMessageValue != 0;
}

- (NSString)analyticsMessageValue
{
  -[GEOTrafficBannerText _readAnalyticsMessageValue]((uint64_t)self);
  analyticsMessageValue = self->_analyticsMessageValue;

  return analyticsMessageValue;
}

- (void)setAnalyticsMessageValue:(id)a3
{
  *(void *)&self->_flags |= 0x200040000uLL;
  objc_storeStrong((id *)&self->_analyticsMessageValue, a3);
}

- (void)_readArtworkOverride
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 214) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworkOverride_tags_7651);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasArtworkOverride
{
  return self->_artworkOverride != 0;
}

- (GEOPBTransitArtwork)artworkOverride
{
  -[GEOTrafficBannerText _readArtworkOverride]((uint64_t)self);
  artworkOverride = self->_artworkOverride;

  return artworkOverride;
}

- (void)setArtworkOverride:(id)a3
{
  *(void *)&self->_flags |= 0x200080000uLL;
  objc_storeStrong((id *)&self->_artworkOverride, a3);
}

- (BOOL)preserveBannerInUpdates
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x8000) != 0 && self->_preserveBannerInUpdates;
}

- (void)setPreserveBannerInUpdates:(BOOL)a3
{
  *(void *)&self->_flags |= 0x200008000uLL;
  self->_preserveBannerInUpdates = a3;
}

- (void)setHasPreserveBannerInUpdates:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (a3) {
    uint64_t v3 = 0x200008000;
  }
  self->_$91CAA44C8E9C29DBFC0CB3836B55F581 flags = ($91CAA44C8E9C29DBFC0CB3836B55F581)(*(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasPreserveBannerInUpdates
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (void)_readEventInfo
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 152));
    if ((*(unsigned char *)(a1 + 215) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTrafficBannerTextReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEventInfo_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 152));
  }
}

- (BOOL)hasEventInfo
{
  return self->_eventInfo != 0;
}

- (NSData)eventInfo
{
  -[GEOTrafficBannerText _readEventInfo]((uint64_t)self);
  eventInfo = self->_eventInfo;

  return eventInfo;
}

- (void)setEventInfo:(id)a3
{
  *(void *)&self->_flags |= 0x204000000uLL;
  objc_storeStrong((id *)&self->_eventInfo, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTrafficBannerText;
  id v4 = [(GEOTrafficBannerText *)&v8 description];
  id v5 = [(GEOTrafficBannerText *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficBannerText _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v104 = 0;
    goto LABEL_162;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(a1 + 96))
  {
    id v5 = [(id)a1 localizedIncidentBanners];
    if (a2) {
      objc_super v6 = @"localizedIncidentBanner";
    }
    else {
      objc_super v6 = @"localized_incident_banner";
    }
    [v4 setObject:v5 forKey:v6];
  }
  if (*(void *)(a1 + 112))
  {
    id v7 = [(id)a1 localizedIncidentSubBanners];
    if (a2) {
      objc_super v8 = @"localizedIncidentSubBanner";
    }
    else {
      objc_super v8 = @"localized_incident_sub_banner";
    }
    [v4 setObject:v7 forKey:v8];
  }
  if (*(void *)(a1 + 104))
  {
    v9 = [(id)a1 localizedIncidentSpokenTexts];
    if (a2) {
      v10 = @"localizedIncidentSpokenText";
    }
    else {
      v10 = @"localized_incident_spoken_text";
    }
    [v4 setObject:v9 forKey:v10];
  }
  v11 = [(id)a1 bannerLargeText];
  v12 = v11;
  if (v11)
  {
    if (a2)
    {
      v13 = [v11 jsonRepresentation];
      v14 = @"bannerLargeText";
    }
    else
    {
      v13 = [v11 dictionaryRepresentation];
      v14 = @"banner_large_text";
    }
    id v15 = v13;

    [v4 setObject:v15 forKey:v14];
  }

  v16 = [(id)a1 bannerSmallText];
  v17 = v16;
  if (v16)
  {
    if (a2)
    {
      v18 = [v16 jsonRepresentation];
      v19 = @"bannerSmallText";
    }
    else
    {
      v18 = [v16 dictionaryRepresentation];
      v19 = @"banner_small_text";
    }
    id v20 = v18;

    [v4 setObject:v20 forKey:v19];
  }

  v21 = [(id)a1 spokenPrompt];
  v22 = v21;
  if (v21)
  {
    if (a2)
    {
      v23 = [v21 jsonRepresentation];
      v24 = @"spokenPrompt";
    }
    else
    {
      v23 = [v21 dictionaryRepresentation];
      v24 = @"spoken_prompt";
    }
    id v25 = v23;

    [v4 setObject:v25 forKey:v24];
  }

  uint64_t v26 = *(void *)(a1 + 212);
  if ((v26 & 0x800) != 0)
  {
    v33 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 200)];
    if (a2) {
      v34 = @"showAtDistance";
    }
    else {
      v34 = @"show_at_distance";
    }
    [v4 setObject:v33 forKey:v34];

    uint64_t v26 = *(void *)(a1 + 212);
    if ((v26 & 8) == 0)
    {
LABEL_34:
      if ((v26 & 0x10) == 0) {
        goto LABEL_35;
      }
      goto LABEL_51;
    }
  }
  else if ((v26 & 8) == 0)
  {
    goto LABEL_34;
  }
  v35 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 168)];
  if (a2) {
    v36 = @"hideAtDistance";
  }
  else {
    v36 = @"hide_at_distance";
  }
  [v4 setObject:v35 forKey:v36];

  uint64_t v26 = *(void *)(a1 + 212);
  if ((v26 & 0x10) == 0)
  {
LABEL_35:
    if ((v26 & 0x20) == 0) {
      goto LABEL_40;
    }
    goto LABEL_36;
  }
LABEL_51:
  v37 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 172)];
  if (a2) {
    v38 = @"incidentDistance";
  }
  else {
    v38 = @"incident_distance";
  }
  [v4 setObject:v37 forKey:v38];

  if ((*(void *)(a1 + 212) & 0x20) != 0)
  {
LABEL_36:
    v27 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 176)];
    if (a2) {
      v28 = @"incidentIndex";
    }
    else {
      v28 = @"incident_index";
    }
    [v4 setObject:v27 forKey:v28];
  }
LABEL_40:
  v29 = [(id)a1 cameraInput];
  v30 = v29;
  if (v29)
  {
    if (a2)
    {
      v31 = [v29 jsonRepresentation];
      v32 = @"cameraInput";
    }
    else
    {
      v31 = [v29 dictionaryRepresentation];
      v32 = @"camera_input";
    }
    id v39 = v31;

    [v4 setObject:v39 forKey:v32];
  }

  v40 = [(id)a1 triggerRange];
  v41 = v40;
  if (v40)
  {
    if (a2)
    {
      v42 = [v40 jsonRepresentation];
      v43 = @"triggerRange";
    }
    else
    {
      v42 = [v40 dictionaryRepresentation];
      v43 = @"trigger_range";
    }
    id v44 = v42;

    [v4 setObject:v44 forKey:v43];
  }

  v45 = [(id)a1 progressBarRange];
  v46 = v45;
  if (v45)
  {
    if (a2)
    {
      v47 = [v45 jsonRepresentation];
      v48 = @"progressBarRange";
    }
    else
    {
      v47 = [v45 dictionaryRepresentation];
      v48 = @"progress_bar_range";
    }
    id v49 = v47;

    [v4 setObject:v49 forKey:v48];
  }

  uint64_t v50 = *(void *)(a1 + 212);
  if ((v50 & 0x200) != 0)
  {
    v68 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 192)];
    [v4 setObject:v68 forKey:@"priority"];

    uint64_t v50 = *(void *)(a1 + 212);
    if ((v50 & 0x40) == 0)
    {
LABEL_70:
      if ((v50 & 0x80) == 0) {
        goto LABEL_71;
      }
      goto LABEL_107;
    }
  }
  else if ((v50 & 0x40) == 0)
  {
    goto LABEL_70;
  }
  v69 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 180)];
  if (a2) {
    v70 = @"minDisplayTime";
  }
  else {
    v70 = @"min_display_time";
  }
  [v4 setObject:v69 forKey:v70];

  uint64_t v50 = *(void *)(a1 + 212);
  if ((v50 & 0x80) == 0)
  {
LABEL_71:
    if ((v50 & 0x100) == 0) {
      goto LABEL_72;
    }
    goto LABEL_111;
  }
LABEL_107:
  v71 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 184)];
  if (a2) {
    v72 = @"overlapDelayTime";
  }
  else {
    v72 = @"overlap_delay_time";
  }
  [v4 setObject:v71 forKey:v72];

  uint64_t v50 = *(void *)(a1 + 212);
  if ((v50 & 0x100) == 0)
  {
LABEL_72:
    if ((v50 & 0x4000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_170;
  }
LABEL_111:
  uint64_t v73 = *(int *)(a1 + 188);
  if (v73 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 188));
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = off_1E53E06F0[v73];
  }
  if (a2) {
    v106 = @"previousBannerChange";
  }
  else {
    v106 = @"previous_banner_change";
  }
  [v4 setObject:v74 forKey:v106];

  uint64_t v50 = *(void *)(a1 + 212);
  if ((v50 & 0x4000) == 0)
  {
LABEL_73:
    if ((v50 & 2) == 0) {
      goto LABEL_74;
    }
    goto LABEL_171;
  }
LABEL_170:
  v107 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 209)];
  [v4 setObject:v107 forKey:@"disableFasterRerouteByDefault"];

  uint64_t v50 = *(void *)(a1 + 212);
  if ((v50 & 2) == 0)
  {
LABEL_74:
    if ((v50 & 0x400) == 0) {
      goto LABEL_79;
    }
    goto LABEL_75;
  }
LABEL_171:
  uint64_t v108 = *(int *)(a1 + 160);
  if (v108 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 160));
    v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v109 = off_1E53E0710[v108];
  }
  if (a2) {
    v110 = @"bannerStyle";
  }
  else {
    v110 = @"banner_style";
  }
  [v4 setObject:v109 forKey:v110];

  if ((*(void *)(a1 + 212) & 0x400) != 0)
  {
LABEL_75:
    v51 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 196)];
    if (a2) {
      v52 = @"secondsSaved";
    }
    else {
      v52 = @"seconds_saved";
    }
    [v4 setObject:v51 forKey:v52];
  }
LABEL_79:
  if ([*(id *)(a1 + 72) count])
  {
    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v54 = *(id *)(a1 + 72);
    uint64_t v55 = [v54 countByEnumeratingWithState:&v113 objects:v117 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v114;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v114 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v113 + 1) + 8 * i);
          if (a2) {
            [v59 jsonRepresentation];
          }
          else {
          id v60 = [v59 dictionaryRepresentation];
          }

          [v53 addObject:v60];
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v113 objects:v117 count:16];
      }
      while (v56);
    }

    [v4 setObject:v53 forKey:@"button"];
  }
  uint64_t v61 = *(void *)(a1 + 212);
  if ((v61 & 4) != 0)
  {
    v75 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 164)];
    if (a2) {
      v76 = @"defaultButtonIndex";
    }
    else {
      v76 = @"default_button_index";
    }
    [v4 setObject:v75 forKey:v76];

    uint64_t v61 = *(void *)(a1 + 212);
    if ((v61 & 1) == 0)
    {
LABEL_93:
      if ((v61 & 0x10000) == 0) {
        goto LABEL_94;
      }
LABEL_121:
      v79 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 211)];
      if (a2) {
        v80 = @"shouldShowTimer";
      }
      else {
        v80 = @"should_show_timer";
      }
      [v4 setObject:v79 forKey:v80];

      if ((*(void *)(a1 + 212) & 0x1000) == 0) {
        goto LABEL_99;
      }
      goto LABEL_95;
    }
  }
  else if ((v61 & 1) == 0)
  {
    goto LABEL_93;
  }
  v77 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 156)];
  if (a2) {
    v78 = @"alertDurationSeconds";
  }
  else {
    v78 = @"alert_duration_seconds";
  }
  [v4 setObject:v77 forKey:v78];

  uint64_t v61 = *(void *)(a1 + 212);
  if ((v61 & 0x10000) != 0) {
    goto LABEL_121;
  }
LABEL_94:
  if ((v61 & 0x1000) != 0)
  {
LABEL_95:
    v62 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 204)];
    if (a2) {
      v63 = @"zilchPathIndex";
    }
    else {
      v63 = @"zilch_path_index";
    }
    [v4 setObject:v62 forKey:v63];
  }
LABEL_99:
  v64 = [(id)a1 bannerDescription];
  v65 = v64;
  if (v64)
  {
    if (a2)
    {
      v66 = [v64 jsonRepresentation];
      v67 = @"bannerDescription";
    }
    else
    {
      v66 = [v64 dictionaryRepresentation];
      v67 = @"banner_description";
    }
    id v81 = v66;

    [v4 setObject:v81 forKey:v67];
  }

  v82 = [(id)a1 bannerId];
  if (v82)
  {
    if (a2) {
      v83 = @"bannerId";
    }
    else {
      v83 = @"banner_id";
    }
    [v4 setObject:v82 forKey:v83];
  }

  if ((*(unsigned char *)(a1 + 213) & 0x20) != 0)
  {
    v84 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 208)];
    if (a2) {
      v85 = @"defaultToNewRoute";
    }
    else {
      v85 = @"default_to_new_route";
    }
    [v4 setObject:v84 forKey:v85];
  }
  v86 = [(id)a1 analyticsMessageValue];
  if (v86)
  {
    if (a2) {
      v87 = @"analyticsMessageValue";
    }
    else {
      v87 = @"analytics_message_value";
    }
    [v4 setObject:v86 forKey:v87];
  }

  v88 = [(id)a1 artworkOverride];
  v89 = v88;
  if (v88)
  {
    if (a2)
    {
      v90 = [v88 jsonRepresentation];
      v91 = @"artworkOverride";
    }
    else
    {
      v90 = [v88 dictionaryRepresentation];
      v91 = @"artwork_override";
    }
    id v92 = v90;

    [v4 setObject:v92 forKey:v91];
  }

  if ((*(unsigned char *)(a1 + 213) & 0x80) != 0)
  {
    v93 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 210)];
    if (a2) {
      v94 = @"preserveBannerInUpdates";
    }
    else {
      v94 = @"preserve_banner_in_updates";
    }
    [v4 setObject:v93 forKey:v94];
  }
  v95 = [(id)a1 eventInfo];
  v96 = v95;
  if (v95)
  {
    if (a2)
    {
      v97 = [v95 base64EncodedStringWithOptions:0];
      [v4 setObject:v97 forKey:@"eventInfo"];
    }
    else
    {
      [v4 setObject:v95 forKey:@"event_info"];
    }
  }

  v98 = *(void **)(a1 + 16);
  if (v98)
  {
    v99 = [v98 dictionaryRepresentation];
    v100 = v99;
    if (a2)
    {
      v101 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v99, "count"));
      v111[0] = MEMORY[0x1E4F143A8];
      v111[1] = 3221225472;
      v111[2] = __50__GEOTrafficBannerText__dictionaryRepresentation___block_invoke;
      v111[3] = &unk_1E53D8860;
      id v102 = v101;
      id v112 = v102;
      [v100 enumerateKeysAndObjectsUsingBlock:v111];
      id v103 = v102;

      v100 = v103;
    }
    [v4 setObject:v100 forKey:@"Unknown Fields"];
  }
  id v104 = v4;

LABEL_162:

  return v104;
}

- (id)jsonRepresentation
{
  return -[GEOTrafficBannerText _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOTrafficBannerText__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOTrafficBannerText)initWithDictionary:(id)a3
{
  return (GEOTrafficBannerText *)-[GEOTrafficBannerText _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_250;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_250;
  }
  if (a3) {
    objc_super v6 = @"localizedIncidentBanner";
  }
  else {
    objc_super v6 = @"localized_incident_banner";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v143 objects:v150 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v144;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v144 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v143 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v14 = (void *)[v13 copy];
            [a1 addLocalizedIncidentBanner:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v143 objects:v150 count:16];
      }
      while (v10);
    }
  }
  if (a3) {
    id v15 = @"localizedIncidentSubBanner";
  }
  else {
    id v15 = @"localized_incident_sub_banner";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v139 objects:v149 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v140;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v140 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v139 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = (void *)[v22 copy];
            [a1 addLocalizedIncidentSubBanner:v23];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v139 objects:v149 count:16];
      }
      while (v19);
    }
  }
  if (a3) {
    v24 = @"localizedIncidentSpokenText";
  }
  else {
    v24 = @"localized_incident_spoken_text";
  }
  id v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v26 = v25;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v135 objects:v148 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v136;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v136 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v135 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32 = (void *)[v31 copy];
            [a1 addLocalizedIncidentSpokenText:v32];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v135 objects:v148 count:16];
      }
      while (v28);
    }
  }
  if (a3) {
    v33 = @"bannerLargeText";
  }
  else {
    v33 = @"banner_large_text";
  }
  v34 = [v5 objectForKeyedSubscript:v33];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = [GEOFormattedString alloc];
    if (a3) {
      uint64_t v36 = [(GEOFormattedString *)v35 initWithJSON:v34];
    }
    else {
      uint64_t v36 = [(GEOFormattedString *)v35 initWithDictionary:v34];
    }
    v37 = (void *)v36;
    [a1 setBannerLargeText:v36];
  }
  if (a3) {
    v38 = @"bannerSmallText";
  }
  else {
    v38 = @"banner_small_text";
  }
  id v39 = [v5 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v40 = [GEOFormattedString alloc];
    if (a3) {
      uint64_t v41 = [(GEOFormattedString *)v40 initWithJSON:v39];
    }
    else {
      uint64_t v41 = [(GEOFormattedString *)v40 initWithDictionary:v39];
    }
    v42 = (void *)v41;
    [a1 setBannerSmallText:v41];
  }
  if (a3) {
    v43 = @"spokenPrompt";
  }
  else {
    v43 = @"spoken_prompt";
  }
  id v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v45 = [GEOFormattedString alloc];
    if (a3) {
      uint64_t v46 = [(GEOFormattedString *)v45 initWithJSON:v44];
    }
    else {
      uint64_t v46 = [(GEOFormattedString *)v45 initWithDictionary:v44];
    }
    v47 = (void *)v46;
    [a1 setSpokenPrompt:v46];
  }
  if (a3) {
    v48 = @"showAtDistance";
  }
  else {
    v48 = @"show_at_distance";
  }
  id v49 = [v5 objectForKeyedSubscript:v48];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShowAtDistance:", objc_msgSend(v49, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v50 = @"hideAtDistance";
  }
  else {
    uint64_t v50 = @"hide_at_distance";
  }
  v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHideAtDistance:", objc_msgSend(v51, "unsignedIntValue"));
  }

  if (a3) {
    v52 = @"incidentDistance";
  }
  else {
    v52 = @"incident_distance";
  }
  v53 = [v5 objectForKeyedSubscript:v52];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncidentDistance:", objc_msgSend(v53, "unsignedIntValue"));
  }

  if (a3) {
    id v54 = @"incidentIndex";
  }
  else {
    id v54 = @"incident_index";
  }
  uint64_t v55 = [v5 objectForKeyedSubscript:v54];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIncidentIndex:", objc_msgSend(v55, "unsignedIntValue"));
  }

  if (a3) {
    uint64_t v56 = @"cameraInput";
  }
  else {
    uint64_t v56 = @"camera_input";
  }
  uint64_t v57 = [v5 objectForKeyedSubscript:v56];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v58 = [GEOCameraInput alloc];
    if (a3) {
      uint64_t v59 = [(GEOCameraInput *)v58 initWithJSON:v57];
    }
    else {
      uint64_t v59 = [(GEOCameraInput *)v58 initWithDictionary:v57];
    }
    id v60 = (void *)v59;
    [a1 setCameraInput:v59];
  }
  if (a3) {
    uint64_t v61 = @"triggerRange";
  }
  else {
    uint64_t v61 = @"trigger_range";
  }
  v62 = [v5 objectForKeyedSubscript:v61];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v63 = [GEOTriggerPointRange alloc];
    if (a3) {
      uint64_t v64 = [(GEOTriggerPointRange *)v63 initWithJSON:v62];
    }
    else {
      uint64_t v64 = [(GEOTriggerPointRange *)v63 initWithDictionary:v62];
    }
    v65 = (void *)v64;
    [a1 setTriggerRange:v64];
  }
  if (a3) {
    v66 = @"progressBarRange";
  }
  else {
    v66 = @"progress_bar_range";
  }
  v67 = [v5 objectForKeyedSubscript:v66];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v68 = [GEOTriggerPointRange alloc];
    if (a3) {
      uint64_t v69 = [(GEOTriggerPointRange *)v68 initWithJSON:v67];
    }
    else {
      uint64_t v69 = [(GEOTriggerPointRange *)v68 initWithDictionary:v67];
    }
    v70 = (void *)v69;
    [a1 setProgressBarRange:v69];
  }
  v71 = [v5 objectForKeyedSubscript:@"priority"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPriority:", objc_msgSend(v71, "unsignedIntValue"));
  }

  if (a3) {
    v72 = @"minDisplayTime";
  }
  else {
    v72 = @"min_display_time";
  }
  uint64_t v73 = [v5 objectForKeyedSubscript:v72];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMinDisplayTime:", objc_msgSend(v73, "unsignedIntValue"));
  }

  if (a3) {
    v74 = @"overlapDelayTime";
  }
  else {
    v74 = @"overlap_delay_time";
  }
  v75 = [v5 objectForKeyedSubscript:v74];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setOverlapDelayTime:", objc_msgSend(v75, "unsignedIntValue"));
  }

  if (a3) {
    v76 = @"previousBannerChange";
  }
  else {
    v76 = @"previous_banner_change";
  }
  v77 = [v5 objectForKeyedSubscript:v76];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v78 = v77;
    if ([v78 isEqualToString:@"SHOW_NEXT"])
    {
      uint64_t v79 = 0;
    }
    else if ([v78 isEqualToString:@"REPLACE_IMMEDIATELY"])
    {
      uint64_t v79 = 1;
    }
    else if ([v78 isEqualToString:@"UPDATE_IN_PLACE"])
    {
      uint64_t v79 = 2;
    }
    else if ([v78 isEqualToString:@"REMOVE_BANNER"])
    {
      uint64_t v79 = 3;
    }
    else
    {
      uint64_t v79 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_142;
    }
    uint64_t v79 = [v77 intValue];
  }
  [a1 setPreviousBannerChange:v79];
LABEL_142:

  v80 = [v5 objectForKeyedSubscript:@"disableFasterRerouteByDefault"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDisableFasterRerouteByDefault:", objc_msgSend(v80, "BOOLValue"));
  }

  if (a3) {
    id v81 = @"bannerStyle";
  }
  else {
    id v81 = @"banner_style";
  }
  v82 = [v5 objectForKeyedSubscript:v81];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v83 = v82;
    if ([v83 isEqualToString:@"BANNER_STYLE_UNKNOWN"])
    {
      uint64_t v84 = 0;
    }
    else if ([v83 isEqualToString:@"BANNER_STYLE_FASTER_ROUTE_AVAILABLE"])
    {
      uint64_t v84 = 1;
    }
    else if ([v83 isEqualToString:@"BANNER_STYLE_INCIDENT_AHEAD"])
    {
      uint64_t v84 = 2;
    }
    else if ([v83 isEqualToString:@"BANNER_STYLE_ROUTE_INVALIDATED"])
    {
      uint64_t v84 = 3;
    }
    else if ([v83 isEqualToString:@"BANNER_STYLE_SUGGEST_NEW_ROUTE"])
    {
      uint64_t v84 = 4;
    }
    else if ([v83 isEqualToString:@"BANNER_STYLE_REROUTE_ALERT"])
    {
      uint64_t v84 = 5;
    }
    else if ([v83 isEqualToString:@"BANNER_STYLE_WARNING"])
    {
      uint64_t v84 = 6;
    }
    else if ([v83 isEqualToString:@"BANNER_STYLE_SILENT_UPDATE"])
    {
      uint64_t v84 = 7;
    }
    else
    {
      uint64_t v84 = 0;
    }

    goto LABEL_168;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v84 = [v82 intValue];
LABEL_168:
    [a1 setBannerStyle:v84];
  }

  if (a3) {
    v85 = @"secondsSaved";
  }
  else {
    v85 = @"seconds_saved";
  }
  v86 = [v5 objectForKeyedSubscript:v85];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSecondsSaved:", objc_msgSend(v86, "unsignedIntValue"));
  }

  v87 = [v5 objectForKeyedSubscript:@"button"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v129 = v87;
    id v130 = v5;
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v88 = v87;
    uint64_t v89 = [v88 countByEnumeratingWithState:&v131 objects:v147 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v132;
      do
      {
        for (uint64_t m = 0; m != v90; ++m)
        {
          if (*(void *)v132 != v91) {
            objc_enumerationMutation(v88);
          }
          uint64_t v93 = *(void *)(*((void *)&v131 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v94 = [GEOTrafficBannerTextButton alloc];
            if (a3) {
              uint64_t v95 = [(GEOTrafficBannerTextButton *)v94 initWithJSON:v93];
            }
            else {
              uint64_t v95 = [(GEOTrafficBannerTextButton *)v94 initWithDictionary:v93];
            }
            v96 = (void *)v95;
            objc_msgSend(a1, "addButton:", v95, v129, v130, (void)v131);
          }
        }
        uint64_t v90 = [v88 countByEnumeratingWithState:&v131 objects:v147 count:16];
      }
      while (v90);
    }

    v87 = v129;
    id v5 = v130;
  }

  if (a3) {
    v97 = @"defaultButtonIndex";
  }
  else {
    v97 = @"default_button_index";
  }
  v98 = objc_msgSend(v5, "objectForKeyedSubscript:", v97, v129, v130);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDefaultButtonIndex:", objc_msgSend(v98, "intValue"));
  }

  if (a3) {
    v99 = @"alertDurationSeconds";
  }
  else {
    v99 = @"alert_duration_seconds";
  }
  v100 = [v5 objectForKeyedSubscript:v99];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAlertDurationSeconds:", objc_msgSend(v100, "unsignedIntValue"));
  }

  if (a3) {
    v101 = @"shouldShowTimer";
  }
  else {
    v101 = @"should_show_timer";
  }
  id v102 = [v5 objectForKeyedSubscript:v101];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setShouldShowTimer:", objc_msgSend(v102, "BOOLValue"));
  }

  if (a3) {
    id v103 = @"zilchPathIndex";
  }
  else {
    id v103 = @"zilch_path_index";
  }
  id v104 = [v5 objectForKeyedSubscript:v103];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v104, "unsignedIntValue"));
  }

  if (a3) {
    v105 = @"bannerDescription";
  }
  else {
    v105 = @"banner_description";
  }
  v106 = [v5 objectForKeyedSubscript:v105];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v107 = [GEOFormattedString alloc];
    if (a3) {
      uint64_t v108 = [(GEOFormattedString *)v107 initWithJSON:v106];
    }
    else {
      uint64_t v108 = [(GEOFormattedString *)v107 initWithDictionary:v106];
    }
    v109 = (void *)v108;
    [a1 setBannerDescription:v108];
  }
  if (a3) {
    v110 = @"bannerId";
  }
  else {
    v110 = @"banner_id";
  }
  v111 = [v5 objectForKeyedSubscript:v110];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v112 = (void *)[v111 copy];
    [a1 setBannerId:v112];
  }
  if (a3) {
    long long v113 = @"defaultToNewRoute";
  }
  else {
    long long v113 = @"default_to_new_route";
  }
  long long v114 = [v5 objectForKeyedSubscript:v113];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDefaultToNewRoute:", objc_msgSend(v114, "BOOLValue"));
  }

  if (a3) {
    long long v115 = @"analyticsMessageValue";
  }
  else {
    long long v115 = @"analytics_message_value";
  }
  long long v116 = [v5 objectForKeyedSubscript:v115];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v117 = (void *)[v116 copy];
    [a1 setAnalyticsMessageValue:v117];
  }
  if (a3) {
    uint64_t v118 = @"artworkOverride";
  }
  else {
    uint64_t v118 = @"artwork_override";
  }
  v119 = [v5 objectForKeyedSubscript:v118];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v120 = [GEOPBTransitArtwork alloc];
    if (a3) {
      uint64_t v121 = [(GEOPBTransitArtwork *)v120 initWithJSON:v119];
    }
    else {
      uint64_t v121 = [(GEOPBTransitArtwork *)v120 initWithDictionary:v119];
    }
    v122 = (void *)v121;
    [a1 setArtworkOverride:v121];
  }
  if (a3) {
    v123 = @"preserveBannerInUpdates";
  }
  else {
    v123 = @"preserve_banner_in_updates";
  }
  v124 = [v5 objectForKeyedSubscript:v123];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPreserveBannerInUpdates:", objc_msgSend(v124, "BOOLValue"));
  }

  if (a3) {
    v125 = @"eventInfo";
  }
  else {
    v125 = @"event_info";
  }
  v126 = [v5 objectForKeyedSubscript:v125];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v127 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v126 options:0];
    [a1 setEventInfo:v127];
  }
  a1 = a1;

LABEL_250:
  return a1;
}

- (GEOTrafficBannerText)initWithJSON:(id)a3
{
  return (GEOTrafficBannerText *)-[GEOTrafficBannerText _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_7810;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_7811;
    }
    GEOTrafficBannerTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTrafficBannerTextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficBannerTextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficBannerTextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTrafficBannerTextIsDirty((uint64_t)self) & 1) == 0)
  {
    id v25 = self->_reader;
    objc_sync_enter(v25);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v26 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v26];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v25);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTrafficBannerText *)self readAll:0];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    objc_super v6 = self->_localizedIncidentBanners;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v40;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v7);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v10 = self->_localizedIncidentSubBanners;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v36;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v11);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v14 = self->_localizedIncidentSpokenTexts;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v32;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteStringField();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v15);
    }

    if (self->_bannerLargeText) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_bannerSmallText) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_spokenPrompt) {
      PBDataWriterWriteSubmessage();
    }
    $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      PBDataWriterWriteUint32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_cameraInput) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_triggerRange) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_progressBarRange) {
      PBDataWriterWriteSubmessage();
    }
    $91CAA44C8E9C29DBFC0CB3836B55F581 v19 = self->_flags;
    if ((*(_WORD *)&v19 & 0x200) != 0)
    {
      PBDataWriterWriteUint32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 0x40) != 0)
    {
      PBDataWriterWriteUint32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 0x80) != 0)
    {
      PBDataWriterWriteUint32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v19 = self->_flags;
    }
    if ((*(_WORD *)&v19 & 0x100) != 0)
    {
      PBDataWriterWriteInt32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v19 = self->_flags;
    }
    if ((*(_WORD *)&v19 & 0x4000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v19 = self->_flags;
    }
    if ((*(unsigned char *)&v19 & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v19 = self->_flags;
    }
    if ((*(_WORD *)&v19 & 0x400) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v20 = self->_buttons;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v28;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v20);
          }
          PBDataWriterWriteSubmessage();
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v21);
    }

    $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = self->_flags;
    if ((*(unsigned char *)&v24 & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = self->_flags;
    }
    if (*(unsigned char *)&v24)
    {
      PBDataWriterWriteUint32Field();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = self->_flags;
    }
    if ((*(_DWORD *)&v24 & 0x10000) != 0)
    {
      PBDataWriterWriteBOOLField();
      $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = self->_flags;
    }
    if ((*(_WORD *)&v24 & 0x1000) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_bannerDescription) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_bannerId) {
      PBDataWriterWriteStringField();
    }
    if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_analyticsMessageValue) {
      PBDataWriterWriteStringField();
    }
    if (self->_artworkOverride) {
      PBDataWriterWriteSubmessage();
    }
    if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_eventInfo) {
      PBDataWriterWriteDataField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v27);
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOTrafficBannerText _readCameraInput]((uint64_t)self);
  cameraInput = self->_cameraInput;

  return [(GEOCameraInput *)cameraInput hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v25 = (char *)a3;
  [(GEOTrafficBannerText *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v25 + 1, self->_reader);
  *((_DWORD *)v25 + 36) = self->_readerMarkPos;
  *((_DWORD *)v25 + 37) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOTrafficBannerText *)self localizedIncidentBannersCount])
  {
    [v25 clearLocalizedIncidentBanners];
    unint64_t v4 = [(GEOTrafficBannerText *)self localizedIncidentBannersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTrafficBannerText *)self localizedIncidentBannerAtIndex:i];
        [v25 addLocalizedIncidentBanner:v7];
      }
    }
  }
  if ([(GEOTrafficBannerText *)self localizedIncidentSubBannersCount])
  {
    [v25 clearLocalizedIncidentSubBanners];
    unint64_t v8 = [(GEOTrafficBannerText *)self localizedIncidentSubBannersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOTrafficBannerText *)self localizedIncidentSubBannerAtIndex:j];
        [v25 addLocalizedIncidentSubBanner:v11];
      }
    }
  }
  if ([(GEOTrafficBannerText *)self localizedIncidentSpokenTextsCount])
  {
    [v25 clearLocalizedIncidentSpokenTexts];
    unint64_t v12 = [(GEOTrafficBannerText *)self localizedIncidentSpokenTextsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(GEOTrafficBannerText *)self localizedIncidentSpokenTextAtIndex:k];
        [v25 addLocalizedIncidentSpokenText:v15];
      }
    }
  }
  if (self->_bannerLargeText) {
    objc_msgSend(v25, "setBannerLargeText:");
  }
  uint64_t v16 = v25;
  if (self->_bannerSmallText)
  {
    objc_msgSend(v25, "setBannerSmallText:");
    uint64_t v16 = v25;
  }
  if (self->_spokenPrompt)
  {
    objc_msgSend(v25, "setSpokenPrompt:");
    uint64_t v16 = v25;
  }
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    *((_DWORD *)v16 + 50) = self->_showAtDistance;
    *(void *)(v16 + 212) |= 0x800uLL;
    $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_66;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v16 + 42) = self->_hideAtDistance;
  *(void *)(v16 + 212) |= 8uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_66:
  *((_DWORD *)v16 + 43) = self->_incidentDistance;
  *(void *)(v16 + 212) |= 0x10uLL;
  if ((*(void *)&self->_flags & 0x20) != 0)
  {
LABEL_23:
    *((_DWORD *)v16 + 44) = self->_incidentIndex;
    *(void *)(v16 + 212) |= 0x20uLL;
  }
LABEL_24:
  if (self->_cameraInput)
  {
    objc_msgSend(v25, "setCameraInput:");
    uint64_t v16 = v25;
  }
  if (self->_triggerRange)
  {
    objc_msgSend(v25, "setTriggerRange:");
    uint64_t v16 = v25;
  }
  if (self->_progressBarRange)
  {
    objc_msgSend(v25, "setProgressBarRange:");
    uint64_t v16 = v25;
  }
  $91CAA44C8E9C29DBFC0CB3836B55F581 v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x200) != 0)
  {
    *((_DWORD *)v16 + 48) = self->_priority;
    *(void *)(v16 + 212) |= 0x200uLL;
    $91CAA44C8E9C29DBFC0CB3836B55F581 v18 = self->_flags;
    if ((*(unsigned char *)&v18 & 0x40) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v18 & 0x80) == 0) {
        goto LABEL_33;
      }
      goto LABEL_70;
    }
  }
  else if ((*(unsigned char *)&v18 & 0x40) == 0)
  {
    goto LABEL_32;
  }
  *((_DWORD *)v16 + 45) = self->_minDisplayTime;
  *(void *)(v16 + 212) |= 0x40uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 0x80) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v18 & 0x100) == 0) {
      goto LABEL_34;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v16 + 46) = self->_overlapDelayTime;
  *(void *)(v16 + 212) |= 0x80uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x100) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v18 & 0x4000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v16 + 47) = self->_previousBannerChange;
  *(void *)(v16 + 212) |= 0x100uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v18 & 2) == 0) {
      goto LABEL_36;
    }
LABEL_73:
    *((_DWORD *)v16 + 40) = self->_bannerStyle;
    *(void *)(v16 + 212) |= 2uLL;
    if ((*(void *)&self->_flags & 0x400) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_72:
  v16[209] = self->_disableFasterRerouteByDefault;
  *(void *)(v16 + 212) |= 0x4000uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v18 = self->_flags;
  if ((*(unsigned char *)&v18 & 2) != 0) {
    goto LABEL_73;
  }
LABEL_36:
  if ((*(_WORD *)&v18 & 0x400) != 0)
  {
LABEL_37:
    *((_DWORD *)v16 + 49) = self->_secondsSaved;
    *(void *)(v16 + 212) |= 0x400uLL;
  }
LABEL_38:
  if ([(GEOTrafficBannerText *)self buttonsCount])
  {
    [v25 clearButtons];
    unint64_t v19 = [(GEOTrafficBannerText *)self buttonsCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (uint64_t m = 0; m != v20; ++m)
      {
        uint64_t v22 = [(GEOTrafficBannerText *)self buttonAtIndex:m];
        [v25 addButton:v22];
      }
    }
  }
  $91CAA44C8E9C29DBFC0CB3836B55F581 v23 = self->_flags;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = v25;
  if ((*(unsigned char *)&v23 & 4) != 0)
  {
    *((_DWORD *)v25 + 41) = self->_defaultButtonIndex;
    *(void *)(v25 + 212) |= 4uLL;
    $91CAA44C8E9C29DBFC0CB3836B55F581 v23 = self->_flags;
    if ((*(unsigned char *)&v23 & 1) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v23 & 0x10000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_77;
    }
  }
  else if ((*(unsigned char *)&v23 & 1) == 0)
  {
    goto LABEL_44;
  }
  *((_DWORD *)v25 + 39) = self->_alertDurationSeconds;
  *(void *)(v25 + 212) |= 1uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v23 = self->_flags;
  if ((*(_DWORD *)&v23 & 0x10000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v23 & 0x1000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
LABEL_77:
  v25[211] = self->_shouldShowTimer;
  *(void *)(v25 + 212) |= 0x10000uLL;
  if ((*(void *)&self->_flags & 0x1000) != 0)
  {
LABEL_46:
    *((_DWORD *)v25 + 51) = self->_zilchPathIndex;
    *(void *)(v25 + 212) |= 0x1000uLL;
  }
LABEL_47:
  if (self->_bannerDescription)
  {
    objc_msgSend(v25, "setBannerDescription:");
    $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = v25;
  }
  if (self->_bannerId)
  {
    objc_msgSend(v25, "setBannerId:");
    $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = v25;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0)
  {
    v24[208] = self->_defaultToNewRoute;
    *(void *)(v24 + 212) |= 0x2000uLL;
  }
  if (self->_analyticsMessageValue)
  {
    objc_msgSend(v25, "setAnalyticsMessageValue:");
    $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = v25;
  }
  if (self->_artworkOverride)
  {
    objc_msgSend(v25, "setArtworkOverride:");
    $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = v25;
  }
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    v24[210] = self->_preserveBannerInUpdates;
    *(void *)(v24 + 212) |= 0x8000uLL;
  }
  if (self->_eventInfo)
  {
    objc_msgSend(v25, "setEventInfo:");
    $91CAA44C8E9C29DBFC0CB3836B55F581 v24 = v25;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*((unsigned char *)&self->_flags + 4) & 2) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTrafficBannerTextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_56;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTrafficBannerText *)self readAll:0];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  unint64_t v9 = self->_localizedIncidentBanners;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v68 objects:v75 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v69 != v11) {
          objc_enumerationMutation(v9);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v68 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLocalizedIncidentBanner:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v68 objects:v75 count:16];
    }
    while (v10);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v14 = self->_localizedIncidentSubBanners;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v65 != v16) {
          objc_enumerationMutation(v14);
        }
        $91CAA44C8E9C29DBFC0CB3836B55F581 v18 = (void *)[*(id *)(*((void *)&v64 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addLocalizedIncidentSubBanner:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v15);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  unint64_t v19 = self->_localizedIncidentSpokenTexts;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v61;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v61 != v21) {
          objc_enumerationMutation(v19);
        }
        $91CAA44C8E9C29DBFC0CB3836B55F581 v23 = (void *)[*(id *)(*((void *)&v60 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addLocalizedIncidentSpokenText:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v20);
  }

  id v24 = [(GEOFormattedString *)self->_bannerLargeText copyWithZone:a3];
  id v25 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v24;

  id v26 = [(GEOFormattedString *)self->_bannerSmallText copyWithZone:a3];
  long long v27 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v26;

  id v28 = [(GEOFormattedString *)self->_spokenPrompt copyWithZone:a3];
  long long v29 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v28;

  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 200) = self->_showAtDistance;
    *(void *)(v5 + 212) |= 0x800uLL;
    $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_28:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_29;
      }
      goto LABEL_59;
    }
  }
  else if ((*(unsigned char *)&flags & 8) == 0)
  {
    goto LABEL_28;
  }
  *(_DWORD *)(v5 + 168) = self->_hideAtDistance;
  *(void *)(v5 + 212) |= 8uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&flags & 0x20) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_59:
  *(_DWORD *)(v5 + 172) = self->_incidentDistance;
  *(void *)(v5 + 212) |= 0x10uLL;
  if ((*(void *)&self->_flags & 0x20) != 0)
  {
LABEL_30:
    *(_DWORD *)(v5 + 176) = self->_incidentIndex;
    *(void *)(v5 + 212) |= 0x20uLL;
  }
LABEL_31:
  id v31 = [(GEOCameraInput *)self->_cameraInput copyWithZone:a3];
  long long v32 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v31;

  id v33 = [(GEOTriggerPointRange *)self->_triggerRange copyWithZone:a3];
  long long v34 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v33;

  id v35 = [(GEOTriggerPointRange *)self->_progressBarRange copyWithZone:a3];
  long long v36 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v35;

  $91CAA44C8E9C29DBFC0CB3836B55F581 v37 = self->_flags;
  if ((*(_WORD *)&v37 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_priority;
    *(void *)(v5 + 212) |= 0x200uLL;
    $91CAA44C8E9C29DBFC0CB3836B55F581 v37 = self->_flags;
    if ((*(unsigned char *)&v37 & 0x40) == 0)
    {
LABEL_33:
      if ((*(unsigned char *)&v37 & 0x80) == 0) {
        goto LABEL_34;
      }
      goto LABEL_63;
    }
  }
  else if ((*(unsigned char *)&v37 & 0x40) == 0)
  {
    goto LABEL_33;
  }
  *(_DWORD *)(v5 + 180) = self->_minDisplayTime;
  *(void *)(v5 + 212) |= 0x40uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v37 = self->_flags;
  if ((*(unsigned char *)&v37 & 0x80) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v37 & 0x100) == 0) {
      goto LABEL_35;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v5 + 184) = self->_overlapDelayTime;
  *(void *)(v5 + 212) |= 0x80uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v37 = self->_flags;
  if ((*(_WORD *)&v37 & 0x100) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v37 & 0x4000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v5 + 188) = self->_previousBannerChange;
  *(void *)(v5 + 212) |= 0x100uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v37 = self->_flags;
  if ((*(_WORD *)&v37 & 0x4000) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v37 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(unsigned char *)(v5 + 209) = self->_disableFasterRerouteByDefault;
  *(void *)(v5 + 212) |= 0x4000uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v37 = self->_flags;
  if ((*(unsigned char *)&v37 & 2) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v37 & 0x400) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_66:
  *(_DWORD *)(v5 + 160) = self->_bannerStyle;
  *(void *)(v5 + 212) |= 2uLL;
  if ((*(void *)&self->_flags & 0x400) != 0)
  {
LABEL_38:
    *(_DWORD *)(v5 + 196) = self->_secondsSaved;
    *(void *)(v5 + 212) |= 0x400uLL;
  }
LABEL_39:
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v38 = self->_buttons;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v56 objects:v72 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v57;
    do
    {
      for (uint64_t m = 0; m != v39; ++m)
      {
        if (*(void *)v57 != v40) {
          objc_enumerationMutation(v38);
        }
        long long v42 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * m), "copyWithZone:", a3, (void)v56);
        [(id)v5 addButton:v42];
      }
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v56 objects:v72 count:16];
    }
    while (v39);
  }

  $91CAA44C8E9C29DBFC0CB3836B55F581 v43 = self->_flags;
  if ((*(unsigned char *)&v43 & 4) != 0)
  {
    *(_DWORD *)(v5 + 164) = self->_defaultButtonIndex;
    *(void *)(v5 + 212) |= 4uLL;
    $91CAA44C8E9C29DBFC0CB3836B55F581 v43 = self->_flags;
    if ((*(unsigned char *)&v43 & 1) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v43 & 0x10000) == 0) {
        goto LABEL_49;
      }
LABEL_70:
      *(unsigned char *)(v5 + 211) = self->_shouldShowTimer;
      *(void *)(v5 + 212) |= 0x10000uLL;
      if ((*(void *)&self->_flags & 0x1000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_50;
    }
  }
  else if ((*(unsigned char *)&v43 & 1) == 0)
  {
    goto LABEL_48;
  }
  *(_DWORD *)(v5 + 156) = self->_alertDurationSeconds;
  *(void *)(v5 + 212) |= 1uLL;
  $91CAA44C8E9C29DBFC0CB3836B55F581 v43 = self->_flags;
  if ((*(_DWORD *)&v43 & 0x10000) != 0) {
    goto LABEL_70;
  }
LABEL_49:
  if ((*(_WORD *)&v43 & 0x1000) != 0)
  {
LABEL_50:
    *(_DWORD *)(v5 + 204) = self->_zilchPathIndex;
    *(void *)(v5 + 212) |= 0x1000uLL;
  }
LABEL_51:
  id v44 = -[GEOFormattedString copyWithZone:](self->_bannerDescription, "copyWithZone:", a3, (void)v56);
  v45 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v44;

  uint64_t v46 = [(NSString *)self->_bannerId copyWithZone:a3];
  uint64_t v47 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v46;

  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 208) = self->_defaultToNewRoute;
    *(void *)(v5 + 212) |= 0x2000uLL;
  }
  uint64_t v48 = [(NSString *)self->_analyticsMessageValue copyWithZone:a3];
  id v49 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v48;

  id v50 = [(GEOPBTransitArtwork *)self->_artworkOverride copyWithZone:a3];
  v51 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v50;

  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0)
  {
    *(unsigned char *)(v5 + 210) = self->_preserveBannerInUpdates;
    *(void *)(v5 + 212) |= 0x8000uLL;
  }
  uint64_t v52 = [(NSData *)self->_eventInfo copyWithZone:a3];
  v53 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v52;

  id v54 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v54;
LABEL_56:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_124;
  }
  [(GEOTrafficBannerText *)self readAll:1];
  [v4 readAll:1];
  localizedIncidentBanners = self->_localizedIncidentBanners;
  if ((unint64_t)localizedIncidentBanners | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](localizedIncidentBanners, "isEqual:")) {
      goto LABEL_124;
    }
  }
  localizedIncidentSubBanners = self->_localizedIncidentSubBanners;
  if ((unint64_t)localizedIncidentSubBanners | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](localizedIncidentSubBanners, "isEqual:")) {
      goto LABEL_124;
    }
  }
  localizedIncidentSpokenTexts = self->_localizedIncidentSpokenTexts;
  if ((unint64_t)localizedIncidentSpokenTexts | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](localizedIncidentSpokenTexts, "isEqual:")) {
      goto LABEL_124;
    }
  }
  bannerLargeText = self->_bannerLargeText;
  if ((unint64_t)bannerLargeText | *((void *)v4 + 7))
  {
    if (!-[GEOFormattedString isEqual:](bannerLargeText, "isEqual:")) {
      goto LABEL_124;
    }
  }
  bannerSmallText = self->_bannerSmallText;
  if ((unint64_t)bannerSmallText | *((void *)v4 + 8))
  {
    if (!-[GEOFormattedString isEqual:](bannerSmallText, "isEqual:")) {
      goto LABEL_124;
    }
  }
  spokenPrompt = self->_spokenPrompt;
  if ((unint64_t)spokenPrompt | *((void *)v4 + 16))
  {
    if (!-[GEOFormattedString isEqual:](spokenPrompt, "isEqual:")) {
      goto LABEL_124;
    }
  }
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  uint64_t v12 = *(void *)(v4 + 212);
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_showAtDistance != *((_DWORD *)v4 + 50)) {
      goto LABEL_124;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_hideAtDistance != *((_DWORD *)v4 + 42)) {
      goto LABEL_124;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_incidentDistance != *((_DWORD *)v4 + 43)) {
      goto LABEL_124;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_incidentIndex != *((_DWORD *)v4 + 44)) {
      goto LABEL_124;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_124;
  }
  cameraInput = self->_cameraInput;
  if ((unint64_t)cameraInput | *((void *)v4 + 10) && !-[GEOCameraInput isEqual:](cameraInput, "isEqual:")) {
    goto LABEL_124;
  }
  triggerRange = self->_triggerRange;
  if ((unint64_t)triggerRange | *((void *)v4 + 17))
  {
    if (!-[GEOTriggerPointRange isEqual:](triggerRange, "isEqual:")) {
      goto LABEL_124;
    }
  }
  progressBarRange = self->_progressBarRange;
  if ((unint64_t)progressBarRange | *((void *)v4 + 15))
  {
    if (!-[GEOTriggerPointRange isEqual:](progressBarRange, "isEqual:")) {
      goto LABEL_124;
    }
  }
  $91CAA44C8E9C29DBFC0CB3836B55F581 v16 = self->_flags;
  uint64_t v17 = *(void *)(v4 + 212);
  if ((*(_WORD *)&v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_priority != *((_DWORD *)v4 + 48)) {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&v16 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_minDisplayTime != *((_DWORD *)v4 + 45)) {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&v16 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_overlapDelayTime != *((_DWORD *)v4 + 46)) {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    if ((v17 & 0x100) == 0 || self->_previousBannerChange != *((_DWORD *)v4 + 47)) {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x100) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v16 & 0x4000) != 0)
  {
    if ((v17 & 0x4000) == 0) {
      goto LABEL_124;
    }
    if (self->_disableFasterRerouteByDefault)
    {
      if (!v4[209]) {
        goto LABEL_124;
      }
    }
    else if (v4[209])
    {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x4000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(unsigned char *)&v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_bannerStyle != *((_DWORD *)v4 + 40)) {
      goto LABEL_124;
    }
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v16 & 0x400) != 0)
  {
    if ((v17 & 0x400) == 0 || self->_secondsSaved != *((_DWORD *)v4 + 49)) {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x400) != 0)
  {
    goto LABEL_124;
  }
  buttons = self->_buttons;
  if ((unint64_t)buttons | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](buttons, "isEqual:")) {
      goto LABEL_124;
    }
    $91CAA44C8E9C29DBFC0CB3836B55F581 v16 = self->_flags;
    uint64_t v17 = *(void *)(v4 + 212);
  }
  if ((*(unsigned char *)&v16 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_defaultButtonIndex != *((_DWORD *)v4 + 41)) {
      goto LABEL_124;
    }
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_124;
  }
  if (*(unsigned char *)&v16)
  {
    if ((v17 & 1) == 0 || self->_alertDurationSeconds != *((_DWORD *)v4 + 39)) {
      goto LABEL_124;
    }
  }
  else if (v17)
  {
    goto LABEL_124;
  }
  if ((*(_DWORD *)&v16 & 0x10000) != 0)
  {
    if ((v17 & 0x10000) == 0) {
      goto LABEL_124;
    }
    if (self->_shouldShowTimer)
    {
      if (!v4[211]) {
        goto LABEL_124;
      }
    }
    else if (v4[211])
    {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x10000) != 0)
  {
    goto LABEL_124;
  }
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    if ((v17 & 0x1000) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 51)) {
      goto LABEL_124;
    }
  }
  else if ((v17 & 0x1000) != 0)
  {
    goto LABEL_124;
  }
  bannerDescription = self->_bannerDescription;
  if ((unint64_t)bannerDescription | *((void *)v4 + 5)
    && !-[GEOFormattedString isEqual:](bannerDescription, "isEqual:"))
  {
    goto LABEL_124;
  }
  bannerId = self->_bannerId;
  if ((unint64_t)bannerId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](bannerId, "isEqual:")) {
      goto LABEL_124;
    }
  }
  uint64_t v21 = *(void *)(v4 + 212);
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0)
  {
    if ((v21 & 0x2000) == 0) {
      goto LABEL_124;
    }
    if (self->_defaultToNewRoute)
    {
      if (!v4[208]) {
        goto LABEL_124;
      }
    }
    else if (v4[208])
    {
      goto LABEL_124;
    }
  }
  else if ((v21 & 0x2000) != 0)
  {
    goto LABEL_124;
  }
  analyticsMessageValue = self->_analyticsMessageValue;
  if ((unint64_t)analyticsMessageValue | *((void *)v4 + 3)
    && !-[NSString isEqual:](analyticsMessageValue, "isEqual:"))
  {
    goto LABEL_124;
  }
  artworkOverride = self->_artworkOverride;
  if ((unint64_t)artworkOverride | *((void *)v4 + 4))
  {
    if (!-[GEOPBTransitArtwork isEqual:](artworkOverride, "isEqual:")) {
      goto LABEL_124;
    }
  }
  uint64_t v24 = *(void *)(v4 + 212);
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) == 0)
  {
    if ((v24 & 0x8000) == 0) {
      goto LABEL_130;
    }
LABEL_124:
    char v25 = 0;
    goto LABEL_125;
  }
  if ((v24 & 0x8000) == 0) {
    goto LABEL_124;
  }
  if (!self->_preserveBannerInUpdates)
  {
    if (!v4[210]) {
      goto LABEL_130;
    }
    goto LABEL_124;
  }
  if (!v4[210]) {
    goto LABEL_124;
  }
LABEL_130:
  eventInfo = self->_eventInfo;
  if ((unint64_t)eventInfo | *((void *)v4 + 11)) {
    char v25 = -[NSData isEqual:](eventInfo, "isEqual:");
  }
  else {
    char v25 = 1;
  }
LABEL_125:

  return v25;
}

- (unint64_t)hash
{
  [(GEOTrafficBannerText *)self readAll:1];
  uint64_t v38 = [(NSMutableArray *)self->_localizedIncidentBanners hash];
  uint64_t v37 = [(NSMutableArray *)self->_localizedIncidentSubBanners hash];
  uint64_t v36 = [(NSMutableArray *)self->_localizedIncidentSpokenTexts hash];
  unint64_t v35 = [(GEOFormattedString *)self->_bannerLargeText hash];
  unint64_t v34 = [(GEOFormattedString *)self->_bannerSmallText hash];
  unint64_t v33 = [(GEOFormattedString *)self->_spokenPrompt hash];
  $91CAA44C8E9C29DBFC0CB3836B55F581 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    uint64_t v32 = 2654435761 * self->_showAtDistance;
    if ((*(unsigned char *)&flags & 8) != 0)
    {
LABEL_3:
      uint64_t v31 = 2654435761 * self->_hideAtDistance;
      if ((*(unsigned char *)&flags & 0x10) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v30 = 0;
      if ((*(unsigned char *)&flags & 0x20) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v31 = 0;
  if ((*(unsigned char *)&flags & 0x10) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v30 = 2654435761 * self->_incidentDistance;
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
LABEL_5:
    uint64_t v29 = 2654435761 * self->_incidentIndex;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v29 = 0;
LABEL_10:
  unint64_t v28 = [(GEOCameraInput *)self->_cameraInput hash];
  unint64_t v27 = [(GEOTriggerPointRange *)self->_triggerRange hash];
  unint64_t v26 = [(GEOTriggerPointRange *)self->_progressBarRange hash];
  $91CAA44C8E9C29DBFC0CB3836B55F581 v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    uint64_t v25 = 2654435761 * self->_priority;
    if ((*(unsigned char *)&v4 & 0x40) != 0)
    {
LABEL_12:
      uint64_t v24 = 2654435761 * self->_minDisplayTime;
      if ((*(unsigned char *)&v4 & 0x80) != 0) {
        goto LABEL_13;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_12;
    }
  }
  uint64_t v24 = 0;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
LABEL_13:
    uint64_t v23 = 2654435761 * self->_overlapDelayTime;
    if ((*(_WORD *)&v4 & 0x100) != 0) {
      goto LABEL_14;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v23 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_14:
    uint64_t v22 = 2654435761 * self->_previousBannerChange;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v22 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_15:
    uint64_t v21 = 2654435761 * self->_disableFasterRerouteByDefault;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_16;
    }
LABEL_23:
    uint64_t v20 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_17;
    }
    goto LABEL_24;
  }
LABEL_22:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&v4 & 2) == 0) {
    goto LABEL_23;
  }
LABEL_16:
  uint64_t v20 = 2654435761 * self->_bannerStyle;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_17:
    uint64_t v19 = 2654435761 * self->_secondsSaved;
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v19 = 0;
LABEL_25:
  uint64_t v18 = [(NSMutableArray *)self->_buttons hash];
  $91CAA44C8E9C29DBFC0CB3836B55F581 v5 = self->_flags;
  if ((*(unsigned char *)&v5 & 4) != 0)
  {
    uint64_t v17 = 2654435761 * self->_defaultButtonIndex;
    if (*(unsigned char *)&v5)
    {
LABEL_27:
      uint64_t v15 = 2654435761 * self->_alertDurationSeconds;
      if ((*(_DWORD *)&v5 & 0x10000) != 0) {
        goto LABEL_28;
      }
LABEL_32:
      uint64_t v6 = 0;
      if ((*(_WORD *)&v5 & 0x1000) != 0) {
        goto LABEL_29;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (*(unsigned char *)&v5) {
      goto LABEL_27;
    }
  }
  uint64_t v15 = 0;
  if ((*(_DWORD *)&v5 & 0x10000) == 0) {
    goto LABEL_32;
  }
LABEL_28:
  uint64_t v6 = 2654435761 * self->_shouldShowTimer;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
LABEL_29:
    uint64_t v7 = 2654435761 * self->_zilchPathIndex;
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v7 = 0;
LABEL_34:
  unint64_t v8 = [(GEOFormattedString *)self->_bannerDescription hash];
  NSUInteger v9 = [(NSString *)self->_bannerId hash];
  if ((*((unsigned char *)&self->_flags + 1) & 0x20) != 0) {
    uint64_t v10 = 2654435761 * self->_defaultToNewRoute;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_analyticsMessageValue hash];
  unint64_t v12 = [(GEOPBTransitArtwork *)self->_artworkOverride hash];
  if ((*((unsigned char *)&self->_flags + 1) & 0x80) != 0) {
    uint64_t v13 = 2654435761 * self->_preserveBannerInUpdates;
  }
  else {
    uint64_t v13 = 0;
  }
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSData *)self->_eventInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  $91CAA44C8E9C29DBFC0CB3836B55F581 v4 = (char *)a3;
  [v4 readAll:0];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v5 = *((id *)v4 + 12);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v57 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GEOTrafficBannerText *)self addLocalizedIncidentBanner:*(void *)(*((void *)&v56 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v7);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v10 = *((id *)v4 + 14);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(v10);
        }
        [(GEOTrafficBannerText *)self addLocalizedIncidentSubBanner:*(void *)(*((void *)&v52 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v12);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v15 = *((id *)v4 + 13);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        [(GEOTrafficBannerText *)self addLocalizedIncidentSpokenText:*(void *)(*((void *)&v48 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v17);
  }

  bannerLargeText = self->_bannerLargeText;
  uint64_t v21 = *((void *)v4 + 7);
  if (bannerLargeText)
  {
    if (v21) {
      -[GEOFormattedString mergeFrom:](bannerLargeText, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[GEOTrafficBannerText setBannerLargeText:](self, "setBannerLargeText:");
  }
  bannerSmallText = self->_bannerSmallText;
  uint64_t v23 = *((void *)v4 + 8);
  if (bannerSmallText)
  {
    if (v23) {
      -[GEOFormattedString mergeFrom:](bannerSmallText, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[GEOTrafficBannerText setBannerSmallText:](self, "setBannerSmallText:");
  }
  spokenPrompt = self->_spokenPrompt;
  uint64_t v25 = *((void *)v4 + 16);
  if (spokenPrompt)
  {
    if (v25) {
      -[GEOFormattedString mergeFrom:](spokenPrompt, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[GEOTrafficBannerText setSpokenPrompt:](self, "setSpokenPrompt:");
  }
  uint64_t v26 = *(void *)(v4 + 212);
  if ((v26 & 0x800) != 0)
  {
    self->_showAtDistance = *((_DWORD *)v4 + 50);
    *(void *)&self->_flags |= 0x800uLL;
    uint64_t v26 = *(void *)(v4 + 212);
    if ((v26 & 8) == 0)
    {
LABEL_39:
      if ((v26 & 0x10) == 0) {
        goto LABEL_40;
      }
      goto LABEL_47;
    }
  }
  else if ((v26 & 8) == 0)
  {
    goto LABEL_39;
  }
  self->_hideAtDistance = *((_DWORD *)v4 + 42);
  *(void *)&self->_flags |= 8uLL;
  uint64_t v26 = *(void *)(v4 + 212);
  if ((v26 & 0x10) == 0)
  {
LABEL_40:
    if ((v26 & 0x20) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_47:
  self->_incidentDistance = *((_DWORD *)v4 + 43);
  *(void *)&self->_flags |= 0x10uLL;
  if ((*(void *)(v4 + 212) & 0x20) != 0)
  {
LABEL_41:
    self->_incidentIndex = *((_DWORD *)v4 + 44);
    *(void *)&self->_flags |= 0x20uLL;
  }
LABEL_42:
  cameraInput = self->_cameraInput;
  uint64_t v28 = *((void *)v4 + 10);
  if (cameraInput)
  {
    if (v28) {
      -[GEOCameraInput mergeFrom:](cameraInput, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[GEOTrafficBannerText setCameraInput:](self, "setCameraInput:");
  }
  triggerRange = self->_triggerRange;
  uint64_t v30 = *((void *)v4 + 17);
  if (triggerRange)
  {
    if (v30) {
      -[GEOTriggerPointRange mergeFrom:](triggerRange, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[GEOTrafficBannerText setTriggerRange:](self, "setTriggerRange:");
  }
  progressBarRange = self->_progressBarRange;
  uint64_t v32 = *((void *)v4 + 15);
  if (progressBarRange)
  {
    if (v32) {
      -[GEOTriggerPointRange mergeFrom:](progressBarRange, "mergeFrom:");
    }
  }
  else if (v32)
  {
    -[GEOTrafficBannerText setProgressBarRange:](self, "setProgressBarRange:");
  }
  uint64_t v33 = *(void *)(v4 + 212);
  if ((v33 & 0x200) != 0)
  {
    self->_priority = *((_DWORD *)v4 + 48);
    *(void *)&self->_flags |= 0x200uLL;
    uint64_t v33 = *(void *)(v4 + 212);
    if ((v33 & 0x40) == 0)
    {
LABEL_63:
      if ((v33 & 0x80) == 0) {
        goto LABEL_64;
      }
      goto LABEL_86;
    }
  }
  else if ((v33 & 0x40) == 0)
  {
    goto LABEL_63;
  }
  self->_minDisplayTime = *((_DWORD *)v4 + 45);
  *(void *)&self->_flags |= 0x40uLL;
  uint64_t v33 = *(void *)(v4 + 212);
  if ((v33 & 0x80) == 0)
  {
LABEL_64:
    if ((v33 & 0x100) == 0) {
      goto LABEL_65;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_overlapDelayTime = *((_DWORD *)v4 + 46);
  *(void *)&self->_flags |= 0x80uLL;
  uint64_t v33 = *(void *)(v4 + 212);
  if ((v33 & 0x100) == 0)
  {
LABEL_65:
    if ((v33 & 0x4000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_previousBannerChange = *((_DWORD *)v4 + 47);
  *(void *)&self->_flags |= 0x100uLL;
  uint64_t v33 = *(void *)(v4 + 212);
  if ((v33 & 0x4000) == 0)
  {
LABEL_66:
    if ((v33 & 2) == 0) {
      goto LABEL_67;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_disableFasterRerouteByDefault = v4[209];
  *(void *)&self->_flags |= 0x4000uLL;
  uint64_t v33 = *(void *)(v4 + 212);
  if ((v33 & 2) == 0)
  {
LABEL_67:
    if ((v33 & 0x400) == 0) {
      goto LABEL_69;
    }
    goto LABEL_68;
  }
LABEL_89:
  self->_bannerStyle = *((_DWORD *)v4 + 40);
  *(void *)&self->_flags |= 2uLL;
  if ((*(void *)(v4 + 212) & 0x400) != 0)
  {
LABEL_68:
    self->_secondsSaved = *((_DWORD *)v4 + 49);
    *(void *)&self->_flags |= 0x400uLL;
  }
LABEL_69:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v34 = *((id *)v4 + 9);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v36; ++m)
      {
        if (*(void *)v45 != v37) {
          objc_enumerationMutation(v34);
        }
        -[GEOTrafficBannerText addButton:](self, "addButton:", *(void *)(*((void *)&v44 + 1) + 8 * m), (void)v44);
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v36);
  }

  uint64_t v39 = *(void *)(v4 + 212);
  if ((v39 & 4) != 0)
  {
    self->_defaultButtonIndex = *((_DWORD *)v4 + 41);
    *(void *)&self->_flags |= 4uLL;
    uint64_t v39 = *(void *)(v4 + 212);
    if ((v39 & 1) == 0)
    {
LABEL_78:
      if ((v39 & 0x10000) == 0) {
        goto LABEL_79;
      }
      goto LABEL_93;
    }
  }
  else if ((v39 & 1) == 0)
  {
    goto LABEL_78;
  }
  self->_alertDurationSeconds = *((_DWORD *)v4 + 39);
  *(void *)&self->_flags |= 1uLL;
  uint64_t v39 = *(void *)(v4 + 212);
  if ((v39 & 0x10000) == 0)
  {
LABEL_79:
    if ((v39 & 0x1000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
LABEL_93:
  self->_shouldShowTimer = v4[211];
  *(void *)&self->_flags |= 0x10000uLL;
  if ((*(void *)(v4 + 212) & 0x1000) != 0)
  {
LABEL_80:
    self->_zilchPathIndex = *((_DWORD *)v4 + 51);
    *(void *)&self->_flags |= 0x1000uLL;
  }
LABEL_81:
  bannerDescription = self->_bannerDescription;
  uint64_t v41 = *((void *)v4 + 5);
  if (bannerDescription)
  {
    if (v41) {
      -[GEOFormattedString mergeFrom:](bannerDescription, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[GEOTrafficBannerText setBannerDescription:](self, "setBannerDescription:");
  }
  if (*((void *)v4 + 6)) {
    -[GEOTrafficBannerText setBannerId:](self, "setBannerId:");
  }
  if ((v4[213] & 0x20) != 0)
  {
    self->_defaultToNewRoute = v4[208];
    *(void *)&self->_flags |= 0x2000uLL;
  }
  if (*((void *)v4 + 3)) {
    -[GEOTrafficBannerText setAnalyticsMessageValue:](self, "setAnalyticsMessageValue:");
  }
  artworkOverride = self->_artworkOverride;
  uint64_t v43 = *((void *)v4 + 4);
  if (artworkOverride)
  {
    if (v43) {
      -[GEOPBTransitArtwork mergeFrom:](artworkOverride, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[GEOTrafficBannerText setArtworkOverride:](self, "setArtworkOverride:");
  }
  if (v4[213] < 0)
  {
    self->_preserveBannerInUpdates = v4[210];
    *(void *)&self->_flags |= 0x8000uLL;
  }
  if (*((void *)v4 + 11)) {
    -[GEOTrafficBannerText setEventInfo:](self, "setEventInfo:");
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((unsigned char *)&self->_flags + 2) & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOTrafficBannerTextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7815);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(void *)&self->_flags |= 0x200020000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTrafficBannerText *)self readAll:0];
    [(GEOFormattedString *)self->_bannerLargeText clearUnknownFields:1];
    [(GEOFormattedString *)self->_bannerSmallText clearUnknownFields:1];
    [(GEOFormattedString *)self->_spokenPrompt clearUnknownFields:1];
    [(GEOCameraInput *)self->_cameraInput clearUnknownFields:1];
    [(GEOTriggerPointRange *)self->_triggerRange clearUnknownFields:1];
    [(GEOTriggerPointRange *)self->_progressBarRange clearUnknownFields:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_buttons;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(GEOFormattedString *)self->_bannerDescription clearUnknownFields:1];
    [(GEOPBTransitArtwork *)self->_artworkOverride clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerRange, 0);
  objc_storeStrong((id *)&self->_spokenPrompt, 0);
  objc_storeStrong((id *)&self->_progressBarRange, 0);
  objc_storeStrong((id *)&self->_localizedIncidentSubBanners, 0);
  objc_storeStrong((id *)&self->_localizedIncidentSpokenTexts, 0);
  objc_storeStrong((id *)&self->_localizedIncidentBanners, 0);
  objc_storeStrong((id *)&self->_eventInfo, 0);
  objc_storeStrong((id *)&self->_cameraInput, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_bannerSmallText, 0);
  objc_storeStrong((id *)&self->_bannerLargeText, 0);
  objc_storeStrong((id *)&self->_bannerId, 0);
  objc_storeStrong((id *)&self->_bannerDescription, 0);
  objc_storeStrong((id *)&self->_artworkOverride, 0);
  objc_storeStrong((id *)&self->_analyticsMessageValue, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end