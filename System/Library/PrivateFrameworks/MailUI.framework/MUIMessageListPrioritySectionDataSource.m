@interface MUIMessageListPrioritySectionDataSource
- (BOOL)hasSupplementaryViewOfKind:(id)a3;
- (MUIMessageListPrioritySectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 initialLoadCompletedPromise:(id)a7 layoutValuesHelper:(id)a8 state:(id)a9 headerType:(unint64_t)a10;
- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5;
@end

@implementation MUIMessageListPrioritySectionDataSource

- (MUIMessageListPrioritySectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 messageList:(id)a6 initialLoadCompletedPromise:(id)a7 layoutValuesHelper:(id)a8 state:(id)a9 headerType:(unint64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (a10 != 1)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"MUIMessageListPrioritySectionDataSource.m", 22, @"Invalid parameter not satisfying: %@", @"headerType == MessageListSectionHeaderTypePriority" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)MUIMessageListPrioritySectionDataSource;
  v22 = [(MessageListSectionDataSource *)&v26 initWithIdentifier:v16 section:v17 collectionView:v18 messageList:0 initialLoadCompletedPromise:v19 layoutValuesHelper:v20 state:v21 headerType:1];
  if (v22 && _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    v23 = [MEMORY[0x1E4FB15F8] registrationWithSupplementaryClass:objc_opt_class() elementKind:*MEMORY[0x1E4FB2770] configurationHandler:&__block_literal_global_26];
    [(MessageListSectionDataSource *)v22 setHeaderRegistration:v23];
  }
  return v22;
}

- (BOOL)hasSupplementaryViewOfKind:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()
    && EMIsGreymatterSupportedWithOverride()
    && ([v4 isEqualToString:*MEMORY[0x1E4FB2770]] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MUIMessageListPrioritySectionDataSource;
    BOOL v5 = [(MessageListSectionDataSource *)&v7 hasSupplementaryViewOfKind:v4];
  }

  return v5;
}

- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl()
    && EMIsGreymatterSupportedWithOverride()
    && [v9 isEqualToString:*MEMORY[0x1E4FB2770]])
  {
    v11 = [(MessageListSectionDataSource *)self headerRegistration];
    v12 = [v8 dequeueConfiguredReusableSupplementaryViewWithRegistration:v11 forIndexPath:v10];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)MUIMessageListPrioritySectionDataSource;
    v12 = [(MessageListSectionDataSource *)&v14 configuredReusableSupplementaryViewForCollectionView:v8 elementKind:v9 indexPath:v10];
  }

  return v12;
}

@end