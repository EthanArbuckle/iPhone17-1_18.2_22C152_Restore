@interface PKPaletteToolImageContentView
- (uint64_t)initWithImageView:(uint64_t)a1;
- (void)_updateUI;
- (void)setSelectedView:(uint64_t)a1;
@end

@implementation PKPaletteToolImageContentView

- (uint64_t)initWithImageView:(uint64_t)a1
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    v22.receiver = (id)a1;
    v22.super_class = (Class)PKPaletteToolImageContentView;
    v5 = (id *)objc_msgSendSuper2(&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    a1 = (uint64_t)v5;
    if (v5)
    {
      objc_storeStrong(v5 + 52, a2);
      *(unsigned char *)(a1 + 408) = 0;
      v6 = *(void **)(a1 + 424);
      *(void *)(a1 + 424) = 0;

      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(id)a1 addSubview:v4];
      v16 = (void *)MEMORY[0x1E4F28DC8];
      v21 = [v4 topAnchor];
      v20 = [(id)a1 topAnchor];
      v19 = [v21 constraintEqualToAnchor:v20];
      v23[0] = v19;
      v18 = [v4 leadingAnchor];
      v17 = [(id)a1 leadingAnchor];
      v7 = [v18 constraintEqualToAnchor:v17];
      v23[1] = v7;
      v8 = [v4 trailingAnchor];
      v9 = [(id)a1 trailingAnchor];
      v10 = [v8 constraintEqualToAnchor:v9];
      v23[2] = v10;
      v11 = [v4 bottomAnchor];
      v12 = [(id)a1 bottomAnchor];
      v13 = [v11 constraintEqualToAnchor:v12];
      v23[3] = v13;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
      [v16 activateConstraints:v14];

      -[PKPaletteToolImageContentView _updateUI](a1);
    }
  }

  return a1;
}

- (void)_updateUI
{
  if (a1)
  {
    [*(id *)(a1 + 416) setHidden:0];
    v2 = *(void **)(a1 + 424);
    if (*(unsigned char *)(a1 + 408))
    {
      if (v2)
      {
        [*(id *)(a1 + 416) setHidden:1];
        v3 = [*(id *)(a1 + 424) superview];

        if (v3 != (void *)a1)
        {
          [(id)a1 setNeedsLayout];
          id v4 = (void *)MEMORY[0x1E4FB1EB0];
          uint64_t v12 = MEMORY[0x1E4F143A8];
          uint64_t v13 = 3221225472;
          v14 = __42__PKPaletteToolImageContentView__updateUI__block_invoke;
          v15 = &unk_1E64C61C0;
          uint64_t v16 = a1;
          v5 = &v12;
LABEL_9:
          objc_msgSend(v4, "performWithoutAnimation:", v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
    }
    else if (v2)
    {
      v6 = [v2 superview];

      if (v6 == (void *)a1)
      {
        id v4 = (void *)MEMORY[0x1E4FB1EB0];
        uint64_t v7 = MEMORY[0x1E4F143A8];
        uint64_t v8 = 3221225472;
        v9 = __42__PKPaletteToolImageContentView__updateUI__block_invoke_2;
        v10 = &unk_1E64C61C0;
        uint64_t v11 = a1;
        v5 = &v7;
        goto LABEL_9;
      }
    }
  }
}

- (void)setSelectedView:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 424);
    if (v5 != v4)
    {
      v6 = [v5 superview];

      if (v6 == (void *)a1)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __49__PKPaletteToolImageContentView_setSelectedView___block_invoke;
        v7[3] = &unk_1E64C61C0;
        v7[4] = a1;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
      }
      objc_storeStrong((id *)(a1 + 424), a2);
      -[PKPaletteToolImageContentView _updateUI](a1);
    }
  }
}

uint64_t __49__PKPaletteToolImageContentView_setSelectedView___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
}

uint64_t __42__PKPaletteToolImageContentView__updateUI__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 424)];
  [*(id *)(*(void *)(a1 + 32) + 424) setTranslatesAutoresizingMaskIntoConstraints:0];
  v2 = (void *)MEMORY[0x1E4F28DC8];
  v3 = [*(id *)(*(void *)(a1 + 32) + 424) centerXAnchor];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 416) centerXAnchor];
  id v5 = [v3 constraintEqualToAnchor:v4];
  v11[0] = v5;
  v6 = [*(id *)(*(void *)(a1 + 32) + 424) centerYAnchor];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 416) centerYAnchor];
  uint64_t v8 = [v6 constraintEqualToAnchor:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v2 activateConstraints:v9];

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __42__PKPaletteToolImageContentView__updateUI__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end