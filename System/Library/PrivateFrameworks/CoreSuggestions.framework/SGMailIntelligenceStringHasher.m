@interface SGMailIntelligenceStringHasher
+ (id)rotatingSaltForDate:(id)a3;
+ (int64_t)hashedString:(id)a3 salts:(id)a4;
+ (int64_t)truncatedSHA256:(id)a3 salts:(id)a4;
- (NSData)rotatingSalt;
- (SGMailIntelligenceStringHasher)init;
- (SGMailIntelligenceStringHasher)initWithSaltValue:(id)a3;
- (id)unrotatedHashedStrings:(id)a3 withHashSize:(unint64_t)a4;
- (int64_t)hashedString:(id)a3;
- (int64_t)hashedUserId;
- (int64_t)truncatedSHA256:(id)a3;
- (int64_t)unrotatedHashedString:(id)a3 withHashSize:(unint64_t)a4;
- (void)setRotatingSalt:(id)a3;
@end

@implementation SGMailIntelligenceStringHasher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatingSalt, 0);

  objc_storeStrong((id *)&self->_salt, 0);
}

- (void)setRotatingSalt:(id)a3
{
}

- (int64_t)hashedUserId
{
  return [(SGMailIntelligenceStringHasher *)self hashedString:@"USER-ID"];
}

- (id)unrotatedHashedStrings:(id)a3 withHashSize:(unint64_t)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__SGMailIntelligenceStringHasher_unrotatedHashedStrings_withHashSize___block_invoke;
  v6[3] = &unk_1E5B8FD60;
  v6[4] = self;
  v6[5] = a4;
  v4 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v6);

  return v4;
}

uint64_t __70__SGMailIntelligenceStringHasher_unrotatedHashedStrings_withHashSize___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) unrotatedHashedString:a2 withHashSize:*(void *)(a1 + 40)];

  return [v2 numberWithLongLong:v3];
}

- (int64_t)unrotatedHashedString:(id)a3 withHashSize:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_salt) {
    return 0;
  }
  salt = self->_salt;
  v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a3;
  v7 = [v5 arrayWithObjects:&salt count:1];
  unint64_t v8 = +[SGMailIntelligenceStringHasher hashedString:salts:](SGMailIntelligenceStringHasher, "hashedString:salts:", v6, v7, salt, v12);

  unint64_t v9 = v8 % a4;
  return v9;
}

- (int64_t)hashedString:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!self->_salt) {
    return 0;
  }
  v9[0] = self->_salt;
  id v4 = a3;
  v5 = [(SGMailIntelligenceStringHasher *)self rotatingSalt];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  int64_t v7 = +[SGMailIntelligenceStringHasher hashedString:v4 salts:v6];

  return v7;
}

- (int64_t)truncatedSHA256:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (!self->_salt) {
    return 0;
  }
  v9[0] = self->_salt;
  id v4 = a3;
  v5 = [(SGMailIntelligenceStringHasher *)self rotatingSalt];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  int64_t v7 = +[SGMailIntelligenceStringHasher truncatedSHA256:v4 salts:v6];

  return v7;
}

- (NSData)rotatingSalt
{
  rotatingSalt = self->_rotatingSalt;
  if (!rotatingSalt)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    v5 = +[SGMailIntelligenceStringHasher rotatingSaltForDate:v4];
    id v6 = self->_rotatingSalt;
    self->_rotatingSalt = v5;

    rotatingSalt = self->_rotatingSalt;
  }

  return rotatingSalt;
}

- (SGMailIntelligenceStringHasher)init
{
  uint64_t v3 = +[SGPersistentSaltProvider saltProviderFromKeyChainWithServiceIdentifier:@"com.apple.suggestions.mail-interaction-log.salt" accessGroup:@"com.apple.suggestions.mail-intelligence"];
  id v4 = [v3 salt];
  v5 = [(SGMailIntelligenceStringHasher *)self initWithSaltValue:v4];

  return v5;
}

- (SGMailIntelligenceStringHasher)initWithSaltValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMailIntelligenceStringHasher;
  id v6 = [(SGMailIntelligenceStringHasher *)&v9 init];
  int64_t v7 = v6;
  if (v5 && v6) {
    objc_storeStrong((id *)&v6->_salt, a3);
  }

  return v7;
}

+ (int64_t)hashedString:(id)a3 salts:(id)a4
{
  id v5 = a4;
  id v6 = [a3 dataUsingEncoding:4];
  int64_t v7 = +[SGMailIntelligenceStringHasher truncatedSHA256:v6 salts:v5];

  return v7;
}

+ (int64_t)truncatedSHA256:(id)a3 salts:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  memset(md, 0, sizeof(md));
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v12 length])
        {
          id v13 = v12;
          CC_SHA256_Update(&c, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v9);
  }

  id v14 = v5;
  CC_SHA256_Update(&c, (const void *)[v14 bytes], objc_msgSend(v14, "length"));
  CC_SHA256_Final((unsigned __int8 *)md, &c);
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
  int64_t v18 = 0;
  [v15 getBytes:&v18 length:8];
  int64_t v16 = v18;

  return v16;
}

+ (id)rotatingSaltForDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 component:8 fromDate:v4];

  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v8 = [v7 component:4 fromDate:v4];

  uint64_t v9 = (v6 - 1) & 1;
  if (v6 < 1) {
    uint64_t v9 = -v9;
  }
  BOOL v10 = __OFSUB__(v6, v9);
  uint64_t v11 = v6 - v9;
  if (v11 < 0 != v10) {
    ++v11;
  }
  uint64_t v12 = 6 * v8 + (v11 >> 1) - 12120;
  char v13 = v12 & 0x7F;
  uint64_t v15 = -v12;
  BOOL v14 = v15 < 0;
  uint64_t v16 = v15 & 0x7F;
  if (v14) {
    LOBYTE(v17) = v13;
  }
  else {
    uint64_t v17 = -v16;
  }
  char v20 = v17;
  int64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v20 length:1];

  return v18;
}

@end