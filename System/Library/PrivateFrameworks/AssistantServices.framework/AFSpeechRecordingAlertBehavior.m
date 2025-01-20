@interface AFSpeechRecordingAlertBehavior
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSpeechRecordingAlertBehavior)init;
- (AFSpeechRecordingAlertBehavior)initWithBuilder:(id)a3;
- (AFSpeechRecordingAlertBehavior)initWithCoder:(id)a3;
- (AFSpeechRecordingAlertBehavior)initWithStyle:(int64_t)a3 beepSoundID:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)beepSoundID;
- (int64_t)style;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechRecordingAlertBehavior

- (int64_t)beepSoundID
{
  return self->_beepSoundID;
}

- (int64_t)style
{
  return self->_style;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t style = self->_style;
  id v6 = a3;
  v7 = [v4 numberWithInteger:style];
  [v6 encodeObject:v7 forKey:@"AFSpeechRecordingAlertBehavior::style"];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_beepSoundID];
  [v6 encodeObject:v8 forKey:@"AFSpeechRecordingAlertBehavior::beepSoundID"];
}

- (AFSpeechRecordingAlertBehavior)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechRecordingAlertBehavior::style"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechRecordingAlertBehavior::beepSoundID"];

  uint64_t v8 = [v7 integerValue];
  return [(AFSpeechRecordingAlertBehavior *)self initWithStyle:v6 beepSoundID:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSpeechRecordingAlertBehavior *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t style = self->_style;
      if (style == [(AFSpeechRecordingAlertBehavior *)v5 style])
      {
        int64_t beepSoundID = self->_beepSoundID;
        BOOL v8 = beepSoundID == [(AFSpeechRecordingAlertBehavior *)v5 beepSoundID];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_style];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_beepSoundID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechRecordingAlertBehavior;
  v5 = [(AFSpeechRecordingAlertBehavior *)&v14 description];
  unint64_t style = self->_style;
  if (style > 3) {
    v7 = @"(unknown)";
  }
  else {
    v7 = off_1E5926DD0[style];
  }
  BOOL v8 = v7;
  unint64_t beepSoundID = self->_beepSoundID;
  if (beepSoundID > 0xD) {
    v10 = @"(unknown)";
  }
  else {
    v10 = off_1E59269A0[beepSoundID];
  }
  v11 = v10;
  v12 = (void *)[v4 initWithFormat:@"%@ {unint64_t style = %@, beepSoundID = %@}", v5, v8, v11];

  return v12;
}

- (id)description
{
  return [(AFSpeechRecordingAlertBehavior *)self _descriptionWithIndent:0];
}

- (AFSpeechRecordingAlertBehavior)initWithStyle:(int64_t)a3 beepSoundID:(int64_t)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__AFSpeechRecordingAlertBehavior_initWithStyle_beepSoundID___block_invoke;
  v5[3] = &__block_descriptor_48_e50_v16__0___AFSpeechRecordingAlertBehaviorMutating__8l;
  v5[4] = a3;
  v5[5] = a4;
  return [(AFSpeechRecordingAlertBehavior *)self initWithBuilder:v5];
}

void __60__AFSpeechRecordingAlertBehavior_initWithStyle_beepSoundID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setStyle:v3];
  [v4 setBeepSoundID:*(void *)(a1 + 40)];
}

- (AFSpeechRecordingAlertBehavior)init
{
  return [(AFSpeechRecordingAlertBehavior *)self initWithBuilder:0];
}

- (AFSpeechRecordingAlertBehavior)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSpeechRecordingAlertBehaviorMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSpeechRecordingAlertBehavior;
  v5 = [(AFSpeechRecordingAlertBehavior *)&v9 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFSpeechRecordingAlertBehaviorMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSpeechRecordingAlertBehaviorMutation *)v7 isDirty])
    {
      v6->_unint64_t style = [(_AFSpeechRecordingAlertBehaviorMutation *)v7 getStyle];
      v6->_unint64_t beepSoundID = [(_AFSpeechRecordingAlertBehaviorMutation *)v7 getBeepSoundID];
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
  id v4 = (void (**)(id, _AFSpeechRecordingAlertBehaviorMutation *))a3;
  if (v4)
  {
    v5 = [[_AFSpeechRecordingAlertBehaviorMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSpeechRecordingAlertBehaviorMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(AFSpeechRecordingAlertBehavior);
      v6->_unint64_t style = [(_AFSpeechRecordingAlertBehaviorMutation *)v5 getStyle];
      v6->_unint64_t beepSoundID = [(_AFSpeechRecordingAlertBehaviorMutation *)v5 getBeepSoundID];
    }
    else
    {
      unint64_t v6 = (AFSpeechRecordingAlertBehavior *)[(AFSpeechRecordingAlertBehavior *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (AFSpeechRecordingAlertBehavior *)[(AFSpeechRecordingAlertBehavior *)self copy];
  }

  return v6;
}

@end