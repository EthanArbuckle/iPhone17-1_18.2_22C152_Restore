@interface CNPRUISPosterSnapshotRequest
+ (id)requestForConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5;
+ (id)requestForConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5 windowScene:(id)a6 attachments:(id)a7;
- (CNPRUISPosterSnapshotRequest)initWithWrappedRequest:(id)a3;
- (PRUISPosterSnapshotRequest)wrappedRequest;
@end

@implementation CNPRUISPosterSnapshotRequest

- (void).cxx_destruct
{
}

- (PRUISPosterSnapshotRequest)wrappedRequest
{
  return self->_wrappedRequest;
}

- (CNPRUISPosterSnapshotRequest)initWithWrappedRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNPRUISPosterSnapshotRequest;
  v6 = [(CNPRUISPosterSnapshotRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrappedRequest, a3);
  }

  return v7;
}

+ (id)requestForConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5 windowScene:(id)a6 attachments:(id)a7
{
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_msgSend(a7, "_cn_map:", &__block_literal_global_371);
  Class v15 = (Class)getPRUISPosterSnapshotRequestClass[0]();
  v16 = [v13 wrappedPosterConfiguration];

  v17 = [v12 wrappedDefinition];

  v18 = [(objc_class *)v15 snapshotRequestForPRSPosterConfiguration:v16 definition:v17 interfaceOrientation:a5];

  v19 = (void *)[v18 mutableCopy];
  v20 = [(Class)getPRUISPosterAttachmentConfigurationClass[0]() attachmentConfigurationWithHostWindowScene:v11 attachments:v14];

  [v19 setAttachmentConfiguration:v20];
  v21 = [CNPRUISPosterSnapshotRequest alloc];
  v22 = (void *)[v19 copy];
  v23 = [(CNPRUISPosterSnapshotRequest *)v21 initWithWrappedRequest:v22];

  return v23;
}

uint64_t __112__CNPRUISPosterSnapshotRequest_requestForConfiguration_definition_interfaceOrientation_windowScene_attachments___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attachment];
}

+ (id)requestForConfiguration:(id)a3 definition:(id)a4 interfaceOrientation:(int64_t)a5
{
  v7 = getPRUISPosterSnapshotRequestClass[0];
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)v7();
  id v11 = [v9 wrappedPosterConfiguration];

  id v12 = [v8 wrappedDefinition];

  id v13 = [v10 snapshotRequestForPRSPosterConfiguration:v11 definition:v12 interfaceOrientation:a5];

  v14 = [CNPRUISPosterSnapshotRequest alloc];
  Class v15 = (void *)[v13 copy];
  v16 = [(CNPRUISPosterSnapshotRequest *)v14 initWithWrappedRequest:v15];

  return v16;
}

@end