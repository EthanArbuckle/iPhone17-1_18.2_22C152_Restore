@interface EARVoiceCommandInterpretation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (EARVoiceCommandInterpretation)initWithCoder:(id)a3;
- (EARVoiceCommandInterpretation)initWithCommandIdentifier:(id)a3 suiteIdentifiers:(id)a4 verbIndexes:(id)a5 arguments:(id)a6;
- (NSArray)arguments;
- (NSIndexSet)verbIndexes;
- (NSSet)suiteIdentifiers;
- (NSString)commandIdentifier;
- (_NSRange)range;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARVoiceCommandInterpretation

- (_NSRange)range
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(EARVoiceCommandInterpretation *)self verbIndexes];
  v4 = (void *)[v3 mutableCopy];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(EARVoiceCommandInterpretation *)self arguments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 indexes];
        [v4 addIndexes:v11];

        v12 = [v10 adpositionIndexes];
        [v4 addIndexes:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v13 = [v4 firstIndex];
    uint64_t v14 = [v4 lastIndex] - v13 + 1;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v15 = v13;
  NSUInteger v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (EARVoiceCommandInterpretation)initWithCommandIdentifier:(id)a3 suiteIdentifiers:(id)a4 verbIndexes:(id)a5 arguments:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EARVoiceCommandInterpretation;
  uint64_t v14 = [(EARVoiceCommandInterpretation *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    commandIdentifier = v14->_commandIdentifier;
    v14->_commandIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    suiteIdentifiers = v14->_suiteIdentifiers;
    v14->_suiteIdentifiers = (NSSet *)v17;

    uint64_t v19 = [v12 copy];
    verbIndexes = v14->_verbIndexes;
    v14->_verbIndexes = (NSIndexSet *)v19;

    uint64_t v21 = [v13 copy];
    arguments = v14->_arguments;
    v14->_arguments = (NSArray *)v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EARVoiceCommandInterpretation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    commandIdentifier = self->_commandIdentifier;
    uint64_t v8 = [(EARVoiceCommandInterpretation *)v6 commandIdentifier];
    if ([(NSString *)commandIdentifier isEqualToString:v8])
    {
      suiteIdentifiers = self->_suiteIdentifiers;
      id v10 = [(EARVoiceCommandInterpretation *)v6 suiteIdentifiers];
      if ([(NSSet *)suiteIdentifiers isEqualToSet:v10])
      {
        verbIndexes = self->_verbIndexes;
        id v12 = [(EARVoiceCommandInterpretation *)v6 verbIndexes];
        if ([(NSIndexSet *)verbIndexes isEqualToIndexSet:v12])
        {
          arguments = self->_arguments;
          uint64_t v14 = [(EARVoiceCommandInterpretation *)v6 arguments];
          char v15 = [(NSArray *)arguments isEqualToArray:v14];
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_commandIdentifier hash];
  uint64_t v4 = [(NSSet *)self->_suiteIdentifiers hash] + 1531 * v3;
  uint64_t v5 = [(NSIndexSet *)self->_verbIndexes hash] + 1531 * v4;
  return [(NSArray *)self->_arguments hash] + 1531 * v5 + 0x4FF350C4A71;
}

- (void)encodeWithCoder:(id)a3
{
  commandIdentifier = self->_commandIdentifier;
  id v5 = a3;
  [v5 encodeObject:commandIdentifier forKey:@"commandIdentifier"];
  [v5 encodeObject:self->_suiteIdentifiers forKey:@"suiteIdentifiers"];
  [v5 encodeObject:self->_verbIndexes forKey:@"verbIndexes"];
  [v5 encodeObject:self->_arguments forKey:@"arguments"];
}

- (EARVoiceCommandInterpretation)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EARVoiceCommandInterpretation;
  id v5 = [(EARVoiceCommandInterpretation *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"commandIdentifier"];
    commandIdentifier = v5->_commandIdentifier;
    v5->_commandIdentifier = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"suiteIdentifiers"];
    suiteIdentifiers = v5->_suiteIdentifiers;
    v5->_suiteIdentifiers = (NSSet *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verbIndexes"];
    verbIndexes = v5->_verbIndexes;
    v5->_verbIndexes = (NSIndexSet *)v13;

    uint64_t v15 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"arguments"];
    arguments = v5->_arguments;
    v5->_arguments = (NSArray *)v15;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)commandIdentifier
{
  return self->_commandIdentifier;
}

- (NSSet)suiteIdentifiers
{
  return self->_suiteIdentifiers;
}

- (NSIndexSet)verbIndexes
{
  return self->_verbIndexes;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_verbIndexes, 0);
  objc_storeStrong((id *)&self->_suiteIdentifiers, 0);
  objc_storeStrong((id *)&self->_commandIdentifier, 0);
}

@end