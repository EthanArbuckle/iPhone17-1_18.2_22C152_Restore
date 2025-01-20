@interface ACCMediaLibraryUpdatePlaylist
- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 dict:(id)a4;
- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5;
- (ACCMediaLibraryUpdatePlaylistContent)content;
- (BOOL)folder;
- (BOOL)geniusMix;
- (BOOL)radioStation;
- (BOOL)smartPlaylist;
- (NSString)mediaLibraryUID;
- (NSString)name;
- (NSString)revision;
- (id)copyDict;
- (id)debugDescription;
- (id)description;
- (int)contentStyle;
- (unint64_t)parentPersistentID;
- (unint64_t)persistentID;
- (unint64_t)validMask;
- (unsigned)radioStationOrdering;
- (void)fillStruct:(id *)a3;
- (void)setContent:(id)a3;
- (void)setContentStyle:(int)a3;
- (void)setFolder:(BOOL)a3;
- (void)setGeniusMix:(BOOL)a3;
- (void)setMediaLibraryUID:(id)a3;
- (void)setName:(id)a3;
- (void)setParentPersistentID:(unint64_t)a3;
- (void)setPersistentID:(unint64_t)a3;
- (void)setRadioStation:(BOOL)a3;
- (void)setRadioStationOrdering:(unsigned __int16)a3;
- (void)setRevision:(id)a3;
- (void)setSmartPlaylist:(BOOL)a3;
@end

@implementation ACCMediaLibraryUpdatePlaylist

- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 persistentID:(unint64_t)a4 revision:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ACCMediaLibraryUpdatePlaylist;
  v11 = [(ACCMediaLibraryUpdatePlaylist *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryUID, a3);
    objc_storeStrong((id *)&v12->_revision, a5);
    v12->_persistentID = a4;
    v12->_validMask = 1;
    name = v12->_name;
    v12->_name = 0;

    content = v12->_content;
    v12->_parentPersistentID = 0;
    v12->_content = 0;
    v12->_contentStyle = 0;
    *(_DWORD *)&v12->_folder = 0;
    v12->_radioStationOrdering = 0;
  }
  return v12;
}

- (ACCMediaLibraryUpdatePlaylist)initWithMediaLibrary:(id)a3 dict:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)ACCMediaLibraryUpdatePlaylist;
  id v9 = [(ACCMediaLibraryUpdatePlaylist *)&v44 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibraryUID, a3);
    revision = v10->_revision;
    v10->_revision = (NSString *)&stru_26DA3F340;

    v10->_persistentID = 0;
    name = v10->_name;
    v10->_name = 0;

    content = v10->_content;
    v10->_parentPersistentID = 0;
    v10->_content = 0;
    v10->_int contentStyle = 0;
    *(_DWORD *)&v10->_folder = 0;
    v10->_radioStationOrdering = 0;

    v10->_validMask = 0;
    v14 = [v8 objectForKey:@"ACCMediaLibraryUpdateRevisionKey"];

    if (v14)
    {
      uint64_t v15 = [v8 objectForKey:@"ACCMediaLibraryUpdateRevisionKey"];
      objc_super v16 = v10->_revision;
      v10->_revision = (NSString *)v15;
    }
    v17 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"];

    if (v17)
    {
      v18 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"];
      v10->_persistentID = [v18 unsignedLongLongValue];

      v10->_validMask |= 1uLL;
    }
    v19 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistName"];

    if (v19)
    {
      uint64_t v20 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistName"];
      v21 = v10->_name;
      v10->_name = (NSString *)v20;

      v10->_validMask |= 2uLL;
    }
    v22 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistParentPersistentID"];

    if (v22)
    {
      v23 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistParentPersistentID"];
      v10->_parentPersistentID = [v23 unsignedLongLongValue];

      v10->_validMask |= 4uLL;
    }
    v24 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsFolder"];

    if (v24)
    {
      v25 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsFolder"];
      v10->_folder = [v25 unsignedCharValue] != 0;

      v10->_validMask |= 0x10uLL;
    }
    v26 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsGeniusMix"];

    if (v26)
    {
      v27 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsGeniusMix"];
      v10->_geniusMix = [v27 unsignedCharValue] != 0;

      v10->_validMask |= 8uLL;
    }
    v28 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];

    if (v28)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v29 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
        }
        v29 = &_os_log_internal;
        id v30 = &_os_log_internal;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        int contentStyle = v10->_contentStyle;
        v32 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];
        *(_DWORD *)buf = 138412802;
        v46 = v10;
        __int16 v47 = 1024;
        int v48 = contentStyle;
        __int16 v49 = 2112;
        v50 = v32;
        _os_log_impl(&dword_22669E000, v29, OS_LOG_TYPE_INFO, "%@ contentStyle %d->%@", buf, 0x1Cu);
      }
      v33 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];
      v10->_int contentStyle = [v33 unsignedCharValue];

      v10->_validMask |= 0x20uLL;
    }
    v34 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsRadioStation"];

    if (v34)
    {
      v35 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsRadioStation"];
      v10->_radioStation = [v35 unsignedCharValue] != 0;

      v10->_validMask |= 0x40uLL;
    }
    v36 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsSmartPlaylist"];

    if (v36)
    {
      v37 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistIsSmartPlaylist"];
      v10->_smartPlaylist = [v37 unsignedCharValue] != 0;

      v10->_validMask |= 0x100uLL;
    }
    v38 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistRadioStationOrdering"];

    if (v38)
    {
      v39 = [v8 objectForKey:@"ACCMediaLibraryUpdatePlaylistRadioStationOrdering"];
      v10->_radioStationOrdering = [v39 unsignedShortValue];

      v10->_validMask |= 0x200uLL;
    }
  }
  if (gLogObjects) {
    BOOL v40 = gNumLogObjects < 1;
  }
  else {
    BOOL v40 = 1;
  }
  if (v40)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    v42 = &_os_log_internal;
    id v41 = &_os_log_internal;
  }
  else
  {
    v42 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v10;
    _os_log_impl(&dword_22669E000, v42, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

  return v10;
}

- (id)description
{
  v2 = &stru_26DA3F340;
  if (self->_folder) {
    v3 = @" folder";
  }
  else {
    v3 = &stru_26DA3F340;
  }
  if (self->_geniusMix) {
    v4 = @" geniusMix";
  }
  else {
    v4 = &stru_26DA3F340;
  }
  if (self->_radioStation) {
    v5 = @" station";
  }
  else {
    v5 = &stru_26DA3F340;
  }
  if (self->_smartPlaylist) {
    v2 = @" smart";
  }
  return (id)[NSString stringWithFormat:@"<ACCMediaLibraryUpdatePlaylist>[%@:%llu revision=%@ valid=%llxh '%@' %@ %@ %@ %@ parentPersistentID=%llu]", self->_mediaLibraryUID, self->_persistentID, self->_revision, self->_validMask, self->_name, v3, v4, v5, v2, self->_parentPersistentID];
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = [(ACCMediaLibraryUpdatePlaylist *)self description];
  id v5 = [(ACCMediaLibraryUpdatePlaylist *)self copyDict];
  v6 = [v3 stringWithFormat:@"%@\n    %@", v4, v5];

  return v6;
}

- (id)copyDict
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = v3;
  revision = self->_revision;
  if (revision) {
    [v3 setObject:revision forKey:@"ACCMediaLibraryUpdateRevisionKey"];
  }
  unint64_t validMask = self->_validMask;
  if (validMask)
  {
    id v9 = [NSNumber numberWithUnsignedLongLong:self->_persistentID];
    [v4 setObject:v9 forKey:@"ACCMediaLibraryUpdatePlaylistPersistentID"];

    unint64_t validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_5:
      if ((validMask & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((validMask & 2) == 0)
  {
    goto LABEL_5;
  }
  [v4 setObject:self->_name forKey:@"ACCMediaLibraryUpdatePlaylistName"];
  unint64_t validMask = self->_validMask;
  if ((validMask & 4) == 0)
  {
LABEL_6:
    if ((validMask & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  id v10 = [NSNumber numberWithUnsignedLongLong:self->_parentPersistentID];
  [v4 setObject:v10 forKey:@"ACCMediaLibraryUpdatePlaylistParentPersistentID"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x10) == 0)
  {
LABEL_7:
    if ((validMask & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = [NSNumber numberWithUnsignedChar:self->_folder];
  [v4 setObject:v11 forKey:@"ACCMediaLibraryUpdatePlaylistIsFolder"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 8) == 0)
  {
LABEL_8:
    if ((validMask & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = [NSNumber numberWithUnsignedChar:self->_geniusMix];
  [v4 setObject:v12 forKey:@"ACCMediaLibraryUpdatePlaylistIsGeniusMix"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x20) == 0)
  {
LABEL_9:
    if ((validMask & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  v13 = [NSNumber numberWithUnsignedChar:LOBYTE(self->_contentStyle)];
  [v4 setObject:v13 forKey:@"ACCMediaLibraryUpdatePlaylistContentStyle"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x40) == 0)
  {
LABEL_10:
    if ((validMask & 0x100) == 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v15 = [NSNumber numberWithUnsignedChar:self->_smartPlaylist];
    [v4 setObject:v15 forKey:@"ACCMediaLibraryUpdatePlaylistIsSmartPlaylist"];

    if ((self->_validMask & 0x200) == 0) {
      return v4;
    }
    goto LABEL_12;
  }
LABEL_20:
  v14 = [NSNumber numberWithUnsignedChar:self->_radioStation];
  [v4 setObject:v14 forKey:@"ACCMediaLibraryUpdatePlaylistIsRadioStation"];

  unint64_t validMask = self->_validMask;
  if ((validMask & 0x100) != 0) {
    goto LABEL_21;
  }
LABEL_11:
  if ((validMask & 0x200) != 0)
  {
LABEL_12:
    id v7 = [NSNumber numberWithUnsignedShort:self->_radioStationOrdering];
    [v4 setObject:v7 forKey:@"ACCMediaLibraryUpdatePlaylistRadioStationOrdering"];
  }
  return v4;
}

- (void)fillStruct:(id *)a3
{
  *(void *)&a3->var4 = 0;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCMediaLibraryUpdatePlaylist fillStruct:]((uint64_t)self, v7);
  }

  unint64_t validMask = self->_validMask;
  if (validMask)
  {
    a3->var1 = self->_persistentID;
    a3->var0 |= 1u;
    unint64_t validMask = self->_validMask;
    if ((validMask & 2) == 0)
    {
LABEL_13:
      if ((validMask & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_26;
    }
  }
  else if ((validMask & 2) == 0)
  {
    goto LABEL_13;
  }
  name = self->_name;
  if (name)
  {
    name = [(NSString *)name UTF8String];
    unint64_t validMask = self->_validMask;
  }
  a3->var2 = (char *)name;
  a3->var0 |= 2u;
  if ((validMask & 4) == 0)
  {
LABEL_14:
    if ((validMask & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
LABEL_26:
  a3->var3 = self->_parentPersistentID;
  a3->var0 |= 4u;
  unint64_t validMask = self->_validMask;
  if ((validMask & 8) == 0)
  {
LABEL_15:
    if ((validMask & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_28;
  }
LABEL_27:
  a3->var4 = self->_geniusMix;
  a3->var0 |= 8u;
  if ((validMask & 0x10) == 0)
  {
LABEL_16:
    if ((validMask & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_29;
  }
LABEL_28:
  a3->var5 = self->_folder;
  a3->var0 |= 0x10u;
  if ((validMask & 0x20) == 0)
  {
LABEL_17:
    if ((validMask & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_30;
  }
LABEL_29:
  a3->var6 = self->_contentStyle;
  a3->var0 |= 0x20u;
  if ((validMask & 0x40) == 0)
  {
LABEL_18:
    if ((validMask & 0x100) == 0) {
      goto LABEL_19;
    }
    goto LABEL_31;
  }
LABEL_30:
  a3->var7 = self->_radioStation;
  a3->var0 |= 0x40u;
  if ((validMask & 0x100) == 0)
  {
LABEL_19:
    if ((validMask & 0x200) == 0) {
      return;
    }
    goto LABEL_20;
  }
LABEL_31:
  a3->var8 = self->_smartPlaylist;
  a3->var0 |= 0x100u;
  if ((validMask & 0x200) == 0) {
    return;
  }
LABEL_20:
  a3->var9 = self->_radioStationOrdering;
  a3->var0 |= 0x200u;
}

- (void)setMediaLibraryUID:(id)a3
{
}

- (void)setRevision:(id)a3
{
}

- (void)setPersistentID:(unint64_t)a3
{
  unint64_t v3 = self->_validMask | 1;
  self->_persistentID = a3;
  self->_unint64_t validMask = v3;
}

- (void)setName:(id)a3
{
  self->_validMask |= 2uLL;
}

- (void)setParentPersistentID:(unint64_t)a3
{
  self->_parentPersistentID = a3;
  self->_validMask |= 4uLL;
}

- (void)setFolder:(BOOL)a3
{
  self->_folder = a3;
  self->_validMask |= 0x10uLL;
}

- (void)setGeniusMix:(BOOL)a3
{
  self->_geniusMix = a3;
  self->_validMask |= 8uLL;
}

- (void)setContentStyle:(int)a3
{
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_2();
    }
    id v7 = &_os_log_internal;
    id v6 = &_os_log_internal;
  }
  else
  {
    id v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ACCMediaLibraryUpdatePlaylist *)(uint64_t)self setContentStyle:v7];
  }

  self->_int contentStyle = a3;
  self->_validMask |= 0x20uLL;
}

- (void)setRadioStation:(BOOL)a3
{
  self->_radioStation = a3;
  self->_validMask |= 0x40uLL;
}

- (void)setSmartPlaylist:(BOOL)a3
{
  self->_smartPlaylist = a3;
  self->_validMask |= 0x100uLL;
}

- (void)setRadioStationOrdering:(unsigned __int16)a3
{
  self->_radioStationOrdering = a3;
  self->_validMask |= 0x200uLL;
}

- (NSString)mediaLibraryUID
{
  return self->_mediaLibraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (unint64_t)persistentID
{
  return self->_persistentID;
}

- (unint64_t)validMask
{
  return self->_validMask;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)parentPersistentID
{
  return self->_parentPersistentID;
}

- (BOOL)folder
{
  return self->_folder;
}

- (BOOL)geniusMix
{
  return self->_geniusMix;
}

- (BOOL)radioStation
{
  return self->_radioStation;
}

- (BOOL)smartPlaylist
{
  return self->_smartPlaylist;
}

- (unsigned)radioStationOrdering
{
  return self->_radioStationOrdering;
}

- (int)contentStyle
{
  return self->_contentStyle;
}

- (ACCMediaLibraryUpdatePlaylistContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_revision, 0);

  objc_storeStrong((id *)&self->_mediaLibraryUID, 0);
}

- (void)fillStruct:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22669E000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)setContentStyle:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(a1 + 16);
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_debug_impl(&dword_22669E000, log, OS_LOG_TYPE_DEBUG, "%@ setContentStyle %d->%d", (uint8_t *)&v4, 0x18u);
}

@end