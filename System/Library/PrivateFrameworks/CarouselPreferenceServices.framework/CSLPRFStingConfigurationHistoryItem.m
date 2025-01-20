@interface CSLPRFStingConfigurationHistoryItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CSLPRFStingConfigurationHistoryItem)initWithBundleID:(id)a3 actionType:(unint64_t)a4 identifier:(id)a5;
- (CSLPRFStingConfigurationHistoryItem)initWithCoder:(id)a3;
- (NSNumber)actionType;
- (NSString)bundleID;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)linkActionType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CSLPRFStingConfigurationHistoryItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)setActionType:(id)a3
{
}

- (NSNumber)actionType
{
  return self->_actionType;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_bundleID withName:@"bundleID" skipIfEmpty:1];
  [v3 appendString:self->_identifier withName:@"identifier" skipIfEmpty:1];
  v4 = NSString;
  NSInteger v5 = [(NSNumber *)self->_actionType integerValue];
  if ((unint64_t)(v5 - 1) > 0x28) {
    v6 = 0;
  }
  else {
    v6 = off_264A0AC28[v5 - 1];
  }
  v7 = v6;
  v8 = [v4 stringWithFormat:@"%@ (%@)", v7, self->_actionType];

  [v3 appendString:v8 withName:@"actionType"];
  v9 = [v3 build];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  NSInteger v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  bundleID = self->_bundleID;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__CSLPRFStingConfigurationHistoryItem_isEqual___block_invoke;
  v20[3] = &unk_264A0B520;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendString:bundleID counterpart:v20];
  identifier = self->_identifier;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__CSLPRFStingConfigurationHistoryItem_isEqual___block_invoke_2;
  v18[3] = &unk_264A0B520;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendString:identifier counterpart:v18];
  actionType = self->_actionType;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __47__CSLPRFStingConfigurationHistoryItem_isEqual___block_invoke_3;
  v16[3] = &unk_264A0BBC8;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendObject:actionType counterpart:v16];
  LOBYTE(actionType) = [v5 isEqual];

  return (char)actionType;
}

uint64_t __47__CSLPRFStingConfigurationHistoryItem_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleID];
}

uint64_t __47__CSLPRFStingConfigurationHistoryItem_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) identifier];
}

uint64_t __47__CSLPRFStingConfigurationHistoryItem_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) actionType];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_bundleID];
  id v5 = (id)[v3 appendString:self->_identifier];
  id v6 = (id)[v3 appendObject:self->_actionType];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CSLPRFStingConfigurationHistoryItem);
  [(CSLPRFStingConfigurationHistoryItem *)v4 setBundleID:self->_bundleID];
  [(CSLPRFStingConfigurationHistoryItem *)v4 setIdentifier:self->_identifier];
  [(CSLPRFStingConfigurationHistoryItem *)v4 setActionType:self->_actionType];
  return v4;
}

- (CSLPRFStingConfigurationHistoryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSLPRFStingConfigurationHistoryItem;
  id v5 = [(CSLPRFStingConfigurationHistoryItem *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"actionType"];
    actionType = v5->_actionType;
    v5->_actionType = (NSNumber *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_actionType forKey:@"actionType"];
}

- (unint64_t)linkActionType
{
  return [(NSNumber *)self->_actionType integerValue];
}

- (CSLPRFStingConfigurationHistoryItem)initWithBundleID:(id)a3 actionType:(unint64_t)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CSLPRFStingConfigurationHistoryItem;
  id v11 = [(CSLPRFStingConfigurationHistoryItem *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundleID, a3);
    uint64_t v13 = [NSNumber numberWithInteger:a4];
    actionType = v12->_actionType;
    v12->_actionType = (NSNumber *)v13;

    objc_storeStrong((id *)&v12->_identifier, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end