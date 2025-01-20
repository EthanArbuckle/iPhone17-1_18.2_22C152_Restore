@interface CNContactListCollectionViewCell
- (BOOL)allowsMultiSelectContextMenus;
- (BOOL)allowsMultiSelection;
- (BOOL)hasBeenDisplayed;
- (BOOL)isEmergencyContact;
- (BOOL)isMeCard;
- (CNCancelable)summaryCancelationToken;
- (CNContact)contact;
- (CNContactFormatter)contactFormatter;
- (CNContactListCollectionViewCell)initWithFrame:(CGRect)a3;
- (CNContactListStyleApplier)contactListStyleApplier;
- (CNContactMatchInfo)contactMatchInfo;
- (void)applyAccessories;
- (void)cancelAsyncOperations;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAllowsMultiSelectContextMenus:(BOOL)a3;
- (void)setAllowsMultiSelection:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setContactListStyleApplier:(id)a3;
- (void)setContactMatchInfo:(id)a3;
- (void)setContactMatchInfo:(id)a3 completionBlock:(id)a4;
- (void)setHasBeenDisplayed:(BOOL)a3;
- (void)setIsEmergencyContact:(BOOL)a3;
- (void)setIsMeCard:(BOOL)a3;
- (void)setSubtitleAttributedText:(id)a3;
- (void)setSummaryCancelationToken:(id)a3;
@end

@implementation CNContactListCollectionViewCell

- (void)setIsMeCard:(BOOL)a3
{
  if (self->_isMeCard != a3)
  {
    self->_isMeCard = a3;
    [(CNContactListCollectionViewCell *)self applyAccessories];
  }
}

- (void)setIsEmergencyContact:(BOOL)a3
{
  if (self->_isEmergencyContact != a3)
  {
    self->_isEmergencyContact = a3;
    [(CNContactListCollectionViewCell *)self applyAccessories];
  }
}

- (void)setContactMatchInfo:(id)a3 completionBlock:(id)a4
{
  v7 = (CNContactMatchInfo *)a3;
  id v8 = a4;
  if (self->_contactMatchInfo != v7)
  {
    objc_storeStrong((id *)&self->_contactMatchInfo, a3);
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E4F5A488];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__CNContactListCollectionViewCell_setContactMatchInfo_completionBlock___block_invoke;
    v18[3] = &unk_1E5497B90;
    objc_copyWeak(&v20, &location);
    id v19 = v8;
    v10 = [v9 observerWithResultBlock:v18];
    v11 = (void *)MEMORY[0x1E4F5A480];
    v12 = [(CNContactMatchInfo *)v7 excerpt];
    v13 = [v12 future];
    v14 = [v11 observableWithFuture:v13];
    v15 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
    v16 = [v14 observeOn:v15];
    v17 = [v16 subscribe:v10];
    [(CNContactListCollectionViewCell *)self setSummaryCancelationToken:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)setContactListStyleApplier:(id)a3
{
}

- (void)setContactFormatter:(id)a3
{
}

- (void)setContact:(id)a3
{
  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_contact, a3);
    v6 = [(CNContactListCollectionViewCell *)self contactListStyleApplier];

    if (v6)
    {
      v7 = [(CNContactListCollectionViewCell *)self contactListStyleApplier];
      id v8 = [(CNContactListCollectionViewCell *)self contactFormatter];
      [v7 applyContactListStyleToContact:v10 usingFormatter:v8 ofCell:self];

      [(UIView *)self annotateWithContact:v10];
    }
    else
    {
      v9 = [(CNContactListCollectionViewCell *)self contactFormatter];
      +[CNContactListStyleApplier applyDefaultStyleToContact:v10 usingFormatter:v9 ofCell:self];
    }
    v5 = v10;
  }
}

- (CNContactListStyleApplier)contactListStyleApplier
{
  return self->_contactListStyleApplier;
}

- (void)setAllowsMultiSelection:(BOOL)a3
{
  self->_allowsMultiSelection = a3;
}

- (void)setAllowsMultiSelectContextMenus:(BOOL)a3
{
  self->_allowsMultiSelectContextMenus = a3;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactListCollectionViewCell;
  [(CNContactListCollectionViewCell *)&v3 layoutSubviews];
  [(CNContactListCollectionViewCell *)self setHasBeenDisplayed:1];
}

- (void)setHasBeenDisplayed:(BOOL)a3
{
  self->_hasBeenDisplayed = a3;
}

- (CNContactListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactListCollectionViewCell;
  objc_super v3 = -[CNContactListCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)applyAccessories
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactListCollectionViewCell *)self allowsMultiSelection]) {
    int v3 = ![(CNContactListCollectionViewCell *)self allowsMultiSelectContextMenus];
  }
  else {
    int v3 = 0;
  }
  v4 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB1530]);
    [v4 addObject:v5];
  }
  if ([(CNContactListCollectionViewCell *)self isMeCard])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v8 = CNContactsUIBundle();
    v9 = [v8 localizedStringForKey:@"ME_CELL_INDICATOR" value:&stru_1ED8AC728 table:@"Localized"];
    v10 = (void *)[v7 initWithString:v9];
    [v6 setAttributedText:v10];

    [v6 sizeToFit];
    v11 = [(CNContactListCollectionViewCell *)self contactListStyleApplier];
    [v11 applyContactListStyleToMeContactLabel:v6 ofCell:self];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v6 placement:1];
    v21[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v4 addObjectsFromArray:v13];
  }
  if ([(CNContactListCollectionViewCell *)self isEmergencyContact])
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v15 = [(CNContactListCollectionViewCell *)self contactListStyleApplier];

    if (v15)
    {
      v16 = [(CNContactListCollectionViewCell *)self contactListStyleApplier];
      [v16 applyContactListStyleToEmergencyIcon:v14 ofCell:self];
    }
    else
    {
      v17 = (void *)MEMORY[0x1E4FB1818];
      v18 = +[CNUIColorRepository contactListEmergencyContactGlyphColor];
      v16 = objc_msgSend(v17, "cnui_symbolImageNamed:scale:withColor:useFixedSize:", @"staroflife.fill", 3, v18, 0);

      uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v16];
      id v14 = (id)v19;
    }

    id v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v14 placement:1];
    [v4 addObject:v20];
  }
  [(CNContactListCollectionViewCell *)self setAccessories:v4];
}

- (BOOL)isMeCard
{
  return self->_isMeCard;
}

- (BOOL)isEmergencyContact
{
  return self->_isEmergencyContact;
}

- (BOOL)allowsMultiSelection
{
  return self->_allowsMultiSelection;
}

- (void)setSummaryCancelationToken:(id)a3
{
}

- (void)cancelAsyncOperations
{
  int v3 = [(CNContactListCollectionViewCell *)self summaryCancelationToken];
  [v3 cancel];

  [(CNContactListCollectionViewCell *)self setSummaryCancelationToken:0];
}

- (CNCancelable)summaryCancelationToken
{
  return self->_summaryCancelationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryCancelationToken, 0);
  objc_storeStrong((id *)&self->_contactListStyleApplier, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_contactMatchInfo, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (BOOL)hasBeenDisplayed
{
  return self->_hasBeenDisplayed;
}

- (BOOL)allowsMultiSelectContextMenus
{
  return self->_allowsMultiSelectContextMenus;
}

- (CNContactMatchInfo)contactMatchInfo
{
  return self->_contactMatchInfo;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)dealloc
{
  [(CNCancelable *)self->_summaryCancelationToken cancel];
  v3.receiver = self;
  v3.super_class = (Class)CNContactListCollectionViewCell;
  [(CNContactListCollectionViewCell *)&v3 dealloc];
}

- (void)prepareForReuse
{
  objc_super v3 = [(CNContactListCollectionViewCell *)self summaryCancelationToken];
  [v3 cancel];

  [(CNContactListCollectionViewCell *)self setSummaryCancelationToken:0];
  [(CNContactListCollectionViewCell *)self setContactMatchInfo:0];
  [(CNContactListCollectionViewCell *)self setSubtitleAttributedText:0];
  [(CNContactListCollectionViewCell *)self setIsEmergencyContact:0];
  [(CNContactListCollectionViewCell *)self setIsMeCard:0];
  [(CNContactListCollectionViewCell *)self setContactListStyleApplier:0];
  [(CNContactListCollectionViewCell *)self setAccessories:MEMORY[0x1E4F1CBF0]];
  [(CNContactListCollectionViewCell *)self setHasBeenDisplayed:0];
  [(UIView *)self annotateWithContact:0];
  v4.receiver = self;
  v4.super_class = (Class)CNContactListCollectionViewCell;
  [(CNContactListCollectionViewCell *)&v4 prepareForReuse];
}

- (void)setSubtitleAttributedText:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v7 = [(CNContactListCollectionViewCell *)self contentConfiguration];
  if (objc_opt_isKindOfClass()) {
    id v5 = v7;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  }
  [v7 setSecondaryText:&stru_1ED8AC728];
  [v7 setSecondaryAttributedText:v4];

  [(CNContactListCollectionViewCell *)self setContentConfiguration:v7];
}

void __71__CNContactListCollectionViewCell_setContactMatchInfo_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained summaryCancelationToken];

  if (!v4) {
    goto LABEL_10;
  }
  if ([v11 length])
  {
    id v5 = [WeakRetained contactListStyleApplier];

    id v6 = WeakRetained;
    if (v5)
    {
      id v7 = [WeakRetained contactListStyleApplier];
      [v7 applyContactListStyleToSubtitleText:v11 ofSearchResultCell:WeakRetained];

      goto LABEL_8;
    }
    id v8 = v11;
  }
  else
  {
    id v6 = WeakRetained;
    id v8 = 0;
  }
  [v6 setSubtitleAttributedText:v8];
LABEL_8:
  uint64_t v9 = [WeakRetained hasBeenDisplayed];
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v9);
  }
LABEL_10:
}

- (void)setContactMatchInfo:(id)a3
{
}

@end