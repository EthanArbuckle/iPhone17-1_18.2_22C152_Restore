@interface SGRe2Lazy
- (SGRe2Lazy)initWithRegexp:(id)a3;
- (SGRe2Lazy)initWithRegexpData:(id)a3;
- (id)description;
- (id)existsInUtf8:(const char *)a3;
- (id)hashId;
- (id)matchesUtf8:(const char *)a3;
- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6;
@end

@implementation SGRe2Lazy

- (void).cxx_destruct
{
}

- (id)hashId
{
  v2 = getInternal(self->_regexp);
  v3 = [v2 hashId];

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = getInternal(self->_regexp);
  v5 = (void *)[[NSString alloc] initWithData:self->_regexp encoding:4];
  v6 = (void *)[v3 initWithFormat:@"<RE2-lazy(%i) %@>", v4 != 0, v5];

  return v6;
}

- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v12 = getInternal(self->_regexp);
  LODWORD(a5) = [v12 _enumerateMatchesInUtf8:a3 fromString:v10 ngroups:a5 block:v11];

  return a5;
}

- (id)matchesUtf8:(const char *)a3
{
  v4 = getInternal(self->_regexp);
  v5 = [v4 matchesUtf8:a3];

  return v5;
}

- (id)existsInUtf8:(const char *)a3
{
  v4 = getInternal(self->_regexp);
  v5 = [v4 existsInUtf8:a3];

  return v5;
}

- (SGRe2Lazy)initWithRegexpData:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SGRe2.mm", 692, @"Invalid parameter not satisfying: %@", @"regexpUtf8" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SGRe2Lazy;
  v7 = [(SGRe2Lazy *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_regexp, a3);
  }

  return v8;
}

- (SGRe2Lazy)initWithRegexp:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];
  id v8 = v6;
  v9 = objc_msgSend(v5, "initWithBytes:length:", v7, strlen((const char *)objc_msgSend(v8, "UTF8String")) + 1);
  id v10 = [(SGRe2Lazy *)self initWithRegexpData:v9];

  return v10;
}

@end