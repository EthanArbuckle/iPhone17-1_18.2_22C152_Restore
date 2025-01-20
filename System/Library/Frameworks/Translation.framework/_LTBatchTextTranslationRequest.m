@interface _LTBatchTextTranslationRequest
- (NSArray)paragraphs;
- (id)loggingType;
- (id)textHandler;
- (id)translationHandler;
- (void)_startTranslationWithService:(id)a3 done:(id)a4;
- (void)_translationFailedWithError:(id)a3;
- (void)setParagraphs:(id)a3;
- (void)setTextHandler:(id)a3;
- (void)setTranslationHandler:(id)a3;
@end

@implementation _LTBatchTextTranslationRequest

- (id)loggingType
{
  return @"batch";
}

- (void)_startTranslationWithService:(id)a3 done:(id)a4
{
  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_LTBatchTextTranslationRequest _startTranslationWithService:done:]();
  }
}

- (void)_translationFailedWithError:(id)a3
{
  id v4 = a3;
  translationHandler = (void (**)(id, void, id))self->_translationHandler;
  id v7 = v4;
  if (translationHandler) {
    translationHandler[2](translationHandler, 0, v4);
  }
  textHandler = (void (**)(id, void, id))self->_textHandler;
  if (textHandler) {
    textHandler[2](textHandler, MEMORY[0x263EFFA68], v7);
  }

  MEMORY[0x270F9A790]();
}

- (NSArray)paragraphs
{
  return self->_paragraphs;
}

- (void)setParagraphs:(id)a3
{
}

- (id)textHandler
{
  return self->_textHandler;
}

- (void)setTextHandler:(id)a3
{
}

- (id)translationHandler
{
  return self->_translationHandler;
}

- (void)setTranslationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_translationHandler, 0);
  objc_storeStrong(&self->_textHandler, 0);

  objc_storeStrong((id *)&self->_paragraphs, 0);
}

- (void)_startTranslationWithService:done:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
}

@end