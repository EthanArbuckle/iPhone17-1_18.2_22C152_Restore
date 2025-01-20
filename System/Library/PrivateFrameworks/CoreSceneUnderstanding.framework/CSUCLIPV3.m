@interface CSUCLIPV3
+ (BOOL)calculateCosineSimilarity:(float *)a3 ofEmbedding:(id)a4 toEmbedding:(id)a5 error:(id *)a6;
- (BOOL)loadResources:(id *)a3;
- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5;
- (CSUCLIPV3)initWithConfiguration:(id)a3;
- (CSUCLIPV3Configuration)configuration;
- (void)encodeInputImage:(__CVBuffer *)a3 completion:(id)a4;
- (void)encodeInputText:(id)a3 completion:(id)a4;
@end

@implementation CSUCLIPV3

- (CSUCLIPV3)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CSUCLIPV3;
  v6 = [(CSUCLIPV3 *)&v32 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [CSUCLIPTextEncoderV3 alloc];
    v13 = objc_msgSend_textEncoderConfiguration(v5, v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_initWithConfiguration_(v8, v14, (uint64_t)v13, v15, v16);
    textEncoder = v7->_textEncoder;
    v7->_textEncoder = (CSUCLIPTextEncoderV3 *)v17;

    v19 = [CSUCLIPImageEncoderV3 alloc];
    v24 = objc_msgSend_imageEncoderConfiguration(v5, v20, v21, v22, v23);
    uint64_t v28 = objc_msgSend_initWithConfiguration_(v19, v25, (uint64_t)v24, v26, v27);
    imageEncoder = v7->_imageEncoder;
    v7->_imageEncoder = (CSUCLIPImageEncoderV3 *)v28;

    v30 = v7;
  }

  return v7;
}

- (BOOL)loadResources:(id *)a3
{
  int Resources = objc_msgSend_loadResources_(self->_textEncoder, a2, (uint64_t)a3, v3, v4);
  if (Resources)
  {
    imageEncoder = self->_imageEncoder;
    LOBYTE(Resources) = objc_msgSend_loadResources_(imageEncoder, v8, (uint64_t)a3, v9, v10);
  }
  return Resources;
}

- (BOOL)resampleImage:(__CVBuffer *)a3 intoInputImage:(__CVBuffer *)a4 error:(id *)a5
{
  return MEMORY[0x270F9A6D0](self->_imageEncoder, sel_resampleImage_intoInputImage_error_, a3, a4, a5);
}

- (void)encodeInputImage:(__CVBuffer *)a3 completion:(id)a4
{
  id v6 = a4;
  imageEncoder = self->_imageEncoder;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_24C67EEBC;
  v11[3] = &unk_2652E7D38;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  objc_msgSend_runOnInputImage_completion_(imageEncoder, v9, (uint64_t)a3, (uint64_t)v11, v10);
}

- (void)encodeInputText:(id)a3 completion:(id)a4
{
  id v6 = a4;
  textEncoder = self->_textEncoder;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_24C67F0B4;
  v11[3] = &unk_2652E7D60;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  objc_msgSend_runOnInputText_completion_(textEncoder, v9, (uint64_t)a3, (uint64_t)v11, v10);
}

+ (BOOL)calculateCosineSimilarity:(float *)a3 ofEmbedding:(id)a4 toEmbedding:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = objc_msgSend_revision(v9, v11, v12, v13, v14);
  if (v15 == objc_msgSend_revision(v10, v16, v17, v18, v19))
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    uint64_t v36 = 0;
    v37 = (float *)&v36;
    uint64_t v38 = 0x2020000000;
    int v39 = 2143289344;
    v24 = objc_msgSend_buffer(v9, v20, v21, v22, v23);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = sub_24C67F3EC;
    v31[3] = &unk_2652E7DB0;
    id v32 = v10;
    v33 = &v36;
    v34 = &v40;
    v35 = a6;
    objc_msgSend_accessDataUsingBlock_(v24, v25, (uint64_t)v31, v26, v27);

    int v28 = *((unsigned __int8 *)v41 + 24);
    if (*((unsigned char *)v41 + 24)) {
      *a3 = v37[6];
    }
    BOOL v29 = v28 != 0;

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
  else if (a6)
  {
    objc_msgSend_errorWithCode_message_(CSUError, v20, 8, @"Attempting to compare embeddings in different latent spaces", v23);
    BOOL v29 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (CSUCLIPV3Configuration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_imageEncoder, 0);
  objc_storeStrong((id *)&self->_textEncoder, 0);
}

@end