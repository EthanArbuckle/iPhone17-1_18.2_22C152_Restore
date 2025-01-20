@interface __NSSingleObjectEnumerator
- (__NSSingleObjectEnumerator)init;
- (__NSSingleObjectEnumerator)initWithObject:(id)a3 collection:(id)a4;
- (id)description;
- (id)nextObject;
- (void)dealloc;
@end

@implementation __NSSingleObjectEnumerator

- (id)nextObject
{
  id v3 = self->_theObjectToReturn;
  self->_theObjectToReturn = 0;
  id theCollection = self->_theCollection;
  self->_id theCollection = 0;

  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *(void *)off_1ECE0A5B0;

  v3.receiver = self;
  v3.super_class = (Class)__NSSingleObjectEnumerator;
  [(__NSSingleObjectEnumerator *)&v3 dealloc];
}

- (__NSSingleObjectEnumerator)initWithObject:(id)a3 collection:(id)a4
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)__NSSingleObjectEnumerator;
    v6 = [(__NSSingleObjectEnumerator *)&v8 init];
    if (v6)
    {
      v6->_theObjectToReturn = a3;
      v6->_id theCollection = a4;
    }
    return v6;
  }
  else
  {
    return [(__NSSingleObjectEnumerator *)self init];
  }
}

- (__NSSingleObjectEnumerator)init
{
  qword_1EC093AA8 = (uint64_t)"Attempt to create a single-object enumerator with no object/collection";
  __break(1u);
  return self;
}

- (id)description
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  Mutable = CFStringCreateMutable(0, 0);
  if (self->_theObjectToReturn)
  {
    v8.receiver = self;
    v8.super_class = (Class)__NSSingleObjectEnumerator;
    id v5 = [&v8 description];
    CFStringAppendFormat(Mutable, 0, @"%@ that will yield %@", v5, self->_theObjectToReturn);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)__NSSingleObjectEnumerator;
    id v6 = [&v7 description];
    CFStringAppendFormat(Mutable, 0, @"%@ that yielded its object", v6);
  }
  return (id)CFAutorelease(Mutable);
}

@end