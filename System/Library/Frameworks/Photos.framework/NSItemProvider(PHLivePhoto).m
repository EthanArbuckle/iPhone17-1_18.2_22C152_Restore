@interface NSItemProvider(PHLivePhoto)
- (void)initWithLivePhoto:()PHLivePhoto;
@end

@implementation NSItemProvider(PHLivePhoto)

- (void)initWithLivePhoto:()PHLivePhoto
{
  id v4 = a3;
  v5 = (void *)[a1 init];
  if (v5)
  {
    v6 = [(id)*MEMORY[0x1E4F44400] identifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke;
    v13[3] = &unk_1E58461A0;
    id v7 = v4;
    id v14 = v7;
    char v15 = 1;
    [v5 registerItemForTypeIdentifier:v6 loadHandler:v13];

    v8 = [(id)*MEMORY[0x1E4F44420] identifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__NSItemProvider_PHLivePhoto__initWithLivePhoto___block_invoke_3;
    v10[3] = &unk_1E58461A0;
    id v11 = v7;
    char v12 = 1;
    [v5 registerItemForTypeIdentifier:v8 loadHandler:v10];
  }
  return v5;
}

@end