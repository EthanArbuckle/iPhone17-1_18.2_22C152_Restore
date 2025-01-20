@interface NSBundle(MediaControls)
+ (id)mediaControlsBundle;
- (uint64_t)mediaControls_localizedStringForKey:()MediaControls inTable:expectedFormat:;
@end

@implementation NSBundle(MediaControls)

+ (id)mediaControlsBundle
{
  if (mediaControlsBundle___once != -1) {
    dispatch_once(&mediaControlsBundle___once, &__block_literal_global_44);
  }
  v0 = (void *)mediaControlsBundle___mediaControlsBundle;

  return v0;
}

- (uint64_t)mediaControls_localizedStringForKey:()MediaControls inTable:expectedFormat:
{
  return [a1 localizedStringForKey:a3 value:&stru_1F06524E0 table:a4];
}

@end