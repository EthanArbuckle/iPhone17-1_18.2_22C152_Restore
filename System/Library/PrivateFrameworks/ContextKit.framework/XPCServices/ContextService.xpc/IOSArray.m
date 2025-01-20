@interface IOSArray
+ (id)arrayWithDimensions:(unint64_t)a3 lengths:(const int *)a4;
+ (id)iosClass;
+ (id)newArrayWithDimensions:(unint64_t)a3 lengths:(const int *)a4;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionOfElementAtIndex:(int)a3;
- (id)elementType;
- (id)getClass;
- (int)length;
- (unint64_t)count;
- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6;
- (void)buffer;
@end

@implementation IOSArray

+ (id)arrayWithDimensions:(unint64_t)a3 lengths:(const int *)a4
{
  id v4 = IOSArray_NewArrayWithDimensions(a1, a3, (unsigned int *)a4);
  return v4;
}

+ (id)newArrayWithDimensions:(unint64_t)a3 lengths:(const int *)a4
{
  return IOSArray_NewArrayWithDimensions(a1, a3, (unsigned int *)a4);
}

+ (id)iosClass
{
}

- (int)length
{
  return self->size_;
}

- (unint64_t)count
{
  return self->size_;
}

- (id)descriptionOfElementAtIndex:(int)a3
{
  return 0;
}

- (id)description
{
  int size = self->size_;
  if (!size) {
    return @"[]";
  }
  if (size < 1) {
    return @"[";
  }
  uint64_t v4 = 0;
  v5 = @"[";
  do
  {
    if ((int)v4 >= size - 1) {
      CFStringRef v6 = @"]";
    }
    else {
      CFStringRef v6 = @", ";
    }
    v5 = (__CFString *)[(__CFString *)v5 stringByAppendingFormat:@"%@%@", [(IOSArray *)self descriptionOfElementAtIndex:v4], v6];
    uint64_t v4 = (v4 + 1);
    int size = self->size_;
  }
  while ((int)v4 < size);
  return v5;
}

- (id)getClass
{
  id v2 = [(IOSArray *)self elementType];
  return (id)IOSClass_arrayOf((uint64_t)v2);
}

- (id)elementType
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->size_;
  return result;
}

- (id)clone
{
  id v2 = [(IOSArray *)self copyWithZone:0];
  id v3 = v2;
  return v2;
}

- (void)arraycopy:(int)a3 destination:(id)a4 dstOffset:(int)a5 length:(int)a6
{
}

- (void)buffer
{
  return 0;
}

@end