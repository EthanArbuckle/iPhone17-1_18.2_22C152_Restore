@interface BRCDirectoryEnumerator
- (id)initForEnumeratingBelow:(id)a3 recursive:(BOOL)a4 error:(int *)a5;
- (id)nextObject;
@end

@implementation BRCDirectoryEnumerator

- (id)initForEnumeratingBelow:(id)a3 recursive:(BOOL)a4 error:(int *)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BRCDirectoryEnumerator;
  v9 = [(BRCDirectoryEnumerator *)&v18 init];
  if (!v9) {
    goto LABEL_4;
  }
  uint64_t v10 = objc_opt_new();
  stack = v9->_stack;
  v9->_stack = (NSMutableArray *)v10;

  v9->_recursive = a4;
  v9->_err = a5;
  int v17 = 0;
  v12 = [[BRCDirectoryBreadthEnumerator alloc] initWithParentPath:v8 error:&v17];
  if (v12)
  {
    v13 = v12;
    [(NSMutableArray *)v9->_stack addObject:v12];

LABEL_4:
    v14 = v9;
    goto LABEL_8;
  }
  err = v9->_err;
  if (err) {
    int *err = v17;
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (id)nextObject
{
  v3 = (void *)MEMORY[0x1D9438760](self, a2);
  if ([(NSMutableArray *)self->_stack count])
  {
    v4 = [(NSMutableArray *)self->_stack lastObject];
    char v14 = 0;
    int v13 = 0;
    v5 = [v4 nextObjectWithIsDir:&v14 error:&v13];
    if (v5)
    {
      if (self->_recursive && v14)
      {
        v6 = [[BRCDirectoryBreadthEnumerator alloc] initWithParentPath:v5 error:&v13];
        v7 = v6;
        if (v13)
        {
          if (v13 != 45)
          {
            err = self->_err;
            if (err) {
              int *err = v13;
            }
          }
        }
        if (v6) {
          [(NSMutableArray *)self->_stack addObject:v6];
        }
      }
      id v9 = v5;
    }
    else
    {
      if (v13)
      {
        v11 = self->_err;
        if (v11) {
          int *v11 = v13;
        }
      }
      [(NSMutableArray *)self->_stack removeLastObject];
      id v9 = [(BRCDirectoryEnumerator *)self nextObject];
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end