@interface _MPBaseEntityRelationshipTranslator
- (Class)relatedMPModelClass;
- (_MPBaseEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3;
@end

@implementation _MPBaseEntityRelationshipTranslator

- (Class)relatedMPModelClass
{
  return self->_relatedMPModelClass;
}

- (_MPBaseEntityRelationshipTranslator)initWithRelatedMPModelClass:(Class)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MPBaseEntityRelationshipTranslator;
  v4 = [(_MPBaseEntityRelationshipTranslator *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_relatedMPModelClass, a3);
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end