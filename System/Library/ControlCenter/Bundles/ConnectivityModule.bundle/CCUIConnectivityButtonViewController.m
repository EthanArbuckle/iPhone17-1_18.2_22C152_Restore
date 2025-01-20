@interface CCUIConnectivityButtonViewController
+ (BOOL)isSupported;
+ (id)_symbolConfigurationWithPointSize:(double)a3;
+ (id)glyphImageWithName:(id)a3 pointSize:(double)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)isObservingStateChanges;
- (BOOL)isPresentingMenuModuleViewController;
- (BOOL)performPrimaryActionForControlTemplateView:(id)a3;
- (BOOL)showsMenuAsPrimaryAction;
- (BOOL)showsMenuModuleAsPrimaryAction;
- (CCUIConnectivityButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4;
- (CCUIConnectivityButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4;
- (CCUIContentModuleContext)contentModuleContext;
- (CCUIControlTemplateView)templateView;
- (NSString)menuDisplayName;
- (NSString)subtitleText;
- (UIMenu)contextMenu;
- (id)contextMenuItems;
- (id)displayName;
- (id)identifier;
- (id)statusText;
- (int64_t)_contextMenuItemStateFromMenuItem:(id)a3;
- (void)buttonTapped:(id)a3;
- (void)presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5;
- (void)setContentModuleContext:(id)a3;
- (void)setInoperative:(BOOL)a3;
- (void)setObservingStateChanges:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTemplateView:(id)a3;
- (void)setTitle:(id)a3;
- (void)startObservingStateChanges;
- (void)startObservingStateChangesIfNecessary;
- (void)stopObservingStateChanges;
- (void)stopObservingStateChangesIfNecessary;
- (void)viewDidLoad;
@end

@implementation CCUIConnectivityButtonViewController

- (void)stopObservingStateChangesIfNecessary
{
  if (self->_observingStateChanges) {
    MEMORY[0x270F9A6D0]();
  }
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)glyphImageWithName:(id)a3 pointSize:(double)a4
{
  id v5 = a3;
  v8 = objc_msgSend__symbolConfigurationWithPointSize_(CCUIConnectivityButtonViewController, v6, v7, a4);
  v10 = objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x263F1C6B0], v9, (uint64_t)v5, v8);

  return v10;
}

+ (id)_symbolConfigurationWithPointSize:(double)a3
{
  return (id)MEMORY[0x270F9A6D0](MEMORY[0x263F1C6C8], sel_configurationWithPointSize_weight_scale_, 6);
}

- (CCUIConnectivityButtonViewController)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityButtonViewController;
  return [(CCUILabeledRoundButtonViewController *)&v5 initWithGlyphImage:a3 highlightColor:a4 useLightStyle:1];
}

- (CCUIConnectivityButtonViewController)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityButtonViewController;
  return [(CCUILabeledRoundButtonViewController *)&v5 initWithGlyphPackageDescription:a3 highlightColor:a4 useLightStyle:1];
}

- (id)displayName
{
  return &stru_26F4C07A8;
}

- (id)identifier
{
  return &stru_26F4C07A8;
}

- (id)statusText
{
  return 0;
}

- (void)buttonTapped:(id)a3
{
  objc_msgSend_statusText(self, a2, (uint64_t)a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = objc_msgSend_contentModuleContext(self, v4, v5);
    v8 = objc_msgSend_statusUpdateWithMessage_type_(MEMORY[0x263F33CD8], v7, (uint64_t)v10, 1);
    objc_msgSend_enqueueStatusUpdate_(v6, v9, (uint64_t)v8);
  }
}

- (void)presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v24 = a5;
  v9 = objc_msgSend_alertControllerWithTitle_message_preferredStyle_(MEMORY[0x263F1C3F8], v8, (uint64_t)a3, a4, 1);
  id v10 = (void *)MEMORY[0x263F086E0];
  uint64_t v11 = objc_opt_class();
  v13 = objc_msgSend_bundleForClass_(v10, v12, v11);
  v15 = objc_msgSend_localizedStringForKey_value_table_(v13, v14, @"CONTROL_CENTER_ALERT_OK", &stru_26F4C07A8, 0);

  v17 = objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x263F1C3F0], v16, (uint64_t)v15, 0, 0);
  objc_msgSend_addAction_(v9, v18, (uint64_t)v17);

  v21 = objc_msgSend_presentationController(v9, v19, v20);
  NSClassFromString(&cfstr_Uialertcontrol.isa);
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend__setShouldRespectNearestCurrentContextPresenter_(v21, v23, 1);
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend__setIsCurrentContext_(v21, v22, 1);
    }
  }
  objc_msgSend_presentViewController_animated_completion_(self, v22, (uint64_t)v9, 1, v24);
}

- (void)startObservingStateChanges
{
  self->_observingStateChanges = 1;
}

- (void)startObservingStateChangesIfNecessary
{
  if (!self->_observingStateChanges) {
    ((void (*)(CCUIConnectivityButtonViewController *, char *))MEMORY[0x270F9A6D0])(self, sel_startObservingStateChanges);
  }
}

- (void)stopObservingStateChanges
{
  self->_observingStateChanges = 0;
}

- (void)setTemplateView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateView);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_templateView, obj);
    uint64_t v7 = objc_msgSend_view(self, v5, v6);
    objc_msgSend_setCustomGlyphView_(obj, v8, (uint64_t)v7);

    uint64_t v11 = objc_msgSend_title(self, v9, v10);
    objc_msgSend_setTitle_(obj, v12, (uint64_t)v11);

    v15 = objc_msgSend_subtitle(self, v13, v14);
    objc_msgSend_setSubtitle_(obj, v16, (uint64_t)v15);

    int isInoperative = objc_msgSend_isInoperative(self, v17, v18);
    objc_msgSend_setEnabled_(obj, v20, isInoperative ^ 1u);
  }
}

- (void)setTitle:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CCUIConnectivityButtonViewController;
  id v4 = a3;
  [(CCUILabeledRoundButtonViewController *)&v9 setTitle:v4];
  uint64_t v7 = objc_msgSend_templateView(self, v5, v6, v9.receiver, v9.super_class);
  objc_msgSend_setTitle_(v7, v8, (uint64_t)v4);
}

- (void)setSubtitle:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CCUIConnectivityButtonViewController;
  id v4 = a3;
  [(CCUILabeledRoundButtonViewController *)&v9 setSubtitle:v4];
  uint64_t v7 = objc_msgSend_templateView(self, v5, v6, v9.receiver, v9.super_class);
  objc_msgSend_setSubtitle_(v7, v8, (uint64_t)v4);
}

- (void)setInoperative:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCUIConnectivityButtonViewController;
  -[CCUILabeledRoundButtonViewController setInoperative:](&v9, sel_setInoperative_);
  uint64_t v7 = objc_msgSend_templateView(self, v5, v6);
  objc_msgSend_setEnabled_(v7, v8, !v3);
}

- (int64_t)_contextMenuItemStateFromMenuItem:(id)a3
{
  return objc_msgSend_isSelected(a3, a2, (uint64_t)a3);
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityButtonViewController;
  [(CCUIConnectivityButtonViewController *)&v7 viewDidLoad];
  uint64_t v5 = objc_msgSend_displayName(self, v3, v4);
  objc_msgSend_setTitle_(self, v6, (uint64_t)v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)performPrimaryActionForControlTemplateView:(id)a3
{
  if ((objc_msgSend_showsMenuAsPrimaryAction(self, a2, (uint64_t)a3) & 1) != 0
    || (objc_msgSend_showsMenuModuleAsPrimaryAction(self, v4, v5) & 1) != 0
    || (objc_msgSend_isPresentingMenuModuleViewController(self, v6, v7) & 1) != 0)
  {
    return 1;
  }
  uint64_t v11 = objc_msgSend_button(self, v8, v9);
  objc_msgSend_buttonTapped_(self, v12, (uint64_t)v11);

  return 0;
}

- (NSString)menuDisplayName
{
  return (NSString *)&stru_26F4C07A8;
}

- (BOOL)showsMenuAsPrimaryAction
{
  return 0;
}

- (id)contextMenuItems
{
  return 0;
}

- (UIMenu)contextMenu
{
  return 0;
}

- (BOOL)showsMenuModuleAsPrimaryAction
{
  return 0;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (CCUIControlTemplateView)templateView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateView);

  return (CCUIControlTemplateView *)WeakRetained;
}

- (BOOL)isObservingStateChanges
{
  return self->_observingStateChanges;
}

- (void)setObservingStateChanges:(BOOL)a3
{
  self->_observingStateChanges = a3;
}

- (BOOL)isPresentingMenuModuleViewController
{
  return self->_presentingMenuModuleViewController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_templateView);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);

  objc_storeStrong((id *)&self->_subtitleText, 0);
}

@end