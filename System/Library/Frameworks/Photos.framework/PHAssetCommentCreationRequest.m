@interface PHAssetCommentCreationRequest
+ (id)changeRequestForAssetComment:(id)a3;
+ (id)creationRequestForAssetCommentLike;
+ (id)creationRequestForAssetCommentWithText:(id)a3;
- (PHAssetComment)comment;
- (PHAssetCommentCreationRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHAssetCommentCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (id)commentText;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (id)isLike;
- (id)managedEntityName;
- (id)placeholderForCreatedAssetComment;
- (void)encodeToXPCDict:(id)a3;
- (void)setComment:(id)a3;
- (void)setCommentText:(id)a3;
- (void)setIsLike:(id)a3;
@end

@implementation PHAssetCommentCreationRequest

- (void).cxx_destruct
{
}

- (void)setComment:(id)a3
{
}

- (PHAssetComment)comment
{
  return self->_comment;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4F8A730];
  id v7 = a3;
  v8 = [(PHAssetCommentCreationRequest *)self commentText];
  v9 = [(PHAssetCommentCreationRequest *)self isLike];
  v10 = objc_msgSend(v6, "insertNewCommentWithCommentText:commentDate:isLike:isMyComment:inLibrary:", v8, 0, objc_msgSend(v9, "BOOLValue"), 1, v7);

  v11 = [(PHChangeRequest *)self uuid];
  [v10 setCloudGUID:v11];

  if (a4 && !v10)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v13 = [NSString stringWithFormat:@"Failed to create cloud shared comment"];
    v17[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)managedEntityName
{
  return @"CloudSharedComment";
}

- (void)setIsLike:(id)a3
{
  id v10 = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"isLike"];

    v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 removeObject:@"isLike"];
  }
  else
  {
    [v6 removeObjectForKey:@"isLike"];

    v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 addObject:@"isLike"];
  }
}

- (id)isLike
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"isLike"];

  return v5;
}

- (void)setCommentText:(id)a3
{
  id v10 = a3;
  v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  v5 = [(PHChangeRequest *)self helper];
  v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"commentText"];

    v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 removeObject:@"commentText"];
  }
  else
  {
    [v6 removeObjectForKey:@"commentText"];

    v8 = [(PHChangeRequest *)self helper];
    v9 = [v8 nilMutations];
    [v9 addObject:@"commentText"];
  }
}

- (id)commentText
{
  +[PHPhotoLibrary assertTransaction];
  v3 = [(PHChangeRequest *)self helper];
  v4 = [v3 mutations];
  v5 = [v4 objectForKey:@"commentText"];

  return v5;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4 = a3;
  id v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];
}

- (PHAssetCommentCreationRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetCommentCreationRequest;
  v11 = [(PHChangeRequest *)&v15 init];
  if (v11)
  {
    v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;
  }
  return v11;
}

- (id)placeholderForCreatedAssetComment
{
  v3 = [(PHChangeRequest *)self helper];
  id v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return v4;
}

- (PHAssetCommentCreationRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHAssetCommentCreationRequest;
  id v8 = [(PHChangeRequest *)&v12 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;
  }
  return v8;
}

- (id)initForNewObject
{
  v6.receiver = self;
  v6.super_class = (Class)PHAssetCommentCreationRequest;
  v2 = [(PHChangeRequest *)&v6 init];
  if (v2)
  {
    v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;
  }
  return v2;
}

+ (id)changeRequestForAssetComment:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [PHAssetCommentCreationRequest alloc];
    id v5 = [v3 uuid];
    objc_super v6 = [v3 objectID];
    id v7 = [(PHAssetCommentCreationRequest *)v4 initWithUUID:v5 objectID:v6];

    [(PHAssetCommentCreationRequest *)v7 setComment:v3];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)creationRequestForAssetCommentLike
{
  id v2 = [[PHAssetCommentCreationRequest alloc] initForNewObject];
  id v3 = [NSNumber numberWithBool:1];
  [v2 setIsLike:v3];

  return v2;
}

+ (id)creationRequestForAssetCommentWithText:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[PHAssetCommentCreationRequest alloc] initForNewObject];
    id v5 = [NSNumber numberWithBool:0];
    [v4 setIsLike:v5];

    [v4 setCommentText:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end