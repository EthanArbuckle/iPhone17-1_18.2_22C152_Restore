@interface EMContentRepresentation(EDMessagePersistence)
- (id)requestRepresentationForItemWithObjectID:()EDMessagePersistence options:delegate:completionHandler:;
- (id)requestUpdatedRepresentationWithCompletion:()EDMessagePersistence;
@end

@implementation EMContentRepresentation(EDMessagePersistence)

- (id)requestRepresentationForItemWithObjectID:()EDMessagePersistence options:delegate:completionHandler:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [a1 contentMessage];
  v15 = [v14 objectID];
  int v16 = [v10 isEqual:v15];

  if (v16)
  {
    v17 = [a1 contentMessage];
    if (v17) {
      goto LABEL_4;
    }
  }
  v18 = [a1 relatedContentItems];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __125__EMContentRepresentation_EDMessagePersistence__requestRepresentationForItemWithObjectID_options_delegate_completionHandler___block_invoke;
  v25[3] = &unk_1E6C00F78;
  id v19 = v10;
  id v26 = v19;
  v17 = objc_msgSend(v18, "ef_firstObjectPassingTest:", v25);

  if (v17)
  {
LABEL_4:
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __125__EMContentRepresentation_EDMessagePersistence__requestRepresentationForItemWithObjectID_options_delegate_completionHandler___block_invoke_1;
    v23[3] = &unk_1E6C00FA0;
    id v24 = v13;
    v20 = [v17 requestRepresentationWithOptions:v11 delegate:v12 completionHandler:v23];
  }
  else
  {
    v21 = objc_msgSend(MEMORY[0x1E4F28C58], "em_itemNotFoundErrorWithItemID:", v19);
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v21);

    v17 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[EMContentRepresentation(EDMessagePersistence) requestRepresentationForItemWithObjectID:options:delegate:completionHandler:]((uint64_t)v19, v17);
    }
    v20 = 0;
  }

  return v20;
}

- (id)requestUpdatedRepresentationWithCompletion:()EDMessagePersistence
{
  id v4 = a3;
  v5 = [a1 requestMoreContentBlock];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (void)requestRepresentationForItemWithObjectID:()EDMessagePersistence options:delegate:completionHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Failed to find contentItem for objectID: %@", (uint8_t *)&v2, 0xCu);
}

@end