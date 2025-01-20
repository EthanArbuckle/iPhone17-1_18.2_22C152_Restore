@interface TKApplication
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)shared;
- (BOOL)ready;
- (Class)loadClass:(id)a3;
- (NSString)bundleVersion;
- (NSURL)baseURL;
- (NSURL)bundleURL;
- (TKApplicationDelegate)delegate;
- (TKRepository)repository;
- (id)absoluteURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)loadObject:(id)a3;
- (id)loadPage:(id)a3;
- (id)loadPage:(id)a3 withData:(id)a4;
- (id)loadPage:(id)a3 withDataRequest:(id)a4;
- (id)loadPageWithDataRequest:(id)a3;
- (id)loadView:(id)a3;
- (id)newErrorViewController:(id)a3;
- (id)newLoadingViewController;
- (id)tmlPathForName:(id)a3;
- (void)clearBundleCache;
- (void)didLoadRepository:(id)a3;
- (void)loadBundle:(id)a3 completion:(id)a4;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TKApplication

+ (id)shared
{
  id v11 = a1;
  SEL v10 = a2;
  uint64_t obj = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __23__TKApplication_shared__block_invoke;
  v8 = &__block_descriptor_40_e5_v8__0l;
  id v9 = a1;
  v13 = (dispatch_once_t *)&shared_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &obj);
  if (*v13 != -1) {
    dispatch_once(v13, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)shared_shared;
  return v2;
}

uint64_t __23__TKApplication_shared__block_invoke(uint64_t a1)
{
  uint64_t v6 = a1;
  uint64_t v5 = a1;
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___TKApplication;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  v2 = (void *)shared_shared;
  shared_shared = v1;

  +[TKDefaultImageServices setup];
  return [MEMORY[0x263F80CC0] setExceptionHandlerBlock:&__block_literal_global_5];
}

void __23__TKApplication_shared__block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(&cfstr_JitappkitExcep.isa, location[0]);
  objc_storeStrong(location, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  v3 = (void *)[a1 shared];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (void)loadBundle:(id)a3 completion:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  -[TKApplication willChangeValueForKey:](v15, "willChangeValueForKey:");
  v15->_ready = 0;
  objc_storeStrong((id *)&v15->_repository, 0);
  [(TKApplication *)v15 didChangeValueForKey:@"ready"];
  id v5 = location[0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __39__TKApplication_loadBundle_completion___block_invoke;
  SEL v10 = &unk_26485AD08;
  id v11 = v15;
  id v12 = v13;
  +[TKRepository loadWithURL:completion:](TKRepository, "loadWithURL:completion:", v5);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __39__TKApplication_loadBundle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  if (location[0]) {
    [*(id *)(a1 + 32) didLoadRepository:location[0]];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)clearBundleCache
{
}

- (void)didLoadRepository:(id)a3
{
  objc_super v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[TKApplication willChangeValueForKey:](v4, "willChangeValueForKey:");
  objc_storeStrong((id *)&v4->_repository, location[0]);
  v4->_ready = 1;
  [(TKApplication *)v4 didChangeValueForKey:@"ready"];
  objc_storeStrong(location, 0);
}

- (NSURL)bundleURL
{
  return [(TKRepository *)self->_repository URL];
}

- (NSString)bundleVersion
{
  return [(TKRepository *)self->_repository version];
}

- (id)loadPageWithDataRequest:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [TKDefaultPage alloc];
  int v7 = [(TKDefaultPage *)v3 initWithDataRequest:location[0]];
  uint64_t v6 = [(TKPage *)v7 viewController];
  [(TKPage *)v7 load];
  id v5 = v6;
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)loadPage:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [TKPage alloc];
  int v7 = [(TKPage *)v3 initWithViewName:location[0]];
  uint64_t v6 = [(TKPage *)v7 viewController];
  [(TKPage *)v7 load];
  id v5 = v6;
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)loadPage:(id)a3 withData:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  objc_super v4 = [TKPage alloc];
  id v9 = [(TKPage *)v4 initWithViewName:location[0]];
  [(TKPage *)v9 setData:v10];
  int v8 = [(TKPage *)v9 viewController];
  [(TKPage *)v9 load];
  int v7 = v8;
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)loadPage:(id)a3 withDataRequest:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  objc_super v4 = [TKPage alloc];
  id v9 = [(TKPage *)v4 initWithViewName:location[0]];
  [(TKPage *)v9 setDataRequest:v10];
  int v8 = [(TKPage *)v9 viewController];
  [(TKPage *)v9 load];
  int v7 = v8;
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)loadView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = +[TKApplication shared];
  id v8 = (id)[v9 repository];
  id v11 = (id)[v8 tmlPathForName:location[0]];

  if ([v11 length])
  {
    id v13 = (id)[MEMORY[0x263F82E00] tmlLoadViewFromPath:v11];
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x263F828E0]);
    id v10 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v10 setNumberOfLines:0];
    id v6 = (id)[MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    objc_msgSend(v10, "setFont:");

    [v10 setTextAlignment:1];
    id v7 = (id)[NSString stringWithFormat:@"View not found: %@", location[0]];
    objc_msgSend(v10, "setText:");

    id v13 = v10;
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_super v4 = v13;
  return v4;
}

- (id)loadObject:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = +[TKApplication shared];
  id v4 = (id)[v5 repository];
  id v7 = (id)[v4 tmlPathForName:location[0]];

  id v6 = (id)[MEMORY[0x263F8C6D0] tmlLoadObjectFromPath:v7];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (Class)loadClass:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = +[TKApplication shared];
  id v5 = (id)[v6 repository];
  id v7 = (id)[v5 tmlPathForName:location[0]];

  if ([v7 length]) {
    id v9 = (id)[MEMORY[0x263F80CB8] createClassFromPath:v7];
  }
  else {
    id v9 = 0;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  id v3 = v9;
  return (Class)v3;
}

- (id)newLoadingViewController
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    id v4 = (void *)[location[0] newLoadingViewController];
  }
  else {
    id v4 = 0;
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (id)newErrorViewController:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
  if (objc_opt_respondsToSelector()) {
    id v7 = (id)[WeakRetained newErrorViewController:location[0]];
  }
  else {
    id v7 = +[TKErrorViewController viewControllerForMessage:location[0]];
  }
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)absoluteURL:(id)a3
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)[location[0] scheme];
  BOOL v11 = 0;
  if (![v10 length]) {
    BOOL v11 = v13->_baseURL != 0;
  }

  if (v11)
  {
    id v7 = NSURL;
    id v9 = (id)[location[0] absoluteString];
    id v8 = (id)objc_msgSend(v7, "URLWithString:relativeToURL:");
    id v3 = (id)[v8 absoluteURL];
    id v4 = location[0];
    location[0] = v3;
  }
  id v6 = location[0];
  objc_storeStrong(location, 0);
  return v6;
}

- (id)tmlPathForName:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = +[TKApplication shared];
  id v4 = (id)[v5 repository];
  id v6 = (id)[v4 tmlPathForName:location[0]];

  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)ready
{
  return self->_ready;
}

- (TKRepository)repository
{
  return self->_repository;
}

- (TKApplicationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TKApplicationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end