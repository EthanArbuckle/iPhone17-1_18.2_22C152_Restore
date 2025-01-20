@interface GDPersonNameComponents
- (GDPersonNameComponents)initWithNameComponentsBuilder:(id)a3;
- (NSArray)familyNames;
- (NSArray)givenNames;
- (NSArray)middleNames;
- (NSArray)nicknames;
- (NSArray)prefixes;
- (NSArray)suffixes;
- (id)description;
@end

@implementation GDPersonNameComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknames, 0);
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_familyNames, 0);
  objc_storeStrong((id *)&self->_middleNames, 0);
  objc_storeStrong((id *)&self->_givenNames, 0);

  objc_storeStrong((id *)&self->_prefixes, 0);
}

- (NSArray)nicknames
{
  return self->_nicknames;
}

- (NSArray)suffixes
{
  return self->_suffixes;
}

- (NSArray)familyNames
{
  return self->_familyNames;
}

- (NSArray)middleNames
{
  return self->_middleNames;
}

- (NSArray)givenNames
{
  return self->_givenNames;
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (GDPersonNameComponents)initWithNameComponentsBuilder:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)GDPersonNameComponents;
  v9 = [(GDPersonNameComponents *)&v73 init];
  if (v9)
  {
    v10 = objc_msgSend_prefixes(v4, v5, v6, v7, v8);
    uint64_t v15 = objc_msgSend_copy(v10, v11, v12, v13, v14);
    prefixes = v9->_prefixes;
    v9->_prefixes = (NSArray *)v15;

    v21 = objc_msgSend_givenNames(v4, v17, v18, v19, v20);
    uint64_t v26 = objc_msgSend_copy(v21, v22, v23, v24, v25);
    givenNames = v9->_givenNames;
    v9->_givenNames = (NSArray *)v26;

    v32 = objc_msgSend_middleNames(v4, v28, v29, v30, v31);
    uint64_t v37 = objc_msgSend_copy(v32, v33, v34, v35, v36);
    middleNames = v9->_middleNames;
    v9->_middleNames = (NSArray *)v37;

    v43 = objc_msgSend_familyNames(v4, v39, v40, v41, v42);
    uint64_t v48 = objc_msgSend_copy(v43, v44, v45, v46, v47);
    familyNames = v9->_familyNames;
    v9->_familyNames = (NSArray *)v48;

    v54 = objc_msgSend_suffixes(v4, v50, v51, v52, v53);
    uint64_t v59 = objc_msgSend_copy(v54, v55, v56, v57, v58);
    suffixes = v9->_suffixes;
    v9->_suffixes = (NSArray *)v59;

    v65 = objc_msgSend_nicknames(v4, v61, v62, v63, v64);
    uint64_t v70 = objc_msgSend_copy(v65, v66, v67, v68, v69);
    nicknames = v9->_nicknames;
    v9->_nicknames = (NSArray *)v70;
  }
  return v9;
}

- (id)description
{
  id v69 = (id)NSString;
  v10 = objc_msgSend_prefixes(self, a2, v2, v3, v4);
  if (v10)
  {
    uint64_t v68 = objc_msgSend_prefixes(self, v6, v7, v8, v9);
    objc_msgSend_componentsJoinedByString_(v68, v11, @"|", v12, v13);
    objc_super v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v73 = &stru_1F0AE2ED0;
  }
  uint64_t v18 = objc_msgSend_givenNames(self, v6, v7, v8, v9);
  if (v18)
  {
    uint64_t v67 = objc_msgSend_givenNames(self, v14, v15, v16, v17);
    objc_msgSend_componentsJoinedByString_(v67, v19, @"|", v20, v21);
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v72 = &stru_1F0AE2ED0;
  }
  uint64_t v26 = objc_msgSend_middleNames(self, v14, v15, v16, v17);
  if (v26)
  {
    v66 = objc_msgSend_middleNames(self, v22, v23, v24, v25);
    objc_msgSend_componentsJoinedByString_(v66, v27, @"|", v28, v29);
    v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = &stru_1F0AE2ED0;
  }
  uint64_t v34 = objc_msgSend_familyNames(self, v22, v23, v24, v25);
  if (v34)
  {
    v65 = objc_msgSend_familyNames(self, v30, v31, v32, v33);
    objc_msgSend_componentsJoinedByString_(v65, v35, @"|", v36, v37);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = &stru_1F0AE2ED0;
  }
  v43 = objc_msgSend_suffixes(self, v30, v31, v32, v33);
  if (v43)
  {
    uint64_t v64 = objc_msgSend_suffixes(self, v39, v40, v41, v42);
    objc_msgSend_componentsJoinedByString_(v64, v44, @"|", v45, v46);
    uint64_t v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v47 = &stru_1F0AE2ED0;
  }
  uint64_t v52 = objc_msgSend_nicknames(self, v39, v40, v41, v42);
  if (v52)
  {
    objc_msgSend_nicknames(self, v48, v49, v50, v51);
    uint64_t v53 = v18;
    v55 = v54 = v10;
    uint64_t v59 = objc_msgSend_componentsJoinedByString_(v55, v56, @"|", v57, v58);
    objc_msgSend_stringWithFormat_(v69, v60, @"<GDPersonNameComponents p:%@ g:%@ m:%@ f:%@ s:%@ n:%@>", v61, v62, v73, v72, v71, v38, v47, v59);
    id v70 = (id)objc_claimAutoreleasedReturnValue();

    v10 = v54;
    uint64_t v18 = v53;
  }
  else
  {
    objc_msgSend_stringWithFormat_(v69, v48, @"<GDPersonNameComponents p:%@ g:%@ m:%@ f:%@ s:%@ n:%@>", v50, v51, v73, v72, v71, v38, v47, &stru_1F0AE2ED0);
    id v70 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v43)
  {
  }
  if (v34)
  {
  }
  if (v26)
  {
  }
  if (v18)
  {
  }
  if (v10)
  {
  }

  return v70;
}

@end