@interface SGRe2Basic
- (SGRe2Basic)initWithRegexp:(id)a3;
- (SGRe2Basic)initWithRegexpData:(id)a3;
- (id)description;
- (id)existsInUtf8:(const char *)a3;
- (id)hashId;
- (id)matchesUtf8:(const char *)a3;
- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6;
- (void)dealloc;
- (void)enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6;
@end

@implementation SGRe2Basic

- (void).cxx_destruct
{
}

- (id)hashId
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:20];
  v4 = [(NSData *)self->_patternData bytes];
  int v5 = [(NSData *)self->_patternData length];
  id v6 = v3;
  CC_SHA1(v4, v5 - 1, (unsigned __int8 *)[v6 mutableBytes]);
  v7 = [v6 base64EncodedDataWithOptions:0];
  if ((unint64_t)[v7 length] >= 0x1B)
  {
    uint64_t v9 = [v7 bytes];
    uint64_t v10 = 0;
    memset(v15, 0, 27);
    uint64_t v11 = MEMORY[0x1E4F14390];
    do
    {
      unsigned int v12 = *(char *)(v9 + v10);
      if ((v12 & 0x80000000) != 0) {
        int v13 = __maskrune(*(char *)(v9 + v10), 0x500uLL);
      }
      else {
        int v13 = *(_DWORD *)(v11 + 4 * v12 + 60) & 0x500;
      }
      if (!v13)
      {
        if (v12 == 43)
        {
          LOBYTE(v12) = 45;
        }
        else
        {
          if (v12 != 47) {
            __break(1u);
          }
          LOBYTE(v12) = 95;
        }
      }
      *((unsigned char *)v15 + v10++) = v12;
    }
    while (v10 != 27);
    v8 = (void *)[[NSString alloc] initWithBytes:v15 length:27 encoding:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  pattern = (int *)v2->_pattern;
  if (pattern) {
    v4 = (__CFString *)[[NSString alloc] initWithBytesNoCopy:*((void *)pattern + 1) length:pattern[4] encoding:4 freeWhenDone:0];
  }
  else {
    v4 = @"nil";
  }
  objc_sync_exit(v2);

  int v5 = (void *)[[NSString alloc] initWithFormat:@"<RE2 %@>", v4];
  return v5;
}

- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (a3)
  {
    strlen(a3);
    operator new[]();
  }

  return 1;
}

uint64_t __63__SGRe2Basic__enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  return (*a2 - *a3);
}

- (void)enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SGRe2Basic_enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke;
  v12[3] = &unk_1E65BE8A8;
  id v13 = v10;
  id v11 = v10;
  [(SGRe2Basic *)self _enumerateMatchesInUtf8:a3 fromString:a4 ngroups:a5 block:v12];
}

uint64_t __62__SGRe2Basic_enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)matchesUtf8:(const char *)a3
{
  if (a3)
  {
    v3 = a3;
    v4 = self;
    objc_sync_enter(v4);
    v6[0] = v3;
    v6[1] = strlen(v3);
    LOBYTE(v3) = re2::RE2::DoMatch((uint64_t)v4->_pattern, (uint64_t)v6, 2, 0, 0, 0);
    objc_sync_exit(v4);
    if (v3) {
      goto LABEL_5;
    }
  }
  v4 = 0;
LABEL_5:
  return v4;
}

- (id)existsInUtf8:(const char *)a3
{
  if (a3)
  {
    v3 = a3;
    v4 = self;
    objc_sync_enter(v4);
    v6[0] = v3;
    v6[1] = strlen(v3);
    LOBYTE(v3) = re2::RE2::DoMatch((uint64_t)v4->_pattern, (uint64_t)v6, 0, 0, 0, 0);
    objc_sync_exit(v4);
    if (v3) {
      goto LABEL_5;
    }
  }
  v4 = 0;
LABEL_5:
  return v4;
}

- (void)dealloc
{
  v2 = self;
  objc_sync_enter(v2);
  pattern = (re2::RE2 *)v2->_pattern;
  if (pattern)
  {
    re2::RE2::~RE2(pattern);
    MEMORY[0x1CB79A8C0]();
  }
  objc_sync_exit(v2);

  v4.receiver = v2;
  v4.super_class = (Class)SGRe2Basic;
  [(SGRe2Basic *)&v4 dealloc];
}

- (SGRe2Basic)initWithRegexpData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGRe2Basic;
  id v6 = [(SGRe2Basic *)&v9 init];
  if (v6)
  {
    p_patternData = (id *)&v6->_patternData;
    objc_storeStrong((id *)&v6->_patternData, a3);
    [*p_patternData bytes];
    [*p_patternData length];
    operator new();
  }

  return 0;
}

- (SGRe2Basic)initWithRegexp:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];
  id v8 = v6;
  objc_super v9 = objc_msgSend(v5, "initWithBytes:length:", v7, strlen((const char *)objc_msgSend(v8, "UTF8String")) + 1);
  id v10 = [(SGRe2Basic *)self initWithRegexpData:v9];

  return v10;
}

@end