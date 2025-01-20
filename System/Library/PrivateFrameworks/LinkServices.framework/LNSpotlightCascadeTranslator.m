@interface LNSpotlightCascadeTranslator
+ (id)sourceItemIdentifierFromInstanceIdentifier:(id)a3 typeIdentifier:(id)a4;
+ (id)translateItem:(id)a3;
@end

@implementation LNSpotlightCascadeTranslator

+ (id)translateItem:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 attributeSet];
  v5 = [v4 attributeForKey:@"_kMDItemAppEntityInstanceIdentifier"];

  if (!v5)
  {
    id v18 = 0;
    goto LABEL_66;
  }
  v6 = [v3 attributeSet];
  v7 = [v6 attributeForKey:@"_kMDItemAppEntityTypeIdentifier"];

  if (v7)
  {
    v8 = [v3 attributeSet];
    v9 = [v8 attributeForKey:@"kMDItemAppEntityTitle"];

    if (!v9)
    {
      id v18 = 0;
LABEL_64:

      goto LABEL_65;
    }
    v10 = [v3 attributeSet];
    v54 = [v10 attributeForKey:@"kMDItemAppEntitySubtitle"];

    v11 = [v3 attributeSet];
    v53 = [v11 attributeForKey:@"kMDItemAppEntityDisplayRepresentationSynonyms"];

    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2050000000;
    v12 = (void *)getCCAppEntityDisplayRepresentationClass_softClass;
    uint64_t v63 = getCCAppEntityDisplayRepresentationClass_softClass;
    if (!getCCAppEntityDisplayRepresentationClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v65 = __getCCAppEntityDisplayRepresentationClass_block_invoke;
      v66 = &unk_1E5B39E50;
      v67 = &v60;
      __getCCAppEntityDisplayRepresentationClass_block_invoke((uint64_t)&buf);
      v12 = (void *)v61[3];
    }
    v13 = v12;
    _Block_object_dispose(&v60, 8);
    if (!v13)
    {
      v14 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A4419000, v14, OS_LOG_TYPE_ERROR, "Cannot load class CCAppEntityDisplayRepresentation", (uint8_t *)&buf, 2u);
      }
      id v18 = 0;
      goto LABEL_63;
    }
    id v59 = 0;
    v14 = [[v13 alloc] initWithTitle:v9 subtitle:v54 synonyms:v53 error:&v59];
    v15 = v59;
    if (v15)
    {
      v16 = v15;
      v17 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_1A4419000, v17, OS_LOG_TYPE_ERROR, "Cannot create CCAppEntityDisplayRepresentation. Error: %@", (uint8_t *)&buf, 0xCu);
      }

LABEL_11:
      id v18 = 0;
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2050000000;
    v19 = (void *)getCCAppEntityTypeDisplayRepresentationClass_softClass;
    uint64_t v63 = getCCAppEntityTypeDisplayRepresentationClass_softClass;
    if (!getCCAppEntityTypeDisplayRepresentationClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v65 = __getCCAppEntityTypeDisplayRepresentationClass_block_invoke;
      v66 = &unk_1E5B39E50;
      v67 = &v60;
      __getCCAppEntityTypeDisplayRepresentationClass_block_invoke((uint64_t)&buf);
      v19 = (void *)v61[3];
    }
    v20 = v19;
    _Block_object_dispose(&v60, 8);
    if (!v20)
    {
      v16 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A4419000, v16, OS_LOG_TYPE_ERROR, "Cannot load class CCAppEntityTypeDisplayRepresentationClass", (uint8_t *)&buf, 2u);
      }
      goto LABEL_11;
    }
    v21 = [v3 attributeSet];
    v16 = [v21 attributeForKey:@"_kMDItemAppEntityTypeDisplayRepresentationName"];

    if (v16)
    {
      v22 = [v3 attributeSet];
      v23 = [v22 attributeForKey:@"_kMDItemAppEntityTypeDisplayRepresentationSynonyms"];

      id v58 = 0;
      v52 = (void *)[[v20 alloc] initWithName:v16 synonyms:v23 error:&v58];
      v24 = v58;

      if (v24)
      {
        v25 = getLNLogCategoryVocabulary();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v24;
          _os_log_impl(&dword_1A4419000, v25, OS_LOG_TYPE_ERROR, "Cannot create CCAppEntityTypeDisplayRepresentation. Error: %@", (uint8_t *)&buf, 0xCu);
        }

LABEL_38:
        id v18 = 0;
LABEL_61:

        goto LABEL_62;
      }
    }
    else
    {
      v52 = 0;
    }
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2050000000;
    v26 = (void *)getCCAppIntentsIndexedEntityContentClass_softClass;
    uint64_t v63 = getCCAppIntentsIndexedEntityContentClass_softClass;
    if (!getCCAppIntentsIndexedEntityContentClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v65 = __getCCAppIntentsIndexedEntityContentClass_block_invoke;
      v66 = &unk_1E5B39E50;
      v67 = &v60;
      __getCCAppIntentsIndexedEntityContentClass_block_invoke((uint64_t)&buf);
      v26 = (void *)v61[3];
    }
    id v27 = v26;
    _Block_object_dispose(&v60, 8);
    v28 = (objc_class *)v27;
    if (!v28)
    {
      v24 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A4419000, v24, OS_LOG_TYPE_ERROR, "Cannot load class CCAppIntentsIndexedEntityContent", (uint8_t *)&buf, 2u);
      }
      goto LABEL_38;
    }
    id v57 = 0;
    v24 = [[v28 alloc] initWithTypeIdentifier:v7 displayRepresentation:v14 typeDisplayRepresentation:v52 error:&v57];
    v29 = v57;
    if (v29)
    {
      v30 = v29;
      v31 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1A4419000, v31, OS_LOG_TYPE_ERROR, "Cannot create CCAppIntentsIndexedEntityContent. Error: %@", (uint8_t *)&buf, 0xCu);
      }

      id v18 = 0;
      v32 = v30;
      goto LABEL_60;
    }
    CCAppIntentsIndexedEntityMetaContentClass = (objc_class *)getCCAppIntentsIndexedEntityMetaContentClass();
    if (!CCAppIntentsIndexedEntityMetaContentClass)
    {
      v32 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A4419000, v32, OS_LOG_TYPE_ERROR, "Cannot load class CCAppIntentsIndexedEntityMetaContent", (uint8_t *)&buf, 2u);
      }
      id v18 = 0;
      goto LABEL_60;
    }
    uint64_t v49 = [(id)objc_opt_class() sourceItemIdentifierFromInstanceIdentifier:v5 typeIdentifier:v7];
    v33 = [v3 attributeSet];
    uint64_t v34 = [v33 attributeForKey:@"_kMDItemAppEntityPriority"];
    v35 = (void *)v34;
    v36 = &unk_1EF7F4160;
    if (v34) {
      v36 = (void *)v34;
    }
    id v37 = v36;

    [v37 floatValue];
    float v39 = v38;

    id v40 = [CCAppIntentsIndexedEntityMetaContentClass alloc];
    double v41 = v39 + 0.00001;
    *(float *)&double v41 = v41;
    v42 = [MEMORY[0x1E4F28ED0] numberWithFloat:v41];
    id v56 = 0;
    Class v51 = (Class)[v40 initWithSourceItemIdentifier:v49 saliency:v42 error:&v56];
    v43 = v56;

    if (v43)
    {
      v44 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v43;
        _os_log_impl(&dword_1A4419000, v44, OS_LOG_TYPE_ERROR, "Cannot create CCAppIntentsIndexedEntityMetaContent. Error: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      CCItemInstanceClass = (objc_class *)getCCItemInstanceClass();
      if (CCItemInstanceClass)
      {
        id v55 = 0;
        v48 = (void *)[[CCItemInstanceClass alloc] initWithContent:v24 metaContent:v51 error:&v55];
        v43 = v55;
        if (v43)
        {
          v46 = getLNLogCategoryVocabulary();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v43;
            _os_log_impl(&dword_1A4419000, v46, OS_LOG_TYPE_ERROR, "Cannot create CCItemInstance. Error: %@", (uint8_t *)&buf, 0xCu);
          }

          id v18 = 0;
        }
        else
        {
          id v18 = v48;
        }

        goto LABEL_59;
      }
      v43 = getLNLogCategoryVocabulary();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A4419000, v43, OS_LOG_TYPE_ERROR, "Cannot load class CCItemInstance", (uint8_t *)&buf, 2u);
      }
    }
    id v18 = 0;
LABEL_59:

    v32 = v49;
LABEL_60:

    goto LABEL_61;
  }
  id v18 = 0;
LABEL_65:

LABEL_66:
  return v18;
}

+ (id)sourceItemIdentifierFromInstanceIdentifier:(id)a3 typeIdentifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@/%@", a4, a3];
}

@end