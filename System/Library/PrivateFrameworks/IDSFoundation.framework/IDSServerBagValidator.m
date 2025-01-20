@interface IDSServerBagValidator
- (IDSServerBagConfig)config;
- (IDSServerBagValidator)initWithConfig:(id)a3;
- (id)trustedContentsFromRawContents:(id)a3 shouldReport:(BOOL)a4 withError:(id *)a5;
- (void)setConfig:(id)a3;
@end

@implementation IDSServerBagValidator

- (IDSServerBagValidator)initWithConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSServerBagValidator;
  v6 = [(IDSServerBagValidator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (id)trustedContentsFromRawContents:(id)a3 shouldReport:(BOOL)a4 withError:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v12 = objc_msgSend_serverCerts(v8, v9, v10, v11);
  v49 = 0;
  v13 = sub_19D9C3934(self, v12, v6, &v49);
  v14 = v49;

  if (v13)
  {
    v18 = objc_msgSend_serverSignature(v8, v15, v16, v17);
    v22 = objc_msgSend_signedBag(v8, v19, v20, v21);
    v26 = objc_msgSend_config(self, v23, v24, v25);
    int v30 = objc_msgSend_hashAlgorithm(v26, v27, v28, v29);
    id v48 = 0;
    BOOL v31 = sub_19D9C3608(self, v18, v22, v13, v30, &v48);
    id v32 = v48;

    CFRelease(v13);
    if (v31)
    {
      v36 = (void *)MEMORY[0x1E4F28F98];
      v37 = objc_msgSend_signedBag(v8, v33, v34, v35);
      id v47 = 0;
      v40 = objc_msgSend_propertyListWithData_options_format_error_(v36, v38, (uint64_t)v37, v39, 0, 0, &v47);
      id v41 = v47;

      if (v40)
      {
        v42 = [IDSServerBagLoadedContents alloc];
        v45 = objc_msgSend_initWithDictionary_rawContents_(v42, v43, (uint64_t)v40, v44, v8);
      }
      else if (a5)
      {
        IDSServerBagContentErrorWithUnderlyingError(200, v41);
        v45 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = 0;
      }
    }
    else if (a5)
    {
      IDSServerBagContentErrorWithUnderlyingError(500, v32);
      v45 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = 0;
    }
  }
  else if (a5)
  {
    IDSServerBagContentErrorWithUnderlyingError(400, v14);
    v45 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end