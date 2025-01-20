@interface BLLibraryUtility
+ (BOOL)_isMultiUser;
+ (BOOL)writeBinaryPropertyList:(id)a3 toPath:(id)a4 error:(id *)a5;
+ (id)_dcIdentifierFromOpfPath:(id)a3 isEPUB:(BOOL)a4;
+ (id)_iTunesMetadataPathForEpubPath:(id)a3;
+ (id)_storeIdFromiTunesMetadataPath:(id)a3 error:(id *)a4;
+ (id)dcIdentifierFromBookPath:(id)a3;
+ (id)generateFileUniqueIdFromPath:(id)a3;
+ (id)identifierFromBookContainer:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6;
+ (id)identifierFromBookPath:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6;
+ (id)identifierFromBookPath:(id)a3 error:(id *)a4;
+ (id)identifierFromBookZipArchive:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6;
+ (id)md5FromPath:(id)a3;
+ (id)opfPathFromEpubPath:(id)a3;
+ (id)opfPathFromFullOpfContainerPath:(id)a3;
+ (id)p_opfPathFromContainerXmlDoc:(_xmlDoc *)a3 epubPath:(id)a4;
+ (id)p_opfPathFromContainerXmlPath:(id)a3 epubPath:(id)a4;
+ (id)uniqueIdFromEpubPath:(id)a3;
+ (id)uniqueIdFromPdfPath:(id)a3;
@end

@implementation BLLibraryUtility

+ (id)p_opfPathFromContainerXmlPath:(id)a3 epubPath:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263EFF8F8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v12 = objc_msgSend_initWithContentsOfFile_(v9, v10, (uint64_t)v8, v11);

  id v13 = v12;
  v17 = (const char *)objc_msgSend_bytes(v13, v14, v15, v16);
  int v21 = objc_msgSend_length(v13, v18, v19, v20);
  xmlDocPtr Memory = xmlReadMemory(v17, v21, 0, "UTF-8", 2049);

  v24 = objc_msgSend_p_opfPathFromContainerXmlDoc_epubPath_(a1, v23, (uint64_t)Memory, (uint64_t)v7);

  return v24;
}

+ (id)p_opfPathFromContainerXmlDoc:(_xmlDoc *)a3 epubPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (a3)
  {
    v6 = xmlXPathNewContext(a3);
    int v7 = xmlXPathRegisterNs(v6, (const xmlChar *)"a", (const xmlChar *)"urn:oasis:names:tc:opendocument:xmlns:container");
    if (v7)
    {
      int v8 = v7;
      id v9 = BLDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v20[0] = 67109120;
        v20[1] = v8;
        _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_ERROR, "Error xmlXPathRegisterNs: %d", (uint8_t *)v20, 8u);
      }
    }
    if (v6)
    {
      v10 = (xmlXPathObject *)MEMORY[0x223C1F0D0]("/a:container/a:rootfiles/a:rootfile[@media-type='application/oebps-package+xml']", v6);
      xmlXPathFreeContext(v6);
      if (v10)
      {
        p_nodeNr = &v10->nodesetval->nodeNr;
        if (p_nodeNr && *p_nodeNr && *((void *)p_nodeNr + 1))
        {
          if (*p_nodeNr < 1)
          {
LABEL_15:
            v6 = 0;
          }
          else
          {
            uint64_t v12 = 0;
            while (1)
            {
              Prop = xmlGetProp(*(const xmlNode **)(*((void *)p_nodeNr + 1) + 8 * v12), (const xmlChar *)"full-path");
              if (Prop) {
                break;
              }
              if (++v12 >= *p_nodeNr) {
                goto LABEL_15;
              }
            }
            uint64_t v15 = Prop;
            uint64_t v16 = objc_msgSend_stringWithCString_encoding_(NSString, v14, (uint64_t)Prop, 4);
            objc_msgSend_stringByAppendingPathComponent_(v5, v17, (uint64_t)v16, v18);
            v6 = (xmlXPathContext *)objc_claimAutoreleasedReturnValue();
            ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v15);
          }
          xmlXPathFreeObject(v10);
          v10 = 0;
        }
        else
        {
          v6 = 0;
        }
        xmlXPathFreeObject(v10);
      }
      else
      {
        v6 = 0;
      }
    }
    xmlFreeDoc(a3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)opfPathFromFullOpfContainerPath:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    id v9 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v8, @"META-INF/container.xml", (uint64_t)&stru_26CED4330);
    uint64_t v11 = objc_msgSend_p_opfPathFromContainerXmlPath_epubPath_(a1, v10, (uint64_t)v4, (uint64_t)v9);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)opfPathFromEpubPath:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    v10 = objc_msgSend_stringByAppendingPathComponent_(v4, v8, @"META-INF/container.xml", v9);
    uint64_t v12 = objc_msgSend_p_opfPathFromContainerXmlPath_epubPath_(a1, v11, (uint64_t)v10, (uint64_t)v4);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)_dcIdentifierFromOpfPath:(id)a3 isEPUB:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v9 = (const char *)objc_msgSend_UTF8String(v5, v6, v7, v8);
  v10 = xmlNewTextReaderFilename(v9);
  if (v10)
  {
    id v13 = v10;
    int v14 = xmlTextReaderDepth(v10);
    if (xmlTextReaderRead(v13) == 1)
    {
      Attribute = 0;
      uint64_t v16 = v14;
      uint64_t v17 = v14 + 1;
      while (1)
      {
        int v18 = xmlTextReaderDepth(v13);
        int v19 = xmlTextReaderNodeType(v13);
        if (v18 != v16 || v19 != 1) {
          break;
        }
        Attribute = xmlTextReaderGetAttribute(v13, (const xmlChar *)UNIQUE_IDENTIFIER_ATTR);
LABEL_9:
        if (xmlTextReaderRead(v13) != 1) {
          goto LABEL_10;
        }
      }
      if (v17 != v18 || v19 != 1) {
        goto LABEL_9;
      }
      v25 = xmlTextReaderConstLocalName(v13);
      if (xmlStrEqual((const xmlChar *)METADATA_ELEMENT, v25) && xmlTextReaderRead(v13) == 1)
      {
        uint64_t v21 = 0;
        uint64_t v20 = 0;
        uint64_t v26 = v16 + 2;
        while (1)
        {
          int v27 = xmlTextReaderDepth(v13);
          int v28 = xmlTextReaderNodeType(v13);
          if (v27 == v18 && v28 == 15) {
            goto LABEL_11;
          }
          if (v26 == v27 && v28 == 1)
          {
            v29 = xmlTextReaderConstNamespaceUri(v13);
            if (xmlStrEqual(v29, (const xmlChar *)DC_TERMS_NAMESPACE))
            {
              v30 = xmlTextReaderConstLocalName(v13);
              if (v20 || !xmlStrEqual((const xmlChar *)IDENTIFIER_ELEMENT, v30))
              {
                if (!v21)
                {
                  if (!xmlStrEqual((const xmlChar *)CONTRIBUTOR_ELEMENT, v30)
                    || (v31 = xmlTextReaderGetAttribute(v13, (const xmlChar *)ID_ATTR)) == 0)
                  {
                    uint64_t v21 = 0;
                    goto LABEL_49;
                  }
                  v32 = v31;
                  if (xmlStrEqual(v31, (const xmlChar *)BOOK_PRODUCER))
                  {
                    uint64_t v21 = sub_21E00FC8C(v13);
                  }
                  else
                  {
                    uint64_t v21 = 0;
                  }
                  ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v32);
                }
              }
              else
              {
                v33 = xmlTextReaderGetAttribute(v13, (const xmlChar *)ID_ATTR);
                if (!v33)
                {
                  uint64_t v20 = 0;
                  goto LABEL_49;
                }
                v34 = v33;
                if (Attribute && xmlStrEqual(v33, Attribute))
                {
                  uint64_t v20 = sub_21E00FC8C(v13);
                }
                else
                {
                  uint64_t v20 = 0;
                }
                ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v34);
                if (!v4) {
                  goto LABEL_11;
                }
              }
              if (v20 && v21) {
                goto LABEL_11;
              }
            }
          }
LABEL_49:
          if (xmlTextReaderRead(v13) != 1) {
            goto LABEL_11;
          }
        }
      }
LABEL_10:
      uint64_t v20 = 0;
      uint64_t v21 = 0;
LABEL_11:
      if (Attribute) {
        ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(Attribute);
      }
    }
    else
    {
      uint64_t v21 = 0;
      uint64_t v20 = 0;
    }
    xmlFreeTextReader(v13);
    if (!v4) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    if (!v4) {
      goto LABEL_18;
    }
  }
  if (!objc_msgSend_hasPrefix_(v21, v11, @"iBooks Author", v12))
  {
    id v22 = 0;
    goto LABEL_20;
  }
LABEL_18:
  id v22 = v20;
LABEL_20:
  id v23 = v22;

  return v23;
}

+ (id)dcIdentifierFromBookPath:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_pathExtension(v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_lowercaseString(v7, v8, v9, v10);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(@"epub", v12, (uint64_t)v11, v13);

  int v18 = objc_msgSend_pathExtension(v3, v15, v16, v17);
  id v22 = objc_msgSend_lowercaseString(v18, v19, v20, v21);
  int v25 = objc_msgSend_isEqualToString_(@"ibooks", v23, (uint64_t)v22, v24);

  if ((isEqualToString & 1) != 0 || v25)
  {
    v29 = objc_msgSend_opfPathFromEpubPath_(BLLibraryUtility, v26, (uint64_t)v3, v27);
    int v28 = objc_msgSend__dcIdentifierFromOpfPath_isEPUB_(BLLibraryUtility, v30, (uint64_t)v29, isEqualToString);
  }
  else
  {
    int v28 = 0;
  }

  return v28;
}

+ (id)md5FromPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    id v11 = 0;
    uint64_t v7 = IMStreamingHashStringWithFilePathSync(v3, 0, &v11);
    id v8 = v11;
    if (!v7)
    {
      uint64_t v9 = BLDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v3;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl(&dword_21DFE3000, v9, OS_LOG_TYPE_ERROR, "Error hashing file: %@ --  %@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)uniqueIdFromPdfPath:(id)a3
{
  return (id)objc_msgSend_md5FromPath_(BLLibraryUtility, a2, (uint64_t)a3, v3);
}

+ (id)uniqueIdFromEpubPath:(id)a3
{
  BOOL v4 = objc_msgSend_opfPathFromEpubPath_(BLLibraryUtility, a2, (uint64_t)a3, v3);
  uint64_t v7 = objc_msgSend_md5FromPath_(BLLibraryUtility, v5, (uint64_t)v4, v6);

  return v7;
}

+ (id)generateFileUniqueIdFromPath:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_length(v3, v4, v5, v6))
  {
    uint64_t v10 = objc_msgSend_pathExtension(v3, v7, v8, v9);
    unint64_t v14 = BLBookTypeFromPathExtension(v10, v11, v12, v13);

    if (v14 > 1) {
      objc_msgSend_uniqueIdFromPdfPath_(BLLibraryUtility, v15, (uint64_t)v3, v16);
    }
    else {
    uint64_t v17 = objc_msgSend_uniqueIdFromEpubPath_(BLLibraryUtility, v15, (uint64_t)v3, v16);
    }
    unint64_t v18 = objc_msgSend_length(v17, v19, v20, v21);
  }
  else
  {
    uint64_t v17 = 0;
    unint64_t v18 = objc_msgSend_length(0, v7, v8, v9);
  }
  if (v18 <= 1)
  {

    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)_iTunesMetadataPathForEpubPath:(id)a3
{
  return (id)objc_msgSend_stringByAppendingPathComponent_(a3, a2, @"iTunesMetadata.plist", v3);
}

+ (id)_storeIdFromiTunesMetadataPath:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x263EFF8F8];
  uint64_t v6 = objc_msgSend_fileURLWithPath_(NSURL, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v8 = objc_msgSend_dataWithContentsOfURL_options_error_(v5, v7, (uint64_t)v6, 1, a4);

  if (v8)
  {
    uint64_t v12 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v9, (uint64_t)v8, 0, 0, a4);
    id v15 = v12;
    if (v12)
    {
      uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v12, v13, STORE_ID_KEY, v14);
    }
    else
    {
      uint64_t v16 = 0;
    }

    objc_msgSend_stringValue(v16, v17, v18, v19);
  }
  else
  {
    uint64_t v16 = 0;
    objc_msgSend_stringValue(0, v9, v10, v11);
  uint64_t v20 = };

  return v20;
}

+ (id)identifierFromBookZipArchive:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  BOOL v83 = a4;
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = sub_21E010778;
  v93 = sub_21E010788;
  id v94 = 0;
  uint64_t v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  uint64_t v10 = dispatch_get_global_queue(-2, 0);
  uint64_t v11 = (void *)MEMORY[0x263F2BA68];
  uint64_t v14 = objc_msgSend_fileURLWithPath_(NSURL, v12, (uint64_t)v8, v13);
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = sub_21E010790;
  v85[3] = &unk_26448BC78;
  id v86 = v8;
  v88 = &v89;
  id v15 = v9;
  v87 = v15;
  objc_msgSend_readArchiveFromURL_options_queue_completion_(v11, v16, (uint64_t)v14, 4, v10, v85);

  dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v19 = (void *)v90[5];
  if (v19)
  {
    uint64_t v20 = objc_msgSend_entryForName_(v19, v17, @"iTunesMetadata.plist", v18);
    id v23 = v20;
    if (!v6) {
      goto LABEL_5;
    }
    if (!v20) {
      goto LABEL_5;
    }
    uint64_t v24 = objc_msgSend_plistFromArchive_(v20, v21, v90[5], v22);
    objc_opt_class();
    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v24, v25, STORE_ID_KEY, v26);
    int v28 = BUDynamicCast();

    if (!v28)
    {
LABEL_5:
      v29 = objc_msgSend_entryForName_((void *)v90[5], v21, @"META-INF/container.xml", v22);
      v32 = v29;
      if (v29)
      {
        uint64_t v33 = objc_msgSend_xmlDocumentFromArchive_(v29, v30, v90[5], v31);
        v82 = objc_msgSend_p_opfPathFromContainerXmlDoc_epubPath_(a1, v34, v33, (uint64_t)&stru_26CED4330);
        v37 = objc_msgSend_entryForName_((void *)v90[5], v35, (uint64_t)v82, v36);
        v40 = v37;
        if (v37)
        {
          v41 = objc_msgSend_extractFromArchive_(v37, v38, v90[5], v39);
          v45 = objc_msgSend_pathExtension(v8, v42, v43, v44);
          v49 = objc_msgSend_lowercaseString(v45, v46, v47, v48);
          uint64_t isEqualToString = objc_msgSend_isEqualToString_(@"epub", v50, (uint64_t)v49, v51);

          v56 = objc_msgSend_path(v41, v53, v54, v55);
          int v28 = objc_msgSend__dcIdentifierFromOpfPath_isEPUB_(BLLibraryUtility, v57, (uint64_t)v56, isEqualToString);

          if (!v28 && v83)
          {
            v61 = objc_msgSend_path(v41, v58, v59, v60);
            int v28 = objc_msgSend_md5FromPath_(BLLibraryUtility, v62, (uint64_t)v61, v63);
          }
          v64 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v58, v59, v60);
          v68 = objc_msgSend_path(v41, v65, v66, v67);
          id v84 = 0;
          char v70 = objc_msgSend_removeItemAtPath_error_(v64, v69, (uint64_t)v68, (uint64_t)&v84);
          id v71 = v84;

          if ((v70 & 1) == 0)
          {
            v72 = BLDefaultLog();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              v76 = objc_msgSend_path(v41, v73, v74, v75);
              *(_DWORD *)buf = 138412546;
              v96 = v76;
              __int16 v97 = 2112;
              id v98 = v71;
              _os_log_impl(&dword_21DFE3000, v72, OS_LOG_TYPE_ERROR, "Failed to remove {%@} file. Error:  %@", buf, 0x16u);
            }
          }
        }
        else
        {
          int v28 = 0;
        }
      }
      else
      {
        int v28 = 0;
      }

      if (!v28 && v83)
      {
        v77 = BLDefaultLog();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21DFE3000, v77, OS_LOG_TYPE_ERROR, "Warning: using a completely temporary NSUUID to add the book to the bookshelf", buf, 2u);
        }

        int v28 = objc_msgSend_bl_md5Hash(v8, v78, v79, v80);
      }
    }
  }
  else
  {
    int v28 = 0;
  }
  _Block_object_dispose(&v89, 8);

  return v28;
}

+ (id)identifierFromBookContainer:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v11 = a3;
  if (v7)
  {
    uint64_t v12 = objc_msgSend__iTunesMetadataPathForEpubPath_(BLLibraryUtility, v9, (uint64_t)v11, v10);
    id v42 = 0;
    uint64_t v14 = objc_msgSend__storeIdFromiTunesMetadataPath_error_(BLLibraryUtility, v13, (uint64_t)v12, (uint64_t)&v42);
    id v15 = v42;

    if (v14) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v15 == 0;
    }
    if (v17)
    {
      if (v14) {
        goto LABEL_24;
      }
      goto LABEL_19;
    }
    uint64_t v18 = objc_msgSend_userInfo(v15, v9, v16, v10);
    uint64_t v21 = objc_msgSend_objectForKey_(v18, v19, *MEMORY[0x263F08608], v20);

    int v25 = objc_msgSend_domain(v21, v22, v23, v24);
    if (objc_msgSend_isEqualToString_(v25, v26, *MEMORY[0x263F08438], v27))
    {
      uint64_t v32 = objc_msgSend_code(v21, v29, v30, v31);

      if (v32 == 2)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    uint64_t v33 = BLDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v15;
      _os_log_impl(&dword_21DFE3000, v33, OS_LOG_TYPE_ERROR, "Error attempting to read store id. Error:  %@", buf, 0xCu);
    }

    if (a6) {
      *a6 = v15;
    }
    goto LABEL_18;
  }
  id v15 = 0;
LABEL_19:
  uint64_t v34 = objc_msgSend_dcIdentifierFromBookPath_(BLLibraryUtility, v9, (uint64_t)v11, v10);
  uint64_t v14 = (void *)v34;
  if (v8 && !v34)
  {
    uint64_t v37 = objc_msgSend_uniqueIdFromEpubPath_(BLLibraryUtility, v35, (uint64_t)v11, v36);
    if (!v37)
    {
      uint64_t v37 = objc_msgSend_bl_md5Hash(v11, v38, v39, v40);
    }
    uint64_t v14 = (void *)v37;
  }
LABEL_24:

  return v14;
}

+ (id)identifierFromBookPath:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel_identifierFromBookPath_allowHash_allowStoreID_error_, a3, 1);
}

+ (id)identifierFromBookPath:(id)a3 allowHash:(BOOL)a4 allowStoreID:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v14 = objc_msgSend_pathExtension(v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_lowercaseString(v14, v15, v16, v17);
  int isEqualToString = objc_msgSend_isEqualToString_(@"pdf", v19, (uint64_t)v18, v20);

  int v25 = objc_msgSend_pathExtension(v10, v22, v23, v24);
  v29 = objc_msgSend_lowercaseString(v25, v26, v27, v28);
  int v32 = objc_msgSend_isEqualToString_(@"epub", v30, (uint64_t)v29, v31);

  uint64_t v36 = objc_msgSend_pathExtension(v10, v33, v34, v35);
  uint64_t v40 = objc_msgSend_lowercaseString(v36, v37, v38, v39);
  int v43 = objc_msgSend_isEqualToString_(@"ibooks", v41, (uint64_t)v40, v42);

  if (isEqualToString)
  {
    uint64_t v47 = objc_msgSend_uniqueIdFromPdfPath_(BLLibraryUtility, v44, (uint64_t)v10, v46);
LABEL_3:
    uint64_t v48 = (void *)v47;
    goto LABEL_15;
  }
  if ((v32 | v43) != 1)
  {
    v53 = BLDefaultLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      int v55 = 138412290;
      id v56 = v10;
      _os_log_impl(&dword_21DFE3000, v53, OS_LOG_TYPE_INFO, "Unsupported file type '%@'.", (uint8_t *)&v55, 0xCu);
    }

LABEL_12:
    uint64_t v48 = 0;
    goto LABEL_15;
  }
  LOBYTE(v55) = 0;
  v49 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v44, v45, v46);
  int isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v49, v50, (uint64_t)v10, (uint64_t)&v55);

  if (isDirectory)
  {
    if ((_BYTE)v55) {
      objc_msgSend_identifierFromBookContainer_allowHash_allowStoreID_error_(a1, v52, (uint64_t)v10, v8, v7, a6);
    }
    else {
    uint64_t v47 = objc_msgSend_identifierFromBookZipArchive_allowHash_allowStoreID_error_(a1, v52, (uint64_t)v10, v8, v7, a6);
    }
    goto LABEL_3;
  }
  if (!a6) {
    goto LABEL_12;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v52, *MEMORY[0x263F07F70], 4, 0);
  uint64_t v48 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v48;
}

+ (BOOL)writeBinaryPropertyList:(id)a3 toPath:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v20 = 0;
  uint64_t v9 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v8, (uint64_t)a3, 200, 0, &v20);
  id v10 = v20;
  uint64_t v12 = v10;
  if (!v9)
  {
    uint64_t v16 = BLDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v12;
      _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_ERROR, "DownloadInstaller: Could not serialize plist:  %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  id v19 = v10;
  int v13 = objc_msgSend_writeToFile_options_error_(v9, v11, (uint64_t)v7, 1, &v19);
  id v14 = v19;

  id v15 = BLDefaultLog();
  uint64_t v16 = v15;
  if (!v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v14;
      _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_ERROR, "DownloadInstaller: Could not write plist:  %@", buf, 0xCu);
    }
    uint64_t v12 = v14;
LABEL_11:

    if (a5)
    {
      id v14 = v12;
      BOOL v17 = 0;
      *a5 = v14;
    }
    else
    {
      BOOL v17 = 0;
      id v14 = v12;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v7;
    _os_log_impl(&dword_21DFE3000, v16, OS_LOG_TYPE_DEFAULT, "DownloadInstaller: Wrote plist to: %@", buf, 0xCu);
  }

  BOOL v17 = 1;
LABEL_14:

  return v17;
}

+ (BOOL)_isMultiUser
{
  if (qword_26AB40098 != -1) {
    dispatch_once(&qword_26AB40098, &unk_26CED3E10);
  }
  int v2 = byte_26AB3FEF0;
  if ((BUIsRunningTests() & 1) == 0) {
    return v2 != 0;
  }
  BOOL v6 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v3, v4, v5);
  uint64_t v9 = objc_msgSend_valueForKey_(v6, v7, @"BLLibrarySimulateMultiUser", v8);

  BOOL result = v2 != 0;
  if (v9)
  {
    id v14 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v10, v11, v12);
    char v17 = objc_msgSend_BOOLForKey_(v14, v15, @"BLLibrarySimulateMultiUser", v16);

    return v17;
  }
  return result;
}

@end