@interface FKASiriShortcutKeyboardCommand
+ (BOOL)supportsSecureCoding;
+ (id)commandWithSiriShortcutIdentifier:(id)a3;
- (AXSiriShortcut)shortcut;
- (BOOL)isEqualToCommand:(id)a3;
- (FKASiriShortcutKeyboardCommand)initWithCoder:(id)a3;
- (FKASiriShortcutKeyboardCommand)initWithSiriShortcutIdentifier:(id)a3;
- (NSString)siriShortcutIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localizedName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)perform;
- (void)setShortcut:(id)a3;
@end

@implementation FKASiriShortcutKeyboardCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)commandWithSiriShortcutIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithSiriShortcutIdentifier:v4];

  return v5;
}

- (FKASiriShortcutKeyboardCommand)initWithSiriShortcutIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKASiriShortcutKeyboardCommand;
  v6 = [(AXSSKeyboardCommand *)&v9 initWithType:@"SiriShortcut"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_siriShortcutIdentifier, a3);
  }

  return v7;
}

- (FKASiriShortcutKeyboardCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FKASiriShortcutKeyboardCommand;
  id v5 = [(AXSSKeyboardCommand *)&v14 initWithCoder:v4];
  v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  v7 = [(AXSSKeyboardCommand *)v5 type];
  char v8 = [v7 isEqualToString:@"SiriShortcut"];

  if (v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriShortcut"];
    siriShortcutIdentifier = v6->_siriShortcutIdentifier;
    v6->_siriShortcutIdentifier = (NSString *)v9;

LABEL_4:
    v11 = v6;
    goto LABEL_8;
  }
  v12 = FKALogCommon();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[FKASiriShortcutKeyboardCommand initWithCoder:](v6, v12);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FKASiriShortcutKeyboardCommand;
  id v4 = a3;
  [(AXSSKeyboardCommand *)&v6 encodeWithCoder:v4];
  id v5 = [(FKASiriShortcutKeyboardCommand *)self siriShortcutIdentifier];
  [v4 encodeObject:v5 forKey:@"siriShortcut"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(FKASiriShortcutKeyboardCommand *)self siriShortcutIdentifier];
  objc_super v6 = (void *)[v4 initWithSiriShortcutIdentifier:v5];

  return v6;
}

- (AXSiriShortcut)shortcut
{
  v3 = +[AXSiriShortcutsManager sharedManager];
  id v4 = [(FKASiriShortcutKeyboardCommand *)self siriShortcutIdentifier];
  id v5 = [v3 shortcutForIdentifier:v4];

  return (AXSiriShortcut *)v5;
}

- (id)localizedName
{
  v2 = [(FKASiriShortcutKeyboardCommand *)self shortcut];
  v3 = [v2 shortcutName];

  return v3;
}

- (BOOL)isEqualToCommand:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 siriShortcutIdentifier];
    objc_super v6 = [(FKASiriShortcutKeyboardCommand *)self siriShortcutIdentifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)FKASiriShortcutKeyboardCommand;
  unint64_t v3 = [(AXSSKeyboardCommand *)&v7 hash];
  id v4 = [(FKASiriShortcutKeyboardCommand *)self siriShortcutIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FKASiriShortcutKeyboardCommand;
  unint64_t v3 = [(AXSSKeyboardCommand *)&v7 description];
  id v4 = [(FKASiriShortcutKeyboardCommand *)self siriShortcutIdentifier];
  unint64_t v5 = [v3 stringByAppendingFormat:@", shortcut identifier: %@", v4];

  return v5;
}

- (void)perform
{
  id v4 = +[AXSiriShortcutsManager sharedManager];
  unint64_t v3 = [(FKASiriShortcutKeyboardCommand *)self shortcut];
  [v4 performShortcut:v3];
}

- (NSString)siriShortcutIdentifier
{
  return self->_siriShortcutIdentifier;
}

- (void)setShortcut:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcut, 0);

  objc_storeStrong((id *)&self->_siriShortcutIdentifier, 0);
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [a1 type];
  int v4 = 138412290;
  unint64_t v5 = v3;
  _os_log_fault_impl(&dword_18D308000, a2, OS_LOG_TYPE_FAULT, "Unexpectedly decoded shortcut keyboard command with different type: %@", (uint8_t *)&v4, 0xCu);
}

@end