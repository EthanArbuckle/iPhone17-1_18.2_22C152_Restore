@interface ABSAddressBook
+ (BOOL)eraseAllDataAtLocationName:(id)a3 error:(id *)a4;
+ (id)localizedLabelForLabel:(id)a3;
+ (int64_t)authorizationStatus;
+ (void)callLocalChangeCallbacks:(BOOL)a3;
+ (void)initialize;
+ (void)requestAccessWithCompletion:(id)a3;
- (ABSAddressBook)init;
- (ABSAddressBook)initWithOptions:(id)a3 error:(id *)a4;
- (ABSAddressBook)initWithOptions:(id)a3 policy:(int)a4 error:(id *)a5;
- (ABSAddressBook)initWithSettings:(id)a3 error:(id *)a4;
- (ABSAddressBookContextStorage)contacts;
- (ABSAddressBookContextStorage)groups;
- (ABSAddressBookContextStorage)sources;
- (ABSBulkFaultHandler)faultHandler;
- (ABSChangeCallbacks)changeCallbacks;
- (BOOL)addMember:(id)a3 toGroup:(id)a4 error:(id *)a5;
- (BOOL)addRecord:(id)a3 error:(id *)a4;
- (BOOL)hasUnsavedChanges;
- (BOOL)linkPerson:(id)a3 toPerson:(id)a4;
- (BOOL)recordUpdated:(id)a3;
- (BOOL)removeMember:(id)a3 fromGroup:(id)a4 error:(id *)a5;
- (BOOL)removeRecord:(id)a3 error:(id *)a4;
- (BOOL)save:(id *)a3;
- (BOOL)unlinkPerson:(id)a3;
- (CNContactStore)store;
- (CNFuture)storeFuture;
- (id)_peoplePreferringExistingRecordsForFetchRequest:(id)a3;
- (id)_resultRecordsFromFetchedCNImpls:(id)a3 mergedWithStorage:(id)a4 creationBlock:(id)a5;
- (id)_sourcesPreferringExistingRecordsFetchedWithPredicate:(id)a3;
- (id)_storageForRecordClass:(Class)a3;
- (id)allGroups;
- (id)allPeople;
- (id)allSources;
- (id)contactsWithIdentifiers:(id)a3 keysToFetch:(id)a4;
- (id)defaultSource;
- (id)findPersonMatchingEmailAddress:(id)a3;
- (id)findPersonMatchingPhoneNumber:(id)a3 country:(id)a4;
- (id)findPersonMatchingURL:(id)a3;
- (id)groupWithRecordID:(int)a3;
- (id)groupsInSource:(id)a3;
- (id)localSource;
- (id)mePerson;
- (id)peopleInGroup:(id)a3 sortOrder:(unsigned int)a4;
- (id)peopleInSource:(id)a3 sortOrder:(unsigned int)a4;
- (id)peopleLinkedToPerson:(id)a3;
- (id)peopleMatchingNameString:(id)a3;
- (id)peopleWithCNIdentifiers:(id)a3;
- (id)personWithRecordID:(int)a3;
- (id)sourceForRecord:(id)a3;
- (id)sourceWithRecordID:(int)a3;
- (id)uniqueDatabaseVersionIdentifier;
- (int)saveSequenceCount;
- (int64_t)groupCount;
- (int64_t)personCount;
- (void)completePerson:(id)a3 withKeysToFetch:(id)a4;
- (void)registerExternalChangeCallback:(void *)a3 context:(void *)a4;
- (void)revert;
- (void)setContacts:(id)a3;
- (void)setGroups:(id)a3;
- (void)setSources:(id)a3;
- (void)uniqueDatabaseVersionIdentifier;
- (void)unregisterExternalChangeCallback:(void *)a3 context:(void *)a4;
- (void)updateFetchingAllPropertiesForGroups:(id)a3;
- (void)updateFetchingAllPropertiesForSources:(id)a3;
- (void)updatePeople:(id)a3 refetchingProperties:(id)a4;
@end

@implementation ABSAddressBook

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ABSAddressBook;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1) {
    ABSPersonConstantsInitialize();
  }
}

- (ABSAddressBook)init
{
  objc_super v3 = objc_alloc_init(ABSAddressBookSettings);
  v4 = [(ABSAddressBook *)self initWithSettings:v3 error:0];

  return v4;
}

- (ABSAddressBook)initWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[ABSAddressBookSettings alloc] initWithOptions:v6];

  v8 = [(ABSAddressBook *)self initWithSettings:v7 error:a4];
  return v8;
}

- (ABSAddressBook)initWithOptions:(id)a3 policy:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [[ABSAddressBookSettings alloc] initWithOptions:v8 policy:v6];

  v10 = [(ABSAddressBook *)self initWithSettings:v9 error:a5];
  return v10;
}

- (ABSAddressBook)initWithSettings:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ABSAddressBook;
  v7 = [(ABSAddressBook *)&v28 init];
  if (v7)
  {
    id v8 = [MEMORY[0x263F33560] sharedInstance];
    uint64_t v9 = [v8 authorizationStatus];

    if (v9 == 1 && ![v6 policy])
    {
      v24 = [MEMORY[0x263F087E8] errorWithDomain:@"ABAddressBookErrorDomain" code:1 userInfo:0];
      v23 = v24;
      if (a4) {
        *a4 = v24;
      }

      v7 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = objc_opt_new();
    contacts = v7->_contacts;
    v7->_contacts = (ABSAddressBookContextStorage *)v10;

    uint64_t v12 = objc_opt_new();
    groups = v7->_groups;
    v7->_groups = (ABSAddressBookContextStorage *)v12;

    uint64_t v14 = objc_opt_new();
    sources = v7->_sources;
    v7->_sources = (ABSAddressBookContextStorage *)v14;

    v16 = [[ABSChangeCallbacks alloc] initWithAddressBook:v7];
    changeCallbacks = v7->_changeCallbacks;
    v7->_changeCallbacks = v16;

    uint64_t v18 = [v6 contactStoreFuture];
    storeFuture = v7->_storeFuture;
    v7->_storeFuture = (CNFuture *)v18;

    uint64_t v20 = [v6 newFaultHandlerWithStorage:v7->_contacts];
    faultHandler = v7->_faultHandler;
    v7->_faultHandler = (ABSBulkFaultHandler *)v20;

    if (!v9 && [v6 policy] == 1)
    {
      v22 = [MEMORY[0x263F33560] sharedInstance];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __41__ABSAddressBook_initWithSettings_error___block_invoke;
      v26[3] = &unk_264223E58;
      v7 = v7;
      v27 = v7;
      [v22 requestAuthorization:1 completionHandler:v26];

      v23 = v27;
LABEL_10:
    }
  }

  return v7;
}

uint64_t __41__ABSAddressBook_initWithSettings_error___block_invoke()
{
  v0 = [MEMORY[0x263F33560] sharedInstance];
  uint64_t v1 = [v0 isAccessGranted];

  v2 = objc_opt_class();

  return [v2 callLocalChangeCallbacks:v1];
}

+ (BOOL)eraseAllDataAtLocationName:(id)a3 error:(id *)a4
{
  return [MEMORY[0x263EFEA58] eraseAllDataAtLocationWithName:a3 error:a4];
}

- (CNContactStore)store
{
  v2 = [(ABSAddressBook *)self storeFuture];
  objc_super v3 = [v2 result:0];

  return (CNContactStore *)v3;
}

- (id)_storageForRecordClass:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    v5 = [(ABSAddressBook *)self contacts];
  }
  else if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    v5 = [(ABSAddressBook *)self groups];
  }
  else if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    v5 = [(ABSAddressBook *)self sources];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)addRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[ABSAddressBook authorizationStatus] != 3)
  {
    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"ABAddressBookErrorDomain" code:1 userInfo:0];
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  if (!v6) {
    goto LABEL_7;
  }
  v7 = [v6 addressBook];

  if (v7) {
    goto LABEL_7;
  }
  id v8 = [(ABSAddressBook *)self _storageForRecordClass:objc_opt_class()];
  [v6 setAddressBook:self];
  [v8 addRecord:v6];

  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)recordUpdated:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && ([v4 addressBook],
        id v6 = (ABSAddressBook *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == self))
  {
    id v8 = [(ABSAddressBook *)self _storageForRecordClass:objc_opt_class()];
    char v7 = [v8 recordUpdated:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)removeRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = +[ABSAddressBook authorizationStatus];
  if (v7 == 3)
  {
    id v8 = [(ABSAddressBook *)self _storageForRecordClass:objc_opt_class()];
    [v8 deleteRecord:v6];
  }
  else if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"ABAddressBookErrorDomain" code:1 userInfo:0];
  }

  return v7 == 3;
}

- (BOOL)save:(id *)a3
{
  uint64_t v197 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F33560] sharedInstance];
  char v6 = [v5 isAccessGranted];

  if (v6)
  {
    v120 = a3;
    id v7 = objc_alloc_init(MEMORY[0x263EFEB48]);
    id v8 = [(ABSAddressBook *)self sources];
    BOOL v9 = [(ABSAddressBook *)self contacts];
    v123 = self;
    v130 = [(ABSAddressBook *)self groups];
    long long v179 = 0u;
    long long v180 = 0u;
    long long v181 = 0u;
    long long v182 = 0u;
    uint64_t v10 = [v8 insertedRecords];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v179 objects:v196 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v180;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v180 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v179 + 1) + 8 * i), "cnImpl", v120);
          [v7 addContainer:v15 toAccountWithIdentifier:0];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v179 objects:v196 count:16];
      }
      while (v12);
    }

    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    v16 = [v8 updatedRecords];
    v17 = [v16 allValues];

    uint64_t v18 = [v17 countByEnumeratingWithState:&v175 objects:v195 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v176;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v176 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v175 + 1) + 8 * j), "cnImpl", v120);
          [v7 updateContainer:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v175 objects:v195 count:16];
      }
      while (v19);
    }

    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    v23 = [v8 deletedRecords];
    v24 = [v23 allValues];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v171 objects:v194 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v172;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v172 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = objc_msgSend(*(id *)(*((void *)&v171 + 1) + 8 * k), "cnImpl", v120);
          [v7 deleteContainer:v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v171 objects:v194 count:16];
      }
      while (v26);
    }

    long long v169 = 0u;
    long long v170 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    v30 = [v9 insertedRecords];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v167 objects:v193 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v168;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v168 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v167 + 1) + 8 * m);
          v36 = objc_msgSend(v35, "source", v120);
          v37 = [v35 cnImpl];
          v38 = [v36 CNIdentifierString];
          [v7 addContact:v37 toContainerWithIdentifier:v38];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v167 objects:v193 count:16];
      }
      while (v32);
    }

    long long v165 = 0u;
    long long v166 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    v39 = [v9 deletedRecords];
    v40 = [v39 allValues];

    uint64_t v41 = [v40 countByEnumeratingWithState:&v163 objects:v192 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v164;
      do
      {
        for (uint64_t n = 0; n != v42; ++n)
        {
          if (*(void *)v164 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = objc_msgSend(*(id *)(*((void *)&v163 + 1) + 8 * n), "cnImpl", v120);
          [v7 deleteContact:v45];
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v163 objects:v192 count:16];
      }
      while (v42);
    }

    long long v161 = 0u;
    long long v162 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    v46 = [v9 updatedRecords];
    v47 = [v46 allValues];

    uint64_t v48 = [v47 countByEnumeratingWithState:&v159 objects:v191 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v160;
      do
      {
        for (iuint64_t i = 0; ii != v49; ++ii)
        {
          if (*(void *)v160 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = objc_msgSend(*(id *)(*((void *)&v159 + 1) + 8 * ii), "cnImpl", v120);
          [v7 updateContact:v52];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v159 objects:v191 count:16];
      }
      while (v49);
    }

    long long v157 = 0u;
    long long v158 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    v53 = [v130 insertedRecords];
    uint64_t v54 = [v53 countByEnumeratingWithState:&v155 objects:v190 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v156;
      do
      {
        for (juint64_t j = 0; jj != v55; ++jj)
        {
          if (*(void *)v156 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v155 + 1) + 8 * jj);
          v59 = objc_msgSend(v58, "source", v120);
          v60 = [v58 cnImpl];
          v61 = [v59 CNIdentifierString];
          [v7 addGroup:v60 toContainerWithIdentifier:v61];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v155 objects:v190 count:16];
      }
      while (v55);
    }

    long long v153 = 0u;
    long long v154 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    v62 = [v130 deletedRecords];
    v63 = [v62 allValues];

    uint64_t v64 = [v63 countByEnumeratingWithState:&v151 objects:v189 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v152;
      do
      {
        for (kuint64_t k = 0; kk != v65; ++kk)
        {
          if (*(void *)v152 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = objc_msgSend(*(id *)(*((void *)&v151 + 1) + 8 * kk), "cnImpl", v120);
          [v7 deleteGroup:v68];
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v151 objects:v189 count:16];
      }
      while (v65);
    }

    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    v69 = [v130 updatedRecords];
    v70 = [v69 allValues];

    uint64_t v71 = [v70 countByEnumeratingWithState:&v147 objects:v188 count:16];
    if (v71)
    {
      uint64_t v72 = v71;
      uint64_t v73 = *(void *)v148;
      do
      {
        for (muint64_t m = 0; mm != v72; ++mm)
        {
          if (*(void *)v148 != v73) {
            objc_enumerationMutation(v70);
          }
          v75 = objc_msgSend(*(id *)(*((void *)&v147 + 1) + 8 * mm), "cnImpl", v120);
          [v7 updateGroup:v75];
        }
        uint64_t v72 = [v70 countByEnumeratingWithState:&v147 objects:v188 count:16];
      }
      while (v72);
    }
    v121 = v9;
    v122 = v8;

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    obuint64_t j = [v130 recordsWithPendingMembershipAdditions];
    uint64_t v128 = [obj countByEnumeratingWithState:&v143 objects:v187 count:16];
    if (v128)
    {
      uint64_t v126 = *(void *)v144;
      do
      {
        for (nuint64_t n = 0; nn != v128; ++nn)
        {
          if (*(void *)v144 != v126) {
            objc_enumerationMutation(obj);
          }
          v77 = *(void **)(*((void *)&v143 + 1) + 8 * nn);
          v78 = objc_msgSend(v130, "addedMembersForRecord:", v77, v120);
          long long v139 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          uint64_t v79 = [v78 countByEnumeratingWithState:&v139 objects:v186 count:16];
          if (v79)
          {
            uint64_t v80 = v79;
            uint64_t v81 = *(void *)v140;
            do
            {
              for (uint64_t i1 = 0; i1 != v80; ++i1)
              {
                if (*(void *)v140 != v81) {
                  objc_enumerationMutation(v78);
                }
                v83 = *(void **)(*((void *)&v139 + 1) + 8 * i1);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v84 = [v83 cnImpl];
                  v85 = [v77 cnImpl];
                  [v7 addMember:v84 toGroup:v85];
                }
              }
              uint64_t v80 = [v78 countByEnumeratingWithState:&v139 objects:v186 count:16];
            }
            while (v80);
          }
        }
        uint64_t v128 = [obj countByEnumeratingWithState:&v143 objects:v187 count:16];
      }
      while (v128);
    }

    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id obja = [v130 recordsWithPendingMembershipDeletions];
    uint64_t v129 = [obja countByEnumeratingWithState:&v135 objects:v185 count:16];
    if (v129)
    {
      uint64_t v127 = *(void *)v136;
      do
      {
        for (uint64_t i2 = 0; i2 != v129; ++i2)
        {
          if (*(void *)v136 != v127) {
            objc_enumerationMutation(obja);
          }
          v87 = *(void **)(*((void *)&v135 + 1) + 8 * i2);
          v88 = objc_msgSend(v130, "removedMembersForRecord:", v87, v120);
          long long v131 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          uint64_t v89 = [v88 countByEnumeratingWithState:&v131 objects:v184 count:16];
          if (v89)
          {
            uint64_t v90 = v89;
            uint64_t v91 = *(void *)v132;
            do
            {
              for (uint64_t i3 = 0; i3 != v90; ++i3)
              {
                if (*(void *)v132 != v91) {
                  objc_enumerationMutation(v88);
                }
                v93 = *(void **)(*((void *)&v131 + 1) + 8 * i3);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v94 = [v93 cnImpl];
                  v95 = [v87 cnImpl];
                  [v7 removeMember:v94 fromGroup:v95];
                }
              }
              uint64_t v90 = [v88 countByEnumeratingWithState:&v131 objects:v184 count:16];
            }
            while (v90);
          }
        }
        uint64_t v129 = [obja countByEnumeratingWithState:&v135 objects:v185 count:16];
      }
      while (v129);
    }

    v96 = [(ABSAddressBook *)v123 store];
    int v97 = [v96 executeSaveRequest:v7 error:v120];

    if (v120)
    {
      if (*v120)
      {
        v98 = [*v120 domain];
        int v99 = [v98 isEqualToString:*MEMORY[0x263EFE180]];

        if (v99)
        {
          if ([*v120 code] == 100)
          {
            id *v120 = [MEMORY[0x263F087E8] errorWithDomain:@"ABAddressBookErrorDomain" code:1 userInfo:0];
          }
        }
      }
    }
    if (v97)
    {
      v100 = [(ABSAddressBook *)v123 contacts];
      v101 = [v100 insertedRecords];
      uint64_t v102 = [v101 count];

      if (v102)
      {
        v103 = [(ABSAddressBook *)v123 contacts];
        v104 = [v103 insertedRecords];
        uint64_t v183 = *MEMORY[0x263EFDFD8];
        v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v183 count:1];
        [(ABSAddressBook *)v123 updatePeople:v104 refetchingProperties:v105];
      }
      v106 = [(ABSAddressBook *)v123 contacts];
      [v106 commitPendingChanges];

      v107 = [(ABSAddressBook *)v123 groups];
      v108 = [v107 insertedRecords];
      uint64_t v109 = [v108 count];

      if (v109)
      {
        v110 = [(ABSAddressBook *)v123 groups];
        v111 = [v110 insertedRecords];
        [(ABSAddressBook *)v123 updateFetchingAllPropertiesForGroups:v111];
      }
      v112 = [(ABSAddressBook *)v123 groups];
      [v112 commitPendingChanges];

      v113 = [(ABSAddressBook *)v123 sources];
      v114 = [v113 insertedRecords];
      uint64_t v115 = [v114 count];

      if (v115)
      {
        v116 = [(ABSAddressBook *)v123 sources];
        v117 = [v116 insertedRecords];
        [(ABSAddressBook *)v123 updateFetchingAllPropertiesForSources:v117];
      }
      v118 = [(ABSAddressBook *)v123 sources];
      [v118 commitPendingChanges];
    }
  }
  else if (a3)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"ABAddressBookErrorDomain" code:1 userInfo:0];
    LOBYTE(v97) = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v97) = 0;
  }
  return v97;
}

- (BOOL)hasUnsavedChanges
{
  objc_super v3 = [(ABSAddressBook *)self groups];
  if ([v3 hasUnsavedChanges])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(ABSAddressBook *)self contacts];
    if ([v5 hasUnsavedChanges])
    {
      char v4 = 1;
    }
    else
    {
      char v6 = [(ABSAddressBook *)self sources];
      char v4 = [v6 hasUnsavedChanges];
    }
  }

  return v4;
}

- (void)revert
{
  objc_super v3 = [(ABSAddressBook *)self groups];
  [v3 revert];

  char v4 = [(ABSAddressBook *)self contacts];
  [v4 revert];

  id v5 = [(ABSAddressBook *)self sources];
  [v5 revert];
}

- (void)registerExternalChangeCallback:(void *)a3 context:(void *)a4
{
  id v7 = [(ABSAddressBook *)self changeCallbacks];
  char v6 = [MEMORY[0x263F08B88] currentThread];
  [v7 addExternalCallback:a3 onThread:v6 withContext:a4];
}

- (void)unregisterExternalChangeCallback:(void *)a3 context:(void *)a4
{
  id v6 = [(ABSAddressBook *)self changeCallbacks];
  [v6 removeExternalCallback:a3 withContext:a4];
}

+ (id)localizedLabelForLabel:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:v4 value:v4 table:@"Localized"];

  return v6;
}

- (int64_t)personCount
{
  v30[1] = *MEMORY[0x263EF8340];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = -1;
  objc_super v3 = [MEMORY[0x263F33560] sharedInstance];
  int v4 = [v3 isAccessGranted];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263EFEA18]);
    v30[0] = *MEMORY[0x263EFDFE0];
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    id v7 = (void *)[v5 initWithKeysToFetch:v6];

    id v8 = (void *)MEMORY[0x263EFFA08];
    BOOL v9 = [(ABSAddressBook *)self contacts];
    uint64_t v10 = [v9 deletedRecords];
    uint64_t v11 = [(id)v10 allValues];
    uint64_t v12 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_11);
    uint64_t v13 = [v8 setWithArray:v12];

    [v7 setUnifyResults:0];
    v27[3] = 0;
    uint64_t v14 = [(ABSAddressBook *)self store];
    id v25 = 0;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    v21 = __29__ABSAddressBook_personCount__block_invoke_2;
    v22 = &unk_264223EA0;
    id v15 = v13;
    id v23 = v15;
    v24 = &v26;
    LOBYTE(v10) = [v14 enumerateContactsWithFetchRequest:v7 error:&v25 usingBlock:&v19];
    id v16 = v25;

    if ((v10 & 1) == 0) {
      NSLog(&cfstr_ErrorFetching.isa, v16, v19, v20, v21, v22);
    }
  }
  int64_t v17 = v27[3];
  _Block_object_dispose(&v26, 8);
  return v17;
}

id __29__ABSAddressBook_personCount__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  objc_super v3 = [v2 cnImpl];

  if (objc_opt_isKindOfClass()) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 identifier];

  return v6;
}

void __29__ABSAddressBook_personCount__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  int v4 = [a2 identifier];
  LOBYTE(v3) = [v3 containsObject:v4];

  if ((v3 & 1) == 0) {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (id)allPeople
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFEA18]);
  int v4 = +[ABSPerson defaultKeysToFetch];
  id v5 = (void *)[v3 initWithKeysToFetch:v4];

  [v5 setUnifyResults:0];
  [v5 setMutableObjects:1];
  id v6 = (void *)MEMORY[0x263EFF9C0];
  id v7 = [(ABSAddressBook *)self contacts];
  id v8 = [v7 records];
  BOOL v9 = [v8 allValues];
  uint64_t v10 = objc_msgSend(v9, "_cn_map:", &__block_literal_global_30);
  uint64_t v11 = [v6 setWithArray:v10];

  uint64_t v12 = [(ABSAddressBook *)self contacts];
  uint64_t v13 = [v12 deletedRecords];
  uint64_t v14 = [v13 allValues];
  id v15 = objc_msgSend(v14, "_cn_map:", &__block_literal_global_30);
  [v11 addObjectsFromArray:v15];

  id v16 = [MEMORY[0x263EFF980] array];
  int64_t v17 = [(ABSAddressBook *)self store];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __27__ABSAddressBook_allPeople__block_invoke_2;
  v36[3] = &unk_264223EC8;
  id v18 = v11;
  id v37 = v18;
  id v19 = v16;
  id v38 = v19;
  [v17 enumerateContactsWithFetchRequest:v5 error:0 usingBlock:v36];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v26 = [(ABSAddressBook *)self contacts];
        uint64_t v27 = [v26 cnImplFetched:v25 creationBlock:&__block_literal_global_35];

        [v27 setAddressBook:self];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v22);
  }

  uint64_t v28 = [(ABSAddressBook *)self contacts];
  uint64_t v29 = [v28 records];
  v30 = [v29 allValues];

  return v30;
}

id __27__ABSAddressBook_allPeople__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 cnImpl];
  id v3 = [v2 identifier];

  return v3;
}

void __27__ABSAddressBook_allPeople__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v8 = v3;
  id v5 = [v3 identifier];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0)
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = (void *)[v8 mutableCopy];
    [v6 addObject:v7];
  }
}

ABSPerson *__27__ABSAddressBook_allPeople__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ABSPerson alloc] initWithMutableContact:v2];

  return v3;
}

- (id)peopleWithCNIdentifiers:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v51 = [MEMORY[0x263EFF980] array];
  v45 = [MEMORY[0x263EFF980] array];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  obuint64_t j = v3;
  uint64_t v48 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v67;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v67 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v4;
        uint64_t v5 = *(void *)(*((void *)&v66 + 1) + 8 * v4);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v6 = [(ABSAddressBook *)self contacts];
        id v7 = [v6 records];
        id v8 = [v7 allValues];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v72 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          char v11 = 0;
          uint64_t v12 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v63 != v12) {
                objc_enumerationMutation(v8);
              }
              uint64_t v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              id v15 = [v14 cnImpl];
              id v16 = [v15 identifier];
              int v17 = [v16 isEqual:v5];

              if (v17)
              {
                [v51 addObject:v14];
                char v11 = 1;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v72 count:16];
          }
          while (v10);

          if (v11) {
            goto LABEL_29;
          }
        }
        else
        {
        }
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v18 = [(ABSAddressBook *)self contacts];
        id v19 = [v18 deletedRecords];
        id v20 = [v19 allValues];

        uint64_t v21 = [v20 countByEnumeratingWithState:&v58 objects:v71 count:16];
        if (!v21)
        {

LABEL_28:
          [v45 addObject:v5];
          goto LABEL_29;
        }
        uint64_t v22 = v21;
        char v23 = 0;
        uint64_t v24 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v59 != v24) {
              objc_enumerationMutation(v20);
            }
            uint64_t v26 = [*(id *)(*((void *)&v58 + 1) + 8 * j) cnImpl];
            uint64_t v27 = [v26 identifier];
            char v28 = [v27 isEqual:v5];

            v23 |= v28;
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v58 objects:v71 count:16];
        }
        while (v22);

        if ((v23 & 1) == 0) {
          goto LABEL_28;
        }
LABEL_29:
        uint64_t v4 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v48);
  }

  id v29 = objc_alloc(MEMORY[0x263EFEA18]);
  v30 = +[ABSPerson defaultKeysToFetch];
  uint64_t v31 = (void *)[v29 initWithKeysToFetch:v30];

  long long v32 = [MEMORY[0x263EFE9F8] predicateForContactsWithIdentifiers:v45];
  [v31 setPredicate:v32];

  [v31 setUnifyResults:0];
  [v31 setMutableObjects:1];
  long long v33 = [MEMORY[0x263EFF980] array];
  long long v34 = [(ABSAddressBook *)self store];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __42__ABSAddressBook_peopleWithCNIdentifiers___block_invoke;
  v56[3] = &unk_264223F10;
  id v35 = v33;
  id v57 = v35;
  [v34 enumerateContactsWithFetchRequest:v31 error:0 usingBlock:v56];

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v36 = v35;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v52 objects:v70 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v53 != v39) {
          objc_enumerationMutation(v36);
        }
        uint64_t v41 = *(void *)(*((void *)&v52 + 1) + 8 * k);
        uint64_t v42 = [(ABSAddressBook *)self contacts];
        uint64_t v43 = [v42 cnImplFetched:v41 creationBlock:&__block_literal_global_37];

        [v43 setAddressBook:self];
        [v51 addObject:v43];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v52 objects:v70 count:16];
    }
    while (v38);
  }

  return v51;
}

uint64_t __42__ABSAddressBook_peopleWithCNIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

ABSPerson *__42__ABSAddressBook_peopleWithCNIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ABSPerson alloc] initWithMutableContact:v2];

  return v3;
}

- (id)personWithRecordID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:");
  id v6 = [(ABSAddressBook *)self contacts];
  id v7 = [v6 records];
  id v8 = [v7 objectForKey:v5];

  if (!v8)
  {
    uint64_t v9 = [(ABSAddressBook *)self contacts];
    uint64_t v10 = [v9 deletedRecords];
    char v11 = [v10 objectForKey:v5];

    if (v11)
    {
      id v8 = 0;
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x263EFEA18]);
      uint64_t v13 = +[ABSPerson defaultKeysToFetch];
      uint64_t v14 = (void *)[v12 initWithKeysToFetch:v13];

      id v15 = [MEMORY[0x263EFE9F8] predicateForLegacyIdentifier:v3];
      [v14 setPredicate:v15];

      [v14 setUnifyResults:0];
      [v14 setMutableObjects:1];
      id v16 = [MEMORY[0x263EFF980] array];
      int v17 = [(ABSAddressBook *)self store];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __37__ABSAddressBook_personWithRecordID___block_invoke;
      v24[3] = &unk_264223F10;
      id v18 = v16;
      id v25 = v18;
      [v17 enumerateContactsWithFetchRequest:v14 error:0 usingBlock:v24];

      uint64_t v19 = [v18 lastObject];
      if (v19)
      {
        id v20 = (void *)v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v21 = [v20 mutableCopy];

          id v20 = (void *)v21;
        }
        uint64_t v22 = [(ABSAddressBook *)self contacts];
        id v8 = [v22 cnImplFetched:v20 creationBlock:&__block_literal_global_41];

        [v8 setAddressBook:self];
      }
      else
      {
        id v8 = 0;
      }
    }
  }

  return v8;
}

uint64_t __37__ABSAddressBook_personWithRecordID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

ABSPerson *__37__ABSAddressBook_personWithRecordID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[ABSPerson alloc] initWithMutableContact:v2];

  return v3;
}

- (id)findPersonMatchingURL:(id)a3
{
  uint64_t v4 = [MEMORY[0x263EFE9F8] predicateForContactMatchingURLString:a3];
  uint64_t v5 = [ABSPersonFetchRequest alloc];
  id v6 = [(ABSPersonFetchRequest *)v5 initWithPredicate:v4 additionalKeysToFetch:MEMORY[0x263EFFA68] sortOrder:0];
  id v7 = [(ABSAddressBook *)self _peoplePreferringExistingRecordsForFetchRequest:v6];
  id v8 = [v7 firstObject];

  return v8;
}

- (id)findPersonMatchingEmailAddress:(id)a3
{
  uint64_t v4 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingEmailAddress:a3];
  uint64_t v5 = [ABSPersonFetchRequest alloc];
  id v6 = [(ABSPersonFetchRequest *)v5 initWithPredicate:v4 additionalKeysToFetch:MEMORY[0x263EFFA68] sortOrder:0];
  id v7 = [(ABSAddressBook *)self _peoplePreferringExistingRecordsForFetchRequest:v6];
  id v8 = [v7 firstObject];

  return v8;
}

- (id)findPersonMatchingPhoneNumber:(id)a3 country:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = (void *)MEMORY[0x263EFE9F8];
  id v7 = (objc_class *)MEMORY[0x263EFEB28];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)[[v7 alloc] initWithStringValue:v9 countryCode:v8];

  char v11 = [v6 predicateForContactsMatchingPhoneNumber:v10];

  id v12 = [ABSPersonFetchRequest alloc];
  v18[0] = *MEMORY[0x263EFE070];
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  uint64_t v14 = [(ABSPersonFetchRequest *)v12 initWithPredicate:v11 additionalKeysToFetch:v13 sortOrder:0];

  id v15 = [(ABSAddressBook *)self _peoplePreferringExistingRecordsForFetchRequest:v14];
  id v16 = [v15 firstObject];

  return v16;
}

- (id)contactsWithIdentifiers:(id)a3 keysToFetch:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFEA18];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithKeysToFetch:v7];

  uint64_t v10 = [MEMORY[0x263EFE9F8] predicateForContactsWithIdentifiers:v8];

  [v9 setPredicate:v10];
  [v9 setUnifyResults:0];
  [v9 setMutableObjects:0];
  char v11 = [MEMORY[0x263EFF980] array];
  id v12 = [(ABSAddressBook *)self store];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __54__ABSAddressBook_contactsWithIdentifiers_keysToFetch___block_invoke;
  v16[3] = &unk_264223F10;
  id v17 = v11;
  id v13 = v11;
  [v12 enumerateContactsWithFetchRequest:v9 error:0 usingBlock:v16];

  uint64_t v14 = (void *)[v13 copy];

  return v14;
}

uint64_t __54__ABSAddressBook_contactsWithIdentifiers_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)updatePeople:(id)a3 refetchingProperties:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v28 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_45);
  id v29 = v7;
  id v8 = -[ABSAddressBook contactsWithIdentifiers:keysToFetch:](self, "contactsWithIdentifiers:keysToFetch:");
  id v9 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v16 = [v15 identifier];
        [v9 setObject:v15 forKey:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v12);
  }
  uint64_t v27 = v10;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        char v23 = [v22 cnImpl];
        uint64_t v24 = [v23 identifier];
        id v25 = [v9 objectForKey:v24];

        if (v25)
        {
          uint64_t v26 = objc_msgSend(v29, "_cn_map:", &__block_literal_global_49_0);
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          void v30[2] = __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_53;
          v30[3] = &unk_264223F58;
          id v31 = v25;
          long long v32 = v22;
          objc_msgSend(v26, "_cn_each:", v30);
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v19);
  }
}

id __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 cnImpl];
  uint64_t v3 = [v2 identifier];

  return v3;
}

id __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x263EFE9C8] contactPropertiesByKey];
  uint64_t v4 = [v3 objectForKeyedSubscript:v2];

  if (!v4
    || ([MEMORY[0x263EFF9D0] null],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4 == v5))
  {
    id v6 = +[ABSLog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_2_cold_1();
    }
  }

  return v4;
}

void __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v6 = [v4 CNValueForContact:v3];
  uint64_t v5 = [*(id *)(a1 + 40) cnImpl];
  [v4 setCNValue:v6 onContact:v5];
}

- (void)completePerson:(id)a3 withKeysToFetch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ABSAddressBook *)self faultHandler];
  [v8 completePerson:v7 withKeysToFetch:v6];
}

- (id)_resultRecordsFromFetchedCNImpls:(id)a3 mergedWithStorage:(id)a4 creationBlock:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v26 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v29;
    *(void *)&long long v11 = 138543362;
    long long v24 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "iOSLegacyIdentifier", v24));
        id v17 = [v8 records];
        uint64_t v18 = [v17 objectForKey:v16];

        if (v18)
        {
          [v9 addObject:v18];
        }
        else
        {
          uint64_t v19 = [v8 deletedRecords];
          uint64_t v20 = [v19 objectForKey:v16];

          if (!v20)
          {
            uint64_t v21 = [v8 cnImplFetched:v15 creationBlock:v26];
            if (v21)
            {
              [v9 addObject:v21];
              [v21 setAddressBook:self];
            }
            else
            {
              uint64_t v22 = +[ABSLog log];
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v24;
                long long v33 = v15;
                _os_log_error_impl(&dword_214A03000, v22, OS_LOG_TYPE_ERROR, "Could not create new AB object from %{public}@", buf, 0xCu);
              }
            }
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)_peoplePreferringExistingRecordsForFetchRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ABSPerson defaultKeysToFetch];
  uint64_t v6 = *MEMORY[0x263F334B0];
  id v7 = [v4 additionalKeysToFetch];
  LOBYTE(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  if ((v6 & 1) == 0)
  {
    id v8 = [v4 additionalKeysToFetch];
    uint64_t v9 = [v5 arrayByAddingObjectsFromArray:v8];

    uint64_t v5 = (void *)v9;
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFEA18]) initWithKeysToFetch:v5];
  long long v11 = [v4 predicate];
  [v10 setPredicate:v11];

  [v10 setUnifyResults:0];
  [v10 setMutableObjects:1];
  if ([v4 sortOrder])
  {
    if ([v4 sortOrder] == 1) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 2;
  }
  [v10 setSortOrder:v12];
  uint64_t v13 = [MEMORY[0x263EFF980] array];
  uint64_t v14 = [(ABSAddressBook *)self store];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __66__ABSAddressBook__peoplePreferringExistingRecordsForFetchRequest___block_invoke;
  v19[3] = &unk_264223F10;
  id v20 = v13;
  id v15 = v13;
  [v14 enumerateContactsWithFetchRequest:v10 error:0 usingBlock:v19];

  id v16 = [(ABSAddressBook *)self contacts];
  id v17 = [(ABSAddressBook *)self _resultRecordsFromFetchedCNImpls:v15 mergedWithStorage:v16 creationBlock:&__block_literal_global_56];

  return v17;
}

uint64_t __66__ABSAddressBook__peoplePreferringExistingRecordsForFetchRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

ABSPerson *__66__ABSAddressBook__peoplePreferringExistingRecordsForFetchRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [ABSPerson alloc];
  id v4 = (void *)[v2 mutableCopy];

  uint64_t v5 = [(ABSPerson *)v3 initWithMutableContact:v4];

  return v5;
}

- (id)peopleInSource:(id)a3 sortOrder:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFE9F8];
    id v7 = [a3 cnImpl];
    id v8 = [v7 identifier];
    uint64_t v9 = [v6 predicateForContactsInContainerWithIdentifier:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [ABSPersonFetchRequest alloc];
  long long v11 = [(ABSPersonFetchRequest *)v10 initWithPredicate:v9 additionalKeysToFetch:MEMORY[0x263EFFA68] sortOrder:v4];
  uint64_t v12 = [(ABSAddressBook *)self _peoplePreferringExistingRecordsForFetchRequest:v11];

  return v12;
}

- (id)peopleInGroup:(id)a3 sortOrder:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = (objc_class *)MEMORY[0x263EFEA18];
  id v7 = a3;
  id v8 = [v6 alloc];
  v25[0] = *MEMORY[0x263EFDFE0];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  uint64_t v10 = (void *)[v8 initWithKeysToFetch:v9];

  long long v11 = (void *)MEMORY[0x263EFE9F8];
  uint64_t v12 = [v7 cnImpl];

  uint64_t v13 = [v12 identifier];
  uint64_t v14 = [v11 predicateForContactsInGroupWithIdentifier:v13];
  [v10 setPredicate:v14];

  [v10 setUnifyResults:0];
  id v15 = [MEMORY[0x263EFF980] array];
  id v16 = [(ABSAddressBook *)self store];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __42__ABSAddressBook_peopleInGroup_sortOrder___block_invoke;
  v23[3] = &unk_264223F10;
  id v17 = v15;
  id v24 = v17;
  [v16 enumerateContactsWithFetchRequest:v10 error:0 usingBlock:v23];

  uint64_t v18 = [MEMORY[0x263EFE9F8] predicateForContactsWithIdentifiers:v17];
  uint64_t v19 = [ABSPersonFetchRequest alloc];
  id v20 = [(ABSPersonFetchRequest *)v19 initWithPredicate:v18 additionalKeysToFetch:MEMORY[0x263EFFA68] sortOrder:v4];
  uint64_t v21 = [(ABSAddressBook *)self _peoplePreferringExistingRecordsForFetchRequest:v20];
  if (![v21 count])
  {

    uint64_t v21 = 0;
  }

  return v21;
}

void __42__ABSAddressBook_peopleInGroup_sortOrder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

- (id)peopleMatchingNameString:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFEA18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = +[ABSPerson defaultKeysToFetch];
  id v8 = (void *)[v6 initWithKeysToFetch:v7];

  uint64_t v9 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingName:v5];

  [v8 setPredicate:v9];
  [v8 setUnifyResults:0];
  [v8 setMutableObjects:1];
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v11 = [(ABSAddressBook *)self store];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__ABSAddressBook_peopleMatchingNameString___block_invoke;
  v16[3] = &unk_264223F10;
  id v17 = v10;
  id v12 = v10;
  [v11 enumerateContactsWithFetchRequest:v8 error:0 usingBlock:v16];

  uint64_t v13 = [(ABSAddressBook *)self contacts];
  uint64_t v14 = [(ABSAddressBook *)self _resultRecordsFromFetchedCNImpls:v12 mergedWithStorage:v13 creationBlock:&__block_literal_global_58_0];

  return v14;
}

uint64_t __43__ABSAddressBook_peopleMatchingNameString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

ABSPerson *__43__ABSAddressBook_peopleMatchingNameString___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ABSPerson alloc] initWithMutableContact:v2];

  return v3;
}

- (id)mePerson
{
  id v3 = [MEMORY[0x263EFE9F8] predicateForMeContact];
  uint64_t v4 = [ABSPersonFetchRequest alloc];
  id v5 = [(ABSPersonFetchRequest *)v4 initWithPredicate:v3 additionalKeysToFetch:MEMORY[0x263EFFA68] sortOrder:0];
  id v6 = [(ABSAddressBook *)self _peoplePreferringExistingRecordsForFetchRequest:v5];
  id v7 = [v6 firstObject];

  return v7;
}

- (id)peopleLinkedToPerson:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFE9F8];
  id v5 = [a3 cnImpl];
  id v6 = [v4 predicateForContactsLinkedToContact:v5];

  id v7 = [ABSPersonFetchRequest alloc];
  v12[0] = *MEMORY[0x263EFE020];
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  uint64_t v9 = [(ABSPersonFetchRequest *)v7 initWithPredicate:v6 additionalKeysToFetch:v8 sortOrder:+[ABSPerson sortOrdering]];

  uint64_t v10 = [(ABSAddressBook *)self _peoplePreferringExistingRecordsForFetchRequest:v9];

  return v10;
}

- (BOOL)linkPerson:(id)a3 toPerson:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFEB48];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  uint64_t v10 = [v8 cnImpl];

  long long v11 = [v7 cnImpl];

  [v9 linkContact:v10 toContact:v11];
  id v12 = [(ABSAddressBook *)self store];
  id v17 = 0;
  char v13 = [v12 executeSaveRequest:v9 error:&v17];
  id v14 = v17;

  if ((v13 & 1) == 0)
  {
    id v15 = +[ABSLog log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ABSAddressBook linkPerson:toPerson:]();
    }
  }
  return v13;
}

- (BOOL)unlinkPerson:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263EFEB48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 cnImpl];

  [v6 unlinkContact:v7];
  id v8 = [(ABSAddressBook *)self store];
  id v13 = 0;
  char v9 = [v8 executeSaveRequest:v6 error:&v13];
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    long long v11 = +[ABSLog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ABSAddressBook unlinkPerson:]();
    }
  }
  return v9;
}

- (id)_sourcesPreferringExistingRecordsFetchedWithPredicate:(id)a3
{
  id v4 = a3;
  id v5 = [(ABSAddressBook *)self store];
  id v6 = [v5 containersMatchingPredicate:v4 error:0];

  id v7 = [(ABSAddressBook *)self sources];
  id v8 = [(ABSAddressBook *)self _resultRecordsFromFetchedCNImpls:v6 mergedWithStorage:v7 creationBlock:&__block_literal_global_61_0];

  return v8;
}

ABSSource *__72__ABSAddressBook__sourcesPreferringExistingRecordsFetchedWithPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [ABSSource alloc];
  id v4 = (void *)[v2 mutableCopy];

  id v5 = [(ABSSource *)v3 initWithMutableContainer:v4];

  return v5;
}

- (id)sourceWithRecordID:(int)a3
{
  id v4 = [MEMORY[0x263EFEA80] predicateForiOSLegacyIdentifier:*(void *)&a3];
  id v5 = [(ABSAddressBook *)self _sourcesPreferringExistingRecordsFetchedWithPredicate:v4];
  id v6 = [v5 firstObject];

  return v6;
}

- (id)allSources
{
  return [(ABSAddressBook *)self _sourcesPreferringExistingRecordsFetchedWithPredicate:0];
}

- (id)defaultSource
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = [(ABSAddressBook *)self store];
  id v4 = [v3 defaultContainerIdentifier];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263EFEA80];
    v11[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    id v7 = [v5 predicateForContainersWithIdentifiers:v6];
    id v8 = [(ABSAddressBook *)self _sourcesPreferringExistingRecordsFetchedWithPredicate:v7];
    char v9 = [v8 firstObject];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)localSource
{
  id v3 = [MEMORY[0x263EFEA80] predicateForLocalContainerIncludingDisabled:0];
  id v4 = [(ABSAddressBook *)self _sourcesPreferringExistingRecordsFetchedWithPredicate:v3];
  id v5 = [v4 firstObject];

  return v5;
}

- (id)sourceForRecord:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x263EFEA80];
    id v6 = [v4 cnImpl];
    id v7 = [v6 identifier];
    uint64_t v8 = [v5 predicateForContainerOfContactWithIdentifier:v7];
LABEL_5:
    id v10 = (void *)v8;

LABEL_6:
    long long v11 = [(ABSAddressBook *)self _sourcesPreferringExistingRecordsFetchedWithPredicate:v10];
    id v12 = [v11 firstObject];

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v9 = (void *)MEMORY[0x263EFEA80];
    id v6 = [v4 cnImpl];
    id v7 = [v6 identifier];
    uint64_t v8 = [v9 predicateForContainerOfGroupWithIdentifier:v7];
    goto LABEL_5;
  }
  objc_opt_class();
  id v10 = 0;
  id v12 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (void)updateFetchingAllPropertiesForSources:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_65);
  id v17 = objc_msgSend(v18, "_cn_map:", &__block_literal_global_68);
  id v5 = objc_msgSend(MEMORY[0x263EFEA80], "predicateForContainersWithIdentifiers:");
  id v6 = [(ABSAddressBook *)self store];
  id v7 = [v6 containersMatchingPredicate:v5 error:0];

  uint64_t v8 = objc_msgSend(v7, "_cn_indexBy:", &__block_literal_global_71);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v15 = [v14 CNIdentifierString];
        id v16 = [v8 objectForKey:v15];

        [v14 updateAllValuesWithValuesFromContainer:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

uint64_t __56__ABSAddressBook_updateFetchingAllPropertiesForSources___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cnImpl];
}

uint64_t __56__ABSAddressBook_updateFetchingAllPropertiesForSources___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __56__ABSAddressBook_updateFetchingAllPropertiesForSources___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)addMember:(id)a3 toGroup:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();
  uint64_t v12 = [v8 addressBook];
  if (v12 == self)
  {
    id v13 = [v9 addressBook];

    if (v13 == self)
    {
      char v14 = v11 & isKindOfClass;
      goto LABEL_5;
    }
  }
  else
  {
  }
  char v14 = 0;
LABEL_5:
  int v15 = [v9 id];
  id v16 = [v8 source];
  id v17 = [v9 source];

  if (v16 == v17 && v15 != -1 && (v14 & 1) != 0)
  {
    uint64_t v18 = [(ABSAddressBook *)self groups];
    char v19 = [v18 addMemberRecord:v8 toRecord:v9];
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"ABAddressBookErrorDomain" code:0 userInfo:0];
    char v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)removeMember:(id)a3 fromGroup:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  unsigned __int8 v10 = objc_opt_isKindOfClass();
  char v11 = [v7 addressBook];
  if (v11 != self)
  {

LABEL_4:
    [v8 id];
    goto LABEL_5;
  }
  uint64_t v12 = [v8 addressBook];

  if (v12 != self) {
    goto LABEL_4;
  }
  if ((([v8 id] != -1) & v10 & isKindOfClass) == 1)
  {
    int v15 = [(ABSAddressBook *)self groups];
    char v13 = [v15 removeMemberRecord:v7 fromRecord:v8];

    goto LABEL_6;
  }
LABEL_5:
  char v13 = 0;
LABEL_6:

  return v13;
}

- (id)allGroups
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = [(ABSAddressBook *)self groups];
  id v5 = [v4 records];
  id v6 = [v5 allValues];
  id v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_74);
  id v8 = [v3 setWithArray:v7];

  id v9 = [(ABSAddressBook *)self groups];
  unsigned __int8 v10 = [v9 deletedRecords];
  char v11 = [v10 allValues];
  uint64_t v12 = objc_msgSend(v11, "_cn_map:", &__block_literal_global_74);
  [v8 addObjectsFromArray:v12];

  char v13 = [(ABSAddressBook *)self store];
  char v14 = [v13 groupsMatchingPredicate:0 error:0];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        long long v21 = objc_msgSend(v20, "identifier", (void)v31);
        char v22 = [v8 containsObject:v21];

        if ((v22 & 1) == 0)
        {
          char v23 = [(ABSAddressBook *)self groups];
          uint64_t v24 = [v23 cnImplFetched:v20 creationBlock:&__block_literal_global_77];

          [v24 setAddressBook:self];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  id v25 = [(ABSAddressBook *)self groups];
  id v26 = [v25 records];
  uint64_t v27 = [v26 allValues];

  if ([v27 count]) {
    long long v28 = v27;
  }
  else {
    long long v28 = 0;
  }
  id v29 = v28;

  return v29;
}

id __27__ABSAddressBook_allGroups__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 cnImpl];
  id v3 = [v2 identifier];

  return v3;
}

ABSGroup *__27__ABSAddressBook_allGroups__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [ABSGroup alloc];
  id v4 = (void *)[v2 mutableCopy];

  id v5 = [(ABSGroup *)v3 initWithMutableGroup:v4];

  return v5;
}

- (int64_t)groupCount
{
  id v3 = [MEMORY[0x263F33560] sharedInstance];
  int v4 = [v3 isAccessGranted];

  if (!v4) {
    return -1;
  }
  id v5 = [(ABSAddressBook *)self allGroups];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)groupWithRecordID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_msgSend(NSNumber, "numberWithInt:");
  int64_t v6 = [(ABSAddressBook *)self groups];
  id v7 = [v6 records];
  id v8 = [v7 objectForKey:v5];

  if (!v8)
  {
    id v9 = [(ABSAddressBook *)self groups];
    unsigned __int8 v10 = [v9 deletedRecords];
    char v11 = [v10 objectForKey:v5];

    if (v11)
    {
      id v8 = 0;
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263EFEAB8] predicateForiOSLegacyIdentifier:v3];
      char v13 = [(ABSAddressBook *)self store];
      char v14 = [v13 groupsMatchingPredicate:v12 error:0];

      id v15 = [v14 firstObject];
      if (v15)
      {
        uint64_t v16 = [(ABSAddressBook *)self groups];
        id v8 = [v16 cnImplFetched:v15 creationBlock:&__block_literal_global_80];

        [v8 setAddressBook:self];
      }
      else
      {
        id v8 = 0;
      }
    }
  }

  return v8;
}

ABSGroup *__36__ABSAddressBook_groupWithRecordID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [ABSGroup alloc];
  int v4 = (void *)[v2 mutableCopy];

  id v5 = [(ABSGroup *)v3 initWithMutableGroup:v4];

  return v5;
}

- (void)updateFetchingAllPropertiesForGroups:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v27 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_83);
  id v26 = objc_msgSend(v27, "_cn_map:", &__block_literal_global_86);
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFEAB8], "predicateForGroupsWithIdentifiers:");
  int64_t v6 = [(ABSAddressBook *)self store];
  id v25 = (void *)v5;
  id v7 = [v6 groupsMatchingPredicate:v5 error:0];

  id v8 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        char v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v15 = [v14 identifier];
        [v8 setObject:v14 forKey:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v4;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        char v22 = [v21 cnImpl];
        char v23 = [v22 identifier];
        uint64_t v24 = [v8 objectForKey:v23];

        if (v24) {
          [v21 updateAllValuesWithValuesFromGroup:v24];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v18);
  }
}

uint64_t __55__ABSAddressBook_updateFetchingAllPropertiesForGroups___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cnImpl];
}

uint64_t __55__ABSAddressBook_updateFetchingAllPropertiesForGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)groupsInSource:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x263EFEAB8];
    uint64_t v5 = [a3 cnImpl];
    int64_t v6 = [v5 identifier];
    id v7 = [v4 predicateForGroupsInContainerWithIdentifier:v6];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(ABSAddressBook *)self store];
  id v9 = [v8 groupsMatchingPredicate:v7 error:0];

  uint64_t v10 = [(ABSAddressBook *)self groups];
  uint64_t v11 = [(ABSAddressBook *)self _resultRecordsFromFetchedCNImpls:v9 mergedWithStorage:v10 creationBlock:&__block_literal_global_88];

  return v11;
}

ABSGroup *__33__ABSAddressBook_groupsInSource___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [ABSGroup alloc];
  id v4 = (void *)[v2 mutableCopy];

  uint64_t v5 = [(ABSGroup *)v3 initWithMutableGroup:v4];

  return v5;
}

+ (int64_t)authorizationStatus
{
  int64_t result = [MEMORY[0x263EFEA58] authorizationStatusForEntityType:0];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

+ (void)requestAccessWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F33560] sharedInstance];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__ABSAddressBook_requestAccessWithCompletion___block_invoke;
  v7[3] = &unk_264224080;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 requestAuthorization:1 completionHandler:v7];
}

uint64_t __46__ABSAddressBook_requestAccessWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F33560] sharedInstance];
  uint64_t v3 = [v2 isAccessGranted];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, v3, 0);
  }
  uint64_t v5 = *(void **)(a1 + 40);

  return [v5 callLocalChangeCallbacks:v3];
}

+ (void)callLocalChangeCallbacks:(BOOL)a3
{
  BOOL v3 = a3;
  obuint64_t j = a1;
  objc_sync_enter(obj);
  if (!CNLinkedOnOrAfter() && v3 && (_calledLocalChangeCallbacks & 1) == 0)
  {
    _calledLocalChangeCallbacks = 1;
    uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"ABSInvokeAllLocalCallbacksNotification" object:obj];
  }
  objc_sync_exit(obj);
}

- (id)uniqueDatabaseVersionIdentifier
{
  id v2 = [(ABSAddressBook *)self store];
  id v7 = 0;
  BOOL v3 = [v2 identifierWithError:&v7];
  id v4 = v7;

  if (!v3)
  {
    uint64_t v5 = +[ABSLog log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ABSAddressBook uniqueDatabaseVersionIdentifier]();
    }
  }

  return v3;
}

- (int)saveSequenceCount
{
  id v2 = [(ABSAddressBook *)self store];
  int v3 = [v2 saveSequenceCount];

  return v3;
}

- (ABSAddressBookContextStorage)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (ABSChangeCallbacks)changeCallbacks
{
  return (ABSChangeCallbacks *)objc_getProperty(self, a2, 16, 1);
}

- (CNFuture)storeFuture
{
  return self->_storeFuture;
}

- (ABSBulkFaultHandler)faultHandler
{
  return self->_faultHandler;
}

- (ABSAddressBookContextStorage)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (ABSAddressBookContextStorage)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_faultHandler, 0);
  objc_storeStrong((id *)&self->_storeFuture, 0);
  objc_storeStrong((id *)&self->_changeCallbacks, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

void __52__ABSAddressBook_updatePeople_refetchingProperties___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214A03000, v0, v1, "No description available for property %{public}@", v2, v3, v4, v5, v6);
}

- (void)linkPerson:toPerson:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214A03000, v0, v1, "Couldn't link contacts with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)unlinkPerson:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214A03000, v0, v1, "Couldn't unlink contact with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)uniqueDatabaseVersionIdentifier
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214A03000, v0, v1, "Could not obtain database version identifier: %{public}@", v2, v3, v4, v5, v6);
}

@end