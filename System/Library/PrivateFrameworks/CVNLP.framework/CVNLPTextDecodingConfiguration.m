@interface CVNLPTextDecodingConfiguration
+ (id)defaultCharacterCommitActionBehavior;
+ (id)defaultCommitActionBehaviorForLocale:(id)a3;
+ (id)defaultWhitespaceCommitActionBehavior;
- (CVNLPTextDecodingConfiguration)initWithCommitActionBehavior:(id)a3;
- (id)commitActionBlock;
- (void)setCommitActionBlock:(id)a3;
@end

@implementation CVNLPTextDecodingConfiguration

- (CVNLPTextDecodingConfiguration)initWithCommitActionBehavior:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CVNLPTextDecodingConfiguration;
  result = [(CVNLPTextDecodingConfiguration *)&v5 init];
  if (result) {
    result->_commitActionBlock = a3;
  }
  return result;
}

+ (id)defaultCommitActionBehaviorForLocale:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_languageCode(v3, v4, v5, v6);
  char isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"zh", v9);

  if (isEqualToString)
  {
    v11 = &unk_1F0D55FE0;
  }
  else
  {
    v12 = objc_opt_class();
    v11 = objc_msgSend_defaultWhitespaceCommitActionBehavior(v12, v13, v14, v15);
  }
  v16 = (void *)MEMORY[0x1BA9931A0](v11);

  return v16;
}

+ (id)defaultWhitespaceCommitActionBehavior
{
  return &unk_1F0D56100;
}

+ (id)defaultCharacterCommitActionBehavior
{
  return &unk_1F0D56140;
}

- (id)commitActionBlock
{
  return self->_commitActionBlock;
}

- (void)setCommitActionBlock:(id)a3
{
  self->_commitActionBlock = a3;
}

@end