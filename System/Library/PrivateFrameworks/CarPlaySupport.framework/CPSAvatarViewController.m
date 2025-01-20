@interface CPSAvatarViewController
- (CPEntityImageProviding)entity;
- (CPSAvatarViewController)initWithEntity:(id)a3;
- (NSArray)layoutConstraints;
- (UIImageView)avatarImageView;
- (id)preferredFocusEnvironments;
- (void)resetLayoutConstraints;
- (void)setEntity:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setupLayoutConstraints;
- (void)setupViews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)updateViews;
- (void)updateWithEntity:(id)a3;
- (void)viewDidLoad;
@end

@implementation CPSAvatarViewController

- (CPSAvatarViewController)initWithEntity:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)CPSAvatarViewController;
  v6 = -[CPSAvatarViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, 0);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6) {
    objc_storeStrong((id *)&v9->_entity, location[0]);
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)updateWithEntity:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSAvatarViewController *)v4 setEntity:location[0]];
  [(CPSAvatarViewController *)v4 updateViews];
  [(CPSAvatarViewController *)v4 resetLayoutConstraints];
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSAvatarViewController;
  [(CPSAvatarViewController *)&v2 viewDidLoad];
  [(CPSAvatarViewController *)v4 setupViews];
  [(CPSAvatarViewController *)v4 updateViews];
}

- (void)setupViews
{
  id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
  objc_super v7 = [(CPSAvatarViewController *)self entity];
  id v6 = (id)[(CPEntityImageProviding *)v7 imageSet];
  id v5 = (id)[v6 image];
  objc_super v2 = (UIImageView *)objc_msgSend(v4, "initWithImage:");
  avatarImageView = self->_avatarImageView;
  self->_avatarImageView = v2;

  v8 = [(CPSAvatarViewController *)self avatarImageView];
  [(UIImageView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(CPSAvatarViewController *)self avatarImageView];
  [(UIImageView *)v9 setIsAccessibilityElement:0];

  id v11 = (id)[(CPSAvatarViewController *)self view];
  v10 = [(CPSAvatarViewController *)self avatarImageView];
  objc_msgSend(v11, "addSubview:");
}

- (void)updateViews
{
  id v4 = [(CPSAvatarViewController *)self entity];
  id v3 = (id)[(CPEntityImageProviding *)v4 imageSet];
  id v2 = (id)[v3 image];
  -[UIImageView setImage:](self->_avatarImageView, "setImage:");
}

- (void)traitCollectionDidChange:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7.receiver = v9;
  v7.super_class = (Class)CPSAvatarViewController;
  [(CPSAvatarViewController *)&v7 traitCollectionDidChange:location[0]];
  [(CPSAvatarViewController *)v9 resetLayoutConstraints];
  id v6 = (id)[MEMORY[0x263F1C550] labelColor];
  uint64_t v3 = [v6 CGColor];
  id v5 = [(CPSAvatarViewController *)v9 avatarImageView];
  id v4 = (id)[(UIImageView *)v5 layer];
  [v4 setBorderColor:v3];

  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  id v5 = [(CPSAvatarViewController *)self layoutConstraints];
  uint64_t v6 = [(NSArray *)v5 count];

  if (v6)
  {
    id v2 = (void *)MEMORY[0x263F08938];
    uint64_t v3 = [(CPSAvatarViewController *)self layoutConstraints];
    objc_msgSend(v2, "deactivateConstraints:");

    [(CPSAvatarViewController *)self setLayoutConstraints:0];
    id v4 = (id)[(CPSAvatarViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (void)updateViewConstraints
{
  uint64_t v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSAvatarViewController;
  [(CPSAvatarViewController *)&v4 updateViewConstraints];
  id v2 = [(CPSAvatarViewController *)v6 layoutConstraints];
  BOOL v3 = [(NSArray *)v2 count] != 0;

  if (!v3) {
    [(CPSAvatarViewController *)v6 setupLayoutConstraints];
  }
}

- (void)setupLayoutConstraints
{
  v24[4] = *MEMORY[0x263EF8340];
  v23 = self;
  v22[1] = (id)a2;
  v22[0] = (id)objc_opt_new();
  id v17 = (id)[(CPSAvatarViewController *)v23 view];
  id v16 = (id)[v17 centerXAnchor];
  v15 = [(CPSAvatarViewController *)v23 avatarImageView];
  id v14 = (id)[(UIImageView *)v15 centerXAnchor];
  id v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v24[0] = v13;
  id v12 = (id)[(CPSAvatarViewController *)v23 view];
  id v11 = (id)[v12 topAnchor];
  v10 = [(CPSAvatarViewController *)v23 avatarImageView];
  id v9 = (id)[(UIImageView *)v10 topAnchor];
  id v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  v24[1] = v8;
  objc_super v7 = [(CPSAvatarViewController *)v23 avatarImageView];
  id v6 = (id)[(UIImageView *)v7 widthAnchor];
  id v5 = (id)[v6 constraintEqualToConstant:*(double *)&CPSAvatarSize];
  v24[2] = v5;
  objc_super v4 = [(CPSAvatarViewController *)v23 avatarImageView];
  id v3 = (id)[(UIImageView *)v4 heightAnchor];
  id v2 = (id)[v3 constraintEqualToConstant:*(double *)&CPSAvatarSize];
  v24[3] = v2;
  id v21 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];

  [v22[0] addObjectsFromArray:v21];
  id v18 = (id)[v22[0] copy];
  [(CPSAvatarViewController *)v23 setLayoutConstraints:"setLayoutConstraints:"];

  v19 = (void *)MEMORY[0x263F08938];
  v20 = [(CPSAvatarViewController *)v23 layoutConstraints];
  objc_msgSend(v19, "activateConstraints:");

  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
}

- (id)preferredFocusEnvironments
{
  return MEMORY[0x263EFFA68];
}

- (CPEntityImageProviding)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
}

- (UIImageView)avatarImageView
{
  return self->_avatarImageView;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end