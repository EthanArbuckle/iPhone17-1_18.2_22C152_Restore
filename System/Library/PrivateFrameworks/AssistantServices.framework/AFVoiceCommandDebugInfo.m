@interface AFVoiceCommandDebugInfo
+ (BOOL)supportsSecureCoding;
- (AFVoiceCommandDebugInfo)initWithCoder:(id)a3;
- (AFVoiceCommandDebugInfo)initWithHasVoiceCommandInExhaustiveParses:(BOOL)a3 hasVoiceCommandParses:(BOOL)a4 hasVoiceCommandEditIntent:(BOOL)a5 hasVoiceCommandAfterReranking:(BOOL)a6 hasNoVoiceCommandAfterRespeakCheck:(BOOL)a7;
- (BOOL)hasNoVoiceCommandAfterRespeakCheck;
- (BOOL)hasVoiceCommandAfterReranking;
- (BOOL)hasVoiceCommandEditIntent;
- (BOOL)hasVoiceCommandInExhaustiveParses;
- (BOOL)hasVoiceCommandParses;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3;
- (void)setHasVoiceCommandAfterReranking:(BOOL)a3;
- (void)setHasVoiceCommandEditIntent:(BOOL)a3;
- (void)setHasVoiceCommandInExhaustiveParses:(BOOL)a3;
- (void)setHasVoiceCommandParses:(BOOL)a3;
@end

@implementation AFVoiceCommandDebugInfo

- (void)setHasNoVoiceCommandAfterRespeakCheck:(BOOL)a3
{
  self->_hasNoVoiceCommandAfterRespeakCheck = a3;
}

- (BOOL)hasNoVoiceCommandAfterRespeakCheck
{
  return self->_hasNoVoiceCommandAfterRespeakCheck;
}

- (void)setHasVoiceCommandAfterReranking:(BOOL)a3
{
  self->_hasVoiceCommandAfterReranking = a3;
}

- (BOOL)hasVoiceCommandAfterReranking
{
  return self->_hasVoiceCommandAfterReranking;
}

- (void)setHasVoiceCommandEditIntent:(BOOL)a3
{
  self->_hasVoiceCommandEditIntent = a3;
}

- (BOOL)hasVoiceCommandEditIntent
{
  return self->_hasVoiceCommandEditIntent;
}

- (void)setHasVoiceCommandParses:(BOOL)a3
{
  self->_hasVoiceCommandParses = a3;
}

- (BOOL)hasVoiceCommandParses
{
  return self->_hasVoiceCommandParses;
}

- (void)setHasVoiceCommandInExhaustiveParses:(BOOL)a3
{
  self->_hasVoiceCommandInExhaustiveParses = a3;
}

- (BOOL)hasVoiceCommandInExhaustiveParses
{
  return self->_hasVoiceCommandInExhaustiveParses;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFVoiceCommandDebugInfo *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && v4->_hasVoiceCommandInExhaustiveParses == self->_hasVoiceCommandInExhaustiveParses
      && v4->_hasVoiceCommandParses == self->_hasVoiceCommandParses
      && v4->_hasVoiceCommandEditIntent == self->_hasVoiceCommandEditIntent
      && v4->_hasVoiceCommandAfterReranking == self->_hasVoiceCommandAfterReranking
      && v4->_hasNoVoiceCommandAfterRespeakCheck == self->_hasNoVoiceCommandAfterRespeakCheck;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"hasVoiceCommandInExhaustiveParses";
  v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasVoiceCommandInExhaustiveParses];
  v11[0] = v3;
  v10[1] = @"hasVoiceCommandParses";
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasVoiceCommandParses];
  v11[1] = v4;
  v10[2] = @"hasVoiceCommandEditIntent";
  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasVoiceCommandEditIntent];
  v11[2] = v5;
  v10[3] = @"hasVoiceCommandAfterReranking";
  BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasVoiceCommandAfterReranking];
  v11[3] = v6;
  v10[4] = @"hasNoVoiceCommandAfterRespeakCheck";
  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_hasNoVoiceCommandAfterRespeakCheck];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"[hasVoiceCommandInExhaustiveParses = %u]", self->_hasVoiceCommandInExhaustiveParses);
  objc_msgSend(v3, "appendFormat:", @"[hasVoiceCommandParses = %u]", self->_hasVoiceCommandParses);
  objc_msgSend(v3, "appendFormat:", @"[hasVoiceCommandEditIntent = %u]", self->_hasVoiceCommandEditIntent);
  objc_msgSend(v3, "appendFormat:", @"[hasVoiceCommandAfterReranking = %u]", self->_hasVoiceCommandAfterReranking);
  objc_msgSend(v3, "appendFormat:", @"[hasNoVoiceCommandAfterRespeakCheck = %u]", self->_hasNoVoiceCommandAfterRespeakCheck);
  return v3;
}

- (AFVoiceCommandDebugInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AFVoiceCommandDebugInfo;
  uint64_t v5 = [(AFVoiceCommandDebugInfo *)&v7 init];
  if (v5)
  {
    v5->_hasVoiceCommandInExhaustiveParses = [v4 decodeBoolForKey:@"hasVoiceCommandInExhaustiveParses"];
    v5->_hasVoiceCommandParses = [v4 decodeBoolForKey:@"hasVoiceCommandParses"];
    v5->_hasVoiceCommandEditIntent = [v4 decodeBoolForKey:@"hasVoiceCommandEditIntent"];
    v5->_hasVoiceCommandAfterReranking = [v4 decodeBoolForKey:@"hasVoiceCommandAfterReranking"];
    v5->_hasNoVoiceCommandAfterRespeakCheck = [v4 decodeBoolForKey:@"hasNoVoiceCommandAfterRespeakCheck"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL hasVoiceCommandInExhaustiveParses = self->_hasVoiceCommandInExhaustiveParses;
  id v5 = a3;
  [v5 encodeBool:hasVoiceCommandInExhaustiveParses forKey:@"hasVoiceCommandInExhaustiveParses"];
  [v5 encodeBool:self->_hasVoiceCommandParses forKey:@"hasVoiceCommandParses"];
  [v5 encodeBool:self->_hasVoiceCommandEditIntent forKey:@"hasVoiceCommandEditIntent"];
  [v5 encodeBool:self->_hasVoiceCommandAfterReranking forKey:@"hasVoiceCommandAfterReranking"];
  [v5 encodeBool:self->_hasNoVoiceCommandAfterRespeakCheck forKey:@"hasNoVoiceCommandAfterRespeakCheck"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setHasVoiceCommandInExhaustiveParses:self->_hasVoiceCommandInExhaustiveParses];
  [v4 setHasVoiceCommandParses:self->_hasVoiceCommandParses];
  [v4 setHasVoiceCommandEditIntent:self->_hasVoiceCommandEditIntent];
  [v4 setHasVoiceCommandAfterReranking:self->_hasVoiceCommandAfterReranking];
  [v4 setHasNoVoiceCommandAfterRespeakCheck:self->_hasNoVoiceCommandAfterRespeakCheck];
  return v4;
}

- (AFVoiceCommandDebugInfo)initWithHasVoiceCommandInExhaustiveParses:(BOOL)a3 hasVoiceCommandParses:(BOOL)a4 hasVoiceCommandEditIntent:(BOOL)a5 hasVoiceCommandAfterReranking:(BOOL)a6 hasNoVoiceCommandAfterRespeakCheck:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)AFVoiceCommandDebugInfo;
  result = [(AFVoiceCommandDebugInfo *)&v13 init];
  if (result)
  {
    result->_BOOL hasVoiceCommandInExhaustiveParses = a3;
    result->_hasVoiceCommandParses = a4;
    result->_hasVoiceCommandEditIntent = a5;
    result->_hasVoiceCommandAfterReranking = a6;
    result->_hasNoVoiceCommandAfterRespeakCheck = a7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end