@interface CPParagraphListItem
- (CPList)list;
- (CPParagraphListItem)init;
- (id)paragraphAtIndex:(unsigned int)a3;
- (int)number;
- (unsigned)paragraphCount;
- (void)addParagraph:(id)a3;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)setList:(id)a3;
- (void)setNumber:(int)a3;
@end

@implementation CPParagraphListItem

- (void)setNumber:(int)a3
{
  self->number = a3;
}

- (int)number
{
  return self->number;
}

- (void)setList:(id)a3
{
}

- (CPList)list
{
  return self->list;
}

- (void)addParagraph:(id)a3
{
  CFArrayAppendValue(self->paragraphs, a3);
  v5 = (CPParagraphListItem *)[a3 listItem];
  if (v5)
  {
    v6 = v5;
    if (v5 != self)
    {
      do
      {
        v7 = (void *)[v6 list];
        uint64_t v8 = [v7 parentItem];
        if ((void *)v8 == v6) {
          v9 = 0;
        }
        else {
          v9 = (CPParagraphListItem *)v8;
        }
        if (v9) {
          BOOL v10 = v9 == self;
        }
        else {
          BOOL v10 = 1;
        }
        v6 = (void *)v8;
      }
      while (!v10);
      if (!v9)
      {
        [v7 setParentItem:self];
      }
    }
  }
  else
  {
    [a3 setListItem:self];
  }
}

- (id)paragraphAtIndex:(unsigned int)a3
{
  return (id)CFArrayGetValueAtIndex(self->paragraphs, a3);
}

- (unsigned)paragraphCount
{
  return CFArrayGetCount(self->paragraphs);
}

- (void)dealloc
{
  [(CPParagraphListItem *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPParagraphListItem;
  [(CPParagraphListItem *)&v3 dealloc];
}

- (void)finalize
{
  [(CPParagraphListItem *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPParagraphListItem;
  [(CPParagraphListItem *)&v3 finalize];
}

- (void)dispose
{
  paragraphs = self->paragraphs;
  if (paragraphs)
  {
    CFRelease(paragraphs);
    self->paragraphs = 0;
  }
}

- (CPParagraphListItem)init
{
  v4.receiver = self;
  v4.super_class = (Class)CPParagraphListItem;
  v2 = [(CPParagraphListItem *)&v4 init];
  if (v2) {
    v2->paragraphs = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  }
  return v2;
}

@end