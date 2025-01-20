@interface BCSShardIdentifier
+ (BCSShardIdentifier)identifierWithType:(int64_t)a3 startIndex:(int64_t)a4 shardCount:;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)shardCount;
- (int64_t)startIndex;
- (int64_t)type;
- (unint64_t)hash;
- (void)setShardCount:(int64_t)a3;
- (void)setStartIndex:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation BCSShardIdentifier

+ (BCSShardIdentifier)identifierWithType:(int64_t)a3 startIndex:(int64_t)a4 shardCount:
{
  self;
  v7 = [BCSShardIdentifier alloc];
  if (v7)
  {
    v9.receiver = v7;
    v9.super_class = (Class)BCSShardIdentifier;
    v7 = (BCSShardIdentifier *)objc_msgSendSuper2(&v9, sel_init);
    if (v7)
    {
      v7->_type = a2;
      v7->_startIndex = a3;
      v7->_shardCount = a4;
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t v6 = [(BCSShardIdentifier *)self startIndex];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __30__BCSShardIdentifier_isEqual___block_invoke;
  v20[3] = &unk_264248A78;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendInteger:v6 counterpart:v20];
  int64_t v9 = [(BCSShardIdentifier *)self type];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __30__BCSShardIdentifier_isEqual___block_invoke_2;
  v18[3] = &unk_264248A78;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendInteger:v9 counterpart:v18];
  int64_t v12 = [(BCSShardIdentifier *)self shardCount];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __30__BCSShardIdentifier_isEqual___block_invoke_3;
  v16[3] = &unk_264248A78;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendInteger:v12 counterpart:v16];
  LOBYTE(v12) = [v5 isEqual];

  return v12;
}

uint64_t __30__BCSShardIdentifier_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startIndex];
}

uint64_t __30__BCSShardIdentifier_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

uint64_t __30__BCSShardIdentifier_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) shardCount];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendInteger:", -[BCSShardIdentifier startIndex](self, "startIndex"));
  id v5 = (id)objc_msgSend(v3, "appendInteger:", -[BCSShardIdentifier type](self, "type"));
  id v6 = (id)objc_msgSend(v3, "appendInteger:", -[BCSShardIdentifier shardCount](self, "shardCount"));
  unint64_t v7 = [v3 hash];

  return v7;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[BCSShardIdentifier type](self, "type"), @"type");
  id v5 = (id)objc_msgSend(v3, "appendInt64:withName:", -[BCSShardIdentifier startIndex](self, "startIndex"), @"startIndex");
  id v6 = (id)objc_msgSend(v3, "appendInt64:withName:", -[BCSShardIdentifier shardCount](self, "shardCount"), @"shardCount");
  unint64_t v7 = [v3 build];

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[BCSShardIdentifier allocWithZone:a3];
  int64_t v5 = [(BCSShardIdentifier *)self type];
  int64_t v6 = [(BCSShardIdentifier *)self startIndex];
  int64_t v7 = [(BCSShardIdentifier *)self shardCount];
  if (!v4) {
    return 0;
  }
  int64_t v8 = v7;
  v10.receiver = v4;
  v10.super_class = (Class)BCSShardIdentifier;
  id result = [(BCSShardIdentifier *)&v10 init];
  if (result)
  {
    *((void *)result + 1) = v5;
    *((void *)result + 2) = v6;
    *((void *)result + 3) = v8;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(int64_t)a3
{
  self->_startIndex = a3;
}

- (int64_t)shardCount
{
  return self->_shardCount;
}

- (void)setShardCount:(int64_t)a3
{
  self->_shardCount = a3;
}

@end