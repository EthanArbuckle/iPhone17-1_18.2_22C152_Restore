@interface NSObject(MusicKit_SoftLinking_MPArtworkColorAnalysis)
- (id)_musicKit_self_artworkColorAnalysis;
- (uint64_t)musicKit_backgroundColor;
- (uint64_t)musicKit_primaryTextColor;
- (uint64_t)musicKit_secondaryTextColor;
- (uint64_t)musicKit_tertiaryTextColor;
@end

@implementation NSObject(MusicKit_SoftLinking_MPArtworkColorAnalysis)

- (id)_musicKit_self_artworkColorAnalysis
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getMPArtworkColorAnalysisClass_softClass;
  uint64_t v10 = getMPArtworkColorAnalysisClass_softClass;
  if (!getMPArtworkColorAnalysisClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getMPArtworkColorAnalysisClass_block_invoke;
    v6[3] = &unk_26443F950;
    v6[4] = &v7;
    __getMPArtworkColorAnalysisClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  if (objc_opt_isKindOfClass()) {
    id v4 = a1;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (uint64_t)musicKit_backgroundColor
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkColorAnalysis");
  id v2 = [v1 backgroundColor];
  uint64_t v3 = [v2 CGColor];

  return v3;
}

- (uint64_t)musicKit_primaryTextColor
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkColorAnalysis");
  id v2 = [v1 primaryTextColor];
  uint64_t v3 = [v2 CGColor];

  return v3;
}

- (uint64_t)musicKit_secondaryTextColor
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkColorAnalysis");
  id v2 = [v1 secondaryTextColor];
  uint64_t v3 = [v2 CGColor];

  return v3;
}

- (uint64_t)musicKit_tertiaryTextColor
{
  v1 = objc_msgSend(a1, "_musicKit_self_artworkColorAnalysis");
  id v2 = [v1 tertiaryTextColor];
  uint64_t v3 = [v2 CGColor];

  return v3;
}

@end