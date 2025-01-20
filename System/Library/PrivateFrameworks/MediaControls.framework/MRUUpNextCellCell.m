@interface MRUUpNextCellCell
- (MPArtworkCatalog)artworkCatalog;
- (MRUUpNextCellCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)subtitle;
- (NSString)title;
- (UIImageView)artworkView;
- (void)prepareForReuse;
- (void)setArtworkCatalog:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MRUUpNextCellCell

- (MRUUpNextCellCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MRUUpNextCellCell;
  return [(MRUUpNextCellCell *)&v5 initWithStyle:3 reuseIdentifier:a4];
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)MRUUpNextCellCell;
  [(MRUUpNextCellCell *)&v2 prepareForReuse];
}

- (void)setArtworkCatalog:(id)a3
{
  objc_super v5 = (MPArtworkCatalog *)a3;
  if (self->_artworkCatalog != v5)
  {
    objc_storeStrong((id *)&self->_artworkCatalog, a3);
    objc_initWeak(&location, self);
    artworkCatalog = self->_artworkCatalog;
    v7 = [(MRUUpNextCellCell *)self imageView];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__MRUUpNextCellCell_setArtworkCatalog___block_invoke;
    v8[3] = &unk_1E5F0EFD8;
    objc_copyWeak(&v9, &location);
    [(MPArtworkCatalog *)artworkCatalog setDestination:v7 configurationBlock:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __39__MRUUpNextCellCell_setArtworkCatalog___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__MRUUpNextCellCell_setArtworkCatalog___block_invoke_2;
  v7[3] = &unk_1E5F0D8E8;
  v7[4] = WeakRetained;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __39__MRUUpNextCellCell_setArtworkCatalog___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:v1];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (UIImageView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end