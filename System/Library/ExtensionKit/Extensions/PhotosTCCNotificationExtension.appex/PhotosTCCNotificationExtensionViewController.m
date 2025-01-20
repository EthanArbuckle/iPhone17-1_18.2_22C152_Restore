@interface PhotosTCCNotificationExtensionViewController
+ (id)_log;
- (UILabel)accessLabel;
- (UILabel)countsLabel;
- (UIView)labelContainer;
- (UIView)photoContainer;
- (void)configureWithCompletion:(id)a3;
- (void)setAccessLabel:(id)a3;
- (void)setCountsLabel:(id)a3;
- (void)setLabelContainer:(id)a3;
- (void)setPhotoContainer:(id)a3;
- (void)viewDidLoad;
@end

@implementation PhotosTCCNotificationExtensionViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLabel, 0);
  objc_storeStrong((id *)&self->_countsLabel, 0);
  objc_storeStrong((id *)&self->_labelContainer, 0);

  objc_storeStrong((id *)&self->_photoContainer, 0);
}

- (void)setAccessLabel:(id)a3
{
}

- (UILabel)accessLabel
{
  return self->_accessLabel;
}

- (void)setCountsLabel:(id)a3
{
}

- (UILabel)countsLabel
{
  return self->_countsLabel;
}

- (void)setLabelContainer:(id)a3
{
}

- (UIView)labelContainer
{
  return self->_labelContainer;
}

- (void)setPhotoContainer:(id)a3
{
}

- (UIView)photoContainer
{
  return self->_photoContainer;
}

- (void)configureWithCompletion:(id)a3
{
  v68 = (void (**)(void))a3;
  v4 = [(id)objc_opt_class() _log];
  v5 = [(PhotosTCCNotificationExtensionViewController *)self extensionContext];
  v6 = [v5 inputItems];
  v7 = [v6 firstObject];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  v9 = [v8 userInfo];
  id v10 = kTCCNotificationExtensionDaemonDataKey;
  id v11 = kTCCNotificationExtensionDaemonDataInitialPromptKey;
  id v12 = kTCCNotificationExtensionDaemonDataSetPromptKey;
  v13 = [v9 objectForKeyedSubscript:v10];
  v63 = v12;
  v14 = [v13 objectForKeyedSubscript:v12];

  v65 = v10;
  v66 = v9;
  v15 = [v9 objectForKeyedSubscript:v10];
  v64 = v11;
  v16 = [v15 objectForKeyedSubscript:v11];

  v62 = v14;
  if (v14) {
    [v14 BOOLValue];
  }
  v67 = v8;
  if (v16) {
    [v16 BOOLValue];
  }
  v61 = v16;
  os_signpost_id_t v17 = os_signpost_id_generate(v4);
  v18 = v4;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PhotosTCCNotificationExtensionCounts", (const char *)&unk_100003DE7, buf, 2u);
  }

  v20 = PXTCCPromptCountTitle();
  v21 = [(PhotosTCCNotificationExtensionViewController *)self countsLabel];
  [v21 setText:v20];

  v22 = [(PhotosTCCNotificationExtensionViewController *)self countsLabel];
  v23 = [v22 text];
  id v24 = [v23 length];

  v25 = [(PhotosTCCNotificationExtensionViewController *)self countsLabel];
  v26 = [v25 topAnchor];
  v27 = [(PhotosTCCNotificationExtensionViewController *)self labelContainer];
  v28 = [v27 topAnchor];
  if (v24) {
    [v26 constraintEqualToSystemSpacingBelowAnchor:v28 multiplier:1.5];
  }
  else {
  v29 = [v26 constraintEqualToAnchor:v28 constant:0.0];
  }
  [v29 setActive:1];

  v30 = PXTCCPromptCountSubtitle();
  v31 = [(PhotosTCCNotificationExtensionViewController *)self accessLabel];
  [v31 setText:v30];

  v32 = v19;
  v33 = v32;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v17, "PhotosTCCNotificationExtensionCounts", (const char *)&unk_100003DE7, buf, 2u);
  }

  os_signpost_id_t v34 = os_signpost_id_generate(v33);
  v35 = v33;
  v36 = v35;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "PhotosTCCNotificationExtensionPhotoGrid", (const char *)&unk_100003DE7, buf, 2u);
  }

  [(PhotosTCCNotificationExtensionViewController *)self preferredContentSize];
  v37 = +[PXTCCPhotoGridView photoGridViewForAlertPromptWithWidth:](PXTCCPhotoGridView, "photoGridViewForAlertPromptWithWidth:");
  v38 = v36;
  v39 = v38;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_END, v34, "PhotosTCCNotificationExtensionPhotoGrid", (const char *)&unk_100003DE7, buf, 2u);
  }

  if (v37)
  {
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = [(PhotosTCCNotificationExtensionViewController *)self photoContainer];
    [v40 addSubview:v37];

    v59 = [v37 topAnchor];
    v60 = [(PhotosTCCNotificationExtensionViewController *)self photoContainer];
    v58 = [v60 topAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v70[0] = v57;
    v55 = [v37 leadingAnchor];
    v56 = [(PhotosTCCNotificationExtensionViewController *)self photoContainer];
    v41 = [v56 leadingAnchor];
    v42 = [v55 constraintEqualToAnchor:v41];
    v70[1] = v42;
    v43 = [v37 trailingAnchor];
    v44 = [(PhotosTCCNotificationExtensionViewController *)self photoContainer];
    v45 = [v44 trailingAnchor];
    v46 = [v43 constraintEqualToAnchor:v45];
    v70[2] = v46;
    v47 = +[NSArray arrayWithObjects:v70 count:3];
    +[NSLayoutConstraint activateConstraints:v47];
  }
  v48 = [(PhotosTCCNotificationExtensionViewController *)self countsLabel];
  [v48 sizeToFit];

  v49 = [(PhotosTCCNotificationExtensionViewController *)self accessLabel];
  [v49 sizeToFit];

  v50 = [(PhotosTCCNotificationExtensionViewController *)self labelContainer];
  [v50 layoutIfNeeded];

  [v37 frame];
  double v52 = v51;
  v53 = [(PhotosTCCNotificationExtensionViewController *)self labelContainer];
  [v53 frame];
  -[PhotosTCCNotificationExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v52 + v54);

  v68[2](v68);
}

- (void)viewDidLoad
{
  v69.receiver = self;
  v69.super_class = (Class)PhotosTCCNotificationExtensionViewController;
  [(PhotosTCCNotificationExtensionViewController *)&v69 viewDidLoad];
  -[PhotosTCCNotificationExtensionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, 400.0);
  v3 = (UIView *)objc_alloc_init((Class)UIView);
  [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  photoContainer = self->_photoContainer;
  self->_photoContainer = v3;
  v5 = v3;

  v6 = (UIView *)objc_alloc_init((Class)UIView);
  [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  labelContainer = self->_labelContainer;
  self->_labelContainer = v6;
  id v8 = v6;

  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  [(UILabel *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v9 setNumberOfLines:0];
  v68 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:32770 options:0];
  id v10 = +[UIFont fontWithDescriptor:v68 size:0.0];
  [(UILabel *)v9 setFont:v10];

  [(UILabel *)v9 setTextAlignment:1];
  countsLabel = self->_countsLabel;
  self->_countsLabel = v9;
  id v12 = v9;

  v13 = (UILabel *)objc_alloc_init((Class)UILabel);
  [(UILabel *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v13 setNumberOfLines:0];
  v67 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:0];
  v14 = +[UIFont fontWithDescriptor:v67 size:0.0];
  [(UILabel *)v13 setFont:v14];

  [(UILabel *)v13 setTextAlignment:1];
  accessLabel = self->_accessLabel;
  self->_accessLabel = v13;
  v16 = v13;

  os_signpost_id_t v17 = [(PhotosTCCNotificationExtensionViewController *)self view];
  [v17 addSubview:v5];

  v18 = [(PhotosTCCNotificationExtensionViewController *)self view];
  [v18 addSubview:v8];

  [(UIView *)v8 addSubview:v12];
  [(UIView *)v8 addSubview:v16];
  v65 = [(UIView *)v5 topAnchor];
  v66 = [(PhotosTCCNotificationExtensionViewController *)self view];
  v64 = [v66 topAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v70[0] = v63;
  v61 = [(UIView *)v5 leadingAnchor];
  v62 = [(PhotosTCCNotificationExtensionViewController *)self view];
  v60 = [v62 leadingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v70[1] = v59;
  v39 = v5;
  v57 = [(UIView *)v5 widthAnchor];
  v58 = [(PhotosTCCNotificationExtensionViewController *)self view];
  v56 = [v58 widthAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v70[2] = v55;
  double v54 = [(UIView *)v8 topAnchor];
  v53 = [(UIView *)v5 bottomAnchor];
  double v52 = [v54 constraintEqualToAnchor:v53];
  void v70[3] = v52;
  v50 = [(UIView *)v8 leadingAnchor];
  double v51 = [(PhotosTCCNotificationExtensionViewController *)self view];
  v49 = [v51 leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v70[4] = v48;
  v46 = [(UIView *)v8 trailingAnchor];
  v47 = [(PhotosTCCNotificationExtensionViewController *)self view];
  v45 = [v47 trailingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:-8.0];
  v70[5] = v44;
  v42 = [(UIView *)v8 bottomAnchor];
  v43 = [(PhotosTCCNotificationExtensionViewController *)self view];
  v41 = [v43 bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v70[6] = v40;
  v38 = [(UILabel *)v12 leadingAnchor];
  v37 = [(UIView *)v8 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:8.0];
  v70[7] = v36;
  v27 = v12;
  v35 = [(UILabel *)v12 trailingAnchor];
  os_signpost_id_t v34 = [(UIView *)v8 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v70[8] = v33;
  v32 = [(UILabel *)v16 topAnchor];
  v31 = [(UILabel *)v12 bottomAnchor];
  v30 = [v32 constraintEqualToSystemSpacingBelowAnchor:v31 multiplier:1.0];
  v70[9] = v30;
  v29 = [(UILabel *)v16 leadingAnchor];
  v28 = [(UIView *)v8 leadingAnchor];
  v19 = [v29 constraintEqualToAnchor:v28 constant:8.0];
  v70[10] = v19;
  v20 = [(UILabel *)v16 trailingAnchor];
  v21 = [(UIView *)v8 trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:-8.0];
  v70[11] = v22;
  v23 = [(UIView *)v8 bottomAnchor];
  id v24 = [(UILabel *)v16 bottomAnchor];
  v25 = [v23 constraintEqualToSystemSpacingBelowAnchor:v24 multiplier:2.5];
  v70[12] = v25;
  v26 = +[NSArray arrayWithObjects:v70 count:13];
  +[NSLayoutConstraint activateConstraints:v26];
}

+ (id)_log
{
  if (qword_100008788 != -1) {
    dispatch_once(&qword_100008788, &stru_1000041A0);
  }
  v2 = (void *)qword_100008780;

  return v2;
}

@end