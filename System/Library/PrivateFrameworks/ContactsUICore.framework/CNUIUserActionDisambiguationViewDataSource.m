@interface CNUIUserActionDisambiguationViewDataSource
- (id)contactActionsView:(id)a3 imageForActionCategory:(id)a4;
@end

@implementation CNUIUserActionDisambiguationViewDataSource

- (id)contactActionsView:(id)a3 imageForActionCategory:(id)a4
{
  return +[_CNUIUserActionImageProvider imageForActionType:a4 imageStyle:0];
}

@end