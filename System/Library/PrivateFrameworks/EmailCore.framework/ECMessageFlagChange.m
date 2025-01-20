@interface ECMessageFlagChange
+ (BOOL)supportsSecureCoding;
+ (ECMessageFlagChange)clearFlagged;
+ (ECMessageFlagChange)clearRead;
+ (ECMessageFlagChange)setDeleted;
+ (ECMessageFlagChange)setFlagged;
+ (ECMessageFlagChange)setForwarded;
+ (ECMessageFlagChange)setRead;
+ (ECMessageFlagChange)setReplied;
+ (id)changeFrom:(id)a3 to:(id)a4;
- (BOOL)deleted;
- (BOOL)deletedChanged;
- (BOOL)draft;
- (BOOL)draftChanged;
- (BOOL)flagColorChanged;
- (BOOL)flagged;
- (BOOL)flaggedChanged;
- (BOOL)forwarded;
- (BOOL)forwardedChanged;
- (BOOL)hasChanges;
- (BOOL)isEqual:(id)a3;
- (BOOL)junkLevelChanged;
- (BOOL)junkLevelSetByUser;
- (BOOL)junkLevelSetByUserChanged;
- (BOOL)read;
- (BOOL)readChanged;
- (BOOL)redirected;
- (BOOL)redirectedChanged;
- (BOOL)replied;
- (BOOL)repliedChanged;
- (ECMessageFlagChange)initWithBuilder:(id)a3;
- (ECMessageFlagChange)initWithCoder:(id)a3;
- (NSString)ef_publicDescription;
- (id)flagsAfterChangingFlags:(id)a3 flagsWereChanged:(BOOL *)a4;
- (int64_t)reason;
- (unint64_t)flagColor;
- (unint64_t)hash;
- (unint64_t)junkLevel;
- (void)changesDeletedTo:(BOOL)a3;
- (void)changesDraftTo:(BOOL)a3;
- (void)changesFlagColorTo:(unint64_t)a3;
- (void)changesFlaggedTo:(BOOL)a3;
- (void)changesForwardedTo:(BOOL)a3;
- (void)changesJunkLevelSetByUserTo:(BOOL)a3;
- (void)changesJunkLevelTo:(unint64_t)a3;
- (void)changesReadTo:(BOOL)a3;
- (void)changesRedirectedTo:(BOOL)a3;
- (void)changesRepliedTo:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeleted:(BOOL)a3;
- (void)setDeletedChanged:(BOOL)a3;
- (void)setDraft:(BOOL)a3;
- (void)setDraftChanged:(BOOL)a3;
- (void)setFlagColor:(unint64_t)a3;
- (void)setFlagColorChanged:(BOOL)a3;
- (void)setFlagged:(BOOL)a3;
- (void)setFlaggedChanged:(BOOL)a3;
- (void)setForwarded:(BOOL)a3;
- (void)setForwardedChanged:(BOOL)a3;
- (void)setJunkLevel:(unint64_t)a3;
- (void)setJunkLevelChanged:(BOOL)a3;
- (void)setJunkLevelSetByUser:(BOOL)a3;
- (void)setJunkLevelSetByUserChanged:(BOOL)a3;
- (void)setRead:(BOOL)a3;
- (void)setReadChanged:(BOOL)a3;
- (void)setReason:(int64_t)a3;
- (void)setRedirected:(BOOL)a3;
- (void)setRedirectedChanged:(BOOL)a3;
- (void)setReplied:(BOOL)a3;
- (void)setRepliedChanged:(BOOL)a3;
@end

@implementation ECMessageFlagChange

- (NSString)ef_publicDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(ECMessageFlagChange *)self readChanged])
  {
    v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"read: %ld", -[ECMessageFlagChange read](self, "read"));
    [v3 addObject:v4];
  }
  if ([(ECMessageFlagChange *)self deletedChanged])
  {
    v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"deleted: %ld", -[ECMessageFlagChange deleted](self, "deleted"));
    [v3 addObject:v5];
  }
  if ([(ECMessageFlagChange *)self repliedChanged])
  {
    v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"replied: %ld", -[ECMessageFlagChange replied](self, "replied"));
    [v3 addObject:v6];
  }
  if ([(ECMessageFlagChange *)self flaggedChanged])
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"flagged: %ld", -[ECMessageFlagChange flagged](self, "flagged"));
    [v3 addObject:v7];
  }
  if ([(ECMessageFlagChange *)self draftChanged])
  {
    v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"draft: %ld", -[ECMessageFlagChange draft](self, "draft"));
    [v3 addObject:v8];
  }
  if ([(ECMessageFlagChange *)self forwardedChanged])
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"forwarded: %ld", -[ECMessageFlagChange forwarded](self, "forwarded"));
    [v3 addObject:v9];
  }
  if ([(ECMessageFlagChange *)self redirectedChanged])
  {
    v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"redirected: %ld", -[ECMessageFlagChange redirected](self, "redirected"));
    [v3 addObject:v10];
  }
  if ([(ECMessageFlagChange *)self junkLevelSetByUserChanged])
  {
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"junkLevelSetByUser: %ld", -[ECMessageFlagChange junkLevelSetByUser](self, "junkLevelSetByUser"));
    [v3 addObject:v11];
  }
  if ([(ECMessageFlagChange *)self junkLevelChanged])
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"junkLevel: %ld", -[ECMessageFlagChange junkLevel](self, "junkLevel"));
    [v3 addObject:v12];
  }
  if ([(ECMessageFlagChange *)self flagColorChanged])
  {
    v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"flagColor: %ld", -[ECMessageFlagChange flagColor](self, "flagColor"));
    [v3 addObject:v13];
  }
  v14 = [v3 componentsJoinedByString:@"\n"];
  v15 = [NSString stringWithFormat:@"<%@: %p> %lu changes\n%@", objc_opt_class(), self, objc_msgSend(v3, "count"), v14];

  return (NSString *)v15;
}

+ (id)changeFrom:(id)a3 to:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [ECMessageFlagChange alloc];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__ECMessageFlagChange_changeFrom_to___block_invoke;
  v12[3] = &unk_1E63EE8A8;
  id v8 = v5;
  id v13 = v8;
  id v9 = v6;
  id v14 = v9;
  v10 = [(ECMessageFlagChange *)v7 initWithBuilder:v12];

  return v10;
}

void __37__ECMessageFlagChange_changeFrom_to___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  int v3 = [*(id *)(a1 + 32) read];
  if (v3 != [*(id *)(a1 + 40) read]) {
    objc_msgSend(v13, "changesReadTo:", objc_msgSend(*(id *)(a1 + 40), "read"));
  }
  int v4 = [*(id *)(a1 + 32) deleted];
  if (v4 != [*(id *)(a1 + 40) deleted]) {
    objc_msgSend(v13, "changesDeletedTo:", objc_msgSend(*(id *)(a1 + 40), "deleted"));
  }
  int v5 = [*(id *)(a1 + 32) replied];
  if (v5 != [*(id *)(a1 + 40) replied]) {
    objc_msgSend(v13, "changesRepliedTo:", objc_msgSend(*(id *)(a1 + 40), "replied"));
  }
  int v6 = [*(id *)(a1 + 32) flagged];
  if (v6 != [*(id *)(a1 + 40) flagged]) {
    objc_msgSend(v13, "changesFlaggedTo:", objc_msgSend(*(id *)(a1 + 40), "flagged"));
  }
  int v7 = [*(id *)(a1 + 32) draft];
  if (v7 != [*(id *)(a1 + 40) draft]) {
    objc_msgSend(v13, "changesDraftTo:", objc_msgSend(*(id *)(a1 + 40), "draft"));
  }
  int v8 = [*(id *)(a1 + 32) forwarded];
  if (v8 != [*(id *)(a1 + 40) forwarded]) {
    objc_msgSend(v13, "changesForwardedTo:", objc_msgSend(*(id *)(a1 + 40), "forwarded"));
  }
  int v9 = [*(id *)(a1 + 32) redirected];
  if (v9 != [*(id *)(a1 + 40) redirected]) {
    objc_msgSend(v13, "changesRedirectedTo:", objc_msgSend(*(id *)(a1 + 40), "redirected"));
  }
  int v10 = [*(id *)(a1 + 32) junkLevelSetByUser];
  if (v10 != [*(id *)(a1 + 40) junkLevelSetByUser]) {
    objc_msgSend(v13, "changesJunkLevelSetByUserTo:", objc_msgSend(*(id *)(a1 + 40), "junkLevelSetByUser"));
  }
  uint64_t v11 = [*(id *)(a1 + 32) junkLevel];
  if (v11 != [*(id *)(a1 + 40) junkLevel]) {
    objc_msgSend(v13, "changesJunkLevelTo:", objc_msgSend(*(id *)(a1 + 40), "junkLevel"));
  }
  uint64_t v12 = [*(id *)(a1 + 32) flagColor];
  if (v12 != [*(id *)(a1 + 40) flagColor]) {
    objc_msgSend(v13, "changesFlagColorTo:", objc_msgSend(*(id *)(a1 + 40), "flagColor"));
  }
}

+ (ECMessageFlagChange)setRead
{
  v2 = objc_opt_new();
  [v2 changesReadTo:1];
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)setDeleted
{
  v2 = objc_opt_new();
  [v2 changesDeletedTo:1];
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)clearRead
{
  v2 = objc_opt_new();
  [v2 changesReadTo:0];
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)setFlagged
{
  v2 = objc_opt_new();
  [v2 changesFlaggedTo:1];
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)clearFlagged
{
  v2 = objc_opt_new();
  [v2 changesFlaggedTo:0];
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)setReplied
{
  v2 = objc_opt_new();
  [v2 changesRepliedTo:1];
  return (ECMessageFlagChange *)v2;
}

+ (ECMessageFlagChange)setForwarded
{
  v2 = objc_opt_new();
  [v2 changesForwardedTo:1];
  return (ECMessageFlagChange *)v2;
}

- (ECMessageFlagChange)initWithBuilder:(id)a3
{
  int v4 = (void (**)(id, ECMessageFlagChange *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECMessageFlagChange;
  int v5 = [(ECMessageFlagChange *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

- (BOOL)hasChanges
{
  if ([(ECMessageFlagChange *)self readChanged]
    || [(ECMessageFlagChange *)self deletedChanged]
    || [(ECMessageFlagChange *)self repliedChanged]
    || [(ECMessageFlagChange *)self flaggedChanged]
    || [(ECMessageFlagChange *)self draftChanged]
    || [(ECMessageFlagChange *)self forwardedChanged]
    || [(ECMessageFlagChange *)self redirectedChanged]
    || [(ECMessageFlagChange *)self junkLevelSetByUserChanged]
    || [(ECMessageFlagChange *)self junkLevelChanged])
  {
    return 1;
  }
  return [(ECMessageFlagChange *)self flagColorChanged];
}

- (id)flagsAfterChangingFlags:(id)a3 flagsWereChanged:(BOOL *)a4
{
  id v5 = a3;
  int v24 = [v5 read];
  if (![(ECMessageFlagChange *)self readChanged] || v24 == [(ECMessageFlagChange *)self read])
  {
    int v6 = 0;
  }
  else
  {
    LOBYTE(v24) = [(ECMessageFlagChange *)self read];
    int v6 = 1;
  }
  int v23 = objc_msgSend(v5, "deleted", a4);
  if ([(ECMessageFlagChange *)self deletedChanged]
    && v23 != [(ECMessageFlagChange *)self deleted])
  {
    LOBYTE(v23) = [(ECMessageFlagChange *)self deleted];
    int v6 = 1;
  }
  int v22 = [v5 replied];
  if ([(ECMessageFlagChange *)self repliedChanged]
    && v22 != [(ECMessageFlagChange *)self replied])
  {
    LOBYTE(v22) = [(ECMessageFlagChange *)self replied];
    int v6 = 1;
  }
  int v7 = [v5 flagged];
  if ([(ECMessageFlagChange *)self flaggedChanged]
    && v7 != [(ECMessageFlagChange *)self flagged])
  {
    LOBYTE(v7) = [(ECMessageFlagChange *)self flagged];
    int v6 = 1;
  }
  int v8 = [v5 draft];
  if ([(ECMessageFlagChange *)self draftChanged] && v8 != [(ECMessageFlagChange *)self draft])
  {
    LOBYTE(v8) = [(ECMessageFlagChange *)self draft];
    int v6 = 1;
  }
  int v9 = [v5 forwarded];
  if ([(ECMessageFlagChange *)self forwardedChanged]
    && v9 != [(ECMessageFlagChange *)self forwarded])
  {
    LOBYTE(v9) = [(ECMessageFlagChange *)self forwarded];
    int v6 = 1;
  }
  int v10 = [v5 redirected];
  if ([(ECMessageFlagChange *)self redirectedChanged]
    && v10 != [(ECMessageFlagChange *)self redirected])
  {
    LOBYTE(v10) = [(ECMessageFlagChange *)self redirected];
    int v6 = 1;
  }
  int v11 = [v5 junkLevelSetByUser];
  if ([(ECMessageFlagChange *)self junkLevelSetByUserChanged]
    && v11 != [(ECMessageFlagChange *)self junkLevelSetByUser])
  {
    LOBYTE(v11) = [(ECMessageFlagChange *)self junkLevelSetByUser];
    int v6 = 1;
  }
  uint64_t v12 = [v5 junkLevel];
  if ([(ECMessageFlagChange *)self junkLevelChanged]
    && v12 != [(ECMessageFlagChange *)self junkLevel])
  {
    uint64_t v12 = [(ECMessageFlagChange *)self junkLevel];
    int v6 = 1;
  }
  uint64_t v13 = [v5 flagColor];
  if ([(ECMessageFlagChange *)self flagColorChanged]
    && v13 != [(ECMessageFlagChange *)self flagColor])
  {
    uint64_t v13 = [(ECMessageFlagChange *)self flagColor];
    id v17 = v5;
  }
  else
  {
    id v14 = (ECMessageFlags *)v5;
    if (!v6)
    {
      v15 = v14;
      char v16 = 0;
      goto LABEL_35;
    }
  }
  v18 = [ECMessageFlags alloc];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__ECMessageFlagChange_flagsAfterChangingFlags_flagsWereChanged___block_invoke;
  v25[3] = &__block_descriptor_56_e33_v16__0___ECMessageFlagsBuilder__8l;
  char v26 = v24;
  char v27 = v23;
  char v28 = v22;
  char v29 = v7;
  char v30 = v8;
  char v31 = v9;
  char v32 = v10;
  char v33 = v11;
  v25[4] = v12;
  v25[5] = v13;
  v15 = [(ECMessageFlags *)v18 initWithBuilder:v25];

  char v16 = 1;
LABEL_35:
  if (v21) {
    char *v21 = v16;
  }

  return v15;
}

void __64__ECMessageFlagChange_flagsAfterChangingFlags_flagsWereChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRead:*(unsigned __int8 *)(a1 + 48)];
  [v3 setDeleted:*(unsigned __int8 *)(a1 + 49)];
  [v3 setReplied:*(unsigned __int8 *)(a1 + 50)];
  [v3 setFlagged:*(unsigned __int8 *)(a1 + 51)];
  [v3 setDraft:*(unsigned __int8 *)(a1 + 52)];
  [v3 setForwarded:*(unsigned __int8 *)(a1 + 53)];
  [v3 setRedirected:*(unsigned __int8 *)(a1 + 54)];
  [v3 setJunkLevel:*(void *)(a1 + 32)];
  [v3 setJunkLevelSetByUser:*(unsigned __int8 *)(a1 + 55)];
  [v3 setFlagColor:*(void *)(a1 + 40)];
}

- (void)changesReadTo:(BOOL)a3
{
  [(ECMessageFlagChange *)self setRead:a3];
  [(ECMessageFlagChange *)self setReadChanged:1];
}

- (void)changesDeletedTo:(BOOL)a3
{
  [(ECMessageFlagChange *)self setDeleted:a3];
  [(ECMessageFlagChange *)self setDeletedChanged:1];
}

- (void)changesRepliedTo:(BOOL)a3
{
  [(ECMessageFlagChange *)self setReplied:a3];
  [(ECMessageFlagChange *)self setRepliedChanged:1];
}

- (void)changesFlaggedTo:(BOOL)a3
{
  [(ECMessageFlagChange *)self setFlagged:a3];
  [(ECMessageFlagChange *)self setFlaggedChanged:1];
}

- (void)changesDraftTo:(BOOL)a3
{
  [(ECMessageFlagChange *)self setDraft:a3];
  [(ECMessageFlagChange *)self setDraftChanged:1];
}

- (void)changesForwardedTo:(BOOL)a3
{
  [(ECMessageFlagChange *)self setForwarded:a3];
  [(ECMessageFlagChange *)self setForwardedChanged:1];
}

- (void)changesRedirectedTo:(BOOL)a3
{
  [(ECMessageFlagChange *)self setRedirected:a3];
  [(ECMessageFlagChange *)self setRedirectedChanged:1];
}

- (void)changesJunkLevelSetByUserTo:(BOOL)a3
{
  [(ECMessageFlagChange *)self setJunkLevelSetByUser:a3];
  [(ECMessageFlagChange *)self setJunkLevelSetByUserChanged:1];
}

- (void)changesJunkLevelTo:(unint64_t)a3
{
  [(ECMessageFlagChange *)self setJunkLevel:a3];
  [(ECMessageFlagChange *)self setJunkLevelChanged:1];
}

- (void)changesFlagColorTo:(unint64_t)a3
{
  [(ECMessageFlagChange *)self setFlagColor:a3];
  [(ECMessageFlagChange *)self setFlagColorChanged:1];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(ECMessageFlagChange *)self hash];
    BOOL v6 = v5 == [v4 hash];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2.i32[0] = *(_DWORD *)&self->_deleted;
  uint16x4_t v3 = vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v2), (uint16x4_t)0x4000300020001);
  uint64_t v4 = (v3.i8[0] | v3.i8[4] | ((v3.i32[0] | v3.i32[1]) >> 16) | (32 * self->_forwarded) | (self->_redirected << 6) | (self->_junkLevelSetByUser << 7) | self->_read);
  uint16x8_t v5 = vmovl_u8(*(uint8x8_t *)&self->_readChanged);
  uint32x4_t v6 = vmovl_u16(*(uint16x4_t *)v5.i8);
  v7.i64[0] = v6.u32[2];
  v7.i64[1] = v6.u32[3];
  uint64x2_t v8 = v7;
  uint32x4_t v9 = vmovl_high_u16(v5);
  v7.i64[0] = v9.u32[2];
  v7.i64[1] = v9.u32[3];
  uint64x2_t v10 = v7;
  v7.i64[0] = v6.u32[0];
  v7.i64[1] = v6.u32[1];
  uint64x2_t v11 = v7;
  v7.i64[0] = v9.u32[0];
  v7.i64[1] = v9.u32[1];
  int8x16_t v12 = vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64(v11, (uint64x2_t)xmmword_1BF177480), (int8x16_t)vshlq_u64(v7, (uint64x2_t)xmmword_1BF177470)), vorrq_s8((int8x16_t)vshlq_u64(v8, (uint64x2_t)xmmword_1BF1774A0), (int8x16_t)vshlq_u64(v10, (uint64x2_t)xmmword_1BF177490)));
  return *(void *)&vorr_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) | ((unint64_t)self->_junkLevelChanged << 21) | ((unint64_t)(self->_junkLevel & 3) << 8) | ((unint64_t)self->_flagColorChanged << 22) | v4 & 0xFFFFFFFFFFFFE3FFLL | ((self->_flagColor & 7) << 10);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ECMessageFlagChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__ECMessageFlagChange_initWithCoder___block_invoke;
  v8[3] = &unk_1E63EE8F0;
  id v9 = v4;
  id v5 = v4;
  uint32x4_t v6 = [(ECMessageFlagChange *)self initWithBuilder:v8];

  return v6;
}

void __37__ECMessageFlagChange_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) decodeIntegerForKey:@"EFPropertyKey_hash"];
  unint64_t v4 = v3;
  if ((v3 & 0x2000) != 0) {
    [v5 changesReadTo:v3 & 1];
  }
  if ((v4 & 0x4000) != 0) {
    [v5 changesDeletedTo:(v4 >> 1) & 1];
  }
  if ((v4 & 0x8000) != 0) {
    [v5 changesRepliedTo:(v4 >> 2) & 1];
  }
  if ((v4 & 0x10000) != 0) {
    [v5 changesFlaggedTo:(v4 >> 3) & 1];
  }
  if ((v4 & 0x20000) != 0) {
    [v5 changesDraftTo:(v4 >> 4) & 1];
  }
  if ((v4 & 0x40000) != 0) {
    [v5 changesForwardedTo:(v4 >> 5) & 1];
  }
  if ((v4 & 0x80000) != 0) {
    [v5 changesRedirectedTo:(v4 >> 6) & 1];
  }
  if ((v4 & 0x100000) != 0) {
    [v5 changesJunkLevelSetByUserTo:(v4 >> 7) & 1];
  }
  if ((v4 & 0x200000) != 0) {
    [v5 changesJunkLevelTo:(v4 >> 8) & 3];
  }
  if ((v4 & 0x400000) != 0) {
    [v5 changesFlagColorTo:(v4 >> 10) & 7];
  }
  [v5 setReason:(v4 >> 23) & 0xF];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ECMessageFlagChange hash](self, "hash") & 0xFFFFFFFFF87FFFFFLL | ((self->_reason & 0xF) << 23), @"EFPropertyKey_hash");
}

- (BOOL)read
{
  return self->_read;
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (BOOL)replied
{
  return self->_replied;
}

- (void)setReplied:(BOOL)a3
{
  self->_replied = a3;
}

- (BOOL)flagged
{
  return self->_flagged;
}

- (void)setFlagged:(BOOL)a3
{
  self->_flagged = a3;
}

- (BOOL)draft
{
  return self->_draft;
}

- (void)setDraft:(BOOL)a3
{
  self->_draft = a3;
}

- (BOOL)forwarded
{
  return self->_forwarded;
}

- (void)setForwarded:(BOOL)a3
{
  self->_forwarded = a3;
}

- (BOOL)redirected
{
  return self->_redirected;
}

- (void)setRedirected:(BOOL)a3
{
  self->_redirected = a3;
}

- (BOOL)junkLevelSetByUser
{
  return self->_junkLevelSetByUser;
}

- (void)setJunkLevelSetByUser:(BOOL)a3
{
  self->_junkLevelSetByUser = a3;
}

- (unint64_t)junkLevel
{
  return self->_junkLevel;
}

- (void)setJunkLevel:(unint64_t)a3
{
  self->_junkLevel = a3;
}

- (unint64_t)flagColor
{
  return self->_flagColor;
}

- (void)setFlagColor:(unint64_t)a3
{
  self->_flagColor = a3;
}

- (BOOL)readChanged
{
  return self->_readChanged;
}

- (void)setReadChanged:(BOOL)a3
{
  self->_readChanged = a3;
}

- (BOOL)deletedChanged
{
  return self->_deletedChanged;
}

- (void)setDeletedChanged:(BOOL)a3
{
  self->_deletedChanged = a3;
}

- (BOOL)repliedChanged
{
  return self->_repliedChanged;
}

- (void)setRepliedChanged:(BOOL)a3
{
  self->_repliedChanged = a3;
}

- (BOOL)flaggedChanged
{
  return self->_flaggedChanged;
}

- (void)setFlaggedChanged:(BOOL)a3
{
  self->_flaggedChanged = a3;
}

- (BOOL)draftChanged
{
  return self->_draftChanged;
}

- (void)setDraftChanged:(BOOL)a3
{
  self->_draftChanged = a3;
}

- (BOOL)forwardedChanged
{
  return self->_forwardedChanged;
}

- (void)setForwardedChanged:(BOOL)a3
{
  self->_forwardedChanged = a3;
}

- (BOOL)redirectedChanged
{
  return self->_redirectedChanged;
}

- (void)setRedirectedChanged:(BOOL)a3
{
  self->_redirectedChanged = a3;
}

- (BOOL)junkLevelSetByUserChanged
{
  return self->_junkLevelSetByUserChanged;
}

- (void)setJunkLevelSetByUserChanged:(BOOL)a3
{
  self->_junkLevelSetByUserChanged = a3;
}

- (BOOL)junkLevelChanged
{
  return self->_junkLevelChanged;
}

- (void)setJunkLevelChanged:(BOOL)a3
{
  self->_junkLevelChanged = a3;
}

- (BOOL)flagColorChanged
{
  return self->_flagColorChanged;
}

- (void)setFlagColorChanged:(BOOL)a3
{
  self->_flagColorChanged = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

@end