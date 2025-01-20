@interface FigCaptureFlatPlistArray
- (FigCaptureFlatPlistArray)initWithFlatPlist:(id)a3 offset:(unint64_t)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation FigCaptureFlatPlistArray

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t OffsetForObjectAtIndexInObject = FigCaptureBinaryPlistGetOffsetForObjectAtIndexInObject((uint64_t)self->_bplist, self->_offset, a3);
  flatPlist = self->_flatPlist;
  return -[FigCaptureFlatPlist objectAtOffset:](flatPlist, OffsetForObjectAtIndexInObject);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureFlatPlistArray;
  [(FigCaptureFlatPlistArray *)&v3 dealloc];
}

- (FigCaptureFlatPlistArray)initWithFlatPlist:(id)a3 offset:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)FigCaptureFlatPlistArray;
  v6 = [(FigCaptureFlatPlistArray *)&v10 init];
  if (v6)
  {
    v6->_flatPlist = (FigCaptureFlatPlist *)a3;
    v7 = ($4FA865112F5229015B8A293C0B690A6B *)[a3 bplist];
    v6->_bplist = v7;
    v6->_offset = a4;
    FigCaptureBinaryPlistGetDataAndCountForObjectAtOffset(v7, a4);
    v6->_count = v8;
  }
  return v6;
}

@end