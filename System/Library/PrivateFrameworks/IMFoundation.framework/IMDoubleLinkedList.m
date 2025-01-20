@interface IMDoubleLinkedList
- (BOOL)containsObject:(id)a3;
- (IMDoubleLinkedList)init;
- (IMDoubleLinkedListNode)first;
- (IMDoubleLinkedListNode)last;
- (id)allObjects;
- (id)popObject;
- (unint64_t)count;
- (void)appendLinkedListNode:(id)a3;
- (void)appendObject:(id)a3;
- (void)dealloc;
- (void)pushLinkedListNode:(id)a3;
- (void)pushObject:(id)a3;
- (void)removeAllObjects;
- (void)removeLinkedListNode:(id)a3;
- (void)setFirst:(id)a3;
- (void)setLast:(id)a3;
@end

@implementation IMDoubleLinkedList

- (IMDoubleLinkedList)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMDoubleLinkedList;
  result = [(IMDoubleLinkedList *)&v3 init];
  if (result) {
    result->_count = 0;
  }
  return result;
}

- (void)dealloc
{
  objc_msgSend_removeAllObjects(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)IMDoubleLinkedList;
  [(IMDoubleLinkedList *)&v5 dealloc];
}

- (void)appendObject:(id)a3
{
  id v4 = a3;
  objc_super v5 = [IMDoubleLinkedListNode alloc];
  id v10 = (id)objc_msgSend_initWithObject_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend_appendLinkedListNode_(self, v8, (uint64_t)v10, v9);
}

- (void)pushObject:(id)a3
{
  id v4 = a3;
  objc_super v5 = [IMDoubleLinkedListNode alloc];
  id v10 = (id)objc_msgSend_initWithObject_(v5, v6, (uint64_t)v4, v7);

  objc_msgSend_pushLinkedListNode_(self, v8, (uint64_t)v10, v9);
}

- (id)popObject
{
  last = self->_last;
  if (last)
  {
    v6 = objc_msgSend_object(last, a2, v2, v3);
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend_removeLinkedListNode_(self, a2, (uint64_t)self->_last, v3);
  return v6;
}

- (void)appendLinkedListNode:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v35[0] = xmmword_1E57231C8;
    v35[1] = *(_OWORD *)off_1E57231D8;
    uint64_t v36 = 82;
    v8 = NSString;
    uint64_t v9 = IMFileLocationTrimFileName(v35);
    uint64_t v10 = v36;
    v13 = objc_msgSend_stringWithFormat_(NSString, v11, (uint64_t)&stru_1EE231AD8, v12);
    v16 = objc_msgSend_stringWithFormat_(v8, v14, @"Unexpected nil '%@' in %s at %s:%d. %@", v15, @"node", "-[IMDoubleLinkedList appendLinkedListNode:]", v9, v10, v13);

    v17 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v17) {
      v17(v16);
    }
    else {
      _IMWarn(@"ASSERTION FAILED: %@", v18, v19, v20, v21, v22, v23, v24, (char)v16);
    }
  }
  p_last = (uint64_t *)&self->_last;
  last = self->_last;
  if (last)
  {
    objc_msgSend_setNext_(last, v5, (uint64_t)v7, v6);
    objc_msgSend_setPrev_(v7, v27, *p_last, v28);
    p_first = &self->_last;
  }
  else
  {
    objc_storeStrong((id *)&self->_last, a3);
    first = self->_first;
    if (first)
    {
      objc_msgSend_setNext_(first, v30, *p_last, v31);
      objc_msgSend_setPrev_((void *)*p_last, v33, (uint64_t)self->_first, v34);
      goto LABEL_11;
    }
    p_first = &self->_first;
  }
  objc_storeStrong((id *)p_first, a3);
LABEL_11:
  ++self->_count;
}

- (void)pushLinkedListNode:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v35[0] = xmmword_1E57231F0;
    v35[1] = *(_OWORD *)off_1E5723200;
    uint64_t v36 = 102;
    v8 = NSString;
    uint64_t v9 = IMFileLocationTrimFileName(v35);
    uint64_t v10 = v36;
    v13 = objc_msgSend_stringWithFormat_(NSString, v11, (uint64_t)&stru_1EE231AD8, v12);
    v16 = objc_msgSend_stringWithFormat_(v8, v14, @"Unexpected nil '%@' in %s at %s:%d. %@", v15, @"node", "-[IMDoubleLinkedList pushLinkedListNode:]", v9, v10, v13);

    v17 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v17) {
      v17(v16);
    }
    else {
      _IMWarn(@"ASSERTION FAILED: %@", v18, v19, v20, v21, v22, v23, v24, (char)v16);
    }
  }
  p_first = (uint64_t *)&self->_first;
  first = self->_first;
  if (first)
  {
    objc_msgSend_setPrev_(first, v5, (uint64_t)v7, v6);
    objc_msgSend_setNext_(v7, v27, *p_first, v28);
    p_last = &self->_first;
  }
  else
  {
    objc_storeStrong((id *)&self->_first, a3);
    last = self->_last;
    if (last)
    {
      objc_msgSend_setPrev_(last, v30, *p_first, v31);
      objc_msgSend_setNext_((void *)*p_first, v33, (uint64_t)self->_last, v34);
      goto LABEL_11;
    }
    p_last = &self->_last;
  }
  objc_storeStrong((id *)p_last, a3);
LABEL_11:
  ++self->_count;
}

- (void)removeLinkedListNode:(id)a3
{
  id v4 = (IMDoubleLinkedListNode *)a3;
  v8 = v4;
  if (v4)
  {
    if (self->_first == v4)
    {
      objc_msgSend_next(v4, v5, v6, v7);
      uint64_t v9 = (IMDoubleLinkedListNode *)objc_claimAutoreleasedReturnValue();
      first = self->_first;
      self->_first = v9;
    }
    if (self->_last == v8)
    {
      objc_msgSend_prev(v8, v5, v6, v7);
      v11 = (IMDoubleLinkedListNode *)objc_claimAutoreleasedReturnValue();
      last = self->_last;
      self->_last = v11;
    }
    objc_msgSend_removeFromList(v8, v5, v6, v7);
    objc_msgSend_setObject_(v8, v13, 0, v14);
    --self->_count;
  }
  else
  {
    v32[0] = xmmword_1E5723218;
    v32[1] = *(_OWORD *)off_1E5723228;
    uint64_t v33 = 122;
    uint64_t v15 = NSString;
    v16 = IMFileLocationTrimFileName(v32);
    uint64_t v17 = v33;
    uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v18, (uint64_t)&stru_1EE231AD8, v19);
    uint64_t v23 = objc_msgSend_stringWithFormat_(v15, v21, @"Unexpected nil '%@' in %s at %s:%d. %@", v22, @"node", "-[IMDoubleLinkedList removeLinkedListNode:]", v16, v17, v20);

    uint64_t v24 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v24) {
      v24(v23);
    }
    else {
      _IMWarn(@"ASSERTION FAILED: %@", v25, v26, v27, v28, v29, v30, v31, (char)v23);
    }
  }
}

- (void)removeAllObjects
{
  first = self->_first;
  if (first)
  {
    id v4 = first;
    do
    {
      objc_super v5 = v4;
      objc_msgSend_next(v5, v6, v7, v8);
      id v4 = (IMDoubleLinkedListNode *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_orphan(v5, v9, v10, v11);
    }
    while (v4);
    uint64_t v12 = self->_first;
    self->_first = 0;

    last = self->_last;
    self->_last = 0;

    self->_count = 0;
  }
}

- (id)allObjects
{
  if (self->_count)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = objc_msgSend_initWithCapacity_(v3, v4, self->_count, v5);
    uint64_t v7 = self->_first;
    if (v7)
    {
      uint64_t v11 = v7;
      do
      {
        uint64_t v12 = objc_msgSend_object(v11, v8, v9, v10);
        objc_msgSend_addObject_(v6, v13, (uint64_t)v12, v14);

        uint64_t v18 = objc_msgSend_next(v11, v15, v16, v17);

        uint64_t v11 = (void *)v18;
      }
      while (v18);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self->_first;
  if (v8)
  {
    while (1)
    {
      uint64_t v9 = objc_msgSend_object(v8, v5, v6, v7);
      if ((id)v9 == v4) {
        break;
      }
      uint64_t v12 = (void *)v9;
      if (objc_msgSend_isEqual_(v4, v10, v9, v11)) {
        goto LABEL_7;
      }
      uint64_t v16 = objc_msgSend_next(v8, v13, v14, v15);

      uint64_t v8 = (IMDoubleLinkedListNode *)v16;
      if (!v16) {
        goto LABEL_8;
      }
    }
    uint64_t v12 = v4;
LABEL_7:

    LOBYTE(v8) = 1;
  }
LABEL_8:

  return (char)v8;
}

- (IMDoubleLinkedListNode)first
{
  return (IMDoubleLinkedListNode *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirst:(id)a3
{
}

- (IMDoubleLinkedListNode)last
{
  return (IMDoubleLinkedListNode *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLast:(id)a3
{
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_last, 0);
  objc_storeStrong((id *)&self->_first, 0);
}

@end