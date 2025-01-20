@interface CSLPRFDepthAutoLaunchSettings
- (BOOL)isEqual:(id)a3;
- (CSLPRFDepthAutoLaunchSettings)initWithSettings:(id)a3;
- (NSString)bundleID;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)autoLaunchBehavior;
- (int64_t)threshold;
- (unint64_t)changeSource;
- (unint64_t)hash;
@end

@implementation CSLPRFDepthAutoLaunchSettings

- (void).cxx_destruct
{
}

- (int64_t)threshold
{
  return self->_threshold;
}

- (unint64_t)changeSource
{
  return self->_changeSource;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int64_t)autoLaunchBehavior
{
  return self->_autoLaunchBehavior;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v4 = NSStringFromCSLPRFDepthAutoLaunchBehavior([(CSLPRFDepthAutoLaunchSettings *)self autoLaunchBehavior]);
  id v5 = (id)[v3 appendObject:v4 withName:@"behavior"];

  v6 = [(CSLPRFDepthAutoLaunchSettings *)self bundleID];
  id v7 = (id)[v3 appendObject:v6 withName:@"bundleID"];

  id v8 = (id)objc_msgSend(v3, "appendInteger:withName:", -[CSLPRFDepthAutoLaunchSettings changeSource](self, "changeSource"), @"changeSource");
  v9 = NSStringFromCSLPRFDepthAutoLaunchThreshold([(CSLPRFDepthAutoLaunchSettings *)self threshold]);
  id v10 = (id)[v3 appendObject:v9 withName:@"threshold"];

  v11 = [v3 build];

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[CSLPRFDepthAutoLaunchSettings autoLaunchBehavior](self, "autoLaunchBehavior"));
  id v5 = (id)objc_msgSend(v3, "appendInteger:", -[CSLPRFDepthAutoLaunchSettings changeSource](self, "changeSource"));
  v6 = [(CSLPRFDepthAutoLaunchSettings *)self bundleID];
  id v7 = (id)[v3 appendObject:v6];

  id v8 = (id)objc_msgSend(v3, "appendInteger:", -[CSLPRFDepthAutoLaunchSettings threshold](self, "threshold"));
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t v6 = [(CSLPRFDepthAutoLaunchSettings *)self autoLaunchBehavior];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __41__CSLPRFDepthAutoLaunchSettings_isEqual___block_invoke;
  v28[3] = &unk_264A0BCD0;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendInteger:v6 counterpart:v28];
  unint64_t v9 = [(CSLPRFDepthAutoLaunchSettings *)self changeSource];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __41__CSLPRFDepthAutoLaunchSettings_isEqual___block_invoke_2;
  v26[3] = &unk_264A0BCD0;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendInteger:v9 counterpart:v26];
  v12 = [(CSLPRFDepthAutoLaunchSettings *)self bundleID];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __41__CSLPRFDepthAutoLaunchSettings_isEqual___block_invoke_3;
  v24[3] = &unk_264A0BBC8;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendObject:v12 counterpart:v24];

  int64_t v15 = [(CSLPRFDepthAutoLaunchSettings *)self threshold];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __41__CSLPRFDepthAutoLaunchSettings_isEqual___block_invoke_4;
  v22 = &unk_264A0BCD0;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendInteger:v15 counterpart:&v19];
  LOBYTE(v15) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return v15;
}

uint64_t __41__CSLPRFDepthAutoLaunchSettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) autoLaunchBehavior];
}

uint64_t __41__CSLPRFDepthAutoLaunchSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeSource];
}

uint64_t __41__CSLPRFDepthAutoLaunchSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleID];
}

uint64_t __41__CSLPRFDepthAutoLaunchSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) threshold];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CSLPRFMutableDepthAutoLaunchSettings alloc];
  return [(CSLPRFDepthAutoLaunchSettings *)v4 initWithSettings:self];
}

- (CSLPRFDepthAutoLaunchSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSLPRFDepthAutoLaunchSettings;
  id v5 = [(CSLPRFDepthAutoLaunchSettings *)&v9 init];
  if (v5)
  {
    v5->_autoLaunchBehavior = [v4 autoLaunchBehavior];
    uint64_t v6 = [v4 bundleID];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_changeSource = [v4 changeSource];
    v5->_threshold = [v4 threshold];
  }

  return v5;
}

@end