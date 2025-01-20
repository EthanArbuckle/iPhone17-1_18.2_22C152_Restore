@interface CRKShareTargetCollector
- (CRKShareTargetCollector)init;
- (CRKShareTargetCollectorDelegate)delegate;
- (NSSet)instructorTargets;
- (NSSet)studentTargets;
- (void)didFindTargets:(id)a3;
- (void)didRemoveTargets:(id)a3;
- (void)diffNewTargets:(id)a3 againstOldTargets:(id)a4;
- (void)instructorTargetsDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInstructorTargets:(id)a3;
- (void)setStudentTargets:(id)a3;
- (void)studentTargetsDidChange:(id)a3;
@end

@implementation CRKShareTargetCollector

- (CRKShareTargetCollector)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRKShareTargetCollector;
  v2 = [(CRKShareTargetCollector *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    studentTargets = v2->_studentTargets;
    v2->_studentTargets = (NSSet *)v3;

    uint64_t v5 = objc_opt_new();
    instructorTargets = v2->_instructorTargets;
    v2->_instructorTargets = (NSSet *)v5;
  }
  return v2;
}

- (void)studentTargetsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CRKLogGeneral_13();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v8 = 0;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser student targets did change", v8, 2u);
  }

  v6 = [(CRKShareTargetCollector *)self studentTargets];
  v7 = [MEMORY[0x263EFFA08] setWithArray:v4];

  [(CRKShareTargetCollector *)self setStudentTargets:v7];
  [(CRKShareTargetCollector *)self diffNewTargets:v7 againstOldTargets:v6];
}

- (void)instructorTargetsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _CRKLogGeneral_13();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v8 = 0;
    _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser instructor targets did change", v8, 2u);
  }

  v6 = [(CRKShareTargetCollector *)self instructorTargets];
  v7 = [MEMORY[0x263EFFA08] setWithArray:v4];

  [(CRKShareTargetCollector *)self setInstructorTargets:v7];
  [(CRKShareTargetCollector *)self diffNewTargets:v7 againstOldTargets:v6];
}

- (void)diffNewTargets:(id)a3 againstOldTargets:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v6, "crk_setBySubtractingSet:", v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v8 = objc_msgSend(v7, "crk_setBySubtractingSet:", v6);

  [(CRKShareTargetCollector *)self didRemoveTargets:v9];
  [(CRKShareTargetCollector *)self didFindTargets:v8];
}

- (void)didFindTargets:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = _CRKLogGeneral_13();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser did find targets: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [(CRKShareTargetCollector *)self delegate];
    id v7 = [v4 allObjects];
    [v6 shareTargetCollector:self didFindTargets:v7];
  }
}

- (void)didRemoveTargets:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = _CRKLogGeneral_13();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Classroom: Share target browser did remove targets: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [(CRKShareTargetCollector *)self delegate];
    id v7 = [v4 allObjects];
    [v6 shareTargetCollector:self didRemoveTargets:v7];
  }
}

- (CRKShareTargetCollectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKShareTargetCollectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)studentTargets
{
  return self->_studentTargets;
}

- (void)setStudentTargets:(id)a3
{
}

- (NSSet)instructorTargets
{
  return self->_instructorTargets;
}

- (void)setInstructorTargets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructorTargets, 0);
  objc_storeStrong((id *)&self->_studentTargets, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end