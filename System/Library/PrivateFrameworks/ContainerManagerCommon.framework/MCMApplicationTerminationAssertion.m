@interface MCMApplicationTerminationAssertion
- (MCMApplicationTerminationAssertion)initWithBundleIdentifier:(id)a3 reason:(id)a4;
- (RBSTerminationAssertion)termAssertion;
- (void)dealloc;
- (void)invalidate;
- (void)setTermAssertion:(id)a3;
@end

@implementation MCMApplicationTerminationAssertion

- (void).cxx_destruct
{
  p_termAssertion = &self->_termAssertion;

  objc_storeStrong((id *)p_termAssertion, 0);
}

- (void)setTermAssertion:(id)a3
{
  p_termAssertion = &self->_termAssertion;

  objc_storeStrong((id *)p_termAssertion, a3);
}

- (RBSTerminationAssertion)termAssertion
{
  return self->_termAssertion;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(MCMApplicationTerminationAssertion *)self termAssertion];
  if (objc_claimAutoreleasedReturnValue()) {
    __assert_rtn("-[MCMApplicationTerminationAssertion dealloc]", "MCMApplicationTerminationAssertion.m", 95, "nil == self.termAssertion");
  }
  v3.receiver = self;
  v3.super_class = (Class)MCMApplicationTerminationAssertion;
  [(MCMApplicationTerminationAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  if (RunningBoardServicesLibraryCore())
  {
    objc_super v3 = [(MCMApplicationTerminationAssertion *)self termAssertion];
    if (v3)
    {
      id v4 = v3;
      [v3 invalidate];
      [(MCMApplicationTerminationAssertion *)self setTermAssertion:0];
      objc_super v3 = v4;
    }
  }
}

- (MCMApplicationTerminationAssertion)initWithBundleIdentifier:(id)a3 reason:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)MCMApplicationTerminationAssertion;
  v8 = [(MCMApplicationTerminationAssertion *)&v30 init];
  if (!v8 || !RunningBoardServicesLibraryCore()) {
    goto LABEL_29;
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v9 = (void *)getRBSProcessPredicateClass_softClass;
  uint64_t v34 = getRBSProcessPredicateClass_softClass;
  if (!getRBSProcessPredicateClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getRBSProcessPredicateClass_block_invoke;
    v36 = &unk_1E6A80420;
    v37 = &v31;
    __getRBSProcessPredicateClass_block_invoke((uint64_t)buf);
    v9 = (void *)v32[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v31, 8);
  v11 = [v10 predicateMatchingBundleIdentifier:v6];
  if (!v11)
  {
    v25 = container_log_handle_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Failed to generate predicate for termination assertion for [%@]", buf, 0xCu);
    }

    goto LABEL_28;
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v12 = (void *)getRBSTerminateContextClass_softClass;
  uint64_t v34 = getRBSTerminateContextClass_softClass;
  if (!getRBSTerminateContextClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getRBSTerminateContextClass_block_invoke;
    v36 = &unk_1E6A80420;
    v37 = &v31;
    __getRBSTerminateContextClass_block_invoke((uint64_t)buf);
    v12 = (void *)v32[3];
  }
  v13 = v12;
  _Block_object_dispose(&v31, 8);
  v14 = (void *)[[v13 alloc] initWithExplanation:v7];
  v15 = v14;
  if (!v14)
  {
    v26 = container_log_handle_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Failed to generate context for termination assertion for [%@]", buf, 0xCu);
    }

    goto LABEL_28;
  }
  [v14 setExceptionCode:3735933956];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  v16 = (void *)getRBSTerminationAssertionClass_softClass;
  uint64_t v34 = getRBSTerminationAssertionClass_softClass;
  if (!getRBSTerminationAssertionClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getRBSTerminationAssertionClass_block_invoke;
    v36 = &unk_1E6A80420;
    v37 = &v31;
    __getRBSTerminationAssertionClass_block_invoke((uint64_t)buf);
    v16 = (void *)v32[3];
  }
  v17 = v16;
  _Block_object_dispose(&v31, 8);
  v18 = (void *)[[v17 alloc] initWithPredicate:v11 context:v15];
  v19 = v18;
  if (v18)
  {
    id v29 = 0;
    char v20 = [v18 acquireWithError:&v29];
    v21 = v29;
    if (v20)
    {
      v22 = v19;
      int v23 = 0;
      termAssertion = v8->_termAssertion;
      v8->_termAssertion = v22;
    }
    else
    {
      termAssertion = container_log_handle_for_category();
      if (os_log_type_enabled(termAssertion, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_error_impl(&dword_1D7739000, termAssertion, OS_LOG_TYPE_ERROR, "Failed to acquire termination assertion for [%@]: %@", buf, 0x16u);
      }
      int v23 = 1;
    }
  }
  else
  {
    v21 = container_log_handle_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_error_impl(&dword_1D7739000, v21, OS_LOG_TYPE_ERROR, "Failed to init termination assertion for [%@]", buf, 0xCu);
    }
    int v23 = 1;
  }

  if (!v23)
  {
LABEL_29:
    v27 = v8;
    goto LABEL_30;
  }
LABEL_28:
  v27 = 0;
LABEL_30:

  return v27;
}

@end