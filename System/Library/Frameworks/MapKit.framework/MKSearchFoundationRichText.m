@interface MKSearchFoundationRichText
- (BOOL)isRichTextResolved;
- (MKSearchFoundationRichText)initWithString:(id)a3;
- (id)completionHandlers;
- (id)initRichTextTitleWithMapItem:(id)a3 resultsType:(unint64_t)a4;
- (void)_invokeCompletionHandlers;
- (void)loadRichTextWithCompletionHandler:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setFormattedTextPieces:(id)a3;
- (void)setText:(id)a3;
@end

@implementation MKSearchFoundationRichText

- (MKSearchFoundationRichText)initWithString:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKSearchFoundationRichText;
  v5 = [(MKSearchFoundationRichText *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MKSearchFoundationRichText *)v5 setText:v4];
  }

  return v6;
}

- (id)initRichTextTitleWithMapItem:(id)a3 resultsType:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (a4 == 2)
  {
    objc_super v8 = [v6 _geoAddress];
    v9 = [v8 singleLineAddress];
  }
  else if (a4 == 1)
  {
    if ([v6 _hasTransitDisplayName]) {
      [v7 _transitDisplayName];
    }
    else {
    v9 = [v7 name];
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = MKGetMKSearchFoundationResultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v14 = 138477827;
    v15 = v9;
    _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_INFO, "MapItem name: %{private}@", (uint8_t *)&v14, 0xCu);
  }

  v11 = [(MKSearchFoundationRichText *)self initWithString:v9];
  v12 = v11;
  if (v11) {
    [(SFText *)v11 setMaxLines:1];
  }

  return v12;
}

- (void)loadRichTextWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    if (![(MKSearchFoundationRichText *)self isRichTextResolved])
    {
      id v6 = [(MKSearchFoundationRichText *)self completionHandlers];
      v7 = v6;
      if (v6)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __64__MKSearchFoundationRichText_loadRichTextWithCompletionHandler___block_invoke;
        v8[3] = &unk_1E54BCB38;
        id v9 = v6;
        id v10 = v5;
        [(MKSearchFoundationRichText *)self setCompletionHandlers:v8];
      }
      else
      {
        [(MKSearchFoundationRichText *)self setCompletionHandlers:v5];
      }
    }
  }
}

uint64_t __64__MKSearchFoundationRichText_loadRichTextWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKSearchFoundationRichText;
  [(SFText *)&v4 setText:a3];
  [(MKSearchFoundationRichText *)self _invokeCompletionHandlers];
}

- (void)setFormattedTextPieces:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKSearchFoundationRichText;
  [(SFRichText *)&v4 setFormattedTextPieces:a3];
  [(MKSearchFoundationRichText *)self _invokeCompletionHandlers];
}

- (void)_invokeCompletionHandlers
{
  dispatch_block_t block = [(MKSearchFoundationRichText *)self completionHandlers];
  if (block) {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ([(MKSearchFoundationRichText *)self isRichTextResolved]) {
    [(MKSearchFoundationRichText *)self setCompletionHandlers:0];
  }
}

- (BOOL)isRichTextResolved
{
  return 1;
}

- (id)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end