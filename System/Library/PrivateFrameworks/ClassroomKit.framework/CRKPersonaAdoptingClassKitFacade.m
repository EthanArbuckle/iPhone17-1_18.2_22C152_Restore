@interface CRKPersonaAdoptingClassKitFacade
+ (id)keyPathsForValuesAffectingCurrentPersonaUniqueString;
- (CRKClassKitPersonaAdopter)personaAdopter;
- (CRKPersonaAdoptingClassKitFacade)initWithClassKitFacade:(id)a3 personaBlockPerformer:(id)a4;
- (id)currentPersonaUniqueString;
- (void)currentUserWithCompletion:(id)a3;
- (void)deregisterDataObserver:(id)a3;
- (void)enrolledClassesWithCompletion:(id)a3;
- (void)executeQuery:(id)a3;
- (void)instructedClassesWithCompletion:(id)a3;
- (void)instructorsInClassWithObjectID:(id)a3 completion:(id)a4;
- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4;
- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4;
- (void)performBlockWithClassKitPersona:(id)a3;
- (void)registerDataObserver:(id)a3;
- (void)removeClass:(id)a3 completion:(id)a4;
- (void)saveClass:(id)a3 completion:(id)a4;
- (void)studentsInClassWithObjectID:(id)a3 completion:(id)a4;
- (void)syncServerConfigWithCompletion:(id)a3;
@end

@implementation CRKPersonaAdoptingClassKitFacade

- (CRKPersonaAdoptingClassKitFacade)initWithClassKitFacade:(id)a3 personaBlockPerformer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKPersonaAdoptingClassKitFacade;
  v8 = [(CRKClassKitFacadeDecoratorBase *)&v12 initWithClassKitFacade:v6];
  if (v8)
  {
    v9 = [[CRKClassKitPersonaAdopter alloc] initWithClassKitFacade:v6 personaBlockPerformer:v7];
    personaAdopter = v8->_personaAdopter;
    v8->_personaAdopter = v9;
  }
  return v8;
}

- (void)performBlockWithClassKitPersona:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKPersonaAdoptingClassKitFacade *)self personaAdopter];
  [v5 performBlockWithClassKitPersona:v4];
}

- (id)currentPersonaUniqueString
{
  v2 = [(CRKPersonaAdoptingClassKitFacade *)self personaAdopter];
  v3 = [v2 currentPersonaUniqueString];

  return v3;
}

+ (id)keyPathsForValuesAffectingCurrentPersonaUniqueString
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"personaAdopter.currentPersonaUniqueString"];
}

- (void)registerDataObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__CRKPersonaAdoptingClassKitFacade_registerDataObserver___block_invoke;
  v6[3] = &unk_2646F37F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v6];
}

void __57__CRKPersonaAdoptingClassKitFacade_registerDataObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 registerDataObserver:*(void *)(a1 + 40)];
}

- (void)deregisterDataObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__CRKPersonaAdoptingClassKitFacade_deregisterDataObserver___block_invoke;
  v6[3] = &unk_2646F37F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v6];
}

void __59__CRKPersonaAdoptingClassKitFacade_deregisterDataObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 deregisterDataObserver:*(void *)(a1 + 40)];
}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__CRKPersonaAdoptingClassKitFacade_syncServerConfigWithCompletion___block_invoke;
  v6[3] = &unk_2646F3570;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v6];
}

void __67__CRKPersonaAdoptingClassKitFacade_syncServerConfigWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 syncServerConfigWithCompletion:*(void *)(a1 + 40)];
}

- (void)currentUserWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
  [v5 currentUserWithCompletion:v4];
}

- (void)enrolledClassesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__CRKPersonaAdoptingClassKitFacade_enrolledClassesWithCompletion___block_invoke;
  v6[3] = &unk_2646F3570;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v6];
}

void __66__CRKPersonaAdoptingClassKitFacade_enrolledClassesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 enrolledClassesWithCompletion:*(void *)(a1 + 40)];
}

- (void)instructedClassesWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__CRKPersonaAdoptingClassKitFacade_instructedClassesWithCompletion___block_invoke;
  v6[3] = &unk_2646F3570;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v6];
}

void __68__CRKPersonaAdoptingClassKitFacade_instructedClassesWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 instructedClassesWithCompletion:*(void *)(a1 + 40)];
}

- (void)instructorsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __78__CRKPersonaAdoptingClassKitFacade_instructorsInClassWithObjectID_completion___block_invoke;
  v10[3] = &unk_2646F3CB8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v10];
}

void __78__CRKPersonaAdoptingClassKitFacade_instructorsInClassWithObjectID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 instructorsInClassWithObjectID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)studentsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__CRKPersonaAdoptingClassKitFacade_studentsInClassWithObjectID_completion___block_invoke;
  v10[3] = &unk_2646F3CB8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v10];
}

void __75__CRKPersonaAdoptingClassKitFacade_studentsInClassWithObjectID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 studentsInClassWithObjectID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__CRKPersonaAdoptingClassKitFacade_saveClass_completion___block_invoke;
  v10[3] = &unk_2646F3CB8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v10];
}

void __57__CRKPersonaAdoptingClassKitFacade_saveClass_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 saveClass:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __97__CRKPersonaAdoptingClassKitFacade_locationsWithManagePermissionsForUserWithObjectID_completion___block_invoke;
  v10[3] = &unk_2646F3CB8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v10];
}

void __97__CRKPersonaAdoptingClassKitFacade_locationsWithManagePermissionsForUserWithObjectID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 locationsWithManagePermissionsForUserWithObjectID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__CRKPersonaAdoptingClassKitFacade_locationsWithObjectIDs_completion___block_invoke;
  v10[3] = &unk_2646F3CB8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v10];
}

void __70__CRKPersonaAdoptingClassKitFacade_locationsWithObjectIDs_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 locationsWithObjectIDs:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__CRKPersonaAdoptingClassKitFacade_removeClass_completion___block_invoke;
  v10[3] = &unk_2646F3CB8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v10];
}

void __59__CRKPersonaAdoptingClassKitFacade_removeClass_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 removeClass:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)executeQuery:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CRKPersonaAdoptingClassKitFacade_executeQuery___block_invoke;
  v6[3] = &unk_2646F37F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRKPersonaAdoptingClassKitFacade *)self performBlockWithClassKitPersona:v6];
}

void __49__CRKPersonaAdoptingClassKitFacade_executeQuery___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingClassKitFacade];
  [v2 executeQuery:*(void *)(a1 + 40)];
}

- (CRKClassKitPersonaAdopter)personaAdopter
{
  return self->_personaAdopter;
}

- (void).cxx_destruct
{
}

@end