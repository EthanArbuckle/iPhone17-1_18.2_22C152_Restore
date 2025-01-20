@interface CNAvatarStickerGeneratorProvider
- (AVTAvatarRecord)avatarRecord;
- (AVTStickerGenerator)generator;
- (CNAvatarStickerGeneratorProvider)initWithAvatarRecord:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setGenerator:(id)a3;
@end

@implementation CNAvatarStickerGeneratorProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarRecord, 0);

  objc_storeStrong((id *)&self->_generator, 0);
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setGenerator:(id)a3
{
}

- (AVTStickerGenerator)generator
{
  generator = self->_generator;
  if (!generator)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v4 = (void *)getAVTAvatarRecordRenderingClass_softClass_30071;
    uint64_t v21 = getAVTAvatarRecordRenderingClass_softClass_30071;
    if (!getAVTAvatarRecordRenderingClass_softClass_30071)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __getAVTAvatarRecordRenderingClass_block_invoke_30072;
      v16 = &unk_1E549AD00;
      v17 = &v18;
      __getAVTAvatarRecordRenderingClass_block_invoke_30072((uint64_t)&v13);
      v4 = (void *)v19[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v18, 8);
    v6 = [(CNAvatarStickerGeneratorProvider *)self avatarRecord];
    v7 = [v5 avatarForRecord:v6];

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    v8 = (void *)getAVTStickerGeneratorClass_softClass_30073;
    uint64_t v21 = getAVTStickerGeneratorClass_softClass_30073;
    if (!getAVTStickerGeneratorClass_softClass_30073)
    {
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __getAVTStickerGeneratorClass_block_invoke_30074;
      v16 = &unk_1E549AD00;
      v17 = &v18;
      __getAVTStickerGeneratorClass_block_invoke_30074((uint64_t)&v13);
      v8 = (void *)v19[3];
    }
    v9 = v8;
    _Block_object_dispose(&v18, 8);
    v10 = (AVTStickerGenerator *)[[v9 alloc] initWithAvatar:v7];
    v11 = self->_generator;
    self->_generator = v10;

    generator = self->_generator;
  }

  return generator;
}

- (CNAvatarStickerGeneratorProvider)initWithAvatarRecord:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNAvatarStickerGeneratorProvider;
  v6 = [(CNAvatarStickerGeneratorProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    v8 = v7;
  }

  return v7;
}

@end