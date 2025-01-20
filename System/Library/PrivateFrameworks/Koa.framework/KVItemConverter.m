@interface KVItemConverter
+ (id)_convertFromKVItemType_AppInfo:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_AppIntentsEntity:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_AppIntentsEnum:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_AppShortcut:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_AutoShortcut:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_CalendarEvent:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_Contact:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_CustomTerm:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_FindMy:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_Fitness:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_GlobalTerm:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_Health:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_HomeEntity:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_HomeServiceArea:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_LearnedContact:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_LearnedMediaEntity:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_LocationOfInterest:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_MediaEntity:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_Podcast:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_RadioEntity:(id)a3 error:(id *)a4;
+ (id)_convertFromKVItemType_UserAccount:(id)a3 error:(id *)a4;
+ (id)cascadeItemFromItem:(id)a3 error:(id *)a4;
+ (id)itemFromCascadeItem:(id)a3 error:(id *)a4;
+ (int64_t)fieldTypeFromCascadeFieldType:(unsigned __int16)a3;
+ (int64_t)itemTypeFromCascadeItemType:(unsigned __int16)a3;
+ (unsigned)cascadeFieldTypeFromFieldType:(int64_t)a3;
+ (unsigned)cascadeItemTypeFromItemType:(int64_t)a3;
@end

@implementation KVItemConverter

+ (id)itemFromCascadeItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v11 = objc_msgSend_content(v5, v6, v7, v8, v9, v10);
  v12 = objc_opt_class();
  uint64_t v18 = objc_msgSend_itemType(v12, v13, v14, v15, v16, v17);
  v19 = objc_opt_class();
  uint64_t v24 = objc_msgSend_itemTypeFromCascadeItemType_(v19, v20, v18, v21, v22, v23);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = objc_msgSend_metaContent(v5, v25, v26, v27, v28, v29);
    v36 = objc_msgSend_sourceItemIdentifier(v30, v31, v32, v33, v34, v35);
  }
  else
  {
    v37 = NSString;
    v38 = objc_msgSend_sharedIdentifier(v5, v25, v26, v27, v28, v29);
    uint64_t v44 = objc_msgSend_unsignedLongLongValue(v38, v39, v40, v41, v42, v43);
    v36 = objc_msgSend_stringWithFormat_(v37, v45, @"%llx", v46, v47, v48, v44);

    v30 = 0;
  }
  v49 = objc_alloc_init(KVItemBuilder);
  uint64_t v108 = 0;
  v109 = (id *)&v108;
  uint64_t v110 = 0x3032000000;
  v111 = sub_1BC3C8B04;
  v112 = sub_1BC3C8B14;
  id v113 = 0;
  id v107 = 0;
  v52 = objc_msgSend_setItemType_itemId_error_(v49, v50, v24, (uint64_t)v36, (uint64_t)&v107, v51);
  objc_storeStrong(&v113, v107);

  if (v52)
  {
    v82 = a4;
    uint64_t v103 = 0;
    v104 = &v103;
    uint64_t v105 = 0x2020000000;
    char v106 = 0;
    v81 = v36;
    if (v30)
    {
      id v102 = 0;
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = sub_1BC3C8CD0;
      v98[3] = &unk_1E62AD518;
      v100 = &v103;
      v99 = v49;
      v101 = &v108;
      char v56 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v30, v53, (uint64_t)&v102, (uint64_t)v98, v54, v55);
      id v57 = v102;
      id v58 = v57;
      if ((v56 & 1) == 0)
      {
        sub_1BC3C8E5C(v57, v5);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (*((unsigned char *)v104 + 24))
      {
        sub_1BC3C8B1C(v109[5], v5);
        id v59 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
        if (a4)
        {
          v36 = v81;
          if (v59)
          {
            id v59 = v59;
            *a4 = v59;
          }
        }
        else
        {
          v36 = v81;
        }

        v61 = 0;
        goto LABEL_39;
      }

      v62 = v58;
    }
    else
    {
      v62 = 0;
    }
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x3032000000;
    v95 = sub_1BC3C8B04;
    v96 = sub_1BC3C8B14;
    id v97 = 0;
    uint64_t v90 = v24;
    id v91 = v62;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = sub_1BC3C8F4C;
    v84[3] = &unk_1E62AD540;
    v87 = &v103;
    v88 = &v92;
    id v63 = v5;
    id v85 = v63;
    v64 = v49;
    v86 = v64;
    v89 = &v108;
    char v68 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v11, v65, (uint64_t)&v91, (uint64_t)v84, v66, v67);
    id v58 = v91;

    if (v68)
    {
      if (!*((unsigned char *)v104 + 24))
      {
LABEL_25:

        v70 = v109;
        id obj = v109[5];
        v75 = objc_msgSend_buildItemWithError_(v64, v71, (uint64_t)&obj, v72, v73, v74);
        objc_storeStrong(v70 + 5, obj);
        if (v75)
        {
          id v76 = v75;
          v61 = v76;
        }
        else
        {
          v78 = sub_1BC3C8B1C(v109[5], v63);
          v79 = v78;
          if (v82 && v78) {
            id *v82 = v78;
          }

          id v76 = 0;
          v61 = 0;
        }
        v36 = v81;
LABEL_38:

        _Block_object_dispose(&v92, 8);
LABEL_39:
        _Block_object_dispose(&v103, 8);
        goto LABEL_40;
      }
      v69 = (void *)v93[5];
      if (v69)
      {
        if (v82) {
          id *v82 = v69;
        }
        goto LABEL_25;
      }
      sub_1BC3C8B1C(v109[5], v63);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_1BC3C8E5C(v58, v63);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v82)
    {
      v36 = v81;
      if (v77)
      {
        id v77 = v77;
        id *v82 = v77;
      }
    }
    else
    {
      v36 = v81;
    }

    v61 = 0;
    id v76 = v85;
    goto LABEL_38;
  }
  v60 = sub_1BC3C8B1C(v109[5], v5);
  id v58 = v60;
  v61 = 0;
  if (a4 && v60)
  {
    id v58 = v60;
    v61 = 0;
    *a4 = v58;
  }
LABEL_40:

  _Block_object_dispose(&v108, 8);
  return v61;
}

+ (id)_convertFromKVItemType_HomeServiceArea:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v86 = 0;
  v87 = &v86;
  uint64_t v88 = 0x3032000000;
  v89 = sub_1BC3C8B04;
  uint64_t v90 = sub_1BC3C8B14;
  id v91 = 0;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = sub_1BC3C8B04;
  v84 = sub_1BC3C8B14;
  id v85 = 0;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = sub_1BC3C8B04;
  v78 = sub_1BC3C8B14;
  id v79 = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x3032000000;
  v71 = sub_1BC3C8B04;
  uint64_t v72 = sub_1BC3C8B14;
  id v73 = 0;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_1BC3C8B04;
  uint64_t v66 = sub_1BC3C8B14;
  id v67 = 0;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = sub_1BC3CAD8C;
  v61[3] = &unk_1E62AD3B0;
  v61[4] = &v86;
  v61[5] = &v80;
  v61[6] = &v68;
  v61[7] = &v74;
  v61[8] = &v62;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v61, v7, v8, v9);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  char v56 = objc_msgSend_numberFromString_(v10, v11, v69[5], v12, v13, v14);
  if (v87[5])
  {
    v19 = objc_msgSend_numberFromString_(v10, v15, v81[5], v16, v17, v18);
    id v20 = objc_alloc(MEMORY[0x1E4F70A28]);
    uint64_t v21 = v87[5];
    id v60 = 0;
    uint64_t v23 = objc_msgSend_initWithName_areaIdentifier_associatedMapIdentifier_error_(v20, v22, v21, (uint64_t)v19, (uint64_t)v56, (uint64_t)&v60);
    id v24 = v60;

    uint64_t v29 = 1;
    if (v23)
    {
LABEL_3:
      objc_msgSend_numberFromString_(v10, v25, v63[5], v26, v27, v28);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      id v31 = objc_alloc(MEMORY[0x1E4F70A30]);
      id v58 = v24;
      uint64_t v33 = objc_msgSend_initWithMatterDeviceIdentifier_serviceArea_serviceAreaType_error_(v31, v32, (uint64_t)v30, (uint64_t)v23, v29, (uint64_t)&v58);
      id v34 = v58;

      if (v33)
      {
        id v35 = objc_alloc(MEMORY[0x1E4F70A40]);
        uint64_t v41 = objc_msgSend_itemId(v5, v36, v37, v38, v39, v40);
        id v57 = v34;
        id v45 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v35, v42, (uint64_t)v41, (uint64_t)&v57, v43, v44);
        id v24 = v57;

        if (v45)
        {
          uint64_t v46 = sub_1BC3CAF78(v33, v45, v5, a4);
        }
        else
        {
          v53 = sub_1BC3CAE88(v24, v5);
          uint64_t v54 = v53;
          if (a4 && v53) {
            *a4 = v53;
          }

          id v45 = 0;
          uint64_t v46 = 0;
        }
      }
      else
      {
        v52 = sub_1BC3CAE88(v34, v5);
        id v45 = v52;
        uint64_t v46 = 0;
        if (a4 && v52)
        {
          id v45 = v52;
          uint64_t v46 = 0;
          *a4 = v45;
        }
        id v24 = v34;
      }

      goto LABEL_19;
    }
  }
  else
  {
    id v47 = objc_alloc(MEMORY[0x1E4F70A38]);
    uint64_t v48 = v75[5];
    id v59 = 0;
    uint64_t v23 = objc_msgSend_initWithName_mapIdentifier_error_(v47, v49, v48, (uint64_t)v56, (uint64_t)&v59, v50);
    id v24 = v59;
    uint64_t v29 = 2;
    if (v23) {
      goto LABEL_3;
    }
  }
  uint64_t v51 = sub_1BC3CAE88(v24, v5);
  id v30 = v51;
  uint64_t v46 = 0;
  if (a4 && v51)
  {
    id v30 = v51;
    uint64_t v46 = 0;
    *a4 = v30;
  }
LABEL_19:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);

  _Block_object_dispose(&v86, 8);
  return v46;
}

+ (id)_convertFromKVItemType_AppIntentsEnum:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v94 = 0;
  v95 = &v94;
  uint64_t v96 = 0x3032000000;
  id v97 = sub_1BC3C8B04;
  v98 = sub_1BC3C8B14;
  id v99 = 0;
  uint64_t v88 = 0;
  v89 = &v88;
  uint64_t v90 = 0x3032000000;
  id v91 = sub_1BC3C8B04;
  uint64_t v92 = sub_1BC3C8B14;
  id v93 = 0;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  id v85 = sub_1BC3C8B04;
  uint64_t v86 = sub_1BC3C8B14;
  id v87 = 0;
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x3032000000;
  id v79 = sub_1BC3C8B04;
  uint64_t v80 = sub_1BC3C8B14;
  id v81 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = sub_1BC3C8B04;
  v74[4] = sub_1BC3C8B14;
  id v75 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = sub_1BC3C8B04;
  v72[4] = sub_1BC3C8B14;
  id v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = sub_1BC3C8B04;
  v70[4] = sub_1BC3C8B14;
  id v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = sub_1BC3C8B04;
  v68[4] = sub_1BC3C8B14;
  id v69 = 0;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_1BC3C8B04;
  uint64_t v66 = sub_1BC3C8B14;
  id v67 = 0;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = sub_1BC3CB714;
  v57[3] = &unk_1E62AD4C8;
  v57[4] = v74;
  v57[5] = v72;
  v57[6] = v70;
  v57[7] = v68;
  v57[8] = &v62;
  v57[9] = &v76;
  v6 = (void *)MEMORY[0x1C186EA80](v57);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = sub_1BC3CB8D8;
  v47[3] = &unk_1E62AD4F0;
  v49 = &v94;
  uint64_t v50 = &v88;
  uint64_t v51 = &v82;
  v52 = v74;
  uint64_t v7 = v6;
  id v48 = v7;
  v53 = &v58;
  uint64_t v54 = v72;
  uint64_t v55 = v70;
  char v56 = v68;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v8, (uint64_t)v47, v9, v10, v11);
  if (*((unsigned char *)v59 + 24) || (v7[2](v7) & 1) == 0)
  {
    uint64_t v38 = sub_1BC3CAE88((void *)v63[5], v5);
    id v18 = v38;
    uint64_t v37 = 0;
    if (a4 && v38)
    {
      id v18 = v38;
      uint64_t v37 = 0;
      *a4 = v18;
    }
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F708C8]);
    uint64_t v13 = v89[5];
    uint64_t v14 = v83[5];
    uint64_t v15 = (id *)(v63 + 5);
    id obj = (id)v63[5];
    id v18 = (id)objc_msgSend_initWithName_synonyms_error_(v12, v16, v13, v14, (uint64_t)&obj, v17);
    objc_storeStrong(v15, obj);
    if (v18)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F70930]);
      uint64_t v20 = v95[5];
      uint64_t v21 = v77[5];
      uint64_t v22 = (id *)(v63 + 5);
      id v45 = (id)v63[5];
      id v24 = (id)objc_msgSend_initWithTypeIdentifier_typeDisplayRepresentation_cases_error_(v19, v23, v20, (uint64_t)v18, v21, (uint64_t)&v45);
      objc_storeStrong(v22, v45);
      if (v24)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F70938]);
        id v31 = objc_msgSend_itemId(v5, v26, v27, v28, v29, v30);
        uint64_t v32 = (id *)(v63 + 5);
        id v44 = (id)v63[5];
        id v36 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v25, v33, (uint64_t)v31, (uint64_t)&v44, v34, v35);
        objc_storeStrong(v32, v44);

        if (v36)
        {
          uint64_t v37 = sub_1BC3CAF78(v24, v36, v5, a4);
        }
        else
        {
          uint64_t v41 = sub_1BC3CAE88((void *)v63[5], v5);
          uint64_t v42 = v41;
          if (a4 && v41) {
            *a4 = v41;
          }

          id v36 = 0;
          uint64_t v37 = 0;
        }
      }
      else
      {
        uint64_t v40 = sub_1BC3CAE88((void *)v63[5], v5);
        id v36 = v40;
        uint64_t v37 = 0;
        if (a4 && v40)
        {
          id v36 = v40;
          uint64_t v37 = 0;
          *a4 = v36;
        }
      }
    }
    else
    {
      uint64_t v39 = sub_1BC3CAE88((void *)v63[5], v5);
      id v24 = v39;
      uint64_t v37 = 0;
      if (a4 && v39)
      {
        id v24 = v39;
        uint64_t v37 = 0;
        *a4 = v24;
      }
    }
  }
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

  return v37;
}

+ (id)_convertFromKVItemType_AppIntentsEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  id v85 = sub_1BC3C8B04;
  uint64_t v86 = sub_1BC3C8B14;
  id v87 = 0;
  uint64_t v76 = 0;
  id v77 = &v76;
  uint64_t v78 = 0x3032000000;
  id v79 = sub_1BC3C8B04;
  uint64_t v80 = sub_1BC3C8B14;
  id v81 = 0;
  uint64_t v70 = 0;
  id v71 = &v70;
  uint64_t v72 = 0x3032000000;
  id v73 = sub_1BC3C8B04;
  uint64_t v74 = sub_1BC3C8B14;
  id v75 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  id v67 = sub_1BC3C8B04;
  uint64_t v68 = sub_1BC3C8B14;
  id v69 = 0;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000;
  char v61 = sub_1BC3C8B04;
  uint64_t v62 = sub_1BC3C8B14;
  id v63 = 0;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  uint64_t v55 = sub_1BC3C8B04;
  char v56 = sub_1BC3C8B14;
  id v57 = 0;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1BC3CC024;
  v51[3] = &unk_1E62AD4A0;
  v51[4] = &v82;
  v51[5] = &v58;
  v51[6] = &v52;
  v51[7] = &v76;
  v51[8] = &v70;
  v51[9] = &v64;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v51, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F708A8]);
  uint64_t v11 = v77[5];
  uint64_t v12 = v71[5];
  uint64_t v13 = v65[5];
  id v50 = 0;
  uint64_t v15 = objc_msgSend_initWithTitle_subtitle_synonyms_error_(v10, v14, v11, v12, v13, (uint64_t)&v50);
  id v16 = v50;
  uint64_t v17 = v16;
  if (v15)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F708B0]);
    uint64_t v19 = v59[5];
    uint64_t v20 = v53[5];
    id v49 = v17;
    id v23 = (id)objc_msgSend_initWithName_synonyms_error_(v18, v21, v19, v20, (uint64_t)&v49, v22);
    id v24 = v49;

    if (v23)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F70920]);
      uint64_t v26 = v83[5];
      id v48 = v24;
      id v28 = (id)objc_msgSend_initWithTypeIdentifier_displayRepresentation_typeDisplayRepresentation_error_(v25, v27, v26, (uint64_t)v15, (uint64_t)v23, (uint64_t)&v48);
      id v29 = v48;

      if (v28)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F70928]);
        id v36 = objc_msgSend_itemId(v5, v31, v32, v33, v34, v35);
        id v47 = v29;
        id v39 = (id)objc_msgSend_initWithSourceItemIdentifier_rank_error_(v30, v37, (uint64_t)v36, 0, (uint64_t)&v47, v38);
        id v24 = v47;

        if (v39)
        {
          uint64_t v40 = sub_1BC3CAF78(v28, v39, v5, a4);
        }
        else
        {
          id v44 = sub_1BC3CAE88(v24, v5);
          id v45 = v44;
          if (a4 && v44) {
            *a4 = v44;
          }

          id v39 = 0;
          uint64_t v40 = 0;
        }
      }
      else
      {
        uint64_t v43 = sub_1BC3CAE88(v29, v5);
        id v39 = v43;
        uint64_t v40 = 0;
        if (a4 && v43)
        {
          id v39 = v43;
          uint64_t v40 = 0;
          *a4 = v39;
        }
        id v24 = v29;
      }
    }
    else
    {
      uint64_t v42 = sub_1BC3CAE88(v24, v5);
      id v28 = v42;
      uint64_t v40 = 0;
      if (a4 && v42)
      {
        id v28 = v42;
        uint64_t v40 = 0;
        *a4 = v28;
      }
    }

    uint64_t v17 = v24;
  }
  else
  {
    uint64_t v41 = sub_1BC3CAE88(v16, v5);
    id v23 = v41;
    uint64_t v40 = 0;
    if (a4 && v41)
    {
      id v23 = v41;
      uint64_t v40 = 0;
      *a4 = v23;
    }
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  return v40;
}

+ (id)_convertFromKVItemType_LearnedMediaEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v71 = 0;
  uint64_t v72 = &v71;
  uint64_t v73 = 0x3032000000;
  uint64_t v74 = sub_1BC3C8B04;
  id v75 = sub_1BC3C8B14;
  id v76 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x3032000000;
  uint64_t v68 = sub_1BC3C8B04;
  id v69 = sub_1BC3C8B14;
  id v70 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  uint64_t v62 = sub_1BC3C8B04;
  id v63 = sub_1BC3C8B14;
  id v64 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  char v56 = sub_1BC3C8B04;
  id v57 = sub_1BC3C8B14;
  id v58 = 0;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x3032000000;
  id v50 = sub_1BC3C8B04;
  uint64_t v51 = sub_1BC3C8B14;
  id v52 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = sub_1BC3C8B04;
  id v45 = sub_1BC3C8B14;
  id v46 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = sub_1BC3CC5B8;
  v40[3] = &unk_1E62AD4A0;
  v40[4] = &v71;
  v40[5] = &v65;
  v40[6] = &v59;
  v40[7] = &v47;
  v40[8] = &v53;
  v40[9] = &v41;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v40, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70B60]);
  uint64_t v11 = v72[5];
  uint64_t v12 = v66[5];
  uint64_t v13 = v60[5];
  uint64_t v14 = v54[5];
  uint64_t v15 = v48[5];
  uint64_t v16 = v42[5];
  id v39 = 0;
  id v18 = objc_msgSend_initWithUserPhrasedSongName_userPhrasedArtistName_userPhrasedAlbumName_userPhrasedEntityName_userPhrasedVersion_suggestedAdamId_error_(v10, v17, v11, v12, v13, v14, v15, v16, &v39);
  id v19 = v39;
  uint64_t v20 = v19;
  if (v18)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F70B68]);
    uint64_t v27 = objc_msgSend_itemId(v5, v22, v23, v24, v25, v26);
    id v38 = v20;
    id v31 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v21, v28, (uint64_t)v27, (uint64_t)&v38, v29, v30);
    id v32 = v38;

    if (v31)
    {
      uint64_t v33 = sub_1BC3CAF78(v18, v31, v5, a4);
    }
    else
    {
      uint64_t v35 = sub_1BC3CAE88(v32, v5);
      id v36 = v35;
      if (a4 && v35) {
        *a4 = v35;
      }

      id v31 = 0;
      uint64_t v33 = 0;
    }
  }
  else
  {
    uint64_t v34 = sub_1BC3CAE88(v19, v5);
    id v31 = v34;
    uint64_t v33 = 0;
    if (a4 && v34)
    {
      id v31 = v34;
      uint64_t v33 = 0;
      *a4 = v31;
    }
    id v32 = v20;
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v71, 8);

  return v33;
}

+ (id)_convertFromKVItemType_LearnedContact:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1BC3C8B04;
  id v48 = sub_1BC3C8B14;
  id v49 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = sub_1BC3C8B04;
  uint64_t v42 = sub_1BC3C8B14;
  id v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1BC3CC964;
  v37[3] = &unk_1E62AD450;
  v37[4] = &v38;
  v37[5] = &v44;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v37, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70B50]);
  uint64_t v11 = v45[5];
  uint64_t v12 = v39[5];
  id v36 = 0;
  uint64_t v15 = objc_msgSend_initWithUserPhrasedName_suggestedContactId_error_(v10, v13, v11, v12, (uint64_t)&v36, v14);
  id v16 = v36;
  uint64_t v17 = v16;
  if (v15)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F70B58]);
    uint64_t v24 = objc_msgSend_itemId(v5, v19, v20, v21, v22, v23);
    id v35 = v17;
    id v28 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v25, (uint64_t)v24, (uint64_t)&v35, v26, v27);
    id v29 = v35;

    if (v28)
    {
      uint64_t v30 = sub_1BC3CAF78(v15, v28, v5, a4);
    }
    else
    {
      id v32 = sub_1BC3CAE88(v29, v5);
      uint64_t v33 = v32;
      if (a4 && v32) {
        *a4 = v32;
      }

      id v28 = 0;
      uint64_t v30 = 0;
    }
  }
  else
  {
    id v31 = sub_1BC3CAE88(v16, v5);
    id v28 = v31;
    uint64_t v30 = 0;
    if (a4 && v31)
    {
      id v28 = v31;
      uint64_t v30 = 0;
      *a4 = v28;
    }
    id v29 = v17;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

+ (id)_convertFromKVItemType_FindMy:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_1BC3C8B04;
  uint64_t v60 = sub_1BC3C8B14;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_1BC3C8B04;
  uint64_t v54 = sub_1BC3C8B14;
  id v55 = 0;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1BC3C8B04;
  id v48 = sub_1BC3C8B14;
  id v49 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = sub_1BC3CCD2C;
  v43[3] = &unk_1E62AD360;
  v43[4] = &v56;
  v43[5] = &v50;
  v43[6] = &v44;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v43, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F709C8]);
  uint64_t v11 = v51[5];
  uint64_t v12 = v45[5];
  id v42 = 0;
  Name_lastName_error = objc_msgSend_initWithFirstName_lastName_error_(v10, v13, v11, v12, (uint64_t)&v42, v14);
  id v16 = v42;
  id v17 = objc_alloc(MEMORY[0x1E4F709B8]);
  uint64_t v18 = v57[5];
  id v41 = v16;
  uint64_t v21 = objc_msgSend_initWithName_owner_error_(v17, v19, v18, (uint64_t)Name_lastName_error, (uint64_t)&v41, v20);
  id v22 = v41;

  if (v21)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F709C0]);
    id v29 = objc_msgSend_itemId(v5, v24, v25, v26, v27, v28);
    id v40 = v22;
    id v33 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v23, v30, (uint64_t)v29, (uint64_t)&v40, v31, v32);
    id v34 = v40;

    if (v33)
    {
      id v35 = sub_1BC3CAF78(v21, v33, v5, a4);
    }
    else
    {
      uint64_t v37 = sub_1BC3CAE88(v34, v5);
      uint64_t v38 = v37;
      if (a4 && v37) {
        *a4 = v37;
      }

      id v33 = 0;
      id v35 = 0;
    }
  }
  else
  {
    id v36 = sub_1BC3CAE88(v22, v5);
    id v33 = v36;
    id v35 = 0;
    if (a4 && v36)
    {
      id v33 = v36;
      id v35 = 0;
      *a4 = v33;
    }
    id v34 = v22;
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v35;
}

+ (id)_convertFromKVItemType_UserAccount:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1BC3C8B04;
  id v48 = sub_1BC3C8B14;
  id v49 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_1BC3C8B04;
  id v42 = sub_1BC3C8B14;
  id v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1BC3CD070;
  v37[3] = &unk_1E62AD450;
  v37[4] = &v44;
  v37[5] = &v38;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v37, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70B88]);
  uint64_t v11 = v45[5];
  uint64_t v12 = v39[5];
  id v36 = 0;
  uint64_t v15 = objc_msgSend_initWithUserName_givenName_error_(v10, v13, v11, v12, (uint64_t)&v36, v14);
  id v16 = v36;
  id v17 = v16;
  if (v15)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F70B90]);
    uint64_t v24 = objc_msgSend_itemId(v5, v19, v20, v21, v22, v23);
    id v35 = v17;
    id v28 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v25, (uint64_t)v24, (uint64_t)&v35, v26, v27);
    id v29 = v35;

    if (v28)
    {
      uint64_t v30 = sub_1BC3CAF78(v15, v28, v5, a4);
    }
    else
    {
      uint64_t v32 = sub_1BC3CAE88(v29, v5);
      id v33 = v32;
      if (a4 && v32) {
        *a4 = v32;
      }

      id v28 = 0;
      uint64_t v30 = 0;
    }
  }
  else
  {
    uint64_t v31 = sub_1BC3CAE88(v16, v5);
    id v28 = v31;
    uint64_t v30 = 0;
    if (a4 && v31)
    {
      id v28 = v31;
      uint64_t v30 = 0;
      *a4 = v28;
    }
    id v29 = v17;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

+ (id)_convertFromKVItemType_Health:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1BC3C8B04;
  id v48 = sub_1BC3C8B14;
  id v49 = 0;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_1BC3C8B04;
  id v42 = sub_1BC3C8B14;
  id v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1BC3CD398;
  v37[3] = &unk_1E62AD450;
  v37[4] = &v44;
  v37[5] = &v38;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v37, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F709E0]);
  uint64_t v11 = v45[5];
  uint64_t v12 = v39[5];
  id v36 = 0;
  uint64_t v15 = objc_msgSend_initWithName_nickname_error_(v10, v13, v11, v12, (uint64_t)&v36, v14);
  id v16 = v36;
  id v17 = v16;
  if (v15)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F709E8]);
    uint64_t v24 = objc_msgSend_itemId(v5, v19, v20, v21, v22, v23);
    id v35 = v17;
    id v28 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v25, (uint64_t)v24, (uint64_t)&v35, v26, v27);
    id v29 = v35;

    if (v28)
    {
      uint64_t v30 = sub_1BC3CAF78(v15, v28, v5, a4);
    }
    else
    {
      uint64_t v32 = sub_1BC3CAE88(v29, v5);
      id v33 = v32;
      if (a4 && v32) {
        *a4 = v32;
      }

      id v28 = 0;
      uint64_t v30 = 0;
    }
  }
  else
  {
    uint64_t v31 = sub_1BC3CAE88(v16, v5);
    id v28 = v31;
    uint64_t v30 = 0;
    if (a4 && v31)
    {
      id v28 = v31;
      uint64_t v30 = 0;
      *a4 = v28;
    }
    id v29 = v17;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

+ (id)_convertFromKVItemType_Fitness:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_1BC3C8B04;
  id v42 = sub_1BC3C8B14;
  id v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1BC3CD664;
  v37[3] = &unk_1E62AD478;
  v37[4] = &v38;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v37, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F709D0]);
  uint64_t v11 = v39[5];
  id v36 = 0;
  uint64_t v15 = objc_msgSend_initWithName_error_(v10, v12, v11, (uint64_t)&v36, v13, v14);
  id v16 = v36;
  id v17 = v16;
  if (v15)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F709D8]);
    uint64_t v24 = objc_msgSend_itemId(v5, v19, v20, v21, v22, v23);
    id v35 = v17;
    id v28 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v25, (uint64_t)v24, (uint64_t)&v35, v26, v27);
    id v29 = v35;

    if (v28)
    {
      uint64_t v30 = sub_1BC3CAF78(v15, v28, v5, a4);
    }
    else
    {
      uint64_t v32 = sub_1BC3CAE88(v29, v5);
      id v33 = v32;
      if (a4 && v32) {
        *a4 = v32;
      }

      id v28 = 0;
      uint64_t v30 = 0;
    }
  }
  else
  {
    uint64_t v31 = sub_1BC3CAE88(v16, v5);
    id v28 = v31;
    uint64_t v30 = 0;
    if (a4 && v31)
    {
      id v28 = v31;
      uint64_t v30 = 0;
      *a4 = v28;
    }
    id v29 = v17;
  }

  _Block_object_dispose(&v38, 8);
  return v30;
}

+ (id)_convertFromKVItemType_Podcast:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  int v68 = 0;
  uint64_t v59 = 0;
  uint64_t v60 = &v59;
  uint64_t v61 = 0x3032000000;
  uint64_t v62 = sub_1BC3C8B04;
  id v63 = sub_1BC3C8B14;
  id v64 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  uint64_t v56 = sub_1BC3C8B04;
  id v57 = sub_1BC3C8B14;
  id v58 = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = sub_1BC3CDA3C;
  v52[3] = &unk_1E62AD360;
  v52[4] = &v65;
  v52[5] = &v59;
  v52[6] = &v53;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v52, v7, v8, v9);
  int v10 = *((_DWORD *)v66 + 6);
  if (v10 == 1)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F70B20]);
    uint64_t v19 = v60[5];
    uint64_t v20 = v54[5];
    uint64_t v51 = 0;
    uint64_t v13 = (id *)&v51;
    uint64_t v17 = objc_msgSend_initWithName_author_error_(v18, v21, v19, v20, (uint64_t)&v51, v22);
    goto LABEL_5;
  }
  if (v10 == 2)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F70B18]);
    uint64_t v12 = v60[5];
    uint64_t v50 = 0;
    uint64_t v13 = (id *)&v50;
    uint64_t v17 = objc_msgSend_initWithName_error_(v11, v14, v12, (uint64_t)&v50, v15, v16);
LABEL_5:
    uint64_t v23 = (void *)v17;
    id v24 = *v13;
    goto LABEL_7;
  }
  uint64_t v23 = 0;
  id v24 = 0;
LABEL_7:
  id v25 = objc_alloc(MEMORY[0x1E4F70B08]);
  uint64_t v26 = *((unsigned int *)v66 + 6);
  id v49 = v24;
  id v29 = objc_msgSend_initWithEntity_entityType_error_(v25, v27, (uint64_t)v23, v26, (uint64_t)&v49, v28);
  id v30 = v49;

  if (v29)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F70B10]);
    uint64_t v37 = objc_msgSend_itemId(v5, v32, v33, v34, v35, v36);
    id v48 = v30;
    id v41 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v31, v38, (uint64_t)v37, (uint64_t)&v48, v39, v40);
    id v42 = v48;

    if (v41)
    {
      id v43 = sub_1BC3CAF78(v29, v41, v5, a4);
    }
    else
    {
      id v45 = sub_1BC3CAE88(v42, v5);
      uint64_t v46 = v45;
      if (a4 && v45) {
        *a4 = v45;
      }

      id v41 = 0;
      id v43 = 0;
    }
  }
  else
  {
    uint64_t v44 = sub_1BC3CAE88(v30, v5);
    id v41 = v44;
    id v43 = 0;
    if (a4 && v44)
    {
      id v41 = v44;
      id v43 = 0;
      *a4 = v41;
    }
    id v42 = v30;
  }

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
  return v43;
}

+ (id)_convertFromKVItemType_CalendarEvent:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1BC3C8B04;
  id v48 = sub_1BC3C8B14;
  id v49 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_1BC3C8B04;
  id v42 = sub_1BC3C8B14;
  id v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1BC3CDD8C;
  v37[3] = &unk_1E62AD450;
  v37[4] = &v44;
  void v37[5] = &v38;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v37, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70960]);
  uint64_t v11 = v45[5];
  uint64_t v12 = v39[5];
  id v36 = 0;
  uint64_t v15 = objc_msgSend_initWithTitle_locationName_error_(v10, v13, v11, v12, (uint64_t)&v36, v14);
  id v16 = v36;
  uint64_t v17 = v16;
  if (v15)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F70968]);
    id v24 = objc_msgSend_itemId(v5, v19, v20, v21, v22, v23);
    id v35 = v17;
    id v28 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v25, (uint64_t)v24, (uint64_t)&v35, v26, v27);
    id v29 = v35;

    if (v28)
    {
      id v30 = sub_1BC3CAF78(v15, v28, v5, a4);
    }
    else
    {
      uint64_t v32 = sub_1BC3CAE88(v29, v5);
      uint64_t v33 = v32;
      if (a4 && v32) {
        *a4 = v32;
      }

      id v28 = 0;
      id v30 = 0;
    }
  }
  else
  {
    id v31 = sub_1BC3CAE88(v16, v5);
    id v28 = v31;
    id v30 = 0;
    if (a4 && v31)
    {
      id v28 = v31;
      id v30 = 0;
      *a4 = v28;
    }
    id v29 = v17;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

+ (id)_convertFromKVItemType_LocationOfInterest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v80 = 0;
  id v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = sub_1BC3C8B04;
  uint64_t v84 = sub_1BC3C8B14;
  id v85 = 0;
  uint64_t v74 = 0;
  id v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = sub_1BC3C8B04;
  uint64_t v78 = sub_1BC3C8B14;
  id v79 = 0;
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x3032000000;
  uint64_t v71 = sub_1BC3C8B04;
  uint64_t v72 = sub_1BC3C8B14;
  id v73 = 0;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = sub_1BC3C8B04;
  uint64_t v66 = sub_1BC3C8B14;
  id v67 = 0;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_1BC3C8B04;
  uint64_t v60 = sub_1BC3C8B14;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_1BC3C8B04;
  uint64_t v54 = sub_1BC3C8B14;
  id v55 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1BC3CE31C;
  v44[3] = byte_1E62AD428;
  v44[4] = v49;
  v44[5] = &v80;
  v44[6] = &v74;
  v44[7] = &v45;
  v44[8] = &v68;
  v44[9] = &v62;
  v44[10] = &v56;
  v44[11] = &v50;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, byte_1E62AD428, (uint64_t)v44, v6, v7, v8);
  if (v46[3])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F70B38]);
    uint64_t v10 = v69[5];
    uint64_t v11 = v63[5];
    uint64_t v12 = v57[5];
    uint64_t v13 = v51[5];
    id v43 = 0;
    id v15 = (id)objc_msgSend_initWithThoroughfare_subLocality_locality_country_error_(v9, v14, v10, v11, v12, v13, &v43);
    id v16 = v43;
    id v17 = v16;
    if (!v15)
    {
      id v18 = sub_1BC3CAE88(v16, v5);
      id v15 = v18;
      uint64_t v19 = 0;
      if (a4 && v18)
      {
        id v15 = v18;
        uint64_t v19 = 0;
        *a4 = v15;
      }
      goto LABEL_19;
    }
  }
  else
  {
    id v15 = 0;
    id v17 = 0;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F70B40]);
  uint64_t v21 = v81[5];
  uint64_t v22 = v75[5];
  id v42 = v17;
  id v24 = objc_msgSend_initWithPreferredName_mapItemName_address_error_(v20, v23, v21, v22, (uint64_t)v15, (uint64_t)&v42);
  id v25 = v42;

  if (v24)
  {
    id v26 = objc_alloc(MEMORY[0x1E4F70B48]);
    uint64_t v32 = objc_msgSend_itemId(v5, v27, v28, v29, v30, v31);
    id v41 = v25;
    id v36 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v26, v33, (uint64_t)v32, (uint64_t)&v41, v34, v35);
    id v17 = v41;

    if (v36)
    {
      uint64_t v19 = sub_1BC3CAF78(v24, v36, v5, a4);
    }
    else
    {
      uint64_t v38 = sub_1BC3CAE88(v17, v5);
      uint64_t v39 = v38;
      if (a4 && v38) {
        *a4 = v38;
      }

      id v36 = 0;
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v37 = sub_1BC3CAE88(v25, v5);
    id v36 = v37;
    uint64_t v19 = 0;
    if (a4 && v37)
    {
      id v36 = v37;
      uint64_t v19 = 0;
      *a4 = v36;
    }
    id v17 = v25;
  }

LABEL_19:
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);

  return v19;
}

+ (id)_convertFromKVItemType_RadioEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = sub_1BC3C8B04;
  uint64_t v66 = sub_1BC3C8B14;
  id v67 = 0;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_1BC3C8B04;
  uint64_t v60 = sub_1BC3C8B14;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_1BC3C8B04;
  uint64_t v54 = sub_1BC3C8B14;
  id v55 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1BC3C8B04;
  uint64_t v48 = sub_1BC3C8B14;
  id v49 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1BC3CE7C0;
  v39[3] = &unk_1E62AD3B0;
  v39[4] = &v62;
  v39[5] = &v56;
  v39[6] = &v50;
  v39[7] = &v44;
  v39[8] = &v40;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v39, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70B28]);
  uint64_t v11 = v63[5];
  uint64_t v12 = v57[5];
  uint64_t v13 = v51[5];
  uint64_t v14 = v45[5];
  uint64_t v15 = *((unsigned int *)v41 + 6);
  id v38 = 0;
  id v17 = objc_msgSend_initWithName_callSign_frequency_channel_signalType_error_(v10, v16, v11, v12, v13, v14, v15, &v38);
  id v18 = v38;
  uint64_t v19 = v18;
  if (v17)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F70B30]);
    id v26 = objc_msgSend_itemId(v5, v21, v22, v23, v24, v25);
    id v37 = v19;
    id v30 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v20, v27, (uint64_t)v26, (uint64_t)&v37, v28, v29);
    id v31 = v37;

    if (v30)
    {
      uint64_t v32 = sub_1BC3CAF78(v17, v30, v5, a4);
    }
    else
    {
      uint64_t v34 = sub_1BC3CAE88(v31, v5);
      uint64_t v35 = v34;
      if (a4 && v34) {
        *a4 = v34;
      }

      id v30 = 0;
      uint64_t v32 = 0;
    }
  }
  else
  {
    uint64_t v33 = sub_1BC3CAE88(v18, v5);
    id v30 = v33;
    uint64_t v32 = 0;
    if (a4 && v33)
    {
      id v30 = v33;
      uint64_t v32 = 0;
      *a4 = v30;
    }
    id v31 = v19;
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  return v32;
}

+ (id)_convertFromKVItemType_AppShortcut:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  id v67 = sub_1BC3C8B04;
  uint64_t v68 = sub_1BC3C8B14;
  id v69 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  id v61 = sub_1BC3C8B04;
  uint64_t v62 = sub_1BC3C8B14;
  id v63 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = sub_1BC3C8B04;
  uint64_t v56 = sub_1BC3C8B14;
  id v57 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = sub_1BC3C8B04;
  uint64_t v50 = sub_1BC3C8B14;
  id v51 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  int v43 = sub_1BC3C8B04;
  uint64_t v44 = sub_1BC3C8B14;
  id v45 = 0;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1BC3CECF8;
  v39[3] = &unk_1E62AD3B0;
  v39[4] = &v64;
  v39[5] = &v58;
  v39[6] = &v52;
  v39[7] = &v46;
  v39[8] = &v40;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v39, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70940]);
  uint64_t v11 = v65[5];
  uint64_t v12 = v59[5];
  uint64_t v13 = v53[5];
  uint64_t v14 = v47[5];
  uint64_t v15 = v41[5];
  id v38 = 0;
  id v17 = objc_msgSend_initWithEntityTitle_entityInstanceIdentifier_entityTypeIdentifier_providerClass_entitySynonyms_error_(v10, v16, v11, v12, v13, v14, v15, &v38);
  id v18 = v38;
  uint64_t v19 = v18;
  if (v17)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F70948]);
    id v26 = objc_msgSend_itemId(v5, v21, v22, v23, v24, v25);
    id v37 = v19;
    id v30 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v20, v27, (uint64_t)v26, (uint64_t)&v37, v28, v29);
    id v31 = v37;

    if (v30)
    {
      uint64_t v32 = sub_1BC3CAF78(v17, v30, v5, a4);
    }
    else
    {
      uint64_t v34 = sub_1BC3CAE88(v31, v5);
      uint64_t v35 = v34;
      if (a4 && v34) {
        *a4 = v34;
      }

      id v30 = 0;
      uint64_t v32 = 0;
    }
  }
  else
  {
    uint64_t v33 = sub_1BC3CAE88(v18, v5);
    id v30 = v33;
    uint64_t v32 = 0;
    if (a4 && v33)
    {
      id v30 = v33;
      uint64_t v32 = 0;
      *a4 = v30;
    }
    id v31 = v19;
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v32;
}

+ (id)_convertFromKVItemType_AutoShortcut:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_1BC3C8B04;
  uint64_t v54 = sub_1BC3C8B14;
  id v55 = 0;
  uint64_t v44 = 0;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1BC3C8B04;
  uint64_t v48 = sub_1BC3C8B14;
  id v49 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_1BC3C8B04;
  uint64_t v42 = sub_1BC3C8B14;
  id v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = sub_1BC3CF134;
  v37[3] = &unk_1E62AD360;
  v37[4] = &v50;
  void v37[5] = &v44;
  void v37[6] = &v38;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v37, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70950]);
  uint64_t v11 = v51[5];
  uint64_t v12 = v45[5];
  uint64_t v13 = v39[5];
  id v36 = 0;
  uint64_t v15 = objc_msgSend_initWithPhrase_baseTemplate_templateParameterValue_error_(v10, v14, v11, v12, v13, (uint64_t)&v36);
  id v16 = v36;
  id v17 = v16;
  if (v15)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F70958]);
    uint64_t v24 = objc_msgSend_itemId(v5, v19, v20, v21, v22, v23);
    id v35 = v17;
    id v28 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v18, v25, (uint64_t)v24, (uint64_t)&v35, v26, v27);
    id v29 = v35;

    if (v28)
    {
      id v30 = sub_1BC3CAF78(v15, v28, v5, a4);
    }
    else
    {
      uint64_t v32 = sub_1BC3CAE88(v29, v5);
      uint64_t v33 = v32;
      if (a4 && v32) {
        *a4 = v32;
      }

      id v28 = 0;
      id v30 = 0;
    }
  }
  else
  {
    id v31 = sub_1BC3CAE88(v16, v5);
    id v28 = v31;
    id v30 = 0;
    if (a4 && v31)
    {
      id v28 = v31;
      id v30 = 0;
      *a4 = v28;
    }
    id v29 = v17;
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v30;
}

+ (id)_convertFromKVItemType_MediaEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x2020000000;
  int v71 = 0;
  uint64_t v62 = 0;
  id v63 = &v62;
  uint64_t v64 = 0x3032000000;
  uint64_t v65 = sub_1BC3C8B04;
  uint64_t v66 = sub_1BC3C8B14;
  id v67 = 0;
  uint64_t v56 = 0;
  id v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_1BC3C8B04;
  uint64_t v60 = sub_1BC3C8B14;
  id v61 = 0;
  uint64_t v50 = 0;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_1BC3C8B04;
  uint64_t v54 = sub_1BC3C8B14;
  id v55 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = sub_1BC3CF5F0;
  v45[3] = &unk_1E62AD3D8;
  v45[4] = &v50;
  v45[5] = &v56;
  uint64_t v6 = (void *)MEMORY[0x1C186EA80](v45);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1BC3CF6C8;
  v39[3] = &unk_1E62AD400;
  id v7 = v6;
  id v40 = v7;
  id v41 = &v46;
  uint64_t v42 = &v68;
  id v43 = &v62;
  uint64_t v44 = &v50;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v8, (uint64_t)v39, v9, v10, v11);
  if (*((unsigned char *)v47 + 24))
  {
    uint64_t v12 = sub_1BC3CAE88((void *)v51[5], v5);
    id v13 = v12;
    uint64_t v14 = 0;
    if (a4 && v12)
    {
      id v13 = v12;
      uint64_t v14 = 0;
      *a4 = v13;
    }
  }
  else
  {
    id v15 = objc_alloc(MEMORY[0x1E4F70A90]);
    uint64_t v16 = v63[5];
    uint64_t v17 = *((unsigned int *)v69 + 6);
    id v18 = (id *)(v51 + 5);
    id obj = (id)v51[5];
    id v13 = (id)objc_msgSend_initWithEntity_entityType_error_(v15, v19, v16, v17, (uint64_t)&obj, v20);
    objc_storeStrong(v18, obj);
    if (v13)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F70AA8]);
      uint64_t v27 = objc_msgSend_itemId(v5, v22, v23, v24, v25, v26);
      uint64_t v28 = v57[5];
      id v29 = (id *)(v51 + 5);
      id v37 = (id)v51[5];
      id v32 = (id)objc_msgSend_initWithSourceItemIdentifier_linkedIdentifiers_error_(v21, v30, (uint64_t)v27, v28, (uint64_t)&v37, v31);
      objc_storeStrong(v29, v37);

      if (v32)
      {
        uint64_t v14 = sub_1BC3CAF78(v13, v32, v5, a4);
      }
      else
      {
        uint64_t v34 = sub_1BC3CAE88((void *)v51[5], v5);
        id v35 = v34;
        if (a4 && v34) {
          *a4 = v34;
        }

        id v32 = 0;
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v33 = sub_1BC3CAE88((void *)v51[5], v5);
      id v32 = v33;
      uint64_t v14 = 0;
      if (a4 && v33)
      {
        id v32 = v33;
        uint64_t v14 = 0;
        *a4 = v32;
      }
    }
  }
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v14;
}

+ (id)_convertFromKVItemType_HomeEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v55 = 0;
  uint64_t v56 = &v55;
  uint64_t v57 = 0x2020000000;
  int v58 = 0;
  uint64_t v49 = 0;
  uint64_t v50 = &v49;
  uint64_t v51 = 0x3032000000;
  uint64_t v52 = sub_1BC3C8B04;
  uint64_t v53 = sub_1BC3C8B14;
  id v54 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = sub_1BC3C8B04;
  uint64_t v47 = sub_1BC3C8B14;
  id v48 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  id v40 = sub_1BC3C8B04;
  id v41 = sub_1BC3C8B14;
  id v42 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1BC3D0194;
  v36[3] = &unk_1E62AD338;
  v36[4] = &v55;
  v36[5] = &v49;
  v36[6] = &v37;
  v36[7] = &v43;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v36, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70A00]);
  uint64_t v11 = v50[5];
  uint64_t v12 = *((unsigned int *)v56 + 6);
  id v13 = (id *)(v38 + 5);
  id obj = (id)v38[5];
  uint64_t v16 = objc_msgSend_initWithEntity_entityType_error_(v10, v14, v11, v12, (uint64_t)&obj, v15);
  objc_storeStrong(v13, obj);
  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F70A08]);
    uint64_t v23 = objc_msgSend_itemId(v5, v18, v19, v20, v21, v22);
    uint64_t v24 = v44[5];
    uint64_t v25 = (id *)(v38 + 5);
    id v34 = (id)v38[5];
    id v28 = (id)objc_msgSend_initWithSourceItemIdentifier_assistantHomeKitIdentifier_error_(v17, v26, (uint64_t)v23, v24, (uint64_t)&v34, v27);
    objc_storeStrong(v25, v34);

    if (v28)
    {
      id v29 = sub_1BC3CAF78(v16, v28, v5, a4);
    }
    else
    {
      uint64_t v31 = sub_1BC3CAE88((void *)v38[5], v5);
      id v32 = v31;
      if (a4 && v31) {
        *a4 = v31;
      }

      id v28 = 0;
      id v29 = 0;
    }
  }
  else
  {
    id v30 = sub_1BC3CAE88((void *)v38[5], v5);
    id v28 = v30;
    id v29 = 0;
    if (a4 && v30)
    {
      id v28 = v30;
      id v29 = 0;
      *a4 = v28;
    }
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v55, 8);

  return v29;
}

+ (id)_convertFromKVItemType_AppInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v63 = 0;
  uint64_t v64 = &v63;
  uint64_t v65 = 0x3032000000;
  uint64_t v66 = sub_1BC3C8B04;
  id v67 = sub_1BC3C8B14;
  id v68 = 0;
  uint64_t v57 = 0;
  int v58 = &v57;
  uint64_t v59 = 0x3032000000;
  uint64_t v60 = sub_1BC3C8B04;
  id v61 = sub_1BC3C8B14;
  id v62 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = sub_1BC3C8B04;
  uint64_t v55 = sub_1BC3C8B14;
  id v56 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = sub_1BC3C8B04;
  uint64_t v49 = sub_1BC3C8B14;
  id v50 = 0;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = sub_1BC3C8B04;
  uint64_t v43 = sub_1BC3C8B14;
  id v44 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1BC3D091C;
  v38[3] = &unk_1E62AD3B0;
  v38[4] = &v63;
  v38[5] = &v57;
  v38[6] = &v51;
  v38[7] = &v39;
  v38[8] = &v45;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v38, v7, v8, v9);
  id v10 = objc_alloc(MEMORY[0x1E4F70A60]);
  uint64_t v11 = v64[5];
  uint64_t v12 = v58[5];
  uint64_t v13 = v52[5];
  uint64_t v14 = v46[5];
  id v37 = 0;
  uint64_t v16 = objc_msgSend_initWithBundleIdentifier_bundleName_displayAppName_spokenName_alternativeAppNames_carPlayAlternativeDisplayName_spotlightName_providerName_error_(v10, v15, v11, v12, v13, 0, v14, 0, 0, 0, &v37);
  id v17 = v37;
  id v18 = v17;
  if (v16)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F70A68]);
    uint64_t v25 = objc_msgSend_itemId(v5, v20, v21, v22, v23, v24);
    uint64_t v26 = v40[5];
    id v36 = v18;
    id v29 = (id)objc_msgSend_initWithSourceItemIdentifier_bundleVersion_error_(v19, v27, (uint64_t)v25, v26, (uint64_t)&v36, v28);
    id v30 = v36;

    if (v29)
    {
      uint64_t v31 = sub_1BC3CAF78(v16, v29, v5, a4);
    }
    else
    {
      uint64_t v33 = sub_1BC3CAE88(v30, v5);
      id v34 = v33;
      if (a4 && v33) {
        *a4 = v33;
      }

      id v29 = 0;
      uint64_t v31 = 0;
    }
  }
  else
  {
    id v32 = sub_1BC3CAE88(v17, v5);
    id v29 = v32;
    uint64_t v31 = 0;
    if (a4 && v32)
    {
      id v29 = v32;
      uint64_t v31 = 0;
      *a4 = v29;
    }
    id v30 = v18;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v31;
}

+ (id)_convertFromKVItemType_Contact:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v181 = 0;
  v182 = &v181;
  uint64_t v183 = 0x3032000000;
  v184 = sub_1BC3C8B04;
  v185 = sub_1BC3C8B14;
  id v186 = 0;
  uint64_t v175 = 0;
  v176 = &v175;
  uint64_t v177 = 0x3032000000;
  v178 = sub_1BC3C8B04;
  v179 = sub_1BC3C8B14;
  id v180 = 0;
  uint64_t v169 = 0;
  v170 = &v169;
  uint64_t v171 = 0x3032000000;
  v172 = sub_1BC3C8B04;
  v173 = sub_1BC3C8B14;
  id v174 = 0;
  uint64_t v163 = 0;
  v164 = &v163;
  uint64_t v165 = 0x3032000000;
  v166 = sub_1BC3C8B04;
  v167 = sub_1BC3C8B14;
  id v168 = 0;
  uint64_t v157 = 0;
  v158 = &v157;
  uint64_t v159 = 0x3032000000;
  v160 = sub_1BC3C8B04;
  v161 = sub_1BC3C8B14;
  id v162 = 0;
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x3032000000;
  v154 = sub_1BC3C8B04;
  v155 = sub_1BC3C8B14;
  id v156 = 0;
  uint64_t v145 = 0;
  v146 = &v145;
  uint64_t v147 = 0x3032000000;
  v148 = sub_1BC3C8B04;
  v149 = sub_1BC3C8B14;
  id v150 = 0;
  uint64_t v139 = 0;
  v140 = &v139;
  uint64_t v141 = 0x3032000000;
  v142 = sub_1BC3C8B04;
  v143 = sub_1BC3C8B14;
  id v144 = 0;
  uint64_t v133 = 0;
  v134 = &v133;
  uint64_t v135 = 0x3032000000;
  v136 = sub_1BC3C8B04;
  v137 = sub_1BC3C8B14;
  id v138 = 0;
  uint64_t v127 = 0;
  v128 = &v127;
  uint64_t v129 = 0x3032000000;
  v130 = sub_1BC3C8B04;
  v131 = sub_1BC3C8B14;
  id v132 = 0;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x3032000000;
  v124 = sub_1BC3C8B04;
  v125 = sub_1BC3C8B14;
  id v126 = 0;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x3032000000;
  v118 = sub_1BC3C8B04;
  v119 = sub_1BC3C8B14;
  id v120 = 0;
  uint64_t v109 = 0;
  uint64_t v110 = &v109;
  uint64_t v111 = 0x3032000000;
  v112 = sub_1BC3C8B04;
  id v113 = sub_1BC3C8B14;
  id v114 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  char v106 = sub_1BC3C8B04;
  id v107 = sub_1BC3C8B14;
  id v108 = 0;
  uint64_t v97 = 0;
  v98 = &v97;
  uint64_t v99 = 0x3032000000;
  v100 = sub_1BC3C8B04;
  v101 = sub_1BC3C8B14;
  id v102 = 0;
  uint64_t v91 = 0;
  uint64_t v92 = &v91;
  uint64_t v93 = 0x3032000000;
  uint64_t v94 = sub_1BC3C8B04;
  v95 = sub_1BC3C8B14;
  id v96 = 0;
  uint64_t v85 = 0;
  uint64_t v86 = &v85;
  uint64_t v87 = 0x3032000000;
  uint64_t v88 = sub_1BC3C8B04;
  v89 = sub_1BC3C8B14;
  id v90 = 0;
  uint64_t v79 = 0;
  uint64_t v80 = &v79;
  uint64_t v81 = 0x3032000000;
  uint64_t v82 = sub_1BC3C8B04;
  v83 = sub_1BC3C8B14;
  id v84 = 0;
  uint64_t v73 = 0;
  uint64_t v74 = &v73;
  uint64_t v75 = 0x3032000000;
  uint64_t v76 = sub_1BC3C8B04;
  id v77 = sub_1BC3C8B14;
  id v78 = 0;
  uint64_t v67 = 0;
  id v68 = &v67;
  uint64_t v69 = 0x3032000000;
  uint64_t v70 = sub_1BC3C8B04;
  int v71 = sub_1BC3C8B14;
  id v72 = 0;
  uint64_t v61 = 0;
  id v62 = &v61;
  uint64_t v63 = 0x3032000000;
  uint64_t v64 = sub_1BC3C8B04;
  uint64_t v65 = sub_1BC3C8B14;
  id v66 = 0;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x3032000000;
  int v58 = sub_1BC3C8B04;
  uint64_t v59 = sub_1BC3C8B14;
  id v60 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1BC3D1594;
  v50[3] = &unk_1E62AD388;
  v50[4] = &v181;
  v50[5] = &v175;
  v50[6] = &v169;
  v50[7] = &v163;
  v50[8] = &v157;
  v50[9] = &v151;
  v50[10] = &v145;
  v50[11] = &v55;
  v50[12] = &v51;
  v50[13] = &v139;
  v50[14] = &v133;
  v50[15] = &v127;
  v50[16] = &v121;
  v50[17] = &v115;
  v50[18] = &v109;
  v50[19] = &v103;
  v50[20] = &v97;
  v50[21] = &v91;
  v50[22] = &v85;
  v50[23] = &v79;
  v50[24] = &v73;
  v50[25] = &v67;
  v50[26] = &v61;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, (const char *)&v127, (uint64_t)v50, (uint64_t)&v115, (uint64_t)&v109, (uint64_t)&v103);
  if (*((unsigned char *)v52 + 24))
  {
    uint64_t v6 = sub_1BC3CAE88((void *)v56[5], v5);
    id v7 = v6;
    uint64_t v8 = 0;
    if (a4 && v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      *a4 = v7;
    }
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F70970]);
    uint64_t v10 = v182[5];
    uint64_t v11 = v176[5];
    uint64_t v12 = v170[5];
    uint64_t v13 = v164[5];
    uint64_t v14 = v158[5];
    uint64_t v15 = v152[5];
    uint64_t v16 = v146[5];
    uint64_t v17 = v140[5];
    uint64_t v18 = v134[5];
    uint64_t v19 = v128[5];
    uint64_t v20 = v122[5];
    uint64_t v21 = v116[5];
    uint64_t v22 = v110[5];
    uint64_t v23 = v104[5];
    uint64_t v24 = v98[5];
    uint64_t v25 = v92[5];
    uint64_t v26 = (const char *)v86[5];
    uint64_t v27 = v80[5];
    uint64_t v28 = v74[5];
    uint64_t v29 = v68[5];
    uint64_t v30 = v62[5];
    uint64_t v31 = (id *)(v56 + 5);
    id obj = (id)v56[5];
    id v7 = (id)objc_msgSend_initWithGivenName_middleName_familyName_previousFamilyName_nickname_namePrefix_nameSuffix_phoneNumbers_emailAddresses_postalAddresses_urlAddresses_socialProfiles_instantMessageAddresses_relations_organizationName_departmentName_jobTitle_phoneticGivenName_phoneticMiddleName_phoneticFamilyName_phoneticOrganizationName_note_birthday_nonGregorianBirthday_dates_error_(v9, v26, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
               v27,
               v28,
               v29,
               v30,
               0,
               0,
               0,
               0,
               &obj);
    objc_storeStrong(v31, obj);
    if (v7)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F70988]);
      uint64_t v38 = objc_msgSend_itemId(v5, v33, v34, v35, v36, v37);
      uint64_t v39 = (id *)(v56 + 5);
      id v48 = (id)v56[5];
      id v43 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v32, v40, (uint64_t)v38, (uint64_t)&v48, v41, v42);
      objc_storeStrong(v39, v48);

      if (v43)
      {
        uint64_t v8 = sub_1BC3CAF78(v7, v43, v5, a4);
      }
      else
      {
        uint64_t v45 = sub_1BC3CAE88((void *)v56[5], v5);
        uint64_t v46 = v45;
        if (a4 && v45) {
          *a4 = v45;
        }

        id v43 = 0;
        uint64_t v8 = 0;
      }
    }
    else
    {
      id v44 = sub_1BC3CAE88((void *)v56[5], v5);
      id v43 = v44;
      uint64_t v8 = 0;
      if (a4 && v44)
      {
        id v43 = v44;
        uint64_t v8 = 0;
        *a4 = v43;
      }
    }
  }
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v103, 8);

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(&v127, 8);

  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v139, 8);

  _Block_object_dispose(&v145, 8);
  _Block_object_dispose(&v151, 8);

  _Block_object_dispose(&v157, 8);
  _Block_object_dispose(&v163, 8);

  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v175, 8);

  _Block_object_dispose(&v181, 8);
  return v8;
}

+ (id)_convertFromKVItemType_GlobalTerm:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v60 = 0;
  uint64_t v61 = &v60;
  uint64_t v62 = 0x2050000000;
  uint64_t v63 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x2050000000;
  uint64_t v59 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_1BC3C8B04;
  char v54 = sub_1BC3C8B14;
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_1BC3D1FA8;
  v49[3] = &unk_1E62AD360;
  void v49[4] = &v60;
  v49[5] = &v56;
  v49[6] = &v50;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v49, v7, v8, v9);
  uint64_t v14 = (objc_class *)v61[3];
  if (v14 && v57[3])
  {
    id v15 = [v14 alloc];
    uint64_t v16 = v51[5];
    id v48 = 0;
    uint64_t v20 = objc_msgSend_initWithVocabularyStrings_error_(v15, v17, v16, (uint64_t)&v48, v18, v19);
    id v21 = v48;
    uint64_t v22 = v21;
    if (v20)
    {
      id v23 = objc_alloc((Class)v57[3]);
      uint64_t v29 = objc_msgSend_itemId(v5, v24, v25, v26, v27, v28);
      id v47 = v22;
      id v33 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v23, v30, (uint64_t)v29, (uint64_t)&v47, v31, v32);
      id v34 = v47;

      if (v33)
      {
        uint64_t v35 = sub_1BC3CAF78(v20, v33, v5, a4);
      }
      else
      {
        id v44 = sub_1BC3CAE88(v34, v5);
        uint64_t v45 = v44;
        if (a4 && v44) {
          *a4 = v44;
        }

        id v33 = 0;
        uint64_t v35 = 0;
      }
      uint64_t v22 = v34;
    }
    else
    {
      id v43 = sub_1BC3CAE88(v21, v5);
      id v33 = v43;
      uint64_t v20 = 0;
      if (a4 && v43)
      {
        id v33 = v43;
        uint64_t v20 = 0;
        uint64_t v35 = 0;
        *a4 = v33;
      }
      else
      {
        uint64_t v35 = 0;
      }
    }
  }
  else
  {
    uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v64 = *MEMORY[0x1E4F28228];
    uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v10, @"No supported conversion for CustomTerm KVItem: %@", v11, v12, v13, v5);
    v65[0] = v20;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)v65, (uint64_t)&v64, 1, v38);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v39, @"com.apple.koa.item.converter", 1, (uint64_t)v33, v40);
    uint64_t v42 = v41;
    if (a4 && v41) {
      *a4 = v41;
    }

    uint64_t v22 = 0;
    uint64_t v35 = 0;
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  return v35;
}

+ (id)_convertFromKVItemType_CustomTerm:(id)a3 error:(id *)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v66 = 0;
  uint64_t v67 = &v66;
  uint64_t v68 = 0x2050000000;
  uint64_t v69 = 0;
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x2050000000;
  uint64_t v65 = 0;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_1BC3C8B04;
  uint64_t v60 = sub_1BC3C8B14;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_1BC3C8B04;
  char v54 = sub_1BC3C8B14;
  id v55 = 0;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_1BC3D2504;
  v49[3] = &unk_1E62AD338;
  void v49[4] = &v66;
  v49[5] = &v62;
  v49[6] = &v56;
  void v49[7] = &v50;
  objc_msgSend_enumerateFieldsUsingBlock_(v5, v6, (uint64_t)v49, v7, v8, v9);
  uint64_t v14 = (objc_class *)v67[3];
  if (v14 && v63[3])
  {
    id v15 = [v14 alloc];
    uint64_t v16 = v57[5];
    uint64_t v17 = v51[5];
    id v48 = 0;
    uint64_t v20 = objc_msgSend_initWithVocabularyString_vocabularyIdentifier_error_(v15, v18, v16, v17, (uint64_t)&v48, v19);
    id v21 = v48;
    uint64_t v22 = v21;
    if (v20)
    {
      id v23 = objc_alloc((Class)v63[3]);
      uint64_t v29 = objc_msgSend_itemId(v5, v24, v25, v26, v27, v28);
      id v47 = v22;
      id v33 = (id)objc_msgSend_initWithSourceItemIdentifier_error_(v23, v30, (uint64_t)v29, (uint64_t)&v47, v31, v32);
      id v34 = v47;

      if (v33)
      {
        uint64_t v35 = sub_1BC3CAF78(v20, v33, v5, a4);
      }
      else
      {
        id v44 = sub_1BC3CAE88(v34, v5);
        uint64_t v45 = v44;
        if (a4 && v44) {
          *a4 = v44;
        }

        id v33 = 0;
        uint64_t v35 = 0;
      }
      uint64_t v22 = v34;
    }
    else
    {
      id v43 = sub_1BC3CAE88(v21, v5);
      id v33 = v43;
      uint64_t v20 = 0;
      if (a4 && v43)
      {
        id v33 = v43;
        uint64_t v20 = 0;
        uint64_t v35 = 0;
        *a4 = v33;
      }
      else
      {
        uint64_t v35 = 0;
      }
    }
  }
  else
  {
    uint64_t v36 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v70 = *MEMORY[0x1E4F28228];
    uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v10, @"No supported conversion for CustomTerm KVItem: %@", v11, v12, v13, v5);
    v71[0] = v20;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v37, (uint64_t)v71, (uint64_t)&v70, 1, v38);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = objc_msgSend_errorWithDomain_code_userInfo_(v36, v39, @"com.apple.koa.item.converter", 1, (uint64_t)v33, v40);
    uint64_t v42 = v41;
    if (a4 && v41) {
      *a4 = v41;
    }

    uint64_t v22 = 0;
    uint64_t v35 = 0;
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);

  return v35;
}

+ (id)cascadeItemFromItem:(id)a3 error:(id *)a4
{
  v132[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v16 = objc_msgSend_itemType(v5, v11, v12, v13, v14, v15);
    int v26 = objc_msgSend_cascadeItemTypeFromItemType_(v10, v17, v16, v18, v19, v20);
    if (v26 == (unsigned __int16)*MEMORY[0x1E4F57F78])
    {
      uint64_t v27 = objc_msgSend_itemType(v5, v21, v22, v23, v24, v25);
      if (v27 == 14)
      {
        id v55 = objc_opt_class();
        uint64_t v32 = objc_msgSend__convertFromKVItemType_GlobalTerm_error_(v55, v56, (uint64_t)v5, (uint64_t)a4, v57, v58);
        goto LABEL_30;
      }
      if (v27 == 1)
      {
        uint64_t v28 = objc_opt_class();
        uint64_t v32 = objc_msgSend__convertFromKVItemType_CustomTerm_error_(v28, v29, (uint64_t)v5, (uint64_t)a4, v30, v31);
LABEL_30:
        uint64_t v42 = (void *)v32;
        goto LABEL_31;
      }
    }
    if (v26 <= 36433)
    {
      if (v26 <= 15756)
      {
        if (v26 > 12009)
        {
          if (v26 == 12010)
          {
            id v120 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_AutoShortcut_error_(v120, v121, (uint64_t)v5, (uint64_t)a4, v122, v123);
            goto LABEL_30;
          }
          if (v26 == 12996)
          {
            uint64_t v76 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_Health_error_(v76, v77, (uint64_t)v5, (uint64_t)a4, v78, v79);
            goto LABEL_30;
          }
        }
        else
        {
          if (v26 == 7690)
          {
            v104 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_HomeEntity_error_(v104, v105, (uint64_t)v5, (uint64_t)a4, v106, v107);
            goto LABEL_30;
          }
          if (v26 == 7822)
          {
            uint64_t v60 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_AppShortcut_error_(v60, v61, (uint64_t)v5, (uint64_t)a4, v62, v63);
            goto LABEL_30;
          }
        }
      }
      else if (v26 <= 18539)
      {
        if (v26 == 15757)
        {
          v112 = objc_opt_class();
          uint64_t v32 = objc_msgSend__convertFromKVItemType_LocationOfInterest_error_(v112, v113, (uint64_t)v5, (uint64_t)a4, v114, v115);
          goto LABEL_30;
        }
        if (v26 == 17034)
        {
          uint64_t v68 = objc_opt_class();
          uint64_t v32 = objc_msgSend__convertFromKVItemType_HomeServiceArea_error_(v68, v69, (uint64_t)v5, (uint64_t)a4, v70, v71);
          goto LABEL_30;
        }
      }
      else
      {
        switch(v26)
        {
          case 18540:
            uint64_t v88 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_MediaEntity_error_(v88, v89, (uint64_t)v5, (uint64_t)a4, v90, v91);
            goto LABEL_30;
          case 19668:
            uint64_t v92 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_Contact_error_(v92, v93, (uint64_t)v5, (uint64_t)a4, v94, v95);
            goto LABEL_30;
          case 27122:
            id v47 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_FindMy_error_(v47, v48, (uint64_t)v5, (uint64_t)a4, v49, v50);
            goto LABEL_30;
        }
      }
    }
    else if (v26 > 53600)
    {
      if (v26 <= 54384)
      {
        if (v26 == 53601)
        {
          v116 = objc_opt_class();
          uint64_t v32 = objc_msgSend__convertFromKVItemType_LearnedContact_error_(v116, v117, (uint64_t)v5, (uint64_t)a4, v118, v119);
          goto LABEL_30;
        }
        if (v26 == 53614)
        {
          id v72 = objc_opt_class();
          uint64_t v32 = objc_msgSend__convertFromKVItemType_Fitness_error_(v72, v73, (uint64_t)v5, (uint64_t)a4, v74, v75);
          goto LABEL_30;
        }
      }
      else
      {
        switch(v26)
        {
          case 54385:
            id v96 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_CalendarEvent_error_(v96, v97, (uint64_t)v5, (uint64_t)a4, v98, v99);
            goto LABEL_30;
          case 61509:
            v100 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_UserAccount_error_(v100, v101, (uint64_t)v5, (uint64_t)a4, v102, v103);
            goto LABEL_30;
          case 62158:
            uint64_t v51 = objc_opt_class();
            uint64_t v32 = objc_msgSend__convertFromKVItemType_LearnedMediaEntity_error_(v51, v52, (uint64_t)v5, (uint64_t)a4, v53, v54);
            goto LABEL_30;
        }
      }
    }
    else if (v26 <= 42610)
    {
      if (v26 == 36434)
      {
        id v108 = objc_opt_class();
        uint64_t v32 = objc_msgSend__convertFromKVItemType_AppInfo_error_(v108, v109, (uint64_t)v5, (uint64_t)a4, v110, v111);
        goto LABEL_30;
      }
      if (v26 == 42184)
      {
        uint64_t v64 = objc_opt_class();
        uint64_t v32 = objc_msgSend__convertFromKVItemType_Podcast_error_(v64, v65, (uint64_t)v5, (uint64_t)a4, v66, v67);
        goto LABEL_30;
      }
    }
    else
    {
      switch(v26)
      {
        case 42611:
          uint64_t v80 = objc_opt_class();
          uint64_t v32 = objc_msgSend__convertFromKVItemType_AppIntentsEnum_error_(v80, v81, (uint64_t)v5, (uint64_t)a4, v82, v83);
          goto LABEL_30;
        case 47341:
          id v84 = objc_opt_class();
          uint64_t v32 = objc_msgSend__convertFromKVItemType_AppIntentsEntity_error_(v84, v85, (uint64_t)v5, (uint64_t)a4, v86, v87);
          goto LABEL_30;
        case 49066:
          id v43 = objc_opt_class();
          uint64_t v32 = objc_msgSend__convertFromKVItemType_RadioEntity_error_(v43, v44, (uint64_t)v5, (uint64_t)a4, v45, v46);
          goto LABEL_30;
      }
    }
    v124 = (void *)MEMORY[0x1E4F28C58];
    id v34 = objc_msgSend_stringWithFormat_(NSString, v21, @"No supported conversion for KVItem: %@", v23, v24, v25, v5, *MEMORY[0x1E4F28228]);
    v130 = v34;
    uint64_t v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v125, (uint64_t)&v130, (uint64_t)&v129, 1, v126);
    objc_msgSend_errorWithDomain_code_userInfo_(v124, v127, @"com.apple.koa.item.converter", 1, (uint64_t)v37, v128);
  }
  else
  {
    id v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v131 = *MEMORY[0x1E4F28228];
    id v34 = objc_msgSend_stringWithFormat_(NSString, v6, @"Cannot convert invalid KVItem: %@", v7, v8, v9, v5);
    v132[0] = v34;
    uint64_t v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)v132, (uint64_t)&v131, 1, v36);
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v38, @"com.apple.koa.item.converter", 2, (uint64_t)v37, v39);
  uint64_t v40 = };
  uint64_t v41 = v40;
  if (a4 && v40) {
    *a4 = v40;
  }

  uint64_t v42 = 0;
LABEL_31:

  return v42;
}

+ (unsigned)cascadeFieldTypeFromFieldType:(int64_t)a3
{
  if (a3 <= 300)
  {
    unsigned __int16 result = -4181;
    switch(a3)
    {
      case 1:
        return result;
      case 2:
        unsigned __int16 result = -2164;
        break;
      case 3:
        unsigned __int16 result = 13887;
        break;
      case 4:
        unsigned __int16 result = -12051;
        break;
      case 5:
        unsigned __int16 result = -20598;
        break;
      case 6:
        unsigned __int16 result = 14819;
        break;
      case 7:
        unsigned __int16 result = 803;
        break;
      case 8:
        unsigned __int16 result = 16254;
        break;
      case 9:
        unsigned __int16 result = 25886;
        break;
      case 10:
        unsigned __int16 result = 26515;
        break;
      case 11:
        unsigned __int16 result = 5598;
        break;
      case 12:
        unsigned __int16 result = -32568;
        break;
      case 13:
        unsigned __int16 result = 7722;
        break;
      case 14:
        unsigned __int16 result = 14709;
        break;
      case 15:
        unsigned __int16 result = -27282;
        break;
      case 16:
        unsigned __int16 result = 15575;
        break;
      case 17:
        unsigned __int16 result = 30601;
        break;
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
        return *MEMORY[0x1E4F57F78];
      case 50:
        unsigned __int16 result = 19679;
        break;
      case 51:
        unsigned __int16 result = 19680;
        break;
      case 52:
        unsigned __int16 result = 19681;
        break;
      case 53:
        unsigned __int16 result = 19682;
        break;
      case 54:
        unsigned __int16 result = 19683;
        break;
      case 55:
        unsigned __int16 result = 19684;
        break;
      case 56:
        unsigned __int16 result = 19685;
        break;
      case 57:
        unsigned __int16 result = 19747;
        break;
      case 58:
        unsigned __int16 result = 19765;
        break;
      case 59:
        unsigned __int16 result = 19749;
        break;
      case 60:
        unsigned __int16 result = 19767;
        break;
      case 61:
        unsigned __int16 result = 19760;
        break;
      case 62:
        unsigned __int16 result = 19744;
        break;
      case 63:
        unsigned __int16 result = 19758;
        break;
      case 64:
        unsigned __int16 result = 19693;
        break;
      case 65:
        unsigned __int16 result = 19694;
        break;
      case 66:
        unsigned __int16 result = 19695;
        break;
      case 67:
        unsigned __int16 result = 19696;
        break;
      case 68:
        unsigned __int16 result = 19697;
        break;
      case 69:
        unsigned __int16 result = 19698;
        break;
      case 70:
        unsigned __int16 result = 19699;
        break;
      case 100:
        unsigned __int16 result = -29099;
        break;
      case 101:
        unsigned __int16 result = -29098;
        break;
      case 102:
        unsigned __int16 result = -29097;
        break;
      case 103:
        unsigned __int16 result = -29090;
        break;
      case 104:
        unsigned __int16 result = -29095;
        break;
      default:
        switch(a3)
        {
          case 150:
            unsigned __int16 result = 7701;
            break;
          case 151:
            unsigned __int16 result = 7710;
            break;
          case 152:
            unsigned __int16 result = 7704;
            break;
          case 153:
            unsigned __int16 result = 7706;
            break;
          case 154:
            unsigned __int16 result = 7708;
            break;
          case 155:
            unsigned __int16 result = 7705;
            break;
          case 156:
            unsigned __int16 result = 7709;
            break;
          case 157:
            unsigned __int16 result = 7702;
            break;
          case 158:
            unsigned __int16 result = 7700;
            break;
          case 159:
          case 160:
          case 161:
          case 162:
          case 163:
          case 164:
          case 165:
          case 166:
          case 167:
          case 168:
          case 169:
          case 176:
          case 177:
          case 178:
          case 179:
          case 180:
          case 181:
          case 182:
          case 183:
          case 184:
          case 185:
          case 186:
          case 187:
          case 188:
          case 189:
          case 190:
          case 191:
          case 192:
          case 193:
          case 194:
          case 195:
          case 196:
          case 197:
          case 198:
          case 199:
          case 200:
          case 217:
          case 218:
          case 219:
          case 220:
          case 221:
          case 222:
          case 223:
          case 224:
            return *MEMORY[0x1E4F57F78];
          case 170:
            unsigned __int16 result = 17037;
            break;
          case 171:
            unsigned __int16 result = 17038;
            break;
          case 172:
            unsigned __int16 result = 17039;
            break;
          case 173:
            unsigned __int16 result = 17041;
            break;
          case 174:
            unsigned __int16 result = 17042;
            break;
          case 175:
            unsigned __int16 result = 17035;
            break;
          case 201:
          case 203:
          case 205:
          case 207:
          case 209:
          case 211:
          case 213:
          case 215:
          case 225:
          case 227:
          case 229:
          case 231:
            unsigned __int16 result = 18567;
            break;
          case 202:
            unsigned __int16 result = 18556;
            break;
          case 204:
            unsigned __int16 result = 18555;
            break;
          case 206:
            unsigned __int16 result = 18558;
            break;
          case 208:
            unsigned __int16 result = 18557;
            break;
          case 210:
            unsigned __int16 result = 18559;
            break;
          case 212:
            unsigned __int16 result = 18560;
            break;
          case 214:
            unsigned __int16 result = 18561;
            break;
          case 216:
            unsigned __int16 result = 18562;
            break;
          case 226:
            unsigned __int16 result = 18564;
            break;
          case 228:
            unsigned __int16 result = 18563;
            break;
          case 230:
            unsigned __int16 result = 18565;
            break;
          case 232:
            unsigned __int16 result = 18566;
            break;
          default:
            if (a3 != 300) {
              return *MEMORY[0x1E4F57F78];
            }
            unsigned __int16 result = 12013;
            break;
        }
        break;
    }
    return result;
  }
  if (a3 <= 899)
  {
    if (a3 <= 649)
    {
      if (a3 > 599)
      {
        switch(a3)
        {
          case 600:
            unsigned __int16 result = -31224;
            break;
          case 601:
            unsigned __int16 result = 3620;
            break;
          case 602:
            unsigned __int16 result = 8199;
            break;
          case 603:
            unsigned __int16 result = 14030;
            break;
          case 604:
            unsigned __int16 result = -29472;
            break;
          default:
            return *MEMORY[0x1E4F57F78];
        }
      }
      else
      {
        switch(a3)
        {
          case 351:
            unsigned __int16 result = -16467;
            break;
          case 352:
            unsigned __int16 result = -16466;
            break;
          case 353:
            unsigned __int16 result = -16465;
            break;
          case 354:
            unsigned __int16 result = -16464;
            break;
          case 355:
            unsigned __int16 result = -16463;
            break;
          default:
            if (a3 == 301)
            {
              unsigned __int16 result = 12014;
            }
            else
            {
              if (a3 != 302) {
                return *MEMORY[0x1E4F57F78];
              }
              unsigned __int16 result = 12015;
            }
            break;
        }
      }
    }
    else
    {
      if (a3 <= 799)
      {
        if (a3 > 700)
        {
          switch(a3)
          {
            case 701:
              return -23346;
            case 702:
              return -23348;
            case 750:
              return -11919;
          }
        }
        else
        {
          switch(a3)
          {
            case 650:
              return -11148;
            case 651:
              return -11147;
            case 700:
              return -23347;
          }
        }
        return *MEMORY[0x1E4F57F78];
      }
      switch(a3)
      {
        case 800:
          unsigned __int16 result = 7826;
          break;
        case 801:
          unsigned __int16 result = 7825;
          break;
        case 802:
          unsigned __int16 result = 7827;
          break;
        case 803:
          unsigned __int16 result = 7828;
          break;
        case 804:
          unsigned __int16 result = 7830;
          break;
        default:
          if (a3 == 850)
          {
            unsigned __int16 result = 12999;
          }
          else
          {
            if (a3 != 851) {
              return *MEMORY[0x1E4F57F78];
            }
            unsigned __int16 result = 13000;
          }
          break;
      }
    }
  }
  else if (a3 > 1099)
  {
    switch(a3)
    {
      case 1150:
        unsigned __int16 result = -22924;
        break;
      case 1151:
        unsigned __int16 result = -22915;
        break;
      case 1152:
        unsigned __int16 result = -22914;
        break;
      case 1153:
        unsigned __int16 result = -22919;
        break;
      case 1154:
        unsigned __int16 result = -22918;
        break;
      case 1155:
        unsigned __int16 result = -22917;
        break;
      case 1156:
        unsigned __int16 result = -22916;
        break;
      default:
        switch(a3)
        {
          case 1100:
            unsigned __int16 result = -18182;
            break;
          case 1101:
            unsigned __int16 result = -18184;
            break;
          case 1102:
            unsigned __int16 result = -18183;
            break;
          case 1103:
            unsigned __int16 result = -18189;
            break;
          case 1104:
            unsigned __int16 result = -18188;
            break;
          case 1105:
            unsigned __int16 result = -18187;
            break;
          default:
            return *MEMORY[0x1E4F57F78];
        }
        break;
    }
  }
  else
  {
    if (a3 <= 999)
    {
      if (a3 <= 949)
      {
        if (a3 == 900) {
          return -4024;
        }
        if (a3 == 901) {
          return -4023;
        }
      }
      else
      {
        switch(a3)
        {
          case 950:
            return 27126;
          case 951:
            return 27131;
          case 952:
            return 27132;
        }
      }
      return *MEMORY[0x1E4F57F78];
    }
    switch(a3)
    {
      case 1050:
        unsigned __int16 result = -3377;
        break;
      case 1051:
        unsigned __int16 result = -3376;
        break;
      case 1052:
        unsigned __int16 result = -3375;
        break;
      case 1053:
        unsigned __int16 result = -3373;
        break;
      case 1054:
        unsigned __int16 result = -3374;
        break;
      case 1055:
        unsigned __int16 result = -3372;
        break;
      default:
        if (a3 == 1000)
        {
          unsigned __int16 result = -11931;
        }
        else
        {
          if (a3 != 1001) {
            return *MEMORY[0x1E4F57F78];
          }
          unsigned __int16 result = -11932;
        }
        break;
    }
  }
  return result;
}

+ (int64_t)fieldTypeFromCascadeFieldType:(unsigned __int16)a3
{
  if ((int)a3 > 19746)
  {
    if ((int)a3 > 44937)
    {
      if ((int)a3 > 53603)
      {
        if ((int)a3 <= 61512)
        {
          if ((int)a3 > 54388)
          {
            switch(a3)
            {
              case 0xD475u:
                return 651;
              case 0xEFABu:
                return 1;
              case 0xF048u:
                return 900;
            }
          }
          else
          {
            switch(a3)
            {
              case 0xD164u:
                return 1001;
              case 0xD171u:
                return 750;
              case 0xD474u:
                return 650;
            }
          }
          return 0;
        }
        switch(a3)
        {
          case 0xF2CFu:
            int64_t result = 1050;
            break;
          case 0xF2D0u:
            int64_t result = 1051;
            break;
          case 0xF2D1u:
            int64_t result = 1052;
            break;
          case 0xF2D2u:
            int64_t result = 1054;
            break;
          default:
            if (a3 == 61513)
            {
              int64_t result = 901;
            }
            else
            {
              if (a3 != 63372) {
                return 0;
              }
              int64_t result = 2;
            }
            break;
        }
      }
      else if ((int)a3 > 49068)
      {
        switch(a3)
        {
          case 0xBFADu:
            int64_t result = 351;
            break;
          case 0xBFAEu:
            int64_t result = 352;
            break;
          case 0xBFAFu:
            int64_t result = 353;
            break;
          case 0xBFB0u:
            int64_t result = 354;
            break;
          case 0xBFB1u:
            int64_t result = 355;
            break;
          default:
            if (a3 != 53485) {
              return 0;
            }
            int64_t result = 4;
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 0xB8F3u:
            int64_t result = 1103;
            break;
          case 0xB8F4u:
            int64_t result = 1104;
            break;
          case 0xB8F5u:
            int64_t result = 1105;
            break;
          case 0xB8F6u:
          case 0xB8F7u:
            return 0;
          case 0xB8F8u:
            int64_t result = 1101;
            break;
          case 0xB8F9u:
            int64_t result = 1102;
            break;
          default:
            if (a3 != 44938) {
              return 0;
            }
            int64_t result = 5;
            break;
        }
      }
    }
    else
    {
      if ((int)a3 <= 34311)
      {
        if ((int)a3 > 26514)
        {
          if ((int)a3 > 27131)
          {
            switch(a3)
            {
              case 0x69FCu:
                return 952;
              case 0x7789u:
                return 17;
              case 0x80C8u:
                return 12;
            }
          }
          else
          {
            switch(a3)
            {
              case 0x6793u:
                return 10;
              case 0x69F6u:
                return 950;
              case 0x69FBu:
                return 951;
            }
          }
          return 0;
        }
        if ((int)a3 > 19758)
        {
          if (a3 != 19759)
          {
            if (a3 == 19765) {
              return 58;
            }
            if (a3 == 25886) {
              return 9;
            }
            return 0;
          }
        }
        else
        {
          if (a3 == 19747) {
            return 57;
          }
          if (a3 == 19749) {
            return 59;
          }
          if (a3 != 19758) {
            return 0;
          }
        }
        return 63;
      }
      if ((int)a3 <= 42188)
      {
        if ((int)a3 > 36440)
        {
          switch(a3)
          {
            case 0x8E59u:
              return 104;
            case 0x956Eu:
              return 15;
            case 0xA4CAu:
              return 702;
          }
        }
        else
        {
          switch(a3)
          {
            case 0x8608u:
              return 600;
            case 0x8CE0u:
              return 604;
            case 0x8E57u:
              return 102;
          }
        }
        return 0;
      }
      switch(a3)
      {
        case 0xA67Au:
          int64_t result = 1154;
          break;
        case 0xA67Bu:
          int64_t result = 1155;
          break;
        case 0xA67Cu:
          int64_t result = 1156;
          break;
        case 0xA67Du:
          int64_t result = 1151;
          break;
        case 0xA67Eu:
          int64_t result = 1152;
          break;
        default:
          if (a3 == 42189)
          {
            int64_t result = 700;
          }
          else
          {
            if (a3 != 42190) {
              return 0;
            }
            int64_t result = 701;
          }
          break;
      }
    }
  }
  else
  {
    if ((int)a3 > 15767)
    {
      if ((int)a3 > 18554)
      {
        switch(a3)
        {
          case 0x487Bu:
            int64_t result = 204;
            break;
          case 0x487Cu:
            int64_t result = 202;
            break;
          case 0x487Du:
            int64_t result = 208;
            break;
          case 0x487Eu:
            int64_t result = 206;
            break;
          case 0x487Fu:
            int64_t result = 210;
            break;
          case 0x4880u:
            int64_t result = 212;
            break;
          case 0x4881u:
            int64_t result = 214;
            break;
          case 0x4882u:
            int64_t result = 216;
            break;
          case 0x4883u:
            int64_t result = 228;
            break;
          case 0x4884u:
            int64_t result = 226;
            break;
          case 0x4885u:
            int64_t result = 230;
            break;
          case 0x4886u:
            int64_t result = 232;
            break;
          default:
            switch(a3)
            {
              case 0x4CDFu:
                int64_t result = 50;
                break;
              case 0x4CE0u:
                int64_t result = 51;
                break;
              case 0x4CE1u:
                int64_t result = 52;
                break;
              case 0x4CE2u:
                int64_t result = 53;
                break;
              case 0x4CE3u:
                int64_t result = 54;
                break;
              case 0x4CEDu:
                int64_t result = 64;
                break;
              default:
                return 0;
            }
            break;
        }
        return result;
      }
      if ((a3 - 15770) < 4) {
        return 552;
      }
      if ((a3 - 15768) < 2) {
        return 551;
      }
      if (a3 == 16254) {
        return 8;
      }
      return 0;
    }
    if ((int)a3 > 7824)
    {
      if ((int)a3 <= 12999)
      {
        if ((int)a3 <= 8198)
        {
          if (a3 == 7825) {
            return 801;
          }
          if (a3 == 7830) {
            return 804;
          }
        }
        else
        {
          switch(a3)
          {
            case 0x2007u:
              return 602;
            case 0x2EEDu:
              return 300;
            case 0x32C7u:
              return 850;
          }
        }
      }
      else if ((int)a3 > 14708)
      {
        switch(a3)
        {
          case 0x3975u:
            return 14;
          case 0x39E3u:
            return 6;
          case 0x3CD7u:
            return 16;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x32C8u:
            return 851;
          case 0x363Fu:
            return 3;
          case 0x36CEu:
            return 603;
        }
      }
      return 0;
    }
    if ((int)a3 <= 7699)
    {
      switch(a3)
      {
        case 0x323u:
          return 7;
        case 0xE24u:
          return 601;
        case 0x15DEu:
          return 11;
      }
      return 0;
    }
    switch(a3)
    {
      case 0x1E14u:
        int64_t result = 158;
        break;
      case 0x1E15u:
        int64_t result = 150;
        break;
      case 0x1E16u:
        int64_t result = 157;
        break;
      case 0x1E18u:
        int64_t result = 152;
        break;
      case 0x1E19u:
        int64_t result = 155;
        break;
      case 0x1E1Au:
        int64_t result = 153;
        break;
      case 0x1E1Cu:
        int64_t result = 154;
        break;
      case 0x1E1Du:
        int64_t result = 156;
        break;
      case 0x1E1Eu:
        int64_t result = 151;
        break;
      case 0x1E2Au:
        int64_t result = 13;
        break;
      default:
        return 0;
    }
  }
  return result;
}

+ (unsigned)cascadeItemTypeFromItemType:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned __int16 result = 19668;
  switch(a3)
  {
    case 0:
    case 1:
    case 6:
    case 7:
    case 10:
    case 11:
    case 13:
    case 14:
      goto LABEL_2;
    case 2:
      return result;
    case 3:
      unsigned __int16 result = -29102;
      break;
    case 4:
      unsigned __int16 result = 7690;
      break;
    case 5:
      unsigned __int16 result = 18540;
      break;
    case 8:
      unsigned __int16 result = 12010;
      break;
    case 9:
      unsigned __int16 result = -16470;
      break;
    case 12:
      unsigned __int16 result = 15757;
      break;
    case 15:
      unsigned __int16 result = -11151;
      break;
    case 16:
      unsigned __int16 result = -23352;
      break;
    case 17:
      unsigned __int16 result = -11922;
      break;
    case 18:
      unsigned __int16 result = 7822;
      break;
    case 19:
      unsigned __int16 result = 12996;
      break;
    case 20:
      unsigned __int16 result = -4027;
      break;
    case 21:
      unsigned __int16 result = 27122;
      break;
    case 22:
      unsigned __int16 result = -11935;
      break;
    case 23:
      unsigned __int16 result = -3378;
      break;
    case 24:
      unsigned __int16 result = -18195;
      break;
    case 25:
      unsigned __int16 result = -22925;
      break;
    case 26:
      unsigned __int16 result = 17034;
      break;
    default:
      id v5 = (void *)qword_1EB5EE458;
      if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = v5;
        uint64_t v12 = KVItemTypeDescription(a3, v7, v8, v9, v10, v11);
        int v13 = 136315394;
        uint64_t v14 = "+[KVItemConverter cascadeItemTypeFromItemType:]";
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        _os_log_error_impl(&dword_1BC3B6000, v6, OS_LOG_TYPE_ERROR, "%s KVItemType: %@ has no valid Cascade item type mapping.", (uint8_t *)&v13, 0x16u);
      }
LABEL_2:
      unsigned __int16 result = *MEMORY[0x1E4F57F78];
      break;
  }
  return result;
}

+ (int64_t)itemTypeFromCascadeItemType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t result = 1;
  if ((int)a3 <= 26511)
  {
    if ((int)a3 > 14024)
    {
      if ((int)a3 > 16250)
      {
        if ((int)a3 <= 18539)
        {
          if (a3 == 16251) {
            return result;
          }
          if (a3 == 17034) {
            return 26;
          }
          goto LABEL_83;
        }
        if (a3 == 18540) {
          return 5;
        }
        if (a3 == 19668) {
          return 2;
        }
        int v5 = 25883;
        goto LABEL_54;
      }
      if ((int)a3 > 14815)
      {
        if (a3 == 14816 || a3 == 15572) {
          return result;
        }
        if (a3 == 15757) {
          return 12;
        }
        goto LABEL_83;
      }
      if (a3 != 14025)
      {
        int v5 = 14706;
        goto LABEL_54;
      }
      return 14;
    }
    if ((int)a3 <= 7821)
    {
      if ((int)a3 > 5594)
      {
        if (a3 == 5595) {
          return result;
        }
        if (a3 == 7690) {
          return 4;
        }
        int v5 = 7719;
LABEL_54:
        if (a3 == v5) {
          return result;
        }
        goto LABEL_83;
      }
      if (a3 == 800) {
        return result;
      }
      if (a3 != 3615)
      {
LABEL_83:
        uint64_t v7 = (void *)qword_1EB5EE458;
        if (os_log_type_enabled((os_log_t)qword_1EB5EE458, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = (void *)MEMORY[0x1E4F70B80];
          uint64_t v9 = v7;
          uint64_t v14 = objc_msgSend_descriptionForTypeIdentifier_(v8, v10, v3, v11, v12, v13);
          int v15 = 136315394;
          uint64_t v16 = "+[KVItemConverter itemTypeFromCascadeItemType:]";
          __int16 v17 = 2112;
          uint64_t v18 = v14;
          _os_log_error_impl(&dword_1BC3B6000, v9, OS_LOG_TYPE_ERROR, "%s Cascade itemType: %@ has no valid KVItemType mapping.", (uint8_t *)&v15, 0x16u);
        }
        return 0;
      }
      return 14;
    }
    if ((int)a3 > 12009)
    {
      if (a3 == 12010) {
        return 8;
      }
      if (a3 == 12996) {
        return 19;
      }
      int v5 = 13884;
      goto LABEL_54;
    }
    if (a3 == 7822) {
      return 18;
    }
    int v6 = 8194;
LABEL_61:
    if (a3 != v6) {
      goto LABEL_83;
    }
    return 14;
  }
  if ((int)a3 <= 44934)
  {
    if ((int)a3 > 36058)
    {
      if ((int)a3 > 38250)
      {
        switch(a3)
        {
          case 0x956Bu:
            return result;
          case 0xA4C8u:
            return 16;
          case 0xA673u:
            return 25;
        }
        goto LABEL_83;
      }
      if (a3 != 36059)
      {
        if (a3 == 36434) {
          return 3;
        }
        goto LABEL_83;
      }
      return 14;
    }
    if ((int)a3 <= 30597)
    {
      if (a3 == 26512) {
        return result;
      }
      if (a3 == 27122) {
        return 21;
      }
      goto LABEL_83;
    }
    if (a3 == 30598 || a3 == 32965) {
      return result;
    }
    int v6 = 34307;
    goto LABEL_61;
  }
  if ((int)a3 > 53613)
  {
    if ((int)a3 > 61508)
    {
      if (a3 == 61509) {
        return 20;
      }
      if (a3 == 62158) {
        return 23;
      }
      int v5 = 63369;
    }
    else
    {
      if (a3 == 53614) {
        return 17;
      }
      if (a3 == 54385) {
        return 15;
      }
      int v5 = 61352;
    }
    goto LABEL_54;
  }
  if ((int)a3 <= 49065)
  {
    if (a3 == 44935) {
      return result;
    }
    if (a3 == 47341) {
      return 24;
    }
    goto LABEL_83;
  }
  if (a3 == 49066) {
    return 9;
  }
  if (a3 != 53482)
  {
    if (a3 == 53601) {
      return 22;
    }
    goto LABEL_83;
  }
  return result;
}

@end