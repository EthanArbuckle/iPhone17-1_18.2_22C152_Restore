@interface PKSqueezePaletteViewExpandedToolsLayoutContext
- (id)initWithPreviousLayout:(id *)a1;
@end

@implementation PKSqueezePaletteViewExpandedToolsLayoutContext

- (id)initWithPreviousLayout:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PKSqueezePaletteViewExpandedToolsLayoutContext;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
}

@end