@interface WKWebExtensionCommand
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSString)_shortcut;
- (NSString)_userVisibleShortcut;
- (NSString)activationKey;
- (NSString)debugDescription;
- (NSString)identifier;
- (NSString)title;
- (Object)_apiObject;
- (UIKeyCommand)keyCommand;
- (UIMenuElement)menuItem;
- (WKWebExtensionContext)webExtensionContext;
- (int64_t)modifierFlags;
- (unint64_t)hash;
- (void)_objc_initiateDealloc;
- (void)_webExtensionCommand;
- (void)dealloc;
- (void)setActivationKey:(id)a3;
- (void)setModifierFlags:(int64_t)a3;
@end

@implementation WKWebExtensionCommand

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
  (**(void (***)(void))self->_webExtensionCommand.data.__lx)();
  v3.receiver = self;
  v3.super_class = (Class)WKWebExtensionCommand;
  [(WKWebExtensionCommand *)&v3 dealloc];
}

- (unint64_t)hash
{
  v2 = [(WKWebExtensionCommand *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WKWebExtensionCommand *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;

      if (v6)
      {
        char v8 = WebKit::WebExtensionCommand::operator==((uint64_t)&self->_webExtensionCommand, (uint64_t)&v6->_webExtensionCommand, v7);
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

      v6 = 0;
    }
    char v8 = 0;
    goto LABEL_8;
  }
  char v8 = 1;
LABEL_9:

  return v8;
}

- (NSString)debugDescription
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WKWebExtensionCommand *)self identifier];
  v7 = [(WKWebExtensionCommand *)self activationKey];
  uint64_t v8 = [v7 length];
  if (v8)
  {
    v9 = [(WKWebExtensionCommand *)self _webExtensionCommand];
    WebKit::WebExtensionCommand::shortcutString(v9, v10, &v16);
    if (v16) {
      v11 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
    }
    else {
      v11 = &stru_1EEA10550;
    }
  }
  else
  {
    v11 = @"(none)";
  }
  v12 = [v3 stringWithFormat:@"<%@: %p identifier = %@; shortcut = %@>", v5, self, v6, v11];;
  if (v8)
  {

    v14 = v16;
    v16 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v13);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
  }

  return (NSString *)v12;
}

- (WKWebExtensionContext)webExtensionContext
{
  uint64_t v2 = *(void *)&self->_webExtensionCommand.data.__lx[24];
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

- (NSString)identifier
{
  if (*(void *)&self->_webExtensionCommand.data.__lx[32]) {
    uint64_t v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v2 = &stru_1EEA10550;
  }
  uint64_t v3 = v2;

  return (NSString *)v3;
}

- (NSString)title
{
  if (*(void *)&self->_webExtensionCommand.data.__lx[40]) {
    uint64_t v2 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v2 = &stru_1EEA10550;
  }
  uint64_t v3 = v2;

  return (NSString *)v3;
}

- (NSString)activationKey
{
  if (*(_DWORD *)self[1]._webExtensionCommand.data.__lx) {
    uint64_t v2 = self + 1;
  }
  else {
    uint64_t v2 = (WKWebExtensionCommand *)MEMORY[0x1E4F30978];
  }
  isa = v2->super.isa;
  if (v2->super.isa)
  {
    if (isa[1]) {
      isa = (id)WTF::StringImpl::operator NSString *();
    }
    else {
      isa = 0;
    }
  }

  return (NSString *)isa;
}

- (void)setActivationKey:(id)a3
{
  id v5 = a3;
  MEMORY[0x19972EAD0](&v10, v5);
  char v7 = WebKit::WebExtensionCommand::setActivationKey((uint64_t)&self->_webExtensionCommand, (WTF::String *)&v10);
  uint64_t v8 = v10;
  v10 = 0;
  if (!v8)
  {
LABEL_4:
    if ((v7 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v8, v6);
  if ((v7 & 1) == 0)
  {
LABEL_8:
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"WKWebExtensionCommand.mm" lineNumber:104 description:@"Invalid parameter: an unsupported character was provided"];
  }
LABEL_7:
}

- (int64_t)modifierFlags
{
  Class isa = self[1].super.isa;
  if (isa && *((_DWORD *)isa + 1)) {
    return *(unsigned int *)self[1]._webExtensionCommand.data.__lx;
  }
  else {
    return 0;
  }
}

- (void)setModifierFlags:(int64_t)a3
{
  int v3 = a3;
  if ((a3 & 0xFFFFFFFFFFE1FFFFLL) != 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"WKWebExtensionCommand.mm" lineNumber:115 description:@"Invalid parameter: an unsupported modifier flag was provided"];
  }
  WebKit::WebExtensionCommand::dispatchChangedEventSoonIfNeeded((CFTypeRef *)&self->_webExtensionCommand, (WTF::StringImpl *)a2);
  *(_DWORD *)self[1]._webExtensionCommand.data.__lx = v3 & 0x1E0000;
}

- (UIMenuElement)menuItem
{
  return (UIMenuElement *)WebKit::WebExtensionCommand::platformMenuItem((WebKit::WebExtensionCommand *)&self->_webExtensionCommand);
}

- (UIKeyCommand)keyCommand
{
  return (UIKeyCommand *)WebKit::WebExtensionCommand::keyCommand((WebKit::WebExtensionCommand *)&self->_webExtensionCommand);
}

- (NSString)_shortcut
{
  WebKit::WebExtensionCommand::shortcutString((WebKit::WebExtensionCommand *)&self->_webExtensionCommand, (WTF::StringImpl *)a2, &v9);
  if (v9)
  {
    id v2 = (id)WTF::StringImpl::operator NSString *();
    int v3 = v9;
    id v5 = (__CFString *)v2;
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
    id v5 = &stru_1EEA10550;
    char v7 = &stru_1EEA10550;
    uint64_t v8 = &stru_1EEA10550;
  }

  return (NSString *)v5;
}

- (NSString)_userVisibleShortcut
{
  WebKit::WebExtensionCommand::userVisibleShortcut((WebKit::WebExtensionCommand *)&self->_webExtensionCommand, (WTF::StringImpl *)a2, &v9);
  if (v9)
  {
    id v2 = (id)WTF::StringImpl::operator NSString *();
    int v3 = v9;
    id v5 = (__CFString *)v2;
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
    id v5 = &stru_1EEA10550;
    char v7 = &stru_1EEA10550;
    uint64_t v8 = &stru_1EEA10550;
  }

  return (NSString *)v5;
}

- (Object)_apiObject
{
  return (Object *)&self->_webExtensionCommand;
}

- (void)_webExtensionCommand
{
  return &self->_webExtensionCommand;
}

@end