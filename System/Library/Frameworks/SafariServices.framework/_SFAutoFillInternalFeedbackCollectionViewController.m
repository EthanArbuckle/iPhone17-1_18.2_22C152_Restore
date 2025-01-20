@interface _SFAutoFillInternalFeedbackCollectionViewController
- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData;
- (_SFAutoFillInternalFeedbackCollectionViewController)initWithDiagnosticsData:(id)a3 reportHandler:(id)a4;
- (id)_createCollectionViewLayout;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)reportHandler;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_dismiss:(id)a3;
- (void)_updateContinueInTapToRadarButton;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionViewListCellButtonPressed:(id)a3;
- (void)textFieldCellTextDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation _SFAutoFillInternalFeedbackCollectionViewController

- (_SFAutoFillInternalFeedbackCollectionViewController)initWithDiagnosticsData:(id)a3 reportHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self _createCollectionViewLayout];
  v26.receiver = self;
  v26.super_class = (Class)_SFAutoFillInternalFeedbackCollectionViewController;
  v9 = [(_SFAutoFillInternalFeedbackCollectionViewController *)&v26 initWithCollectionViewLayout:v8];

  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F98970]) initWithDiagnosticsData:v6];
    feedbackController = v9->_feedbackController;
    v9->_feedbackController = (WBSAutoFillInternalFeedbackController *)v10;

    uint64_t v12 = MEMORY[0x1AD0C36A0](v7);
    id reportHandler = v9->_reportHandler;
    v9->_id reportHandler = (id)v12;

    id v14 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v15 = [MEMORY[0x1E4F98970] titleText];
    [v14 setText:v15];

    [v14 setAdjustsFontSizeToFitWidth:1];
    v16 = [MEMORY[0x1E4FB1798] _preferredFontForTextStyle:*MEMORY[0x1E4FB2998] weight:*MEMORY[0x1E4FB29D0]];
    [v14 setFont:v16];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v14];
    v18 = [(_SFAutoFillInternalFeedbackCollectionViewController *)v9 navigationItem];
    [v18 setLeftBarButtonItem:v17];

    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:v9 action:sel__dismiss_];
    v20 = [(_SFAutoFillInternalFeedbackCollectionViewController *)v9 navigationItem];
    [v20 setRightBarButtonItem:v19];

    v21 = [(_SFAutoFillInternalFeedbackCollectionViewController *)v9 collectionView];
    [v21 setDelegate:v9];

    v22 = [(_SFAutoFillInternalFeedbackCollectionViewController *)v9 collectionView];
    [v22 setDataSource:v9];

    v23 = [(_SFAutoFillInternalFeedbackCollectionViewController *)v9 collectionView];
    [v23 setSelfSizingInvalidation:2];

    v24 = v9;
  }

  return v9;
}

- (void)_dismiss:(id)a3
{
}

- (id)_createCollectionViewLayout
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1580]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82___SFAutoFillInternalFeedbackCollectionViewController__createCollectionViewLayout__block_invoke;
  v6[3] = &unk_1E5C72E60;
  v6[4] = self;
  v4 = (void *)[v3 initWithSectionProvider:v6];

  return v4;
}

- (void)viewDidLoad
{
  v20.receiver = self;
  v20.super_class = (Class)_SFAutoFillInternalFeedbackCollectionViewController;
  [(_SFAutoFillInternalFeedbackCollectionViewController *)&v20 viewDidLoad];
  id v3 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *MEMORY[0x1E4FB2760];
  id v6 = +[_SFCollectionViewListTextSupplementaryView reuseIdentifier];
  [v3 registerClass:v4 forSupplementaryViewOfKind:v5 withReuseIdentifier:v6];

  id v7 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = *MEMORY[0x1E4FB2770];
  uint64_t v10 = +[_SFCollectionViewListTextSupplementaryView reuseIdentifier];
  [v7 registerClass:v8 forSupplementaryViewOfKind:v9 withReuseIdentifier:v10];

  v11 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
  uint64_t v12 = objc_opt_class();
  v13 = +[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell reuseIdentifier];
  [v11 registerClass:v12 forCellWithReuseIdentifier:v13];

  id v14 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
  uint64_t v15 = objc_opt_class();
  v16 = +[_SFButtonCollectionViewListCell reuseIdentifier];
  [v14 registerClass:v15 forCellWithReuseIdentifier:v16];

  v17 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
  uint64_t v18 = objc_opt_class();
  v19 = +[_SFCheckableItemCollectionViewListCell reuseIdentifier];
  [v17 registerClass:v18 forCellWithReuseIdentifier:v19];
}

- (WBSAutoFillInternalFeedbackDiagnosticsData)diagnosticsData
{
  return (WBSAutoFillInternalFeedbackDiagnosticsData *)[(WBSAutoFillInternalFeedbackController *)self->_feedbackController diagnosticsData];
}

- (void)_updateContinueInTapToRadarButton
{
  id v3 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
  uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:4];
  id v5 = [v3 cellForItemAtIndexPath:v4];

  objc_msgSend(v5, "setEnabled:", -[WBSAutoFillInternalFeedbackController canContinueInTapToRadar](self->_feedbackController, "canContinueInTapToRadar"));
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = 7;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      uint64_t v8 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController detailTypesForSelectedFeedbackCategory];
      int64_t v7 = 2 * [v8 count];

      break;
    case 2:
      if ([(WBSAutoFillInternalFeedbackController *)self->_feedbackController isRegression])int64_t v7 = 2; {
      else
      }
        int64_t v7 = 1;
      break;
    case 3:
      int64_t v7 = 2;
      break;
    case 4:
      int64_t v7 = 1;
      break;
    default:
      int64_t v7 = 0;
      break;
  }

  return v7;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([v7 section])
  {
    case 0:
      uint64_t v8 = +[_SFCheckableItemCollectionViewListCell reuseIdentifier];
      uint64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v7];

      uint64_t v10 = [v7 row] + 1;
      v11 = [MEMORY[0x1E4F98970] titleForFeedbackCategory:v10];
      [v9 setText:v11];

      uint64_t v12 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController selectedFeedbackCategory];
      goto LABEL_14;
    case 1:
      uint64_t v15 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController detailTypesForSelectedFeedbackCategory];
      uint64_t v16 = [v7 row];
      if (v16 >= 0) {
        uint64_t v17 = v16;
      }
      else {
        uint64_t v17 = v16 + 1;
      }
      uint64_t v18 = [v15 objectAtIndex:v17 >> 1];

      if ([v7 row])
      {
        v27 = +[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell reuseIdentifier];
        uint64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:v27 forIndexPath:v7];

        [v9 setDelegate:self];
        v28 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController responseForDetailType:v18];
        [v9 setText:v28];

        v29 = [MEMORY[0x1E4F98970] placeholderForFeedbackDetailType:v18];
        [v9 setPlaceholder:v29];
      }
      else
      {
        v19 = +[_SFCheckableItemCollectionViewListCell reuseIdentifier];
        uint64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:v19 forIndexPath:v7];

        objc_super v20 = [MEMORY[0x1E4F98970] titleForFeedbackDetailType:v18];
        [v9 setText:v20];

        [v9 setChecked:0];
      }

      goto LABEL_19;
    case 2:
      uint64_t v21 = [v7 row];
      if (v21 == 1)
      {
        v30 = +[_SFAutoFillInternalFeedbackDetailQuestionTextFieldCell reuseIdentifier];
        uint64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:v30 forIndexPath:v7];

        [v9 setDelegate:self];
        v31 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController knownWorkingBuild];
        [v9 setText:v31];

        v32 = [MEMORY[0x1E4F98970] knownWorkingBuildPlaceholderText];
        [v9 setPlaceholder:v32];
      }
      else
      {
        if (v21)
        {
LABEL_13:
          v25 = +[_SFCheckableItemCollectionViewListCell reuseIdentifier];
          uint64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:v25 forIndexPath:v7];

          uint64_t v10 = [v7 row];
          objc_super v26 = [MEMORY[0x1E4F98970] titleForAttachmentsType:v10];
          [v9 setText:v26];

          uint64_t v12 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController selectedAttachmentsType];
LABEL_14:
          uint64_t v24 = v12 == v10;
        }
        else
        {
          v22 = +[_SFCheckableItemCollectionViewListCell reuseIdentifier];
          uint64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:v22 forIndexPath:v7];

          v23 = [MEMORY[0x1E4F98970] isRegressionOptionText];
          [v9 setText:v23];

          uint64_t v24 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController isRegression];
        }
        [v9 setChecked:v24];
      }
LABEL_19:

      return v9;
    case 3:
      goto LABEL_13;
    case 4:
      v13 = +[_SFButtonCollectionViewListCell reuseIdentifier];
      uint64_t v9 = [v6 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v7];

      [v9 setDelegate:self];
      id v14 = _WBSLocalizedString();
      [v9 setTitle:v14];

      objc_msgSend(v9, "setEnabled:", -[WBSAutoFillInternalFeedbackController canContinueInTapToRadar](self->_feedbackController, "canContinueInTapToRadar"));
      goto LABEL_19;
    default:
      uint64_t v9 = 0;
      goto LABEL_19;
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v9 isEqualToString:*MEMORY[0x1E4FB2770]];
  uint64_t v12 = [v10 section];
  if (!v11)
  {
    if (v12 == 3)
    {
      uint64_t v16 = +[_SFCollectionViewListTextSupplementaryView reuseIdentifier];
      id v14 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v16 forIndexPath:v10];

      uint64_t v15 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController attachmentDetailsText];
      goto LABEL_7;
    }
LABEL_8:
    id v14 = 0;
    goto LABEL_11;
  }
  if (v12 == 3)
  {
    uint64_t v18 = +[_SFCollectionViewListTextSupplementaryView reuseIdentifier];
    id v14 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v18 forIndexPath:v10];

    uint64_t v17 = _WBSLocalizedString();
    v19 = [v17 localizedUppercaseString];
    [v14 setText:v19];

    goto LABEL_10;
  }
  if (v12) {
    goto LABEL_8;
  }
  v13 = +[_SFCollectionViewListTextSupplementaryView reuseIdentifier];
  id v14 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v13 forIndexPath:v10];

  uint64_t v15 = [MEMORY[0x1E4F98970] informativeText];
LABEL_7:
  uint64_t v17 = (void *)v15;
  [v14 setText:v15];
LABEL_10:

LABEL_11:

  return v14;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 section];
  switch(v7)
  {
    case 3:
      goto LABEL_10;
    case 2:
      uint64_t v11 = [v6 row];
      if (v11 == 1) {
        break;
      }
      if (!v11)
      {
        uint64_t v12 = [v18 cellForItemAtIndexPath:v6];
        -[WBSAutoFillInternalFeedbackController setRegression:](self->_feedbackController, "setRegression:", [v12 isChecked] ^ 1);
        objc_msgSend(v12, "setChecked:", -[WBSAutoFillInternalFeedbackController isRegression](self->_feedbackController, "isRegression"));
        v13 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
        [v13 reloadData];
LABEL_14:

        break;
      }
LABEL_10:
      uint64_t v14 = [v6 row];
      if (v14 == [(WBSAutoFillInternalFeedbackController *)self->_feedbackController selectedAttachmentsType])break; {
      uint64_t v15 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController selectedAttachmentsType];
      }
      uint64_t v16 = [MEMORY[0x1E4F28D58] indexPathForRow:v15 inSection:3];
      uint64_t v12 = [v18 cellForItemAtIndexPath:v16];

      [v12 setChecked:0];
      v13 = [v18 cellForItemAtIndexPath:v6];
      [v13 setChecked:1];
      [(WBSAutoFillInternalFeedbackController *)self->_feedbackController setSelectedAttachmentsType:v14];
      goto LABEL_14;
    case 0:
      uint64_t v8 = [v6 row] + 1;
      if (v8 != [(WBSAutoFillInternalFeedbackController *)self->_feedbackController selectedFeedbackCategory])
      {
        uint64_t v9 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController selectedFeedbackCategory];
        if (v9)
        {
          id v10 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 - 1 inSection:0];
        }
        else
        {
          id v10 = 0;
        }
        uint64_t v12 = [v18 cellForItemAtIndexPath:v10];

        [v12 setChecked:0];
        v13 = [v18 cellForItemAtIndexPath:v6];
        [v13 setChecked:1];
        [(WBSAutoFillInternalFeedbackController *)self->_feedbackController setSelectedFeedbackCategory:v8];
        uint64_t v17 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
        [v17 reloadData];

        [(_SFAutoFillInternalFeedbackCollectionViewController *)self _updateContinueInTapToRadarButton];
        goto LABEL_14;
      }
      break;
  }
}

- (void)collectionViewListCellButtonPressed:(id)a3
{
  [(_SFAutoFillInternalFeedbackCollectionViewController *)self dismissViewControllerAnimated:1 completion:0];
  id reportHandler = (void (**)(id, id))self->_reportHandler;
  id v5 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController continueInTapToRadarURL];
  reportHandler[2](reportHandler, v5);
}

- (void)textFieldCellTextDidChange:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [(_SFAutoFillInternalFeedbackCollectionViewController *)self collectionView];
  id v5 = [v4 indexPathForCell:v12];

  if ([v5 section] == 2)
  {
    id v6 = [v12 text];
    [(WBSAutoFillInternalFeedbackController *)self->_feedbackController setKnownWorkingBuild:v6];
  }
  else
  {
    uint64_t v7 = [(WBSAutoFillInternalFeedbackController *)self->_feedbackController detailTypesForSelectedFeedbackCategory];
    uint64_t v8 = [v5 row];
    if (v8 >= 0) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 + 1;
    }
    id v6 = [v7 objectAtIndex:v9 >> 1];

    feedbackController = self->_feedbackController;
    uint64_t v11 = [v12 text];
    [(WBSAutoFillInternalFeedbackController *)feedbackController setResponse:v11 forDetailType:v6];

    [(_SFAutoFillInternalFeedbackCollectionViewController *)self _updateContinueInTapToRadarButton];
  }
}

- (id)reportHandler
{
  return self->_reportHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reportHandler, 0);

  objc_storeStrong((id *)&self->_feedbackController, 0);
}

@end