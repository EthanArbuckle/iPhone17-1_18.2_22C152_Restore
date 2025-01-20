@interface SGRe2
+ (id)re2WithRegexp:(id)a3;
+ (id)re2WithRegexpData:(id)a3;
+ (id)re2WithRegexpDataLazy:(id)a3;
+ (id)re2WithRegexpLazy:(id)a3;
+ (id)re2WithSubregexps:(id)a3;
+ (id)re2WithSubregexps:(id)a3 prefilter:(id)a4;
+ (void)setCacheLimitForTesting:(unint64_t)a3;
- (BOOL)isTrivial;
- (id)existsInString:(id)a3;
- (id)hashId;
- (id)matchesString:(id)a3;
- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6;
- (void)enumerateMatchesInString:(id)a3 ngroups:(unint64_t)a4 block:(id)a5;
- (void)enumerateMatchesInString:(id)a3 ngroups:(unint64_t)a4 blockWithSubregexp:(id)a5;
- (void)enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6;
@end

@implementation SGRe2

- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v7 = a4;
  id v8 = a6;
  __break(1u);
  return (int)v8;
}

- (id)hashId
{
  return 0;
}

- (void)enumerateMatchesInString:(id)a3 ngroups:(unint64_t)a4 blockWithSubregexp:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  -[SGRe2 _enumerateMatchesInUtf8:fromString:ngroups:block:](self, "_enumerateMatchesInUtf8:fromString:ngroups:block:", [v10 UTF8String], v10, a4, v9);
}

- (void)enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__SGRe2_enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke;
  v12[3] = &unk_1E65BE8A8;
  id v13 = v10;
  id v11 = v10;
  [(SGRe2 *)self _enumerateMatchesInUtf8:a3 fromString:a4 ngroups:a5 block:v12];
}

uint64_t __57__SGRe2_enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v3;
}

- (void)enumerateMatchesInString:(id)a3 ngroups:(unint64_t)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  -[SGRe2 enumerateMatchesInUtf8:fromString:ngroups:block:](self, "enumerateMatchesInUtf8:fromString:ngroups:block:", [v10 UTF8String], v10, a4, v9);
}

- (id)existsInString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = -[SGRe2 existsInUtf8:](self, "existsInUtf8:", [v4 UTF8String]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)matchesString:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = -[SGRe2 matchesUtf8:](self, "matchesUtf8:", [v4 UTF8String]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isTrivial
{
  v2 = self;
  objc_sync_enter(v2);
  int isTrivial = v2->_isTrivial;
  if (!v2->_isTrivial)
  {
    id v4 = [(SGRe2 *)v2 existsInUtf8:""];
    if (v4) {
      char v5 = 1;
    }
    else {
      char v5 = 2;
    }
    v2->_int isTrivial = v5;

    int isTrivial = v2->_isTrivial;
  }
  BOOL v6 = isTrivial == 1;
  objc_sync_exit(v2);

  return v6;
}

+ (void)setCacheLimitForTesting:(unint64_t)a3
{
  getLazyRe2Cache();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setCountLimit:a3];
}

+ (id)re2WithSubregexps:(id)a3
{
  id v3 = a3;
  id v4 = [[SGRe2Subregexps alloc] initWithSubregexps:v3 prefilter:0];

  return v4;
}

+ (id)re2WithSubregexps:(id)a3 prefilter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[SGRe2Subregexps alloc] initWithSubregexps:v5 prefilter:v6];

  return v7;
}

+ (id)re2WithRegexpDataLazy:(id)a3
{
  id v3 = a3;
  id v4 = [[SGRe2Lazy alloc] initWithRegexpData:v3];

  return v4;
}

+ (id)re2WithRegexpData:(id)a3
{
  id v3 = a3;
  id v4 = [[SGRe2Basic alloc] initWithRegexpData:v3];

  return v4;
}

+ (id)re2WithRegexpLazy:(id)a3
{
  id v3 = a3;
  id v4 = [[SGRe2Lazy alloc] initWithRegexp:v3];

  return v4;
}

+ (id)re2WithRegexp:(id)a3
{
  id v3 = a3;
  id v4 = [[SGRe2Basic alloc] initWithRegexp:v3];

  return v4;
}

@end