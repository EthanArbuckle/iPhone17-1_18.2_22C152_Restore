@interface LNExamplePhraseDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNExamplePhraseDescription)initWithCoder:(id)a3;
- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrase:(id)a5 expected:(id)a6 phraseTemplate:(id)a7;
- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 expected:(id)a6;
- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 expected:(id)a6 parameter:(id)a7;
- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 phrase:(id)a6 expected:(id)a7 parameter:(id)a8 phraseTemplate:(id)a9;
- (LNExamplePhraseDescription)initWithNegativePhrases:(id)a3 parentIdentifier:(id)a4;
- (LNExamplePhraseDescription)initWithOpenStringParameter:(id)a3 parentIdentifier:(id)a4 phrases:(id)a5;
- (NSArray)phrases;
- (NSString)expected;
- (NSString)parameter;
- (NSString)parentIdentifier;
- (NSString)phrase;
- (NSString)phraseTemplate;
- (id)description;
- (int64_t)kind;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNExamplePhraseDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_expected, 0);
  objc_storeStrong((id *)&self->_phraseTemplate, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
}

- (NSString)parameter
{
  return self->_parameter;
}

- (NSString)expected
{
  return self->_expected;
}

- (NSString)phraseTemplate
{
  return self->_phraseTemplate;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)description
{
  v2 = self;
  switch([(LNExamplePhraseDescription *)self kind])
  {
    case 0:
      v7 = NSString;
      v4 = [v2 parentIdentifier];
      v5 = [v2 phrases];
      v6 = [v2 phrase];
      v8 = [v2 expected];
      v9 = [v2 phraseTemplate];
      v2 = [v7 stringWithFormat:@"Intent parentIdentifier:%@ phrases:%@ phrase:%@ expected invocation:%@ phraseTemplate:%@", v4, v5, v6, v8, v9];

      goto LABEL_7;
    case 1:
      v10 = NSString;
      v4 = [v2 parameter];
      v5 = [v2 phrases];
      v2 = [v10 stringWithFormat:@"Parameter:%@ Phrases:%@", v4, v5];
      goto LABEL_8;
    case 2:
      v11 = NSString;
      v4 = [v2 phrases];
      v5 = [v2 phrase];
      v6 = [v2 expected];
      [v11 stringWithFormat:@"Entity phrases:%@ phrase:%@ expected entity:%@", v4, v5, v6];
      goto LABEL_6;
    case 3:
    case 4:
      v3 = NSString;
      v4 = [v2 phrases];
      v5 = [v2 phrase];
      v6 = [v2 expected];
      [v3 stringWithFormat:@"Query phrases:%@ phrase:%@ expected query:%@", v4, v5, v6];
      v2 = LABEL_6:;
LABEL_7:

LABEL_8:
      break;
    default:
      break;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNExamplePhraseDescription *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v7 = [(LNExamplePhraseDescription *)self kind];
        if (v7 == [(LNExamplePhraseDescription *)v6 kind])
        {
          v8 = [(LNExamplePhraseDescription *)self phrases];
          v9 = [(LNExamplePhraseDescription *)v6 phrases];

          if (v8 == v9) {
            goto LABEL_9;
          }
          uint64_t v10 = [(LNExamplePhraseDescription *)self phrases];
          if (v10)
          {
            v11 = (void *)v10;
            v12 = [(LNExamplePhraseDescription *)v6 phrases];

            if (v12)
            {
              v13 = (void *)MEMORY[0x1E4F1CAD0];
              v14 = [(LNExamplePhraseDescription *)self phrases];
              v15 = [v13 setWithArray:v14];
              v16 = (void *)MEMORY[0x1E4F1CAD0];
              v17 = [(LNExamplePhraseDescription *)v6 phrases];
              v18 = [v16 setWithArray:v17];
              int v19 = [v15 isEqualToSet:v18];

              if (!v19)
              {
LABEL_19:

                goto LABEL_20;
              }
LABEL_9:
              v20 = [(LNExamplePhraseDescription *)self expected];
              v21 = [(LNExamplePhraseDescription *)v6 expected];
              v22 = v20;
              v23 = v21;
              v24 = v23;
              if (v22 == v23)
              {
              }
              else
              {
                LOBYTE(v19) = 0;
                v25 = v23;
                v26 = v22;
                if (!v22 || !v23) {
                  goto LABEL_43;
                }
                BOOL v27 = [(LNExamplePhraseDescription *)v22 isEqual:v23];

                if (!v27)
                {
                  LOBYTE(v19) = 0;
LABEL_44:

                  goto LABEL_17;
                }
              }
              v29 = [(LNExamplePhraseDescription *)self parameter];
              v30 = [(LNExamplePhraseDescription *)v6 parameter];
              v26 = v29;
              v31 = v30;
              v25 = v31;
              if (v26 == v31)
              {
              }
              else
              {
                LOBYTE(v19) = 0;
                v32 = v31;
                v33 = v26;
                if (!v26 || !v31) {
                  goto LABEL_42;
                }
                int v19 = [(LNExamplePhraseDescription *)v26 isEqual:v31];

                if (!v19) {
                  goto LABEL_43;
                }
              }
              v34 = [(LNExamplePhraseDescription *)self phrase];
              v35 = [(LNExamplePhraseDescription *)v6 phrase];
              v33 = v34;
              v36 = v35;
              v42 = v33;
              v43 = v36;
              if (v33 != v36)
              {
                LOBYTE(v19) = 0;
                if (v33)
                {
                  v37 = v36;
                  if (v36)
                  {
                    int v19 = [(LNExamplePhraseDescription *)v33 isEqual:v36];

                    if (!v19)
                    {
                      v32 = v43;
LABEL_42:

LABEL_43:
                      goto LABEL_44;
                    }
                    goto LABEL_34;
                  }
                }
                else
                {
                  v37 = v36;
                }
LABEL_41:

                v33 = v42;
                v32 = v43;
                goto LABEL_42;
              }

LABEL_34:
              v38 = [(LNExamplePhraseDescription *)self phraseTemplate];
              v39 = [(LNExamplePhraseDescription *)v6 phraseTemplate];
              v40 = v38;
              v41 = v39;
              v37 = v41;
              if (v40 == v41)
              {
                LOBYTE(v19) = 1;
              }
              else
              {
                LOBYTE(v19) = 0;
                if (v40 && v41) {
                  LOBYTE(v19) = [(LNExamplePhraseDescription *)v40 isEqual:v41];
                }
              }

              v33 = v40;
              goto LABEL_41;
            }
          }
        }
        LOBYTE(v19) = 0;
        goto LABEL_19;
      }
      LOBYTE(v19) = 0;
      v22 = v6;
      v6 = 0;
    }
    else
    {
      v22 = 0;
      LOBYTE(v19) = 0;
    }
LABEL_17:

    goto LABEL_19;
  }
  LOBYTE(v19) = 1;
LABEL_20:

  return v19;
}

- (unint64_t)hash
{
  int64_t v3 = [(LNExamplePhraseDescription *)self kind];
  v4 = [(LNExamplePhraseDescription *)self phrases];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(LNExamplePhraseDescription *)self expected];
  uint64_t v7 = [v6 hash];
  v8 = [(LNExamplePhraseDescription *)self parameter];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  uint64_t v10 = [(LNExamplePhraseDescription *)self phrase];
  uint64_t v11 = [v10 hash];
  v12 = [(LNExamplePhraseDescription *)self phraseTemplate];
  unint64_t v13 = v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (LNExamplePhraseDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (LNExamplePhraseDescription *)[v4 decodeIntegerForKey:@"kind"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentIdentifier"];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"phrases"];

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phrase"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expected"];
  unint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameter"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phraseTemplate"];

  if (v5)
  {
    if (v5 == (LNExamplePhraseDescription *)1)
    {
      if (!v13)
      {
        uint64_t v5 = 0;
        goto LABEL_8;
      }
      v15 = [(LNExamplePhraseDescription *)self initWithKind:1 parentIdentifier:v6 phrases:v10 expected:v12];
    }
    else
    {
      v15 = [(LNExamplePhraseDescription *)self initWithKind:v5 parentIdentifier:v6 phrases:v10 phrase:v11 expected:v12 parameter:v13 phraseTemplate:v14];
    }
    self = v15;
    uint64_t v5 = self;
  }
LABEL_8:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNExamplePhraseDescription kind](self, "kind"), @"kind");
  uint64_t v5 = [(LNExamplePhraseDescription *)self parentIdentifier];
  [v4 encodeObject:v5 forKey:@"parentIdentifier"];

  v6 = [(LNExamplePhraseDescription *)self phrases];
  [v4 encodeObject:v6 forKey:@"phrases"];

  uint64_t v7 = [(LNExamplePhraseDescription *)self phrase];
  [v4 encodeObject:v7 forKey:@"phrase"];

  uint64_t v8 = [(LNExamplePhraseDescription *)self expected];
  [v4 encodeObject:v8 forKey:@"expected"];

  uint64_t v9 = [(LNExamplePhraseDescription *)self parameter];
  [v4 encodeObject:v9 forKey:@"parameter"];

  id v10 = [(LNExamplePhraseDescription *)self phraseTemplate];
  [v4 encodeObject:v10 forKey:@"phraseTemplate"];
}

- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 expected:(id)a6 parameter:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 count])
  {
    v14 = [v12 objectAtIndexedSubscript:0];
  }
  else
  {
    v14 = &stru_1EEDBEA90;
  }
  v15 = [(LNExamplePhraseDescription *)self initWithKind:a3 parentIdentifier:v11 phrase:v14 expected:v13 phraseTemplate:0];

  return v15;
}

- (LNExamplePhraseDescription)initWithNegativePhrases:(id)a3 parentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [v6 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v8 = &stru_1EEDBEA90;
  }
  uint64_t v9 = [(LNExamplePhraseDescription *)self initWithKind:4 parentIdentifier:v7 phrase:v8 expected:0 phraseTemplate:0];

  return v9;
}

- (LNExamplePhraseDescription)initWithOpenStringParameter:(id)a3 parentIdentifier:(id)a4 phrases:(id)a5
{
  return [(LNExamplePhraseDescription *)self initWithKind:1 parentIdentifier:a4 phrase:&stru_1EEDBEA90 expected:0 phraseTemplate:0];
}

- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 expected:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v11 count])
  {
    id v13 = [v11 objectAtIndexedSubscript:0];
  }
  else
  {
    id v13 = &stru_1EEDBEA90;
  }
  v14 = [(LNExamplePhraseDescription *)self initWithKind:a3 parentIdentifier:v10 phrase:v13 expected:v12 phraseTemplate:0];

  return v14;
}

- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 phrase:(id)a6 expected:(id)a7 parameter:(id)a8 phraseTemplate:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v37.receiver = self;
  v37.super_class = (Class)LNExamplePhraseDescription;
  v21 = [(LNExamplePhraseDescription *)&v37 init];
  v22 = v21;
  if (v21)
  {
    v21->_kind = a3;
    uint64_t v23 = [v15 copy];
    parentIdentifier = v22->_parentIdentifier;
    v22->_parentIdentifier = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    phrases = v22->_phrases;
    v22->_phrases = (NSArray *)v25;

    uint64_t v27 = [v17 copy];
    phrase = v22->_phrase;
    v22->_phrase = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    expected = v22->_expected;
    v22->_expected = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    parameter = v22->_parameter;
    v22->_parameter = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    phraseTemplate = v22->_phraseTemplate;
    v22->_phraseTemplate = (NSString *)v33;

    v35 = v22;
  }

  return v22;
}

- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrase:(id)a5 expected:(id)a6 phraseTemplate:(id)a7
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"LNExamplePhraseDescription.m", 24, @"Invalid parameter not satisfying: %@", @"parentIdentifier" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"LNExamplePhraseDescription.m", 25, @"Invalid parameter not satisfying: %@", @"phrase" object file lineNumber description];

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)LNExamplePhraseDescription;
  id v17 = [(LNExamplePhraseDescription *)&v34 init];
  id v18 = v17;
  if (v17)
  {
    v17->_kind = a3;
    uint64_t v19 = [v13 copy];
    parentIdentifier = v18->_parentIdentifier;
    v18->_parentIdentifier = (NSString *)v19;

    v21 = (void *)[v14 copy];
    v35[0] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    phrases = v18->_phrases;
    v18->_phrases = (NSArray *)v22;

    uint64_t v24 = [v14 copy];
    phrase = v18->_phrase;
    v18->_phrase = (NSString *)v24;

    uint64_t v26 = [v15 copy];
    expected = v18->_expected;
    v18->_expected = (NSString *)v26;

    uint64_t v28 = [v16 copy];
    phraseTemplate = v18->_phraseTemplate;
    v18->_phraseTemplate = (NSString *)v28;

    v30 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end