@interface MapsSuggestionsEntry
+ (BOOL)supportsSecureCoding;
+ (MapsSuggestionsEntry)entryWithData:(id)a3;
+ (MapsSuggestionsEntry)entryWithType:(int64_t)a3 title:(id)a4 subtitle:(id)a5 weight:(double)a6 expires:(id)a7 sourceSpecificInfo:(id)a8;
+ (id)entryFromSerializedBase64String:(id)a3 hasPrefix:(BOOL)a4;
+ (id)entryFromSerializedHexString:(id)a3 hasPrefix:(BOOL)a4;
+ (id)entryFromSerializedString:(id)a3;
- (BOOL)BOOLeanForKey:(id)a3;
- (BOOL)BOOLeanForKey:(id)a3 is:(BOOL)a4;
- (BOOL)_wasEverOfType:(int64_t)a3;
- (BOOL)_wasEverOneOfTypes:(id)a3;
- (BOOL)containsKey:(id)a3;
- (BOOL)deleted;
- (BOOL)expiresBeforeEntry:(id)a3;
- (BOOL)hasEndTime;
- (BOOL)hasEssentialFlightInfo;
- (BOOL)hasExpired;
- (BOOL)hasFullFlightInfoAndGate;
- (BOOL)hasMultipleWaypointsLeft;
- (BOOL)hasStartAndEndTime;
- (BOOL)hasStartTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEntry:(id)a3;
- (BOOL)isLockedOrHidden;
- (BOOL)isMultiPointRoute;
- (BOOL)isPureShortcut;
- (BOOL)isShortcutForSetup;
- (BOOL)startsBeforeEntry:(id)a3;
- (BOOL)updateUndecoratedSubtitle:(id)a3;
- (BOOL)updateUndecoratedTitle:(id)a3;
- (GEOMapItemStorage)geoMapItem;
- (MapsSuggestionsEntry)initWithCoder:(id)a3;
- (MapsSuggestionsEntry)initWithType:(int64_t)a3 title:(id)a4;
- (MapsSuggestionsEntry)initWithType:(int64_t)a3 title:(id)a4 subtitle:(id)a5 weight:(double)a6 expires:(id)a7 geoMapItem:(id)a8 sourceSpecificInfo:(id)a9;
- (NSData)iconData;
- (NSDate)expires;
- (NSString)fullDescription;
- (NSString)originatingSourceName;
- (NSString)serializedBase64String;
- (NSString)serializedHexString;
- (NSString)shortDescription;
- (NSString)shortcutIdentifier;
- (NSString)subtitle;
- (NSString)subtitleWhenLocked;
- (NSString)title;
- (NSString)titleWhenLocked;
- (NSString)undecoratedSubtitle;
- (NSString)undecoratedSubtitleWhenLocked;
- (NSString)undecoratedTitle;
- (NSString)undecoratedTitleWhenLocked;
- (NSString)uniqueIdentifier;
- (NSString)uniqueName;
- (double)weight;
- (id)ETAForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)UUIDForKey:(id)a3;
- (id)_valueForKey:(uint64_t)a3 class:;
- (id)arrayForKey:(id)a3;
- (id)arrivingAirportCode;
- (id)contacts;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)dataForKey:(id)a3;
- (id)dateForKey:(id)a3;
- (id)departingAirportCode;
- (id)endTime;
- (id)mapItemHandleData;
- (id)nameForJSON;
- (id)numberForKey:(id)a3;
- (id)objectForJSON;
- (id)routeRequestStorageForKey:(id)a3;
- (id)setForKey:(id)a3;
- (id)sourceSpecificInfo;
- (id)startTime;
- (id)stringForKey:(id)a3;
- (int64_t)availableRemovalBehaviors;
- (int64_t)integerForKey:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)uint64ForKey:(id)a3;
- (void)_overrideType:(int64_t)a3;
- (void)_selectETAFrom:(void *)a3 destinationKey:(void *)a4 otherEntry:;
- (void)_setValue:(void *)a3 forKey:(uint64_t)a4 class:;
- (void)encodeWithCoder:(id)a3;
- (void)mergeFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4;
- (void)mergeFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4 protectTitles:(BOOL)a5 protectTitleDecorations:(BOOL)a6 protectMapItem:(BOOL)a7 protectWeight:(BOOL)a8 protectExpiration:(BOOL)a9 protectIcon:(BOOL)a10;
- (void)mergeSpecificsFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4;
- (void)replaceByEntry:(id)a3;
- (void)replaceByEntry:(id)a3 forceDecoratedOverwrites:(BOOL)a4;
- (void)resetAvailableRemovalBehavior:(int64_t)a3;
- (void)setArray:(id)a3 forKey:(id)a4;
- (void)setAvailableRemovalBehavior:(int64_t)a3;
- (void)setBoolean:(BOOL)a3 forKey:(id)a4;
- (void)setContacts:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4;
- (void)setDate:(id)a3 forKey:(id)a4;
- (void)setDeleted:(BOOL)a3;
- (void)setETA:(id)a3 forKey:(id)a4;
- (void)setExpires:(id)a3;
- (void)setGeoMapItem:(id)a3;
- (void)setIconData:(id)a3;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setLocationCoordinateKeysFromLocation:(id)a3;
- (void)setMapItemHandleData:(id)a3;
- (void)setNumber:(id)a3 forKey:(id)a4;
- (void)setOriginatingSourceName:(id)a3;
- (void)setRouteRequestStorage:(id)a3 forKey:(id)a4;
- (void)setSet:(id)a3 forKey:(id)a4;
- (void)setShareETAHandles:(id)a3;
- (void)setSourceSpecificInfo:(id)a3;
- (void)setString:(id)a3 forKey:(id)a4;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleWhenLocked:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleWhenLocked:(id)a3;
- (void)setURL:(id)a3 forKey:(id)a4;
- (void)setUUID:(id)a3 forKey:(id)a4;
- (void)setUndecoratedSubtitle:(id)a3;
- (void)setUndecoratedSubtitleWhenLocked:(id)a3;
- (void)setUndecoratedTitle:(id)a3;
- (void)setUndecoratedTitleWhenLocked:(id)a3;
- (void)setWeight:(double)a3;
@end

@implementation MapsSuggestionsEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingSourceName, 0);
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_undecoratedSubtitleWhenLocked, 0);
  objc_storeStrong((id *)&self->_undecoratedSubtitle, 0);
  objc_storeStrong((id *)&self->_undecoratedTitleWhenLocked, 0);
  objc_storeStrong((id *)&self->_undecoratedTitle, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_subtitleWhenLocked, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleWhenLocked, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sourceSpecificInfo, 0);
  objc_storeStrong((id *)&self->_typeHistory, 0);
}

- (MapsSuggestionsEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MapsSuggestionsEntry *)self initWithType:0 title:&stru_1EFC640F8];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"mseType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseSubtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseUndecoratedTitle"];
    undecoratedTitle = v5->_undecoratedTitle;
    v5->_undecoratedTitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseUndecoratedSubtitle"];
    undecoratedSubtitle = v5->_undecoratedSubtitle;
    v5->_undecoratedSubtitle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseTitleWhenLocked"];
    titleWhenLocked = v5->_titleWhenLocked;
    v5->_titleWhenLocked = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseSubtitleWhenLocked"];
    subtitleWhenLocked = v5->_subtitleWhenLocked;
    v5->_subtitleWhenLocked = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseUndecoratedTitleWhenLocked"];
    undecoratedTitleWhenLocked = v5->_undecoratedTitleWhenLocked;
    v5->_undecoratedTitleWhenLocked = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseUndecoratedSubtitleWhenLocked"];
    undecoratedSubtitleWhenLocked = v5->_undecoratedSubtitleWhenLocked;
    v5->_undecoratedSubtitleWhenLocked = (NSString *)v20;

    [v4 decodeDoubleForKey:@"mseWeight"];
    *(float *)&double v22 = v22;
    v5->_weight = *(float *)&v22;
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseExpires"];
    expires = v5->_expires;
    v5->_expires = (NSDate *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseIconData"];
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v25;

    v5->_deleted = [v4 decodeBoolForKey:@"mseDeleted"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseOriginatingSourceName"];
    originatingSourceName = v5->_originatingSourceName;
    v5->_originatingSourceName = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mseGEOMapItem"];
    geoMapItem = v5->_geoMapItem;
    v5->_geoMapItem = (GEOMapItemStorage *)v29;

    if (_MergedGlobals_39 != -1) {
      dispatch_once(&_MergedGlobals_39, &__block_literal_global_16);
    }
    v31 = [v4 decodeObjectOfClasses:qword_1EB6F0270 forKey:@"mseSSI"];
    uint64_t v32 = [v31 mutableCopy];
    sourceSpecificInfo = v5->_sourceSpecificInfo;
    v5->_sourceSpecificInfo = (NSMutableDictionary *)v32;

    v34 = [v4 decodeObjectOfClasses:qword_1EB6F0278 forKey:@"mseTypeHistory"];
    uint64_t v35 = [v34 mutableCopy];
    typeHistory = v5->_typeHistory;
    v5->_typeHistory = (NSMutableSet *)v35;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  objc_msgSend(v19, "encodeInteger:forKey:", -[MapsSuggestionsEntry type](self, "type"), @"mseType");
  id v4 = [(MapsSuggestionsEntry *)self title];
  [v19 encodeObject:v4 forKey:@"mseTitle"];

  v5 = [(MapsSuggestionsEntry *)self subtitle];
  [v19 encodeObject:v5 forKey:@"mseSubtitle"];

  uint64_t v6 = [(MapsSuggestionsEntry *)self undecoratedTitle];
  [v19 encodeObject:v6 forKey:@"mseUndecoratedTitle"];

  v7 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
  [v19 encodeObject:v7 forKey:@"mseUndecoratedSubtitle"];

  uint64_t v8 = [(MapsSuggestionsEntry *)self titleWhenLocked];
  [v19 encodeObject:v8 forKey:@"mseTitleWhenLocked"];

  v9 = [(MapsSuggestionsEntry *)self subtitleWhenLocked];
  [v19 encodeObject:v9 forKey:@"mseSubtitleWhenLocked"];

  uint64_t v10 = [(MapsSuggestionsEntry *)self undecoratedTitleWhenLocked];
  [v19 encodeObject:v10 forKey:@"mseUndecoratedTitleWhenLocked"];

  v11 = [(MapsSuggestionsEntry *)self undecoratedSubtitleWhenLocked];
  [v19 encodeObject:v11 forKey:@"mseUndecoratedSubtitleWhenLocked"];

  [(MapsSuggestionsEntry *)self weight];
  objc_msgSend(v19, "encodeDouble:forKey:", @"mseWeight");
  uint64_t v12 = [(MapsSuggestionsEntry *)self expires];
  [v19 encodeObject:v12 forKey:@"mseExpires"];

  v13 = [(MapsSuggestionsEntry *)self iconData];
  [v19 encodeObject:v13 forKey:@"mseIconData"];

  objc_msgSend(v19, "encodeBool:forKey:", -[MapsSuggestionsEntry deleted](self, "deleted"), @"mseDeleted");
  uint64_t v14 = [(MapsSuggestionsEntry *)self originatingSourceName];
  [v19 encodeObject:v14 forKey:@"mseOriginatingSourceName"];

  v15 = [(MapsSuggestionsEntry *)self geoMapItem];
  [v19 encodeObject:v15 forKey:@"mseGEOMapItem"];

  uint64_t v16 = self;
  objc_sync_enter(v16);
  v17 = (void *)[(NSMutableDictionary *)v16->_sourceSpecificInfo copy];
  [v19 encodeObject:v17 forKey:@"mseSSI"];

  uint64_t v18 = (void *)[(NSMutableSet *)v16->_typeHistory copy];
  [v19 encodeObject:v18 forKey:@"mseTypeHistory"];

  objc_sync_exit(v16);
}

- (NSString)undecoratedTitleWhenLocked
{
  return self->_undecoratedTitleWhenLocked;
}

- (NSString)undecoratedSubtitleWhenLocked
{
  return self->_undecoratedSubtitleWhenLocked;
}

- (NSString)titleWhenLocked
{
  return self->_titleWhenLocked;
}

- (NSString)subtitleWhenLocked
{
  return self->_subtitleWhenLocked;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (void)mergeFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4 protectTitles:(BOOL)a5 protectTitleDecorations:(BOOL)a6 protectMapItem:(BOOL)a7 protectWeight:(BOOL)a8 protectExpiration:(BOOL)a9 protectIcon:(BOOL)a10
{
  uint64_t v12 = a6;
  uint64_t v13 = a5;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = (MapsSuggestionsEntry *)a3;
  if (!v16)
  {
    GEOFindOrCreateLog();
    v24 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      __int16 v89 = 1024;
      int v90 = 178;
      __int16 v91 = 2082;
      v92 = "-[MapsSuggestionsEntry(BusinessLogic) mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecoration"
            "s:protectMapItem:protectWeight:protectExpiration:protectIcon:]";
      __int16 v93 = 2082;
      v94 = "nil == (otherEntry)";
      uint64_t v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an other suggestions entry";
LABEL_45:
      _os_log_impl(&dword_1A70DF000, &v24->super, OS_LOG_TYPE_ERROR, v25, buf, 0x26u);
    }
LABEL_113:

    goto LABEL_114;
  }
  if (![(MapsSuggestionsEntry *)self isEqualToEntry:v16])
  {
    BOOL v17 = a9;
    if (a4)
    {
      if (a4 == 1)
      {
        if (v13) {
          goto LABEL_69;
        }
        uint64_t v18 = [(MapsSuggestionsEntry *)self title];
        uint64_t v19 = [(MapsSuggestionsEntry *)v16 undecoratedTitle];
        if (!v19) {
          goto LABEL_8;
        }
        uint64_t v20 = (void *)v19;
        v21 = [(MapsSuggestionsEntry *)v16 undecoratedTitle];
        double v22 = [(MapsSuggestionsEntry *)self undecoratedTitle];
        char v23 = [v21 isEqualToString:v22];

        if ((v23 & 1) == 0)
        {
          v43 = [(MapsSuggestionsEntry *)v16 undecoratedTitle];
          [(MapsSuggestionsEntry *)self setUndecoratedTitle:v43];
        }
        else
        {
LABEL_8:
          if (v12) {
            goto LABEL_56;
          }
        }
        uint64_t v44 = [(MapsSuggestionsEntry *)v16 title];

        uint64_t v18 = (void *)v44;
LABEL_56:
        if (v18)
        {
          v45 = [(MapsSuggestionsEntry *)self title];
          char v46 = [v18 isEqualToString:v45];

          if ((v46 & 1) == 0) {
            [(MapsSuggestionsEntry *)self setTitle:v18];
          }
        }

        uint64_t v13 = [(MapsSuggestionsEntry *)self subtitle];
        uint64_t v47 = [(MapsSuggestionsEntry *)v16 undecoratedSubtitle];
        if (!v47) {
          goto LABEL_61;
        }
        v48 = (void *)v47;
        v49 = [(MapsSuggestionsEntry *)v16 undecoratedSubtitle];
        v50 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
        char v51 = [v49 isEqualToString:v50];

        if ((v51 & 1) == 0)
        {
          v52 = [(MapsSuggestionsEntry *)v16 undecoratedSubtitle];
          [(MapsSuggestionsEntry *)self setUndecoratedSubtitle:v52];
        }
        else
        {
LABEL_61:
          if (v12)
          {
LABEL_65:
            BOOL v17 = a9;
            if (v13)
            {
              uint64_t v12 = [(MapsSuggestionsEntry *)self subtitle];
              char v53 = [(id)v13 isEqualToString:v12];

              if ((v53 & 1) == 0) {
                [(MapsSuggestionsEntry *)self setSubtitle:v13];
              }
            }

LABEL_69:
            if (a7) {
              goto LABEL_84;
            }
            v54 = [(MapsSuggestionsEntry *)self geoMapItem];
            if (v54)
            {
              uint64_t v12 = [(MapsSuggestionsEntry *)self geoMapItem];
              uint64_t v13 = [(MapsSuggestionsEntry *)v16 geoMapItem];
              if (([(id)v12 isEqual:v13] & 1) == 0)
              {

                goto LABEL_80;
              }
              BOOL v86 = v17;
            }
            else
            {
              BOOL v86 = v17;
            }
            uint64_t v55 = [(MapsSuggestionsEntry *)v16 geoMapItem];
            if (!v55)
            {
              BOOL v17 = v86;
              if (!v54) {
                goto LABEL_84;
              }

              goto LABEL_83;
            }
            v56 = (void *)v55;
            v57 = [(MapsSuggestionsEntry *)v16 geoMapItem];
            v58 = [(MapsSuggestionsEntry *)self geoMapItem];
            char v59 = [v57 isEqual:v58];

            if (v54)
            {
            }
            BOOL v17 = v86;
            if (v59)
            {
LABEL_84:
              if (!a8)
              {
                [(MapsSuggestionsEntry *)self weight];
                double v61 = v60;
                [(MapsSuggestionsEntry *)v16 weight];
                if (v61 <= v62) {
                  v63 = v16;
                }
                else {
                  v63 = self;
                }
                [(MapsSuggestionsEntry *)v63 weight];
                -[MapsSuggestionsEntry setWeight:](self, "setWeight:");
              }
              int64_t v64 = [(MapsSuggestionsEntry *)self type];
              if (v64 != [(MapsSuggestionsEntry *)v16 type]) {
                [(MapsSuggestionsEntry *)self _overrideType:[(MapsSuggestionsEntry *)v16 type]];
              }
              if (v17) {
                goto LABEL_100;
              }
              v65 = self;
              v66 = v16;
              if (!v65)
              {
                v68 = GEOFindOrCreateLog();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136446978;
                  v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
                  __int16 v89 = 1024;
                  int v90 = 51;
                  __int16 v91 = 2082;
                  v92 = "NSDate *_mergeExpirationOfEntries(MapsSuggestionsEntry *__strong, MapsSuggestionsEntry *__strong)";
                  __int16 v93 = 2082;
                  v94 = "nil == (a)";
                  _os_log_impl(&dword_1A70DF000, v68, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry A", buf, 0x26u);
                }

                v67 = 0;
                goto LABEL_99;
              }
              if ([(MapsSuggestionsEntry *)v65 deleted] || [(MapsSuggestionsEntry *)v66 deleted])
              {
                v67 = [MEMORY[0x1E4F1C9C8] distantPast];
LABEL_99:

                [(MapsSuggestionsEntry *)v65 setExpires:v67];
LABEL_100:
                if (!a10)
                {
                  v69 = [(MapsSuggestionsEntry *)v16 iconData];
                  [(MapsSuggestionsEntry *)self setIconData:v69];
                }
                BOOL v70 = [(MapsSuggestionsEntry *)v16 deleted]
                   || [(MapsSuggestionsEntry *)self deleted];
                [(MapsSuggestionsEntry *)self setDeleted:v70];
                [(MapsSuggestionsEntry *)self mergeSpecificsFromSuggestionEntry:v16 behavior:1];
                v24 = self;
                v71 = v16;
                if (v24)
                {
                  v72 = [(MapsSuggestionsEntry *)v24 originatingSourceName];
                  v73 = [(MapsSuggestionsEntry *)v71 originatingSourceName];
                  if (v72 && ([v72 isEqualToString:v73] & 1) == 0) {
                    [(MapsSuggestionsEntry *)v24 setString:v73 forKey:@"MapsSuggestionsNewSourceKey"];
                  }
                }
                else
                {
                  v72 = GEOFindOrCreateLog();
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446978;
                    v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
                    __int16 v89 = 1024;
                    int v90 = 81;
                    __int16 v91 = 2082;
                    v92 = "void _mergeOriginsOfEntries(MapsSuggestionsEntry *__strong, MapsSuggestionsEntry *__strong)";
                    __int16 v93 = 2082;
                    v94 = "nil == (oriEntry)";
                    _os_log_impl(&dword_1A70DF000, v72, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion oriEntry", buf, 0x26u);
                  }
                }

                goto LABEL_113;
              }
              v75 = [(MapsSuggestionsEntry *)v65 expires];
              if (v75)
              {
              }
              else
              {
                v67 = [(MapsSuggestionsEntry *)v66 expires];

                if (!v67) {
                  goto LABEL_99;
                }
              }
              v81 = [(MapsSuggestionsEntry *)v65 expires];

              v82 = [(MapsSuggestionsEntry *)v66 expires];
              v67 = v82;
              if (v81)
              {

                uint64_t v83 = [(MapsSuggestionsEntry *)v65 expires];
                v84 = (void *)v83;
                if (v67)
                {
                  v85 = [(MapsSuggestionsEntry *)v66 expires];
                  v67 = [v84 laterDate:v85];
                }
                else
                {
                  v67 = (void *)v83;
                }
              }
              goto LABEL_99;
            }
LABEL_80:
            v54 = [(MapsSuggestionsEntry *)v16 geoMapItem];
            [(MapsSuggestionsEntry *)self setGeoMapItem:v54];
LABEL_83:

            goto LABEL_84;
          }
        }
        uint64_t v12 = [(MapsSuggestionsEntry *)v16 subtitle];

        uint64_t v13 = v12;
        goto LABEL_65;
      }
      GEOFindOrCreateLog();
      v24 = (MapsSuggestionsEntry *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
        __int16 v89 = 1024;
        int v90 = 257;
        __int16 v91 = 2082;
        v92 = "-[MapsSuggestionsEntry(BusinessLogic) mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorati"
              "ons:protectMapItem:protectWeight:protectExpiration:protectIcon:]";
        __int16 v93 = 2082;
        v94 = "YES";
        uint64_t v25 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMergeBehavior!";
        goto LABEL_45;
      }
      goto LABEL_113;
    }
    if (v13) {
      goto LABEL_29;
    }
    v26 = [(MapsSuggestionsEntry *)self undecoratedTitle];
    if (!v26)
    {
      uint64_t v27 = [(MapsSuggestionsEntry *)v16 undecoratedTitle];

      if (!v27) {
        goto LABEL_17;
      }
      v26 = [(MapsSuggestionsEntry *)v16 undecoratedTitle];
      [(MapsSuggestionsEntry *)self setUndecoratedTitle:v26];
    }

LABEL_17:
    v28 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
    if (!v28)
    {
      uint64_t v29 = [(MapsSuggestionsEntry *)v16 undecoratedSubtitle];

      if (!v29) {
        goto LABEL_21;
      }
      v28 = [(MapsSuggestionsEntry *)v16 undecoratedSubtitle];
      [(MapsSuggestionsEntry *)self setUndecoratedSubtitle:v28];
    }

LABEL_21:
    v30 = [(MapsSuggestionsEntry *)self title];
    if (!v30)
    {
      v31 = [(MapsSuggestionsEntry *)v16 title];

      if (!v31)
      {
LABEL_25:
        uint64_t v32 = [(MapsSuggestionsEntry *)self subtitle];
        if (!v32)
        {
          v33 = [(MapsSuggestionsEntry *)v16 subtitle];

          if (!v33) {
            goto LABEL_29;
          }
          uint64_t v32 = [(MapsSuggestionsEntry *)v16 subtitle];
          [(MapsSuggestionsEntry *)self setSubtitle:v32];
        }

LABEL_29:
        if (!a7)
        {
          v34 = [(MapsSuggestionsEntry *)self geoMapItem];
          if (v34)
          {
LABEL_33:

            goto LABEL_34;
          }
          uint64_t v35 = [(MapsSuggestionsEntry *)v16 geoMapItem];

          if (v35)
          {
            v34 = [(MapsSuggestionsEntry *)v16 geoMapItem];
            [(MapsSuggestionsEntry *)self setGeoMapItem:v34];
            goto LABEL_33;
          }
        }
LABEL_34:
        if (!a8)
        {
          [(MapsSuggestionsEntry *)self weight];
          if (v36 == 0.0)
          {
            [(MapsSuggestionsEntry *)v16 weight];
            if (v37 != 0.0)
            {
              [(MapsSuggestionsEntry *)v16 weight];
              -[MapsSuggestionsEntry setWeight:](self, "setWeight:");
            }
          }
        }
        if (a9) {
          goto LABEL_50;
        }
        v38 = self;
        v39 = v16;
        if (!v38)
        {
          v41 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v88 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
            __int16 v89 = 1024;
            int v90 = 51;
            __int16 v91 = 2082;
            v92 = "NSDate *_mergeExpirationOfEntries(MapsSuggestionsEntry *__strong, MapsSuggestionsEntry *__strong)";
            __int16 v93 = 2082;
            v94 = "nil == (a)";
            _os_log_impl(&dword_1A70DF000, v41, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry A", buf, 0x26u);
          }

          v40 = 0;
          goto LABEL_49;
        }
        if ([(MapsSuggestionsEntry *)v38 deleted] || [(MapsSuggestionsEntry *)v39 deleted])
        {
          v40 = [MEMORY[0x1E4F1C9C8] distantPast];
LABEL_49:

          [(MapsSuggestionsEntry *)v38 setExpires:v40];
LABEL_50:
          BOOL v42 = [(MapsSuggestionsEntry *)v16 deleted] || [(MapsSuggestionsEntry *)self deleted];
          [(MapsSuggestionsEntry *)self setDeleted:v42];
          [(MapsSuggestionsEntry *)self mergeSpecificsFromSuggestionEntry:v16 behavior:0];
          goto LABEL_114;
        }
        v74 = [(MapsSuggestionsEntry *)v38 expires];
        if (v74)
        {
        }
        else
        {
          v40 = [(MapsSuggestionsEntry *)v39 expires];

          if (!v40) {
            goto LABEL_49;
          }
        }
        v76 = [(MapsSuggestionsEntry *)v38 expires];

        v77 = [(MapsSuggestionsEntry *)v39 expires];
        v40 = v77;
        if (v76)
        {

          uint64_t v78 = [(MapsSuggestionsEntry *)v38 expires];
          v79 = (void *)v78;
          if (v40)
          {
            v80 = [(MapsSuggestionsEntry *)v39 expires];
            v40 = [v79 laterDate:v80];
          }
          else
          {
            v40 = (void *)v78;
          }
        }
        goto LABEL_49;
      }
      v30 = [(MapsSuggestionsEntry *)v16 title];
      [(MapsSuggestionsEntry *)self setTitle:v30];
    }

    goto LABEL_25;
  }
LABEL_114:
}

- (GEOMapItemStorage)geoMapItem
{
  return self->_geoMapItem;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MapsSuggestionsEntry *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MapsSuggestionsEntry *)self isEqualToEntry:v4];
  }

  return v5;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (double)weight
{
  return self->_weight;
}

- (NSString)originatingSourceName
{
  return self->_originatingSourceName;
}

- (BOOL)isEqualToEntry:(id)a3
{
  id v4 = (MapsSuggestionsEntry *)a3;
  if (self == v4)
  {
    char v40 = 1;
  }
  else
  {
    int64_t v5 = [(MapsSuggestionsEntry *)self type];
    if (v5 != [(MapsSuggestionsEntry *)v4 type]) {
      goto LABEL_18;
    }
    uint64_t v6 = [(MapsSuggestionsEntry *)self undecoratedTitle];
    v7 = [(MapsSuggestionsEntry *)v4 undecoratedTitle];

    if (v6 != v7)
    {
      uint64_t v8 = [(MapsSuggestionsEntry *)self undecoratedTitle];
      v9 = [(MapsSuggestionsEntry *)v4 undecoratedTitle];
      char v10 = [v8 isEqualToString:v9];

      if ((v10 & 1) == 0) {
        goto LABEL_18;
      }
    }
    v11 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
    uint64_t v12 = [(MapsSuggestionsEntry *)v4 undecoratedSubtitle];

    if (v11 != v12)
    {
      uint64_t v13 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
      uint64_t v14 = [(MapsSuggestionsEntry *)v4 undecoratedSubtitle];
      char v15 = [v13 isEqualToString:v14];

      if ((v15 & 1) == 0) {
        goto LABEL_18;
      }
    }
    uint64_t v16 = [(MapsSuggestionsEntry *)self title];
    BOOL v17 = [(MapsSuggestionsEntry *)v4 title];

    if (v16 != v17)
    {
      uint64_t v18 = [(MapsSuggestionsEntry *)self title];
      uint64_t v19 = [(MapsSuggestionsEntry *)v4 title];
      char v20 = [v18 isEqualToString:v19];

      if ((v20 & 1) == 0) {
        goto LABEL_18;
      }
    }
    v21 = [(MapsSuggestionsEntry *)self subtitle];
    double v22 = [(MapsSuggestionsEntry *)v4 subtitle];

    if (v21 != v22)
    {
      char v23 = [(MapsSuggestionsEntry *)self subtitle];
      v24 = [(MapsSuggestionsEntry *)v4 subtitle];
      char v25 = [v23 isEqualToString:v24];

      if ((v25 & 1) == 0) {
        goto LABEL_18;
      }
    }
    v26 = [(MapsSuggestionsEntry *)self expires];
    uint64_t v27 = [(MapsSuggestionsEntry *)v4 expires];

    if (v26 != v27)
    {
      v28 = [(MapsSuggestionsEntry *)self expires];
      uint64_t v29 = [(MapsSuggestionsEntry *)v4 expires];
      char v30 = [v28 isEqualToDate:v29];

      if ((v30 & 1) == 0) {
        goto LABEL_18;
      }
    }
    v31 = [(MapsSuggestionsEntry *)self geoMapItem];
    uint64_t v32 = [(MapsSuggestionsEntry *)v4 geoMapItem];

    if (v31 == v32
      || ([(MapsSuggestionsEntry *)self geoMapItem],
          v33 = objc_claimAutoreleasedReturnValue(),
          [(MapsSuggestionsEntry *)v4 geoMapItem],
          v34 = objc_claimAutoreleasedReturnValue(),
          char v35 = MapsSuggestionsMapItemsAreEqual(v33, v34, 1, 1, 1),
          v34,
          v33,
          (v35 & 1) != 0))
    {
      double v36 = self;
      objc_sync_enter(v36);
      double v37 = (void *)[(NSMutableDictionary *)v36->_sourceSpecificInfo copy];
      objc_sync_exit(v36);

      id v38 = v37;
      if (v4)
      {
        v39 = v4;
        objc_sync_enter(v39);
        char v40 = [v39[2] isEqualToDictionary:v38];
        objc_sync_exit(v39);
      }
      else
      {
        char v40 = 0;
      }
    }
    else
    {
LABEL_18:
      char v40 = 0;
    }
  }

  return v40;
}

- (NSString)undecoratedSubtitle
{
  return self->_undecoratedSubtitle;
}

- (NSString)undecoratedTitle
{
  return self->_undecoratedTitle;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)integerForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  v7 = v6;
  if (v6)
  {
    int64_t v8 = [v6 integerValue];
  }
  else
  {
    v9 = (void *)[[NSString alloc] initWithFormat:@"Defaulting to 0 instead of nil integer value for key '%@'", v4];
    char v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    int64_t v8 = 0;
  }

  return v8;
}

- (NSString)uniqueIdentifier
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsPrimaryKey"])
  {
    v3 = [(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsPrimaryKey"];
    if ([(MapsSuggestionsEntry *)self containsKey:v3])
    {
      uint64_t v4 = [(MapsSuggestionsEntry *)self stringForKey:v3];
    }
    else
    {
      uint64_t v6 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
        __int16 v10 = 1024;
        int v11 = 334;
        __int16 v12 = 2082;
        uint64_t v13 = "-[MapsSuggestionsEntry uniqueIdentifier]";
        __int16 v14 = 2082;
        char v15 = "![self containsKey:primaryKey]";
        _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Suggestion Entry requires primary key value", buf, 0x26u);
      }

      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p", self);
    }
    uint64_t v5 = (void *)v4;
  }
  else
  {
    uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p", self);
  }
  return (NSString *)v5;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (id)_valueForKey:(uint64_t)a3 class:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if (v5)
    {
      if (a3)
      {
        v7 = a1;
        objc_sync_enter(v7);
        int64_t v8 = [(objc_class *)v7[2].isa objectForKey:v6];
        if (v8)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
          }
          else
          {
            int v11 = (void *)[[NSString alloc] initWithFormat:@"The class of key '%@' is not '%@'", v6, a3];
            __int16 v12 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v16 = "-[MapsSuggestionsEntry _valueForKey:class:]";
              __int16 v17 = 2112;
              *(void *)uint64_t v18 = v11;
              _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "%s failure: %@", buf, 0x16u);
            }

            id v13 = v8;
          }
        }

        objc_sync_exit(v7);
        goto LABEL_17;
      }
      v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
        __int16 v17 = 1024;
        *(_DWORD *)uint64_t v18 = 459;
        *(_WORD *)&v18[4] = 2082;
        *(void *)&v18[6] = "-[MapsSuggestionsEntry _valueForKey:class:]";
        __int16 v19 = 2082;
        char v20 = "nil == (klass)";
        __int16 v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class";
        goto LABEL_11;
      }
    }
    else
    {
      v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
        __int16 v17 = 1024;
        *(_DWORD *)uint64_t v18 = 458;
        *(_WORD *)&v18[4] = 2082;
        *(void *)&v18[6] = "-[MapsSuggestionsEntry _valueForKey:class:]";
        __int16 v19 = 2082;
        char v20 = "nil == (key)";
        __int16 v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key";
LABEL_11:
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, v10, buf, 0x26u);
      }
    }
    int64_t v8 = 0;
LABEL_17:

    goto LABEL_18;
  }
  int64_t v8 = 0;
LABEL_18:

  return v8;
}

- (BOOL)containsKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [(NSMutableDictionary *)v5->_sourceSpecificInfo objectForKey:v4];
    BOOL v7 = v6 != 0;

    objc_sync_exit(v5);
  }
  else
  {
    int64_t v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      int v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      __int16 v12 = 1024;
      int v13 = 449;
      __int16 v14 = 2082;
      char v15 = "-[MapsSuggestionsEntry containsKey:]";
      __int16 v16 = 2082;
      __int16 v17 = "nil == (key)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v10, 0x26u);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)hasExpired
{
  v3 = [(MapsSuggestionsEntry *)self expires];

  if (v3)
  {
    id v4 = [(MapsSuggestionsEntry *)self expires];
    LOBYTE(v3) = MapsSuggestionsIsInThePast(v4);
  }
  return (char)v3;
}

- (NSDate)expires
{
  return self->_expires;
}

- (BOOL)updateUndecoratedTitle:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      __int16 v13 = 1024;
      int v14 = 97;
      __int16 v15 = 2082;
      __int16 v16 = "-[MapsSuggestionsEntry(BusinessLogic) updateUndecoratedTitle:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (undecoratedTitle)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a title", (uint8_t *)&v11, 0x26u);
    }

    goto LABEL_7;
  }
  id v5 = [(MapsSuggestionsEntry *)self undecoratedTitle];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  BOOL v7 = (void *)[v4 copy];
  [(MapsSuggestionsEntry *)self setUndecoratedTitle:v7];

  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (void)mergeSpecificsFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      __int16 v27 = 1024;
      int v28 = 288;
      __int16 v29 = 2082;
      char v30 = "-[MapsSuggestionsEntry(BusinessLogic) mergeSpecificsFromSuggestionEntry:behavior:]";
      __int16 v31 = 2082;
      uint64_t v32 = "nil == (otherEntry)";
      __int16 v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an other suggestions entry";
LABEL_16:
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v25, 0x26u);
    }
LABEL_17:

    goto LABEL_18;
  }
  BOOL v7 = self;
  objc_sync_enter(v7);
  BOOL v8 = [(MapsSuggestionsEntry *)v7 sourceSpecificInfo];
  id v9 = [v6 sourceSpecificInfo];
  char v10 = [v8 isEqualToDictionary:v9];

  if (v10)
  {
    int v11 = 1;
    goto LABEL_13;
  }
  int v14 = [(MapsSuggestionsEntry *)v7 ETAForKey:@"MapsSuggestionsETAKey"];
  __int16 v15 = [(MapsSuggestionsEntry *)v7 stringForKey:@"MapsSuggestionsDestinationForETAKey"];
  if (a4)
  {
    if (a4 != 1)
    {
      int v11 = 0;
      goto LABEL_12;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
    __int16 v17 = [(MapsSuggestionsEntry *)v7 sourceSpecificInfo];
    uint64_t v18 = (void *)[v16 initWithDictionary:v17];

    uint64_t v19 = [v6 sourceSpecificInfo];
    [v18 addEntriesFromDictionary:v19];

    char v20 = (void *)[v18 mutableCopy];
    [(MapsSuggestionsEntry *)v7 setSourceSpecificInfo:v20];

    -[MapsSuggestionsEntry _selectETAFrom:destinationKey:otherEntry:](v7, v14, v15, v6);
  }
  else
  {
    id v21 = objc_alloc(MEMORY[0x1E4F1CA60]);
    double v22 = [v6 sourceSpecificInfo];
    uint64_t v18 = (void *)[v21 initWithDictionary:v22];

    char v23 = [(MapsSuggestionsEntry *)v7 sourceSpecificInfo];
    [v18 addEntriesFromDictionary:v23];

    v24 = (void *)[v18 mutableCopy];
    [(MapsSuggestionsEntry *)v7 setSourceSpecificInfo:v24];

    -[MapsSuggestionsEntry _selectETAFrom:destinationKey:otherEntry:](v7, v14, v15, v6);
  }

  int v11 = 1;
LABEL_12:

LABEL_13:
  objc_sync_exit(v7);

  if (!v11)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v25 = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      __int16 v27 = 1024;
      int v28 = 321;
      __int16 v29 = 2082;
      char v30 = "-[MapsSuggestionsEntry(BusinessLogic) mergeSpecificsFromSuggestionEntry:behavior:]";
      __int16 v31 = 2082;
      uint64_t v32 = "YES";
      __int16 v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsMergeBehavior!";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (id)sourceSpecificInfo
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_sourceSpecificInfo;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)updateUndecoratedSubtitle:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      __int16 v13 = 1024;
      int v14 = 108;
      __int16 v15 = 2082;
      id v16 = "-[MapsSuggestionsEntry(BusinessLogic) updateUndecoratedSubtitle:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (undecoratedSubtitle)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a subtitle", (uint8_t *)&v11, 0x26u);
    }

    goto LABEL_7;
  }
  id v5 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  BOOL v7 = (void *)[v4 copy];
  [(MapsSuggestionsEntry *)self setUndecoratedSubtitle:v7];

  BOOL v8 = 1;
LABEL_8:

  return v8;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    -[MapsSuggestionsEntry setExpires:](self, "setExpires:");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAvailableRemovalBehavior:(int64_t)a3
{
  int64_t v4 = [(MapsSuggestionsEntry *)self availableRemovalBehaviors] | a3;
  [(MapsSuggestionsEntry *)self setInteger:v4 forKey:@"MapsSuggestionsRemovalBehaviorKey"];
}

- (int64_t)availableRemovalBehaviors
{
  return [(MapsSuggestionsEntry *)self integerForKey:@"MapsSuggestionsRemovalBehaviorKey"];
}

- (void)setBoolean:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  char v6 = [NSNumber numberWithBool:v4];
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v6, v8, v7);
}

- (void)_setValue:(void *)a3 forKey:(uint64_t)a4 class:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = v8;
  if (!a1) {
    goto LABEL_14;
  }
  if (!v8)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      int v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      __int16 v15 = 1024;
      int v16 = 355;
      __int16 v17 = 2082;
      uint64_t v18 = "-[MapsSuggestionsEntry _setValue:forKey:class:]";
      __int16 v19 = 2082;
      char v20 = "nil == (key)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a key", (uint8_t *)&v13, 0x26u);
    }
    goto LABEL_8;
  }
  if (!a4)
  {
    __int16 v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446978;
      int v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      __int16 v15 = 1024;
      int v16 = 356;
      __int16 v17 = 2082;
      uint64_t v18 = "-[MapsSuggestionsEntry _setValue:forKey:class:]";
      __int16 v19 = 2082;
      char v20 = "nil == (klass)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a class", (uint8_t *)&v13, 0x26u);
    }
LABEL_8:

    goto LABEL_14;
  }
  char v10 = a1;
  objc_sync_enter(v10);
  int v11 = (void *)v10[2];
  if (v7) {
    [v11 setObject:v7 forKey:v9];
  }
  else {
    [v11 removeObjectForKey:v9];
  }
  objc_sync_exit(v10);

LABEL_14:
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  id v8 = a4;
  char v6 = [NSNumber numberWithInteger:a3];
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v6, v8, v7);
}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (void)_overrideType:(int64_t)a3
{
  self->_type = a3;
  obj = self;
  objc_sync_enter(obj);
  typeHistory = obj->_typeHistory;
  if (!typeHistory)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    id v6 = obj->_typeHistory;
    obj->_typeHistory = (NSMutableSet *)v5;

    typeHistory = obj->_typeHistory;
  }
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  [(NSMutableSet *)typeHistory addObject:v7];

  objc_sync_exit(obj);
}

- (void)setNumber:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [+[MapsSuggestionsEntry allocWithZone:a3] initWithType:self->_type title:self->_title subtitle:self->_subtitle weight:self->_expires expires:self->_geoMapItem geoMapItem:0 sourceSpecificInfo:self->_weight];
  uint64_t v5 = [(NSString *)self->_undecoratedTitle copy];
  undecoratedTitle = v4->_undecoratedTitle;
  v4->_undecoratedTitle = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_undecoratedSubtitle copy];
  undecoratedSubtitle = v4->_undecoratedSubtitle;
  v4->_undecoratedSubtitle = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_title copy];
  title = v4->_title;
  v4->_title = (NSString *)v9;

  uint64_t v11 = [(NSString *)self->_subtitle copy];
  subtitle = v4->_subtitle;
  v4->_subtitle = (NSString *)v11;

  int v13 = self;
  objc_sync_enter(v13);
  uint64_t v14 = [(NSString *)v13->_originatingSourceName copy];
  originatingSourceName = v4->_originatingSourceName;
  v4->_originatingSourceName = (NSString *)v14;

  uint64_t v16 = [(NSMutableDictionary *)v13->_sourceSpecificInfo mutableCopy];
  sourceSpecificInfo = v4->_sourceSpecificInfo;
  v4->_sourceSpecificInfo = (NSMutableDictionary *)v16;

  objc_sync_exit(v13);
  return v4;
}

- (MapsSuggestionsEntry)initWithType:(int64_t)a3 title:(id)a4 subtitle:(id)a5 weight:(double)a6 expires:(id)a7 geoMapItem:(id)a8 sourceSpecificInfo:(id)a9
{
  id v26 = a4;
  id v25 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MapsSuggestionsEntry;
  char v20 = [(MapsSuggestionsEntry *)&v27 init];
  uint64_t v21 = v20;
  if (v20)
  {
    -[MapsSuggestionsEntry _overrideType:](v20, "_overrideType:", a3, v25, v26);
    objc_storeStrong((id *)&v21->_undecoratedTitle, a4);
    objc_storeStrong((id *)&v21->_title, v21->_undecoratedTitle);
    objc_storeStrong((id *)&v21->_undecoratedSubtitle, a5);
    objc_storeStrong((id *)&v21->_subtitle, v21->_undecoratedSubtitle);
    v21->_weight = a6;
    objc_storeStrong((id *)&v21->_expires, a7);
    objc_storeStrong((id *)&v21->_geoMapItem, a8);
    if (v19) {
      double v22 = (NSMutableDictionary *)[v19 mutableCopy];
    }
    else {
      double v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    sourceSpecificInfo = v21->_sourceSpecificInfo;
    v21->_sourceSpecificInfo = v22;
  }
  return v21;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void)setUndecoratedSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_undecoratedSubtitle, a3);
  id v5 = a3;
  [(MapsSuggestionsEntry *)self setSubtitle:self->_undecoratedSubtitle];
}

- (void)setSubtitle:(id)a3
{
}

- (void)setExpires:(id)a3
{
}

- (MapsSuggestionsEntry)initWithType:(int64_t)a3 title:(id)a4
{
  return [(MapsSuggestionsEntry *)self initWithType:a3 title:a4 subtitle:0 weight:0 expires:0 geoMapItem:0 sourceSpecificInfo:0.0];
}

- (void)setGeoMapItem:(id)a3
{
}

- (void)setContacts:(id)a3
{
  id v5 = a3;
  uint64_t v4 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v5, @"MapsSuggestionsShortcutContactsKey", v4);
}

- (BOOL)BOOLeanForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  uint64_t v7 = v6;
  if (v6)
  {
    char v8 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"Defaulting to NO instead of nil BOOLean value for key '%@'", v4];
    char v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      int v13 = v9;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    char v8 = 0;
  }

  return v8;
}

- (BOOL)isPureShortcut
{
  if (![(MapsSuggestionsEntry *)self isShortcut]
    || ![(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsShortcutOnlyKey"])
  {
    return 0;
  }
  return [(MapsSuggestionsEntry *)self BOOLeanForKey:@"MapsSuggestionsShortcutOnlyKey"];
}

- (BOOL)isShortcutForSetup
{
  if (![(MapsSuggestionsEntry *)self isShortcut]
    || ![(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsShortcutSetupKey"])
  {
    return 0;
  }
  return [(MapsSuggestionsEntry *)self BOOLeanForKey:@"MapsSuggestionsShortcutSetupKey"];
}

- (void)setETA:(id)a3 forKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v11, v6, v7);
  if (v11)
  {
    char v8 = MapsSuggestionsDestinationKey(self);
    uint64_t v9 = objc_opt_class();
    -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, @"MapsSuggestionsDestinationForETAKey", v9);
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    -[MapsSuggestionsEntry _setValue:forKey:class:](self, 0, @"MapsSuggestionsDestinationForETAKey", v10);
  }
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (void)setOriginatingSourceName:(id)a3
{
}

void __38__MapsSuggestionsEntry_initWithCoder___block_invoke()
{
  id v20 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v19 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v20, "initWithObjects:", v19, v18, v17, v16, v0, v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  uint64_t v10 = (void *)qword_1EB6F0270;
  qword_1EB6F0270 = v9;

  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
  __int16 v15 = (void *)qword_1EB6F0278;
  qword_1EB6F0278 = v14;
}

- (BOOL)startsBeforeEntry:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      __int16 v13 = 1024;
      int v14 = 129;
      __int16 v15 = 2082;
      uint64_t v16 = "-[MapsSuggestionsEntry(BusinessLogic) startsBeforeEntry:]";
      __int16 v17 = 2082;
      uint64_t v18 = "nil == (otherEntry)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires another suggestions entry", (uint8_t *)&v11, 0x26u);
    }

    goto LABEL_8;
  }
  if (!-[MapsSuggestionsEntry hasStartTime](self, "hasStartTime") || ![v4 hasStartTime])
  {
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [(MapsSuggestionsEntry *)self startTime];
  uint64_t v6 = [v4 startTime];
  [v5 timeIntervalSinceDate:v6];
  BOOL v8 = v7 < 0.0;

LABEL_9:
  return v8;
}

- (BOOL)expiresBeforeEntry:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
      __int16 v16 = 1024;
      int v17 = 140;
      __int16 v18 = 2082;
      uint64_t v19 = "-[MapsSuggestionsEntry(BusinessLogic) expiresBeforeEntry:]";
      __int16 v20 = 2082;
      uint64_t v21 = "nil == (otherEntry)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires another suggestion entry", (uint8_t *)&v14, 0x26u);
    }

LABEL_8:
    BOOL v11 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = [v4 expires];

  if (!v6)
  {
    BOOL v11 = 1;
    goto LABEL_10;
  }
  double v7 = [(MapsSuggestionsEntry *)self expires];

  if (!v7) {
    goto LABEL_8;
  }
  BOOL v8 = [(MapsSuggestionsEntry *)self expires];
  uint64_t v9 = [v5 expires];
  [v8 timeIntervalSinceDate:v9];
  BOOL v11 = v10 < 0.0;

LABEL_10:
  return v11;
}

- (void)mergeFromSuggestionEntry:(id)a3 behavior:(unint64_t)a4
{
  LOWORD(v4) = 0;
  -[MapsSuggestionsEntry mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:](self, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", a3, a4, 0, 1, 0, 0, v4);
}

- (void)_selectETAFrom:(void *)a3 destinationKey:(void *)a4 otherEntry:
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = MapsSuggestionsDestinationKey(a1);
    double v10 = [a1 stringForKey:@"MapsSuggestionsDestinationForETAKey"];
    char v11 = [v9 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      if ([v9 isEqualToString:v7])
      {
        uint64_t v12 = a1;
        id v13 = v17;
LABEL_8:
        [v12 setETA:v13 forKey:@"MapsSuggestionsETAKey"];
        goto LABEL_9;
      }
      int v14 = [v8 stringForKey:@"MapsSuggestionsDestinationForETAKey"];
      int v15 = [v9 isEqualToString:v14];

      if (!v15)
      {
        uint64_t v12 = a1;
        id v13 = 0;
        goto LABEL_8;
      }
      __int16 v16 = [v8 ETAForKey:@"MapsSuggestionsETAKey"];
      [a1 setETA:v16 forKey:@"MapsSuggestionsETAKey"];
    }
LABEL_9:
  }
}

- (void)replaceByEntry:(id)a3
{
}

- (void)replaceByEntry:(id)a3 forceDecoratedOverwrites:(BOOL)a4
{
  BOOL v69 = a4;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = [(MapsSuggestionsEntry *)self undecoratedTitle];
    if (v8)
    {
      uint64_t v4 = [(MapsSuggestionsEntry *)self undecoratedTitle];
      uint64_t v5 = [v7 undecoratedTitle];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_11:
        id v8 = [v7 undecoratedTitle];
        [(MapsSuggestionsEntry *)self setUndecoratedTitle:v8];
LABEL_14:

        goto LABEL_15;
      }
    }
    double v10 = [v7 undecoratedTitle];
    if (v10)
    {
      char v11 = [v7 undecoratedTitle];
      uint64_t v12 = [(MapsSuggestionsEntry *)self undecoratedTitle];
      char v13 = [v11 isEqual:v12];

      if (v8)
      {
      }
      if ((v13 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else if (v8)
    {

      goto LABEL_14;
    }
LABEL_15:
    int v14 = [(MapsSuggestionsEntry *)self undecoratedTitleWhenLocked];
    if (v14)
    {
      uint64_t v4 = [(MapsSuggestionsEntry *)self undecoratedTitleWhenLocked];
      uint64_t v5 = [v7 undecoratedTitleWhenLocked];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_22:
        int v14 = [v7 undecoratedTitleWhenLocked];
        [(MapsSuggestionsEntry *)self setUndecoratedTitleWhenLocked:v14];
LABEL_25:

        goto LABEL_26;
      }
    }
    int v15 = [v7 undecoratedTitleWhenLocked];
    if (v15)
    {
      __int16 v16 = [v7 undecoratedTitleWhenLocked];
      id v17 = [(MapsSuggestionsEntry *)self undecoratedTitleWhenLocked];
      char v18 = [v16 isEqual:v17];

      if (v14)
      {
      }
      if ((v18 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else if (v14)
    {

      goto LABEL_25;
    }
LABEL_26:
    uint64_t v19 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
    if (v19)
    {
      uint64_t v4 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
      uint64_t v5 = [v7 undecoratedSubtitle];
      if (([v4 isEqual:v5] & 1) == 0)
      {

LABEL_33:
        uint64_t v19 = [v7 undecoratedSubtitle];
        [(MapsSuggestionsEntry *)self setUndecoratedSubtitle:v19];
LABEL_36:

        goto LABEL_37;
      }
    }
    __int16 v20 = [v7 undecoratedSubtitle];
    if (v20)
    {
      uint64_t v21 = [v7 undecoratedSubtitle];
      uint64_t v22 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
      char v23 = [v21 isEqual:v22];

      if (v19)
      {
      }
      if ((v23 & 1) == 0) {
        goto LABEL_33;
      }
    }
    else if (v19)
    {

      goto LABEL_36;
    }
LABEL_37:
    v24 = [(MapsSuggestionsEntry *)self undecoratedSubtitleWhenLocked];
    if (!v24
      || ([(MapsSuggestionsEntry *)self undecoratedSubtitleWhenLocked],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v7 undecoratedSubtitleWhenLocked],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          ([v4 isEqual:v5] & 1) != 0))
    {
      id v25 = [v7 undecoratedSubtitleWhenLocked];
      if (!v25)
      {
        if (!v24) {
          goto LABEL_48;
        }

        goto LABEL_47;
      }
      id v26 = [v7 undecoratedSubtitleWhenLocked];
      objc_super v27 = [(MapsSuggestionsEntry *)self undecoratedSubtitleWhenLocked];
      char v28 = [v26 isEqual:v27];

      if (v24)
      {
      }
      if (v28)
      {
LABEL_48:
        if (!v69) {
          goto LABEL_93;
        }
        __int16 v29 = [(MapsSuggestionsEntry *)self title];
        if (v29)
        {
          v24 = [(MapsSuggestionsEntry *)self title];
          uint64_t v4 = [v7 title];
          if (([v24 isEqual:v4] & 1) == 0)
          {

LABEL_56:
            __int16 v29 = [v7 title];
            [(MapsSuggestionsEntry *)self setTitle:v29];
LABEL_59:

            goto LABEL_60;
          }
        }
        char v30 = [v7 title];
        if (v30)
        {
          __int16 v31 = [v7 title];
          uint64_t v32 = [(MapsSuggestionsEntry *)self title];
          char v33 = [v31 isEqual:v32];

          if (v29)
          {
          }
          if ((v33 & 1) == 0) {
            goto LABEL_56;
          }
        }
        else if (v29)
        {

          goto LABEL_59;
        }
LABEL_60:
        v34 = [(MapsSuggestionsEntry *)self titleWhenLocked];
        if (v34)
        {
          v24 = [(MapsSuggestionsEntry *)self titleWhenLocked];
          uint64_t v4 = [v7 titleWhenLocked];
          if (([v24 isEqual:v4] & 1) == 0)
          {

LABEL_67:
            v34 = [v7 titleWhenLocked];
            [(MapsSuggestionsEntry *)self setTitleWhenLocked:v34];
LABEL_70:

            goto LABEL_71;
          }
        }
        char v35 = [v7 titleWhenLocked];
        if (v35)
        {
          double v36 = [v7 titleWhenLocked];
          double v37 = [(MapsSuggestionsEntry *)self titleWhenLocked];
          char v38 = [v36 isEqual:v37];

          if (v34)
          {
          }
          if ((v38 & 1) == 0) {
            goto LABEL_67;
          }
        }
        else if (v34)
        {

          goto LABEL_70;
        }
LABEL_71:
        v39 = [(MapsSuggestionsEntry *)self subtitle];
        if (!v39
          || ([(MapsSuggestionsEntry *)self subtitle],
              v24 = objc_claimAutoreleasedReturnValue(),
              [v7 subtitle],
              uint64_t v4 = objc_claimAutoreleasedReturnValue(),
              ([v24 isEqual:v4] & 1) != 0))
        {
          char v40 = [v7 subtitle];
          if (!v40)
          {
            if (!v39) {
              goto LABEL_82;
            }

LABEL_81:
LABEL_82:
            uint64_t v44 = [(MapsSuggestionsEntry *)self subtitleWhenLocked];
            if (v44)
            {
              v24 = [(MapsSuggestionsEntry *)self subtitleWhenLocked];
              uint64_t v4 = [v7 subtitleWhenLocked];
              if (([v24 isEqual:v4] & 1) == 0)
              {

LABEL_89:
                uint64_t v44 = [v7 subtitleWhenLocked];
                [(MapsSuggestionsEntry *)self setSubtitleWhenLocked:v44];
LABEL_92:

                goto LABEL_93;
              }
            }
            v45 = [v7 subtitleWhenLocked];
            if (v45)
            {
              char v46 = [v7 subtitleWhenLocked];
              uint64_t v47 = [(MapsSuggestionsEntry *)self subtitleWhenLocked];
              char v48 = [v46 isEqual:v47];

              if (v44)
              {
              }
              if ((v48 & 1) == 0) {
                goto LABEL_89;
              }
            }
            else if (v44)
            {

              goto LABEL_92;
            }
LABEL_93:
            v49 = [(MapsSuggestionsEntry *)self geoMapItem];
            if (v49)
            {
              v24 = [(MapsSuggestionsEntry *)self geoMapItem];
              uint64_t v4 = [v7 geoMapItem];
              if (([v24 isEqual:v4] & 1) == 0)
              {

LABEL_100:
                v49 = [v7 geoMapItem];
                [(MapsSuggestionsEntry *)self setGeoMapItem:v49];
LABEL_103:

                goto LABEL_104;
              }
            }
            v50 = [v7 geoMapItem];
            if (v50)
            {
              char v51 = [v7 geoMapItem];
              v52 = [(MapsSuggestionsEntry *)self geoMapItem];
              char v53 = [v51 isEqual:v52];

              if (v49)
              {
              }
              if ((v53 & 1) == 0) {
                goto LABEL_100;
              }
            }
            else if (v49)
            {

              goto LABEL_103;
            }
LABEL_104:
            v54 = [(MapsSuggestionsEntry *)self expires];
            if (!v54
              || ([(MapsSuggestionsEntry *)self expires],
                  v24 = objc_claimAutoreleasedReturnValue(),
                  [v7 expires],
                  uint64_t v4 = objc_claimAutoreleasedReturnValue(),
                  ([v24 isEqual:v4] & 1) != 0))
            {
              uint64_t v55 = [v7 expires];
              if (!v55)
              {
                if (!v54)
                {
LABEL_115:
                  int64_t v59 = [(MapsSuggestionsEntry *)self type];
                  if (v59 != [v7 type]) {
                    -[MapsSuggestionsEntry _overrideType:](self, "_overrideType:", [v7 type]);
                  }
                  [(MapsSuggestionsEntry *)self setIconData:0];
                  [v7 weight];
                  -[MapsSuggestionsEntry setWeight:](self, "setWeight:");
                  uint64_t v9 = [(MapsSuggestionsEntry *)self originatingSourceName];
                  double v60 = [v7 originatingSourceName];
                  if (([v9 isEqualToString:v60] & 1) == 0) {
                    [(MapsSuggestionsEntry *)self setString:v60 forKey:@"MapsSuggestionsNewSourceKey"];
                  }
                  double v61 = self;
                  objc_sync_enter(v61);
                  double v62 = [v7 sourceSpecificInfo];
                  v63 = (void *)[v62 copy];
                  [(MapsSuggestionsEntry *)v61 setSourceSpecificInfo:v63];

                  objc_sync_exit(v61);
                  int64_t v64 = v61;
                  id v65 = v7;
                  if (v64)
                  {
                    v66 = [(MapsSuggestionsEntry *)v64 originatingSourceName];
                    v67 = [v65 originatingSourceName];
                    if (v66 && ([v66 isEqualToString:v67] & 1) == 0) {
                      [(MapsSuggestionsEntry *)v64 setString:v67 forKey:@"MapsSuggestionsNewSourceKey"];
                    }
                  }
                  else
                  {
                    GEOFindOrCreateLog();
                    v68 = (id)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136446978;
                      v71 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
                      __int16 v72 = 1024;
                      int v73 = 81;
                      __int16 v74 = 2082;
                      v75 = "void _mergeOriginsOfEntries(MapsSuggestionsEntry *__strong, MapsSuggestionsEntry *__strong)";
                      __int16 v76 = 2082;
                      v77 = "nil == (oriEntry)";
                      _os_log_impl(&dword_1A70DF000, v68, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion oriEntry", buf, 0x26u);
                    }
                  }
                  goto LABEL_128;
                }

LABEL_114:
                goto LABEL_115;
              }
              v56 = [v7 expires];
              v57 = [(MapsSuggestionsEntry *)self expires];
              char v58 = [v56 isEqual:v57];

              if (v54)
              {
              }
              if (v58) {
                goto LABEL_115;
              }
            }
            else
            {
            }
            v54 = [v7 expires];
            [(MapsSuggestionsEntry *)self setExpires:v54];
            goto LABEL_114;
          }
          v41 = [v7 subtitle];
          BOOL v42 = [(MapsSuggestionsEntry *)self subtitle];
          char v43 = [v41 isEqual:v42];

          if (v39)
          {
          }
          if (v43) {
            goto LABEL_82;
          }
        }
        else
        {
        }
        v39 = [v7 subtitle];
        [(MapsSuggestionsEntry *)self setSubtitle:v39];
        goto LABEL_81;
      }
    }
    else
    {
    }
    v24 = [v7 undecoratedSubtitleWhenLocked];
    [(MapsSuggestionsEntry *)self setUndecoratedSubtitleWhenLocked:v24];
LABEL_47:

    goto LABEL_48;
  }
  uint64_t v9 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v71 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry+BusinessLogic.m";
    __int16 v72 = 1024;
    int v73 = 331;
    __int16 v74 = 2082;
    v75 = "-[MapsSuggestionsEntry(BusinessLogic) replaceByEntry:forceDecoratedOverwrites:]";
    __int16 v76 = 2082;
    v77 = "nil == (otherEntry)";
    _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an other suggestions entry", buf, 0x26u);
  }
LABEL_128:
}

- (BOOL)hasStartTime
{
  return [(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsScheduledTimeKey"];
}

- (BOOL)hasEndTime
{
  return [(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsScheduledEndTimeKey"];
}

- (BOOL)hasStartAndEndTime
{
  BOOL v3 = [(MapsSuggestionsEntry *)self hasStartTime];
  if (v3)
  {
    LOBYTE(v3) = [(MapsSuggestionsEntry *)self hasEndTime];
  }
  return v3;
}

- (id)startTime
{
  return [(MapsSuggestionsEntry *)self dateForKey:@"MapsSuggestionsScheduledTimeKey"];
}

- (id)endTime
{
  return [(MapsSuggestionsEntry *)self dateForKey:@"MapsSuggestionsScheduledEndTimeKey"];
}

- (BOOL)hasEssentialFlightInfo
{
  if ([(MapsSuggestionsEntry *)self type] != 15
    || ![(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsFlightDepartureTimeKey"]
    || ![(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsFullFlightNumberKey"])
  {
    return 0;
  }
  return [(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsEntryTitleNameKey"];
}

- (BOOL)hasFullFlightInfoAndGate
{
  if (![(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsFlightDepartureGateKey"]
    || ![(MapsSuggestionsEntry *)self BOOLeanForKey:@"MapsSuggestionsFlightMapItemIsGateKey" is:1]|| ![(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsFlightStatusKey"])
  {
    return 0;
  }
  return [(MapsSuggestionsEntry *)self hasEssentialFlightInfo];
}

- (id)departingAirportCode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsEntry *)self hasEssentialFlightInfo])
  {
    BOOL v3 = [(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
    if ([v3 length] == 3)
    {
      BOOL v3 = v3;
      uint64_t v4 = v3;
      goto LABEL_10;
    }
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446978;
      id v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v9 = 1024;
      int v10 = 397;
      __int16 v11 = 2082;
      uint64_t v12 = "-[MapsSuggestionsEntry(Flight) departingAirportCode]";
      __int16 v13 = 2082;
      int v14 = "3u != airportCode.length";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Post-condition: IATA airport codes should always be 3 characters!", (uint8_t *)&v7, 0x26u);
    }
  }
  else
  {
    BOOL v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446978;
      id v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v9 = 1024;
      int v10 = 395;
      __int16 v11 = 2082;
      uint64_t v12 = "-[MapsSuggestionsEntry(Flight) departingAirportCode]";
      __int16 v13 = 2082;
      int v14 = "! [self hasEssentialFlightInfo]";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This can only be called on an Flight Entry", (uint8_t *)&v7, 0x26u);
    }
  }
  uint64_t v4 = 0;
LABEL_10:

  return v4;
}

- (id)arrivingAirportCode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsEntry *)self hasEssentialFlightInfo])
  {
    BOOL v3 = [(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsFlightArrivalAirportCodeKey"];
    if ([v3 length] == 3)
    {
      BOOL v3 = v3;
      uint64_t v4 = v3;
      goto LABEL_10;
    }
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446978;
      id v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v9 = 1024;
      int v10 = 405;
      __int16 v11 = 2082;
      uint64_t v12 = "-[MapsSuggestionsEntry(Flight) arrivingAirportCode]";
      __int16 v13 = 2082;
      int v14 = "3u != airportCode.length";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Post-condition: IATA airport codes should always be 3 characters!", (uint8_t *)&v7, 0x26u);
    }
  }
  else
  {
    BOOL v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446978;
      id v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlight.mm";
      __int16 v9 = 1024;
      int v10 = 403;
      __int16 v11 = 2082;
      uint64_t v12 = "-[MapsSuggestionsEntry(Flight) arrivingAirportCode]";
      __int16 v13 = 2082;
      int v14 = "! [self hasEssentialFlightInfo]";
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This can only be called on an Flight Entry", (uint8_t *)&v7, 0x26u);
    }
  }
  uint64_t v4 = 0;
LABEL_10:

  return v4;
}

- (BOOL)isLockedOrHidden
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(MapsSuggestionsEntry *)self setForKey:@"MapsSuggestionsAssociatedBundleIDsKey"];
  BOOL v3 = v2;
  if (v2 && [v2 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          __int16 v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (isExtensionHidden(v9) & 1) != 0 || (isExtensionLocked(v9))
          {
            BOOL v10 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        BOOL v10 = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
LABEL_16:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (MapsSuggestionsEntry)entryWithType:(int64_t)a3 title:(id)a4 subtitle:(id)a5 weight:(double)a6 expires:(id)a7 sourceSpecificInfo:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = [[MapsSuggestionsEntry alloc] initWithType:a3 title:v13 subtitle:v14 weight:v15 expires:0 geoMapItem:v16 sourceSpecificInfo:a6];

  return v17;
}

- (id)data
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  if (!v3)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_ERROR, "Error archiving entry %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

+ (MapsSuggestionsEntry)entryWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v9 = 0;
    id v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v9];
    uint64_t v5 = v9;
    if (v5 || !v4)
    {
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v11 = (const char *)v5;
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "Error decoding MapsSuggestionsEntry - %@", buf, 0xCu);
      }

      id v6 = 0;
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    uint64_t v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      __int16 v12 = 1024;
      int v13 = 74;
      __int16 v14 = 2082;
      id v15 = "+[MapsSuggestionsEntry entryWithData:]";
      __int16 v16 = 2082;
      uint64_t v17 = "data == nil";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. data should not be nil", buf, 0x26u);
    }
    id v6 = 0;
  }

  return (MapsSuggestionsEntry *)v6;
}

- (void)setUndecoratedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_undecoratedTitle, a3);
  id v5 = a3;
  [(MapsSuggestionsEntry *)self setTitle:self->_undecoratedTitle];
}

- (void)setUndecoratedTitleWhenLocked:(id)a3
{
  objc_storeStrong((id *)&self->_undecoratedTitleWhenLocked, a3);
  id v5 = a3;
  [(MapsSuggestionsEntry *)self setTitleWhenLocked:self->_undecoratedTitleWhenLocked];
}

- (void)setUndecoratedSubtitleWhenLocked:(id)a3
{
  objc_storeStrong((id *)&self->_undecoratedSubtitleWhenLocked, a3);
  id v5 = a3;
  [(MapsSuggestionsEntry *)self setSubtitleWhenLocked:self->_undecoratedSubtitleWhenLocked];
}

- (unint64_t)hash
{
  int64_t v3 = [(MapsSuggestionsEntry *)self type];
  id v4 = [(MapsSuggestionsEntry *)self undecoratedTitle];
  uint64_t v5 = [v4 hash];
  id v6 = [(MapsSuggestionsEntry *)self undecoratedSubtitle];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
  unint64_t v9 = v5 ^ v3 ^ v7 ^ [v8 hash];

  return v9;
}

- (NSString)uniqueName
{
  int64_t v3 = NSString;
  id v4 = [(MapsSuggestionsEntry *)self undecoratedTitle];
  uint64_t v5 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
  id v6 = [v3 stringWithFormat:@"MapsSuggestionsEntry '%@' '%@'", v4, v5];

  return (NSString *)v6;
}

- (void)setSourceSpecificInfo:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v7];
  sourceSpecificInfo = v4->_sourceSpecificInfo;
  v4->_sourceSpecificInfo = (NSMutableDictionary *)v5;

  objc_sync_exit(v4);
}

- (void)setSet:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (void)setArray:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (void)setDate:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (void)setURL:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (void)setUUID:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (void)setRouteRequestStorage:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v8, v6, v7);
}

- (void)setMapItemHandleData:(id)a3
{
  id v5 = a3;
  uint64_t v4 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v5, @"MapsSuggestionsMapItemHandleDataKey", v4);
}

- (void)setShareETAHandles:(id)a3
{
  id v5 = a3;
  uint64_t v4 = objc_opt_class();
  -[MapsSuggestionsEntry _setValue:forKey:class:](self, v5, @"MapsSuggestionSharedETAHandlesFromFavorite", v4);
}

- (id)setForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (unint64_t)uint64ForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);
  uint64_t v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 unsignedLongLongValue];
  }
  else
  {
    unint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"Defaulting to 0 instead of nil integer value for key '%@'", v4];
    BOOL v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      int v13 = v9;
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)BOOLeanForKey:(id)a3 is:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  unint64_t v8 = -[MapsSuggestionsEntry _valueForKey:class:](self, v6, v7);
  unint64_t v9 = v8;
  if (v8) {
    int v10 = [v8 BOOLValue] ^ v4 ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)dateForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (id)UUIDForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (id)routeRequestStorageForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (id)ETAForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = -[MapsSuggestionsEntry _valueForKey:class:](self, v4, v5);

  return v6;
}

- (id)mapItemHandleData
{
  uint64_t v3 = objc_opt_class();
  return -[MapsSuggestionsEntry _valueForKey:class:](self, @"MapsSuggestionsMapItemHandleDataKey", v3);
}

- (id)contacts
{
  uint64_t v3 = objc_opt_class();
  return -[MapsSuggestionsEntry _valueForKey:class:](self, @"MapsSuggestionsShortcutContactsKey", v3);
}

- (NSString)shortDescription
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = [NSString alloc];
  id v4 = [(MapsSuggestionsEntry *)v2 title];
  uint64_t v5 = [(MapsSuggestionsEntry *)v2 subtitle];
  id v6 = NSStringFromMapsSuggestionsEntryType([(MapsSuggestionsEntry *)v2 type]);
  uint64_t v7 = [(MapsSuggestionsEntry *)v2 uniqueIdentifier];
  unint64_t v8 = (void *)[v3 initWithFormat:@"'%@' / '%@' (%@) %@", v4, v5, v6, v7];

  objc_sync_exit(v2);
  return (NSString *)v8;
}

- (NSString)fullDescription
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v3 = NSStringFromMapsSuggestionsEntryType([(MapsSuggestionsEntry *)self type]);
  [v30 appendFormat:@"-- %@ --\n", v3];

  objc_msgSend(v30, "appendFormat:", @" pointer:   %p\n", self);
  id v4 = [(MapsSuggestionsEntry *)self title];
  [v30 appendFormat:@" title:    '%@'\n", v4];

  uint64_t v5 = [(MapsSuggestionsEntry *)self subtitle];
  [v30 appendFormat:@" subtitle: '%@'\n", v5];

  id v6 = [(MapsSuggestionsEntry *)self uniqueIdentifier];
  [v30 appendFormat:@" uniqueID:  %@\n", v6];

  uint64_t v7 = [(MapsSuggestionsEntry *)self originatingSourceName];
  [v30 appendFormat:@" origin:    %@\n", v7];

  unint64_t v8 = [(MapsSuggestionsEntry *)self expires];
  [v30 appendFormat:@" expires:   %@\n", v8];

  [(MapsSuggestionsEntry *)self weight];
  *(float *)&double v9 = v9;
  objc_msgSend(v30, "appendFormat:", @" weight:    %.3f\n", *(float *)&v9);
  int v10 = [(MapsSuggestionsEntry *)self geoMapItem];
  __int16 v11 = NSStringFromMapsSuggestionsMapItem(v10);
  [v30 appendFormat:@" mapItem:   %@\n", v11];

  __int16 v12 = self;
  objc_sync_enter(v12);
  objc_msgSend(v30, "appendFormat:", @" specifics: %lu entries: {\n", -[NSMutableDictionary count](v12->_sourceSpecificInfo, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  int v13 = [(NSMutableDictionary *)v12->_sourceSpecificInfo allKeys];
  uint64_t v14 = [v13 sortedArrayUsingSelector:sel_compare_];

  id obj = v14;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(id *)(*((void *)&v31 + 1) + 8 * v17);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v19 = [&unk_1EFC89ED0 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v36;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v36 != v20) {
                objc_enumerationMutation(&unk_1EFC89ED0);
              }
              uint64_t v22 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if ([v18 hasPrefix:v22])
              {
                objc_msgSend(v18, "substringFromIndex:", objc_msgSend(v22, "length"));
                id v23 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_16;
              }
            }
            uint64_t v19 = [&unk_1EFC89ED0 countByEnumeratingWithState:&v35 objects:v40 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }
        id v23 = v18;
LABEL_16:
        v24 = v23;

        if (![v18 isEqualToString:@"MapsSuggestionsResumeRouteRouteRequestStorage"])goto LABEL_20; {
        if (MapsSuggestionsLoggingIsVerbose_s_onceToken != -1)
        }
          dispatch_once(&MapsSuggestionsLoggingIsVerbose_s_onceToken, &__block_literal_global_29);
        if (!s_verbose)
        {
          id v25 = [(NSMutableDictionary *)v12->_sourceSpecificInfo objectForKeyedSubscript:v18];
          [v30 appendFormat:@" . %@ => %lu waypoints:\n", v24, objc_msgSend(v25, "waypointsCount")];
        }
        else
        {
LABEL_20:
          id v25 = [(NSMutableDictionary *)v12->_sourceSpecificInfo objectForKeyedSubscript:v18];
          [v30 appendFormat:@" . %@ => %@\n", v24, v25];
        }

        ++v17;
      }
      while (v17 != v15);
      uint64_t v14 = obj;
      uint64_t v26 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      uint64_t v15 = v26;
    }
    while (v26);
  }

  [v30 appendString:@" }"];
  objc_sync_exit(v12);

  objc_super v27 = (void *)[[NSString alloc] initWithString:v30];
  return (NSString *)v27;
}

- (void)resetAvailableRemovalBehavior:(int64_t)a3
{
  int64_t v4 = [(MapsSuggestionsEntry *)self availableRemovalBehaviors] & ~a3;
  [(MapsSuggestionsEntry *)self setInteger:v4 forKey:@"MapsSuggestionsRemovalBehaviorKey"];
}

- (void)setLocationCoordinateKeysFromLocation:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      __int16 v14 = 1024;
      int v15 = 667;
      __int16 v16 = 2082;
      uint64_t v17 = "-[MapsSuggestionsEntry setLocationCoordinateKeysFromLocation:]";
      __int16 v18 = 2082;
      uint64_t v19 = "nil == (location)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Location to set the keys cannot be nil", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_9;
  }
  [v4 coordinate];
  if (!CLLocationCoordinate2DIsValid(v21))
  {
    __int16 v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsEntry.mm";
      __int16 v14 = 1024;
      int v15 = 668;
      __int16 v16 = 2082;
      uint64_t v17 = "-[MapsSuggestionsEntry setLocationCoordinateKeysFromLocation:]";
      __int16 v18 = 2082;
      uint64_t v19 = "!CLLocationCoordinate2DIsValid(location.coordinate)";
      _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Coordinates are invalid", (uint8_t *)&v12, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  id v6 = NSNumber;
  [v5 coordinate];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  [(MapsSuggestionsEntry *)self setNumber:v7 forKey:@"MapsSuggestionsLatitudeKey"];

  unint64_t v8 = NSNumber;
  [v5 coordinate];
  int v10 = [v8 numberWithDouble:v9];
  [(MapsSuggestionsEntry *)self setNumber:v10 forKey:@"MapsSuggestionsLongitudeKey"];

LABEL_10:
}

- (NSString)serializedHexString
{
  uint64_t v2 = [(MapsSuggestionsEntry *)self data];
  if (v2)
  {
    id v3 = [NSString alloc];
    id v4 = objc_msgSend(v2, "_geo_hexString");
    uint64_t v5 = (void *)[v3 initWithFormat:@"%@%@", @"{16}", v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)serializedBase64String
{
  uint64_t v2 = [(MapsSuggestionsEntry *)self data];
  if (v2)
  {
    id v3 = [NSString alloc];
    id v4 = [v2 base64EncodedStringWithOptions:0];
    uint64_t v5 = (void *)[v3 initWithFormat:@"%@%@", @"{64}", v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

+ (id)entryFromSerializedHexString:(id)a3 hasPrefix:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [v6 substringFromIndex:objc_msgSend(@"{16}", "length")];
    uint64_t v8 = [a1 entryFromSerializedHexString:v7 hasPrefix:0];
LABEL_5:
    double v9 = (void *)v8;
    goto LABEL_6;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "_geo_dataForHexString:", v6);
  if (v7)
  {
    uint64_t v8 = +[MapsSuggestionsEntry entryWithData:v7];
    goto LABEL_5;
  }
  double v9 = 0;
LABEL_6:

  return v9;
}

+ (id)entryFromSerializedBase64String:(id)a3 hasPrefix:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [v6 substringFromIndex:objc_msgSend(@"{64}", "length")];
    uint64_t v8 = [a1 entryFromSerializedBase64String:v7 hasPrefix:0];
LABEL_5:
    double v9 = (void *)v8;
    goto LABEL_6;
  }
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
  if (v7)
  {
    uint64_t v8 = +[MapsSuggestionsEntry entryWithData:v7];
    goto LABEL_5;
  }
  double v9 = 0;
LABEL_6:

  return v9;
}

+ (id)entryFromSerializedString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MapsSuggestionsStringDataEncodingTypeOfString(v4);
  uint64_t v6 = 0;
  switch(v5)
  {
    case 0:
      uint64_t v7 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      __int16 v13 = 0;
      uint64_t v8 = "Cannot determine the encoding of this string";
      double v9 = (uint8_t *)&v13;
      goto LABEL_10;
    case 1:
      uint64_t v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v8 = "Cannot decode an empty string";
        double v9 = buf;
LABEL_10:
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, v8, v9, 2u);
      }
LABEL_11:

      goto LABEL_12;
    case 2:
      uint64_t v10 = [a1 entryFromSerializedBase64String:v4 hasPrefix:1];
      goto LABEL_7;
    case 3:
      uint64_t v6 = 1;
      goto LABEL_6;
    case 4:
LABEL_6:
      uint64_t v10 = [a1 entryFromSerializedHexString:v4 hasPrefix:v6];
LABEL_7:
      __int16 v11 = (void *)v10;
      break;
    default:
LABEL_12:
      __int16 v11 = 0;
      break;
  }

  return v11;
}

- (id)nameForJSON
{
  return @"entry";
}

- (id)objectForJSON
{
  v22[6] = *MEMORY[0x1E4F143B8];
  v21[0] = @"type";
  uint64_t v19 = NSStringFromMapsSuggestionsEntryType([(MapsSuggestionsEntry *)self type]);
  __int16 v18 = MSg::jsonFor(v19);
  v22[0] = v18;
  v21[1] = @"title";
  uint64_t v17 = [(MapsSuggestionsEntry *)self title];
  __int16 v16 = MSg::jsonFor(v17);
  v22[1] = v16;
  v21[2] = @"subtitle";
  int v15 = [(MapsSuggestionsEntry *)self subtitle];
  __int16 v14 = MSg::jsonFor(v15);
  v22[2] = v14;
  v21[3] = @"location";
  id v3 = [(MapsSuggestionsEntry *)self numberForKey:@"MapsSuggestionsLatitudeKey"];
  id v4 = MSg::jsonFor(v3);
  v20[0] = v4;
  uint64_t v5 = [(MapsSuggestionsEntry *)self numberForKey:@"MapsSuggestionsLongitudeKey"];
  uint64_t v6 = MSg::jsonFor(v5);
  v20[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v22[3] = v7;
  v21[4] = @"address";
  uint64_t v8 = [(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsDestinationAddressKey"];
  double v9 = MSg::jsonFor(v8);
  v22[4] = v9;
  v21[5] = @"eta";
  uint64_t v10 = [(MapsSuggestionsEntry *)self ETAForKey:@"MapsSuggestionsETAKey"];
  __int16 v11 = MSg::jsonFor(v10);
  v22[5] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:6];

  return v12;
}

- (BOOL)_wasEverOfType:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  typeHistory = v4->_typeHistory;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  LOBYTE(typeHistory) = [(NSMutableSet *)typeHistory containsObject:v6];

  objc_sync_exit(v4);
  return (char)typeHistory;
}

- (BOOL)_wasEverOneOfTypes:(id)a3
{
  id v4 = self;
  id v5 = a3;
  objc_sync_enter(v4);
  char v6 = [(NSMutableSet *)v4->_typeHistory intersectsSet:v5];

  objc_sync_exit(v4);
  return v6;
}

- (void)setTitle:(id)a3
{
}

- (void)setTitleWhenLocked:(id)a3
{
}

- (void)setSubtitleWhenLocked:(id)a3
{
}

- (void)setIconData:(id)a3
{
}

- (NSString)shortcutIdentifier
{
  return (NSString *)[(MapsSuggestionsEntry *)self stringForKey:@"MapsSuggestionsUserPlacePK"];
}

- (BOOL)isMultiPointRoute
{
  if ([(MapsSuggestionsEntry *)self type] != 11
    || ![(MapsSuggestionsEntry *)self containsKey:@"MapsSuggestionsResumeRouteWaypointIndex"])
  {
    return 0;
  }
  id v3 = [(MapsSuggestionsEntry *)self routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasMultipleWaypointsLeft
{
  if (![(MapsSuggestionsEntry *)self isMultiPointRoute]) {
    return 0;
  }
  id v3 = [(MapsSuggestionsEntry *)self routeRequestStorageForKey:@"MapsSuggestionsResumeRouteRouteRequestStorage"];
  BOOL v4 = [v3 waypoints];
  unint64_t v5 = [(MapsSuggestionsEntry *)self uint64ForKey:@"MapsSuggestionsResumeRouteWaypointIndex"];
  unint64_t v6 = [v4 count];

  return v6 > v5 + 1;
}

@end