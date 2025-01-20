@interface NSExtensionItem(RPExtensions)
+ (id)itemWithTitle:()RPExtensions attachmentItem:;
@end

@implementation NSExtensionItem(RPExtensions)

+ (id)itemWithTitle:()RPExtensions attachmentItem:
{
  v14[1] = *MEMORY[0x263EF8340];
  v5 = (objc_class *)MEMORY[0x263F08810];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:0];

  [v8 setAttributedTitle:v9];
  id v10 = objc_alloc(MEMORY[0x263F088E0]);
  v11 = (void *)[v10 initWithItem:v6 typeIdentifier:*MEMORY[0x263F01A08]];

  v14[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v8 setAttachments:v12];

  return v8;
}

@end