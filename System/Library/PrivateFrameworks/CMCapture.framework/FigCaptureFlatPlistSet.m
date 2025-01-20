@interface FigCaptureFlatPlistSet
- (FigCaptureFlatPlistSet)initWithFlatPlist:(id)a3 offset:(unint64_t)a4;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation FigCaptureFlatPlistSet

- (FigCaptureFlatPlistSet)initWithFlatPlist:(id)a3 offset:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)FigCaptureFlatPlistSet;
  v6 = [(FigCaptureFlatPlistSet *)&v10 init];
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureFlatPlistSet;
  [(FigCaptureFlatPlistSet *)&v3 dealloc];
}

- (unint64_t)count
{
  return self->_count;
}

- (id)member:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t IndexForStringInObject = FigCaptureBinaryPlistFindIndexForStringInObject((uint64_t)self->_bplist, self->_offset, (const char *)[a3 UTF8String], objc_msgSend(a3, "length"));
    if ((IndexForStringInObject & 0x8000000000000000) != 0) {
      return 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    unint64_t IndexForStringInObject = FigCaptureBinaryPlistFindIndexForIntInObject((uint64_t)self->_bplist, self->_offset, [a3 longLongValue]);
    if ((IndexForStringInObject & 0x8000000000000000) != 0) {
      return 0;
    }
  }
  unint64_t OffsetForObjectAtIndexInObject = FigCaptureBinaryPlistGetOffsetForObjectAtIndexInObject((uint64_t)self->_bplist, self->_offset, IndexForStringInObject);
  flatPlist = self->_flatPlist;
  return -[FigCaptureFlatPlist objectAtOffset:](flatPlist, OffsetForObjectAtIndexInObject);
}

- (id)objectEnumerator
{
  v2 = [[FigCaptureFlatPlistEnumerator alloc] initWithFlatPlist:self->_flatPlist offset:self->_offset count:self->_count];
  return v2;
}

@end