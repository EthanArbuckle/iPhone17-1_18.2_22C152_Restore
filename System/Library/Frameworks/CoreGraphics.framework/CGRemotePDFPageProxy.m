@interface CGRemotePDFPageProxy
- (CGRect)rectForBox:(int)a3;
- (CGRemotePDFPageProxy)initWithRemotePage:(id)a3;
- (NSString)pageText;
- (NSUUID)identifier;
- (id)getPageTextAndReturnError:(id *)a3;
- (int64_t)rotation;
- (void)drawWithBox:(int)a3 size:(CGSize)a4 colorSpace:(id)a5 options:(id)a6 completion:(id)a7;
@end

@implementation CGRemotePDFPageProxy

- (void).cxx_destruct
{
}

- (id)getPageTextAndReturnError:(id *)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10695;
  v20 = __Block_byref_object_dispose__10696;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__10695;
  v14 = __Block_byref_object_dispose__10696;
  id v15 = 0;
  pageProxy = self->_pageProxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__CGRemotePDFPageProxy_getPageTextAndReturnError___block_invoke;
  v9[3] = &unk_1E52CD7A0;
  v9[4] = &v10;
  v5 = [(CGRemotePDFPageProtocol *)pageProxy synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__CGRemotePDFPageProxy_getPageTextAndReturnError___block_invoke_2;
  v8[3] = &unk_1E52C8068;
  v8[4] = &v16;
  [v5 getPageText:v8];

  if (a3) {
    *a3 = (id) v11[5];
  }
  id v6 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v6;
}

void __50__CGRemotePDFPageProxy_getPageTextAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_SError.isa, "-[CGRemotePDFPageProxy getPageTextAndReturnError:]_block_invoke", v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __50__CGRemotePDFPageProxy_getPageTextAndReturnError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (NSString)pageText
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10695;
  uint64_t v10 = __Block_byref_object_dispose__10696;
  id v11 = 0;
  v2 = [(CGRemotePDFPageProtocol *)self->_pageProxy synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_11_10702];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CGRemotePDFPageProxy_pageText__block_invoke_2;
  v5[3] = &unk_1E52C8068;
  v5[4] = &v6;
  [v2 getPageText:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __32__CGRemotePDFPageProxy_pageText__block_invoke_2(uint64_t a1, void *a2)
{
}

void __32__CGRemotePDFPageProxy_pageText__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)drawWithBox:(int)a3 size:(CGSize)a4 colorSpace:(id)a5 options:(id)a6 completion:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v11 = *(void *)&a3;
  id v13 = a7;
  pageProxy = self->_pageProxy;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71__CGRemotePDFPageProxy_drawWithBox_size_colorSpace_options_completion___block_invoke;
  v22[3] = &unk_1E52CDE30;
  id v15 = v13;
  id v23 = v15;
  id v16 = a6;
  id v17 = a5;
  uint64_t v18 = [(CGRemotePDFPageProtocol *)pageProxy remoteObjectProxyWithErrorHandler:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__CGRemotePDFPageProxy_drawWithBox_size_colorSpace_options_completion___block_invoke_2;
  v20[3] = &unk_1E52C8040;
  id v21 = v15;
  id v19 = v15;
  objc_msgSend(v18, "drawWithBox:size:colorSpace:options:completion:", v11, v17, v16, v20, width, height);
}

uint64_t __71__CGRemotePDFPageProxy_drawWithBox_size_colorSpace_options_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_SError.isa, "-[CGRemotePDFPageProxy drawWithBox:size:colorSpace:options:completion:]_block_invoke", a2);
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

uint64_t __71__CGRemotePDFPageProxy_drawWithBox_size_colorSpace_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGRect)rectForBox:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = 0;
  id v15 = (double *)&v14;
  uint64_t v16 = 0x4010000000;
  id v17 = "";
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(CGRemotePDFPageProtocol *)self->_pageProxy synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_7_10706];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __35__CGRemotePDFPageProxy_rectForBox___block_invoke_2;
  v13[3] = &unk_1E52C8018;
  v13[4] = &v14;
  [v4 getBoxRect:v3 completion:v13];

  double v5 = v15[4];
  double v6 = v15[5];
  double v7 = v15[6];
  double v8 = v15[7];
  _Block_object_dispose(&v14, 8);
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

uint64_t __35__CGRemotePDFPageProxy_rectForBox___block_invoke_2(uint64_t result, double a2, double a3, double a4, double a5)
{
  double v5 = *(double **)(*(void *)(result + 32) + 8);
  v5[4] = a2;
  void v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return result;
}

void __35__CGRemotePDFPageProxy_rectForBox___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (int64_t)rotation
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(CGRemotePDFPageProtocol *)self->_pageProxy synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_4_10709];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CGRemotePDFPageProxy_rotation__block_invoke_2;
  v5[3] = &unk_1E52CDDE0;
  v5[4] = &v6;
  [v2 getRotation:v5];

  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__CGRemotePDFPageProxy_rotation__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __32__CGRemotePDFPageProxy_rotation__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (NSUUID)identifier
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__10695;
  double v10 = __Block_byref_object_dispose__10696;
  id v11 = 0;
  v2 = [(CGRemotePDFPageProtocol *)self->_pageProxy synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10712];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CGRemotePDFPageProxy_identifier__block_invoke_2;
  v5[3] = &unk_1E52C7FF0;
  v5[4] = &v6;
  [v2 getIdentifier:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSUUID *)v3;
}

void __34__CGRemotePDFPageProxy_identifier__block_invoke_2(uint64_t a1, void *a2)
{
}

void __34__CGRemotePDFPageProxy_identifier__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (CGRemotePDFPageProxy)initWithRemotePage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CGRemotePDFPageProxy;
  uint64_t v6 = [(CGRemotePDFPageProxy *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pageProxy, a3);
  }

  return v7;
}

@end