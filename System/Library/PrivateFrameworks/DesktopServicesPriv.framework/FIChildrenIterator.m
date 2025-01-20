@interface FIChildrenIterator
- (BOOL)fullyPopulated;
- (BOOL)includeInvisible;
- (FIChildrenIterator)initWithChildren:(id)a3 fullyPopulated:(BOOL)a4 options:(unsigned int)a5;
- (NSArray)children;
- (id)first;
- (id)next;
- (unint64_t)estimatedSize;
- (unint64_t)index;
- (void)setChildren:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation FIChildrenIterator

- (FIChildrenIterator)initWithChildren:(id)a3 fullyPopulated:(BOOL)a4 options:(unsigned int)a5
{
  char v5 = a5;
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIChildrenIterator;
  v9 = [(FIChildrenIterator *)&v11 init];
  [(FIChildrenIterator *)v9 setChildren:v8];
  v9->_includeInvisible = (v5 & 4) == 0;
  v9->_fullyPopulated = a4;

  return v9;
}

- (id)first
{
  self->_index = 0;
  return [(FIChildrenIterator *)self next];
}

- (id)next
{
  id v3 = 0;
  while (1)
  {
    unint64_t index = self->_index;
    if (index >= [(NSArray *)self->_children count]) {
      break;
    }
    children = self->_children;
    ++self->_index;
    v6 = -[NSArray objectAtIndexedSubscript:](children, "objectAtIndexedSubscript:");

    if (!self->_includeInvisible)
    {
      id v3 = v6;
      if (![v6 isVisible]) {
        continue;
      }
    }
    id v3 = v6;
    v7 = v3;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)fullyPopulated
{
  return self->_fullyPopulated;
}

- (unint64_t)estimatedSize
{
  return [(NSArray *)self->_children count];
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)includeInvisible
{
  return self->_includeInvisible;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_unint64_t index = a3;
}

- (void).cxx_destruct
{
}

@end