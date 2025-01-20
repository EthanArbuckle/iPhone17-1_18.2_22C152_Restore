@interface CRKASMConcreteUserDirectory
+ (id)instructorDirectoryWithRosterRequirements:(id)a3 locationIDs:(id)a4;
+ (id)studentDirectoryWithRosterRequirements:(id)a3 locationIDs:(id)a4;
- (CRKASMConcreteUserDirectory)initWithRosterRequirements:(id)a3 queryGenerator:(id)a4;
- (CRKClassKitRosterRequirements)requirements;
- (id)iteratorForSearchString:(id)a3 sortingGivenNameFirst:(BOOL)a4 pageSize:(int64_t)a5;
- (id)queryGenerator;
@end

@implementation CRKASMConcreteUserDirectory

- (CRKASMConcreteUserDirectory)initWithRosterRequirements:(id)a3 queryGenerator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKASMConcreteUserDirectory;
  v9 = [(CRKASMConcreteUserDirectory *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requirements, a3);
    uint64_t v11 = MEMORY[0x22A620AF0](v8);
    id queryGenerator = v10->_queryGenerator;
    v10->_id queryGenerator = (id)v11;
  }
  return v10;
}

+ (id)studentDirectoryWithRosterRequirements:(id)a3 locationIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__CRKASMConcreteUserDirectory_studentDirectoryWithRosterRequirements_locationIDs___block_invoke;
  v13[3] = &unk_2646F5B70;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = (void *)[v8 initWithRosterRequirements:v10 queryGenerator:v13];

  return v11;
}

uint64_t __82__CRKASMConcreteUserDirectory_studentDirectoryWithRosterRequirements_locationIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) makeStudentQueryForSearchString:a2 locationIDs:*(void *)(a1 + 40) sortingGivenNameFirst:a3 pageSize:a4];
}

+ (id)instructorDirectoryWithRosterRequirements:(id)a3 locationIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)a1);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__CRKASMConcreteUserDirectory_instructorDirectoryWithRosterRequirements_locationIDs___block_invoke;
  v13[3] = &unk_2646F5B70;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = (void *)[v8 initWithRosterRequirements:v10 queryGenerator:v13];

  return v11;
}

uint64_t __85__CRKASMConcreteUserDirectory_instructorDirectoryWithRosterRequirements_locationIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) makeInstructorQueryForSearchString:a2 locationIDs:*(void *)(a1 + 40) sortingGivenNameFirst:a3 pageSize:a4];
}

- (id)iteratorForSearchString:(id)a3 sortingGivenNameFirst:(BOOL)a4 pageSize:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(CRKASMConcreteUserDirectory *)self requirements];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__CRKASMConcreteUserDirectory_iteratorForSearchString_sortingGivenNameFirst_pageSize___block_invoke;
  v13[3] = &unk_2646F5B98;
  void v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  int64_t v15 = a5;
  id v10 = v8;
  uint64_t v11 = +[CRKASMConcreteUserDirectoryIterator iteratorWithRosterRequirements:v9 queryGenerator:v13];

  return v11;
}

id __86__CRKASMConcreteUserDirectory_iteratorForSearchString_sortingGivenNameFirst_pageSize___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queryGenerator];
  v3 = v2[2](v2, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));

  return v3;
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (id)queryGenerator
{
  return self->_queryGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_queryGenerator, 0);

  objc_storeStrong((id *)&self->_requirements, 0);
}

@end