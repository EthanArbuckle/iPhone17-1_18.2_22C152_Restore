@interface GDVisualIdentifierView
- (GDVisualIdentifierView)initWithAccessAssertion:(id)a3 database:(id)a4;
- (id)personForIdentifier:(id)a3;
- (void)enumeratePeopleMatchingName:(id)a3 block:(id)a4;
- (void)enumeratePeopleWithBlock:(id)a3;
- (void)linkEntitiesForPerson:(id)a3;
@end

@implementation GDVisualIdentifierView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareRetriever, 0);
  objc_storeStrong((id *)&self->_locationRetriever, 0);
  objc_storeStrong((id *)&self->_personRetriever, 0);
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

- (void)enumeratePeopleMatchingName:(id)a3 block:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v64 = (void (**)(id, void *, unsigned char *))a4;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v7, @"ViewEngine.Serving.Query", (uint64_t)&unk_1F0AC23A8, v8);
  v9 = objc_opt_new();
  v62 = v6;
  v13 = objc_msgSend_ftsTokenize_(GDFTSTokenize, v10, (uint64_t)v6, v11, v12);
  objc_msgSend_setPredicates_(v9, v14, (uint64_t)&unk_1F0B107E8, v15, v16);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v73 = 0u;
  long long v72 = 0u;
  id obj = v13;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v72, (uint64_t)v77, 16);
  if (v18)
  {
    uint64_t v19 = v18;
    id v20 = 0;
    uint64_t v21 = *(void *)v73;
LABEL_3:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v73 != v21) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = *(void *)(*((void *)&v72 + 1) + 8 * v22);
      v24 = (void *)MEMORY[0x1B3EB26F0]();
      id v25 = [NSString alloc];
      v29 = objc_msgSend_initWithFormat_(v25, v26, @"\"%@*\"", v27, v28, v23);
      objc_msgSend_setObjectFTSTerm_(v9, v30, (uint64_t)v29, v31, v32);

      objc_msgSend_setSubjects_(v9, v33, (uint64_t)v20, v34, v35);
      v36 = objc_opt_new();

      personRetriever = self->_personRetriever;
      v70[0] = MEMORY[0x1E4F143A8];
      v70[1] = 3221225472;
      v70[2] = sub_1B2E69DD0;
      v70[3] = &unk_1E6013BE0;
      id v20 = v36;
      id v71 = v20;
      objc_msgSend_enumerateIdentifiersWithQuery_block_(personRetriever, v38, (uint64_t)v9, (uint64_t)v70, v39);
      uint64_t v44 = objc_msgSend_count(v20, v40, v41, v42, v43);

      if (!v44) {
        break;
      }
      if (v19 == ++v22)
      {
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v72, (uint64_t)v77, 16);
        if (v19) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v20 = 0;
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v46 = v20;
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v66, (uint64_t)v76, 16);
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v67;
    while (2)
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v67 != v50) {
          objc_enumerationMutation(v46);
        }
        uint64_t v52 = *(void *)(*((void *)&v66 + 1) + 8 * i);
        v53 = (void *)MEMORY[0x1B3EB26F0]();
        v60 = objc_msgSend_objectForIdentifier_(self->_personRetriever, v54, v52, v55, v56);
        if (v60)
        {
          objc_msgSend_linkEntitiesForPerson_(self, v57, (uint64_t)v60, v58, v59);
          char v65 = 0;
          v64[2](v64, v60, &v65);
          if (v65)
          {

            goto LABEL_22;
          }
        }
      }
      uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v61, (uint64_t)&v66, (uint64_t)v76, 16);
      if (v49) {
        continue;
      }
      break;
    }
  }
LABEL_22:
}

- (void)enumeratePeopleWithBlock:(id)a3
{
  id v4 = a3;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v5, @"ViewEngine.Serving.Query", (uint64_t)&unk_1F0AC2328, v6);
  personRetriever = self->_personRetriever;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B2E69EA8;
  v12[3] = &unk_1E6013BB8;
  v12[4] = self;
  id v13 = v4;
  id v8 = v4;
  objc_msgSend_enumerateObjectsWithBlock_(personRetriever, v9, (uint64_t)v12, v10, v11);
}

- (id)personForIdentifier:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v5, @"ViewEngine.Serving.Query", (uint64_t)&unk_1F0AE1E10, v6);
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_1B2E6A138;
  v33 = sub_1B2E6A148;
  id v34 = 0;
  uint64_t v10 = objc_msgSend_objectForIdentifier_(self->_personRetriever, v7, (uint64_t)v4, v8, v9);
  uint64_t v11 = (void *)v30[5];
  v30[5] = v10;

  uint64_t v12 = (void *)v30[5];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    v14 = objc_opt_new();
    v35[0] = v4;
    v17 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v35, 1, v16);
    objc_msgSend_setObjects_(v14, v18, (uint64_t)v17, v19, v20);

    personRetriever = self->_personRetriever;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = sub_1B2E6A150;
    v25[3] = &unk_1E6013B90;
    id v26 = v4;
    uint64_t v27 = self;
    uint64_t v28 = &v29;
    objc_msgSend_enumerateObjectsWithQuery_block_(personRetriever, v22, (uint64_t)v14, (uint64_t)v25, v23);
    id v13 = (id)v30[5];
  }
  _Block_object_dispose(&v29, 8);

  return v13;
}

- (void)linkEntitiesForPerson:(id)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v122 = objc_opt_new();
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  v120 = v4;
  uint64_t v9 = objc_msgSend_postalAddressLinks(v4, v5, v6, v7, v8);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v127, (uint64_t)v132, 16);
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v128;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v128 != v17) {
          objc_enumerationMutation(v9);
        }
        uint64_t v19 = *(void **)(*((void *)&v127 + 1) + 8 * i);
        locationRetriever = self->_locationRetriever;
        uint64_t v21 = objc_msgSend_locationEntityIdentifier(v19, v12, v13, v14, v15);
        id v26 = objc_msgSend_stringValue(v21, v22, v23, v24, v25);
        v30 = objc_msgSend_objectForIdentifier_(locationRetriever, v27, (uint64_t)v26, v28, v29);

        if (v30)
        {
          uint64_t v35 = objc_msgSend_label(v19, v31, v32, v33, v34);
          objc_msgSend_setLabel_(v30, v36, (uint64_t)v35, v37, v38);

          objc_msgSend_addObject_(v122, v39, (uint64_t)v30, v40, v41);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v127, (uint64_t)v132, 16);
    }
    while (v16);
  }

  id v46 = objc_msgSend_copy(v122, v42, v43, v44, v45);
  objc_msgSend_setLocations_(v120, v47, (uint64_t)v46, v48, v49);

  v121 = objc_opt_new();
  uint64_t v50 = objc_opt_new();
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  uint64_t v55 = objc_msgSend_softwareLinks(v120, v51, v52, v53, v54);
  uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v123, (uint64_t)v131, 16);
  if (v57)
  {
    uint64_t v62 = v57;
    uint64_t v63 = *(void *)v124;
    do
    {
      for (uint64_t j = 0; j != v62; ++j)
      {
        if (*(void *)v124 != v63) {
          objc_enumerationMutation(v55);
        }
        char v65 = *(void **)(*((void *)&v123 + 1) + 8 * j);
        long long v66 = objc_msgSend_conversationIdentifier(v65, v58, v59, v60, v61);

        if (v66)
        {
          id v71 = objc_msgSend_conversationIdentifier(v65, v67, v68, v69, v70);
          objc_msgSend_addObject_(v50, v72, (uint64_t)v71, v73, v74);
        }
        softwareRetriever = self->_softwareRetriever;
        v76 = objc_msgSend_softwareEntityIdentifier(v65, v67, v68, v69, v70);
        v81 = objc_msgSend_stringValue(v76, v77, v78, v79, v80);
        v85 = objc_msgSend_objectForIdentifier_(softwareRetriever, v82, (uint64_t)v81, v83, v84);

        if (v85)
        {
          v90 = objc_msgSend_bundleIdentifiers(v85, v86, v87, v88, v89);

          if (v90)
          {
            v95 = objc_msgSend_bundleIdentifiers(v85, v91, v92, v93, v94);
            objc_msgSend_addObjectsFromArray_(v121, v96, (uint64_t)v95, v97, v98);
          }
        }
      }
      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v123, (uint64_t)v131, 16);
    }
    while (v62);
  }

  v103 = objc_msgSend_allObjects(v121, v99, v100, v101, v102);
  v108 = objc_msgSend_copy(v103, v104, v105, v106, v107);
  objc_msgSend_setBundleIdentifiers_(v120, v109, (uint64_t)v108, v110, v111);

  v116 = objc_msgSend_copy(v50, v112, v113, v114, v115);
  objc_msgSend_setConversationIdentifiers_(v120, v117, (uint64_t)v116, v118, v119);
}

- (GDVisualIdentifierView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)GDVisualIdentifierView;
  uint64_t v10 = [(GDVisualIdentifierView *)&v39 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accessAssertion, a3);
    objc_storeStrong((id *)&v11->_db, a4);
    uint64_t v20 = objc_msgSend_viewArtifactTableName(v8, v12, v13, v14, v15);
    if (!v20)
    {
      uint64_t v37 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v16, v17, v18, v19);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, (uint64_t)v11, @"GDVisualIdentifierView.m", 52, @"Invalid parameter not satisfying: %@", @"tableName");
    }
    uint64_t v21 = [GDSQLGraphObjectRetriever alloc];
    db = v11->_db;
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = sub_1B2E66628((id *)&v21->super.isa, db, v20, @"SB104", (void *)2, v23);
    personRetriever = v11->_personRetriever;
    v11->_personRetriever = (GDSQLGraphObjectRetriever *)v24;

    id v26 = [GDSQLGraphObjectRetriever alloc];
    uint64_t v27 = v11->_db;
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = sub_1B2E66628((id *)&v26->super.isa, v27, v20, @"SB152", (void *)3, v28);
    locationRetriever = v11->_locationRetriever;
    v11->_locationRetriever = (GDSQLGraphObjectRetriever *)v29;

    uint64_t v31 = [GDSQLGraphObjectRetriever alloc];
    uint64_t v32 = v11->_db;
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = sub_1B2E66628((id *)&v31->super.isa, v32, v20, @"SB144", (void *)0xA, v33);
    softwareRetriever = v11->_softwareRetriever;
    v11->_softwareRetriever = (GDSQLGraphObjectRetriever *)v34;
  }
  return v11;
}

@end