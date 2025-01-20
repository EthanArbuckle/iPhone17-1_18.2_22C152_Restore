@interface AKFollowUpController
- (AKFollowUpController)initWithFLFollowupController:(id)a3;
- (BOOL)addFollowUpItems:(id)a3 error:(id *)a4;
- (BOOL)clearNotificationsForItem:(id)a3 error:(id *)a4;
- (BOOL)removeAllFollowUpItems:(id *)a3;
- (BOOL)removeFollowUpItems:(id)a3 error:(id *)a4;
- (BOOL)removeFollowUpItemsWithIdentifiers:(id)a3 error:(id *)a4;
- (id)pendingFollowUpItems:(id *)a3;
@end

@implementation AKFollowUpController

- (AKFollowUpController)initWithFLFollowupController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKFollowUpController;
  v6 = [(AKFollowUpController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_followupController, a3);
  }

  return v7;
}

- (id)pendingFollowUpItems:(id *)a3
{
  return (id)[(FLFollowUpController *)self->_followupController pendingFollowUpItems:a3];
}

- (BOOL)removeAllFollowUpItems:(id *)a3
{
  return [(FLFollowUpController *)self->_followupController clearPendingFollowUpItems:a3];
}

- (BOOL)addFollowUpItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__AKFollowUpController_addFollowUpItems_error___block_invoke;
  v9[3] = &unk_1E5761860;
  v9[4] = self;
  v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  if (a4) {
    *a4 = (id) v11[5];
  }
  BOOL v7 = v11[5] == 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __47__AKFollowUpController_addFollowUpItems_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v5 + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v6 postFollowUpItem:a2 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if ((v8 & 1) == 0) {
    *a4 = 1;
  }
}

- (BOOL)removeFollowUpItems:(id)a3 error:(id *)a4
{
  id v6 = objc_msgSend(a3, "aaf_map:", &__block_literal_global_36);
  LOBYTE(a4) = [(AKFollowUpController *)self removeFollowUpItemsWithIdentifiers:v6 error:a4];

  return (char)a4;
}

id __50__AKFollowUpController_removeFollowUpItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 uniqueIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.authkit.hsa2-password-reset"];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v2 uniqueIdentifier];
  }

  return v5;
}

- (BOOL)removeFollowUpItemsWithIdentifiers:(id)a3 error:(id *)a4
{
  return [(FLFollowUpController *)self->_followupController clearPendingFollowUpItemsWithUniqueIdentifiers:a3 error:a4];
}

- (BOOL)clearNotificationsForItem:(id)a3 error:(id *)a4
{
  return [(FLFollowUpController *)self->_followupController clearNotificationForItem:a3 error:a4];
}

- (void).cxx_destruct
{
}

@end