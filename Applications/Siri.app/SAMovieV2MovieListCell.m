@interface SAMovieV2MovieListCell
- (id)_afui_mapsRelatedChild;
@end

@implementation SAMovieV2MovieListCell

- (id)_afui_mapsRelatedChild
{
  return [(SAMovieV2MovieListCell *)self movieDetailSnippet];
}

@end