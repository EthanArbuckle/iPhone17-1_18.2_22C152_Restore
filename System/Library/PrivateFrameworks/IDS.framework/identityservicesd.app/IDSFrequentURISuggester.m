@interface IDSFrequentURISuggester
- (BOOL)checkContactsForDestination:(id)a3;
- (IDSFrequentURISuggester)init;
- (id)matchingContactsForURI:(id)a3;
- (id)predicateForURI:(id)a3;
@end

@implementation IDSFrequentURISuggester

- (IDSFrequentURISuggester)init
{
  v3.receiver = self;
  v3.super_class = (Class)IDSFrequentURISuggester;
  return [(IDSFrequentURISuggester *)&v3 init];
}

- (id)predicateForURI:(id)a3
{
  objc_super v3 = [a3 _stripPotentialTokenURIWithToken:0];
  id v4 = [v3 _FZIDType];
  v5 = (void *)IMWeakLinkClass();
  if (v4)
  {
    v6 = 0;
    if (v4 != (id)1) {
      goto LABEL_6;
    }
    v7 = [v3 _stripFZIDPrefix];
    uint64_t v8 = [v5 predicateForContactsMatchingEmailAddress:v7];
  }
  else
  {
    v9 = (void *)IMWeakLinkClass();
    v10 = [v3 _stripFZIDPrefix];
    v7 = [v9 phoneNumberWithStringValue:v10];

    uint64_t v8 = [v5 predicateForContactsMatchingPhoneNumber:v7];
  }
  v6 = (void *)v8;

LABEL_6:

  return v6;
}

- (id)matchingContactsForURI:(id)a3
{
  id v4 = a3;
  v5 = [(IDSFrequentURISuggester *)self predicateForURI:v4];
  if (v5)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_100040608;
    v18 = sub_100040618;
    id v19 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040620;
    block[3] = &unk_10097ED88;
    block[4] = &v14;
    if (qword_100A4A298 != -1) {
      dispatch_once(&qword_100A4A298, block);
    }
    id v6 = objc_alloc_init((Class)IMWeakLinkClass());
    uint64_t v22 = v15[5];
    v7 = +[NSArray arrayWithObjects:&v22 count:1];
    id v12 = 0;
    uint64_t v8 = [v6 unifiedContactsMatchingPredicate:v5 keysToFetch:v7 error:&v12];
    id v9 = v12;

    if (v9)
    {
      v10 = +[IDSFoundationLog opportunistic];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error retrieving contacts {error: %@}", buf, 0xCu);
      }
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)checkContactsForDestination:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(a3, "destinationURIs", 0);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(IDSFrequentURISuggester *)self matchingContactsForURI:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        v10 = v9;
        if (!v9 || ![v9 count])
        {

          BOOL v11 = 0;
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_13:

  return v11;
}

@end