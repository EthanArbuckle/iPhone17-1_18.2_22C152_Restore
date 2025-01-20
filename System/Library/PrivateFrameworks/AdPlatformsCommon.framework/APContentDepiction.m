@interface APContentDepiction
+ (BOOL)supportsSecureCoding;
- (APContentDepiction)init;
- (APContentDepiction)initWithCoder:(id)a3;
- (NSArray)categories;
- (NSArray)keywords;
- (NSArray)searchTerms;
- (NSString)language;
- (NSString)locale;
- (NSUUID)identifier;
- (id)init:(unint64_t)a3 adjacency:(unint64_t)a4 language:(id)a5 locale:(id)a6 searchTerm:(id)a7 keywords:(id)a8 categories:(id)a9;
- (unint64_t)adjacency;
- (unint64_t)placement;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjacency:(unint64_t)a3;
- (void)setCategories:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeywords:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocale:(id)a3;
- (void)setPlacement:(unint64_t)a3;
- (void)setSearchTerms:(id)a3;
@end

@implementation APContentDepiction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APContentDepiction)init
{
  v12.receiver = self;
  v12.super_class = (Class)APContentDepiction;
  v6 = [(APContentDepiction *)&v12 init];
  if (v6)
  {
    uint64_t v9 = objc_msgSend_UUID(MEMORY[0x263F08C38], v2, v3, v4, v5, v7, v8);
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v9;
  }
  return v6;
}

- (id)init:(unint64_t)a3 adjacency:(unint64_t)a4 language:(id)a5 locale:(id)a6 searchTerm:(id)a7 keywords:(id)a8 categories:(id)a9
{
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v16 = a8;
  id v17 = a9;
  uint64_t v24 = objc_msgSend_init(self, v18, v19, v20, v21, v22, v23);
  v25 = (id *)v24;
  if (v24)
  {
    *(void *)(v24 + 16) = a3;
    *(void *)(v24 + 24) = a4;
    objc_storeStrong((id *)(v24 + 32), a5);
    objc_storeStrong(v25 + 5, a6);
    objc_storeStrong(v25 + 6, a7);
    objc_storeStrong(v25 + 7, a8);
    objc_storeStrong(v25 + 8, a9);
  }

  return v25;
}

- (APContentDepiction)initWithCoder:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)APContentDepiction;
  uint64_t v5 = [(APContentDepiction *)&v65 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v11 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"identifier", v8, v9, v10);
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v11;

    v5->_placement = (int)objc_msgSend_decodeIntForKey_(v4, v13, @"placement", v14, v15, v16, v17);
    v5->_adjacency = (int)objc_msgSend_decodeIntForKey_(v4, v18, @"adjacency", v19, v20, v21, v22);
    uint64_t v23 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"language", v25, v26, v27);
    language = v5->_language;
    v5->_language = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"locale", v32, v33, v34);
    locale = v5->_locale;
    v5->_locale = (NSString *)v35;

    v37 = (void *)MEMORY[0x263EFFA08];
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = objc_opt_class();
    v45 = objc_msgSend_setWithObjects_(v37, v40, v38, v41, v42, v43, v44, v39, 0);
    uint64_t v50 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v46, (uint64_t)v45, @"searchTerms", v47, v48, v49);
    searchTerms = v5->_searchTerms;
    v5->_searchTerms = (NSArray *)v50;

    uint64_t v56 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v52, (uint64_t)v45, @"keywords", v53, v54, v55);
    keywords = v5->_keywords;
    v5->_keywords = (NSArray *)v56;

    uint64_t v62 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v58, (uint64_t)v45, @"categories", v59, v60, v61);
    categories = v5->_categories;
    v5->_categories = (NSArray *)v62;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v11 = objc_msgSend_identifier(self, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"identifier", v13, v14, v15);

  uint64_t v22 = objc_msgSend_placement(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeInt_forKey_(v4, v23, v22, @"placement", v24, v25, v26);
  uint64_t v33 = objc_msgSend_adjacency(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeInt_forKey_(v4, v34, v33, @"adjacency", v35, v36, v37);
  double v44 = objc_msgSend_language(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"language", v46, v47, v48);

  double v55 = objc_msgSend_locale(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, @"locale", v57, v58, v59);

  v66 = objc_msgSend_searchTerms(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, @"searchTerms", v68, v69, v70);

  v77 = objc_msgSend_keywords(self, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, @"keywords", v79, v80, v81);

  objc_msgSend_categories(self, v82, v83, v84, v85, v86, v87);
  id v92 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v88, (uint64_t)v92, @"categories", v89, v90, v91);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)placement
{
  return self->_placement;
}

- (void)setPlacement:(unint64_t)a3
{
  self->_placement = a3;
}

- (unint64_t)adjacency
{
  return self->_adjacency;
}

- (void)setAdjacency:(unint64_t)a3
{
  self->_adjacency = a3;
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocale:(id)a3
{
}

- (NSArray)searchTerms
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSearchTerms:(id)a3
{
}

- (NSArray)keywords
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeywords:(id)a3
{
}

- (NSArray)categories
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end