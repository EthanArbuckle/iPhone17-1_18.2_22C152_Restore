@interface AFSpeechSynthesisRecord
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSpeechSynthesisRecord)init;
- (AFSpeechSynthesisRecord)initWithBuilder:(id)a3;
- (AFSpeechSynthesisRecord)initWithCoder:(id)a3;
- (AFSpeechSynthesisRecord)initWithUtterance:(id)a3 beginTimestamp:(unint64_t)a4 endTimestamp:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)utterance;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)beginTimestamp;
- (unint64_t)endTimestamp;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechSynthesisRecord

- (void).cxx_destruct
{
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (unint64_t)beginTimestamp
{
  return self->_beginTimestamp;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)encodeWithCoder:(id)a3
{
  utterance = self->_utterance;
  id v5 = a3;
  [v5 encodeObject:utterance forKey:@"AFSpeechSynthesisRecord::utterance"];
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_beginTimestamp];
  [v5 encodeObject:v6 forKey:@"AFSpeechSynthesisRecord::beginTimestamp"];

  id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_endTimestamp];
  [v5 encodeObject:v7 forKey:@"AFSpeechSynthesisRecord::endTimestamp"];
}

- (AFSpeechSynthesisRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechSynthesisRecord::utterance"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechSynthesisRecord::beginTimestamp"];
  uint64_t v7 = [v6 unsignedLongLongValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechSynthesisRecord::endTimestamp"];

  uint64_t v9 = [v8 unsignedLongLongValue];
  v10 = [(AFSpeechSynthesisRecord *)self initWithUtterance:v5 beginTimestamp:v7 endTimestamp:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSpeechSynthesisRecord *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t beginTimestamp = self->_beginTimestamp;
      if (beginTimestamp == [(AFSpeechSynthesisRecord *)v5 beginTimestamp]
        && (unint64_t endTimestamp = self->_endTimestamp,
            endTimestamp == [(AFSpeechSynthesisRecord *)v5 endTimestamp]))
      {
        v8 = [(AFSpeechSynthesisRecord *)v5 utterance];
        utterance = self->_utterance;
        BOOL v10 = utterance == v8 || [(NSString *)utterance isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_utterance hash];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_beginTimestamp];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:self->_endTimestamp];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFSpeechSynthesisRecord;
  uint64_t v5 = [(AFSpeechSynthesisRecord *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {utterance = %@, unint64_t beginTimestamp = %llu, endTimestamp = %llu}", v5, self->_utterance, self->_beginTimestamp, self->_endTimestamp];

  return v6;
}

- (id)description
{
  return [(AFSpeechSynthesisRecord *)self _descriptionWithIndent:0];
}

- (AFSpeechSynthesisRecord)initWithUtterance:(id)a3 beginTimestamp:(unint64_t)a4 endTimestamp:(unint64_t)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__AFSpeechSynthesisRecord_initWithUtterance_beginTimestamp_endTimestamp___block_invoke;
  v12[3] = &unk_1E592B750;
  id v13 = v8;
  unint64_t v14 = a4;
  unint64_t v15 = a5;
  id v9 = v8;
  BOOL v10 = [(AFSpeechSynthesisRecord *)self initWithBuilder:v12];

  return v10;
}

void __73__AFSpeechSynthesisRecord_initWithUtterance_beginTimestamp_endTimestamp___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setUtterance:v3];
  [v4 setBeginTimestamp:a1[5]];
  [v4 setEndTimestamp:a1[6]];
}

- (AFSpeechSynthesisRecord)init
{
  return [(AFSpeechSynthesisRecord *)self initWithBuilder:0];
}

- (AFSpeechSynthesisRecord)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSpeechSynthesisRecordMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSpeechSynthesisRecord;
  uint64_t v5 = [(AFSpeechSynthesisRecord *)&v12 init];
  v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_AFSpeechSynthesisRecordMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSpeechSynthesisRecordMutation *)v7 isDirty])
    {
      id v8 = [(_AFSpeechSynthesisRecordMutation *)v7 getUtterance];
      uint64_t v9 = [v8 copy];
      utterance = v6->_utterance;
      v6->_utterance = (NSString *)v9;

      v6->_unint64_t beginTimestamp = [(_AFSpeechSynthesisRecordMutation *)v7 getBeginTimestamp];
      v6->_unint64_t endTimestamp = [(_AFSpeechSynthesisRecordMutation *)v7 getEndTimestamp];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFSpeechSynthesisRecordMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFSpeechSynthesisRecordMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSpeechSynthesisRecordMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(AFSpeechSynthesisRecord);
      unint64_t v7 = [(_AFSpeechSynthesisRecordMutation *)v5 getUtterance];
      uint64_t v8 = [v7 copy];
      utterance = v6->_utterance;
      v6->_utterance = (NSString *)v8;

      v6->_unint64_t beginTimestamp = [(_AFSpeechSynthesisRecordMutation *)v5 getBeginTimestamp];
      v6->_unint64_t endTimestamp = [(_AFSpeechSynthesisRecordMutation *)v5 getEndTimestamp];
    }
    else
    {
      v6 = (AFSpeechSynthesisRecord *)[(AFSpeechSynthesisRecord *)self copy];
    }
  }
  else
  {
    v6 = (AFSpeechSynthesisRecord *)[(AFSpeechSynthesisRecord *)self copy];
  }

  return v6;
}

@end