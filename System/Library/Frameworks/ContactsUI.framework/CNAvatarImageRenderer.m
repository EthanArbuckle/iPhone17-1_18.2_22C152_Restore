@interface CNAvatarImageRenderer
+ (id)descriptorForRequiredKeys;
- (CNAvatarImageRenderer)init;
- (CNAvatarImageRenderer)initWithSettings:(id)a3;
- (CNSchedulerProvider)schedulerProvider;
- (CNUILikenessRendering)renderer;
- (CNUIPRLikenessResolver)resolver;
- (id)avatarImageForContacts:(id)a3 scope:(id)a4;
- (id)avatarImageForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5;
- (id)imageForAvatarAccessoryView:(id)a3 scope:(id)a4;
- (id)loadingPlaceholderImageProvider;
- (id)placeholderImageProvider;
- (id)renderAvatarsForContacts:(id)a3 handler:(id)a4;
- (id)renderAvatarsForContacts:(id)a3 scope:(id)a4 imageHandler:(id)a5;
- (id)renderAvatarsForContacts:(id)a3 scope:(id)a4 includePlaceholder:(BOOL)a5 imageHandler:(id)a6;
- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 imageHandler:(id)a6;
- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 includePlaceholder:(BOOL)a6 imageHandler:(id)a7;
- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 placeholder:(BOOL)a6 workScheduler:(id)a7 imageHandler:(id)a8;
- (id)renderMonogramForContact:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6;
- (id)renderMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6;
- (id)renderMonogramForString:(id)a3 handler:(id)a4;
- (id)renderMonogramForString:(id)a3 scope:(id)a4 imageHandler:(id)a5;
- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 placeholder:(BOOL)a6 workScheduler:(id)a7;
- (id)renderedMonogramObservableForString:(id)a3 scope:(id)a4;
- (id)runScopeBasedImageObservable:(id)a3 scope:(id)a4 imageHandler:(id)a5;
@end

@implementation CNAvatarImageRenderer

void __65__CNAvatarImageRenderer_avatarImageForContacts_withBadges_scope___block_invoke(uint64_t a1, void *a2)
{
}

- (id)avatarImageForContacts:(id)a3 scope:(id)a4
{
  return [(CNAvatarImageRenderer *)self avatarImageForContacts:a3 withBadges:MEMORY[0x1E4F1CBF0] scope:a4];
}

- (CNAvatarImageRenderer)init
{
  v3 = +[CNAvatarImageRendererSettings defaultSettings];
  v4 = [(CNAvatarImageRenderer *)self initWithSettings:v3];

  return v4;
}

- (CNAvatarImageRenderer)initWithSettings:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarImageRenderer;
  v5 = [(CNAvatarImageRenderer *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 likenessResolver];
    resolver = v5->_resolver;
    v5->_resolver = (CNUIPRLikenessResolver *)v6;

    uint64_t v8 = [v4 likenessRenderer];
    renderer = v5->_renderer;
    v5->_renderer = (CNUILikenessRendering *)v8;

    uint64_t v10 = [v4 schedulerProvider];
    schedulerProvider = v5->_schedulerProvider;
    v5->_schedulerProvider = (CNSchedulerProvider *)v10;
  }
  return v5;
}

- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 includePlaceholder:(BOOL)a6 imageHandler:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(CNAvatarImageRenderer *)self schedulerProvider];
  v17 = [v16 backgroundScheduler];
  v18 = [(CNAvatarImageRenderer *)self renderAvatarsForContacts:v15 withBadges:v14 scope:v13 placeholder:v7 workScheduler:v17 imageHandler:v12];

  return v18;
}

- (id)avatarImageForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CNAvatarImageRenderer *)self schedulerProvider];
  id v12 = [v11 immediateScheduler];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__21567;
  v21 = __Block_byref_object_dispose__21568;
  id v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__CNAvatarImageRenderer_avatarImageForContacts_withBadges_scope___block_invoke;
  v16[3] = &unk_1E5498048;
  v16[4] = &v17;
  id v13 = [(CNAvatarImageRenderer *)self renderAvatarsForContacts:v8 withBadges:v9 scope:v10 placeholder:0 workScheduler:v12 imageHandler:v16];
  [v13 cancel];
  id v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v14;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 placeholder:(BOOL)a6 workScheduler:(id)a7 imageHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __106__CNAvatarImageRenderer_renderAvatarsForContacts_withBadges_scope_placeholder_workScheduler_imageHandler___block_invoke;
  v22[3] = &unk_1E5498070;
  v22[4] = self;
  id v23 = v14;
  BOOL v26 = a6;
  id v24 = v15;
  id v25 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  v20 = [(CNAvatarImageRenderer *)self runScopeBasedImageObservable:v22 scope:a5 imageHandler:a8];

  return v20;
}

- (id)runScopeBasedImageObservable:(id)a3 scope:(id)a4 imageHandler:(id)a5
{
  BOOL v7 = (void (**)(id, void *))a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 conformsToProtocol:&unk_1ED9D6BB8])
  {
    id v10 = [v8 likenessRenderingScope];
    v11 = v7[2](v7, v10);
    id v12 = [MEMORY[0x1E4F5A488] observerWithResultBlock:v9 completionBlock:0 failureBlock:&__block_literal_global_69];
    id v13 = [v11 subscribe:v12];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"scope argument is invalid"];
    id v13 = objc_alloc_init(MEMORY[0x1E4F5A368]);
  }

  return v13;
}

uint64_t __106__CNAvatarImageRenderer_renderAvatarsForContacts_withBadges_scope_placeholder_workScheduler_imageHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) renderedLikenessesForContacts:*(void *)(a1 + 40) withBadges:*(void *)(a1 + 48) scope:a2 placeholder:*(unsigned __int8 *)(a1 + 64) workScheduler:*(void *)(a1 + 56)];
}

- (id)renderedLikenessesForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 placeholder:(BOOL)a6 workScheduler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = a4;
  id v16 = [(CNAvatarImageRenderer *)self renderer];
  id v17 = [v16 renderedLikenessesForContacts:v12 withBadges:v15 scope:v13 workScheduler:v14];

  id v18 = [v17 subscribeOn:v14];

  if (v8)
  {
    id v19 = [(CNAvatarImageRenderer *)self renderer];
    v20 = objc_msgSend(v19, "loadingPlaceholderForContactCount:scope:", objc_msgSend(v12, "count"), v13);

    if (v20)
    {
      id v25 = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      uint64_t v22 = [v18 startWith:v21];

      id v18 = (void *)v22;
    }
    else
    {
      v20 = CNUILogAvatarView();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v13;
        _os_log_error_impl(&dword_18B625000, v20, OS_LOG_TYPE_ERROR, "Loading placeholder is nil for scope: %@", buf, 0xCu);
      }
    }
  }
  id v23 = v18;

  return v23;
}

- (CNUILikenessRendering)renderer
{
  return self->_renderer;
}

- (id)renderAvatarsForContacts:(id)a3 scope:(id)a4 imageHandler:(id)a5
{
  return [(CNAvatarImageRenderer *)self renderAvatarsForContacts:a3 withBadges:0 scope:a4 includePlaceholder:1 imageHandler:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_resolver, 0);
}

- (CNUIPRLikenessResolver)resolver
{
  return self->_resolver;
}

- (id)renderMonogramForContact:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6
{
  id v10 = (void *)MEMORY[0x1E4F1B910];
  id v11 = a5;
  id v12 = a4;
  id v13 = [v10 stringFromContact:a3 style:1002];
  id v14 = [(CNAvatarImageRenderer *)self renderMonogramForString:v13 color:v12 scope:v11 prohibitedSources:a6];

  return v14;
}

- (id)renderMonogramForString:(id)a3 color:(id)a4 scope:(id)a5 prohibitedSources:(int64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [a5 likenessRenderingScope];
  id v13 = [(CNAvatarImageRenderer *)self renderer];
  id v14 = [v13 renderedBasicMonogramForString:v11 color:v10 scope:v12 prohibitedSources:a6];

  return v14;
}

- (id)loadingPlaceholderImageProvider
{
  v3 = [_CNAvatarImageProvider alloc];
  id v4 = [(CNAvatarImageRenderer *)self resolver];
  v5 = [v4 placeholderProviderFactory];
  uint64_t v6 = [v5 loadingPlaceholderProvider];
  BOOL v7 = [(_CNAvatarImageProvider *)v3 initWithLikenessProvider:v6];

  return v7;
}

- (id)placeholderImageProvider
{
  v3 = [_CNAvatarImageProvider alloc];
  id v4 = [(CNAvatarImageRenderer *)self resolver];
  v5 = [v4 placeholderProviderFactory];
  uint64_t v6 = [v5 placeholderProvider];
  BOOL v7 = [(_CNAvatarImageProvider *)v3 initWithLikenessProvider:v6];

  return v7;
}

- (id)imageForAvatarAccessoryView:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CNAvatarImageRenderer *)self schedulerProvider];
  id v9 = [v8 immediateScheduler];

  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__21567;
  id v23 = __Block_byref_object_dispose__21568;
  id v24 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__CNAvatarImageRenderer_imageForAvatarAccessoryView_scope___block_invoke;
  v16[3] = &unk_1E54980C0;
  v16[4] = self;
  id v10 = v6;
  id v17 = v10;
  id v11 = v9;
  id v18 = v11;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__CNAvatarImageRenderer_imageForAvatarAccessoryView_scope___block_invoke_2;
  v15[3] = &unk_1E5498048;
  v15[4] = &v19;
  id v12 = [(CNAvatarImageRenderer *)self runScopeBasedImageObservable:v16 scope:v7 imageHandler:v15];
  [v12 cancel];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v13;
}

id __59__CNAvatarImageRenderer_imageForAvatarAccessoryView_scope___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  v5 = [v3 renderer];
  id v6 = [v5 renderedLikenessForBadge:a1[5] scope:v4 workScheduler:a1[6]];

  id v7 = [v6 subscribeOn:a1[6]];

  return v7;
}

void __59__CNAvatarImageRenderer_imageForAvatarAccessoryView_scope___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)renderedMonogramObservableForString:(id)a3 scope:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CNAvatarImageRenderer *)self renderer];
  id v9 = [MEMORY[0x1E4F5A480] observableWithResult:v7];

  id v10 = [v8 renderedBasicMonogramFromString:v9 scope:v6];

  id v11 = [(CNAvatarImageRenderer *)self schedulerProvider];
  id v12 = [v11 backgroundScheduler];
  id v13 = [v10 subscribeOn:v12];

  return v13;
}

- (id)renderMonogramForString:(id)a3 scope:(id)a4 imageHandler:(id)a5
{
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__CNAvatarImageRenderer_renderMonogramForString_scope_imageHandler___block_invoke;
  v12[3] = &unk_1E5498098;
  v12[4] = self;
  id v13 = v8;
  id v9 = v8;
  id v10 = [(CNAvatarImageRenderer *)self runScopeBasedImageObservable:v12 scope:a4 imageHandler:a5];

  return v10;
}

uint64_t __68__CNAvatarImageRenderer_renderMonogramForString_scope_imageHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) renderedMonogramObservableForString:*(void *)(a1 + 40) scope:a2];
}

- (id)renderAvatarsForContacts:(id)a3 scope:(id)a4 includePlaceholder:(BOOL)a5 imageHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CNAvatarImageRenderer *)self schedulerProvider];
  id v14 = [v13 backgroundScheduler];
  id v15 = [(CNAvatarImageRenderer *)self renderAvatarsForContacts:v12 withBadges:0 scope:v11 placeholder:v6 workScheduler:v14 imageHandler:v10];

  return v15;
}

- (id)renderAvatarsForContacts:(id)a3 withBadges:(id)a4 scope:(id)a5 imageHandler:(id)a6
{
  return [(CNAvatarImageRenderer *)self renderAvatarsForContacts:a3 withBadges:a4 scope:a5 includePlaceholder:1 imageHandler:a6];
}

- (id)renderMonogramForString:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAvatarImageRenderer *)self resolver];
  id v9 = [MEMORY[0x1E4F5A480] observableWithResult:v7];

  id v10 = [v8 basicMonogramObservableFromString:v9 color:0];

  id v11 = [(CNAvatarImageRenderer *)self schedulerProvider];
  id v12 = [v11 backgroundScheduler];
  id v13 = [v10 subscribeOn:v12];

  id v14 = (void *)MEMORY[0x1E4F5A488];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__CNAvatarImageRenderer_renderMonogramForString_handler___block_invoke;
  v19[3] = &unk_1E5498020;
  id v20 = v6;
  id v15 = v6;
  id v16 = [v14 observerWithResultBlock:v19];
  id v17 = [v13 subscribe:v16];

  return v17;
}

void __57__CNAvatarImageRenderer_renderMonogramForString_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[_CNAvatarImageProvider alloc] initWithLikenessProvider:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)renderAvatarsForContacts:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNAvatarImageRenderer *)self resolver];
  id v9 = [(CNAvatarImageRenderer *)self schedulerProvider];
  id v10 = [v9 backgroundScheduler];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__CNAvatarImageRenderer_renderAvatarsForContacts_handler___block_invoke;
  v14[3] = &unk_1E5498C00;
  id v15 = v6;
  id v11 = v6;
  id v12 = [v8 resolveLikenessesForContacts:v7 workScheduler:v10 withContentHandler:v14];

  return v12;
}

void __58__CNAvatarImageRenderer_renderAvatarsForContacts_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "_cn_map:", &__block_literal_global_21581);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

_CNAvatarImageProvider *__58__CNAvatarImageRenderer_renderAvatarsForContacts_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[_CNAvatarImageProvider alloc] initWithLikenessProvider:v2];

  return v3;
}

+ (id)descriptorForRequiredKeys
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1B8F8];
  id v3 = [MEMORY[0x1E4F5A6E8] descriptorForRequiredKeys];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = [NSString stringWithUTF8String:"+[CNAvatarImageRenderer descriptorForRequiredKeys]"];
  id v6 = [v2 descriptorWithKeyDescriptors:v4 description:v5];

  return v6;
}

@end