@interface NSItemProvider(GroupActivities_LinkPresentation)
- (void)registerTUConversationActivityMetadata:()GroupActivities_LinkPresentation;
@end

@implementation NSItemProvider(GroupActivities_LinkPresentation)

- (void)registerTUConversationActivityMetadata:()GroupActivities_LinkPresentation
{
  id v4 = a3;
  v5 = *(void **)CUTWeakLinkSymbol();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__NSItemProvider_GroupActivities_LinkPresentation__registerTUConversationActivityMetadata___block_invoke;
  v8[3] = &unk_1E5B11450;
  id v9 = v4;
  id v6 = v4;
  id v7 = v5;
  [a1 registerItemForTypeIdentifier:v7 loadHandler:v8];
}

@end