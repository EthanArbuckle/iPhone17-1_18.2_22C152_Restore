@interface _DPSemanticVersion
- (BOOL)isBackwardCompatibleWithVersion:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_DPSemanticVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 patchVersion:(unint64_t)a5;
- (_DPSemanticVersion)initWithString:(id)a3 error:(id *)a4;
- (id)description;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)patchVersion;
@end

@implementation _DPSemanticVersion

- (_DPSemanticVersion)initWithString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(?:-((?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\\.(?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?$" options:0 error:a4];
  if (v7)
  {
    v8 = objc_msgSend(v7, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
    if ([v8 count])
    {
      id v9 = [v8 objectAtIndexedSubscript:0];
      if ((unint64_t)[v9 numberOfRanges] >= 6
        && [v9 rangeAtIndex:1] != 0x7FFFFFFFFFFFFFFFLL
        && [v9 rangeAtIndex:2] != 0x7FFFFFFFFFFFFFFFLL
        && [v9 rangeAtIndex:3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v16 = [v9 rangeAtIndex:1];
        v18 = objc_msgSend(v6, "substringWithRange:", v16, v17);
        uint64_t v19 = [v9 rangeAtIndex:2];
        v21 = objc_msgSend(v6, "substringWithRange:", v19, v20);
        uint64_t v22 = [v9 rangeAtIndex:3];
        v24 = objc_msgSend(v6, "substringWithRange:", v22, v23);
        self = -[_DPSemanticVersion initWithMajorVersion:minorVersion:patchVersion:](self, "initWithMajorVersion:minorVersion:patchVersion:", [v18 integerValue], objc_msgSend(v21, "integerValue"), objc_msgSend(v24, "integerValue"));

        v12 = self;
        goto LABEL_18;
      }
      v10 = _DPSemanticVersionError(@"Version string is not a valid semantic version string. It should specify at least \"<major>.<minor>.<patch>\".");
      v11 = +[_DPLog framework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_DPSemanticVersion initWithString:error:]((uint64_t)v10, v11);
      }

      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      v13 = [NSString stringWithFormat:@"Failed to parse semantic version from '%@'.", v6];
      _DPSemanticVersionError(v13);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      v14 = +[_DPLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_DPSemanticVersion initWithString:error:]((uint64_t)v9, v14);
      }

      if (a4)
      {
        id v9 = v9;
        v12 = 0;
        *a4 = v9;
        goto LABEL_18;
      }
    }
    v12 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (_DPSemanticVersion)initWithMajorVersion:(unint64_t)a3 minorVersion:(unint64_t)a4 patchVersion:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_DPSemanticVersion;
  result = [(_DPSemanticVersion *)&v9 init];
  if (result)
  {
    result->_majorVersion = a3;
    result->_minorVersion = a4;
    result->_patchVersion = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"(%lu.%lu.%lu)", -[_DPSemanticVersion majorVersion](self, "majorVersion"), -[_DPSemanticVersion minorVersion](self, "minorVersion"), -[_DPSemanticVersion patchVersion](self, "patchVersion"));
}

- (BOOL)isBackwardCompatibleWithVersion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_DPSemanticVersion *)self majorVersion];
  if (v5 != [v4 majorVersion]) {
    goto LABEL_9;
  }
  unint64_t v6 = [(_DPSemanticVersion *)self majorVersion];
  unint64_t v7 = [(_DPSemanticVersion *)self minorVersion];
  unint64_t v8 = [v4 minorVersion];
  if (!v6)
  {
    if (v7 == v8)
    {
      unint64_t v10 = [(_DPSemanticVersion *)self patchVersion];
      BOOL v9 = v10 == [v4 patchVersion];
      goto LABEL_10;
    }
LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  if (v7 <= v8)
  {
    unint64_t v11 = [(_DPSemanticVersion *)self minorVersion];
    if (v11 == [v4 minorVersion])
    {
      unint64_t v12 = [(_DPSemanticVersion *)self patchVersion];
      BOOL v9 = v12 >= [v4 patchVersion];
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    unint64_t v6 = [(_DPSemanticVersion *)self majorVersion];
    if (v6 == [v5 majorVersion]
      && (unint64_t v7 = -[_DPSemanticVersion minorVersion](self, "minorVersion"), v7 == [v5 minorVersion]))
    {
      unint64_t v8 = [(_DPSemanticVersion *)self patchVersion];
      BOOL v9 = v8 == [v5 patchVersion];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (unint64_t)patchVersion
{
  return self->_patchVersion;
}

- (void)initWithString:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end