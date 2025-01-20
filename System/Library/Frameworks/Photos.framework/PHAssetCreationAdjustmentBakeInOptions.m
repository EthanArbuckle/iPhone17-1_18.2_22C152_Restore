@interface PHAssetCreationAdjustmentBakeInOptions
+ (BOOL)supportsSecureCoding;
+ (id)adjustmentBakeInOptionsForPublishingOriginals;
- (BOOL)flattenLivePhotoToStillIfNeeded;
- (BOOL)shouldBakeInIfAdjustedByThirdParty;
- (BOOL)shouldBakeInIfContainsPenultimateResources;
- (BOOL)shouldBakeInIfCropped;
- (BOOL)shouldBakeInIfLivePhotoMuted;
- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled;
- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled;
- (BOOL)shouldBakeInIfTimelineTrimmed;
- (PHAssetCreationAdjustmentBakeInOptions)init;
- (PHAssetCreationAdjustmentBakeInOptions)initWithCoder:(id)a3;
- (PHAssetCreationAdjustmentBakeInOptions)initWithXPCDict:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)plRepresentation;
- (void)encodeToXPCDict:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFlattenLivePhotoToStillIfNeeded:(BOOL)a3;
- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3;
- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3;
- (void)setShouldBakeInIfCropped:(BOOL)a3;
- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3;
- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3;
- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3;
- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3;
@end

@implementation PHAssetCreationAdjustmentBakeInOptions

- (void)setFlattenLivePhotoToStillIfNeeded:(BOOL)a3
{
  self->_flattenLivePhotoToStillIfNeeded = a3;
}

- (BOOL)flattenLivePhotoToStillIfNeeded
{
  return self->_flattenLivePhotoToStillIfNeeded;
}

- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3
{
  self->_shouldBakeInIfContainsPenultimateResources = a3;
}

- (BOOL)shouldBakeInIfContainsPenultimateResources
{
  return self->_shouldBakeInIfContainsPenultimateResources;
}

- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3
{
  self->_shouldBakeInIfPortraitDepthEffectEnabled = a3;
}

- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled
{
  return self->_shouldBakeInIfPortraitDepthEffectEnabled;
}

- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3
{
  self->_shouldBakeInIfTimelineTrimmed = a3;
}

- (BOOL)shouldBakeInIfTimelineTrimmed
{
  return self->_shouldBakeInIfTimelineTrimmed;
}

- (void)setShouldBakeInIfCropped:(BOOL)a3
{
  self->_shouldBakeInIfCropped = a3;
}

- (BOOL)shouldBakeInIfCropped
{
  return self->_shouldBakeInIfCropped;
}

- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3
{
  self->_shouldBakeInIfAdjustedByThirdParty = a3;
}

- (BOOL)shouldBakeInIfAdjustedByThirdParty
{
  return self->_shouldBakeInIfAdjustedByThirdParty;
}

- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoMuted = a3;
}

- (BOOL)shouldBakeInIfLivePhotoMuted
{
  return self->_shouldBakeInIfLivePhotoMuted;
}

- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoPlaybackDisabled = a3;
}

- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled
{
  return self->_shouldBakeInIfLivePhotoPlaybackDisabled;
}

- (PHAssetCreationAdjustmentBakeInOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetCreationAdjustmentBakeInOptions;
  v5 = [(PHAssetCreationAdjustmentBakeInOptions *)&v15 init];
  if (v5)
  {
    v6 = [NSString stringWithUTF8String:"livePhotoDisabled"];
    v5->_shouldBakeInIfLivePhotoPlaybackDisabled = [v4 decodeBoolForKey:v6];

    v7 = [NSString stringWithUTF8String:"livePhotoMuted"];
    v5->_shouldBakeInIfLivePhotoMuted = [v4 decodeBoolForKey:v7];

    v8 = [NSString stringWithUTF8String:"thirdPartyAdjustments"];
    v5->_shouldBakeInIfAdjustedByThirdParty = [v4 decodeBoolForKey:v8];

    v9 = [NSString stringWithUTF8String:"cropped"];
    v5->_shouldBakeInIfCropped = [v4 decodeBoolForKey:v9];

    v10 = [NSString stringWithUTF8String:"timelineTrimmed"];
    v5->_shouldBakeInIfTimelineTrimmed = [v4 decodeBoolForKey:v10];

    v11 = [NSString stringWithUTF8String:"portraitDepthEffect"];
    v5->_shouldBakeInIfPortraitDepthEffectEnabled = [v4 decodeBoolForKey:v11];

    v12 = [NSString stringWithUTF8String:"containsPenultimateResources"];
    v5->_shouldBakeInIfContainsPenultimateResources = [v4 decodeBoolForKey:v12];

    v13 = [NSString stringWithUTF8String:"flattenLivePhotoToStillIfNeeded"];
    v5->_flattenLivePhotoToStillIfNeeded = [v4 decodeBoolForKey:v13];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL shouldBakeInIfLivePhotoPlaybackDisabled = self->_shouldBakeInIfLivePhotoPlaybackDisabled;
  v5 = NSString;
  id v6 = a3;
  v7 = [v5 stringWithUTF8String:"livePhotoDisabled"];
  [v6 encodeBool:shouldBakeInIfLivePhotoPlaybackDisabled forKey:v7];

  BOOL shouldBakeInIfLivePhotoMuted = self->_shouldBakeInIfLivePhotoMuted;
  v9 = [NSString stringWithUTF8String:"livePhotoMuted"];
  [v6 encodeBool:shouldBakeInIfLivePhotoMuted forKey:v9];

  BOOL shouldBakeInIfAdjustedByThirdParty = self->_shouldBakeInIfAdjustedByThirdParty;
  v11 = [NSString stringWithUTF8String:"thirdPartyAdjustments"];
  [v6 encodeBool:shouldBakeInIfAdjustedByThirdParty forKey:v11];

  BOOL shouldBakeInIfCropped = self->_shouldBakeInIfCropped;
  v13 = [NSString stringWithUTF8String:"cropped"];
  [v6 encodeBool:shouldBakeInIfCropped forKey:v13];

  BOOL shouldBakeInIfTimelineTrimmed = self->_shouldBakeInIfTimelineTrimmed;
  objc_super v15 = [NSString stringWithUTF8String:"timelineTrimmed"];
  [v6 encodeBool:shouldBakeInIfTimelineTrimmed forKey:v15];

  BOOL shouldBakeInIfPortraitDepthEffectEnabled = self->_shouldBakeInIfPortraitDepthEffectEnabled;
  v17 = [NSString stringWithUTF8String:"portraitDepthEffect"];
  [v6 encodeBool:shouldBakeInIfPortraitDepthEffectEnabled forKey:v17];

  BOOL shouldBakeInIfContainsPenultimateResources = self->_shouldBakeInIfContainsPenultimateResources;
  v19 = [NSString stringWithUTF8String:"containsPenultimateResources"];
  [v6 encodeBool:shouldBakeInIfContainsPenultimateResources forKey:v19];

  BOOL flattenLivePhotoToStillIfNeeded = self->_flattenLivePhotoToStillIfNeeded;
  id v21 = [NSString stringWithUTF8String:"flattenLivePhotoToStillIfNeeded"];
  [v6 encodeBool:flattenLivePhotoToStillIfNeeded forKey:v21];
}

- (id)plRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8A958]);
  copyPropertiesFromObjectAToObjectB(self, v3);

  return v3;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PHAssetCreationAdjustmentBakeInOptions;
  id v3 = [(PHAssetCreationAdjustmentBakeInOptions *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" shouldBakeInIfLivePhotoPlaybackDisabled=%d, shouldBakeInIfLivePhotoMuted=%d, shouldBakeInIfAdjustedByThirdParty=%d, shouldBakeInIfCropped=%d, shouldBakeInIfTimelineTrimmed=%d, shouldBakeInIfPortraitDepthEffectEnabled=%d, shouldBakeInIfContainsPenultimateResources=%d, flattenLivePhotoToStillIfNeeded=%d", self->_shouldBakeInIfLivePhotoPlaybackDisabled, self->_shouldBakeInIfLivePhotoMuted, self->_shouldBakeInIfAdjustedByThirdParty, self->_shouldBakeInIfCropped, self->_shouldBakeInIfTimelineTrimmed, self->_shouldBakeInIfPortraitDepthEffectEnabled, self->_shouldBakeInIfContainsPenultimateResources, self->_flattenLivePhotoToStillIfNeeded];

  return v4;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "adjustmentBakeInOptions", xdict);

  xpc_dictionary_set_BOOL(xdict, "livePhotoDisabled", self->_shouldBakeInIfLivePhotoPlaybackDisabled);
  xpc_dictionary_set_BOOL(xdict, "livePhotoMuted", self->_shouldBakeInIfLivePhotoMuted);
  xpc_dictionary_set_BOOL(xdict, "thirdPartyAdjustments", self->_shouldBakeInIfAdjustedByThirdParty);
  xpc_dictionary_set_BOOL(xdict, "cropped", self->_shouldBakeInIfCropped);
  xpc_dictionary_set_BOOL(xdict, "timelineTrimmed", self->_shouldBakeInIfTimelineTrimmed);
  xpc_dictionary_set_BOOL(xdict, "portraitDepthEffect", self->_shouldBakeInIfPortraitDepthEffectEnabled);
  xpc_dictionary_set_BOOL(xdict, "containsPenultimateResources", self->_shouldBakeInIfContainsPenultimateResources);
  xpc_dictionary_set_BOOL(xdict, "flattenLivePhotoToStillIfNeeded", self->_flattenLivePhotoToStillIfNeeded);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PHAssetCreationAdjustmentBakeInOptions);
  [(PHAssetCreationAdjustmentBakeInOptions *)v4 setShouldBakeInIfLivePhotoPlaybackDisabled:self->_shouldBakeInIfLivePhotoPlaybackDisabled];
  [(PHAssetCreationAdjustmentBakeInOptions *)v4 setShouldBakeInIfLivePhotoMuted:self->_shouldBakeInIfLivePhotoMuted];
  [(PHAssetCreationAdjustmentBakeInOptions *)v4 setShouldBakeInIfAdjustedByThirdParty:self->_shouldBakeInIfAdjustedByThirdParty];
  [(PHAssetCreationAdjustmentBakeInOptions *)v4 setShouldBakeInIfCropped:self->_shouldBakeInIfCropped];
  [(PHAssetCreationAdjustmentBakeInOptions *)v4 setShouldBakeInIfTimelineTrimmed:self->_shouldBakeInIfTimelineTrimmed];
  [(PHAssetCreationAdjustmentBakeInOptions *)v4 setShouldBakeInIfPortraitDepthEffectEnabled:self->_shouldBakeInIfPortraitDepthEffectEnabled];
  [(PHAssetCreationAdjustmentBakeInOptions *)v4 setShouldBakeInIfContainsPenultimateResources:self->_shouldBakeInIfContainsPenultimateResources];
  [(PHAssetCreationAdjustmentBakeInOptions *)v4 setFlattenLivePhotoToStillIfNeeded:self->_flattenLivePhotoToStillIfNeeded];
  return v4;
}

- (PHAssetCreationAdjustmentBakeInOptions)initWithXPCDict:(id)a3
{
  id v4 = a3;
  v5 = [(PHAssetCreationAdjustmentBakeInOptions *)self init];
  if (v5)
  {
    objc_super v6 = xpc_dictionary_get_value(v4, "adjustmentBakeInOptions");
    v7 = v6;
    if (v6)
    {
      v5->_BOOL shouldBakeInIfLivePhotoPlaybackDisabled = xpc_dictionary_get_BOOL(v6, "livePhotoDisabled");
      v5->_BOOL shouldBakeInIfLivePhotoMuted = xpc_dictionary_get_BOOL(v7, "livePhotoMuted");
      v5->_BOOL shouldBakeInIfAdjustedByThirdParty = xpc_dictionary_get_BOOL(v7, "thirdPartyAdjustments");
      v5->_BOOL shouldBakeInIfCropped = xpc_dictionary_get_BOOL(v7, "cropped");
      v5->_BOOL shouldBakeInIfTimelineTrimmed = xpc_dictionary_get_BOOL(v7, "timelineTrimmed");
      v5->_BOOL shouldBakeInIfPortraitDepthEffectEnabled = xpc_dictionary_get_BOOL(v7, "portraitDepthEffect");
      v5->_BOOL shouldBakeInIfContainsPenultimateResources = xpc_dictionary_get_BOOL(v7, "containsPenultimateResources");
      v5->_BOOL flattenLivePhotoToStillIfNeeded = xpc_dictionary_get_BOOL(v7, "flattenLivePhotoToStillIfNeeded");
    }
  }
  return v5;
}

- (PHAssetCreationAdjustmentBakeInOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHAssetCreationAdjustmentBakeInOptions;
  result = [(PHAssetCreationAdjustmentBakeInOptions *)&v3 init];
  if (result)
  {
    result->_BOOL shouldBakeInIfTimelineTrimmed = 1;
    *(_DWORD *)&result->_BOOL shouldBakeInIfLivePhotoPlaybackDisabled = 16843009;
    *(_WORD *)&result->_BOOL shouldBakeInIfPortraitDepthEffectEnabled = 256;
    result->_BOOL flattenLivePhotoToStillIfNeeded = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)adjustmentBakeInOptionsForPublishingOriginals
{
  v2 = objc_alloc_init(PHAssetCreationAdjustmentBakeInOptions);
  [(PHAssetCreationAdjustmentBakeInOptions *)v2 setShouldBakeInIfLivePhotoPlaybackDisabled:0];
  [(PHAssetCreationAdjustmentBakeInOptions *)v2 setShouldBakeInIfLivePhotoMuted:0];
  [(PHAssetCreationAdjustmentBakeInOptions *)v2 setShouldBakeInIfAdjustedByThirdParty:0];
  [(PHAssetCreationAdjustmentBakeInOptions *)v2 setShouldBakeInIfCropped:0];
  [(PHAssetCreationAdjustmentBakeInOptions *)v2 setShouldBakeInIfTimelineTrimmed:0];
  [(PHAssetCreationAdjustmentBakeInOptions *)v2 setShouldBakeInIfPortraitDepthEffectEnabled:0];
  [(PHAssetCreationAdjustmentBakeInOptions *)v2 setShouldBakeInIfContainsPenultimateResources:0];
  [(PHAssetCreationAdjustmentBakeInOptions *)v2 setFlattenLivePhotoToStillIfNeeded:0];

  return v2;
}

@end