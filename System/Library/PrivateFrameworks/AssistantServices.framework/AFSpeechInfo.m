@interface AFSpeechInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSpeechInfo)init;
- (AFSpeechInfo)initWithBuilder:(id)a3;
- (AFSpeechInfo)initWithCoder:(id)a3;
- (AFSpeechInfo)initWithDictionaryRepresentation:(id)a3;
- (AFSpeechInfo)initWithSpeechRecognizedCommand:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SASSpeechRecognized)speechRecognizedCommand;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechInfo

- (void).cxx_destruct
{
}

- (SASSpeechRecognized)speechRecognizedCommand
{
  return self->_speechRecognizedCommand;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  speechRecognizedCommand = self->_speechRecognizedCommand;
  if (speechRecognizedCommand)
  {
    v5 = [(SASSpeechRecognized *)speechRecognizedCommand dictionary];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKey:@"speechRecognizedCommand"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (AFSpeechInfo)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    v4 = [a3 objectForKey:@"speechRecognizedCommand"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [MEMORY[0x1E4F969A8] aceObjectWithDictionary:v4];
    }
    else
    {
      v5 = 0;
    }

    self = [(AFSpeechInfo *)self initWithSpeechRecognizedCommand:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AFSpeechInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechInfo::speechRecognizedCommand"];

  v6 = [(AFSpeechInfo *)self initWithSpeechRecognizedCommand:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSpeechInfo *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(AFSpeechInfo *)v4 speechRecognizedCommand];
      speechRecognizedCommand = self->_speechRecognizedCommand;
      BOOL v7 = speechRecognizedCommand == v5
        || [(SASSpeechRecognized *)speechRecognizedCommand isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(SASSpeechRecognized *)self->_speechRecognizedCommand hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)AFSpeechInfo;
  v5 = [(AFSpeechInfo *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {speechRecognizedCommand = %@}", v5, self->_speechRecognizedCommand];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(AFSpeechInfo *)self _descriptionWithIndent:0];
}

- (AFSpeechInfo)initWithSpeechRecognizedCommand:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__AFSpeechInfo_initWithSpeechRecognizedCommand___block_invoke;
  v8[3] = &unk_1E5925D48;
  id v9 = v4;
  id v5 = v4;
  v6 = [(AFSpeechInfo *)self initWithBuilder:v8];

  return v6;
}

uint64_t __48__AFSpeechInfo_initWithSpeechRecognizedCommand___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSpeechRecognizedCommand:*(void *)(a1 + 32)];
}

- (AFSpeechInfo)init
{
  return [(AFSpeechInfo *)self initWithBuilder:0];
}

- (AFSpeechInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSpeechInfoMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)AFSpeechInfo;
  id v5 = [(AFSpeechInfo *)&v12 init];
  v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_AFSpeechInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSpeechInfoMutation *)v7 isDirty])
    {
      objc_super v8 = [(_AFSpeechInfoMutation *)v7 getSpeechRecognizedCommand];
      uint64_t v9 = [v8 copy];
      speechRecognizedCommand = v6->_speechRecognizedCommand;
      v6->_speechRecognizedCommand = (SASSpeechRecognized *)v9;
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
  id v4 = (void (**)(id, _AFSpeechInfoMutation *))a3;
  if (v4)
  {
    id v5 = [[_AFSpeechInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSpeechInfoMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(AFSpeechInfo);
      BOOL v7 = [(_AFSpeechInfoMutation *)v5 getSpeechRecognizedCommand];
      uint64_t v8 = [v7 copy];
      speechRecognizedCommand = v6->_speechRecognizedCommand;
      v6->_speechRecognizedCommand = (SASSpeechRecognized *)v8;
    }
    else
    {
      v6 = (AFSpeechInfo *)[(AFSpeechInfo *)self copy];
    }
  }
  else
  {
    v6 = (AFSpeechInfo *)[(AFSpeechInfo *)self copy];
  }

  return v6;
}

@end