@interface CUINamedExternalLink
- (NSString)assetPackIdentifier;
@end

@implementation CUINamedExternalLink

- (NSString)assetPackIdentifier
{
  v2 = [(CUINamedLookup *)self _rendition];
  return (NSString *)[(CUIThemeRendition *)v2 assetPackIdentifier];
}

@end