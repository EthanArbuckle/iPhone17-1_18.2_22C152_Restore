@interface MapsSuggestionsServerSideFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
- (MapsSuggestionsServerSideFilter)init;
@end

@implementation MapsSuggestionsServerSideFilter

- (MapsSuggestionsServerSideFilter)init
{
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsServerSideFilter;
  v2 = [(MapsSuggestionsServerSideFilter *)&v4 init];
  if (v2)
  {
    v2->_enabledEntryTypeUnknown = GEOConfigGetBOOL();
    v2->_enabledEntryTypeHome = GEOConfigGetBOOL();
    v2->_enabledEntryTypeWork = GEOConfigGetBOOL();
    v2->_enabledEntryTypeCalendarEvent = GEOConfigGetBOOL();
    v2->_enabledEntryTypeFrequentLocation = GEOConfigGetBOOL();
    v2->_enabledEntryTypeRecentHistory = GEOConfigGetBOOL();
    v2->_enabledEntryTypeOldPreYukonFavorite = GEOConfigGetBOOL();
    v2->_enabledEntryTypeParkedCar = GEOConfigGetBOOL();
    v2->_enabledEntryTypeRestaurantReservation = GEOConfigGetBOOL();
    v2->_enabledEntryTypeRidesharing = GEOConfigGetBOOL();
    v2->_enabledEntryTypeCarPlayLowEnergy = GEOConfigGetBOOL();
    v2->_enabledEntryTypeResumeRoute = GEOConfigGetBOOL();
    v2->_enabledEntryTypeAppConnection = GEOConfigGetBOOL();
    v2->_enabledEntryTypeHotel = GEOConfigGetBOOL();
    v2->_enabledEntryTypeCarRental = GEOConfigGetBOOL();
    v2->_enabledEntryTypeTravelFlight = GEOConfigGetBOOL();
    v2->_enabledEntryTypeTicketedEvent = GEOConfigGetBOOL();
    v2->_enabledEntryTypePortrait = GEOConfigGetBOOL();
    v2->_enabledEntryTypeUserPlace = GEOConfigGetBOOL();
    v2->_enabledEntryTypeSchool = GEOConfigGetBOOL();
    v2->_enabledEntryTypeVehicleSetup = GEOConfigGetBOOL();
    v2->_enabledEntryTypeFavoriteButton = GEOConfigGetBOOL();
    v2->_enabledEntryTypeOrderStatus = GEOConfigGetBOOL();
    v2->_enabledEntryTypeContactActivity = GEOConfigGetBOOL();
  }
  return v2;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    switch([v4 type])
    {
      case 0:
        uint64_t v6 = 8;
        goto LABEL_38;
      case 1:
        uint64_t v6 = 9;
        goto LABEL_38;
      case 2:
        uint64_t v6 = 10;
        goto LABEL_38;
      case 3:
        uint64_t v6 = 11;
        goto LABEL_38;
      case 4:
        uint64_t v6 = 12;
        goto LABEL_38;
      case 5:
        uint64_t v6 = 13;
        goto LABEL_38;
      case 6:
        uint64_t v6 = 14;
        goto LABEL_38;
      case 7:
        uint64_t v6 = 15;
        goto LABEL_38;
      case 8:
        uint64_t v6 = 16;
        goto LABEL_38;
      case 9:
        uint64_t v6 = 17;
        goto LABEL_38;
      case 10:
        uint64_t v6 = 18;
        goto LABEL_38;
      case 11:
        uint64_t v6 = 19;
        goto LABEL_38;
      case 12:
        uint64_t v6 = 20;
        goto LABEL_38;
      case 13:
        uint64_t v6 = 21;
        goto LABEL_38;
      case 14:
        uint64_t v6 = 22;
        goto LABEL_38;
      case 15:
        uint64_t v6 = 23;
        goto LABEL_38;
      case 16:
        uint64_t v6 = 24;
        goto LABEL_38;
      case 17:
        uint64_t v6 = 25;
        goto LABEL_38;
      case 18:
        uint64_t v6 = 26;
        goto LABEL_38;
      case 19:
        uint64_t v6 = 27;
        goto LABEL_38;
      case 20:
        uint64_t v6 = 28;
        goto LABEL_38;
      case 21:
        if ((!MapsFeature_IsEnabled_LagunaBeach()
           || (GEODoesUserHaveValidAccountForMakingContributions() & 1) == 0)
          && !GEOConfigGetBOOL())
        {
          goto LABEL_7;
        }
        char BOOL = GEOConfigGetBOOL();
        break;
      case 22:
        uint64_t v6 = 29;
        goto LABEL_38;
      case 23:
        uint64_t v6 = 30;
        goto LABEL_38;
      case 24:
        uint64_t v6 = 31;
LABEL_38:
        char BOOL = *((unsigned char *)&self->super.super.isa + v6) != 0;
        break;
      default:
        v9 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v11 = 136446978;
          v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsServerSideFilter.m";
          __int16 v13 = 1024;
          int v14 = 213;
          __int16 v15 = 2082;
          v16 = "-[MapsSuggestionsServerSideFilter shouldKeepEntry:]";
          __int16 v17 = 2082;
          v18 = "YES";
          _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v11, 0x26u);
        }

        char BOOL = 1;
        break;
    }
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsServerSideFilter.m";
      __int16 v13 = 1024;
      int v14 = 157;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsServerSideFilter shouldKeepEntry:]";
      __int16 v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v11, 0x26u);
    }

LABEL_7:
    char BOOL = 0;
  }

  return BOOL;
}

@end