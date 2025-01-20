@interface HFMediaPlaybackActionBuilder
+ (Class)homeKitRepresentationClass;
- (BOOL)canUpdateWithActionBuilder:(id)a3;
- (BOOL)hasSameTargetAsAction:(id)a3;
- (BOOL)isAffectedByEndEvents;
- (BOOL)isMediaActionValid:(id *)a3;
- (BOOL)requiresDeviceUnlock;
- (BOOL)updateWithActionBuilder:(id)a3;
- (HFMediaPlaybackActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HFPlaybackArchive)playbackArchive;
- (NSNumber)targetVolume;
- (NSSet)accessories;
- (NSSet)mediaProfiles;
- (NSString)localizedDescription;
- (id)commitItem;
- (id)compareToObject:(id)a3;
- (id)containedAccessoryRepresentables;
- (id)copyForCreatingNewAction;
- (id)createNewAction;
- (id)description;
- (id)mediaProfileContainersForAccessories:(id)a3 home:(id)a4;
- (id)performValidation;
- (id)validationError;
- (int64_t)targetPlayState;
- (void)_ensureConsistency;
- (void)defaultActionIfMediaActionInvalid;
- (void)setAccessories:(id)a3;
- (void)setMediaProfiles:(id)a3;
- (void)setPlaybackArchive:(id)a3;
- (void)setTargetPlayState:(int64_t)a3;
- (void)setTargetVolume:(id)a3;
@end

@implementation HFMediaPlaybackActionBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFMediaPlaybackActionBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)HFMediaPlaybackActionBuilder;
  v8 = [(HFItemBuilder *)&v29 initWithExistingObject:a3 inHome:v7];
  v9 = v8;
  if (v8)
  {
    v10 = [(HFActionBuilder *)v8 action];
    v11 = [v10 mediaProfiles];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __62__HFMediaPlaybackActionBuilder_initWithExistingObject_inHome___block_invoke;
    v27[3] = &unk_264091378;
    id v12 = v7;
    id v28 = v12;
    v13 = objc_msgSend(v11, "na_map:", v27);
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x263EFFA08] set];
    }
    v16 = v15;

    v17 = [(HFMediaPlaybackActionBuilder *)v9 mediaProfileContainersForAccessories:v16 home:v12];
    objc_storeStrong((id *)&v9->_accessories, v16);
    objc_storeStrong((id *)&v9->_mediaProfiles, v17);
    v18 = [(HFActionBuilder *)v9 action];
    v9->_targetPlayState = [v18 state];

    v19 = [(HFActionBuilder *)v9 action];
    uint64_t v20 = [v19 volume];
    targetVolume = v9->_targetVolume;
    v9->_targetVolume = (NSNumber *)v20;

    v22 = [(HFActionBuilder *)v9 action];
    v23 = [v22 playbackArchive];
    if (v23)
    {
      v24 = [HFPlaybackArchive alloc];
      v14 = [(HFActionBuilder *)v9 action];
      v4 = [v14 playbackArchive];
      v25 = [(HFPlaybackArchive *)v24 initWithMediaPlayerPlaybackArchive:v4];
    }
    else
    {
      v25 = 0;
    }
    objc_storeStrong((id *)&v9->_playbackArchive, v25);
    if (v23)
    {
    }
  }

  return v9;
}

id __62__HFMediaPlaybackActionBuilder_initWithExistingObject_inHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) accessories];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__HFMediaPlaybackActionBuilder_initWithExistingObject_inHome___block_invoke_2;
  v8[3] = &unk_26408D968;
  id v9 = v3;
  id v5 = v3;
  v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v8);

  return v6;
}

uint64_t __62__HFMediaPlaybackActionBuilder_initWithExistingObject_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaProfile];
  v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (BOOL)canUpdateWithActionBuilder:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)updateWithActionBuilder:(id)a3
{
  id v4 = a3;
  if ([(HFMediaPlaybackActionBuilder *)self canUpdateWithActionBuilder:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(HFMediaPlaybackActionBuilder *)self accessories];
    id v7 = (void *)[v6 mutableCopy];

    v8 = [v5 accessories];
    [v7 unionSet:v8];

    id v9 = [(HFMediaPlaybackActionBuilder *)self accessories];
    char v10 = [v7 isEqualToSet:v9];

    if ((v10 & 1) == 0) {
      [(HFMediaPlaybackActionBuilder *)self setAccessories:v7];
    }
    char v11 = v10 ^ 1;
    id v12 = [(HFMediaPlaybackActionBuilder *)self accessories];
    v13 = [(HFItemBuilder *)self home];
    v14 = [(HFMediaPlaybackActionBuilder *)self mediaProfileContainersForAccessories:v12 home:v13];

    uint64_t v15 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
    if ((void *)v15 == v14)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
      char v18 = [v17 isEqualToSet:v14];

      if ((v18 & 1) == 0)
      {
        [(HFMediaPlaybackActionBuilder *)self setMediaProfiles:v14];
        char v11 = 1;
      }
    }
    int64_t v19 = [(HFMediaPlaybackActionBuilder *)self targetPlayState];
    if (v19 != [v5 targetPlayState])
    {
      -[HFMediaPlaybackActionBuilder setTargetPlayState:](self, "setTargetPlayState:", [v5 targetPlayState]);
      char v11 = 1;
    }
    uint64_t v20 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
    v21 = [v5 playbackArchive];

    if (v20 != v21)
    {
      v22 = [v5 playbackArchive];
      [(HFMediaPlaybackActionBuilder *)self setPlaybackArchive:v22];

      char v11 = 1;
    }
    v23 = [(HFMediaPlaybackActionBuilder *)self targetVolume];
    v24 = [v5 targetVolume];
    id v25 = v23;
    id v26 = v24;
    if (v25 == v26)
    {
    }
    else
    {
      v27 = v26;
      if (v25)
      {
        char v28 = [v25 isEqual:v26];

        if (v28) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      id v25 = [v5 targetVolume];
      [(HFMediaPlaybackActionBuilder *)self setTargetVolume:v25];
      char v11 = 1;
    }

LABEL_21:
    goto LABEL_22;
  }
  char v11 = 0;
LABEL_22:

  return v11;
}

- (BOOL)requiresDeviceUnlock
{
  return 0;
}

- (BOOL)isAffectedByEndEvents
{
  return [(HFMediaPlaybackActionBuilder *)self targetPlayState] == 1;
}

- (id)createNewAction
{
  [(HFMediaPlaybackActionBuilder *)self _ensureConsistency];
  id v3 = 0;
  if ([(HFMediaPlaybackActionBuilder *)self isMediaActionValid:0])
  {
    id v4 = [(HFMediaPlaybackActionBuilder *)self accessories];
    id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_139_1);

    if ([v5 count])
    {
      id v6 = objc_alloc(MEMORY[0x263F0E510]);
      int64_t v7 = [(HFMediaPlaybackActionBuilder *)self targetPlayState];
      v8 = [(HFMediaPlaybackActionBuilder *)self targetVolume];
      id v9 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
      char v10 = [v9 mediaPlayerPlaybackArchive];
      id v3 = (void *)[v6 initWithMediaProfiles:v5 playbackState:v7 volume:v8 playbackArchive:v10];
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

uint64_t __47__HFMediaPlaybackActionBuilder_createNewAction__block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

- (void)setMediaProfiles:(id)a3
{
  if (self->_mediaProfiles != a3)
  {
    id v4 = objc_msgSend(a3, "na_flatMap:", &__block_literal_global_142);
    [(HFMediaPlaybackActionBuilder *)self setAccessories:v4];

    id v8 = [(HFMediaPlaybackActionBuilder *)self accessories];
    id v5 = [(HFItemBuilder *)self home];
    id v6 = [(HFMediaPlaybackActionBuilder *)self mediaProfileContainersForAccessories:v8 home:v5];
    mediaProfiles = self->_mediaProfiles;
    self->_mediaProfiles = v6;
  }
}

uint64_t __49__HFMediaPlaybackActionBuilder_setMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessories];
}

- (id)mediaProfileContainersForAccessories:(id)a3 home:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    NSLog(&cfstr_AccessoriesSho.isa);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke;
  v10[3] = &unk_2640913E8;
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_msgSend(v5, "na_map:", v10);

  return v8;
}

id __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaProfile];
  id v4 = [*(id *)(a1 + 32) mediaSystems];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke_2;
  v10[3] = &unk_2640913C0;
  id v11 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v10);

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

uint64_t __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke_3;
  v6[3] = &unk_26408D968;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __74__HFMediaPlaybackActionBuilder_mediaProfileContainersForAccessories_home___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 mediaProfile];
  uint64_t v4 = objc_msgSend(v3, "hf_mediaRouteIdentifier");
  id v5 = objc_msgSend(*(id *)(a1 + 32), "hf_mediaRouteIdentifier");
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)hasSameTargetAsAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
    id v9 = [v7 mediaProfiles];
    char v10 = [v8 intersectsSet:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyForCreatingNewAction
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(HFItemBuilder *)self home];
  id v5 = (void *)[v3 initWithHome:v4];

  objc_msgSend(v5, "setTargetPlayState:", -[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState"));
  uint64_t v6 = [(HFMediaPlaybackActionBuilder *)self targetVolume];
  id v7 = (void *)[v6 copy];
  [v5 setTargetVolume:v7];

  id v8 = [HFPlaybackArchive alloc];
  id v9 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
  char v10 = [v9 mediaPlayerPlaybackArchive];
  id v11 = (void *)[v10 copyWithOptions:0];
  id v12 = [(HFPlaybackArchive *)v8 initWithMediaPlayerPlaybackArchive:v11];
  [v5 setPlaybackArchive:v12];

  v13 = [(HFMediaPlaybackActionBuilder *)self accessories];
  v14 = (void *)[v13 copy];
  [v5 setAccessories:v14];

  uint64_t v15 = [v5 accessories];
  v16 = [v5 home];
  v17 = [v5 mediaProfileContainersForAccessories:v15 home:v16];
  [v5 setMediaProfiles:v17];

  return v5;
}

- (NSString)localizedDescription
{
  if ([(HFMediaPlaybackActionBuilder *)self targetPlayState] == 1)
  {
    id v3 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];

    if (v3) {
      id v4 = @"HFMediaActionPlay";
    }
    else {
      id v4 = @"HFMediaActionResume";
    }
  }
  else if ([(HFMediaPlaybackActionBuilder *)self targetPlayState] == 2)
  {
    id v4 = @"HFMediaActionPause";
  }
  else
  {
    id v4 = @"HFMediaSelectionCustomVolumeTitle";
  }
  id v5 = _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  return (NSString *)v5;
}

- (id)description
{
  id v3 = NSStringFromHMMediaPlaybackState([(HFMediaPlaybackActionBuilder *)self targetPlayState]);
  id v4 = [v3 lowercaseString];

  id v5 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    id v7 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
    id v8 = [v7 anyObject];
    id v9 = objc_msgSend(v8, "hf_displayName");
  }
  else
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu accessories", v6);
  }
  char v10 = [NSString stringWithFormat:@"<set playback on %@ to %@>", v9, v4];

  return v10;
}

- (id)containedAccessoryRepresentables
{
  v2 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
  id v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_168);
  id v4 = [v3 allObjects];

  return v4;
}

id __64__HFMediaPlaybackActionBuilder_containedAccessoryRepresentables__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C0FB658]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)defaultActionIfMediaActionInvalid
{
  if ([(HFMediaPlaybackActionBuilder *)self targetPlayState] == 1)
  {
    id v3 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];

    if (v3)
    {
      id v4 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
      id v5 = [v4 mediaPlayerPlaybackArchive];

      if (!v5)
      {
        [(HFMediaPlaybackActionBuilder *)self setPlaybackArchive:0];
      }
    }
  }
}

- (BOOL)isMediaActionValid:(id *)a3
{
  id v5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F58160] code:2 userInfo:0];
  int64_t v6 = [(HFMediaPlaybackActionBuilder *)self targetPlayState];
  switch(v6)
  {
    case 2:
      id v7 = [(HFMediaPlaybackActionBuilder *)self targetVolume];
      BOOL v8 = v7 == 0;
      goto LABEL_13;
    case 1:
      id v9 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
      if (v9)
      {
        char v10 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
        id v11 = [v10 mediaPlayerPlaybackArchive];
        BOOL v8 = v11 != 0;
      }
      else
      {
        BOOL v8 = 1;
      }

      id v12 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];

      if (v12 && !v8)
      {
        objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 53, @"HFOperationMediaSelection", 0);
        v13 = BOOL v8 = 0;
        id v7 = v5;
        id v5 = (void *)v13;
        goto LABEL_13;
      }
      break;
    case 0:
      id v7 = [(HFMediaPlaybackActionBuilder *)self targetVolume];
      BOOL v8 = v7 != 0;
LABEL_13:

      break;
    default:
      BOOL v8 = 0;
      break;
  }
  if (a3 && !v8) {
    *a3 = v5;
  }
  v14 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
  if ([v14 count]) {
    BOOL v15 = v8;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)performValidation
{
  [(HFMediaPlaybackActionBuilder *)self _ensureConsistency];
  id v7 = 0;
  BOOL v3 = [(HFMediaPlaybackActionBuilder *)self isMediaActionValid:&v7];
  id v4 = v7;
  if (v3) {
    [MEMORY[0x263F58190] futureWithNoResult];
  }
  else {
  id v5 = [MEMORY[0x263F58190] futureWithError:v4];
  }

  return v5;
}

- (id)validationError
{
  [(HFMediaPlaybackActionBuilder *)self _ensureConsistency];
  id v8 = 0;
  BOOL v3 = [(HFMediaPlaybackActionBuilder *)self isMediaActionValid:&v8];
  id v4 = v8;
  id v5 = v4;
  id v6 = 0;
  if (!v3) {
    id v6 = v4;
  }

  return v6;
}

- (void)_ensureConsistency
{
  if ([(HFMediaPlaybackActionBuilder *)self targetPlayState] == 1)
  {
    id v4 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
    int v5 = [v4 isRepeatEnabled];
    if (v5)
    {
      id v2 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
      uint64_t v6 = [v2 isRepeatSupported];
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
    [v7 setRepeatEnabled:v6];

    if (v5) {
    id v8 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
    }
    int v9 = [v8 isShuffleEnabled];
    if (v9)
    {
      id v2 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
      uint64_t v10 = [v2 isShuffleSupported];
    }
    else
    {
      uint64_t v10 = 0;
    }
    id v11 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
    [v11 setShuffleEnabled:v10];

    if (v9) {
  }
    }
  else
  {
    [(HFMediaPlaybackActionBuilder *)self setPlaybackArchive:0];
  }
  if ([(HFMediaPlaybackActionBuilder *)self targetPlayState] == 2)
  {
    [(HFMediaPlaybackActionBuilder *)self setTargetVolume:0];
  }
}

- (id)commitItem
{
  BOOL v3 = [(HFMediaPlaybackActionBuilder *)self performValidation];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke;
  v7[3] = &unk_26408CDC8;
  v7[4] = self;
  id v4 = [v3 flatMap:v7];
  int v5 = [v4 recover:&__block_literal_global_289];

  return v5;
}

id __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accessories];
  BOOL v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_287);

  id v4 = [*(id *)(a1 + 32) action];

  if (v4)
  {
    int v5 = [*(id *)(a1 + 32) action];
    uint64_t v6 = (void *)[v5 mutableCopy];

    objc_msgSend(v6, "setState:", objc_msgSend(*(id *)(a1 + 32), "targetPlayState"));
    id v7 = [*(id *)(a1 + 32) targetVolume];
    [v6 setVolume:v7];

    id v8 = [*(id *)(a1 + 32) playbackArchive];
    int v9 = [v8 mediaPlayerPlaybackArchive];
    [v6 setPlaybackArchive:v9];

    [v6 setMediaProfiles:v3];
    uint64_t v10 = (void *)MEMORY[0x263F58190];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_3;
    v24[3] = &unk_26408E218;
    v24[4] = *(void *)(a1 + 32);
    id v25 = v6;
    id v11 = v6;
    id v12 = [v10 futureWithErrorOnlyHandlerAdapterBlock:v24];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_4;
    v23[3] = &unk_26408CDC8;
    v23[4] = *(void *)(a1 + 32);
    uint64_t v13 = [v12 flatMap:v23];
  }
  else
  {
    id v14 = objc_alloc(MEMORY[0x263F0E510]);
    uint64_t v15 = [*(id *)(a1 + 32) targetPlayState];
    v16 = [*(id *)(a1 + 32) targetVolume];
    v17 = [*(id *)(a1 + 32) playbackArchive];
    char v18 = [v17 mediaPlayerPlaybackArchive];
    int64_t v19 = (void *)[v14 initWithMediaProfiles:v3 playbackState:v15 volume:v16 playbackArchive:v18];
    [*(id *)(a1 + 32) setAction:v19];

    uint64_t v20 = (void *)MEMORY[0x263F58190];
    v21 = [*(id *)(a1 + 32) action];
    uint64_t v13 = [v20 futureWithResult:v21];
  }
  return v13;
}

uint64_t __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 mediaProfile];
}

void __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 action];
  [v5 updateWithAction:*(void *)(a1 + 40) completionHandler:v4];
}

id __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F58190];
  id v2 = [*(id *)(a1 + 32) action];
  BOOL v3 = [v1 futureWithResult:v2];

  return v3;
}

uint64_t __42__HFMediaPlaybackActionBuilder_commitItem__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F58190] futureWithError:a2];
}

- (NSSet)mediaProfiles
{
  return self->_mediaProfiles;
}

- (int64_t)targetPlayState
{
  return self->_targetPlayState;
}

- (void)setTargetPlayState:(int64_t)a3
{
  self->_targetPlayState = a3;
}

- (NSNumber)targetVolume
{
  return self->_targetVolume;
}

- (void)setTargetVolume:(id)a3
{
}

- (HFPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (void)setPlaybackArchive:(id)a3
{
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_targetVolume, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HFMediaPlaybackActionBuilder;
  id v5 = [(HFActionBuilder *)&v25 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    uint64_t v6 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
    id v7 = [v4 mediaProfiles];
    char v8 = [v6 isEqualToSet:v7];

    if ((v8 & 1) == 0)
    {
      int v9 = [HFPropertyDifference alloc];
      uint64_t v10 = [(HFMediaPlaybackActionBuilder *)self mediaProfiles];
      id v11 = (void *)[v10 copy];
      id v12 = [v4 mediaProfiles];
      uint64_t v13 = (void *)[v12 copy];
      id v14 = [(HFPropertyDifference *)v9 initWithObjectA:v11 toObjectB:v13 key:@"mediaProfiles" priority:3];
      [v5 add:v14];
    }
    uint64_t v15 = [(HFMediaPlaybackActionBuilder *)self playbackArchive];
    v16 = [v4 playbackArchive];
    v17 = +[HFPropertyDifference compareObjectA:v15 toObjectB:v16 key:@"playbackArchive" priority:1];
    [v5 add:v17];

    char v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFMediaPlaybackActionBuilder targetPlayState](self, "targetPlayState"));
    int64_t v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "targetPlayState"));
    uint64_t v20 = +[HFPropertyDifference compareObjectA:v18 toObjectB:v19 key:@"targetPlayState" priority:3];
    [v5 add:v20];

    v21 = [(HFMediaPlaybackActionBuilder *)self targetVolume];
    v22 = [v4 targetVolume];
    v23 = +[HFPropertyDifference compareObjectA:v21 toObjectB:v22 key:@"targetVolume" priority:3];
    [v5 add:v23];
  }
  return v5;
}

@end