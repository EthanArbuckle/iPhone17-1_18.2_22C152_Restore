@interface TKErrorViewController
+ (id)viewControllerForMessage:(id)a3;
- (NSString)message;
- (void)loadView;
- (void)setMessage:(id)a3;
- (void)viewDidLoad;
@end

@implementation TKErrorViewController

+ (id)viewControllerForMessage:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[TKErrorViewController initWithNibName:bundle:]([TKErrorViewController alloc], "initWithNibName:bundle:", 0);
  [(TKErrorViewController *)v5 setMessage:location[0]];
  v4 = v5;
  objc_storeStrong((id *)&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (void)loadView
{
  v33[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F82E00]);
  v8 = (double *)MEMORY[0x263F001A8];
  id v5 = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  -[TKErrorViewController setView:](self, "setView:");

  id v7 = (id)[MEMORY[0x263F825C8] whiteColor];
  id v6 = (id)[(TKErrorViewController *)self view];
  [v6 setBackgroundColor:v7];

  v3 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", *v8, v8[1], v8[2], v8[3]);
  label = self->_label;
  self->_label = v3;

  [(UILabel *)self->_label setNumberOfLines:0];
  id v9 = (id)[MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  -[UILabel setFont:](self->_label, "setFont:");

  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = (id)[(TKErrorViewController *)self view];
  [v10 addSubview:self->_label];

  v11 = (void *)MEMORY[0x263F08938];
  id v20 = (id)[(UILabel *)self->_label leadingAnchor];
  id v19 = (id)[(TKErrorViewController *)self view];
  id v18 = (id)[v19 leadingAnchor];
  id v17 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
  v33[0] = v17;
  id v16 = (id)[(UILabel *)self->_label trailingAnchor];
  id v15 = (id)[(TKErrorViewController *)self view];
  id v14 = (id)[v15 trailingAnchor];
  id v13 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v33[1] = v13;
  id v12 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v33);
  objc_msgSend(v11, "activateConstraints:");

  v21 = (void *)MEMORY[0x263F08938];
  id v30 = (id)[(UILabel *)self->_label topAnchor];
  id v29 = (id)[(TKErrorViewController *)self view];
  id v28 = (id)[v29 topAnchor];
  id v27 = (id)objc_msgSend(v30, "constraintEqualToAnchor:");
  v32[0] = v27;
  id v26 = (id)[(UILabel *)self->_label bottomAnchor];
  id v25 = (id)[(TKErrorViewController *)self view];
  id v24 = (id)[v25 bottomAnchor];
  id v23 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
  v32[1] = v23;
  id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  objc_msgSend(v21, "activateConstraints:");
}

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)TKErrorViewController;
  [(TKErrorViewController *)&v2 viewDidLoad];
  [(UILabel *)v4->_label setText:v4->_message];
}

- (void)setMessage:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v3 = [location[0] copy];
  message = v6->_message;
  v6->_message = (NSString *)v3;

  [(UILabel *)v6->_label setText:v6->_message];
  objc_storeStrong(location, 0);
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
}

@end