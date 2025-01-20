@interface TIKeystrokeRecord
+ (id)keystrokeRecord;
- (NSArray)inlineCompletionBarState;
- (NSArray)predictionBarState;
- (NSString)documentState;
- (NSString)insertedKey;
- (NSString)intendedKey;
- (NSString)touchedKey;
- (TIKeyboardTouchEvent)touch;
- (TIKeystrokeRecord)init;
- (TIPointError)touchError;
- (void)setDocumentState:(id)a3;
- (void)setInlineCompletionBarState:(id)a3;
- (void)setInsertedKey:(id)a3;
- (void)setIntendedKey:(id)a3;
- (void)setPredictionBarState:(id)a3;
- (void)setTouch:(id)a3;
- (void)setTouchError:(id)a3;
- (void)setTouchedKey:(id)a3;
@end

@implementation TIKeystrokeRecord

+ (id)keystrokeRecord
{
  v2 = objc_alloc_init(TIKeystrokeRecord);

  return v2;
}

- (TIKeystrokeRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeystrokeRecord;
  return [(TIKeystrokeRecord *)&v3 init];
}

- (NSString)intendedKey
{
  return self->_intendedKey;
}

- (void)setIntendedKey:(id)a3
{
}

- (TIPointError)touchError
{
  return self->_touchError;
}

- (void)setTouchError:(id)a3
{
}

- (TIKeyboardTouchEvent)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
}

- (NSString)touchedKey
{
  return self->_touchedKey;
}

- (void)setTouchedKey:(id)a3
{
}

- (NSString)insertedKey
{
  return self->_insertedKey;
}

- (void)setInsertedKey:(id)a3
{
}

- (NSString)documentState
{
  return self->_documentState;
}

- (void)setDocumentState:(id)a3
{
}

- (NSArray)predictionBarState
{
  return self->_predictionBarState;
}

- (void)setPredictionBarState:(id)a3
{
}

- (NSArray)inlineCompletionBarState
{
  return self->_inlineCompletionBarState;
}

- (void)setInlineCompletionBarState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineCompletionBarState, 0);
  objc_storeStrong((id *)&self->_predictionBarState, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_insertedKey, 0);
  objc_storeStrong((id *)&self->_touchedKey, 0);
  objc_storeStrong((id *)&self->_touch, 0);
  objc_storeStrong((id *)&self->_touchError, 0);

  objc_storeStrong((id *)&self->_intendedKey, 0);
}

@end