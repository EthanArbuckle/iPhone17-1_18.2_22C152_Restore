@interface CSLPRFStingSettingsModelAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSLPRFStingSettingsModelAction)initWithCoder:(id)a3;
- (NSString)actionIdentifier;
- (NSString)startActionIdentifier;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionIdentifier:(id)a3;
- (void)setStartActionIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CSLPRFStingSettingsModelAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_startActionIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setStartActionIdentifier:(id)a3
{
}

- (NSString)startActionIdentifier
{
  return self->_startActionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_actionIdentifier withName:@"actionIdentifier" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_startActionIdentifier withName:@"startActionIdentifier" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_title withName:@"title" skipIfNil:0];
  v7 = [v3 build];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  actionIdentifier = self->_actionIdentifier;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __42__CSLPRFStingSettingsModelAction_isEqual___block_invoke;
  v20[3] = &unk_264A0B520;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:actionIdentifier counterpart:v20];
  startActionIdentifier = self->_startActionIdentifier;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__CSLPRFStingSettingsModelAction_isEqual___block_invoke_2;
  v18[3] = &unk_264A0B520;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendString:startActionIdentifier counterpart:v18];
  title = self->_title;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __42__CSLPRFStingSettingsModelAction_isEqual___block_invoke_3;
  v16[3] = &unk_264A0B520;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendString:title counterpart:v16];
  LOBYTE(title) = [v5 isEqual];

  return (char)title;
}

uint64_t __42__CSLPRFStingSettingsModelAction_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionIdentifier];
}

uint64_t __42__CSLPRFStingSettingsModelAction_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startActionIdentifier];
}

uint64_t __42__CSLPRFStingSettingsModelAction_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) title];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_actionIdentifier];
  id v5 = (id)[v3 appendString:self->_startActionIdentifier];
  id v6 = (id)[v3 appendString:self->_title];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CSLPRFStingSettingsModelAction);
  id v5 = (void *)[(NSString *)self->_actionIdentifier copy];
  [(CSLPRFStingSettingsModelAction *)v4 setActionIdentifier:v5];

  id v6 = (void *)[(NSString *)self->_startActionIdentifier copy];
  [(CSLPRFStingSettingsModelAction *)v4 setStartActionIdentifier:v6];

  unint64_t v7 = (void *)[(NSString *)self->_title copy];
  [(CSLPRFStingSettingsModelAction *)v4 setTitle:v7];

  return v4;
}

- (CSLPRFStingSettingsModelAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSLPRFStingSettingsModelAction;
  id v5 = [(CSLPRFStingSettingsModelAction *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"actionIdentifier"];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"startActionIdentifier"];
    startActionIdentifier = v5->_startActionIdentifier;
    v5->_startActionIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  actionIdentifier = self->_actionIdentifier;
  id v5 = a3;
  [v5 encodeObject:actionIdentifier forKey:@"actionIdentifier"];
  [v5 encodeObject:self->_startActionIdentifier forKey:@"startActionIdentifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end