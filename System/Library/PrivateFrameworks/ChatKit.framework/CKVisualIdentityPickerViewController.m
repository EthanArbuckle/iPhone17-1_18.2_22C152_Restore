@interface CKVisualIdentityPickerViewController
+ (id)imagePickerForContact:(id)a3;
+ (id)imagePickerForGroupIdentity:(id)a3 withConversation:(id)a4;
- (CKConversation)conversation;
- (CKVisualIdentityPickerViewControllerDelegate)presentationDelegate;
- (void)setConversation:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5;
- (void)visualIdentityPickerDidCancel:(id)a3;
@end

@implementation CKVisualIdentityPickerViewController

+ (id)imagePickerForGroupIdentity:(id)a3 withConversation:(id)a4
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CKVisualIdentityPickerViewController;
  id v5 = a4;
  v6 = objc_msgSendSuper2(&v8, sel_imagePickerForGroupIdentity_, a3);
  objc_msgSend(v6, "setConversation:", v5, v8.receiver, v8.super_class);

  [v6 setDelegate:v6];

  return v6;
}

+ (id)imagePickerForContact:(id)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CKVisualIdentityPickerViewController;
  v3 = objc_msgSendSuper2(&v5, sel_imagePickerForContact_, a3);
  [v3 setDelegate:v3];

  return v3;
}

- (void)visualIdentityPicker:(id)a3 didUpdatePhotoForVisualIdentity:(id)a4 withContactImage:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1BC18] descriptorForRequiredKeys];
  v22[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

  v9 = [(CKVisualIdentityPickerViewController *)self conversation];
  v10 = objc_msgSend(v9, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", v8, objc_msgSend(MEMORY[0x1E4F1BB38], "maxContactAvatars"));
  v11 = [v6 thumbnailImageData];
  v12 = [v10 groupPhoto];
  char v13 = [v11 isEqualToData:v12];

  if ((v13 & 1) == 0)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    v14 = [v9 chat];
    int v15 = [v14 isGroupChat];

    if (v15)
    {
      v16 = [v6 thumbnailImageData];
      +[CKDetailsController saveGroupPhotoDataAndUpdateParticipants:v16 forConversation:v9];
    }
    [v9 setNeedsUpdatedGroupPhotoForVisualIdentity];
  }
  v17 = [v6 name];
  v18 = [v9 displayName];
  char v19 = [v17 isEqualToString:v18];

  if (v19)
  {
    if (v13) {
      goto LABEL_14;
    }
  }
  else
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    v20 = [v6 name];
    [v9 setDisplayName:v20];

    [v9 setNeedsUpdatedGroupNameForVisualIdentity];
  }
  [v9 setGroupIdentityUpdateHandleID:0];
LABEL_14:
  v21 = [(CKVisualIdentityPickerViewController *)self presentationDelegate];
  [v21 visualIdentityPickerDidFinish:self];
}

- (void)visualIdentityPickerDidCancel:(id)a3
{
  id v4 = [(CKVisualIdentityPickerViewController *)self presentationDelegate];
  [v4 visualIdentityPickerDidFinish:self];
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (CKVisualIdentityPickerViewControllerDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);

  return (CKVisualIdentityPickerViewControllerDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationDelegate);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end