@interface SGMailIntelligenceWarning
+ (BOOL)supportsSecureCoding;
+ (id)snippetFromString:(id)a3 coreRange:(_NSRange)a4 withMaxWindowSizeAroundCore:(unint64_t)a5;
- (BOOL)isIncomingMessage;
- (NSNumber)score;
- (NSString)core;
- (NSString)detectedLanguage;
- (NSString)signature;
- (NSString)snippet;
- (SGMailIntelligenceWarning)initWithCoder:(id)a3;
- (SGMailIntelligenceWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8;
- (id)description;
- (id)initFromString:(id)a3 coreRange:(_NSRange)a4 signature:(id)a5 maxWindowSizeAroundCore:(unint64_t)a6 detectedLanguage:(id)a7 isIncomingMessage:(BOOL)a8 score:(id)a9;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGMailIntelligenceWarning

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_detectedLanguage, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_core, 0);

  objc_storeStrong((id *)&self->_snippet, 0);
}

- (NSNumber)score
{
  return self->_score;
}

- (BOOL)isIncomingMessage
{
  return self->_isIncomingMessage;
}

- (NSString)detectedLanguage
{
  return self->_detectedLanguage;
}

- (NSString)signature
{
  return self->_signature;
}

- (NSString)core
{
  return self->_core;
}

- (NSString)snippet
{
  return self->_snippet;
}

- (id)initFromString:(id)a3 coreRange:(_NSRange)a4 signature:(id)a5 maxWindowSizeAroundCore:(unint64_t)a6 detectedLanguage:(id)a7 isIncomingMessage:(BOOL)a8 score:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a9;
  v17 = 0;
  if ([v13 length] && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v14 length] && objc_msgSend(v15, "length"))
    {
      v26.receiver = self;
      v26.super_class = (Class)SGMailIntelligenceWarning;
      v18 = [(SGMailIntelligenceWarning *)&v26 init];
      if (v18)
      {
        uint64_t v19 = +[SGMailIntelligenceWarning snippetFromString:coreRange:withMaxWindowSizeAroundCore:](SGMailIntelligenceWarning, "snippetFromString:coreRange:withMaxWindowSizeAroundCore:", v13, location, length, a6);
        snippet = v18->_snippet;
        v18->_snippet = (NSString *)v19;

        uint64_t v21 = objc_msgSend(v13, "substringWithRange:", location, length);
        core = v18->_core;
        v18->_core = (NSString *)v21;

        objc_storeStrong((id *)&v18->_signature, a5);
        objc_storeStrong((id *)&v18->_detectedLanguage, a7);
        v18->_isIncomingMessage = a8;
        objc_storeStrong((id *)&v18->_score, a9);
      }
      self = v18;
      v17 = self;
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGMailIntelligenceWarning triggered on: %@ (with signature %@) score: %@>", self->_snippet, self->_signature, self->_score];

  return v2;
}

- (SGMailIntelligenceWarning)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v5 = objc_opt_class();
  v6 = sgMailIntelligenceLogHandle();
  v7 = [v4 robustDecodeObjectOfClass:v5 forKey:@"snippet" withCoder:v3 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v6];

  v8 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v9 = objc_opt_class();
  v10 = sgMailIntelligenceLogHandle();
  v11 = [v8 robustDecodeObjectOfClass:v9 forKey:@"core" withCoder:v3 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v10];

  v12 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v13 = objc_opt_class();
  id v14 = sgMailIntelligenceLogHandle();
  id v15 = [v12 robustDecodeObjectOfClass:v13 forKey:@"signature" withCoder:v3 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v14];

  id v16 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v17 = objc_opt_class();
  v18 = sgMailIntelligenceLogHandle();
  uint64_t v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"detectedLanguage" withCoder:v3 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v18];

  uint64_t v20 = [v3 decodeBoolForKey:@"isIncomingMessage"];
  uint64_t v21 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v22 = objc_opt_class();
  v23 = sgMailIntelligenceLogHandle();
  v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"score" withCoder:v3 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v23];

  v25 = 0;
  if (v7 && v11 && v15 && v24 && v19)
  {
    objc_super v26 = [v3 error];

    if (v26) {
      v25 = 0;
    }
    else {
      v25 = [[SGMailIntelligenceWarning alloc] initWithSnippet:v7 core:v11 signature:v15 detectedLanguage:v19 isIncomingMessage:v20 score:v24];
    }
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  snippet = self->_snippet;
  id v5 = a3;
  [v5 encodeObject:snippet forKey:@"snippet"];
  [v5 encodeObject:self->_core forKey:@"core"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_detectedLanguage forKey:@"detectedLanguage"];
  [v5 encodeBool:self->_isIncomingMessage forKey:@"isIncomingMessage"];
  [v5 encodeObject:self->_score forKey:@"score"];
}

- (SGMailIntelligenceWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SGMailIntelligenceWarning;
  v18 = [(SGMailIntelligenceWarning *)&v23 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_snippet, a3);
    objc_storeStrong((id *)&v19->_core, a4);
    objc_storeStrong((id *)&v19->_signature, a5);
    objc_storeStrong((id *)&v19->_detectedLanguage, a6);
    v19->_isIncomingMessage = a7;
    objc_storeStrong((id *)&v19->_score, a8);
  }

  return v19;
}

+ (id)snippetFromString:(id)a3 coreRange:(_NSRange)a4 withMaxWindowSizeAroundCore:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  if (location <= a5) {
    goto LABEL_10;
  }
  if (location - a5 >= location)
  {
LABEL_7:
    NSUInteger v11 = location;
  }
  else
  {
    uint64_t v10 = -(uint64_t)a5;
    while (1)
    {
      NSUInteger v11 = location + v10;
      if (objc_msgSend(v9, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", location + v10))) {
        break;
      }
      if (__CFADD__(v10++, 1)) {
        goto LABEL_7;
      }
    }
  }
  uint64_t v13 = [v8 rangeOfComposedCharacterSequenceAtIndex:v11];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = @"…";
  }
  else
  {
LABEL_10:
    uint64_t v14 = 0;
    id v15 = &stru_1EF915628;
  }
  unint64_t v16 = location + length;
  unint64_t v17 = v16 + a5;
  if (v17 >= [v8 length] - 1)
  {
    uint64_t v18 = [v8 length];
  }
  else
  {
    while (v17 > v16)
    {
      if (objc_msgSend(v9, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v17)))
      {
        unint64_t v16 = v17;
        break;
      }
      --v17;
    }
    uint64_t v19 = [v8 rangeOfComposedCharacterSequenceAtIndex:v16];
    if (v20 >= 2) {
      uint64_t v18 = v19 + v20;
    }
    else {
      uint64_t v18 = v16;
    }
  }
  uint64_t v21 = [v8 length];
  id v22 = objc_msgSend(v8, "substringWithRange:", v14, v18 - v14);
  objc_super v23 = [v22 stringByTrimmingCharactersInSet:v9];

  uint64_t v36 = 0;
  v24 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\s+" options:1 error:&v36];
  v25 = objc_msgSend(v24, "stringByReplacingMatchesInString:options:range:withTemplate:", v23, 0, 0, objc_msgSend(v23, "length"), @" ");
  objc_super v26 = &stru_1EF915628;
  if ([v8 length])
  {
    v27 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    uint64_t v35 = v21;
    v28 = v15;
    int v29 = objc_msgSend(v27, "characterIsMember:", objc_msgSend(v25, "characterAtIndex:", 0));

    if (v29) {
      v28 = &stru_1EF915628;
    }
    v30 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    int v31 = objc_msgSend(v30, "characterIsMember:", objc_msgSend(v25, "characterAtIndex:", objc_msgSend(v25, "length") - 1));

    if (v18 == v35) {
      int v32 = 1;
    }
    else {
      int v32 = v31;
    }
    if (v32) {
      v33 = &stru_1EF915628;
    }
    else {
      v33 = @"…";
    }
    objc_super v26 = (__CFString *)[[NSString alloc] initWithFormat:@"%@%@%@", v28, v25, v33];
  }

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end