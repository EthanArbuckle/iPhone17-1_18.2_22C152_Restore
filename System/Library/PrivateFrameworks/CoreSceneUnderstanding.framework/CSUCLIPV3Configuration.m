@interface CSUCLIPV3Configuration
+ (id)CLIPV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4;
+ (id)availableRevisions;
+ (int64_t)_resolvedRevision:(int64_t)a3;
- (CSUCLIPImageEncoderV3Configuration)imageEncoderConfiguration;
- (CSUCLIPTextEncoderV3Configuration)textEncoderConfiguration;
- (CSUCLIPV3Configuration)initWithRevision:(int64_t)a3 textEncoderConfiguration:(id)a4 imageEncoderConfiguration:(id)a5 embeddingRevision:(int64_t)a6 textEmbeddingType:(int64_t)a7;
- (int64_t)embeddingRevision;
- (int64_t)revision;
- (int64_t)textEmbeddingType;
@end

@implementation CSUCLIPV3Configuration

+ (int64_t)_resolvedRevision:(int64_t)a3
{
  if (a3 == -1) {
    return 1;
  }
  else {
    return a3;
  }
}

- (CSUCLIPV3Configuration)initWithRevision:(int64_t)a3 textEncoderConfiguration:(id)a4 imageEncoderConfiguration:(id)a5 embeddingRevision:(int64_t)a6 textEmbeddingType:(int64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CSUCLIPV3Configuration;
  v15 = [(CSUCLIPV3Configuration *)&v19 init];
  v16 = v15;
  if (v15)
  {
    v15->_revision = a3;
    objc_storeStrong((id *)&v15->_textEncoderConfiguration, a4);
    objc_storeStrong((id *)&v16->_imageEncoderConfiguration, a5);
    v16->_embeddingRevision = a6;
    v16->_textEmbeddingType = a7;
    v17 = v16;
  }

  return v16;
}

+ (id)CLIPV3ConfigurationForRevision:(int64_t)a3 error:(id *)a4
{
  if (objc_msgSend__resolvedRevision_(CSUCLIPV3Configuration, a2, a3, (uint64_t)a4, v4) != 1)
  {
    if (!a4)
    {
      v16 = 0;
      goto LABEL_12;
    }
    v17 = NSString;
    v12 = objc_msgSend_numberWithInteger_(NSNumber, v7, a3, v8, v9);
    id v13 = objc_msgSend_stringWithFormat_(v17, v18, @"Unsupported CLIPV3 revision %@", v19, v20, v12);
    objc_msgSend_errorForUnsupportedRevision_(CSUError, v21, (uint64_t)v13, v22, v23);
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v12 = objc_msgSend_CLIPTextEncoderV3ConfigurationForRevision_error_(CSUCLIPTextEncoderV3Configuration, v7, 1, (uint64_t)a4, v9);
  if (v12)
  {
    id v13 = objc_msgSend_CLIPImageEncoderV3ConfigurationForRevision_error_(CSUCLIPImageEncoderV3Configuration, v10, 1, (uint64_t)a4, v11);
    if (v13)
    {
      id v14 = [CSUCLIPV3Configuration alloc];
      v16 = objc_msgSend_initWithRevision_textEncoderConfiguration_imageEncoderConfiguration_embeddingRevision_textEmbeddingType_(v14, v15, 1, (uint64_t)v12, (uint64_t)v13, 1, 2);
    }
    else
    {
      v16 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  v16 = 0;
LABEL_11:

LABEL_12:
  return v16;
}

+ (id)availableRevisions
{
  id v2 = objc_alloc_init(MEMORY[0x263F089C8]);
  objc_msgSend_addIndex_(v2, v3, 1, v4, v5);
  return v2;
}

- (int64_t)revision
{
  return self->_revision;
}

- (CSUCLIPImageEncoderV3Configuration)imageEncoderConfiguration
{
  return self->_imageEncoderConfiguration;
}

- (CSUCLIPTextEncoderV3Configuration)textEncoderConfiguration
{
  return self->_textEncoderConfiguration;
}

- (int64_t)embeddingRevision
{
  return self->_embeddingRevision;
}

- (int64_t)textEmbeddingType
{
  return self->_textEmbeddingType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncoderConfiguration, 0);
  objc_storeStrong((id *)&self->_imageEncoderConfiguration, 0);
}

@end