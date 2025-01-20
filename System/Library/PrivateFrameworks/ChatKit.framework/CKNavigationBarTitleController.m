@interface CKNavigationBarTitleController
- (BOOL)isEditing;
- (CKAvatarPickerViewController)avatarPickerViewController;
- (CKConversation)conversation;
- (CKNavigationBarTitleController)initWithConversation:(id)a3;
- (CKNavigationBarTitleControllerDelegate)delegate;
- (NSArray)leftBarButtonItems;
- (NSArray)rightBarButtonItems;
- (UIBarButtonItem)cancelBarButtonItem;
- (UIBarButtonItem)deleteAllBarButtonItem;
- (_UINavigationBarTitleView)titleView;
- (id)_conversationList;
- (void)_editCancelButtonPressed;
- (void)_pressedAvatarView;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
@end

@implementation CKNavigationBarTitleController

- (CKNavigationBarTitleController)initWithConversation:(id)a3
{
  id v5 = a3;
  v6 = [(CKNavigationBarTitleController *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conversation, a3);
    v8 = [[CKAvatarPickerViewController alloc] initWithConversation:v7->_conversation];
    avatarPickerViewController = v7->_avatarPickerViewController;
    v7->_avatarPickerViewController = v8;

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v7 action:sel__pressedAvatarView];
    [v10 setNumberOfTapsRequired:1];
    v11 = [(CKAvatarPickerViewController *)v7->_avatarPickerViewController view];
    [v11 addGestureRecognizer:v10];

    v12 = (_UINavigationBarTitleView *)objc_alloc_init(MEMORY[0x1E4F43250]);
    titleView = v7->_titleView;
    v7->_titleView = v12;

    [(_UINavigationBarTitleView *)v7->_titleView setHeight:64.0];
    v14 = v7->_titleView;
    v15 = [(CKAvatarPickerViewController *)v7->_avatarPickerViewController view];
    [(_UINavigationBarTitleView *)v14 addSubview:v15];

    [(_UINavigationBarTitleView *)v7->_titleView setPreferredContentAlignment:2];
  }

  return v7;
}

- (void)_pressedAvatarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained avatarViewPressed:self];
}

- (void)_editCancelButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cancelBarButtonItemPressed:self];
}

- (NSArray)leftBarButtonItems
{
  if (self->_editing)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C978]);
    v4 = [(CKNavigationBarTitleController *)self deleteAllBarButtonItem];
    id v5 = (id)objc_msgSend(v3, "initWithObjects:", v4, 0);
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }

  return (NSArray *)v5;
}

- (NSArray)rightBarButtonItems
{
  if (self->_editing)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C978]);
    v4 = [(CKNavigationBarTitleController *)self cancelBarButtonItem];
    id v5 = (id)objc_msgSend(v3, "initWithObjects:", v4, 0);
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }

  return (NSArray *)v5;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_1EDE4CA38 table:@"ChatKit"];
  v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__editCancelButtonPressed];

  return (UIBarButtonItem *)v6;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (CKAvatarPickerViewController)avatarPickerViewController
{
  return self->_avatarPickerViewController;
}

- (_UINavigationBarTitleView)titleView
{
  return self->_titleView;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (UIBarButtonItem)deleteAllBarButtonItem
{
  return self->_deleteAllBarButtonItem;
}

- (CKNavigationBarTitleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKNavigationBarTitleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deleteAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_avatarPickerViewController, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end