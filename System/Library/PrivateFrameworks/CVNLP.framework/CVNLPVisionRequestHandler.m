@interface CVNLPVisionRequestHandler
- (CVNLPVisionRequestHandler)initWithOptions:(id)a3 runTimeParams:(id)a4;
- (id)classifyImage:(__CVBuffer *)a3;
@end

@implementation CVNLPVisionRequestHandler

- (CVNLPVisionRequestHandler)initWithOptions:(id)a3 runTimeParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CVNLPVisionRequestHandler;
  v8 = [(CVNLPCaptionModelBase *)&v24 initWithOptions:v6 runTimeParams:v7];
  if (v8)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B4C68964;
    v22[3] = &unk_1E60A3CF0;
    id v23 = v7;
    v9 = (void (**)(void, void))MEMORY[0x1BA9931A0](v22);
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v10 = (void *)qword_1E9D406D0;
    uint64_t v33 = qword_1E9D406D0;
    if (!qword_1E9D406D0)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = sub_1B4C68F80;
      v28 = &unk_1E60A38E0;
      v29 = &v30;
      sub_1B4C68F80((uint64_t)&v25);
      v10 = (void *)v31[3];
    }
    v11 = v10;
    _Block_object_dispose(&v30, 8);
    v12 = (VN6Mb1ME89lyW3HpahkEygIG *)objc_alloc_init(v11);
    significantRequest = v8->_significantRequest;
    v8->_significantRequest = v12;

    ((void (**)(void, VN6Mb1ME89lyW3HpahkEygIG *))v9)[2](v9, v8->_significantRequest);
    if (objc_claimAutoreleasedReturnValue())
    {
      v14 = (char *)operator new(0x20uLL);
      strcpy(v14, "Failed to create s-classifier");
      sub_1B4C53070(6u, (uint64_t)v14);
    }
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v15 = (void *)qword_1E9D406E0;
    uint64_t v33 = qword_1E9D406E0;
    if (!qword_1E9D406E0)
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = sub_1B4C69148;
      v28 = &unk_1E60A38E0;
      v29 = &v30;
      sub_1B4C69148((uint64_t)&v25);
      v15 = (void *)v31[3];
    }
    v16 = v15;
    _Block_object_dispose(&v30, 8);
    v17 = (VNVYvzEtX1JlUdu8xx5qhDI *)objc_alloc_init(v16);
    nsfwRequest = v8->_nsfwRequest;
    v8->_nsfwRequest = v17;

    uint64_t v19 = ((void (**)(void, VNVYvzEtX1JlUdu8xx5qhDI *))v9)[2](v9, v8->_nsfwRequest);

    if (v19)
    {
      v20 = (char *)operator new(0x20uLL);
      strcpy(v20, "Failed to create n-classifier");
      sub_1B4C53070(6u, (uint64_t)v20);
    }
  }
  return v8;
}

- (id)classifyImage:(__CVBuffer *)a3
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1B4C68C90;
  id v23 = sub_1B4C68CA0;
  id v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_1B4C68C90;
  v17[4] = sub_1B4C68CA0;
  id v18 = 0;
  id v6 = objc_msgSend_perfResults(self, a2, (uint64_t)a3, v3);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1B4C68CA8;
  v16[3] = &unk_1E60A3D18;
  v16[4] = v17;
  v16[5] = a3;
  objc_msgSend_run_block_(v6, v7, @"VisionRequestCreation", (uint64_t)v16);

  v11 = objc_msgSend_perfResults(self, v8, v9, v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1B4C68DA8;
  v15[3] = &unk_1E60A3D40;
  v15[4] = self;
  v15[5] = v17;
  v15[6] = &v19;
  objc_msgSend_run_block_(v11, v12, @"VisionPerformRequest", (uint64_t)v15);

  id v13 = (id)v20[5];
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantRequest, 0);
  objc_storeStrong((id *)&self->_nsfwRequest, 0);
}

@end