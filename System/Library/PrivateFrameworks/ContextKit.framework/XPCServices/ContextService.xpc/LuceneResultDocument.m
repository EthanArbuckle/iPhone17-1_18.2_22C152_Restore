@interface LuceneResultDocument
- (BOOL)titleHasControlCharacter;
- (LuceneContextRequest)request;
- (LuceneResultDocument)initWithDocId:(int)a3 withLuceneContextRequest:(id)a4;
- (id)bestTitleWithSeeOtherDocIdRelative:(int *)a3;
- (id)getDocument;
- (id)titleField;
- (int)seeOtherDocIdRelative;
- (unint64_t)minPrimaryTermsRequired;
- (unint64_t)titleMinTermsRequired;
- (void)setMinPrimaryTermsRequired:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setSeeOtherDocIdRelative:(int)a3;
- (void)setTitleHasControlCharacter:(BOOL)a3;
- (void)setTitleMinTermsRequired:(unint64_t)a3;
@end

@implementation LuceneResultDocument

- (LuceneResultDocument)initWithDocId:(int)a3 withLuceneContextRequest:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)LuceneResultDocument;
  v7 = [(LuceneResultDocument *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_docId = a3;
    objc_storeWeak((id *)&v7->_request, v6);
  }

  return v8;
}

- (id)getDocument
{
  p_doc = &self->_doc;
  doc = self->_doc;
  if (doc)
  {
    v4 = doc;
  }
  else
  {
    p_request = &self->_request;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
    v8 = [WeakRetained docVisitor];

    v4 = [v8 getDocument];
    [(OrgApacheLuceneDocumentDocument *)v4 removeAllFields];
    id v9 = objc_loadWeakRetained((id *)p_request);
    objc_super v10 = [v9 engine];
    v11 = [v10 reader];
    [v11 documentWithInt:self->_docId withOrgApacheLuceneIndexStoredFieldVisitor:v8];

    objc_storeStrong((id *)p_doc, v4);
  }
  return v4;
}

- (id)titleField
{
  p_title = &self->_title;
  title = self->_title;
  if (title)
  {
    p_isa = title;
    goto LABEL_18;
  }
  id v6 = [(LuceneResultDocument *)self getDocument];
  p_isa = [v6 getWithNSString:@"title"];

  if (![(NSString *)p_isa length]) {
    goto LABEL_15;
  }
  if ([(NSString *)p_isa characterAtIndex:0] == 7)
  {
    unsigned int v7 = [(NSString *)p_isa indexOf:10];
    if ((v7 & 0x80000000) == 0)
    {
      unsigned int v8 = v7;
      self->_titleHasControlCharacter = 1;
      id v9 = -[NSString substringWithRange:](p_isa, "substringWithRange:", 1, v7);
      CFStringRef v10 = [(NSString *)p_isa substringFromIndex:v8 + 1];

      if ([v9 length])
      {
        unint64_t v11 = [v9 characterAtIndex:0] - 48;
        if (v11 <= 9) {
          self->_titleMinTermsRequired = v11;
        }
      }
      if ((unint64_t)[v9 length] >= 2)
      {
        unint64_t v12 = [v9 characterAtIndex:1] - 48;
        if (v12 <= 9) {
          self->_minPrimaryTermsRequired = v12;
        }
      }
      p_isa = (NSString *)v9;
      goto LABEL_16;
    }
    if ((id)[(NSString *)p_isa length] == (id)1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
      [WeakRetained setForceNoResults:1];
    }
LABEL_15:
    CFStringRef v10 = &stru_10048C1F8;
LABEL_16:

    p_isa = &v10->isa;
  }
  objc_storeStrong((id *)p_title, p_isa);
LABEL_18:
  return p_isa;
}

- (id)bestTitleWithSeeOtherDocIdRelative:(int *)a3
{
  v40 = [(LuceneResultDocument *)self titleField];
  v5 = v40;
  if (([v40 indexOf:10] & 0x80000000) == 0)
  {
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x3032000000;
    v91 = sub_1002B7AA0;
    v92 = sub_1002B7AB0;
    id v93 = (id)objc_opt_new();
    v87[0] = 0;
    v87[1] = v87;
    v87[2] = 0x2020000000;
    v87[3] = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x3032000000;
    v85[3] = sub_1002B7AA0;
    v85[4] = sub_1002B7AB0;
    id v86 = 0;
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x3032000000;
    v83[3] = sub_1002B7AA0;
    v83[4] = sub_1002B7AB0;
    id v84 = 0;
    p_request = &self->_request;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
    unsigned int v8 = [WeakRetained simplifiedDesiredLanguageTags];

    if ([v8 count])
    {
      id v9 = [v8 firstObject];
    }
    else
    {
      id v9 = @"en";
    }
    BOOL v12 = (unint64_t)[v8 count] > 1;
    id v13 = objc_loadWeakRetained((id *)&self->_request);
    v14 = [v13 response];
    v39 = [v14 languageTag];

    v15 = +[LanguageUtilities simplifyLanguageTag:v39];
    uint64_t v79 = 0;
    v80 = &v79;
    uint64_t v81 = 0x2020000000;
    int v82 = 0;
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x2020000000;
    char v78 = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x3032000000;
    v72 = sub_1002B7AA0;
    v73 = sub_1002B7AB0;
    id v74 = 0;
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2020000000;
    char v68 = 0;
    v16 = [(LuceneResultDocument *)self request];
    id v17 = [v16 charBuffer];

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1002B7AB8;
    v49[3] = &unk_10048BD80;
    v54 = v83;
    v55 = &v75;
    v56 = &v65;
    id v62 = v17;
    v37 = v9;
    v50 = v37;
    id v38 = v15;
    id v51 = v38;
    BOOL v64 = v12;
    v57 = &v69;
    v58 = &v79;
    id v36 = v8;
    id v52 = v36;
    v53 = self;
    v59 = v85;
    v60 = v87;
    v63 = a3;
    v61 = &v88;
    [v40 enumerateLinesUsingBlock:v49];
    if (a3) {
      *a3 = *((_DWORD *)v80 + 6);
    }
    if (*((unsigned char *)v66 + 24) && !*((unsigned char *)v76 + 24))
    {
      CFStringRef v10 = 0;
      goto LABEL_35;
    }
    if ([(id)v70[5] length])
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v18 = (id)v89[5];
      id v19 = [v18 countByEnumeratingWithState:&v45 objects:v99 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v46;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v46 != v20) {
              objc_enumerationMutation(v18);
            }
            v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            v23 = [v22 title];
            v24 = +[LanguageUtilities transliterateTextToLanguageScript:v23 withSimplifiedLanguage:v70[5]];
            [v22 setTitle:v24];
          }
          id v19 = [v18 countByEnumeratingWithState:&v45 objects:v99 count:16];
        }
        while (v19);
      }
    }
    [(id)v89[5] sortUsingComparator:&stru_10048BDC0];
    id v25 = objc_loadWeakRetained((id *)p_request);
    if ([v25 debug])
    {
      id v26 = objc_loadWeakRetained((id *)p_request);
      unsigned int v27 = [v26 debugLogEnabled];

      if (!v27)
      {
LABEL_33:
        CFStringRef v10 = [(id)v89[5] firstObject];
LABEL_35:

        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(&v69, 8);

        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(&v79, 8);

        _Block_object_dispose(v83, 8);
        _Block_object_dispose(v85, 8);

        _Block_object_dispose(v87, 8);
        _Block_object_dispose(&v88, 8);

LABEL_36:
        v5 = v40;
        goto LABEL_37;
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v25 = (id)v89[5];
      id v28 = [v25 countByEnumeratingWithState:&v41 objects:v98 count:16];
      if (v28)
      {
        int v29 = 0;
        uint64_t v30 = *(void *)v42;
        do
        {
          for (j = 0; j != v28; j = (char *)j + 1)
          {
            if (*(void *)v42 != v30) {
              objc_enumerationMutation(v25);
            }
            v32 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
            id v33 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            {
              v34 = [v32 debugDescription];
              ++v29;
              *(_DWORD *)buf = 67109378;
              int v95 = v29;
              __int16 v96 = 2112;
              v97 = v34;
              _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Ranked title candidate #%i: %@", buf, 0x12u);
            }
          }
          id v28 = [v25 countByEnumeratingWithState:&v41 objects:v98 count:16];
        }
        while (v28);
      }
    }

    goto LABEL_33;
  }
  if ([v40 length])
  {
    CFStringRef v10 = 0;
    if ([v40 characterAtIndex:0] == 92) {
      goto LABEL_37;
    }
    id v11 = objc_loadWeakRetained((id *)&self->_request);
    CFStringRef v10 = [v11 inspectTitle:v40 titleForTokenization:0 conditionals:0];

    goto LABEL_36;
  }
  CFStringRef v10 = 0;
LABEL_37:

  return v10;
}

- (LuceneContextRequest)request
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_request);
  return (LuceneContextRequest *)WeakRetained;
}

- (void)setRequest:(id)a3
{
}

- (BOOL)titleHasControlCharacter
{
  return self->_titleHasControlCharacter;
}

- (void)setTitleHasControlCharacter:(BOOL)a3
{
  self->_titleHasControlCharacter = a3;
}

- (unint64_t)titleMinTermsRequired
{
  return self->_titleMinTermsRequired;
}

- (void)setTitleMinTermsRequired:(unint64_t)a3
{
  self->_titleMinTermsRequired = a3;
}

- (unint64_t)minPrimaryTermsRequired
{
  return self->_minPrimaryTermsRequired;
}

- (void)setMinPrimaryTermsRequired:(unint64_t)a3
{
  self->_minPrimaryTermsRequired = a3;
}

- (int)seeOtherDocIdRelative
{
  return self->_seeOtherDocIdRelative;
}

- (void)setSeeOtherDocIdRelative:(int)a3
{
  self->_seeOtherDocIdRelative = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_request);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_doc, 0);
}

@end