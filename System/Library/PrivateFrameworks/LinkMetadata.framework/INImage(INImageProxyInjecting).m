@interface INImage(INImageProxyInjecting)
- (void)_injectProxiesForImages:()INImageProxyInjecting completion:;
@end

@implementation INImage(INImageProxyInjecting)

- (void)_injectProxiesForImages:()INImageProxyInjecting completion:
{
  v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"LNImage.m", 33, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v9 = (void *)[a1 copy];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__INImage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
  v13[3] = &unk_1E590DC20;
  id v14 = v8;
  v10 = (void (*)(void *, void *, void *))v7[2];
  id v11 = v8;
  v10(v7, v9, v13);
}

@end