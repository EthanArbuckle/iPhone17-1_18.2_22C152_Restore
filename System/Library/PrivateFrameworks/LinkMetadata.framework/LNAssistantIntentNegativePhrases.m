@interface LNAssistantIntentNegativePhrases
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAssistantIntentNegativePhrases)initWithCoder:(id)a3;
- (LNAssistantIntentNegativePhrases)initWithIntentIdentifier:(id)a3 phrases:(id)a4;
- (NSArray)phrases;
- (NSString)intentIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAssistantIntentNegativePhrases

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAssistantIntentNegativePhrases *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(LNAssistantIntentNegativePhrases *)self intentIdentifier];
    v8 = [(LNAssistantIntentNegativePhrases *)v6 intentIdentifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNAssistantIntentNegativePhrases *)self phrases];
    v16 = [(LNAssistantIntentNegativePhrases *)v6 phrases];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNAssistantIntentNegativePhrases *)self intentIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAssistantIntentNegativePhrases *)self phrases];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNAssistantIntentNegativePhrases *)self intentIdentifier];
  v7 = [(LNAssistantIntentNegativePhrases *)self phrases];
  v8 = [v3 stringWithFormat:@"<%@: %p, intentIdentifier: %@, phrase: %@>", v5, self, v6, v7];

  return v8;
}

- (LNAssistantIntentNegativePhrases)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentIdentifier"];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"phrases"];

    if (v9)
    {
      self = [(LNAssistantIntentNegativePhrases *)self initWithIntentIdentifier:v5 phrases:v9];
      id v10 = self;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAssistantIntentNegativePhrases *)self intentIdentifier];
  [v4 encodeObject:v5 forKey:@"intentIdentifier"];

  id v6 = [(LNAssistantIntentNegativePhrases *)self phrases];
  [v4 encodeObject:v6 forKey:@"phrases"];
}

- (LNAssistantIntentNegativePhrases)initWithIntentIdentifier:(id)a3 phrases:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNAssistantIntentNegativePhrases.m", 21, @"Invalid parameter not satisfying: %@", @"intentIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNAssistantIntentNegativePhrases.m", 22, @"Invalid parameter not satisfying: %@", @"phrases" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNAssistantIntentNegativePhrases;
  id v10 = [(LNAssistantIntentNegativePhrases *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    intentIdentifier = v10->_intentIdentifier;
    v10->_intentIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    phrases = v10->_phrases;
    v10->_phrases = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end