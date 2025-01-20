@interface MessageListSectionDataSourceConfiguration
- (EFPromise)initialLoadCompletedPromise;
- (EMCachingContactStore)contactStore;
- (EMMessageList)messageList;
- (EMObjectID)identifier;
- (MFSearchProgressView)searchProgressView;
- (MUIAvatarImageGenerator)avatarGenerator;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (MessageListCellLayoutValuesHelper)layoutValuesHelper;
- (MessageListSectionDataSourceConfiguration)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 layoutValuesHelper:(id)a7 state:(id)a8 delegate:(id)a9 selectionModelProvider:(id)a10 initialLoadCompletedPromise:(id)a11 searchProgressView:(id)a12 headerType:(unint64_t)a13 brandIndicatorProvider:(id)a14 avatarGenerator:(id)a15 contactStore:(id)a16;
- (MessageListSectionDataSourceDelegate)delegate;
- (MessageListSectionDataSourceSelectionModelProvider)selectionModelProvider;
- (MessageListViewControllerState)state;
- (NSString)section;
- (UICollectionView)collectionView;
- (unint64_t)headerType;
- (void)setAvatarGenerator:(id)a3;
- (void)setBrandIndicatorProvider:(id)a3;
- (void)setSearchProgressView:(id)a3;
@end

@implementation MessageListSectionDataSourceConfiguration

- (MessageListViewControllerState)state
{
  return self->_state;
}

- (MessageListSectionDataSourceSelectionModelProvider)selectionModelProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionModelProvider);
  return (MessageListSectionDataSourceSelectionModelProvider *)WeakRetained;
}

- (NSString)section
{
  return self->_section;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (EFPromise)initialLoadCompletedPromise
{
  return self->_initialLoadCompletedPromise;
}

- (EMObjectID)identifier
{
  return self->_identifier;
}

- (unint64_t)headerType
{
  return self->_headerType;
}

- (MessageListSectionDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MessageListSectionDataSourceDelegate *)WeakRetained;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_brandIndicatorProvider, 0);
  objc_storeStrong((id *)&self->_searchProgressView, 0);
  objc_destroyWeak((id *)&self->_selectionModelProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_initialLoadCompletedPromise, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (MessageListSectionDataSourceConfiguration)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 layoutValuesHelper:(id)a7 state:(id)a8 delegate:(id)a9 selectionModelProvider:(id)a10 initialLoadCompletedPromise:(id)a11 searchProgressView:(id)a12 headerType:(unint64_t)a13 brandIndicatorProvider:(id)a14 avatarGenerator:(id)a15 contactStore:(id)a16
{
  id v43 = a3;
  id v33 = a4;
  id v42 = a4;
  id v34 = a5;
  id v41 = a5;
  id v40 = a6;
  id v35 = a7;
  id v39 = a7;
  id v36 = a8;
  id v38 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a14;
  v26 = v22;
  id v27 = a15;
  id v28 = a16;
  v44.receiver = self;
  v44.super_class = (Class)MessageListSectionDataSourceConfiguration;
  v29 = [(MessageListSectionDataSourceConfiguration *)&v44 init];
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_identifier, a3);
    objc_storeStrong((id *)&v30->_section, v33);
    objc_storeStrong((id *)&v30->_collectionView, v34);
    objc_storeStrong((id *)&v30->_messageList, a6);
    objc_storeStrong((id *)&v30->_layoutValuesHelper, v35);
    objc_storeStrong((id *)&v30->_state, v36);
    objc_storeWeak((id *)&v30->_delegate, v21);
    objc_storeWeak((id *)&v30->_selectionModelProvider, v26);
    objc_storeStrong((id *)&v30->_initialLoadCompletedPromise, a11);
    objc_storeStrong((id *)&v30->_searchProgressView, a12);
    v30->_headerType = a13;
    objc_storeStrong((id *)&v30->_brandIndicatorProvider, a14);
    objc_storeStrong((id *)&v30->_avatarGenerator, a15);
    objc_storeStrong((id *)&v30->_contactStore, a16);
  }

  return v30;
}

- (MFSearchProgressView)searchProgressView
{
  return self->_searchProgressView;
}

- (void)setSearchProgressView:(id)a3
{
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  return self->_brandIndicatorProvider;
}

- (void)setBrandIndicatorProvider:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

@end