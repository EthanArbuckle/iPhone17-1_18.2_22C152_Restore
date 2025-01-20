@interface SYDocumentAttributes(EDSynapseAttributes)
- (uint64_t)initWithEDAttributes:()EDSynapseAttributes file:;
@end

@implementation SYDocumentAttributes(EDSynapseAttributes)

- (uint64_t)initWithEDAttributes:()EDSynapseAttributes file:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4FA9250]);
  v9 = [v6 senderAddressComment];
  v10 = [v6 senderAddress];
  v11 = (void *)[v8 initWithName:v9 handle:v10];

  v12 = [v6 messagePersistentID];
  v13 = [v6 receivedDate];
  uint64_t v14 = [a1 initWithSourceBundleIdentifier:*MEMORY[0x1E4F5FD38] indexKey:v12 originalFileURL:v7 receivedDate:v13 sender:v11];

  return v14;
}

@end