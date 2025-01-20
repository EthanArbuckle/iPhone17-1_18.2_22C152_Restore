@interface ASCredentialRequestBasicPaneViewController
- (ASCredentialRequestBasicPaneViewController)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5;
- (ASCredentialRequestBasicPaneViewController)initWithTitle:(id)a3 titleStyle:(int64_t)a4 subtitle:(id)a5 subtitleStyle:(int64_t)a6 icon:(id)a7 iconStyle:(int64_t)a8;
- (void)updateSubtitle:(id)a3;
- (void)viewDidLoad;
@end

@implementation ASCredentialRequestBasicPaneViewController

- (ASCredentialRequestBasicPaneViewController)initWithTitle:(id)a3 titleStyle:(int64_t)a4 subtitle:(id)a5 subtitleStyle:(int64_t)a6 icon:(id)a7 iconStyle:(int64_t)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ASCredentialRequestBasicPaneViewController;
  v17 = [(ASCredentialRequestPaneViewController *)&v24 initRequiringTableView:0];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    title = v17->_title;
    v17->_title = (NSString *)v18;

    v17->_titleStyle = a4;
    uint64_t v20 = [v15 copy];
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v20;

    v17->_subtitleStyle = a6;
    objc_storeStrong((id *)&v17->_icon, a7);
    v17->_iconStyle = a8;
    v22 = v17;
  }

  return v17;
}

- (ASCredentialRequestBasicPaneViewController)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5
{
  return [(ASCredentialRequestBasicPaneViewController *)self initWithTitle:a3 titleStyle:0 subtitle:a4 subtitleStyle:1 icon:a5 iconStyle:0];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)ASCredentialRequestBasicPaneViewController;
  [(ASCredentialRequestPaneViewController *)&v6 viewDidLoad];
  if (self->_subtitle)
  {
    v3 = [[ASCredentialRequestInfoLabelSubPane alloc] initWithString:self->_subtitle labelStyle:self->_subtitleStyle];
    subtitleSubPane = self->_subtitleSubPane;
    self->_subtitleSubPane = v3;
  }
  v5 = [(ASCredentialRequestPaneViewController *)self headerPaneContext];
  [v5 addIcon:self->_icon iconStyle:self->_iconStyle title:self->_title titleStyle:self->_titleStyle subtitlePane:self->_subtitleSubPane subtitleStyle:self->_subtitleStyle subtitleBottomSpacing:0];

  [(ASCredentialRequestPaneViewController *)self sizeToFitPaneContent];
}

- (void)updateSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleSubPane, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end