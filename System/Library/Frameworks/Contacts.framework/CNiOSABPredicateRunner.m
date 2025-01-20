@interface CNiOSABPredicateRunner
- (id)personPredicateWithNameLike:(id)a3 inGroups:(id)a4 sources:(id)a5 addressBook:(void *)a6;
- (id)personPredicateWithNameLike:(id)a3 inSource:(id)a4 addressBook:(void *)a5;
- (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 ranked:(BOOL)a5 inAddressBook:(void *)a6 withDelegate:(id)a7;
@end

@implementation CNiOSABPredicateRunner

- (void)searchPeopleWithPredicate:(id)a3 sortOrder:(unsigned int)a4 ranked:(BOOL)a5 inAddressBook:(void *)a6 withDelegate:(id)a7
{
}

- (id)personPredicateWithNameLike:(id)a3 inSource:(id)a4 addressBook:(void *)a5
{
  return (id)[MEMORY[0x1E4F498B8] personPredicateWithNameLike:a3 inSource:a4 addressBook:a5];
}

- (id)personPredicateWithNameLike:(id)a3 inGroups:(id)a4 sources:(id)a5 addressBook:(void *)a6
{
  return (id)[MEMORY[0x1E4F498B8] personPredicateWithNameLike:a3 inGroups:a4 sources:a5 addressBook:a6];
}

@end