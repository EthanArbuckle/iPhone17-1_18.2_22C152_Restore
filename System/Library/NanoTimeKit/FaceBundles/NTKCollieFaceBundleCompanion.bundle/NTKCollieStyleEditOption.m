@interface NTKCollieStyleEditOption
+ (BOOL)hasSharedMemojiForResourceDirectory:(id)a3;
+ (BOOL)hasSnapshotImageForOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5;
+ (BOOL)saveBridgeMemojiCustomData:(id)a3 identifier:(id)a4 resourceDirectory:(id)a5 error:(id *)a6;
+ (BOOL)saveSharedMemojiDataRepresentation:(id)a3 resourceDirectory:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (BOOL)validateMemojiDataRepresentation:(id)a3 forDevice:(id)a4 error:(id *)a5;
+ (BOOL)validateSharedMemojiResourceDirectory:(id)a3 forDevice:(id)a4 error:(id *)a5;
+ (NTKCollieStyleEditOption)optionWithAvatarRecordIdentifier:(id)a3 forDevice:(id)a4;
+ (NTKCollieStyleEditOption)optionWithStyleName:(id)a3 forDevice:(id)a4;
+ (id)_impactedIdentifierForOption:(id)a3 avatarStoreChangedInfo:(id)a4;
+ (id)_randomCharacterStyleForToyboxStyleName:(id)a3 resourceDirectory:(id)a4;
+ (id)avatarDataRepresentationForOption:(id)a3 resourceDirectory:(id)a4;
+ (id)avatarRecordCache;
+ (id)avatarSha1StringForOption:(id)a3 resourceDirectory:(id)a4;
+ (id)bridgeMemojiDataRepresentationForIdentifier:(id)a3 resourceDirectory:(id)a4;
+ (id)changedOptionForOption:(id)a3 avatarStoreChangedInfo:(id)a4 resourceDirectory:(id)a5;
+ (id)defaultOptionForDevice:(id)a3;
+ (id)existingSnapshotImageForOption:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6 force:(BOOL)a7;
+ (id)friendlyPoseForCharacterStyleName:(id)a3;
+ (id)memojiIdentifiers;
+ (id)memojiStyleNameAtIndex:(unint64_t)a3;
+ (id)neutralImageForOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 forDevice:(id)a6 oldAvatar:(id)a7;
+ (id)neutralPoseForCharacterStyleName:(id)a3;
+ (id)optionAtIndex:(unint64_t)a3 resourceDirectory:(id)a4 forDevice:(id)a5;
+ (id)poseNamed:(id)a3;
+ (id)sleepImageForOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 forDevice:(id)a6 oldAvatar:(id)a7;
+ (id)sleepPoseForCharacterStyleName:(id)a3;
+ (id)snapshotImageForOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 forDevice:(id)a6 oldAvatar:(id)a7 force:(BOOL)a8;
+ (id)uniqueOptionForDevice:(id)a3 existingOptions:(id)a4;
+ (unint64_t)cloudSyncStatus;
+ (unint64_t)indexOfOption:(id)a3 resourceDirectory:(id)a4 forDevice:(id)a5;
+ (unint64_t)numberOfMemojiOptionsForDevice:(id)a3;
+ (unint64_t)numberOfOptionsWithResourceDirectory:(id)a3 forDevice:(id)a4;
+ (void)_setIgnoreInvalidate:(BOOL)a3;
+ (void)asyncMakeSnapshotImageForOption:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6 completion:(id)a7;
+ (void)avatarStoreDidChange:(id)a3;
+ (void)beginCacheWithResourceDirectory:(id)a3 forDevice:(id)a4;
+ (void)cloudSyncStatusInvalidatingIdentifiers:(id)a3;
+ (void)endCache;
+ (void)invalidateCache;
+ (void)loadAvatarForOption:(id)a3 resourceDirectory:(id)a4 oldAvatar:(id)a5 completion:(id)a6;
+ (void)prewarmOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 forDevice:(id)a6 completion:(id)a7;
+ (void)pruneResourceDirectory:(id)a3 pruneBridgeMemoji:(BOOL)a4;
- (BOOL)isBridgeMemoji;
- (BOOL)isEqual:(id)a3;
- (BOOL)isImpactedByAvatarStoreChangedInfo:(id)a3;
- (BOOL)isRegularMemoji;
- (BOOL)isSharedMemoji;
- (BOOL)isToybox;
- (BOOL)isToyboxMemoji;
- (BOOL)isValidOption;
- (NSString)styleName;
- (NTKCollieStyleEditOption)initWithCoder:(id)a3;
- (NTKCollieStyleEditOption)initWithDevice:(id)a3;
- (NTKCollieStyleEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4;
- (UIImage)snapshotImage;
- (id)JSONObjectRepresentation;
- (id)_toyBoxCharacterStyleNameWithResourceDirectory:(id)a3;
- (id)_toyboxResolvedPoseStyleName;
- (id)chosenToyBoxOptionWithResourceDirectory:(id)a3;
- (id)customDataWithResourceDirectory:(id)a3;
- (id)friendlyPose;
- (id)localizedName;
- (id)neutralPose;
- (id)nextRandomizedToyBoxOptionWithResourceDirectory:(id)a3;
- (id)sleepPose;
- (id)watchCoordinatorForAvatar:(id)a3;
- (int64_t)swatchStyle;
- (void)_randomizeToyBoxWithResourceDirectory:(id)a3;
- (void)chooseToyBoxOption:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NTKCollieStyleEditOption

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(NSString *)self->_characterName isEqualToString:v4[2]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NTKCollieStyleEditOption)initWithDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCollieStyleEditOption;
  v3 = [(NTKCollieStyleEditOption *)&v6 initWithDevice:a3];
  v4 = v3;
  if (v3) {
    objc_storeStrong((id *)&v3->_characterName, @"mouse");
  }
  return v4;
}

- (NTKCollieStyleEditOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKCollieStyleEditOption;
  BOOL v5 = [(NTKCollieStyleEditOption *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characterName"];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = @"mouse";
    }
    objc_storeStrong((id *)&v5->_characterName, v8);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCollieStyleEditOption;
  id v4 = a3;
  [(NTKCollieStyleEditOption *)&v6 encodeWithCoder:v4];
  if (self->_characterName) {
    CFStringRef characterName = (const __CFString *)self->_characterName;
  }
  else {
    CFStringRef characterName = @"mouse";
  }
  objc_msgSend(v4, "encodeObject:forKey:", characterName, @"characterName", v6.receiver, v6.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (NTKCollieStyleEditOption)initWithJSONObjectRepresentation:(id)a3 forDevice:(id)a4
{
  id v7 = a3;
  v8 = [(NTKCollieStyleEditOption *)self initWithDevice:a4];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"object must be a string - invalid value: %@", v7 format];
    }
    objc_storeStrong((id *)&v8->_characterName, a3);
  }

  return v8;
}

- (id)JSONObjectRepresentation
{
  if (self->_characterName) {
    return self->_characterName;
  }
  else {
    return @"mouse";
  }
}

+ (void)avatarStoreDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "+[NTKCollieStyleEditOption avatarStoreDidChange:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: received store change notification = %@", buf, 0x16u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_15474;
  v7[3] = &unk_28720;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

+ (void)cloudSyncStatusInvalidatingIdentifiers:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "+[NTKCollieStyleEditOption cloudSyncStatusInvalidatingIdentifiers:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s: cloudSyncStatus invaliding identifiers", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_156AC;
  v7[3] = &unk_28720;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (BOOL)isImpactedByAvatarStoreChangedInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(id)objc_opt_class() _impactedIdentifierForOption:self avatarStoreChangedInfo:v4];

  return v5 != 0;
}

+ (id)_impactedIdentifierForOption:(id)a3 avatarStoreChangedInfo:(id)a4
{
  BOOL v5 = a3;
  id v6 = [a4 objectForKeyedSubscript:@"changedRecordIDs"];
  id v7 = [v5 styleName];
  if ([v7 isToyboxMemojiStyleName])
  {
    id v8 = (void *)v5[3];
  }
  else
  {
    unsigned int v9 = [v7 isRegularMemojiStyleName];
    id v8 = v7;
    if (!v9)
    {
LABEL_14:
      id v14 = 0;
      goto LABEL_17;
    }
  }
  id v10 = v8;
  if (!v10) {
    goto LABEL_14;
  }
  v11 = v10;
  __int16 v12 = [v10 memojiIdentifier];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v6;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", v17, (void)v19))
        {
          id v14 = v17;
          goto LABEL_16;
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_16:

LABEL_17:

  return v14;
}

+ (id)changedOptionForOption:(id)a3 avatarStoreChangedInfo:(id)a4 resourceDirectory:(id)a5
{
  id v8 = (id *)a3;
  id v9 = a5;
  id v10 = [a1 _impactedIdentifierForOption:v8 avatarStoreChangedInfo:a4];
  if (!v10)
  {
    long long v20 = 0;
    goto LABEL_23;
  }
  v11 = [v8 styleName];
  if (![(__CFString *)v11 isToyboxMemojiStyleName])
  {
    long long v19 = v11;
    if (![(__CFString *)v11 isRegularMemojiStyleName]) {
      goto LABEL_19;
    }
    long long v21 = +[NTKCollieStyleEditOption avatarRecordCache];
    id v22 = [v21 indexForRecordIdentifier:v10];

    long long v19 = v11;
    if (v22 != (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_19;
    }
    v23 = +[NTKCollieStyleEditOption avatarRecordCache];
    v24 = (char *)[v23 _memojiIdentifiersCount];

    if (v24)
    {
      id v13 = +[NTKCollieStyleEditOption avatarRecordCache];
      long long v19 = [v13 memojiStyleNameAtIndex:v24 - 1];
    }
    else
    {
      long long v19 = @"unicorn";
      id v13 = v11;
    }
LABEL_18:

LABEL_19:
    if ([(__CFString *)v19 isEqualToString:v11])
    {
      long long v20 = v8;
    }
    else
    {
      v27 = [v8 device];
      long long v20 = +[NTKCollieStyleEditOption optionWithStyleName:v19 forDevice:v27];
    }
    goto LABEL_22;
  }
  __int16 v12 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v13 = [v12 memojiIdentifiers];

  id v14 = (char *)[v13 count];
  if ((unint64_t)v14 < 2)
  {
    if (v14 == (unsigned char *)&dword_0 + 1)
    {
      id v15 = +[NTKCollieStyleEditOption avatarRecordCache];
      long long v19 = [v15 memojiStyleNameAtIndex:0];
    }
    else
    {
      long long v19 = @"unicorn";
      id v15 = v11;
    }
    goto LABEL_17;
  }
  id v15 = v8[3];
  v16 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v17 = [v16 indexForRecordIdentifier:v10];

  v18 = v15;
  if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = [a1 _randomCharacterStyleForToyboxStyleName:@"toybox-memoji" resourceDirectory:v9];
  }
  if ([v18 isEqualToString:v15])
  {

    long long v19 = v11;
LABEL_17:

    goto LABEL_18;
  }
  v25 = [v8 device];
  long long v20 = +[NTKCollieStyleEditOption optionWithStyleName:@"toybox-memoji" forDevice:v25];

  id v26 = v20[3];
  v20[3] = v18;

  long long v19 = v11;
LABEL_22:

LABEL_23:

  return v20;
}

+ (id)avatarRecordCache
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)qword_2F800;
  if (!qword_2F800)
  {
    uint64_t v4 = objc_opt_new();
    BOOL v5 = (void *)qword_2F800;
    qword_2F800 = v4;

    v3 = (void *)qword_2F800;
  }
  id v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

+ (void)_setIgnoreInvalidate:(BOOL)a3
{
  id obj = a1;
  objc_sync_enter(obj);
  byte_2F808 = a3;
  objc_sync_exit(obj);
}

+ (void)invalidateCache
{
  id obj = a1;
  objc_sync_enter(obj);
  if (!byte_2F808)
  {
    id v2 = (void *)qword_2F800;
    qword_2F800 = 0;
  }
  objc_sync_exit(obj);
}

+ (void)beginCacheWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  [a1 invalidateCache];
  [a1 _setIgnoreInvalidate:1];
  id v6 = +[NTKCollieStyleEditOption avatarRecordCache];
  [v6 ensureSnapshotImagesWithResourceDirectory:v5];
}

+ (void)endCache
{
  [a1 _setIgnoreInvalidate:0];

  [a1 invalidateCache];
}

+ (unint64_t)cloudSyncStatus
{
  id v2 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v3 = [v2 cloudSyncStatus];

  return (unint64_t)v3;
}

+ (NTKCollieStyleEditOption)optionWithStyleName:(id)a3 forDevice:(id)a4
{
  uint64_t v4 = (NSString *)a3;
  id v5 = objc_alloc_init(NTKCollieStyleEditOption);
  CFStringRef characterName = v5->_characterName;
  v5->_CFStringRef characterName = v4;

  return v5;
}

+ (id)defaultOptionForDevice:(id)a3
{
  return [a1 optionWithStyleName:@"mouse" forDevice:a3];
}

+ (id)uniqueOptionForDevice:(id)a3 existingOptions:(id)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(a4, "na_map:", &stru_29108);
  id v8 = +[NTKCollieStyleEditOptionAvatarRecordCache animojiIdentifiers];
  unint64_t v9 = (unint64_t)[v8 count];
  id v10 = @"unicorn";
  id v11 = [v8 indexOfObject:v10];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = (unint64_t)v11;
  }
  if (!v9) {
    goto LABEL_10;
  }
  unint64_t v13 = v9;
  while (1)
  {
    id v14 = [v8 objectAtIndexedSubscript:v12 % v9];
    if (![v7 containsObject:v14]) {
      break;
    }

    ++v12;
    if (!--v13) {
      goto LABEL_10;
    }
  }
  if (!v14) {
LABEL_10:
  }
    id v14 = v10;
  id v15 = [a1 optionWithStyleName:v14 forDevice:v6];

  return v15;
}

+ (unint64_t)numberOfMemojiOptionsForDevice:(id)a3
{
  id v3 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v4 = [v3 _memojiIdentifiersCount];

  return (unint64_t)v4;
}

+ (id)memojiIdentifiers
{
  id v2 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v3 = [v2 memojiIdentifiers];

  return v3;
}

+ (id)memojiStyleNameAtIndex:(unint64_t)a3
{
  id v4 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v5 = [v4 memojiStyleNameAtIndex:a3];

  return v5;
}

+ (NTKCollieStyleEditOption)optionWithAvatarRecordIdentifier:(id)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v8 = [v7 indexForRecordIdentifier:v6];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = 0;
  }
  else
  {
    id v10 = +[NTKCollieStyleEditOption avatarRecordCache];
    id v11 = [v10 memojiStyleNameAtIndex:v8];

    unint64_t v9 = [(id)objc_opt_class() optionWithStyleName:v11 forDevice:v5];
  }

  return (NTKCollieStyleEditOption *)v9;
}

- (NSString)styleName
{
  return self->_characterName;
}

- (BOOL)isToybox
{
  id v2 = [(NTKCollieStyleEditOption *)self styleName];
  unsigned __int8 v3 = [v2 isToyboxAnyStyleName];

  return v3;
}

- (BOOL)isToyboxMemoji
{
  id v2 = [(NTKCollieStyleEditOption *)self styleName];
  unsigned __int8 v3 = [v2 isToyboxMemojiStyleName];

  return v3;
}

- (BOOL)isRegularMemoji
{
  id v2 = [(NTKCollieStyleEditOption *)self styleName];
  unsigned __int8 v3 = [v2 isRegularMemojiStyleName];

  return v3;
}

- (BOOL)isSharedMemoji
{
  id v2 = [(NTKCollieStyleEditOption *)self styleName];
  unsigned __int8 v3 = [v2 isSharedMemojiStyleName];

  return v3;
}

- (BOOL)isValidOption
{
  id v2 = [(NTKCollieStyleEditOption *)self styleName];
  unsigned __int8 v3 = [v2 isValidStyleName];

  return v3;
}

+ (unint64_t)numberOfOptionsWithResourceDirectory:(id)a3 forDevice:(id)a4
{
  id v4 = a3;
  id v5 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v6 = [v5 styleNamesForResourceDirectory:v4];

  id v7 = [v6 count];
  return (unint64_t)v7;
}

+ (id)optionAtIndex:(unint64_t)a3 resourceDirectory:(id)a4 forDevice:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  unint64_t v9 = +[NTKCollieStyleEditOption avatarRecordCache];
  id v10 = [v9 styleNamesForResourceDirectory:v8];

  if ((unint64_t)[v10 count] <= a3)
  {
    unint64_t v12 = 0;
  }
  else
  {
    id v11 = [v10 objectAtIndexedSubscript:a3];
    unint64_t v12 = [(id)objc_opt_class() optionWithStyleName:v11 forDevice:v7];
  }

  return v12;
}

+ (unint64_t)indexOfOption:(id)a3 resourceDirectory:(id)a4 forDevice:(id)a5
{
  id v6 = a4;
  id v7 = [a3 styleName];
  if (v7)
  {
    id v8 = +[NTKCollieStyleEditOption avatarRecordCache];
    unint64_t v9 = [v8 styleNamesForResourceDirectory:v6];

    unint64_t v10 = (unint64_t)[v9 indexOfObject:v7];
  }
  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)localizedName
{
  id v2 = [(NTKCollieStyleEditOption *)self styleName];
  if ([v2 isToyboxAnimojiStyleName])
  {
    CFStringRef v3 = @"EDIT_OPTION_LABEL_COLLIE_STYLE_TOYBOX_ANIMOJI";
LABEL_7:
    id v4 = +[NTKCollieFaceBundle localizedStringForKey:v3 comment:&stru_29398];
    goto LABEL_8;
  }
  if ([v2 isToyboxMemojiStyleName])
  {
    CFStringRef v3 = @"EDIT_OPTION_LABEL_COLLIE_STYLE_TOYBOX_MEMOJI";
    goto LABEL_7;
  }
  if ([v2 isSharedMemojiStyleName])
  {
    CFStringRef v3 = @"EDIT_OPTION_LABEL_COLLIE_STYLE_SHARED_MEMOJI";
    goto LABEL_7;
  }
  if ([v2 isRegularMemojiStyleName])
  {
    id v6 = [v2 memojiIdentifier];
    id v7 = +[NTKCollieStyleEditOption avatarRecordCache];
    id v8 = (char *)[v7 indexForRecordIdentifier:v6];

    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = +[NTKCollieStyleEditOption avatarRecordCache];
      id v8 = (char *)[v9 _memojiIdentifiersCount];
    }
    unint64_t v10 = +[NTKCollieFaceBundle localizedStringForKey:@"EDIT_OPTION_LABEL_COLLIE_STYLE_MEMOJI" comment:&stru_29398];
    id v11 = +[NSNumber numberWithUnsignedInteger:v8 + 1];
    id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);
  }
  else
  {
    unint64_t v12 = [v2 uppercaseString];
    id v6 = +[NSString stringWithFormat:@"EDIT_OPTION_LABEL_COLLIE_STYLE_%@", v12];

    id v4 = +[NTKCollieFaceBundle localizedStringForKey:v6 comment:&stru_29398];
  }

LABEL_8:

  return v4;
}

- (UIImage)snapshotImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotImage);

  return (UIImage *)WeakRetained;
}

+ (id)poseNamed:(id)a3
{
  id v3 = a3;
  id v4 = NTKCollieFaceNSBundle();
  id v5 = [v4 pathForResource:v3 ofType:@"json" inDirectory:0];

  id v13 = 0;
  id v6 = +[NSData dataWithContentsOfFile:v5 options:1 error:&v13];
  id v7 = v13;
  id v12 = v7;
  id v8 = +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:&v12];
  id v9 = v12;

  id v10 = [objc_alloc((Class)AVTAvatarPose) initWithDictionaryRepresentation:v8];

  return v10;
}

+ (id)_randomCharacterStyleForToyboxStyleName:(id)a3 resourceDirectory:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if ([(__CFString *)v5 isToyboxAnimojiStyleName])
  {
    id v7 = +[NTKCollieStyleEditOptionAvatarRecordCache animojiIdentifiers];
    uint64_t v8 = [(__CFString *)v7 objectAtIndexedSubscript:arc4random() % (unint64_t)[(__CFString *)v7 count]];
    goto LABEL_3;
  }
  if ([(__CFString *)v5 isToyboxMemojiStyleName])
  {
    id v10 = +[NTKCollieStyleEditOption avatarRecordCache];
    id v11 = (char *)[v10 _memojiIdentifiersCount];

    unsigned int v12 = +[NTKCollieStyleEditOptionAvatarRecordCache hasSharedMemojiForResourceDirectory:v6];
    unint64_t v13 = (unint64_t)&v11[v12];
    if (v13)
    {
      unsigned int v14 = v12;
      unint64_t v15 = arc4random() % v13;
      if (v15 == v13 - 1) {
        unsigned int v16 = v14;
      }
      else {
        unsigned int v16 = 0;
      }
      if (v16 == 1)
      {
        id v9 = @"local-memoji";
        goto LABEL_4;
      }
      id v7 = +[NTKCollieStyleEditOption avatarRecordCache];
      uint64_t v8 = [(__CFString *)v7 memojiStyleNameAtIndex:v15];
LABEL_3:
      id v9 = (__CFString *)v8;

      id v5 = v7;
LABEL_4:

      id v5 = v9;
      goto LABEL_14;
    }
    id v9 = @"mouse";
  }
  else
  {
    id v9 = v5;
  }
LABEL_14:
  id v17 = v9;

  return v17;
}

- (void)_randomizeToyBoxWithResourceDirectory:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(NTKCollieStyleEditOption *)self styleName];
  id v7 = [v5 _randomCharacterStyleForToyboxStyleName:v6 resourceDirectory:v4];

  toyBoxCharacterStyleName = self->_toyBoxCharacterStyleName;
  self->_toyBoxCharacterStyleName = v7;

  objc_storeWeak((id *)&self->_snapshotImage, 0);
}

- (id)_toyBoxCharacterStyleNameWithResourceDirectory:(id)a3
{
  toyBoxCharacterStyleName = self->_toyBoxCharacterStyleName;
  if (!toyBoxCharacterStyleName)
  {
    [(NTKCollieStyleEditOption *)self _randomizeToyBoxWithResourceDirectory:a3];
    toyBoxCharacterStyleName = self->_toyBoxCharacterStyleName;
  }

  return toyBoxCharacterStyleName;
}

- (id)chosenToyBoxOptionWithResourceDirectory:(id)a3
{
  id v4 = a3;
  if ([(NTKCollieStyleEditOption *)self isToybox])
  {
    id v5 = [(NTKCollieStyleEditOption *)self _toyBoxCharacterStyleNameWithResourceDirectory:v4];
    id v6 = objc_opt_class();
    id v7 = [(NTKCollieStyleEditOption *)self device];
    uint64_t v8 = [v6 optionWithStyleName:v5 forDevice:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)nextRandomizedToyBoxOptionWithResourceDirectory:(id)a3
{
  id v4 = a3;
  if ([(NTKCollieStyleEditOption *)self isToybox])
  {
    id v5 = objc_opt_class();
    id v6 = [(NTKCollieStyleEditOption *)self styleName];
    id v7 = [v5 _randomCharacterStyleForToyboxStyleName:v6 resourceDirectory:v4];

    uint64_t v8 = objc_opt_class();
    id v9 = [(NTKCollieStyleEditOption *)self device];
    id v10 = [v8 optionWithStyleName:v7 forDevice:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)chooseToyBoxOption:(id)a3
{
  id v4 = a3;
  id v6 = [(NTKCollieStyleEditOption *)self styleName];
  id v5 = [v4 styleName];

  if ([v6 isToyboxAnimojiStyleName]
    && ([v5 isRegularAnimojiStyleName] & 1) != 0
    || [v6 isToyboxMemojiStyleName]
    && (([v5 isRegularMemojiStyleName] & 1) != 0
     || [v5 isSharedMemojiStyleName]))
  {
    objc_storeStrong((id *)&self->_toyBoxCharacterStyleName, v5);
  }
}

+ (void)loadAvatarForOption:(id)a3 resourceDirectory:(id)a4 oldAvatar:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9)
  {
    id v12 = a5;
    unint64_t v13 = [v9 styleName];
    if ([v9 isToybox])
    {
      uint64_t v14 = [v9 _toyBoxCharacterStyleNameWithResourceDirectory:v10];

      unint64_t v13 = (void *)v14;
    }
    unint64_t v15 = +[NTKCollieStyleEditOption avatarRecordCache];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_16EF0;
    v16[3] = &unk_29130;
    id v17 = v11;
    [v15 loadAvatarForCharacterStyleName:v13 resourceDirectory:v10 oldAvatar:v12 completion:v16];
  }
}

+ (id)existingSnapshotImageForOption:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6 force:(BOOL)a7
{
  double height = a6.height;
  double width = a6.width;
  id v12 = (id *)a3;
  id v13 = a4;
  if (!v12)
  {
    id v18 = 0;
    goto LABEL_12;
  }
  if (a5)
  {
    uint64_t v14 = 0;
LABEL_4:
    unint64_t v15 = [v12 styleName];
    unsigned int v16 = +[NTKCollieStyleEditOption avatarRecordCache];
    id v17 = objc_msgSend(v16, "snapshotImageForStyleName:resourceDirectory:poseType:size:", v15, v13, a5, width, height);

    if (!a5) {
      objc_storeWeak(v12 + 1, v17);
    }
    id v18 = v17;

    goto LABEL_11;
  }
  id WeakRetained = objc_loadWeakRetained(v12 + 1);
  uint64_t v14 = WeakRetained;
  if (!WeakRetained || a7) {
    goto LABEL_4;
  }
  id v18 = WeakRetained;
LABEL_11:

LABEL_12:

  return v18;
}

+ (id)snapshotImageForOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 forDevice:(id)a6 oldAvatar:(id)a7 force:(BOOL)a8
{
  double height = a5.height;
  double width = a5.width;
  id v12 = (id *)a3;
  id v13 = a4;
  if (v12)
  {
    id WeakRetained = objc_loadWeakRetained(v12 + 1);
    unint64_t v15 = WeakRetained;
    if (!WeakRetained || a8)
    {
      id v17 = [v12 styleName];
      dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
      id v18 = +[NTKCollieStyleEditOption avatarRecordCache];
      long long v19 = objc_msgSend(v18, "snapshotImageForStyleName:resourceDirectory:size:", v17, v13, width, height);

      if (!v19)
      {
        long long v20 = +[NTKCollieStyleEditOption avatarRecordCache];
        long long v19 = objc_msgSend(v20, "makeSnapshotImageForStyleName:resourceDirectory:size:", v17, v13, width, height);
      }
      objc_storeWeak(v12 + 1, v19);
      id v16 = v19;
    }
    else
    {
      id v16 = WeakRetained;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (void)asyncMakeSnapshotImageForOption:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v12 = a3;
  id v13 = a7;
  id v14 = a4;
  unint64_t v15 = [v12 styleName];
  id v16 = +[NTKCollieStyleEditOption avatarRecordCache];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_172BC;
  v20[3] = &unk_29158;
  id v21 = v15;
  id v22 = v12;
  id v23 = v13;
  unint64_t v24 = a5;
  id v17 = v13;
  id v18 = v12;
  id v19 = v15;
  objc_msgSend(v16, "scheduleSnapshotImageForStyleName:resourceDirectory:poseType:size:completion:", v19, v14, a5, v20, width, height);
}

+ (id)neutralImageForOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 forDevice:(id)a6 oldAvatar:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a4;
  if (a3)
  {
    id v11 = [a3 styleName];
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    id v12 = +[NTKCollieStyleEditOption avatarRecordCache];
    id v13 = objc_msgSend(v12, "neutralImageForStyleName:resourceDirectory:size:", v11, v10, width, height);

    if (!v13)
    {
      id v14 = +[NTKCollieStyleEditOption avatarRecordCache];
      id v13 = objc_msgSend(v14, "makeNeutralImageForStyleName:resourceDirectory:size:", v11, v10, width, height);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)sleepImageForOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 forDevice:(id)a6 oldAvatar:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a4;
  if (a3)
  {
    id v11 = [a3 styleName];
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    id v12 = +[NTKCollieStyleEditOption avatarRecordCache];
    id v13 = objc_msgSend(v12, "sleepImageForStyleName:resourceDirectory:size:", v11, v10, width, height);

    if (!v13)
    {
      id v14 = +[NTKCollieStyleEditOption avatarRecordCache];
      id v13 = objc_msgSend(v14, "makeSleepImageForStyleName:resourceDirectory:size:", v11, v10, width, height);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (void)prewarmOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5 forDevice:(id)a6 completion:(id)a7
{
}

+ (id)avatarDataRepresentationForOption:(id)a3 resourceDirectory:(id)a4
{
  id v5 = a4;
  id v6 = [a3 styleName];
  if ([v6 isSharedMemojiStyleName])
  {
    id v7 = +[NTKCollieStyleEditOptionAvatarRecordCache sharedMemojiDataRepresentationForResourceDirectory:v5];
  }
  else if ([v6 isRegularMemojiStyleName])
  {
    uint64_t v8 = +[NTKCollieStyleEditOption avatarRecordCache];
    id v7 = [v8 memojiDataRepresentationForStyleName:v6 resourceDirectory:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)avatarSha1StringForOption:(id)a3 resourceDirectory:(id)a4
{
  id v5 = a4;
  id v6 = [a3 styleName];
  if (([v6 isSharedMemojiStyleName] & 1) != 0
    || ([v6 isToyboxMemojiStyleName] & 1) != 0
    || [v6 isRegularMemojiStyleName])
  {
    id v7 = +[NTKCollieStyleEditOption avatarRecordCache];
    uint64_t v8 = [v7 memojiSha1StringForStyleName:v6 resourceDirectory:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)hasSnapshotImageForOption:(id)a3 resourceDirectory:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a4;
  id v9 = [a3 styleName];
  id v10 = +[NTKCollieStyleEditOption avatarRecordCache];
  unsigned __int8 v11 = objc_msgSend(v10, "hasSnapshotImageForStyleName:resourceDirectory:size:", v9, v8, width, height);

  return v11;
}

+ (BOOL)hasSharedMemojiForResourceDirectory:(id)a3
{
  return +[NTKCollieStyleEditOptionAvatarRecordCache hasSharedMemojiForResourceDirectory:a3];
}

+ (BOOL)saveSharedMemojiDataRepresentation:(id)a3 resourceDirectory:(id)a4 error:(id *)a5
{
  return +[NTKCollieStyleEditOptionAvatarRecordCache saveSharedMemojiDataRepresentation:a3 resourceDirectory:a4 error:a5];
}

+ (BOOL)validateMemojiDataRepresentation:(id)a3 forDevice:(id)a4 error:(id *)a5
{
  return +[NTKCollieStyleEditOptionAvatarRecordCache validateMemojiDataRepresentation:a3 forDevice:a4 error:a5];
}

+ (BOOL)validateSharedMemojiResourceDirectory:(id)a3 forDevice:(id)a4 error:(id *)a5
{
  return +[NTKCollieStyleEditOptionAvatarRecordCache validateSharedMemojiResourceDirectory:a3 forDevice:a4 error:a5];
}

- (BOOL)isBridgeMemoji
{
  if (![(NTKCollieStyleEditOption *)self isRegularMemoji]) {
    return 0;
  }
  id v3 = [(NTKCollieStyleEditOption *)self styleName];
  id v4 = [v3 memojiIdentifier];

  id v5 = +[NTKCollieStyleEditOption avatarRecordCache];
  unsigned __int8 v6 = [v5 hasAvatarStoreMemojiForIdentifier:v4];

  char v7 = v6 ^ 1;
  return v7;
}

+ (id)bridgeMemojiDataRepresentationForIdentifier:(id)a3 resourceDirectory:(id)a4
{
  return +[NTKCollieStyleEditOptionAvatarRecordCache bridgeMemojiDataRepresentationForIdentifier:a3 resourceDirectory:a4];
}

+ (BOOL)saveBridgeMemojiCustomData:(id)a3 identifier:(id)a4 resourceDirectory:(id)a5 error:(id *)a6
{
  id v9 = a5;
  id v10 = a4;
  unsigned __int8 v11 = +[NTKCollieCustomData dataRepresentationFromCustomData:a3];
  LOBYTE(a6) = +[NTKCollieStyleEditOptionAvatarRecordCache saveBridgeMemojiDataRepresentation:v11 identifier:v10 resourceDirectory:v9 error:a6];

  return (char)a6;
}

- (id)customDataWithResourceDirectory:(id)a3
{
  id v4 = a3;
  if ([(NTKCollieStyleEditOption *)self isRegularMemoji])
  {
    id v5 = [(NTKCollieStyleEditOption *)self styleName];
    unsigned __int8 v6 = [v5 memojiIdentifier];

    if (v6
      && ([(id)objc_opt_class() avatarDataRepresentationForOption:self resourceDirectory:v4],
          (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = (void *)v7;
      id v9 = +[NTKCollieCustomData customDataForDataRepresentation:v7];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (void)pruneResourceDirectory:(id)a3 pruneBridgeMemoji:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[NTKCollieStyleEditOption avatarRecordCache];
  [v6 pruneResourceDirectory:v5 pruneBridgeMemoji:v4];
}

+ (id)neutralPoseForCharacterStyleName:(id)a3
{
  return 0;
}

+ (id)friendlyPoseForCharacterStyleName:(id)a3
{
  return +[AVTAvatarPose friendlyPose];
}

+ (id)sleepPoseForCharacterStyleName:(id)a3
{
  return 0;
}

- (id)_toyboxResolvedPoseStyleName
{
  id v3 = [(NTKCollieStyleEditOption *)self styleName];
  if ([v3 isToyboxAnimojiStyleName])
  {
    BOOL v4 = [(NTKCollieStyleEditOption *)self _toyBoxCharacterStyleNameWithResourceDirectory:0];
  }
  else
  {
    if (![v3 isAnyMemojiStyleName]) {
      goto LABEL_6;
    }
    BOOL v4 = @"memoji-";
  }
  id v5 = v4;

  id v3 = v5;
LABEL_6:

  return v3;
}

- (id)neutralPose
{
  id v2 = [(NTKCollieStyleEditOption *)self _toyboxResolvedPoseStyleName];
  id v3 = [(id)objc_opt_class() neutralPoseForCharacterStyleName:v2];
  if (!v3)
  {
    id v3 = +[AVTAvatarPose neutralPose];
  }

  return v3;
}

- (id)friendlyPose
{
  id v2 = [(NTKCollieStyleEditOption *)self _toyboxResolvedPoseStyleName];
  id v3 = [(id)objc_opt_class() friendlyPoseForCharacterStyleName:v2];
  if (!v3)
  {
    id v3 = +[AVTAvatarPose friendlyPose];
  }

  return v3;
}

- (id)sleepPose
{
  return 0;
}

- (id)watchCoordinatorForAvatar:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toyBoxCharacterStyleName, 0);
  objc_storeStrong((id *)&self->_characterName, 0);

  objc_destroyWeak((id *)&self->_snapshotImage);
}

- (int64_t)swatchStyle
{
  return 3;
}

@end