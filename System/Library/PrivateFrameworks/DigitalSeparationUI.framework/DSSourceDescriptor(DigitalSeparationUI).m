@interface DSSourceDescriptor(DigitalSeparationUI)
- (id)iconForDetail;
- (id)iconForTable;
@end

@implementation DSSourceDescriptor(DigitalSeparationUI)

- (id)iconForDetail
{
  uint64_t v2 = [a1 correspondingApplicationIdentifier];
  if (v2
    && (v3 = (void *)v2,
        [a1 correspondingApplicationIdentifier],
        v4 = objc_claimAutoreleasedReturnValue(),
        BOOL v5 = +[DSUIUtilities isPlaceholderForApp:v4],
        v4,
        v3,
        !v5))
  {
    v10 = (void *)MEMORY[0x263F827E8];
    v6 = [a1 correspondingApplicationIdentifier];
    v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 scale];
    uint64_t v9 = objc_msgSend(v10, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 2);
  }
  else
  {
    v6 = [a1 objectForKeyedSubscript:*MEMORY[0x263F3A300]];
    v7 = (void *)MEMORY[0x263F827E8];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v7 imageNamed:v6 inBundle:v8];
  }
  v11 = (void *)v9;

  return v11;
}

- (id)iconForTable
{
  uint64_t v2 = [a1 correspondingApplicationIdentifier];
  if (v2
    && (v3 = (void *)v2,
        [a1 correspondingApplicationIdentifier],
        v4 = objc_claimAutoreleasedReturnValue(),
        BOOL v5 = +[DSUIUtilities isPlaceholderForApp:v4],
        v4,
        v3,
        !v5))
  {
    v14 = (void *)MEMORY[0x263F827E8];
    v6 = [a1 correspondingApplicationIdentifier];
    uint64_t v9 = [MEMORY[0x263F82B60] mainScreen];
    [v9 scale];
    v13 = objc_msgSend(v14, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0);
  }
  else
  {
    v6 = [a1 objectForKeyedSubscript:*MEMORY[0x263F3A300]];
    v7 = (void *)MEMORY[0x263F827E8];
    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v7 imageNamed:v6 inBundle:v8];

    v10 = +[DSUIUtilities appIconForAppID:&stru_26E9097D0 format:0];
    [v10 size];
    double v12 = v11;
    [v10 size];
    v13 = [v9 imageByPreparingThumbnailOfSize:v12];
  }
  return v13;
}

@end