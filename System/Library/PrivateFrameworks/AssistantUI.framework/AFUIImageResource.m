@interface AFUIImageResource
+ (id)imageResourceFromKey:(id)a3 pressedKey:(id)a4 punchOut:(id)a5;
+ (id)imageResourceWithAppPunchOut:(id)a3;
+ (id)imageResourceWithLocalResourceName:(id)a3 pressedResourceName:(id)a4 localPunchOut:(id)a5 bundle:(id)a6;
- (CGSize)logoSize;
- (NSBundle)localResourceBundle;
- (NSString)localPressedResourceName;
- (NSString)localResourceName;
- (NSURL)remotePressedURL;
- (NSURL)remoteURL;
- (SAUIAppPunchOut)localPunchOut;
- (SAUIAppPunchOut)remotePunchOut;
- (double)remotePressedScale;
- (double)remoteScale;
- (id)_imageInLocalResourceBundleNamed:(id)a3;
- (void)_fetchLocalResourcesWithCompletion:(id)a3;
- (void)_fetchRemoteResourcesWithCompletion:(id)a3;
- (void)getLogoWithCompletion:(id)a3;
- (void)setLocalPressedResourceName:(id)a3;
- (void)setLocalPunchOut:(id)a3;
- (void)setLocalResourceBundle:(id)a3;
- (void)setLocalResourceName:(id)a3;
- (void)setLogoSize:(CGSize)a3;
- (void)setRemotePressedScale:(double)a3;
- (void)setRemotePressedURL:(id)a3;
- (void)setRemotePunchOut:(id)a3;
- (void)setRemoteScale:(double)a3;
- (void)setRemoteURL:(id)a3;
@end

@implementation AFUIImageResource

+ (id)imageResourceWithAppPunchOut:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() imageResourceFromKey:0 pressedKey:0 punchOut:v3];

  return v4;
}

+ (id)imageResourceWithLocalResourceName:(id)a3 pressedResourceName:(id)a4 localPunchOut:(id)a5 bundle:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_alloc_init(AFUIImageResource);
  [(AFUIImageResource *)v13 setLocalResourceBundle:v9];

  [(AFUIImageResource *)v13 setLocalResourceName:v12];
  [(AFUIImageResource *)v13 setLocalPressedResourceName:v11];

  [(AFUIImageResource *)v13 setLocalPunchOut:v10];

  return v13;
}

+ (id)imageResourceFromKey:(id)a3 pressedKey:(id)a4 punchOut:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 appIconMap];

  if (v7 && v10)
  {
    id v11 = [v9 appIconMap];
    id v12 = [v11 objectForKey:v7];
    v13 = [v11 objectForKey:v8];
  }
  else
  {
    id v12 = [v9 appIcon];
    v13 = 0;
  }
  v14 = [v12 resourceUrl];
  [v12 scaleFactor];
  if (v15 <= 0.0) {
    double v16 = 1.0;
  }
  else {
    double v16 = v15;
  }
  v17 = [v13 resourceUrl];
  [v13 scaleFactor];
  double v19 = v18;
  if (v12)
  {
    [v12 pixelWidth];
    double v21 = v20 / v16;
    [v12 pixelHeight];
    double v23 = v22 / v16;
  }
  else
  {
    double v21 = *MEMORY[0x263F001B0];
    double v23 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  if (v19 <= 0.0) {
    double v19 = 1.0;
  }
  v24 = objc_alloc_init(AFUIImageResource);
  [(AFUIImageResource *)v24 setRemoteURL:v14];
  [(AFUIImageResource *)v24 setRemoteScale:v16];
  [(AFUIImageResource *)v24 setRemotePressedURL:v17];
  [(AFUIImageResource *)v24 setRemotePressedScale:v19];
  -[AFUIImageResource setLogoSize:](v24, "setLogoSize:", v21, v23);
  [(AFUIImageResource *)v24 setRemotePunchOut:v9];

  return v24;
}

- (void)getLogoWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(AFUIImageResource *)self localResourceName];

    if (v5)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __43__AFUIImageResource_getLogoWithCompletion___block_invoke;
      v7[3] = &unk_264692E60;
      v7[4] = self;
      id v8 = v4;
      [(AFUIImageResource *)self _fetchLocalResourcesWithCompletion:v7];
    }
    else
    {
      v6 = [(AFUIImageResource *)self remoteURL];

      if (v6) {
        [(AFUIImageResource *)self _fetchRemoteResourcesWithCompletion:v4];
      }
      else {
        (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
      }
    }
  }
}

uint64_t __43__AFUIImageResource_getLogoWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _fetchRemoteResourcesWithCompletion:*(void *)(a1 + 40)];
  }
}

- (CGSize)logoSize
{
  double width = *MEMORY[0x263F001B0];
  CGFloat height = *(double *)(MEMORY[0x263F001B0] + 8);
  v5 = [(AFUIImageResource *)self localResourceName];
  if ([v5 length])
  {
    v6 = [(AFUIImageResource *)self _imageInLocalResourceBundleNamed:v5];
    id v7 = v6;
    if (v6)
    {
      [v6 size];
      double width = v8;
      CGFloat height = v9;
    }
  }
  if (width <= 0.0)
  {
    double width = self->_logoSize.width;
    CGFloat height = self->_logoSize.height;
  }

  double v10 = width;
  double v11 = height;
  result.CGFloat height = v11;
  result.double width = v10;
  return result;
}

- (void)_fetchLocalResourcesWithCompletion:(id)a3
{
  double v9 = (void (**)(id, void *, void *, void *))a3;
  id v4 = [(AFUIImageResource *)self localResourceName];
  v5 = [(AFUIImageResource *)self localPressedResourceName];
  v6 = [(AFUIImageResource *)self localPunchOut];
  if (v4)
  {
    id v7 = [(AFUIImageResource *)self _imageInLocalResourceBundleNamed:v4];
    if (v5)
    {
LABEL_3:
      double v8 = [(AFUIImageResource *)self _imageInLocalResourceBundleNamed:v5];
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = 0;
    if (v5) {
      goto LABEL_3;
    }
  }
  double v8 = 0;
LABEL_6:
  v9[2](v9, v7, v8, v6);
}

- (id)_imageInLocalResourceBundleNamed:(id)a3
{
  id v4 = (void *)MEMORY[0x263F827E8];
  id v5 = a3;
  v6 = [(AFUIImageResource *)self localResourceBundle];
  id v7 = [v4 _deviceSpecificImageNamed:v5 inBundle:v6];

  return v7;
}

- (void)_fetchRemoteResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  v17 = [(AFUIImageResource *)self remoteURL];
  id v5 = [(AFUIImageResource *)self remotePressedURL];
  v6 = [(AFUIImageResource *)self remotePunchOut];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__0;
  v31[4] = __Block_byref_object_dispose__0;
  id v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__0;
  v29[4] = __Block_byref_object_dispose__0;
  id v30 = 0;
  id v7 = dispatch_group_create();
  double v8 = dispatch_get_global_queue(0, 0);
  dispatch_group_enter(v7);
  double v9 = [MEMORY[0x263F753D0] sharedURLSession];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke;
  v26[3] = &unk_264692E88;
  v28 = v31;
  double v10 = v7;
  v27 = v10;
  id v11 = (id)[v9 imageTaskWithHTTPGetRequest:v17 client:self completionHandler:v26];

  dispatch_group_enter(v10);
  id v12 = [MEMORY[0x263F753D0] sharedURLSession];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke_2;
  v23[3] = &unk_264692E88;
  v25 = v29;
  v13 = v10;
  v24 = v13;
  id v14 = (id)[v12 imageTaskWithHTTPGetRequest:v5 client:self completionHandler:v23];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke_3;
  block[3] = &unk_264692EB0;
  double v21 = v31;
  double v22 = v29;
  id v19 = v6;
  id v20 = v4;
  id v15 = v6;
  id v16 = v4;
  dispatch_group_notify(v13, v8, block);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
}

void __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), a1[4]);
}

- (NSString)localResourceName
{
  return self->_localResourceName;
}

- (void)setLocalResourceName:(id)a3
{
}

- (NSString)localPressedResourceName
{
  return self->_localPressedResourceName;
}

- (void)setLocalPressedResourceName:(id)a3
{
}

- (SAUIAppPunchOut)localPunchOut
{
  return self->_localPunchOut;
}

- (void)setLocalPunchOut:(id)a3
{
}

- (NSBundle)localResourceBundle
{
  return self->_localResourceBundle;
}

- (void)setLocalResourceBundle:(id)a3
{
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
}

- (NSURL)remotePressedURL
{
  return self->_remotePressedURL;
}

- (void)setRemotePressedURL:(id)a3
{
}

- (SAUIAppPunchOut)remotePunchOut
{
  return self->_remotePunchOut;
}

- (void)setRemotePunchOut:(id)a3
{
}

- (double)remoteScale
{
  return self->_remoteScale;
}

- (void)setRemoteScale:(double)a3
{
  self->_remoteScale = a3;
}

- (double)remotePressedScale
{
  return self->_remotePressedScale;
}

- (void)setRemotePressedScale:(double)a3
{
  self->_remotePressedScale = a3;
}

- (void)setLogoSize:(CGSize)a3
{
  self->_logoSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePunchOut, 0);
  objc_storeStrong((id *)&self->_remotePressedURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_localResourceBundle, 0);
  objc_storeStrong((id *)&self->_localPunchOut, 0);
  objc_storeStrong((id *)&self->_localPressedResourceName, 0);

  objc_storeStrong((id *)&self->_localResourceName, 0);
}

@end