@interface GKDashboardTurnDetailDataSource
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (GKDashboardTurnDetailDataSource)initWithMatch:(id)a3;
- (GKTurnBasedMatch)match;
- (double)preferredCollectionHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)itemForIndexPath:(id)a3;
- (id)sectionHeaderText;
- (int64_t)itemCount;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)loadDataWithCompletionHandler:(id)a3;
- (void)setMatch:(id)a3;
- (void)setupCollectionView:(id)a3;
@end

@implementation GKDashboardTurnDetailDataSource

- (GKDashboardTurnDetailDataSource)initWithMatch:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardTurnDetailDataSource;
  v5 = [(GKCollectionDataSource *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(GKDashboardTurnDetailDataSource *)v5 setMatch:v4];
    [(GKCollectionDataSource *)v6 setUseStandardHeaders:1];
  }

  return v6;
}

- (void)setupCollectionView:(id)a3
{
  id v4 = a3;
  v5 = +[NSObject _gkNib];
  [v4 registerNib:v5 forCellWithReuseIdentifier:@"turnCell"];
  v6.receiver = self;
  v6.super_class = (Class)GKDashboardTurnDetailDataSource;
  [(GKCollectionDataSource *)&v6 setupCollectionView:v4];
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (int64_t)itemCount
{
  v2 = [(GKTurnBasedMatch *)self->_match participants];
  int64_t v3 = [v2 count];

  return v3;
}

- (double)preferredCollectionHeight
{
  +[GKDashboardPlayerCell preferredCollectionHeight];
  return result;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(GKTurnBasedMatch *)self->_match participants];
  unint64_t v6 = [v5 count];
  if (v6 <= [v4 item])
  {
    objc_super v8 = 0;
  }
  else
  {
    v7 = [(GKTurnBasedMatch *)self->_match participants];
    objc_super v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  }

  return v8;
}

- (id)sectionHeaderText
{
  int64_t v3 = NSString;
  id v4 = GKGameCenterUIFrameworkBundle();
  v5 = GKGetLocalizedStringFromTableInBundle();
  unint64_t v6 = objc_msgSend(v3, "stringWithFormat:", v5, -[GKDashboardTurnDetailDataSource itemCount](self, "itemCount"));

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"turnCell" forIndexPath:v6];
  unint64_t v8 = [v6 item];

  v9 = [(GKTurnBasedMatch *)self->_match participants];
  unint64_t v10 = [v9 count];

  if (v10 <= v8)
  {
    v11 = NSString;
    v12 = [NSString stringWithFormat:@"Assertion failed"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardTurnDetailDataSource.m"];
    id v14 = [v13 lastPathComponent];
    v15 = [v11 stringWithFormat:@"%@ (_match.participants.count > index)\n[%s (%s:%d)]", v12, "-[GKDashboardTurnDetailDataSource collectionView:cellForItemAtIndexPath:]", objc_msgSend(v14, "UTF8String"), 91];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v15 format];
  }
  v16 = [(GKTurnBasedMatch *)self->_match participants];
  v17 = [v16 objectAtIndexedSubscript:v8];

  [v7 setDisplayIndex:v8 + 1];
  [v7 configureForParticipant:v17 inMatch:self->_match];
  objc_msgSend(v7, "setOnDarkBackground:", -[GKCollectionDataSource onDarkBackground](self, "onDarkBackground"));

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  +[GKDashboardTurnCell defaultSize];
  double v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
}

- (GKTurnBasedMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (void).cxx_destruct
{
}

@end