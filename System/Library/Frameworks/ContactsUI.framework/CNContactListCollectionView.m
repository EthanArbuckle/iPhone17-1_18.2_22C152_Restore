@interface CNContactListCollectionView
- (CNContactListCollectionView)init;
- (CNContactListCollectionViewDelegate)contactListCollectionViewDelegate;
- (CNContactListCountFooterView)contactCountView;
- (CNContactListCountViewDelegate)countViewDelegate;
- (int64_t)contactCount;
- (int64_t)duplicateCount;
- (int64_t)selectedCount;
- (unint64_t)globalIndexForItemAtIndexPath:(id)a3;
- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5;
- (void)setContactCount:(int64_t)a3;
- (void)setContactCountView:(id)a3;
- (void)setContactListCollectionViewDelegate:(id)a3;
- (void)setCountViewDelegate:(id)a3;
- (void)setDuplicateCount:(int64_t)a3;
- (void)setSelectedCount:(int64_t)a3;
- (void)updateSelectedContactCount;
@end

@implementation CNContactListCollectionView

- (void)setCountViewDelegate:(id)a3
{
}

- (void)setContactListCollectionViewDelegate:(id)a3
{
}

- (int64_t)duplicateCount
{
  return self->_duplicateCount;
}

- (void)setContactCount:(int64_t)a3
{
  if (self->_contactCount != a3)
  {
    self->_contactCount = a3;
    contactCountView = self->_contactCountView;
    if (contactCountView) {
      -[CNContactListCountFooterView setContactCount:](contactCountView, "setContactCount:");
    }
  }
}

- (int64_t)contactCount
{
  return self->_contactCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCountView, 0);
  objc_destroyWeak((id *)&self->_contactListCollectionViewDelegate);

  objc_destroyWeak((id *)&self->_countViewDelegate);
}

- (CNContactListCountFooterView)contactCountView
{
  return self->_contactCountView;
}

- (CNContactListCollectionViewDelegate)contactListCollectionViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactListCollectionViewDelegate);

  return (CNContactListCollectionViewDelegate *)WeakRetained;
}

- (CNContactListCountViewDelegate)countViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countViewDelegate);

  return (CNContactListCountViewDelegate *)WeakRetained;
}

- (int64_t)selectedCount
{
  return self->_selectedCount;
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactListCollectionView;
  [(CNContactListCollectionView *)&v5 deselectItemAtIndexPath:a3 animated:a4];
  [(CNContactListCollectionView *)self updateSelectedContactCount];
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactListCollectionView;
  [(CNContactListCollectionView *)&v6 selectItemAtIndexPath:a3 animated:a4 scrollPosition:a5];
  [(CNContactListCollectionView *)self updateSelectedContactCount];
}

- (void)setSelectedCount:(int64_t)a3
{
  if (self->_selectedCount != a3)
  {
    self->_selectedCount = a3;
    contactCountView = self->_contactCountView;
    if (contactCountView) {
      -[CNContactListCountFooterView setSelectedCount:](contactCountView, "setSelectedCount:");
    }
  }
}

- (void)updateSelectedContactCount
{
  if (![(CNContactListCollectionView *)self isEditing]) {
    goto LABEL_5;
  }
  if (![(CNContactListCollectionView *)self allowsMultipleSelectionDuringEditing])goto LABEL_5; {
  uint64_t v3 = [(CNContactListCollectionView *)self contactListCollectionViewDelegate];
  }
  if (!v3) {
    goto LABEL_5;
  }
  v4 = (void *)v3;
  objc_super v5 = [(CNContactListCollectionView *)self contactListCollectionViewDelegate];
  char v6 = [v5 hasNoContacts];

  if ((v6 & 1) == 0)
  {
    v8 = [(CNContactListCollectionView *)self indexPathsForSelectedItems];
    uint64_t v7 = [v8 count];
  }
  else
  {
LABEL_5:
    uint64_t v7 = -1;
  }

  [(CNContactListCollectionView *)self setSelectedCount:v7];
}

- (void)setDuplicateCount:(int64_t)a3
{
  if (self->_duplicateCount != a3)
  {
    self->_duplicateCount = a3;
    contactCountView = self->_contactCountView;
    if (contactCountView) {
      -[CNContactListCountFooterView setDuplicateCount:](contactCountView, "setDuplicateCount:");
    }
  }
}

- (void)setContactCountView:(id)a3
{
  p_contactCountView = &self->_contactCountView;
  id v6 = a3;
  if (([v6 isEqual:*p_contactCountView] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contactCountView, a3);
    [(CNContactListCountFooterView *)*p_contactCountView setContactCount:[(CNContactListCollectionView *)self contactCount]];
    [(CNContactListCollectionView *)self updateSelectedContactCount];
    [(CNContactListCountFooterView *)*p_contactCountView setSelectedCount:[(CNContactListCollectionView *)self selectedCount]];
    [(CNContactListCountFooterView *)*p_contactCountView setDuplicateCount:[(CNContactListCollectionView *)self duplicateCount]];
  }
}

- (unint64_t)globalIndexForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  uint64_t v6 = [v4 section];
  if (v6 >= [(CNContactListCollectionView *)self numberOfSections]
    || v5 >= [(CNContactListCollectionView *)self numberOfItemsInSection:v6])
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v6 < 1)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      do
        v8 += [(CNContactListCollectionView *)self numberOfItemsInSection:v7++];
      while (v6 != v7);
    }
    unint64_t v9 = v8 + v5;
  }

  return v9;
}

- (CNContactListCollectionView)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactListCollectionView;
  v2 = [(CNContactListCollectionView *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_countViewDelegate, 0);
    id v4 = v3;
  }

  return v3;
}

@end