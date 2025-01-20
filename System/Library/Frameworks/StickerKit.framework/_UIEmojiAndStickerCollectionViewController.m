@interface _UIEmojiAndStickerCollectionViewController
+ (id)newInstanceWithConfiguration:(id)a3;
- (NSArray)searchResults;
- (_UIEmojiAndStickerCollectionViewControllerDelegate)delegate;
- (_UIKeyboardEmojiKeyDisplayController)emojiKeyManager;
- (id)configuration;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSearchResults:(id)a3;
@end

@implementation _UIEmojiAndStickerCollectionViewController

+ (id)newInstanceWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(NSClassFromString(&cfstr_Uiemojiandstic.isa)) initWithConfiguration:v3];

  return v4;
}

- (_UIEmojiAndStickerCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UIEmojiAndStickerCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (_UIKeyboardEmojiKeyDisplayController)emojiKeyManager
{
  return self->_emojiKeyManager;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_emojiKeyManager, 0);
  objc_storeStrong(&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end