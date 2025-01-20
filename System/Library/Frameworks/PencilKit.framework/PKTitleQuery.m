@interface PKTitleQuery
- (CHTitleQuery)titleQuery;
- (NSString)transcribedTitle;
- (PKDrawing)drawing;
- (PKTitleQuery)initWithDrawing:(id)a3;
- (PKTitleQueryDelegate)delegate;
- (void)dealloc;
- (void)pause;
- (void)queryDidUpdateResult:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawing:(id)a3;
- (void)setTitleQuery:(id)a3;
- (void)start;
@end

@implementation PKTitleQuery

- (PKTitleQuery)initWithDrawing:(id)a3
{
  id v5 = a3;
  v6 = [v5 recognitionSession];

  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)PKTitleQuery;
    v7 = [(PKTitleQuery *)&v15 init];
    objc_storeStrong((id *)&v7->_drawing, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F5C0C0]);
    v9 = [(PKTitleQuery *)v7 drawing];
    v10 = [v9 recognitionSession];
    uint64_t v11 = [v8 initWithRecognitionSession:v10];
    titleQuery = v7->_titleQuery;
    v7->_titleQuery = (CHTitleQuery *)v11;

    v13 = [(PKTitleQuery *)v7 titleQuery];
    [v13 setDelegate:v7];

    self = v7;
    v6 = self;
  }

  return v6;
}

- (void)start
{
  id v2 = [(PKTitleQuery *)self titleQuery];
  [v2 start];
}

- (void)pause
{
  id v2 = [(PKTitleQuery *)self titleQuery];
  [v2 pause];
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(CHTitleQuery *)self->_titleQuery setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PKTitleQuery;
  [(PKTitleQuery *)&v3 dealloc];
}

- (NSString)transcribedTitle
{
  id v2 = [(PKTitleQuery *)self titleQuery];
  objc_super v3 = [v2 transcribedTitle];

  return (NSString *)v3;
}

- (void)queryDidUpdateResult:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transcribedTitle];
  v6 = [v4 titleStrokeIdentifiers];
  v7 = [(PKTitleQuery *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __37__PKTitleQuery_queryDidUpdateResult___block_invoke;
    v14 = &unk_1E64C6668;
    id v15 = v6;
    v16 = self;
    id v17 = v5;
    id v8 = v7;
    id v18 = v8;
    v9 = (void (**)(void))_Block_copy(&v11);
    if (objc_opt_respondsToSelector())
    {
      v10 = objc_msgSend(v8, "titleQueryDrawingDispatchQueue:", self, v11, v12, v13, v14, v15, v16, v17);
      dispatch_async(v10, v9);
    }
    else
    {
      v9[2](v9);
    }
  }
}

void __37__PKTitleQuery_queryDidUpdateResult___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "drawing", (void)v19);
        uint64_t v12 = [v10 strokeUUID];
        v13 = [v11 _visibleStrokeForIdentifier:v12];

        [v13 _bounds];
        v27.origin.double x = v14;
        v27.origin.double y = v15;
        v27.size.double width = v16;
        v27.size.double height = v17;
        v25.origin.double x = x;
        v25.origin.double y = y;
        v25.size.double width = width;
        v25.size.double height = height;
        CGRect v26 = CGRectUnion(v25, v27);
        double x = v26.origin.x;
        double y = v26.origin.y;
        double width = v26.size.width;
        double height = v26.size.height;

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  id v18 = -[PKTitleQueryItem initWithTranscribedTitle:bounds:]([PKTitleQueryItem alloc], "initWithTranscribedTitle:bounds:", *(void *)(a1 + 48), x, y, width, height);
  [*(id *)(a1 + 56) titleQuery:*(void *)(a1 + 40) didUpdateWithItem:v18];
}

- (PKTitleQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTitleQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CHTitleQuery)titleQuery
{
  return self->_titleQuery;
}

- (void)setTitleQuery:(id)a3
{
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_titleQuery, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end