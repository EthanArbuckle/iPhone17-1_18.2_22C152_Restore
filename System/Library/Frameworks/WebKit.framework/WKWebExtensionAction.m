@interface WKWebExtensionAction
+ (void)initialize;
- (BOOL)hasUnreadBadgeText;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)presentsPopup;
- (NSArray)menuItems;
- (NSString)badgeText;
- (NSString)inspectionName;
- (NSString)label;
- (Object)_apiObject;
- (UIViewController)popupViewController;
- (WKWebExtensionContext)webExtensionContext;
- (WKWebExtensionTab)associatedTab;
- (WKWebView)popupWebView;
- (id)iconForSize:(CGSize)a3;
- (void)_objc_initiateDealloc;
- (void)_webExtensionAction;
- (void)closePopup;
- (void)dealloc;
- (void)setHasUnreadBadgeText:(BOOL)a3;
- (void)setInspectionName:(id)a3;
@end

@implementation WKWebExtensionAction

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F41813B0](a1);
  }
}

- (void)_objc_initiateDealloc
{
  if (WTF::isMainRunLoop((WTF *)self))
  {
    MEMORY[0x1F4181400](self);
  }
  else
  {
    v3 = MEMORY[0x1E4F14428];
    v4 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
    dispatch_async_f(v3, self, v4);
  }
}

- (void)dealloc
{
  (**(void (***)(void))self->_webExtensionAction.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionAction;
  [(WKWebExtensionAction *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WKWebExtensionAction *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;

      if (v6)
      {
        BOOL v7 = WebKit::WebExtensionAction::operator==((uint64_t)&self->_webExtensionAction, (uint64_t)&v6->_webExtensionAction);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      v6 = 0;
    }
    BOOL v7 = 0;
    goto LABEL_8;
  }
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (WKWebExtensionContext)webExtensionContext
{
  uint64_t v2 = *(void *)&self->_webExtensionAction.data.__lx[24];
  if (v2 && (uint64_t v3 = *(void *)(v2 + 8)) != 0)
  {
    v4 = WebKit::WebExtensionAction::wrapper((id *)(v3 - 16));
  }
  else
  {
    v4 = 0;
  }

  return (WKWebExtensionContext *)v4;
}

- (WKWebExtensionTab)associatedTab
{
  if (self->_webExtensionAction.data.__lx[40]
    && (uint64_t v2 = *(void *)&self->_webExtensionAction.data.__lx[32]) != 0
    && (uint64_t v3 = *(void *)(v2 + 8)) != 0)
  {
    ++*(_DWORD *)v3;
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 32));
    WTF::RefCounted<WebKit::WebExtensionTab>::deref(v3);
  }
  else
  {
    id WeakRetained = 0;
  }

  return (WKWebExtensionTab *)WeakRetained;
}

- (id)iconForSize:(CGSize)a3
{
  return WebKit::WebExtensionAction::icon((WebKit::WebExtensionAction *)&self->_webExtensionAction, a3);
}

- (NSString)label
{
  WebKit::WebExtensionAction::label((WebKit::WebExtensionAction *)&self->_webExtensionAction, 1, &v9);
  if (v9)
  {
    id v2 = (id)WTF::StringImpl::operator NSString *();
    uint64_t v3 = v9;
    v5 = (__CFString *)v2;
    v9 = 0;
    if (v3)
    {
      if (*(_DWORD *)v3 == 2) {
        WTF::StringImpl::destroy(v3, v4);
      }
      else {
        *(_DWORD *)v3 -= 2;
      }
    }
  }
  else
  {
    v5 = &stru_1EEA10550;
    BOOL v7 = &stru_1EEA10550;
    v8 = &stru_1EEA10550;
  }

  return (NSString *)v5;
}

- (NSString)badgeText
{
  WebKit::WebExtensionAction::badgeText((WebKit::WebExtensionAction *)&self->_webExtensionAction, &v9);
  if (v9)
  {
    id v2 = (id)WTF::StringImpl::operator NSString *();
    uint64_t v3 = v9;
    v5 = (__CFString *)v2;
    v9 = 0;
    if (v3)
    {
      if (*(_DWORD *)v3 == 2) {
        WTF::StringImpl::destroy(v3, v4);
      }
      else {
        *(_DWORD *)v3 -= 2;
      }
    }
  }
  else
  {
    v5 = &stru_1EEA10550;
    BOOL v7 = &stru_1EEA10550;
    v8 = &stru_1EEA10550;
  }

  return (NSString *)v5;
}

- (BOOL)hasUnreadBadgeText
{
  return WebKit::WebExtensionAction::hasUnreadBadgeText((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (void)setHasUnreadBadgeText:(BOOL)a3
{
}

- (NSString)inspectionName
{
  return (NSString *)WebKit::WebExtensionAction::popupWebViewInspectionName((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (void)setInspectionName:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WebKit::WebExtensionAction::setPopupWebViewInspectionName((WebKit::WebExtensionAction *)&self->_webExtensionAction, &v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (BOOL)isEnabled
{
  return WebKit::WebExtensionAction::isEnabled((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (NSArray)menuItems
{
  return (NSArray *)WebKit::WebExtensionAction::platformMenuItems((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (BOOL)presentsPopup
{
  return WebKit::WebExtensionAction::presentsPopup((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (UIViewController)popupViewController
{
  return (UIViewController *)WebKit::WebExtensionAction::popupViewController((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (WKWebView)popupWebView
{
  return (WKWebView *)WebKit::WebExtensionAction::popupWebView((WebKit::WebExtensionAction *)&self->_webExtensionAction);
}

- (void)closePopup
{
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionAction;
}

- (void)_webExtensionAction
{
  return &self->_webExtensionAction;
}

@end