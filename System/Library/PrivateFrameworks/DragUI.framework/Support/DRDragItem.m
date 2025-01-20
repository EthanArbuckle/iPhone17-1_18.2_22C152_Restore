@interface DRDragItem
- (DRDragItem)initWithPasteboardItem:(id)a3;
- (PBItem)pasteboardItem;
@end

@implementation DRDragItem

- (DRDragItem)initWithPasteboardItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DRDragItem;
  v6 = [(DRDragItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pasteboardItem, a3);
  }

  return v7;
}

- (PBItem)pasteboardItem
{
  return self->_pasteboardItem;
}

- (void).cxx_destruct
{
}

@end