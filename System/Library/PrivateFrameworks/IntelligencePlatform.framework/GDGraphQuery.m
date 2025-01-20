@interface GDGraphQuery
- (NSArray)objects;
- (NSArray)predicates;
- (NSArray)subjects;
- (NSString)objectFTSTerm;
- (void)setObjectFTSTerm:(id)a3;
- (void)setObjects:(id)a3;
- (void)setPredicates:(id)a3;
- (void)setSubjects:(id)a3;
@end

@implementation GDGraphQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_subjects, 0);

  objc_storeStrong((id *)&self->_objectFTSTerm, 0);
}

- (void)setObjects:(id)a3
{
}

- (NSArray)objects
{
  return self->_objects;
}

- (void)setPredicates:(id)a3
{
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (void)setSubjects:(id)a3
{
}

- (NSArray)subjects
{
  return self->_subjects;
}

- (void)setObjectFTSTerm:(id)a3
{
}

- (NSString)objectFTSTerm
{
  return self->_objectFTSTerm;
}

@end