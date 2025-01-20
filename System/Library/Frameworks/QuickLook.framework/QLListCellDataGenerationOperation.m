@interface QLListCellDataGenerationOperation
- (QLItem)item;
- (QLListCell)cell;
- (QLListCellDataGenerationOperation)initWithListCell:(id)a3 index:(unint64_t)a4 item:(id)a5 delegate:(id)a6;
- (QLListCellDataGenerationOperationDelegate)delegate;
- (unint64_t)index;
- (void)_didDetermineFileSize:(id)a3 fileTypeString:(id)a4;
- (void)_didGenerateThumbnail:(id)a3;
- (void)_finishIfNeeded;
- (void)main;
- (void)setCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setItem:(id)a3;
@end

@implementation QLListCellDataGenerationOperation

- (QLListCellDataGenerationOperation)initWithListCell:(id)a3 index:(unint64_t)a4 item:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)QLListCellDataGenerationOperation;
  id v13 = [(QLListCellDataGenerationOperation *)&v17 init];
  v14 = (QLListCellDataGenerationOperation *)v13;
  if (v13)
  {
    objc_storeWeak((id *)v13 + 33, v10);
    objc_storeWeak((id *)&v14->_cell, v11);
    *(void *)&v14->_didGenerateThumbnail = a4;
    objc_storeWeak((id *)&v14->_item, v12);
    v15 = v14;
  }

  return v14;
}

- (void)main
{
  if ([(QLListCellDataGenerationOperation *)self isCancelled])
  {
    [(QLAsynchronousOperation *)self finish];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
    v4 = [WeakRetained thumbnailGenerator];
    QLCGSizeFromQLItemThumbnailSize();
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__QLListCellDataGenerationOperation_main__block_invoke;
    v15[3] = &unk_2642F5E30;
    v15[4] = self;
    objc_msgSend(v4, "generateThumbnailWithSize:completionBlock:", v15);

    id v5 = objc_loadWeakRetained((id *)&self->_cell);
    v6 = [v5 fetcher];
    v7 = [v6 itemSize];

    id v8 = objc_loadWeakRetained((id *)&self->_cell);
    v9 = [v8 previewItemContentType];

    if (v9)
    {
      id v10 = (void *)MEMORY[0x263F1D920];
      id v11 = objc_loadWeakRetained((id *)&self->_cell);
      id v12 = [v11 previewItemContentType];
      id v13 = [v10 typeWithIdentifier:v12];
      v14 = [v13 localizedDescription];
    }
    else
    {
      v14 = 0;
    }
    [(QLListCellDataGenerationOperation *)self _didDetermineFileSize:v7 fileTypeString:v14];
  }
}

uint64_t __41__QLListCellDataGenerationOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didGenerateThumbnail:a2];
}

- (void)_finishIfNeeded
{
  if (*(&self->super._executing + 1) && *(&self->super._executing + 2)) {
    [(QLAsynchronousOperation *)self finish];
  }
}

- (void)_didGenerateThumbnail:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  [WeakRetained operation:self didGenerateThumbnail:v6];

  id v5 = self;
  objc_sync_enter(v5);
  *(&v5->super._executing + 1) = 1;
  [(QLListCellDataGenerationOperation *)v5 _finishIfNeeded];
  objc_sync_exit(v5);
}

- (void)_didDetermineFileSize:(id)a3 fileTypeString:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  [WeakRetained operation:self didDetermineFileSize:v9 fileTypeString:v6];

  id v8 = self;
  objc_sync_enter(v8);
  *(&v8->super._executing + 2) = 1;
  [(QLListCellDataGenerationOperation *)v8 _finishIfNeeded];
  objc_sync_exit(v8);
}

- (unint64_t)index
{
  return *(void *)&self->_didGenerateThumbnail;
}

- (void)setIndex:(unint64_t)a3
{
  *(void *)&self->_didGenerateThumbnail = a3;
}

- (QLListCell)cell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_index);

  return (QLListCell *)WeakRetained;
}

- (void)setCell:(id)a3
{
}

- (QLItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);

  return (QLItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (QLListCellDataGenerationOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (QLListCellDataGenerationOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_destroyWeak((id *)&self->_cell);

  objc_destroyWeak((id *)&self->_index);
}

@end