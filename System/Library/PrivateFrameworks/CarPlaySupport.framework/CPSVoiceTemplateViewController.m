@interface CPSVoiceTemplateViewController
- (CPSVoiceTemplateViewController)initWithVoiceTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5;
- (CPSVoiceView)titleView;
- (UITapGestureRecognizer)backGestureRecognizer;
- (double)lastVoiceTemplateStateChangeTime;
- (id)_stateWithIdentifier:(id)a3;
- (id)voiceTemplate;
- (void)_activateStateWithIdentifier:(id)a3;
- (void)_backGestureFired:(id)a3;
- (void)_viewDidLoad;
- (void)setBackGestureRecognizer:(id)a3;
- (void)setLastVoiceTemplateStateChangeTime:(double)a3;
- (void)setTitleView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSVoiceTemplateViewController

- (CPSVoiceTemplateViewController)initWithVoiceTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  v5 = v18;
  v18 = 0;
  v14.receiver = v5;
  v14.super_class = (Class)CPSVoiceTemplateViewController;
  v13 = [(CPSBaseTemplateViewController *)&v14 initWithTemplate:location[0] templateDelegate:v16 templateEnvironment:v15];
  v18 = v13;
  objc_storeStrong((id *)&v18, v13);
  if (v13)
  {
    v6 = [CPSVoiceView alloc];
    uint64_t v7 = -[CPSVoiceView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    titleView = v18->_titleView;
    v18->_titleView = (CPSVoiceView *)v7;
  }
  v10 = v18;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v18, 0);
  return v10;
}

- (id)voiceTemplate
{
  v3 = objc_opt_class();
  v4 = [(CPSBaseTemplateViewController *)self associatedTemplate];
  id v5 = CPSSafeCast(v3, v4);

  return v5;
}

- (void)_viewDidLoad
{
  v44[4] = *MEMORY[0x263EF8340];
  v43 = self;
  SEL v42 = a2;
  v41.receiver = self;
  v41.super_class = (Class)CPSVoiceTemplateViewController;
  [(CPSBaseTemplateViewController *)&v41 _viewDidLoad];
  id v4 = (id)[MEMORY[0x263F1C550] tableBackgroundColor];
  id v3 = (id)[(CPSVoiceTemplateViewController *)v43 view];
  [v3 setBackgroundColor:v4];

  id v6 = (id)[(CPSVoiceTemplateViewController *)v43 view];
  id v5 = [(CPSVoiceTemplateViewController *)v43 titleView];
  objc_msgSend(v6, "addSubview:");

  v8 = [(CPSVoiceTemplateViewController *)v43 titleView];
  uint64_t v7 = [(CPSVoiceView *)v8 imageView];
  [(UIImageView *)v7 sizeToFit];

  v9 = (void *)MEMORY[0x263F08938];
  v34 = [(CPSVoiceTemplateViewController *)v43 titleView];
  id v33 = (id)[(CPSVoiceView *)v34 topAnchor];
  id v32 = (id)[(CPSVoiceTemplateViewController *)v43 view];
  id v31 = (id)[v32 safeAreaLayoutGuide];
  id v30 = (id)[v31 topAnchor];
  id v29 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
  v44[0] = v29;
  v28 = [(CPSVoiceTemplateViewController *)v43 titleView];
  id v27 = (id)[(CPSVoiceView *)v28 leadingAnchor];
  id v26 = (id)[(CPSVoiceTemplateViewController *)v43 view];
  id v25 = (id)[v26 safeAreaLayoutGuide];
  id v24 = (id)[v25 leadingAnchor];
  id v23 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
  v44[1] = v23;
  v22 = [(CPSVoiceTemplateViewController *)v43 titleView];
  id v21 = (id)[(CPSVoiceView *)v22 trailingAnchor];
  id v20 = (id)[(CPSVoiceTemplateViewController *)v43 view];
  id v19 = (id)[v20 safeAreaLayoutGuide];
  id v18 = (id)[v19 trailingAnchor];
  id v17 = (id)objc_msgSend(v21, "constraintEqualToAnchor:");
  v44[2] = v17;
  id v16 = [(CPSVoiceTemplateViewController *)v43 titleView];
  id v15 = (id)[(CPSVoiceView *)v16 bottomAnchor];
  id v14 = (id)[(CPSVoiceTemplateViewController *)v43 view];
  id v13 = (id)[v14 safeAreaLayoutGuide];
  id v12 = (id)[v13 bottomAnchor];
  id v11 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v44[3] = v11;
  id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
  objc_msgSend(v9, "activateConstraints:");

  id v2 = objc_alloc(MEMORY[0x263F1C468]);
  v36 = (void *)[v2 initWithBarButtonSystemItem:1 target:v43 action:sel__dismissTemplateViewController];
  id v35 = (id)[(CPSVoiceTemplateViewController *)v43 navigationItem];
  [v35 setLeftBarButtonItem:v36];

  id v39 = [(CPSVoiceTemplateViewController *)v43 voiceTemplate];
  id v38 = (id)[v39 voiceControlStates];
  id v37 = (id)[v38 firstObject];
  id location = (id)[v37 identifier];

  if (location) {
    [(CPSVoiceTemplateViewController *)v43 _activateStateWithIdentifier:location];
  }
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CPSVoiceTemplateViewController;
  [(CPSBaseTemplateViewController *)&v7 viewDidAppear:a3];
  id v3 = objc_alloc(MEMORY[0x263F1CA70]);
  id v6 = (id)[v3 initWithTarget:v10 action:sel__backGestureFired_];
  [v6 setAllowedPressTypes:&unk_26DF06A48];
  id v5 = (id)[(CPSVoiceTemplateViewController *)v10 navigationController];
  id v4 = (id)[v5 view];
  [v4 addGestureRecognizer:v6];

  [(CPSVoiceTemplateViewController *)v10 setBackGestureRecognizer:v6];
  objc_storeStrong(&v6, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSVoiceTemplateViewController;
  [(CPSBaseTemplateViewController *)&v5 viewWillAppear:a3];
  id v4 = [(CPSVoiceTemplateViewController *)v8 titleView];
  id v3 = [(CPSVoiceView *)v4 imageView];
  [(UIImageView *)v3 startAnimating];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CPSVoiceTemplateViewController;
  [(CPSBaseTemplateViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(CPSVoiceTemplateViewController *)v8 titleView];
  id v3 = [(CPSVoiceView *)v4 imageView];
  [(UIImageView *)v3 stopAnimating];
}

- (void)_backGestureFired:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] state] == 3) {
    [(CPSBaseTemplateViewController *)v4 _dismissTemplateViewController];
  }
  objc_storeStrong(location, 0);
}

- (id)_stateWithIdentifier:(id)a3
{
  id v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v16 = 0;
  id v8 = [(CPSVoiceTemplateViewController *)v18 voiceTemplate];
  id v7 = (id)[v8 voiceControlStates];
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __55__CPSVoiceTemplateViewController__stateWithIdentifier___block_invoke;
  id v14 = &unk_2648A3968;
  id v15 = location[0];
  uint64_t v9 = [v7 indexOfObjectPassingTest:&v10];

  uint64_t v16 = v9;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = 0;
  }
  else
  {
    id v6 = [(CPSVoiceTemplateViewController *)v18 voiceTemplate];
    id v5 = (id)[v6 voiceControlStates];
    id v19 = (id)[v5 objectAtIndexedSubscript:v16];
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  id v3 = v19;

  return v3;
}

uint64_t __55__CPSVoiceTemplateViewController__stateWithIdentifier___block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = (id)[location[0] identifier];
  char v5 = [v4 isEqualToString:a1[4]];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)_activateStateWithIdentifier:(id)a3
{
  int v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __63__CPSVoiceTemplateViewController__activateStateWithIdentifier___block_invoke;
  id v8 = &unk_2648A3990;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __63__CPSVoiceTemplateViewController__activateStateWithIdentifier___block_invoke(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = (id)[*(id *)(a1 + 32) _stateWithIdentifier:*(void *)(a1 + 40)];
  if (location[0])
  {
    [*(id *)(a1 + 32) lastVoiceTemplateStateChangeTime];
    if (v1 <= 0.0
      || ([MEMORY[0x263EFF910] timeIntervalSinceReferenceDate],
          double v12 = v2,
          [*(id *)(a1 + 32) lastVoiceTemplateStateChangeTime],
          v12 - v3 >= 0.5))
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      objc_msgSend(*(id *)(a1 + 32), "setLastVoiceTemplateStateChangeTime:");
      id v6 = (id)[*(id *)(a1 + 32) titleView];
      id v5 = (id)[v6 titleLabel];
      id v4 = (id)[location[0] titleVariants];
      objc_msgSend(v5, "setTextVariants:");

      id v9 = (id)[*(id *)(a1 + 32) titleView];
      id v8 = (id)[v9 imageView];
      id v7 = (id)[location[0] image];
      objc_msgSend(v8, "setImage:");

      id v11 = (id)[*(id *)(a1 + 32) titleView];
      id v10 = (id)[v11 imageView];
      objc_msgSend(v10, "setAnimationRepeatCount:", (objc_msgSend(location[0], "repeats") & 1) == 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (CPSVoiceView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UITapGestureRecognizer)backGestureRecognizer
{
  return self->_backGestureRecognizer;
}

- (void)setBackGestureRecognizer:(id)a3
{
}

- (double)lastVoiceTemplateStateChangeTime
{
  return self->_lastVoiceTemplateStateChangeTime;
}

- (void)setLastVoiceTemplateStateChangeTime:(double)a3
{
  self->_lastVoiceTemplateStateChangeTime = a3;
}

- (void).cxx_destruct
{
}

@end