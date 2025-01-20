@interface MPModelLibraryFavoriteEntityRequestAction
- (MPModelLibraryFavoriteEntityRequestAction)initWithChangeAction:(int64_t)a3;
- (id)description;
- (int64_t)changeRequestAction;
@end

@implementation MPModelLibraryFavoriteEntityRequestAction

- (int64_t)changeRequestAction
{
  return self->_changeRequestAction;
}

- (id)description
{
  v3 = NSString;
  v4 = MPNSStringForFavoriteEntityChangeRequestAction(self->_changeRequestAction);
  v5 = [v3 stringWithFormat:@"MPModelLibraryFavoriteEntityRequestAction=%p, action=%@", self, v4];

  return v5;
}

- (MPModelLibraryFavoriteEntityRequestAction)initWithChangeAction:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelLibraryFavoriteEntityRequestAction;
  result = [(MPModelLibraryFavoriteEntityRequestAction *)&v5 init];
  if (result) {
    result->_changeRequestAction = a3;
  }
  return result;
}

@end