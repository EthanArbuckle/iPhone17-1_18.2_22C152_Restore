@interface BSKWebClip
+ (void)fetchWebClipsURLWithCompletionHandler:(id)a3;
+ (void)fetchWebClipsUUIDWithCompletionHandler:(id)a3;
+ (void)getWebClipWithIdentifier:(id)a3 completionHandler:(id)a4;
- (BOOL)isFullScreen;
- (NSString)title;
- (NSURL)url;
- (NSUUID)identifier;
- (_WKApplicationManifest)manifest;
- (id)_initWithWebClip:(id)a3 manifest:(id)a4;
@end

@implementation BSKWebClip

+ (void)fetchWebClipsUUIDWithCompletionHandler:(id)a3
{
  id v6 = a3;
  Class v3 = NSClassFromString(&cfstr_Cpswebclipserv.isa);
  if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 bundleIdentifier];
    [(objc_class *)v3 fetchWebClipsUUIDForClientBundleID:v5 completion:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

+ (void)fetchWebClipsURLWithCompletionHandler:(id)a3
{
  id v6 = a3;
  Class v3 = NSClassFromString(&cfstr_Cpswebclipserv.isa);
  if (objc_opt_respondsToSelector())
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 bundleIdentifier];
    [(objc_class *)v3 fetchWebClipsURLForClientBundleID:v5 completion:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

+ (void)getWebClipWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  Class v7 = NSClassFromString(&cfstr_Cpswebclipserv.isa);
  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__BSKWebClip_getWebClipWithIdentifier_completionHandler___block_invoke;
    v8[3] = &unk_265257630;
    id v9 = v6;
    [(objc_class *)v7 getWebClipDictionaryWithIdentifier:v5 completion:v8];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __57__BSKWebClip_getWebClipWithIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v11 = v5;
  if (a2 || !v5)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
    v9();
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
  id v6 = [MEMORY[0x263F82E68] webClipWithDictionaryRepresentation:v11];
  if (v6)
  {
    Class v7 = [v11 objectForKeyedSubscript:@"DictionaryRepresentationManifest"];
    if (v7)
    {
      v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:0];
    }
    else
    {
      v8 = 0;
    }
    id v10 = [[BSKWebClip alloc] _initWithWebClip:v6 manifest:v8];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

LABEL_14:
}

- (id)_initWithWebClip:(id)a3 manifest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BSKWebClip;
  id v9 = [(BSKWebClip *)&v13 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webClip, a3);
    objc_storeStrong(p_isa + 2, a4);
    id v11 = p_isa;
  }

  return p_isa;
}

- (NSUUID)identifier
{
  return (NSUUID *)[(UIWebClip *)self->_webClip uuid];
}

- (NSString)title
{
  return (NSString *)[(UIWebClip *)self->_webClip title];
}

- (NSURL)url
{
  return (NSURL *)[(UIWebClip *)self->_webClip pageURL];
}

- (BOOL)isFullScreen
{
  return [(UIWebClip *)self->_webClip fullScreen];
}

- (_WKApplicationManifest)manifest
{
  return self->_manifest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
}

@end