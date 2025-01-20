@interface CNContactListCountFooterView
- (BOOL)shouldDisplayContactCount;
- (BOOL)shouldDisplayDuplicateCount;
- (BOOL)shouldDisplaySelectedCount;
- (BOOL)shouldHideCountFooter;
- (CNContactListCountFooterView)initWithFrame:(CGRect)a3;
- (CNContactListCountViewDelegate)delegate;
- (id)countStringForLocalizedStringKey:(id)a3 count:(int64_t)a4;
- (id)countViewConfiguration;
- (id)primaryText;
- (id)secondaryText;
- (int64_t)contactCount;
- (int64_t)duplicateCount;
- (int64_t)selectedCount;
- (void)didSelectViewAllDuplicates;
- (void)setContactCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDuplicateCount:(int64_t)a3;
- (void)setSelectedCount:(int64_t)a3;
- (void)setShouldHideCountFooter:(BOOL)a3;
@end

@implementation CNContactListCountFooterView

- (void).cxx_destruct
{
}

- (void)setShouldHideCountFooter:(BOOL)a3
{
  self->_shouldHideCountFooter = a3;
}

- (BOOL)shouldHideCountFooter
{
  return self->_shouldHideCountFooter;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactListCountViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactListCountViewDelegate *)WeakRetained;
}

- (int64_t)selectedCount
{
  return self->_selectedCount;
}

- (int64_t)duplicateCount
{
  return self->_duplicateCount;
}

- (int64_t)contactCount
{
  return self->_contactCount;
}

- (void)didSelectViewAllDuplicates
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained && [(CNContactListCountFooterView *)self shouldDisplayDuplicateCount])
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 didSelectViewAllDuplicates];
  }
}

- (void)setSelectedCount:(int64_t)a3
{
  if (self->_selectedCount != a3)
  {
    self->_selectedCount = a3;
    id v4 = [(CNContactListCountFooterView *)self countViewConfiguration];
    [(CNContactListCountFooterView *)self setContentConfiguration:v4];
  }
}

- (void)setDuplicateCount:(int64_t)a3
{
  if (self->_duplicateCount != a3)
  {
    self->_duplicateCount = a3;
    id v4 = [(CNContactListCountFooterView *)self countViewConfiguration];
    [(CNContactListCountFooterView *)self setContentConfiguration:v4];
  }
}

- (void)setContactCount:(int64_t)a3
{
  if (self->_contactCount != a3)
  {
    self->_contactCount = a3;
    id v4 = [(CNContactListCountFooterView *)self countViewConfiguration];
    [(CNContactListCountFooterView *)self setContentConfiguration:v4];
  }
}

- (BOOL)shouldDisplayDuplicateCount
{
  return [(CNContactListCountFooterView *)self duplicateCount] > 0;
}

- (BOOL)shouldDisplaySelectedCount
{
  return ![(CNContactListCountFooterView *)self shouldHideCountFooter]
      && [(CNContactListCountFooterView *)self selectedCount] >= 0;
}

- (BOOL)shouldDisplayContactCount
{
  return ![(CNContactListCountFooterView *)self shouldHideCountFooter]
      && [(CNContactListCountFooterView *)self contactCount] > 19;
}

- (id)countStringForLocalizedStringKey:(id)a3 count:(int64_t)a4
{
  id v5 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CNContactListCountFooterView_countStringForLocalizedStringKey_count___block_invoke;
  aBlock[3] = &unk_1E549A528;
  id v13 = v5;
  int64_t v14 = a4;
  id v6 = v5;
  v7 = (void (**)(void))_Block_copy(aBlock);
  v8 = NSString;
  v9 = v7[2]();
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, a4);

  return v10;
}

id __71__CNContactListCountFooterView_countStringForLocalizedStringKey_count___block_invoke(uint64_t a1)
{
  v2 = +[CNNumberFormatting localizedStringWithInteger:*(void *)(a1 + 40)];
  v3 = NSString;
  id v4 = CNContactsUIBundle();
  id v5 = [v4 localizedStringForKey:*(void *)(a1 + 32) value:&stru_1ED8AC728 table:@"Localized"];
  id v6 = objc_msgSend(v3, "localizedStringWithFormat:", v5, *(void *)(a1 + 40), v2);

  return v6;
}

- (id)secondaryText
{
  if ([(CNContactListCountFooterView *)self shouldDisplayDuplicateCount])
  {
    v3 = [(CNContactListCountFooterView *)self countStringForLocalizedStringKey:@"DUPLICATES_COUNT" count:[(CNContactListCountFooterView *)self duplicateCount]];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)primaryText
{
  if ([(CNContactListCountFooterView *)self shouldDisplayContactCount])
  {
    int64_t v3 = [(CNContactListCountFooterView *)self contactCount];
    id v4 = @"CONTACTS_COUNT";
LABEL_5:
    id v5 = [(CNContactListCountFooterView *)self countStringForLocalizedStringKey:v4 count:v3];
    goto LABEL_7;
  }
  if ([(CNContactListCountFooterView *)self shouldDisplaySelectedCount])
  {
    int64_t v3 = [(CNContactListCountFooterView *)self selectedCount];
    id v4 = @"SELECTED_CONTACTS_COUNT";
    goto LABEL_5;
  }
  id v5 = &stru_1ED8AC728;
LABEL_7:

  return v5;
}

- (id)countViewConfiguration
{
  int64_t v3 = [MEMORY[0x1E4FB1948] plainFooterConfiguration];
  id v4 = [(CNContactListCountFooterView *)self primaryText];
  [v3 setText:v4];

  id v5 = +[CNUIFontRepository contactListContactCountFont];
  id v6 = [v3 textProperties];
  [v6 setFont:v5];

  v7 = +[CNUIColorRepository contactListContactCountTextColor];
  v8 = [v3 textProperties];
  [v8 setColor:v7];

  v9 = [v3 textProperties];
  [v9 setAlignment:1];

  v10 = [(CNContactListCountFooterView *)self secondaryText];
  [v3 setSecondaryText:v10];

  v11 = +[CNUIFontRepository contactListDuplicateCountFont];
  v12 = [v3 secondaryTextProperties];
  [v12 setFont:v11];

  id v13 = +[CNUIColorRepository contactListDuplicateCountTextColor];
  int64_t v14 = [v3 secondaryTextProperties];
  [v14 setColor:v13];

  v15 = [v3 secondaryTextProperties];
  [v15 setAlignment:1];

  [v3 directionalLayoutMargins];
  [v3 setDirectionalLayoutMargins:15.0];

  return v3;
}

- (CNContactListCountFooterView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactListCountFooterView;
  int64_t v3 = -[CNContactListCountFooterView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel_didSelectViewAllDuplicates];
    [(CNContactListCountFooterView *)v3 addGestureRecognizer:v4];
    v3->_contactCount = 0;
    v3->_duplicateCount = 0;
    v3->_selectedCount = -1;
    id v5 = v3;
  }
  return v3;
}

@end