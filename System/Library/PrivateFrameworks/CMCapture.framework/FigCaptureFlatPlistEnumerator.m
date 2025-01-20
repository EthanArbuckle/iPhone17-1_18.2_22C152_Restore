@interface FigCaptureFlatPlistEnumerator
- (FigCaptureFlatPlistEnumerator)initWithFlatPlist:(id)a3 offset:(unint64_t)a4 count:(unint64_t)a5;
- (id)allObjects;
- (id)nextObject;
@end

@implementation FigCaptureFlatPlistEnumerator

- (id)nextObject
{
  unint64_t index = self->_index;
  if (index >= self->_count) {
    return 0;
  }
  bplist = self->_bplist;
  unint64_t offset = self->_offset;
  self->_unint64_t index = index + 1;
  unint64_t OffsetForObjectAtIndexInObject = FigCaptureBinaryPlistGetOffsetForObjectAtIndexInObject((uint64_t)bplist, offset, index);
  flatPlist = self->_flatPlist;
  return -[FigCaptureFlatPlist objectAtOffset:](flatPlist, OffsetForObjectAtIndexInObject);
}

- (FigCaptureFlatPlistEnumerator)initWithFlatPlist:(id)a3 offset:(unint64_t)a4 count:(unint64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)FigCaptureFlatPlistEnumerator;
  v8 = [(FigCaptureFlatPlistEnumerator *)&v10 init];
  if (v8)
  {
    v8->_flatPlist = (FigCaptureFlatPlist *)a3;
    v8->_bplist = (const $4FA865112F5229015B8A293C0B690A6B *)[a3 bplist];
    v8->_unint64_t offset = a4;
    v8->_count = a5;
    v8->_unint64_t index = 0;
  }
  return v8;
}

- (id)allObjects
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t count = self->_count;
  unint64_t index = self->_index;
  v5 = (char *)v10 - ((8 * (count - index) + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = count - index;
  if (count != index)
  {
    uint64_t v7 = 0;
    do
    {
      unint64_t OffsetForObjectAtIndexInObject = FigCaptureBinaryPlistGetOffsetForObjectAtIndexInObject((uint64_t)self->_bplist, self->_offset, v7 + self->_index);
      *(void *)&v5[8 * v7++] = -[FigCaptureFlatPlist objectAtOffset:](&self->_flatPlist->super.isa, OffsetForObjectAtIndexInObject);
    }
    while (v6 != v7);
    unint64_t count = self->_count;
  }
  self->_unint64_t index = count;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:v6];
}

@end