@interface CLSInputPeopleClue
+ (id)clueWithConsolidatedPersonLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5;
+ (id)clueWithPeople:(id)a3 serviceManager:(id)a4;
+ (id)clueWithPersonContactIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5;
+ (id)clueWithPersonLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5;
+ (id)cluesWithConsolidatedPersonLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5;
+ (id)cluesWithPeoples:(id)a3 serviceManager:(id)a4;
+ (id)cluesWithPersonLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5;
- (BOOL)includeMergeCandidates;
- (CLSPersonIdentity)person;
- (PHPhotoLibrary)photoLibrary;
- (id)description;
- (id)name;
- (unint64_t)numberOfFaces;
- (void)_prepareWithProgressBlock:(id)a3;
- (void)setIncludeMergeCandidates:(BOOL)a3;
- (void)setNumberOfFaces:(unint64_t)a3;
- (void)setPerson:(id)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation CLSInputPeopleClue

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setIncludeMergeCandidates:(BOOL)a3
{
  self->_includeMergeCandidates = a3;
}

- (BOOL)includeMergeCandidates
{
  return self->_includeMergeCandidates;
}

- (void)setNumberOfFaces:(unint64_t)a3
{
  self->_numberOfFaces = a3;
}

- (unint64_t)numberOfFaces
{
  return self->_numberOfFaces;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PHPhotoLibrary *)WeakRetained;
}

- (void)setPerson:(id)a3
{
}

- (void)_prepareWithProgressBlock:(id)a3
{
  p_person = &self->_person;
  if (!self->_person)
  {
    v5 = [(CLSClue *)self value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      serviceManager = self->_serviceManager;
      v8 = [(CLSClue *)self value];
      v9 = [(CLSInputPeopleClue *)self photoLibrary];
      v10 = [(CLSServiceManager *)serviceManager personResultForName:v8 inPhotoLibrary:v9];

      v11 = [v10 person];
      if ([v11 isMe])
      {
        v12 = [v11 localIdentifier];
        uint64_t v13 = [v12 length];

        if (v13)
        {
          v14 = [(CLSServiceManager *)self->_serviceManager mePerson];
          v15 = [v14 localIdentifier];
          uint64_t v16 = [v15 length];

          if (!v16)
          {
            v17 = [v11 localIdentifier];
            [v14 setLocalIdentifier:v17];
          }
        }
      }
      if (v10)
      {
        objc_storeStrong((id *)p_person, v11);
        [v10 confidence];
        [(CLSClue *)self setConfidence:v18];
      }
      else
      {
        v23 = *p_person;
        *p_person = 0;
      }
      goto LABEL_15;
    }
    v19 = [(CLSClue *)self value];
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if (v20)
    {
      uint64_t v21 = [(CLSClue *)self value];
      v22 = *p_person;
      *p_person = (CLSPersonIdentity *)v21;

      if ([(CLSPersonIdentity *)*p_person isMe])
      {
        v10 = [(CLSServiceManager *)self->_serviceManager mePerson];
        [(CLSPersonIdentity *)*p_person mergeWithPerson:v10];
LABEL_15:
      }
    }
  }
  self->super._needsPreparation = 0;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)CLSInputPeopleClue;
  v4 = [(CLSClue *)&v8 description];
  v5 = [v3 stringWithString:v4];

  v6 = [(CLSInputPeopleClue *)self name];
  [v5 appendFormat:@"\n\tname:[%@]", v6];

  return v5;
}

- (CLSPersonIdentity)person
{
  [(CLSInputClue *)self prepareIfNeeded];
  person = self->_person;
  return person;
}

- (id)name
{
  [(CLSInputClue *)self prepareIfNeeded];
  person = self->_person;
  if (person) {
    [(CLSPersonIdentity *)person fullName];
  }
  else {
  v4 = [(CLSClue *)self value];
  }
  return v4;
}

+ (id)cluesWithConsolidatedPersonLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend((id)objc_opt_class(), "clueWithConsolidatedPersonLocalIdentifier:inPhotoLibrary:serviceManager:", *(void *)(*((void *)&v18 + 1) + 8 * i), v8, v9, (void)v18);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (id)cluesWithPersonLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend((id)objc_opt_class(), "clueWithPersonLocalIdentifier:inPhotoLibrary:serviceManager:", *(void *)(*((void *)&v18 + 1) + 8 * i), v8, v9, (void)v18);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

+ (id)clueWithConsolidatedPersonLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  v5 = [a1 clueWithPersonLocalIdentifier:a3 inPhotoLibrary:a4 serviceManager:a5];
  [v5 setIncludeMergeCandidates:1];
  return v5;
}

+ (id)clueWithPersonContactIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[CLSClue _clueWithValue:a3 forKey:@"Global People"];
  [v9 setPhotoLibrary:v8];

  v10 = (void *)v9[14];
  v9[14] = v7;

  return v9;
}

+ (id)clueWithPersonLocalIdentifier:(id)a3 inPhotoLibrary:(id)a4 serviceManager:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[CLSClue _clueWithValue:a3 forKey:@"Global People"];
  [v9 setPhotoLibrary:v8];

  v10 = (void *)v9[14];
  v9[14] = v7;

  return v9;
}

+ (id)cluesWithPeoples:(id)a3 serviceManager:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend((id)objc_opt_class(), "clueWithPeople:serviceManager:", *(void *)(*((void *)&v15 + 1) + 8 * i), v6, (void)v15);
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)clueWithPeople:(id)a3 serviceManager:(id)a4
{
  id v5 = a4;
  id v6 = +[CLSClue _clueWithValue:a3 forKey:@"Global People"];
  id v7 = (void *)v6[14];
  v6[14] = v5;

  return v6;
}

@end