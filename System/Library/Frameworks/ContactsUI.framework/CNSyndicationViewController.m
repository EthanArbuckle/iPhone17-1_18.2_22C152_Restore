@interface CNSyndicationViewController
+ (id)descriptorForRequiredKeys;
- (CNActionsView)actionsView;
- (CNContact)senderContact;
- (CNContactFormatter)contactFormatter;
- (CNGroupAvatarViewController)groupAvatarViewController;
- (CNGroupIdentity)group;
- (CNGroupIdentityInlineActionsViewConfiguration)actionsViewConfiguration;
- (CNSyndicationViewController)initWithGroup:(id)a3 senderContact:(id)a4 actionsViewConfiguration:(id)a5;
- (NSString)subtitleText;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)actionsContainerView;
- (UIView)nameContainerView;
- (id)subtitleTextForSenderContact:(id)a3;
- (void)didSelectAction:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5;
- (void)setActionsContainerView:(id)a3;
- (void)setActionsView:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setGroup:(id)a3;
- (void)setGroupAvatarViewController:(id)a3;
- (void)setNameContainerView:(id)a3;
- (void)setSenderContact:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupActionViews;
- (void)setupContainerViews;
- (void)setupNameViews;
- (void)viewDidLoad;
@end

@implementation CNSyndicationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsContainerView, 0);
  objc_storeStrong((id *)&self->_actionsView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_groupAvatarViewController, 0);
  objc_storeStrong((id *)&self->_nameContainerView, 0);
  objc_storeStrong((id *)&self->_actionsViewConfiguration, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_senderContact, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_subtitleText, 0);
}

- (void)setActionsContainerView:(id)a3
{
}

- (UIView)actionsContainerView
{
  return self->_actionsContainerView;
}

- (void)setActionsView:(id)a3
{
}

- (CNActionsView)actionsView
{
  return self->_actionsView;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setGroupAvatarViewController:(id)a3
{
}

- (CNGroupAvatarViewController)groupAvatarViewController
{
  return self->_groupAvatarViewController;
}

- (void)setNameContainerView:(id)a3
{
}

- (UIView)nameContainerView
{
  return self->_nameContainerView;
}

- (CNGroupIdentityInlineActionsViewConfiguration)actionsViewConfiguration
{
  return self->_actionsViewConfiguration;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setSenderContact:(id)a3
{
}

- (CNContact)senderContact
{
  return self->_senderContact;
}

- (void)setGroup:(id)a3
{
}

- (CNGroupIdentity)group
{
  return self->_group;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)didSelectAction:(id)a3 withSourceView:(id)a4 longPress:(BOOL)a5
{
  id v6 = a3;
  v7 = [(CNSyndicationViewController *)self actionsViewConfiguration];
  v8 = [v7 actionsPerType];
  v9 = [v6 type];

  id v13 = [v8 objectForKeyedSubscript:v9];

  if (v13)
  {
    v10 = [v13 actionBlock];

    if (v10)
    {
      v11 = [v13 actionBlock];
      v12 = [v13 actionType];
      ((void (**)(void, void *))v11)[2](v11, v12);
    }
  }
}

- (void)setupActionViews
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v35 = [(CNSyndicationViewController *)self actionsContainerView];
  v3 = objc_alloc_init(CNActionsView);
  [(CNActionsView *)v3 setActionsDelegate:self];
  v4 = v3;
  [(CNActionsView *)v3 setStyle:5];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v5 = [(CNSyndicationViewController *)self actionsViewConfiguration];
  id v6 = [v5 supportedActionTypes];

  id obj = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v12 = [(CNSyndicationViewController *)self actionsViewConfiguration];
        id v13 = [v12 actionsPerType];
        v14 = [v13 objectForKeyedSubscript:v11];

        v15 = [v14 image];
        v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4FB1818], "cnui_userActionSymbolImageForActionType:scale:withColor:", v11, 2, 0);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v17;

        v19 = [[CNActionItem alloc] initWithImage:v18 type:v11];
        [(CNActionsView *)v4 addActionItem:v19];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
  }

  v20 = [MEMORY[0x1E4FB1618] labelColor];
  v21 = v4;
  [(CNActionsView *)v4 setTintColor:v20];

  [(CNActionsView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v35 addSubview:v4];
  v30 = (void *)MEMORY[0x1E4F28DC8];
  id obja = [(CNActionsView *)v4 leadingAnchor];
  v34 = [v35 leadingAnchor];
  v33 = [obja constraintEqualToAnchor:v34];
  v42[0] = v33;
  v32 = [(CNActionsView *)v4 topAnchor];
  v31 = [v35 topAnchor];
  v22 = [v32 constraintEqualToAnchor:v31];
  v42[1] = v22;
  v23 = [(CNActionsView *)v4 bottomAnchor];
  v24 = [v35 bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v42[2] = v25;
  v26 = [(CNActionsView *)v4 trailingAnchor];
  v27 = [v35 trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v42[3] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  [v30 activateConstraints:v29];
}

- (void)setupNameViews
{
  v74[16] = *MEMORY[0x1E4F143B8];
  v3 = [(CNSyndicationViewController *)self nameContainerView];
  v4 = [(CNSyndicationViewController *)self groupAvatarViewController];
  v5 = [v4 view];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [(CNSyndicationViewController *)self groupAvatarViewController];
  [(CNSyndicationViewController *)self addChildViewController:v6];

  [v3 addSubview:v5];
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v7];
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  uint64_t v9 = [(CNSyndicationViewController *)self contactFormatter];
  v10 = [(CNSyndicationViewController *)self group];
  uint64_t v11 = [v9 stringFromGroupIdentity:v10];
  [v8 setText:v11];

  v12 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  id v13 = v8;
  [v8 setFont:v12];

  v14 = [MEMORY[0x1E4FB1618] labelColor];
  [v8 setTextColor:v14];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v8];
  [(CNSyndicationViewController *)self setTitleLabel:v8];
  id v15 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v16 = [(CNSyndicationViewController *)self subtitleText];
  [v15 setText:v16];

  id v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v15 setFont:v17];

  v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v15 setTextColor:v18];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v15];
  [(CNSyndicationViewController *)self setSubtitleLabel:v15];
  v52 = (void *)MEMORY[0x1E4F28DC8];
  v73 = [v5 leadingAnchor];
  v72 = [v3 leadingAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v74[0] = v71;
  v70 = [v5 centerYAnchor];
  v69 = [v3 centerYAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v74[1] = v68;
  v66 = [v5 heightAnchor];
  v65 = [v66 constraintEqualToConstant:40.0];
  v74[2] = v65;
  v64 = [v5 widthAnchor];
  v67 = v5;
  v63 = [v5 heightAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v74[3] = v62;
  v19 = v7;
  v60 = [v7 leadingAnchor];
  v59 = [v5 trailingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59 constant:10.0];
  v74[4] = v58;
  v57 = [v7 trailingAnchor];
  v56 = [v3 trailingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v74[5] = v55;
  v54 = [v7 centerYAnchor];
  v53 = [v3 centerYAnchor];
  v51 = [v54 constraintEqualToAnchor:v53];
  v74[6] = v51;
  v50 = [v7 topAnchor];
  v61 = v3;
  v49 = [v3 topAnchor];
  v48 = [v50 constraintGreaterThanOrEqualToAnchor:v49];
  v74[7] = v48;
  v46 = [v7 bottomAnchor];
  v45 = [v3 bottomAnchor];
  v42 = [v46 constraintLessThanOrEqualToAnchor:v45];
  v74[8] = v42;
  long long v41 = [v13 leadingAnchor];
  long long v40 = [v7 leadingAnchor];
  long long v39 = [v41 constraintEqualToAnchor:v40];
  v74[9] = v39;
  long long v38 = [v13 trailingAnchor];
  v37 = [v7 trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v74[10] = v36;
  v35 = [v13 topAnchor];
  uint64_t v44 = v7;
  v34 = [v7 topAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v74[11] = v33;
  v32 = [v15 topAnchor];
  v31 = [v13 bottomAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v74[12] = v30;
  v20 = [v15 leadingAnchor];
  v47 = v13;
  v21 = [v13 leadingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v74[13] = v22;
  v43 = v15;
  v23 = [v15 trailingAnchor];
  v24 = [v13 trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v74[14] = v25;
  v26 = [v15 bottomAnchor];
  v27 = [v19 bottomAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v74[15] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:16];
  [v52 activateConstraints:v29];
}

- (void)setupContainerViews
{
  v37[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v4 = [(CNSyndicationViewController *)self view];
  [v4 bounds];
  v5 = objc_msgSend(v3, "initWithFrame:");

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [(CNSyndicationViewController *)self view];
  [v6 addSubview:v5];

  [(CNSyndicationViewController *)self setNameContainerView:v5];
  id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v8 = [(CNSyndicationViewController *)self view];
  [v8 bounds];
  uint64_t v9 = objc_msgSend(v7, "initWithFrame:");

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = [(CNSyndicationViewController *)self view];
  [v10 addSubview:v9];

  [(CNSyndicationViewController *)self setActionsContainerView:v9];
  uint64_t v11 = [(CNSyndicationViewController *)self view];
  v12 = [v11 layoutMarginsGuide];

  v26 = (void *)MEMORY[0x1E4F28DC8];
  v36 = [v5 leadingAnchor];
  v35 = [v12 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v37[0] = v34;
  v33 = [v5 topAnchor];
  v31 = [v12 topAnchor];
  v30 = [v33 constraintEqualToAnchor:v31];
  v37[1] = v30;
  v32 = v5;
  v29 = [v5 bottomAnchor];
  v28 = [v12 bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v37[2] = v27;
  v25 = [v9 leadingAnchor];
  v24 = [v5 trailingAnchor];
  v23 = [v25 constraintGreaterThanOrEqualToAnchor:v24];
  v37[3] = v23;
  v22 = [v9 topAnchor];
  v21 = [v12 topAnchor];
  id v13 = [v22 constraintEqualToAnchor:v21];
  v37[4] = v13;
  v14 = [v9 bottomAnchor];
  id v15 = [v12 bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v37[5] = v16;
  id v17 = [v9 trailingAnchor];
  v18 = [v12 trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v37[6] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:7];
  [v26 activateConstraints:v20];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNSyndicationViewController;
  [(CNSyndicationViewController *)&v3 viewDidLoad];
  [(CNSyndicationViewController *)self setupContainerViews];
  [(CNSyndicationViewController *)self setupNameViews];
  [(CNSyndicationViewController *)self setupActionViews];
}

- (void)setSubtitleText:(id)a3
{
  id v6 = (NSString *)a3;
  if (self->_subtitleText != v6)
  {
    objc_storeStrong((id *)&self->_subtitleText, a3);
    v5 = [(CNSyndicationViewController *)self subtitleLabel];
    [v5 setText:v6];
  }
}

- (id)subtitleTextForSenderContact:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = CNContactsUIBundle();
  id v7 = [v6 localizedStringForKey:@"SYNDICATION_SHARED_BY_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
  id v8 = [(CNSyndicationViewController *)self contactFormatter];
  uint64_t v9 = [v8 stringFromContact:v5];

  v10 = objc_msgSend(v4, "stringWithFormat:", v7, v9);

  return v10;
}

- (CNSyndicationViewController)initWithGroup:(id)a3 senderContact:(id)a4 actionsViewConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNSyndicationViewController;
  v12 = [(CNSyndicationViewController *)&v22 initWithNibName:0 bundle:0];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_group, a3);
    objc_storeStrong((id *)&v13->_senderContact, a4);
    objc_storeStrong((id *)&v13->_actionsViewConfiguration, a5);
    v14 = [[CNGroupAvatarViewController alloc] initWithGroup:v9];
    groupAvatarViewController = v13->_groupAvatarViewController;
    v13->_groupAvatarViewController = v14;

    v16 = (CNContactFormatter *)objc_alloc_init(MEMORY[0x1E4F1B910]);
    uint64_t v17 = 1000;
    contactFormatter = v13->_contactFormatter;
    v13->_contactFormatter = v16;

    [(CNContactFormatter *)v13->_contactFormatter setStyle:1000];
    [(CNContactFormatter *)v13->_contactFormatter setFallbackStyle:-1];
    if (v10)
    {
      [(CNSyndicationViewController *)v13 subtitleTextForSenderContact:v10];
    }
    else
    {
      uint64_t v17 = CNContactsUIBundle();
      [(id)v17 localizedStringForKey:@"SYNDICATION_SHARED_WITH_YOU" value:&stru_1ED8AC728 table:@"Localized"];
    v19 = };
    objc_storeStrong((id *)&v13->_subtitleText, v19);
    if (!v10)
    {

      v19 = (void *)v17;
    }

    v20 = v13;
  }

  return v13;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1, &__block_literal_global_4346);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1;

  return v2;
}

void __56__CNSyndicationViewController_descriptorForRequiredKeys__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  v6[0] = *MEMORY[0x1E4F1ADF0];
  v1 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  objc_super v3 = [NSString stringWithUTF8String:"+[CNSyndicationViewController descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  id v5 = (void *)descriptorForRequiredKeys_cn_once_object_1;
  descriptorForRequiredKeys_cn_once_object_1 = v4;
}

@end