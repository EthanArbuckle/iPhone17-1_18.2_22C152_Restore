@interface PHPersistentChangeEnumerationContext
- (NSMutableSet)trashedIdentifiersAsDeletes;
- (NSMutableSet)untrashedIdentifiersAsInserts;
- (PHPersistentChangeEnumerationContext)init;
@end

@implementation PHPersistentChangeEnumerationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashedIdentifiersAsDeletes, 0);

  objc_storeStrong((id *)&self->_untrashedIdentifiersAsInserts, 0);
}

- (NSMutableSet)trashedIdentifiersAsDeletes
{
  return self->_trashedIdentifiersAsDeletes;
}

- (NSMutableSet)untrashedIdentifiersAsInserts
{
  return self->_untrashedIdentifiersAsInserts;
}

- (PHPersistentChangeEnumerationContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHPersistentChangeEnumerationContext;
  v2 = [(PHPersistentChangeEnumerationContext *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    untrashedIdentifiersAsInserts = v2->_untrashedIdentifiersAsInserts;
    v2->_untrashedIdentifiersAsInserts = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    trashedIdentifiersAsDeletes = v2->_trashedIdentifiersAsDeletes;
    v2->_trashedIdentifiersAsDeletes = v5;
  }
  return v2;
}

@end