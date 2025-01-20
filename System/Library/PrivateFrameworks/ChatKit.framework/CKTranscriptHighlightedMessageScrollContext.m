@interface CKTranscriptHighlightedMessageScrollContext
- (BOOL)allowOverScroll;
- (CKTranscriptHighlightedMessageScrollContext)initWithMessageGUID:(id)a3 messagePartIndex:(int64_t)a4 viewToAlignWith:(id)a5 allowOverScroll:(BOOL)a6 scrollPosition:(unint64_t)a7;
- (NSString)messageGUID;
- (UIView)viewToAlignWith;
- (int64_t)messagePartIndex;
- (unint64_t)scrollPosition;
@end

@implementation CKTranscriptHighlightedMessageScrollContext

- (CKTranscriptHighlightedMessageScrollContext)initWithMessageGUID:(id)a3 messagePartIndex:(int64_t)a4 viewToAlignWith:(id)a5 allowOverScroll:(BOOL)a6 scrollPosition:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CKTranscriptHighlightedMessageScrollContext;
  v14 = [(CKTranscriptHighlightedMessageScrollContext *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    messageGUID = v14->_messageGUID;
    v14->_messageGUID = (NSString *)v15;

    v14->_messagePartIndex = a4;
    objc_storeWeak((id *)&v14->_viewToAlignWith, v13);
    v14->_allowOverScroll = a6;
    v14->_scrollPosition = a7;
  }

  return v14;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (int64_t)messagePartIndex
{
  return self->_messagePartIndex;
}

- (UIView)viewToAlignWith
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewToAlignWith);

  return (UIView *)WeakRetained;
}

- (BOOL)allowOverScroll
{
  return self->_allowOverScroll;
}

- (unint64_t)scrollPosition
{
  return self->_scrollPosition;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewToAlignWith);

  objc_storeStrong((id *)&self->_messageGUID, 0);
}

@end