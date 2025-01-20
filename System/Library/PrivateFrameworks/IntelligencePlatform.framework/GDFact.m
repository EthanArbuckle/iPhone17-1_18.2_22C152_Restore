@interface GDFact
- (GDFact)initWithPredicate:(unint64_t)a3 object:(id)a4;
- (GDFactObject)object;
- (unint64_t)predicate;
@end

@implementation GDFact

- (void).cxx_destruct
{
}

- (GDFactObject)object
{
  return self->_object;
}

- (unint64_t)predicate
{
  return self->_predicate;
}

- (GDFact)initWithPredicate:(unint64_t)a3 object:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GDFact;
  v8 = [(GDFact *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_predicate = a3;
    objc_storeStrong((id *)&v8->_object, a4);
  }

  return v9;
}

@end