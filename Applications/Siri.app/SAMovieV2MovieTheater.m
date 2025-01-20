@interface SAMovieV2MovieTheater
- (id)_afui_mapsRelatedChild;
- (id)_afui_mapsRelatedChildren;
@end

@implementation SAMovieV2MovieTheater

- (id)_afui_mapsRelatedChild
{
  return [(SAMovieV2MovieTheater *)self business];
}

- (id)_afui_mapsRelatedChildren
{
  return [(SAMovieV2MovieTheater *)self movies];
}

@end