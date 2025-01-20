@interface _UIDocumentSearchListController
+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4;
- (BOOL)hideSearchField;
- (Class)_classForChildren;
- (NSString)queryString;
- (_UIDocumentSearchListController)init;
- (_UIDocumentSearchListController)initWithModel:(id)a3;
- (void)setQueryString:(id)a3;
@end

@implementation _UIDocumentSearchListController

- (Class)_classForChildren
{
  return (Class)objc_opt_class();
}

- (_UIDocumentSearchListController)init
{
  v8[1] = *MEMORY[0x263EF8340];
  v3 = [_UIDocumentPickerSearchContainerModel alloc];
  v8[0] = *MEMORY[0x263F01A78];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v5 = [(_UIDocumentPickerSearchContainerModel *)v3 initWithPickableTypes:v4 mode:1];

  v6 = [(_UIDocumentSearchListController *)self initWithModel:v5];
  return v6;
}

- (_UIDocumentSearchListController)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentSearchListController;
  v6 = [(_UIDocumentListController *)&v9 initWithModel:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    [(_UIDocumentSearchListController *)v7 setRestorationIdentifier:0];
  }

  return v7;
}

- (void)setQueryString:(id)a3
{
}

- (NSString)queryString
{
  return [(_UIDocumentPickerSearchContainerModel *)self->_model queryString];
}

+ (id)viewControllerWithRestorationIdentifierPath:(id)a3 coder:(id)a4
{
  return 0;
}

- (BOOL)hideSearchField
{
  return 1;
}

- (void).cxx_destruct
{
}

@end