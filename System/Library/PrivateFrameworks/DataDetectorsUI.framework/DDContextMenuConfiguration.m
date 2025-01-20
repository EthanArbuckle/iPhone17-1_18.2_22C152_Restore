@interface DDContextMenuConfiguration
- (BOOL)expandPreviewOnInteraction;
- (BOOL)performPreviewActionForMenuWithAnimator:(id)a3;
- (BOOL)prefersActionMenuStyle;
- (NSURL)interactionURL;
- (id)interactionViewControllerProvider;
- (void)setExpandPreviewOnInteraction:(BOOL)a3;
- (void)setInteractionURL:(id)a3;
- (void)setInteractionViewControllerProvider:(id)a3;
- (void)setPrefersActionMenuStyle:(BOOL)a3;
@end

@implementation DDContextMenuConfiguration

- (BOOL)performPreviewActionForMenuWithAnimator:(id)a3
{
  id v4 = a3;
  v5 = [(DDContextMenuConfiguration *)self interactionViewControllerProvider];
  if (v5)
  {
    [v4 setPreferredCommitStyle:1];
    v6 = [v4 previewViewController];
    id v7 = [v6 presentingViewController];

    if (v7)
    {
      v8 = v5[2](v5);
      if ([v8 modalPresentationStyle] == 7)
      {
        v9 = [v8 popoverPresentationController];
        v10 = [v9 sourceView];

        if (!v10) {
          [v8 setModalPresentationStyle:0];
        }
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__DDContextMenuConfiguration_performPreviewActionForMenuWithAnimator___block_invoke;
      v15[3] = &unk_1E5A85428;
      id v16 = v7;
      id v17 = v8;
      id v11 = v8;
      id v7 = v7;
      [v4 addAnimations:v15];

      goto LABEL_9;
    }
  }
  else
  {
    id v7 = [(DDContextMenuConfiguration *)self interactionURL];
    if (v7)
    {
      [v4 setPreferredCommitStyle:1];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __70__DDContextMenuConfiguration_performPreviewActionForMenuWithAnimator___block_invoke_2;
      v13[3] = &unk_1E5A853B0;
      id v14 = v7;
      id v7 = v7;
      [v4 addAnimations:v13];
      id v11 = v14;
LABEL_9:

      LOBYTE(v7) = 1;
    }
  }

  return (char)v7;
}

uint64_t __70__DDContextMenuConfiguration_performPreviewActionForMenuWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:0 completion:0];
}

void __70__DDContextMenuConfiguration_performPreviewActionForMenuWithAnimator___block_invoke_2(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F62688];
  v6[0] = *MEMORY[0x1E4F626A0];
  v6[1] = v4;
  v7[0] = MEMORY[0x1E4F1CC38];
  v7[1] = MEMORY[0x1E4F1CC38];
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v2 openSensitiveURL:v3 withOptions:v5 error:0];
}

- (BOOL)prefersActionMenuStyle
{
  return self->prefersActionMenuStyle;
}

- (void)setPrefersActionMenuStyle:(BOOL)a3
{
  self->prefersActionMenuStyle = a3;
}

- (BOOL)expandPreviewOnInteraction
{
  return self->expandPreviewOnInteraction;
}

- (void)setExpandPreviewOnInteraction:(BOOL)a3
{
  self->expandPreviewOnInteraction = a3;
}

- (id)interactionViewControllerProvider
{
  return self->interactionViewControllerProvider;
}

- (void)setInteractionViewControllerProvider:(id)a3
{
}

- (NSURL)interactionURL
{
  return self->interactionURL;
}

- (void)setInteractionURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->interactionURL, 0);
  objc_storeStrong(&self->interactionViewControllerProvider, 0);
}

@end