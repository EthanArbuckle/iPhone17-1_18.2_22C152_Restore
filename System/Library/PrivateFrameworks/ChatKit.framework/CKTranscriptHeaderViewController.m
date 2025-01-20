@interface CKTranscriptHeaderViewController
- (BOOL)shouldInvalidateOnAddressBookChange;
- (CKConversation)conversation;
- (CKTranscriptHeaderViewController)initWithConversation:(id)a3;
- (void)setConversation:(id)a3;
@end

@implementation CKTranscriptHeaderViewController

- (CKTranscriptHeaderViewController)initWithConversation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptHeaderViewController;
  v5 = [(CKTranscriptHeaderViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(CKTranscriptHeaderViewController *)v5 setConversation:v4];
  }

  return v6;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (BOOL)shouldInvalidateOnAddressBookChange
{
  return self->_shouldInvalidateOnAddressBookChange;
}

- (void).cxx_destruct
{
}

@end