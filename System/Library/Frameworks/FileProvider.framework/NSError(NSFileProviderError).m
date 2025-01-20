@interface NSError(NSFileProviderError)
+ (id)fileProviderErrorForCollisionWithItem:()NSFileProviderError;
+ (id)fileProviderErrorForNonExistentItemWithIdentifier:()NSFileProviderError;
+ (id)fileProviderErrorForRejectedDeletionOfItem:()NSFileProviderError;
@end

@implementation NSError(NSFileProviderError)

+ (id)fileProviderErrorForCollisionWithItem:()NSFileProviderError
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13 = @"NSFileProviderErrorItem";
    v14[0] = a3;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    v5 = [v3 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v6 = +[FPError errorWithDomain:@"NSFileProviderErrorDomain" code:-1001 userInfo:v5];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28B00];
    id v11 = 0;
    v12 = [v10 currentHandler];

    [v12 handleFailureInMethod:a2 object:a1 file:@"NSFileProviderExtension.m" lineNumber:1060 description:@"existingItem shouldn't be nil"];
    v6 = 0;
  }

  return v6;
}

+ (id)fileProviderErrorForRejectedDeletionOfItem:()NSFileProviderError
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13 = @"NSFileProviderErrorItem";
    v14[0] = a3;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    v5 = [v3 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v6 = +[FPError errorWithDomain:@"NSFileProviderErrorDomain" code:-1006 userInfo:v5];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28B00];
    id v11 = 0;
    v12 = [v10 currentHandler];

    [v12 handleFailureInMethod:a2 object:a1 file:@"NSFileProviderExtension.m" lineNumber:1075 description:@"updatedVersion shouldn't be nil"];
    v6 = 0;
  }

  return v6;
}

+ (id)fileProviderErrorForNonExistentItemWithIdentifier:()NSFileProviderError
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13 = @"NSFileProviderErrorNonExistentItemIdentifier";
    v14[0] = a3;
    v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a3;
    v5 = [v3 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v6 = +[FPError errorWithDomain:@"NSFileProviderErrorDomain" code:-1005 userInfo:v5];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28B00];
    id v11 = 0;
    v12 = [v10 currentHandler];

    [v12 handleFailureInMethod:a2 object:a1 file:@"NSFileProviderExtension.m" lineNumber:1090 description:@"itemIdentifier shouldn't be nil"];
    v6 = 0;
  }

  return v6;
}

@end