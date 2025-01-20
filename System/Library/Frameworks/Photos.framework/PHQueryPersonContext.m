@interface PHQueryPersonContext
+ (id)subpredicatesForFetchOptions:(id)a3;
- (PHQueryPersonContext)initWithFetchOptions:(id)a3;
- (id)_faceCountPredicateWithMinimum:(unint64_t)a3;
- (id)_notHiddenTypePredicate;
- (id)_notVerifiedPredicate;
- (id)_verifiedPredicate;
- (id)_verifiedVisiblePredicate;
- (id)personContextAdditionalPredicate;
- (id)personContextDetailPredicate;
- (id)personContextNoTombstonePredicate;
- (id)personContextNonePredicates;
- (id)personContextOneUpPredicate;
- (id)personContextPeopleHomePredicate;
- (id)personContextUnverifiedPredicate;
- (id)subpredicates;
@end

@implementation PHQueryPersonContext

- (void).cxx_destruct
{
}

+ (id)subpredicatesForFetchOptions:(id)a3
{
  id v3 = a3;
  if (!v3) {
    id v3 = (id)objc_opt_new();
  }
  v4 = [[PHQueryPersonContext alloc] initWithFetchOptions:v3];
  v5 = [(PHQueryPersonContext *)v4 subpredicates];

  return v5;
}

- (id)subpredicates
{
  v14[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PHFetchOptions *)self->_fetchOptions personContext];
  v4 = (void *)MEMORY[0x1E4F1CBF0];
  switch(v3)
  {
    case 0:
      v5 = [(PHQueryPersonContext *)self personContextNonePredicates];
      v14[0] = v5;
      v6 = (void **)v14;
      goto LABEL_9;
    case 1:
      v5 = [(PHQueryPersonContext *)self personContextPeopleHomePredicate];
      v13 = v5;
      v6 = &v13;
      goto LABEL_9;
    case 2:
      v5 = [(PHQueryPersonContext *)self personContextAdditionalPredicate];
      v12 = v5;
      v6 = &v12;
      goto LABEL_9;
    case 3:
      v5 = [(PHQueryPersonContext *)self personContextDetailPredicate];
      v11 = v5;
      v6 = &v11;
      goto LABEL_9;
    case 4:
      v5 = [(PHQueryPersonContext *)self personContextOneUpPredicate];
      v10 = v5;
      v6 = &v10;
      goto LABEL_9;
    case 6:
      v5 = [(PHQueryPersonContext *)self personContextUnverifiedPredicate];
      v9 = v5;
      v6 = &v9;
      goto LABEL_9;
    case 7:
      v5 = [(PHQueryPersonContext *)self personContextNoTombstonePredicate];
      v8 = v5;
      v6 = &v8;
LABEL_9:
      v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, 1, v8, v9, v10, v11, v12, v13, v14[0]);

      break;
    default:
      break;
  }

  return v4;
}

- (id)personContextPeopleHomePredicate
{
  v10[3] = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = [(PHQueryPersonContext *)self _verifiedVisiblePredicate];
  v5 = [(PHQueryPersonContext *)self _notHiddenTypePredicate];
  v10[1] = v5;
  v6 = [(PHQueryPersonContext *)self _faceCountPredicateWithMinimum:1];
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  v8 = [v3 andPredicateWithSubpredicates:v7];

  return v8;
}

- (PHQueryPersonContext)initWithFetchOptions:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHQueryPersonContext;
  v6 = [(PHQueryPersonContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fetchOptions, a3);
    v8 = v7;
  }

  return v7;
}

- (id)_verifiedVisiblePredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  int64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"verifiedType", 1);
  v8[0] = v3;
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"verifiedType", 2);
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v2 orPredicateWithSubpredicates:v5];

  return v6;
}

- (id)_notHiddenTypePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(noindex:(%K) > %d)", @"type", -1);
}

- (id)_faceCountPredicateWithMinimum:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K >= %d", @"faceCount", a3);
}

- (id)personContextUnverifiedPredicate
{
  v9[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = [(PHQueryPersonContext *)self _notVerifiedPredicate];
  v9[0] = v4;
  id v5 = [(PHQueryPersonContext *)self _faceCountPredicateWithMinimum:[(PHFetchOptions *)self->_fetchOptions minimumUnverifiedFaceCount]];
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v7 = [v3 andPredicateWithSubpredicates:v6];

  return v7;
}

- (id)personContextOneUpPredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K >= 1)", @"faceCount");
  int64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  v8[0] = v2;
  v4 = [MEMORY[0x1E4F8AA10] predicateForVisibleKeyFace];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v3 andPredicateWithSubpredicates:v5];

  return v6;
}

- (id)personContextDetailPredicate
{
  v20[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = [(PHQueryPersonContext *)self _notVerifiedPredicate];
  v20[0] = v4;
  id v5 = [(PHQueryPersonContext *)self _faceCountPredicateWithMinimum:7];
  v20[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v7 = [v3 andPredicateWithSubpredicates:v6];

  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = [(PHQueryPersonContext *)self _verifiedVisiblePredicate];
  v19[0] = v9;
  objc_super v10 = [(PHQueryPersonContext *)self _faceCountPredicateWithMinimum:1];
  v19[1] = v10;
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(noindex:(%K) != %d)", @"type", -1);
  v19[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  v13 = [v8 andPredicateWithSubpredicates:v12];

  v14 = (void *)MEMORY[0x1E4F28BA0];
  v18[0] = v7;
  v18[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v16 = [v14 orPredicateWithSubpredicates:v15];

  return v16;
}

- (id)personContextAdditionalPredicate
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  int64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(noindex:(%K) != %d)", @"type", 1);
  v8[0] = v3;
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K >= 1)", @"faceCount");
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

- (id)personContextNonePredicates
{
  v19[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = (void *)MEMORY[0x1E4F28BA0];
  v4 = [(PHQueryPersonContext *)self _verifiedPredicate];
  v19[0] = v4;
  id v5 = [(PHQueryPersonContext *)self _faceCountPredicateWithMinimum:[(PHFetchOptions *)self->_fetchOptions minimumVerifiedFaceCount]];
  v19[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v7 = [v3 andPredicateWithSubpredicates:v6];

  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = [(PHQueryPersonContext *)self _notVerifiedPredicate];
  v18[0] = v9;
  objc_super v10 = [(PHQueryPersonContext *)self _faceCountPredicateWithMinimum:[(PHFetchOptions *)self->_fetchOptions minimumUnverifiedFaceCount]];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v12 = [v8 andPredicateWithSubpredicates:v11];

  v13 = (void *)MEMORY[0x1E4F28BA0];
  v17[0] = v7;
  v17[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v15 = [v13 orPredicateWithSubpredicates:v14];

  return v15;
}

- (id)personContextNoTombstonePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"verifiedType", -2);
}

- (id)_notVerifiedPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(noindex:(%K) == %d)", @"verifiedType", 0);
}

- (id)_verifiedPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"verifiedType", 0);
}

@end