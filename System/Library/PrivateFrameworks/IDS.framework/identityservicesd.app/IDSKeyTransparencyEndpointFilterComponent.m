@interface IDSKeyTransparencyEndpointFilterComponent
- (IDSKeyTransparencyEndpointFilterComponent)initWithTransparencyVerifier:(id)a3;
- (id)runIndividuallyWithInput:(id)a3;
@end

@implementation IDSKeyTransparencyEndpointFilterComponent

- (IDSKeyTransparencyEndpointFilterComponent)initWithTransparencyVerifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSKeyTransparencyEndpointFilterComponent;
  v6 = [(IDSKeyTransparencyEndpointFilterComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyTransparencyVerifier, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CUTUnsafePromiseSeal);
  keyTransparencyVerifier = self->_keyTransparencyVerifier;
  v7 = [v4 service];
  if ([(IDSKeyTransparencyVerifier *)keyTransparencyVerifier isOptedInForServiceIdentifier:v7])
  {
    char v8 = _os_feature_enabled_impl();

    if (v8)
    {
      uint64_t v25 = 16;
      v26 = self;
      objc_super v9 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v10 = [v4 ktURIVerificationMap];
      id v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v34;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v34 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v16 = objc_msgSend(v15, "_stripPotentialTokenURIWithToken:", 0, v25, v26);
            v17 = [v4 ktURIVerificationMap];
            v18 = [v17 objectForKey:v15];

            if (v18) {
              CFDictionarySetValue(v9, v16, v18);
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v12);
      }

      v19 = *(Class *)((char *)&v26->super.super.isa + v25);
      v20 = [v4 service];
      v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      v29 = sub_1002CE7D8;
      v30 = &unk_100987F90;
      id v31 = v4;
      id v32 = v5;
      [v19 currentPeerVerificationResultsForURIVerificationMap:v9 forService:v20 withCompletion:&v27];

      goto LABEL_17;
    }
  }
  else
  {
  }
  v21 = +[IDSFoundationLog delivery_keyTransparency];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [v4 service];
    *(_DWORD *)buf = 138412290;
    v39 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not opted into KT for service, no KT filtering needed. { service: %@ }", buf, 0xCu);
  }
  [v5 fulfillWithValue:v4];
LABEL_17:
  v23 = objc_msgSend(v5, "promise", v25, v26, v27, v28, v29, v30);

  return v23;
}

- (void).cxx_destruct
{
}

@end