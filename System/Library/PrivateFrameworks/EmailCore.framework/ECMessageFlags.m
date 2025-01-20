@interface ECMessageFlags
+ (BOOL)supportsSecureCoding;
+ (id)cachedFlagsWithHash:(unint64_t)a3 generator:(id)a4;
- (BOOL)deleted;
- (BOOL)draft;
- (BOOL)flagged;
- (BOOL)forwarded;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJunk;
- (BOOL)junkLevelSetByUser;
- (BOOL)read;
- (BOOL)redirected;
- (BOOL)replied;
- (ECMessageFlags)init;
- (ECMessageFlags)initWithBuilder:(id)a3;
- (ECMessageFlags)initWithCoder:(id)a3;
- (ECMessageFlags)initWithHash:(unint64_t)a3;
- (NSString)ef_publicDescription;
- (id)_flagColorDebugDescription;
- (id)_junkLevelDebugDescription;
- (id)updatedFlagsWithBuilder:(id)a3;
- (unint64_t)flagColor;
- (unint64_t)hash;
- (unint64_t)junkLevel;
- (void)encodeWithCoder:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDraft:(BOOL)a3;
- (void)setFlagColor:(unint64_t)a3;
- (void)setFlagged:(BOOL)a3;
- (void)setForwarded:(BOOL)a3;
- (void)setJunkLevel:(unint64_t)a3;
- (void)setJunkLevelSetByUser:(BOOL)a3;
- (void)setRead:(BOOL)a3;
- (void)setRedirected:(BOOL)a3;
- (void)setReplied:(BOOL)a3;
@end

@implementation ECMessageFlags

- (ECMessageFlags)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"EFPropertyKey_hash"];
  v6 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__ECMessageFlags_initWithCoder___block_invoke;
  v10[3] = &unk_1E63EE988;
  v7 = self;
  v11 = v7;
  uint64_t v12 = v5;
  v8 = [v6 cachedFlagsWithHash:v5 generator:v10];

  return v8;
}

- (ECMessageFlags)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, ECMessageFlags *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ECMessageFlags;
  uint64_t v5 = [(ECMessageFlags *)&v12 init];
  if (v5)
  {
    v4[2](v4, v5);
    v6 = objc_opt_class();
    v7.hashValue = (unint64_t)v5->_storage;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __34__ECMessageFlags_initWithBuilder___block_invoke;
    v10[3] = &unk_1E63EE938;
    v8 = v5;
    v11 = v8;
    uint64_t v5 = [v6 cachedFlagsWithHash:v7.hashValue generator:v10];
  }
  return v5;
}

+ (id)cachedFlagsWithHash:(unint64_t)a3 generator:(id)a4
{
  id v5 = a4;
  if (cachedFlagsWithHash_generator__onceToken != -1) {
    dispatch_once(&cachedFlagsWithHash_generator__onceToken, &__block_literal_global_14);
  }
  v6 = (void *)cachedFlagsWithHash_generator__cache;
  ECMessageFlagsHashedBitField v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v6 objectForKey:v7 generator:v5];

  return v8;
}

- (BOOL)replied
{
  return (LOWORD(self->_storage.hashValue) >> 2) & 1;
}

- (BOOL)forwarded
{
  return (LOWORD(self->_storage.hashValue) >> 5) & 1;
}

- (void)setRead:(BOOL)a3
{
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFFE | a3;
}

- (void)setJunkLevel:(unint64_t)a3
{
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFCFF | ((a3 & 3) << 8);
}

- (BOOL)read
{
  return self->_storage.hashValue & 1;
}

- (BOOL)flagged
{
  return (LOWORD(self->_storage.hashValue) >> 3) & 1;
}

- (void)setReplied:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFFB | v3;
}

- (void)setRedirected:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFBF | v3;
}

- (void)setForwarded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFDF | v3;
}

- (void)setFlagged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFF7 | v3;
}

- (void)setDraft:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFEF | v3;
}

- (BOOL)redirected
{
  return (LOWORD(self->_storage.hashValue) >> 6) & 1;
}

- (BOOL)draft
{
  return (LOWORD(self->_storage.hashValue) >> 4) & 1;
}

- (void)setJunkLevelSetByUser:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFF7F | v3;
}

- (BOOL)isJunk
{
  return [(ECMessageFlags *)self junkLevel] == 1;
}

- (unint64_t)junkLevel
{
  return BYTE1(self->_storage.hashValue) & 3;
}

- (unint64_t)flagColor
{
  return ((unint64_t)LOWORD(self->_storage.hashValue) >> 10) & 7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ECMessageFlags hash](self, "hash"), @"EFPropertyKey_hash");
}

- (unint64_t)hash
{
  return self->_storage.hashValue;
}

- (void)setFlagColor:(unint64_t)a3
{
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xE3FF | ((a3 & 7) << 10);
}

id __32__ECMessageFlags_initWithCoder___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) initWithHash:*(void *)(a1 + 40)];
  return v1;
}

- (ECMessageFlags)initWithHash:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ECMessageFlags;
  result = [(ECMessageFlags *)&v5 init];
  if (result) {
    result->_storage.hashValue = a3;
  }
  return result;
}

- (void)setDeleted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_storage.hashValue) = self->_storage.hashValue & 0xFFFD | v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __48__ECMessageFlags_cachedFlagsWithHash_generator___block_invoke()
{
  cachedFlagsWithHash_generator__cache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F60D88]);
  return MEMORY[0x1F41817F8]();
}

id __34__ECMessageFlags_initWithBuilder___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (ECMessageFlags)init
{
  return [(ECMessageFlags *)self initWithBuilder:&__block_literal_global_4];
}

- (id)updatedFlagsWithBuilder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [ECMessageFlags alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ECMessageFlags_updatedFlagsWithBuilder___block_invoke;
  v9[3] = &unk_1E63EE960;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  ECMessageFlagsHashedBitField v7 = [(ECMessageFlags *)v5 initWithBuilder:v9];

  return v7;
}

void __42__ECMessageFlags_updatedFlagsWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setRead:", objc_msgSend(*(id *)(a1 + 32), "read"));
  objc_msgSend(v3, "setDeleted:", objc_msgSend(*(id *)(a1 + 32), "deleted"));
  objc_msgSend(v3, "setReplied:", objc_msgSend(*(id *)(a1 + 32), "replied"));
  objc_msgSend(v3, "setFlagged:", objc_msgSend(*(id *)(a1 + 32), "flagged"));
  objc_msgSend(v3, "setDraft:", objc_msgSend(*(id *)(a1 + 32), "draft"));
  objc_msgSend(v3, "setForwarded:", objc_msgSend(*(id *)(a1 + 32), "forwarded"));
  objc_msgSend(v3, "setRedirected:", objc_msgSend(*(id *)(a1 + 32), "redirected"));
  objc_msgSend(v3, "setJunkLevelSetByUser:", objc_msgSend(*(id *)(a1 + 32), "junkLevelSetByUser"));
  objc_msgSend(v3, "setJunkLevel:", objc_msgSend(*(id *)(a1 + 32), "junkLevel"));
  objc_msgSend(v3, "setFlagColor:", objc_msgSend(*(id *)(a1 + 32), "flagColor"));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(ECMessageFlags *)self hash];
    BOOL v6 = v5 == [v4 hash];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)deleted
{
  return (LOWORD(self->_storage.hashValue) >> 1) & 1;
}

- (BOOL)junkLevelSetByUser
{
  return (LOWORD(self->_storage.hashValue) >> 7) & 1;
}

- (id)_junkLevelDebugDescription
{
  return off_1E63EE9A8[BYTE1(self->_storage.hashValue) & 3];
}

- (id)_flagColorDebugDescription
{
  return off_1E63EE9C8[((unint64_t)LOWORD(self->_storage.hashValue) >> 10) & 7];
}

- (NSString)ef_publicDescription
{
  v31[9] = *MEMORY[0x1E4F143B8];
  id v3 = @"Read";
  __int16 hashValue = self->_storage.hashValue;
  if ((hashValue & 1) == 0) {
    id v3 = @"Unread";
  }
  v31[0] = v3;
  char v29 = hashValue;
  if ((hashValue & 2) != 0)
  {
    LOBYTE(v6) = hashValue;
    unint64_t v5 = @"Deleted";
  }
  else
  {
    unint64_t v5 = [MEMORY[0x1E4F1CA98] null];
    __int16 v6 = self->_storage.hashValue;
  }
  v30 = v5;
  v31[1] = v5;
  char v27 = v6;
  if ((v6 & 4) != 0)
  {
    ECMessageFlagsHashedBitField v7 = @"Replied";
  }
  else
  {
    ECMessageFlagsHashedBitField v7 = [MEMORY[0x1E4F1CA98] null];
    __int16 v6 = self->_storage.hashValue;
  }
  v26 = v7;
  v31[2] = v7;
  char v28 = v6;
  if ((v6 & 0x20) != 0)
  {
    v8 = @"Forwarded";
    LOBYTE(v9) = v6;
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
    __int16 v9 = self->_storage.hashValue;
  }
  v31[3] = v8;
  v25 = v8;
  if ((v9 & 0x40) != 0)
  {
    id v10 = @"Redirected";
    LOBYTE(v11) = v9;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
    __int16 v11 = self->_storage.hashValue;
  }
  v31[4] = v10;
  v24 = v10;
  if ((v11 & 0x10) != 0)
  {
    objc_super v12 = @"Draft";
    LOBYTE(v13) = v11;
  }
  else
  {
    objc_super v12 = [MEMORY[0x1E4F1CA98] null];
    __int16 v13 = self->_storage.hashValue;
  }
  v31[5] = v12;
  if ((v13 & 8) != 0)
  {
    v16 = NSString;
    v15 = [(ECMessageFlags *)self _flagColorDebugDescription];
    v14 = [v16 stringWithFormat:@"Flagged:%@", v15];
  }
  else
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
    v15 = v14;
  }
  v31[6] = v14;
  __int16 v17 = self->_storage.hashValue;
  if ((v17 & 0x80) != 0)
  {
    v18 = @"JunkLevelSetByUser";
  }
  else
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v31[7] = v18;
  v19 = [(ECMessageFlags *)self _junkLevelDebugDescription];
  v31[8] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:9];

  if ((v17 & 0x80) == 0) {
  if ((v13 & 8) != 0)
  }

  if ((v11 & 0x10) == 0) {
  if ((v9 & 0x40) == 0)
  }

  if ((v28 & 0x20) == 0) {
  if ((v27 & 4) == 0)
  }

  if ((v29 & 2) == 0) {
  v21 = objc_msgSend(v20, "ef_filter:", *MEMORY[0x1E4F60CE8]);
  }
  v22 = [v21 componentsJoinedByString:@"|"];

  return (NSString *)v22;
}

@end