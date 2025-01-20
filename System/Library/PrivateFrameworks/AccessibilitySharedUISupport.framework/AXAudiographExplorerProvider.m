@interface AXAudiographExplorerProvider
+ (id)makeAudiographExplorerView:(id)a3;
@end

@implementation AXAudiographExplorerProvider

+ (id)makeAudiographExplorerView:(id)a3
{
  return +[AudiographExplorerViewFactory makeAudiographExplorerUIFor:a3];
}

@end