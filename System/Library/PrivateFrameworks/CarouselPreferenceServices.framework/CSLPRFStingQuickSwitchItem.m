@interface CSLPRFStingQuickSwitchItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isAvailableForQuickSwitch;
- (BOOL)isEqual:(id)a3;
- (CSLPRFStingQuickSwitchItem)initWithCoder:(id)a3;
- (CSLPRFStingQuickSwitchItem)initWithDelegate:(id)a3 settingsItem:(id)a4 availability:(BOOL)a5;
- (CSLPRFStingQuickSwitchItemDelegate)delegate;
- (CSLPRFStingSettingsItem)settingsItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)actionType;
- (unint64_t)hash;
- (void)_withLock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableForQuickSwitch:(BOOL)a3;
- (void)setAvailableForQuickSwitch:(BOOL)a3 shouldNotify:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CSLPRFStingQuickSwitchItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (CSLPRFStingSettingsItem)settingsItem
{
  return self->_settingsItem;
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFStingQuickSwitchItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFStingQuickSwitchItemDelegate *)WeakRetained;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  unint64_t v4 = [(CSLPRFStingQuickSwitchItem *)self actionType];
  if (v4 - 1 > 0x28) {
    v5 = 0;
  }
  else {
    v5 = off_264A0AC28[v4 - 1];
  }
  v6 = v5;
  [v3 appendString:v6 withName:@"actionType" skipIfEmpty:1];

  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[CSLPRFStingQuickSwitchItem isAvailableForQuickSwitch](self, "isAvailableForQuickSwitch"), @"available");
  v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [MEMORY[0x263F29C58] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
    unint64_t v7 = [(CSLPRFStingQuickSwitchItem *)self actionType];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __38__CSLPRFStingQuickSwitchItem_isEqual___block_invoke;
    v20[3] = &unk_264A0BCD0;
    id v8 = v5;
    id v21 = v8;
    id v9 = (id)[v6 appendInteger:v7 counterpart:v20];
    BOOL v10 = [(CSLPRFStingQuickSwitchItem *)self isAvailableForQuickSwitch];
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __38__CSLPRFStingQuickSwitchItem_isEqual___block_invoke_2;
    v18 = &unk_264A0BCF8;
    id v19 = v8;
    id v11 = v8;
    id v12 = (id)[v6 appendBool:v10 counterpart:&v15];
    char v13 = objc_msgSend(v6, "isEqual", v15, v16, v17, v18);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

uint64_t __38__CSLPRFStingQuickSwitchItem_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionType];
}

uint64_t __38__CSLPRFStingQuickSwitchItem_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAvailableForQuickSwitch];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendInteger:self->_actionType];
  id v5 = (id)[v3 appendBool:self->_availableForQuickSwitch];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CSLPRFStingQuickSwitchItem alloc];
  id v5 = [(CSLPRFStingQuickSwitchItem *)self delegate];
  unint64_t v6 = [(CSLPRFStingQuickSwitchItem *)self settingsItem];
  unint64_t v7 = [(CSLPRFStingQuickSwitchItem *)v4 initWithDelegate:v5 settingsItem:v6 availability:[(CSLPRFStingQuickSwitchItem *)self isAvailableForQuickSwitch]];

  return v7;
}

- (CSLPRFStingQuickSwitchItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSLPRFStingQuickSwitchItem;
  id v5 = [(CSLPRFStingQuickSwitchItem *)&v8 init];
  unint64_t v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_actionType = [v4 decodeIntegerForKey:@"actionType"];
    v6->_availableForQuickSwitch = [v4 decodeBoolForKey:@"available"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__CSLPRFStingQuickSwitchItem_encodeWithCoder___block_invoke;
  v6[3] = &unk_264A0BCA8;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  [(CSLPRFStingQuickSwitchItem *)self _withLock:v6];
}

uint64_t __46__CSLPRFStingQuickSwitchItem_encodeWithCoder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) encodeInteger:*(void *)(*(void *)(a1 + 40) + 40) forKey:@"actionType"];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 8);
  return [v2 encodeBool:v3 forKey:@"available"];
}

- (void)setAvailableForQuickSwitch:(BOOL)a3 shouldNotify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CSLPRFStingQuickSwitchItem_setAvailableForQuickSwitch_shouldNotify___block_invoke;
  v8[3] = &unk_264A0BC80;
  BOOL v9 = a3;
  v8[4] = self;
  v8[5] = &v10;
  [(CSLPRFStingQuickSwitchItem *)self _withLock:v8];
  if (*((unsigned char *)v11 + 24)) {
    BOOL v6 = !v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = [(CSLPRFStingQuickSwitchItem *)self delegate];
    [v7 quickSwitchItemDidChange:self];
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __70__CSLPRFStingQuickSwitchItem_setAvailableForQuickSwitch_shouldNotify___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)setAvailableForQuickSwitch:(BOOL)a3
{
}

- (BOOL)isAvailableForQuickSwitch
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__CSLPRFStingQuickSwitchItem_isAvailableForQuickSwitch__block_invoke;
  v4[3] = &unk_264A0BC58;
  v4[4] = self;
  v4[5] = &v5;
  [(CSLPRFStingQuickSwitchItem *)self _withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __55__CSLPRFStingQuickSwitchItem_isAvailableForQuickSwitch__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  BOOL v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (CSLPRFStingQuickSwitchItem)initWithDelegate:(id)a3 settingsItem:(id)a4 availability:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSLPRFStingQuickSwitchItem;
  uint64_t v10 = [(CSLPRFStingQuickSwitchItem *)&v14 init];
  id v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_storeStrong((id *)&v11->_settingsItem, a4);
    uint64_t v12 = [v9 actionType];
    v11->_actionType = [v12 integerValue];

    v11->_availableForQuickSwitch = a5;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end