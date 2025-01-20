@interface _LSDBEnumerator
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)_initWithContext:(LSContext *)CurrentContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)nextObject;
- (id)swift_firstWhere:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)swift_forEach:(id)a3;
@end

@implementation _LSDBEnumerator

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0)
  {
    if (!a5) {
      return 0;
    }
  }
  else
  {
    a3->var1 = a4;
    a3->var2 = (unint64_t *)&mutationsPtr;
    a3->var0 = 1;
    if (!a5) {
      return 0;
    }
  }
  id NextObject = _LSDBEnumeratorGetNextObject((uint64_t)self);
  id lastFastObject = self->_lastFastObject;
  self->_id lastFastObject = NextObject;

  id v9 = self->_lastFastObject;
  if (v9)
  {
    *a4 = v9;
    return 1;
  }
  return 0;
}

- (id)nextObject
{
  id NextObject = _LSDBEnumeratorGetNextObject((uint64_t)self);

  return NextObject;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((unsigned char *)self + 48) = 0;
  return self;
}

- (id)_initWithContext:(LSContext *)CurrentContext
{
  v13.receiver = self;
  v13.super_class = (Class)_LSDBEnumerator;
  id v4 = -[LSEnumerator _initWithContext:](&v13, sel__initWithContext_);
  v5 = v4;
  if (v4)
  {
    if (!CurrentContext) {
      CurrentContext = (LSContext *)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)v4);
    }
    id v9 = CurrentContext;
    id v10 = 0;
    char v11 = 0;
    id v12 = 0;
    LaunchServices::Database::Context::operator=((uint64_t)v5 + 32, (uint64_t)&v9);
    if (v9 && v11) {
      _LSContextDestroy((void **)&v9->db);
    }
    id v6 = v10;
    id v9 = 0;
    id v10 = 0;

    char v11 = 0;
    id v7 = v12;
    id v12 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastFastObject, 0);
  p_context = &self->_context;
  if (p_context->_contextPointer && p_context->_created) {
    _LSContextDestroy((void **)&p_context->_contextPointer->db);
  }
  db = p_context->_contextStorage.db;
  p_context->_contextPointer = 0;
  p_context->_contextStorage.db = 0;

  p_context->_created = 0;
  error = p_context->_error;
  p_context->_error = 0;

  id v6 = p_context->_contextStorage.db;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
}

- (void)swift_forEach:(id)a3
{
  id NextObject = _LSDBEnumeratorGetNextObject((uint64_t)self);
  if (NextObject)
  {
    id v6 = NextObject;
    do
    {
      (*((void (**)(id, id))a3 + 2))(a3, v6);

      id v6 = _LSDBEnumeratorGetNextObject((uint64_t)self);
    }
    while (v6);
  }
}

- (id)swift_firstWhere:(id)a3
{
  id NextObject = _LSDBEnumeratorGetNextObject((uint64_t)self);
  if (NextObject)
  {
    while (!(*((unsigned int (**)(id, id))a3 + 2))(a3, NextObject))
    {

      id NextObject = _LSDBEnumeratorGetNextObject((uint64_t)self);
      if (!NextObject) {
        goto LABEL_6;
      }
    }
    id NextObject = NextObject;
  }
LABEL_6:

  return NextObject;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_LSDBEnumerator;
  id v4 = [(LSEnumerator *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    LaunchServices::Database::Context::operator=((uint64_t)(v4 + 4), (uint64_t)&self->_context);
    v5[8] = self->_index;
    *((unsigned char *)v5 + 80) = v5[10] & 0xFE | *((unsigned char *)self + 80) & 1;
    *((unsigned char *)v5 + 80) = v5[10] & 0xFD | *((unsigned char *)self + 80) & 2;
    *((unsigned char *)v5 + 80) = v5[10] & 0xFB | *((unsigned char *)self + 80) & 4;
  }
  return v5;
}

@end