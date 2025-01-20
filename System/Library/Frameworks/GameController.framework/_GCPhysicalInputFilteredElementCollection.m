@interface _GCPhysicalInputFilteredElementCollection
- (id)_filteredElements;
- (id)elementAtIndex:(unint64_t)a3;
- (id)elementEnumerator;
- (id)elementForAlias:(id)a3;
- (id)initWithCollection:(void *)a3 filter:;
- (unint64_t)count;
@end

@implementation _GCPhysicalInputFilteredElementCollection

- (id)initWithCollection:(void *)a3 filter:
{
  if (a1)
  {
    if (!obj)
    {
      v8 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithCollection_filter_, a1, @"GCPhysicalInputElement.m", 86, @"Invalid parameter not satisfying: %s", "collection != nil");
    }
    objc_storeStrong(a1 + 1, obj);
    objc_storeStrong(a1 + 2, a3);
    v6 = a1;
  }

  return a1;
}

- (id)_filteredElements
{
  if (a1)
  {
    v1 = (void *)a1[3];
    if (v1)
    {
      id v2 = v1;
LABEL_4:
      id v3 = v2;
      goto LABEL_7;
    }
    v4 = a1;
    objc_sync_enter(v4);
    v5 = (void *)v4[3];
    if (!v5)
    {
      uint64_t v7 = [(id)v4[1] count];
      v8 = (void *)[objc_alloc((Class)&off_26D2B4AE0) initWithCapacity:v7];
      if (v7)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          id v10 = (id)[(id)v4[1] elementAtIndex:i];
          id v11 = v10;
          if (!v4[2] || (objc_msgSend(v10, "conformsToProtocol:") & 1) != 0) {
            [v8 addObject:v11];
          }
        }
      }
      v12 = (void *)[v8 copy];
      v13 = (void *)v4[3];
      v4[3] = v12;

      objc_sync_exit(v4);
      id v2 = v12;
      goto LABEL_4;
    }
    id v3 = v5;
    objc_sync_exit(v4);
  }
  else
  {
    id v3 = 0;
  }
LABEL_7:

  return v3;
}

- (unint64_t)count
{
  id v2 = -[_GCPhysicalInputFilteredElementCollection _filteredElements](self);

  return [v2 count];
}

- (id)elementAtIndex:(unint64_t)a3
{
  id v4 = -[_GCPhysicalInputFilteredElementCollection _filteredElements](self);

  return (id)[v4 objectAtIndex:a3];
}

- (id)elementForAlias:(id)a3
{
  id v4 = [(GCPhysicalInputElementCollection *)self->_backingCollection elementForAlias:a3];
  v5 = v4;
  if (self->_filter && !objc_msgSend(v4, "conformsToProtocol:")) {
    id v6 = 0;
  }
  else {
    id v6 = v5;
  }

  return v6;
}

- (id)elementEnumerator
{
  id v2 = -[_GCPhysicalInputFilteredElementCollection _filteredElements](self);

  return (id)[v2 objectEnumerator];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cached_filteredElements, 0);
  objc_storeStrong((id *)&self->_filter, 0);

  objc_storeStrong((id *)&self->_backingCollection, 0);
}

@end