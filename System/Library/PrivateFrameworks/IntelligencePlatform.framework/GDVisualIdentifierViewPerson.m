@interface GDVisualIdentifierViewPerson
- (NSArray)bundleIdentifiers;
- (NSArray)conversationIdentifiers;
- (NSArray)locations;
- (id)description;
- (id)shortArrayDescription:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setConversationIdentifiers:(id)a3;
- (void)setLocations:(id)a3;
@end

@implementation GDVisualIdentifierViewPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_conversationIdentifiers, 0);

  objc_storeStrong((id *)&self->_locations, 0);
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setConversationIdentifiers:(id)a3
{
}

- (NSArray)conversationIdentifiers
{
  return self->_conversationIdentifiers;
}

- (void)setLocations:(id)a3
{
}

- (NSArray)locations
{
  return self->_locations;
}

- (id)description
{
  v114 = NSString;
  v112 = objc_msgSend_entityIdentifier(self, a2, v2, v3, v4);
  v122 = objc_msgSend_nameComponents(self, v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_dateOfBirth(self, v10, v11, v12, v13);
  v120 = (void *)v14;
  if (v14) {
    v19 = (__CFString *)v14;
  }
  else {
    v19 = &stru_1F0AE2ED0;
  }
  v111 = v19;
  uint64_t v20 = objc_msgSend_nonGregorianDateOfBirth(self, v15, v16, v17, v18);
  v119 = (void *)v20;
  if (v20) {
    v25 = (__CFString *)v20;
  }
  else {
    v25 = &stru_1F0AE2ED0;
  }
  v109 = v25;
  uint64_t v26 = objc_msgSend_anniversary(self, v21, v22, v23, v24);
  v118 = (void *)v26;
  if (v26) {
    v31 = (__CFString *)v26;
  }
  else {
    v31 = &stru_1F0AE2ED0;
  }
  v108 = v31;
  v117 = objc_msgSend_names(self, v27, v28, v29, v30);
  v121 = objc_msgSend_shortArrayDescription_(self, v32, (uint64_t)v117, v33, v34);
  v116 = objc_msgSend_relatedPeople(self, v35, v36, v37, v38);
  v105 = objc_msgSend_shortArrayDescription_(self, v39, (uint64_t)v116, v40, v41);
  v113 = objc_msgSend_locations(self, v42, v43, v44, v45);
  v104 = objc_msgSend_shortArrayDescription_(self, v46, (uint64_t)v113, v47, v48);
  v110 = objc_msgSend_phoneNumbers(self, v49, v50, v51, v52);
  v103 = objc_msgSend_shortArrayDescription_(self, v53, (uint64_t)v110, v54, v55);
  v107 = objc_msgSend_emails(self, v56, v57, v58, v59);
  v63 = objc_msgSend_shortArrayDescription_(self, v60, (uint64_t)v107, v61, v62);
  v106 = objc_msgSend_contactIdentifiers(self, v64, v65, v66, v67);
  v71 = objc_msgSend_shortArrayDescription_(self, v68, (uint64_t)v106, v69, v70);
  v76 = objc_msgSend_visualIdentifierObjects(self, v72, v73, v74, v75);
  v80 = objc_msgSend_shortArrayDescription_(self, v77, (uint64_t)v76, v78, v79);
  v85 = objc_msgSend_conversationIdentifiers(self, v81, v82, v83, v84);
  v89 = objc_msgSend_shortArrayDescription_(self, v86, (uint64_t)v85, v87, v88);
  v94 = objc_msgSend_bundleIdentifiers(self, v90, v91, v92, v93);
  v98 = objc_msgSend_shortArrayDescription_(self, v95, (uint64_t)v94, v96, v97);
  v115 = objc_msgSend_stringWithFormat_(v114, v99, @"<GDVisualIdentifierViewPerson %@, %@, dob: %@ ngdob: %@ an: %@ names: %@ related: %@ loc: %@ phone: %@ email: %@ cnid: %@ vido: %@ cnvid: %@ bndl: %@>", v100, v101, v112, v122, v111, v109, v108, v121, v105, v104, v103, v63, v71, v80, v89, v98);

  return v115;
}

- (id)shortArrayDescription:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6, v7))
  {
    if (objc_msgSend_count(v3, v8, v9, v10, v11) == 1)
    {
      objc_msgSend_firstObject(v3, v12, v13, v14, v15);
      uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v16 = (__CFString *)v3;
    }
    uint64_t v17 = v16;
  }
  else
  {
    uint64_t v17 = &stru_1F0AE2ED0;
  }

  return v17;
}

@end