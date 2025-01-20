@interface IOSObjectArray
+ (IOSObjectArray)arrayWithArray:(id)a3;
+ (IOSObjectArray)arrayWithDimensions:(unint64_t)a3 lengths:(const int *)a4 type:(id)a5;
+ (IOSObjectArray)arrayWithLength:(unint64_t)a3 type:(id)a4;
+ (IOSObjectArray)arrayWithNSArray:(id)a3 type:(id)a4;
+ (IOSObjectArray)arrayWithObjects:(const void *)a3 count:(unint64_t)a4 type:(id)a5;
+ (id)newArrayWithDimensions:(unint64_t)a3 lengths:(const int *)a4 type:(id)a5;
+ (id)newArrayWithLength:(unint64_t)a3 type:(id)a4;
+ (id)newArrayWithObjects:(const void *)a3 count:(unint64_t)a4 type:(id)a5;
- (IOSClass)elementType;
- (IOSObjectArray)retain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
- (void)dealloc;
- (void)getObjects:(id *)a3 length:(unint64_t)a4;
@end

@implementation IOSObjectArray

+ (id)newArrayWithLength:(unint64_t)a3 type:(id)a4
{
  return sub_100177508(a3, (uint64_t)a4, 1);
}

+ (IOSObjectArray)arrayWithLength:(unint64_t)a3 type:(id)a4
{
  return (IOSObjectArray *)sub_100177508(a3, (uint64_t)a4, 0);
}

+ (id)newArrayWithObjects:(const void *)a3 count:(unint64_t)a4 type:(id)a5
{
  return sub_1001775C8(a4, (uint64_t)a5, 1, (void **)a3);
}

+ (IOSObjectArray)arrayWithObjects:(const void *)a3 count:(unint64_t)a4 type:(id)a5
{
  int v5 = a4;
  v7 = (IOSObjectArray *)sub_100177508(a4, (uint64_t)a5, 0);
  memcpy(&v7->elementType_, a3, 8 * v5);
  return v7;
}

+ (IOSObjectArray)arrayWithArray:(id)a3
{
  return +[IOSObjectArray arrayWithObjects:(char *)a3 + 24 count:*((int *)a3 + 2) type:*((void *)a3 + 2)];
}

+ (IOSObjectArray)arrayWithNSArray:(id)a3 type:(id)a4
{
  id v6 = [a3 count];
  v7 = (IOSObjectArray *)sub_100177508(v6, (uint64_t)a4, 0);
  objc_msgSend(a3, "getObjects:range:", &v7->elementType_, 0, v6);
  return v7;
}

+ (IOSObjectArray)arrayWithDimensions:(unint64_t)a3 lengths:(const int *)a4 type:(id)a5
{
  id v5 = IOSArray_NewArrayWithDimensions(a1, a3, (unsigned int *)a4);
  return (IOSObjectArray *)v5;
}

+ (id)newArrayWithDimensions:(unint64_t)a3 lengths:(const int *)a4 type:(id)a5
{
  return IOSArray_NewArrayWithDimensions(a1, a3, (unsigned int *)a4);
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t size = self->super.size_;
  if ((a3 & 0x80000000) != 0 || (int)size <= (int)a3) {
    IOSArray_throwOutOfBoundsWithMsg(size, a3);
  }
  return (&self->elementType_)[a3];
}

- (id)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  return IOSObjectArray_Set((uint64_t)self, a3, a4);
}

- (void)getObjects:(id *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  uint64_t size = self->super.size_;
  uint64_t v8 = (a4 - 1);
  if ((int)a4 - 1 < 0 || (int)v8 >= (int)size) {
    IOSArray_throwOutOfBoundsWithMsg(size, v8);
  }
  if (a4)
  {
    p_elementType = &self->elementType_;
    do
    {
      v10 = *p_elementType++;
      *a3++ = v10;
      --v4;
    }
    while (v4);
  }
}

- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6
{
  LODWORD(v6) = a6;
  int v7 = a5;
  int v9 = a3;
  if ((a6 | a3) < 0 || a6 + a3 > self->super.size_) {
    IOSArray_throwOutOfBounds();
  }
  if ((a6 | a5) < 0 || a6 + a5 > *((_DWORD *)a4 + 2)) {
    IOSArray_throwOutOfBounds();
  }
  unsigned __int8 v11 = [*((id *)a4 + 2) isAssignableFrom:*(void *)&self->isRetained_];
  if (self == a4)
  {
    p_elementType = &self->elementType_;
    if (*((unsigned char *)&self->super.size_ + 4))
    {
      CopyWithMemmove((uint64_t)p_elementType, v9, v7, (int)v6);
    }
    else
    {
      v22 = &p_elementType[v9];
      v23 = &p_elementType[v7];
      memmove(v23, v22, 8 * (int)v6);
    }
  }
  else
  {
    if (*((unsigned char *)a4 + 12))
    {
      if (v11)
      {
        if ((int)v6 >= 1)
        {
          v12 = (char *)a4 + 24;
          v13 = &self->elementType_;
          uint64_t v6 = v6;
          do
          {
            id v14 = *(id *)&v12[8 * v7];
            *(void *)&v12[8 * v7++] = v13[v9++];
            --v6;
          }
          while (v6);
        }
        return;
      }
      if ((int)v6 < 1) {
        return;
      }
      v16 = &self->elementType_;
      v17 = (char *)a4 + 24;
      uint64_t v18 = v6;
      while (1)
      {
        v19 = v16[v9];
        if (v19)
        {
          if (([*((id *)a4 + 2) isInstance:v16[v9]] & 1) == 0) {
            break;
          }
        }
        id v20 = *(id *)&v17[8 * v7];
        v21 = v19;
        *(void *)&v17[8 * v7++] = v19;
        ++v9;
        if (!--v18) {
          return;
        }
      }
LABEL_37:
      sub_100177F98((uint64_t)a4, v19);
    }
    if ((v11 & 1) == 0)
    {
      if ((int)v6 < 1) {
        return;
      }
      v24 = &self->elementType_;
      uint64_t v25 = v6;
      while (1)
      {
        v19 = v24[v9];
        if (v19)
        {
          if (([*((id *)a4 + 2) isInstance:v24[v9]] & 1) == 0) {
            break;
          }
        }
        *((void *)a4 + v7++ + 3) = v19;
        ++v9;
        if (!--v25) {
          return;
        }
      }
      goto LABEL_37;
    }
    memcpy((char *)a4 + 8 * v7 + 24, &(&self->elementType_)[v9], 8 * (int)v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = sub_100177508(self->super.size_, *(void *)&self->isRetained_, 1);
  if (self->super.size_ >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      *(void *)&v4[2 * v5 + 6] = (&self->elementType_)[v5];
      ++v5;
    }
    while (v5 < self->super.size_);
  }
  return v4;
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  return [(IOSClass *)(&self->elementType_)[a3] description];
}

- (IOSObjectArray)retain
{
  if (!*((unsigned char *)&self->super.size_ + 4))
  {
    if (self->super.size_ >= 1)
    {
      uint64_t v3 = 0;
      do
        unint64_t v4 = (&self->elementType_)[v3++];
      while (v3 < self->super.size_);
    }
    *((unsigned char *)&self->super.size_ + 4) = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)IOSObjectArray;
  return [(IOSObjectArray *)&v6 retain];
}

- (void)dealloc
{
  if (*((unsigned char *)&self->super.size_ + 4) && self->super.size_ >= 1)
  {
    uint64_t v3 = 0;
    do

    while (v3 < self->super.size_);
  }
  v4.receiver = self;
  v4.super_class = (Class)IOSObjectArray;
  [(IOSObjectArray *)&v4 dealloc];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  a3->var1 = (id *)&self->elementType_;
  a3->var2 = (unint64_t *)self;
  a3->var0 = 1;
  return self->super.size_;
}

- (void)buffer
{
  return &self->elementType_;
}

- (IOSClass)elementType
{
  return *(IOSClass **)&self->isRetained_;
}

@end