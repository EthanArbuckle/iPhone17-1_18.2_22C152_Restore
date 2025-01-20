@interface _SFActivityExtensionItemProvider
- (NSExtensionItem)extensionItem;
- (_SFActivityExtensionItemProvider)initWithExtensionItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6;
- (id)_itemForActivityType:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)item;
- (void)setExtensionItem:(id)a3;
@end

@implementation _SFActivityExtensionItemProvider

- (_SFActivityExtensionItemProvider)initWithExtensionItem:(id)a3 URL:(id)a4 pageTitle:(id)a5 webView:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFActivityExtensionItemProvider;
  v12 = [(_SFActivityItemProvider *)&v15 initWithPlaceholderItem:v11 URL:a4 pageTitle:a5 webView:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_extensionItem, a3);
  }

  return v13;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return [(_SFActivityExtensionItemProvider *)self _itemForActivityType:a4];
}

- (id)item
{
  v3 = [(UIActivityItemProvider *)self activityType];
  v4 = [(_SFActivityExtensionItemProvider *)self _itemForActivityType:v3];

  return v4;
}

- (id)_itemForActivityType:(id)a3
{
  v4 = [(UIActivityItemProvider *)self activityType];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F43590]];

  if (v5) {
    v6 = 0;
  }
  else {
    v6 = self->_extensionItem;
  }

  return v6;
}

- (NSExtensionItem)extensionItem
{
  return self->_extensionItem;
}

- (void)setExtensionItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end