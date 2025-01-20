@interface ImportExtension
- (BOOL)updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5;
@end

@implementation ImportExtension

- (BOOL)updateAttributes:(id)a3 forFileAtURL:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "~~~ AEC In updateAttributes, contentURL: %@", buf, 0xCu);
  }

  v9 = [v7 pathExtension];
  if (![v9 isEqual:@"plist"])
  {
    if ([v9 isEqual:@"plist"])
    {
      id v91 = 0;
      v16 = +[NSString stringWithContentsOfURL:v7 encoding:4 error:&v91];
      id v11 = v91;
      if (!v16)
      {
        id v90 = v11;
        v16 = +[NSString stringWithContentsOfURL:v7 encoding:10 error:&v90];
        id v17 = v90;

        if (v16)
        {
          id v11 = v17;
        }
        else
        {
          id v89 = v17;
          v16 = +[NSString stringWithContentsOfURL:v7 encoding:30 error:&v89];
          id v38 = v89;

          if (v16)
          {
            id v11 = v38;
          }
          else
          {
            id v88 = v38;
            v16 = +[NSString stringWithContentsOfURL:v7 encoding:1 error:&v88];
            id v11 = v88;

            if (!v16)
            {
              [v6 setTextContent:@"Importing failed. Force snazzyweaselgoo"];
              goto LABEL_40;
            }
          }
        }
      }
      [v6 setTextContent:v16];

LABEL_40:
      id v10 = [v7 lastPathComponent];
      v44 = [v10 stringByDeletingPathExtension];
      [v6 setDisplayName:v44];

      goto LABEL_98;
    }
    id v10 = v7;
    v81 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", MDItemTitle, MDItemSubject, MDItemComment, MDItemAuthors, MDItemEditors, MDItemOrganizations, MDItemCopyright, MDItemContentCreationDate, MDItemContentModificationDate, MDItemKeywords, MDItemCreator, 0);
    NSAttributedStringDocumentAttributeKey v75 = NSCompanyDocumentAttribute;
    NSAttributedStringDocumentAttributeKey v70 = NSEditorDocumentAttribute;
    NSAttributedStringDocumentAttributeKey v73 = NSAuthorDocumentAttribute;
    v82 = +[NSArray arrayWithObjects:NSTitleDocumentAttribute, NSSubjectDocumentAttribute, NSCommentDocumentAttribute, NSAuthorDocumentAttribute, NSEditorDocumentAttribute, NSCompanyDocumentAttribute, NSCopyrightDocumentAttribute, NSCreationTimeDocumentAttribute, NSModificationTimeDocumentAttribute, NSKeywordsDocumentAttribute, @"NSGeneratorDocumentAttribute", 0];
    v78 = (char *)[v82 count];
    if ([v9 isEqual:@"xml"])
    {
      id v18 = objc_alloc_init((Class)NSMutableDictionary);
      v76 = 0;
      v19 = 0;
      id v79 = 0;
      id v20 = 0;
      v21 = 0;
      v22 = 0;
LABEL_97:
      v68 = v19;
      [v19 closeFile];
      [v6 addAttributesFromDictionary:v18];

      id v11 = 0;
      goto LABEL_98;
    }
    id v87 = 0;
    unsigned int v23 = [v10 getResourceValue:&v87 forKey:NSURLIsDirectoryKey error:0];
    id v71 = v87;
    if (v71) {
      unsigned int v24 = v23;
    }
    else {
      unsigned int v24 = 0;
    }
    if (v24 == 1 && ([v71 BOOLValue] & 1) != 0)
    {
      id v25 = objc_alloc((Class)NSAttributedString);
      v26 = +[NSNumber numberWithInt:51200];
      v27 = +[NSDictionary dictionary];
      v28 = +[NSDictionary dictionaryWithObjectsAndKeys:v26, @"NSIndexing", v27, NSDefaultAttributesDocumentOption, 0];
      id v85 = 0;
      id v79 = [v25 initWithURL:v10 options:v28 documentAttributes:&v85 error:0];
      id v20 = v85;

      v29 = 0;
      id v74 = 0;
      v30 = 0;
LABEL_46:

      v76 = v30;
LABEL_47:

      id v18 = objc_alloc_init((Class)NSMutableDictionary);
      if (!v79)
      {
        id v79 = 0;
        v21 = 0;
        v22 = 0;
LABEL_96:
        v19 = v74;
        goto LABEL_97;
      }
      id v45 = [v79 string];
      memset(v97, 0, sizeof(v97));
      long long v95 = 0u;
      long long v96 = 0u;
      *(_OWORD *)buf = 0u;
      long long v94 = 0u;
      id v72 = v45;
      uint64_t v46 = (uint64_t)[v45 length];
      uint64_t v47 = v46;
      if (v46 >= 32) {
        uint64_t v48 = 32;
      }
      else {
        uint64_t v48 = v46;
      }
      objc_msgSend(v72, "getCharacters:range:", buf, 0, v48);
      if (v47 < 1) {
        goto LABEL_70;
      }
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v51 = v48 <= 1 ? 1 : v48;
      uint64_t v52 = 2 * v51;
      do
      {
        if (*(unsigned __int16 *)&buf[v49] < 8u) {
          ++v50;
        }
        v49 += 2;
      }
      while (v52 != v49);
      if (v50)
      {
        if (v47 >= 256) {
          uint64_t v53 = 256;
        }
        else {
          uint64_t v53 = v47;
        }
        if (v53 >= 33)
        {
          v54 = (unsigned __int16 *)v97;
          uint64_t v55 = v53 - 32;
          objc_msgSend(v72, "getCharacters:range:", v97, 32, v53 - 32);
          do
          {
            unsigned int v56 = *v54++;
            if (v56 < 8) {
              ++v50;
            }
            --v55;
          }
          while (v55);
        }

        if (v50 > (v53 + 3) >> 2) {
          goto LABEL_72;
        }
      }
      else
      {
LABEL_70:
      }
      v57 = [v20 objectForKey:@"NSNoIndexDocumentAttribute"];
      BOOL v58 = (uint64_t)[v57 integerValue] > 0;

      if (!v58)
      {
        v21 = 0;
        if (v20 && v78)
        {
          v60 = 0;
          v61 = 0;
          v21 = 0;
          do
          {
            uint64_t v62 = [v82 objectAtIndex:v60];

            v21 = (void *)v62;
            v63 = [v20 objectForKey:v62];

            if (v63)
            {
              if (([v21 isEqualToString:v75] & 1) != 0
                || ([v21 isEqualToString:v73] & 1) != 0
                || [v21 isEqualToString:v70])
              {
                v61 = +[NSArray arrayWithObject:v63];
              }
              else
              {
                v61 = v63;
              }
              v64 = [v81 objectAtIndex:v60];
              [v18 setObject:v61 forKey:v64];
            }
            else
            {
              v61 = 0;
            }
            ++v60;
          }
          while (v78 != v60);
        }
        v22 = [v20 objectForKey:@"NSDisplayNameDocumentAttribute"];
        if (v22) {
          [v18 setObject:v22 forKey:MDItemDisplayName];
        }
        if ((unint64_t)[v72 length] < 0xC865)
        {
          id v66 = v72;
        }
        else
        {
          uint64_t v65 = objc_msgSend(v72, "substringWithRange:", 0, 51200);

          id v66 = (id)v65;
        }
        if (v66)
        {
          v67 = v66;
          [v18 setObject:v66 forKey:MDItemTextContent];
          v59 = v67;
        }
        else
        {
          v59 = 0;
        }
        goto LABEL_95;
      }
LABEL_72:
      v21 = 0;
      v22 = 0;
      v59 = v72;
LABEL_95:

      goto LABEL_96;
    }
    v31 = +[NSFileHandle fileHandleForReadingFromURL:v10 error:0];
    id v20 = v31;
    if (!v31)
    {
      v76 = 0;
      id v74 = 0;
      id v79 = 0;
      goto LABEL_47;
    }
    fcntl((int)[v31 fileDescriptor], 48, 1);
    v30 = [v20 readDataOfLength:512];
    id v80 = [v30 length];
    id v74 = v20;
    id v20 = 0;
    if (!v30 || !v80)
    {
      v76 = v30;
      id v79 = 0;
      goto LABEL_47;
    }
    v77 = (void *)_CFBundleCopyFileTypeForFileData();
    if (v77 && [v77 length])
    {
      +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"txt", @"xml", @"html", @"webarchive", @"plist", @"abw", @"svg", @"rdf", @"rtf", @"rtfd", @"sh", @"pl", @"py", @"rb", @"doc", @"docx", @"odt",
        @"sxw",
        @"zip",
      v32 = 0);
      unsigned int v33 = [v32 containsObject:v77];

      unsigned int v34 = [@"html" isEqualToString:v77];
      if (!v33)
      {
        id v20 = 0;
        id v79 = 0;
        goto LABEL_45;
      }
      if (v34)
      {
        v35 = +[NSData dataWithContentsOfURL:v10];
        v36 = v35;
        if (v35)
        {
          [v35 length];
          v37 = _MDPlainTextFromHTMLData();
          id v79 = [objc_alloc((Class)NSAttributedString) initWithString:v37];
        }
        else
        {
          id v79 = 0;
        }

        id v20 = 0;
        goto LABEL_45;
      }
    }
    id v39 = objc_alloc((Class)NSAttributedString);
    v40 = +[NSNumber numberWithInt:51200];
    v41 = +[NSDictionary dictionary];
    v42 = +[NSNumber numberWithBool:(unint64_t)v80 < 0x200];
    v43 = +[NSDictionary dictionaryWithObjectsAndKeys:v40, @"NSIndexing", v41, NSDefaultAttributesDocumentOption, v74, @"NSFileHandle", v30, @"NSFileHeaderData", v42, @"NSNoReadNecessary", 0];
    id v86 = 0;
    id v79 = [v39 initWithURL:v10 options:v43 documentAttributes:&v86 error:0];
    id v20 = v86;

LABEL_45:
    v29 = v77;
    goto LABEL_46;
  }
  id v92 = 0;
  id v10 = +[NSDictionary dictionaryWithContentsOfURL:v7 error:&v92];
  id v11 = v92;
  if (v10)
  {
    uint64_t v12 = [v10 objectForKeyedSubscript:@"kMDItemDisplayName"];
    v13 = (void *)v12;
    if (v12) {
      CFStringRef v14 = (const __CFString *)v12;
    }
    else {
      CFStringRef v14 = @"No Name";
    }
    [v6 setDisplayName:v14];

    v15 = [v10 objectForKeyedSubscript:@"kMDItemTextContent"];
    [v6 setTextContent:v15];
  }
  else
  {
    v15 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "~~~ AEC did NOT read dictionary %@", buf, 0xCu);
    }
  }

  [v6 setTitle:@"Test Import Happened"];
  [v6 setContentDescription:@"This is a Description"];
LABEL_98:

  if (a5) {
    *a5 = v11;
  }

  return 1;
}

@end