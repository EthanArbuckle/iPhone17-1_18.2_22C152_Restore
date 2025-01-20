@interface _LTParagraphTranslationRequest
- (BOOL)_canUseTextService;
- (NSArray)ranges;
- (NSString)text;
- (id)completionHandler;
- (id)loggingType;
- (id)translationParagraph;
- (void)_startTranslationWithTextService:(id)a3 done:(id)a4;
- (void)_translationFailedWithError:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setRanges:(id)a3;
- (void)setText:(id)a3;
@end

@implementation _LTParagraphTranslationRequest

- (id)loggingType
{
  return @"paragraph";
}

- (BOOL)_canUseTextService
{
  return 1;
}

- (void)_startTranslationWithTextService:(id)a3 done:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (*(_OWORD *)&self->_text == 0)
  {
    v14 = (void *)MEMORY[0x263F087E8];
    v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 localizedStringForKey:@"INVALID_REQUEST_NO_RANGES_OR_TEXT_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
    objc_msgSend(v14, "lt_invalidRequestErrorWithDescription:", v16);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();

    [(_LTParagraphTranslationRequest *)self _translationFailedWithError:v17];
    v7[2](v7);
  }
  else
  {
    v17 = self->_text;
    if (self->_ranges)
    {
      v8 = [MEMORY[0x263F089D8] string];
      ranges = self->_ranges;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __72___LTParagraphTranslationRequest__startTranslationWithTextService_done___block_invoke;
      v22[3] = &unk_2651DBF78;
      id v10 = v8;
      id v23 = v10;
      [(NSArray *)ranges enumerateObjectsUsingBlock:v22];
      id v11 = v10;

      v17 = (NSString *)v11;
    }
    v12 = [(_LTTranslationRequest *)self requestContext];
    v13 = [(_LTParagraphTranslationRequest *)self translationParagraph];
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72___LTParagraphTranslationRequest__startTranslationWithTextService_done___block_invoke_2;
    v18[3] = &unk_2651DBFA0;
    objc_copyWeak(&v20, &location);
    v19 = v7;
    [v6 translate:v13 withContext:v12 completion:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

- (void)_translationFailedWithError:(id)a3
{
  completionHandler = (void (**)(id, void, id))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, 0, a3);
  }
}

- (id)translationParagraph
{
  v3 = self->_text;
  v4 = [MEMORY[0x263EFF980] array];
  if (self->_ranges)
  {
    v5 = [MEMORY[0x263F089D8] string];
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    ranges = self->_ranges;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54___LTParagraphTranslationRequest_translationParagraph__block_invoke;
    v13[3] = &unk_2651DBFC8;
    v16 = v17;
    id v14 = v4;
    id v7 = v5;
    id v15 = v7;
    [(NSArray *)ranges enumerateObjectsUsingBlock:v13];
    id v8 = v7;

    _Block_object_dispose(v17, 8);
    v3 = (NSString *)v8;
  }
  v9 = [_LTTranslationParagraph alloc];
  id v10 = [(_LTTranslationRequest *)self uniqueID];
  id v11 = [(_LTTranslationParagraph *)v9 initWithIdentifier:v10 text:v3 spans:v4 isFinal:[(_LTTranslationRequest *)self isFinal]];

  return v11;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSArray)ranges
{
  return self->_ranges;
}

- (void)setRanges:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_ranges, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end