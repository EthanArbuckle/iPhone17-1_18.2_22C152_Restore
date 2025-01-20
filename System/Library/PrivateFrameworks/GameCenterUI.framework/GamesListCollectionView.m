@interface GamesListCollectionView
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView)initWithCoder:(id)a3;
- (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation GamesListCollectionView

- (BOOL)canBecomeFocused
{
  v2 = self;
  char v3 = sub_1AF7250A0();

  return v3 & 1;
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)sub_1AF725114(self, (uint64_t)a2, (void (*)(void))sub_1AF725184);
}

- (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView *)sub_1AF72548C(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUIP33_9A92A52BF12BA04A0874017A503C6E7323GamesListCollectionView *)sub_1AF725568(a3);
}

@end