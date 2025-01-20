@interface SRGuideDomainViewController
- (BOOL)_showsCategoriesForSection:(unint64_t)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)usePlatterStyle;
- (BOOL)wantsToManageBackgroundColor;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)headerViewClass;
- (SRGuideDomainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIEdgeInsets)_headerViewEdgeInsets;
- (double)desiredHeightForHeaderView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_phraseForIndexPath:(id)a3;
- (id)_titleForSection:(unint64_t)a3;
- (id)_utterancesForSection:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)_cellTypeForIndexPath:(id)a3;
- (int64_t)_numberOfSections;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)configureReusableHeaderView:(id)a3;
- (void)loadView;
- (void)setSnippet:(id)a3;
@end

@implementation SRGuideDomainViewController

- (SRGuideDomainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SRGuideDomainViewController;
  v4 = [(SRGuideDomainViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    -[SRGuideDomainViewController setDefaultViewInsets:](v4, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  }
  return v5;
}

- (void)loadView
{
  v12.receiver = self;
  v12.super_class = (Class)SRGuideDomainViewController;
  [(SRGuideDomainViewController *)&v12 loadView];
  v3 = [(SRGuideDomainViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[SRGuideDetailSectionHeaderCollectionViewCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];

  uint64_t v6 = objc_opt_class();
  objc_super v7 = +[SRGuideDetailPhraseViewCell reuseIdentifier];
  [v3 registerClass:v6 forCellWithReuseIdentifier:v7];

  uint64_t v8 = objc_opt_class();
  v9 = +[SiriUIContentCollectionViewCell reuseIdentifier];
  [v3 registerClass:v8 forCellWithReuseIdentifier:v9];

  uint64_t v10 = objc_opt_class();
  v11 = +[SRGuideViewHeader reuseIdentifier];
  [v3 registerClass:v10 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v11];
}

- (Class)headerViewClass
{
  return (Class)objc_opt_class();
}

- (void)configureReusableHeaderView:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SRGuideDomainViewController *)self snippet];
  v5 = [v4 domainDisplayName];
  [v6 setTitle:v5];

  [(SRGuideDomainViewController *)self _headerViewEdgeInsets];
  [v6 setEdgeInsets:];
}

- (double)desiredHeightForHeaderView
{
  v3 = [(SRGuideDomainViewController *)self delegate];
  [v3 siriViewControllerExpectedWidth:self];
  double v5 = v4;
  id v6 = [(SRGuideDomainViewController *)self snippet];
  objc_super v7 = [v6 domainDisplayName];
  [(SRGuideDomainViewController *)self _headerViewEdgeInsets];
  +[SRGuideViewHeader sizeThatFits:text:edgeInsets:](SRGuideViewHeader, "sizeThatFits:text:edgeInsets:", v7, v5, 1.79769313e308, v8, v9, v10, v11);
  double v13 = v12;

  return v13;
}

- (int64_t)_cellTypeForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 item]) {
    goto LABEL_2;
  }
  id v6 = [(SRGuideDomainViewController *)self snippet];
  objc_super v7 = [v6 guideSections];
  double v8 = [v7 objectAtIndexedSubscript:[v4 section]];

  double v9 = [v8 sectionName];
  id v10 = [v9 length];

  if (!v10) {
LABEL_2:
  }
    int64_t v5 = 1;
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (UIEdgeInsets)_headerViewEdgeInsets
{
  double v2 = SiriUIPlatterStyle[32];
  double v3 = SiriUIPlatterStyle[34];
  double v4 = 3.5;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (int64_t)_numberOfSections
{
  double v2 = [(SRGuideDomainViewController *)self snippet];
  double v3 = [v2 guideSections];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (id)_utterancesForSection:(unint64_t)a3
{
  id v4 = [(SRGuideDomainViewController *)self snippet];
  double v5 = [v4 guideSections];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  objc_super v7 = [v6 guideUtterances];

  return v7;
}

- (double)desiredHeightForWidth:(double)a3
{
  if ([(SRGuideDomainViewController *)self _numberOfSections] < 1) {
    return 0.0;
  }
  uint64_t v5 = 0;
  double v6 = 0.0;
  do
  {
    if ([(SRGuideDomainViewController *)self _showsCategoriesForSection:v5])
    {
      objc_super v7 = [(SRGuideDomainViewController *)self snippet];
      double v8 = [v7 guideSections];
      double v9 = [v8 objectAtIndexedSubscript:v5];

      id v10 = [v9 sectionName];
      +[SRGuideDetailSectionHeaderCollectionViewCell sizeThatFits:text:](SRGuideDetailSectionHeaderCollectionViewCell, "sizeThatFits:text:", v10, a3, 1.79769313e308);
      double v6 = v6 + v11;
    }
    double v12 = [(SRGuideDomainViewController *)self _utterancesForSection:v5];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          +[SRGuideDetailPhraseViewCell sizeThatFits:text:](SRGuideDetailPhraseViewCell, "sizeThatFits:text:", *(void *)(*((void *)&v19 + 1) + 8 * i), a3, 1.79769313e308);
          double v6 = v6 + v17;
        }
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    ++v5;
  }
  while (v5 < [(SRGuideDomainViewController *)self _numberOfSections]);
  return v6;
}

- (BOOL)wantsToManageBackgroundColor
{
  return 1;
}

- (BOOL)usePlatterStyle
{
  return 0;
}

- (id)_titleForSection:(unint64_t)a3
{
  id v4 = [(SRGuideDomainViewController *)self snippet];
  uint64_t v5 = [v4 guideSections];
  double v6 = [v5 objectAtIndexedSubscript:a3];

  objc_super v7 = [v6 sectionName];

  return v7;
}

- (BOOL)_showsCategoriesForSection:(unint64_t)a3
{
  double v3 = [(SRGuideDomainViewController *)self _titleForSection:a3];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (id)_phraseForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (char *)[v4 item];
  double v6 = &v5[--[SRGuideDomainViewController _showsCategoriesForSection:](self, "_showsCategoriesForSection:", [v4 section])];
  id v7 = [v4 section];

  double v8 = [(SRGuideDomainViewController *)self _utterancesForSection:v7];
  double v9 = [v8 objectAtIndexedSubscript:v6];

  return v9;
}

- (void)setSnippet:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SRGuideDomainViewController;
  [(SRGuideDomainViewController *)&v5 setSnippet:a3];
  if ([(SRGuideDomainViewController *)self isViewLoaded])
  {
    id v4 = [(SRGuideDomainViewController *)self collectionView];
    [v4 reloadData];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  double v8 = +[SRGuideViewHeader reuseIdentifier];
  double v9 = [v7 dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:v8 forIndexPath:v6];

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(SRGuideDomainViewController *)self _utterancesForSection:a4];
  id v7 = [v6 count];

  return (int64_t)v7
       + [(SRGuideDomainViewController *)self _showsCategoriesForSection:a4];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(SRGuideDomainViewController *)self _cellTypeForIndexPath:v7];
  if (v8 == 1)
  {
    uint64_t v15 = +[SRGuideDetailPhraseViewCell reuseIdentifier];
    id v10 = [v6 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v7];

    id v13 = [(SRGuideDomainViewController *)self _phraseForIndexPath:v7];
    [v10 setText:v13];
    goto LABEL_5;
  }
  if (!v8)
  {
    double v9 = +[SRGuideDetailSectionHeaderCollectionViewCell reuseIdentifier];
    id v10 = [v6 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v7];

    double v11 = [(SRGuideDomainViewController *)self snippet];
    double v12 = [v11 guideSections];
    id v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

    id v14 = [v13 sectionName];
    [v10 setText:v14];

LABEL_5:
    goto LABEL_7;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  int64_t v7 = [(SRGuideDomainViewController *)self _cellTypeForIndexPath:v6];
  int64_t v8 = [(SRGuideDomainViewController *)self delegate];
  [v8 siriViewControllerExpectedWidth:self];
  double v10 = v9;

  if (v7 == 1)
  {
    id v13 = [(SRGuideDomainViewController *)self _phraseForIndexPath:v6];
    +[SRGuideDetailPhraseViewCell sizeThatFits:text:](SRGuideDetailPhraseViewCell, "sizeThatFits:text:", v13, v10, 1.79769313e308);
    CGFloat height = v17;
  }
  else
  {
    if (v7)
    {
      CGFloat height = CGSizeZero.height;
      goto LABEL_7;
    }
    double v11 = [(SRGuideDomainViewController *)self snippet];
    double v12 = [v11 guideSections];
    id v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));

    id v14 = [v13 sectionName];
    +[SRGuideDetailSectionHeaderCollectionViewCell sizeThatFits:text:](SRGuideDetailSectionHeaderCollectionViewCell, "sizeThatFits:text:", v14, v10, 1.79769313e308);
    CGFloat height = v15;
  }
LABEL_7:

  double v18 = v10;
  double v19 = height;
  result.CGFloat height = v19;
  result.width = v18;
  return result;
}

@end