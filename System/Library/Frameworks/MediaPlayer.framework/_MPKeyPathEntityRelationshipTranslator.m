@interface _MPKeyPathEntityRelationshipTranslator
- (Class)relatedMPModelClass;
- (_MPKeyPathEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3;
@end

@implementation _MPKeyPathEntityRelationshipTranslator

- (void).cxx_destruct
{
}

- (Class)relatedMPModelClass
{
  return self->_relatedMPModelClass;
}

- (_MPKeyPathEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MPKeyPathEntityRelationshipTranslator;
  v4 = [(_MPKeyPathEntityRelationshipTranslator *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_relatedMPModelClass, a3);
  }
  return v5;
}

@end