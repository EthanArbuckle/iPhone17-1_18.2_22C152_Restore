@interface CPList
- (BOOL)containsParagraph:(id)a3;
- (BOOL)isMultilevel;
- (CGRect)spacer;
- (CPList)init;
- (CPParagraphListItem)parentItem;
- (id)itemAtIndex:(unsigned int)a3;
- (int)type;
- (unsigned)itemCount;
- (unsigned)ordinalPrefixLength;
- (unsigned)ordinalSuffixLength;
- (void)addItem:(id)a3;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)setOrdinalPrefixLength:(unsigned int)a3;
- (void)setOrdinalSuffixLength:(unsigned int)a3;
- (void)setParentItem:(id)a3;
- (void)setSpacer:(CGRect)a3;
- (void)setType:(int)a3;
@end

@implementation CPList

- (void)setParentItem:(id)a3
{
}

- (CPParagraphListItem)parentItem
{
  return self->parentItem;
}

- (void)setOrdinalSuffixLength:(unsigned int)a3
{
  self->ordinalSuffixLength = a3;
}

- (unsigned)ordinalSuffixLength
{
  return self->ordinalSuffixLength;
}

- (void)setOrdinalPrefixLength:(unsigned int)a3
{
  self->ordinalPrefixLength = a3;
}

- (unsigned)ordinalPrefixLength
{
  return self->ordinalPrefixLength;
}

- (void)setType:(int)a3
{
  self->type = a3;
}

- (int)type
{
  return self->type;
}

- (void)setSpacer:(CGRect)a3
{
  self->spacer = a3;
}

- (CGRect)spacer
{
  double x = self->spacer.origin.x;
  double y = self->spacer.origin.y;
  double width = self->spacer.size.width;
  double height = self->spacer.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isMultilevel
{
  return 0;
}

- (BOOL)containsParagraph:(id)a3
{
  uint64_t v4 = [a3 listItem];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = (CPList *)[v5 list];
      LOBYTE(v4) = v6 == self;
      if (v6 == self) {
        break;
      }
      uint64_t v7 = [(CPList *)v6 parentItem];
      LOBYTE(v4) = 0;
      if (!v7) {
        break;
      }
      BOOL v8 = v7 == (void)v5;
      v5 = (void *)v7;
    }
    while (!v8);
  }
  return v4;
}

- (void)addItem:(id)a3
{
  CFArrayAppendValue(self->items, a3);

  [a3 setList:self];
}

- (id)itemAtIndex:(unsigned int)a3
{
  return (id)CFArrayGetValueAtIndex(self->items, a3);
}

- (unsigned)itemCount
{
  return CFArrayGetCount(self->items);
}

- (void)dealloc
{
  [(CPList *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPList;
  [(CPList *)&v3 dealloc];
}

- (void)finalize
{
  [(CPList *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPList;
  [(CPList *)&v3 finalize];
}

- (void)dispose
{
  items = self->items;
  if (items)
  {
    CFRelease(items);
    self->items = 0;
  }
}

- (CPList)init
{
  v4.receiver = self;
  v4.super_class = (Class)CPList;
  v2 = [(CPList *)&v4 init];
  if (v2) {
    v2->items = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  }
  return v2;
}

@end