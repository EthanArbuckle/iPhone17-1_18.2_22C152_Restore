@interface DSArchiveService
- (DSArchiveServiceUnarchivingDelegate)unarchivingDelegate;
- (id)archiveItemsAtURLs:(id)a3 toURL:(id)a4 options:(unint64_t)a5 compressionFormat:(unint64_t)a6 passphrase:(id)a7 completionHandler:(id)a8;
- (id)archiveItemsWithURLs:(id)a3 compressionFormat:(unint64_t)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6;
- (id)archiveItemsWithURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 destinationFolderURL:(id)a7 completionHandler:(id)a8;
- (id)unarchiveItemAtURL:(id)a3 passphrase:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6;
- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 addToKeychain:(BOOL)a5 destinationFolderURL:(id)a6 acceptedFormats:(unint64_t)a7 completionHandler:(id)a8;
- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 acceptedFormats:(unint64_t)a6 completionHandler:(id)a7;
- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6;
- (id)unarchiveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 acceptedFormats:(unint64_t)a6 passphrases:(id)a7 completionHandler:(id)a8;
- (void)itemDescriptorsForItemAtURL:(id)a3 passphrase:(id)a4 completionHandler:(id)a5;
- (void)itemDescriptorsForItemAtURL:(id)a3 passphrases:(id)a4 completionHandler:(id)a5;
- (void)receiveArchivedItemsDescriptors:(id)a3 placeholderName:(id)a4 placeholderTypeIdentifier:(id)a5;
- (void)setUnarchivingDelegate:(id)a3;
@end

@implementation DSArchiveService

- (void)itemDescriptorsForItemAtURL:(id)a3 passphrase:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v12 = v9;
    v11 = +[NSArray arrayWithObjects:&v12 count:1];
  }
  else
  {
    v11 = 0;
  }
  [(DSArchiveService *)self itemDescriptorsForItemAtURL:v8 passphrases:v11 completionHandler:v10];
  if (v9) {
}
  }

- (void)itemDescriptorsForItemAtURL:(id)a3 passphrases:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10000533C(0);
  [v10 resume];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005420;
  v19[3] = &unk_10002CD40;
  id v11 = v9;
  id v21 = v11;
  id v12 = v10;
  id v20 = v12;
  v13 = [v12 remoteObjectProxyWithErrorHandler:v19];
  if (v7)
  {
    id v14 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v7 readonly:1];
    if (v14)
    {
      [v13 itemDescriptorsForItemWithURLWrapper:v14 passphrases:v8 completionHandler:v11];
    }
    else
    {
      NSErrorUserInfoKey v22 = NSURLErrorKey;
      id v23 = v7;
      v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v17 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:v16];

      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v17);
      [v12 invalidate];
    }
  }
  else
  {
    id v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    v15 = LogObj(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "itemDescriptorsForItemAtURL: url is nil", v18, 2u);
    }

    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v14);
    [v12 invalidate];
  }
}

- (id)archiveItemsAtURLs:(id)a3 toURL:(id)a4 options:(unint64_t)a5 compressionFormat:(unint64_t)a6 passphrase:(id)a7 completionHandler:(id)a8
{
  id v11 = a3;
  id v12 = a4;
  id v50 = a7;
  v13 = (void (**)(id, void, id))a8;
  v51 = v11;
  id v14 = [v11 count];
  if (v12 && v14)
  {
    char v64 = 0;
    v15 = +[NSFileManager defaultManager];
    v16 = [v12 path];
    unsigned __int8 v17 = [v15 fileExistsAtPath:v16 isDirectory:&v64];
    if (v64) {
      unsigned __int8 v18 = v17;
    }
    else {
      unsigned __int8 v18 = 0;
    }

    if (v18)
    {
      v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v51 count]);
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v20 = v51;
      id v21 = [v20 countByEnumeratingWithState:&v60 objects:v68 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v61;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v61 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            Class v25 = (Class)off_100031848();
            id v59 = 0;
            v26 = [(objc_class *)v25 wrapperWithURL:v24 readonly:1 error:&v59];
            id v27 = v59;
            if (!v26)
            {
              v41 = LogObj(0);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v70 = v27;
                _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: Couldn't get url wrapper: %@", buf, 0xCu);
              }

              v35 = 0;
              v13[2](v13, 0, v27);
              goto LABEL_32;
            }
            [v19 addObject:v26];
          }
          id v21 = [v20 countByEnumeratingWithState:&v60 objects:v68 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      id v20 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v12 readonly:0];
      if (v20)
      {
        v45 = sub_10000533C(0);
        [v45 resume];
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_100005D68;
        v56[3] = &unk_10002CD40;
        v28 = v13;
        id v58 = v28;
        id v29 = v45;
        id v57 = v29;
        v47 = [v29 remoteObjectProxyWithErrorHandler:v56];
        v46 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.ArchiveService" name:@"BackgroundArchive"];
        id v30 = objc_alloc((Class)RBSAssertion);
        v31 = +[RBSTarget currentProcess];
        v65 = v46;
        v32 = +[NSArray arrayWithObjects:&v65 count:1];
        id v33 = [v30 initWithExplanation:@"ArchiveServices archive operation" target:v31 attributes:v32];

        [v33 acquireWithInvalidationHandler:&stru_10002CD80];
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_100005EA8;
        v52[3] = &unk_10002CDA8;
        v55 = v28;
        id v34 = v33;
        id v53 = v34;
        id v27 = v29;
        id v54 = v27;
        v35 = [v47 archiveItemsWithURLWrappers:v19 toURLWrapper:v20 options:a5 compressionFormat:a6 passphrase:v50 completionHandler:v52];
      }
      else
      {
        NSErrorUserInfoKey v66 = NSURLErrorKey;
        id v67 = v12;
        v43 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        id v27 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:v43];

        v44 = LogObj(0);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v27;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "archiveItemsAtURLs: Couldn't get url wrapper for destination: %@", buf, 0xCu);
        }

        v35 = 0;
        v13[2](v13, 0, v27);
      }
LABEL_32:
    }
    else
    {
      NSErrorUserInfoKey v71 = NSURLErrorKey;
      id v72 = v12;
      v39 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
      v19 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:v39];

      v40 = LogObj(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v70 = v19;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "archiveItemsAtURLs: destination doesn't exist or isn't a directory: %@", buf, 0xCu);
      }

      v35 = 0;
      v13[2](v13, 0, v19);
    }
  }
  else
  {
    v36 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    if (![v11 count])
    {
      v37 = LogObj(0);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: no urls", buf, 2u);
      }
    }
    if (!v12)
    {
      v38 = LogObj(0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: destination is nil", buf, 2u);
      }
    }
    v13[2](v13, 0, v36);

    v35 = 0;
  }

  return v35;
}

- (id)unarchiveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 acceptedFormats:(unint64_t)a6 passphrases:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v53 = a7;
  v16 = (void (**)(id, void, uint64_t))a8;
  unsigned __int8 v17 = [(DSArchiveService *)self unarchivingDelegate];

  if (v17) {
    unint64_t v18 = a5 | 0x100000;
  }
  else {
    unint64_t v18 = a5;
  }
  if (v14 && v15)
  {
    char v64 = 0;
    v19 = +[NSFileManager defaultManager];
    id v20 = [v15 path];
    unsigned __int8 v21 = [v19 fileExistsAtPath:v20 isDirectory:&v64];
    if (v64) {
      unsigned __int8 v22 = v21;
    }
    else {
      unsigned __int8 v22 = 0;
    }

    if ((v22 & 1) == 0)
    {
      NSErrorUserInfoKey v70 = NSURLErrorKey;
      id v71 = v15;
      id v30 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      uint64_t v31 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4 userInfo:v30];

      v32 = LogObj(0);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v69 = v31;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination doesn't exist or isn't a directory: %@", buf, 0xCu);
      }

      id v29 = 0;
      id v33 = (void *)v31;
      v16[2](v16, 0, v31);
      goto LABEL_34;
    }
    id v63 = 0;
    uint64_t v23 = [(objc_class *)off_100031848() wrapperWithURL:v14 readonly:0 error:&v63];
    id v24 = v63;
    Class v25 = v24;
    v52 = (void *)v23;
    if (v23)
    {
      id v50 = v24;
    }
    else
    {
      id v62 = v24;
      v52 = [(objc_class *)off_100031848() wrapperWithURL:v14 readonly:1 error:&v62];
      id v50 = v62;

      if (!v52)
      {
        v46 = LogObj(0);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v69 = (uint64_t)v50;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for item: %@", buf, 0xCu);
        }

        id v29 = 0;
        id v33 = v50;
        v16[2](v16, 0, (uint64_t)v50);
        goto LABEL_34;
      }
    }
    id v51 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v15 readonly:0];
    if (v51)
    {
      if (v17) {
        id v34 = self;
      }
      else {
        id v34 = 0;
      }
      v47 = sub_10000533C(v34);
      [v47 resume];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1000067E0;
      v59[3] = &unk_10002CD40;
      v35 = v16;
      id v61 = v35;
      id v36 = v47;
      id v60 = v36;
      v48 = [v36 remoteObjectProxyWithErrorHandler:v59];
      v49 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.ArchiveService" name:@"BackgroundArchive"];
      id v37 = objc_alloc((Class)RBSAssertion);
      v38 = +[RBSTarget currentProcess];
      v65 = v49;
      v39 = +[NSArray arrayWithObjects:&v65 count:1];
      id v40 = [v37 initWithExplanation:@"ArchiveServices unarchive operation" target:v38 attributes:v39];

      [v40 acquireWithInvalidationHandler:&stru_10002CDC8];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100006920;
      v54[3] = &unk_10002CDF0;
      id v55 = v14;
      id v58 = v35;
      id v41 = v40;
      id v56 = v41;
      id v42 = v36;
      id v57 = v42;
      id v29 = [v48 unarchiveItemWithURLWrapper:v52 toURLWrapper:v51 options:v18 passphrases:v53 acceptedFormats:a6 completionHandler:v54];
    }
    else
    {
      NSErrorUserInfoKey v66 = NSURLErrorKey;
      id v67 = v15;
      v43 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      id v42 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:v43];

      v44 = LogObj(0);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v69 = (uint64_t)v42;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for destination: %@", buf, 0xCu);
      }

      id v29 = 0;
      v16[2](v16, 0, (uint64_t)v42);
    }

    id v33 = v50;
LABEL_34:

    goto LABEL_35;
  }
  v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
  if (!v14)
  {
    id v27 = LogObj(0);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: url is nil", buf, 2u);
    }
  }
  if (!v15)
  {
    v28 = LogObj(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination is nil", buf, 2u);
    }
  }
  v16[2](v16, 0, (uint64_t)v26);

  id v29 = 0;
LABEL_35:

  return v29;
}

- (id)archiveItemsWithURLs:(id)a3 compressionFormat:(unint64_t)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  v6 = [(DSArchiveService *)self archiveItemsWithURLs:a3 passphrase:0 addToKeychain:0 compressionFormat:a4 destinationFolderURL:a5 completionHandler:a6];
  return v6;
}

- (id)archiveItemsWithURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 destinationFolderURL:(id)a7 completionHandler:(id)a8
{
  BOOL v11 = a5;
  id v37 = a3;
  id v34 = a4;
  id v36 = a7;
  id v33 = a8;
  v32 = sub_10000533C(0);
  [v32 resume];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000070BC;
  v46[3] = &unk_10002CD40;
  id v13 = v33;
  id v48 = v13;
  id v14 = v32;
  id v47 = v14;
  v35 = [v14 remoteObjectProxyWithErrorHandler:v46];
  id v15 = [v37 count];
  if (v36 && v15)
  {
    BOOL v30 = v11;
    unint64_t v31 = a6;
    v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v37 count]);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v17 = v37;
    id v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v43;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          Class v22 = off_100031848();
          id v41 = 0;
          uint64_t v23 = [(objc_class *)v22 wrapperWithURL:v21 readonly:1 error:&v41];
          id v24 = v41;
          if (!v23)
          {
            v28 = LogObj(0);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v50 = v24;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: Couldn't get url wrapper: %@", buf, 0xCu);
            }

            (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v24);
            [v14 invalidate];
            Class v25 = 0;
            goto LABEL_24;
          }
          [v16 addObject:v23];
        }
        id v18 = [v17 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v17 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v36 readonly:0];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100007138;
    v38[3] = &unk_10002CE18;
    id v40 = v13;
    id v39 = v14;
    Class v25 = [v35 archiveItemsWithURLWrappers:v16 passphrase:v34 addToKeychain:v30 compressionFormat:v31 destinationFolderURLWrapper:v17 usePlaceholder:0 completionHandler:v38];

    id v24 = v40;
LABEL_24:
  }
  else
  {
    v16 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    if (![v37 count])
    {
      v26 = LogObj(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: no urls", buf, 2u);
      }
    }
    if (!v36)
    {
      id v27 = LogObj(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: destination is nil", buf, 2u);
      }
    }
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v16);
    [v14 invalidate];
    Class v25 = 0;
  }

  return v25;
}

- (id)unarchiveItemAtURL:(id)a3 passphrase:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    id v17 = v11;
    id v14 = +[NSArray arrayWithObjects:&v17 count:1];
  }
  else
  {
    id v14 = 0;
  }
  id v15 = [(DSArchiveService *)self unarchiveItemAtURL:v10 passphrases:v14 addToKeychain:0 destinationFolderURL:v12 acceptedFormats:1 completionHandler:v13];
  if (v11) {

  }
  return v15;
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  v6 = [(DSArchiveService *)self unarchiveItemAtURL:a3 passphrases:a4 addToKeychain:0 destinationFolderURL:a5 acceptedFormats:1 completionHandler:a6];
  return v6;
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 acceptedFormats:(unint64_t)a6 completionHandler:(id)a7
{
  id v7 = [(DSArchiveService *)self unarchiveItemAtURL:a3 passphrases:a4 addToKeychain:0 destinationFolderURL:a5 acceptedFormats:a6 completionHandler:a7];
  return v7;
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 addToKeychain:(BOOL)a5 destinationFolderURL:(id)a6 acceptedFormats:(unint64_t)a7 completionHandler:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v37 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = [(DSArchiveService *)self unarchivingDelegate];

  if (v17) {
    id v18 = self;
  }
  else {
    id v18 = 0;
  }
  v35 = sub_10000533C(v18);
  [v35 resume];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100007A18;
  v45[3] = &unk_10002CD40;
  id v19 = v16;
  id v47 = v19;
  id v20 = v35;
  id v46 = v20;
  v38 = [v20 remoteObjectProxyWithErrorHandler:v45];
  if (!v14 || !v15)
  {
    id v24 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    if (!v14)
    {
      Class v25 = LogObj(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: url is nil", buf, 2u);
      }
    }
    if (!v15)
    {
      v26 = LogObj(0);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination is nil", buf, 2u);
      }
    }
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v24);
    [v20 invalidate];
    goto LABEL_17;
  }
  id v44 = 0;
  uint64_t v21 = [(objc_class *)off_100031848() wrapperWithURL:v14 readonly:0 error:&v44];
  id v22 = v44;
  uint64_t v23 = v22;
  if (!v21)
  {
    id v43 = v22;
    uint64_t v21 = [(objc_class *)off_100031848() wrapperWithURL:v14 readonly:1 error:&v43];
    id v36 = v43;

    if (v21) {
      goto LABEL_19;
    }
    id v33 = LogObj(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v36;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for item: %@", buf, 0xCu);
    }

    id v24 = v36;
    (*((void (**)(id, void, id))v19 + 2))(v19, 0, v36);
    [v20 invalidate];
LABEL_17:
    id v27 = 0;
    goto LABEL_25;
  }
  id v36 = v22;
LABEL_19:
  id v28 = [objc_alloc((Class)NSSecurityScopedURLWrapper) initWithURL:v15 readonly:0];
  if (v28)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100007A90;
    v39[3] = &unk_10002CE40;
    id v40 = v14;
    id v42 = v19;
    id v41 = v20;
    LOBYTE(v34) = 0;
    id v27 = [v38 unarchiveItemWithURLWrapper:v21 passphrases:v37 addToKeychain:v11 destinationFolderURLWrapper:v28 acceptedFormats:a7 exportsStreamingReceiver:v17 != 0 usePlaceholder:v34 completionHandler:v39];

    id v29 = v40;
  }
  else
  {
    NSErrorUserInfoKey v48 = NSURLErrorKey;
    id v49 = v15;
    BOOL v30 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    id v29 = +[NSError errorWithDomain:NSCocoaErrorDomain code:257 userInfo:v30];

    unint64_t v31 = LogObj(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v29;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for destination: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void *))v19 + 2))(v19, 0, v29);
    [v20 invalidate];
    id v27 = 0;
  }

  id v24 = v36;
LABEL_25:

  return v27;
}

- (void)receiveArchivedItemsDescriptors:(id)a3 placeholderName:(id)a4 placeholderTypeIdentifier:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(DSArchiveService *)self unarchivingDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v10 service:self didReceiveArchivedItemsDescriptors:v11 placeholderName:v8 placeholderTypeIdentifier:v9];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v10 service:self didReceiveArchivedItemsDescriptors:v11];
  }
}

- (DSArchiveServiceUnarchivingDelegate)unarchivingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unarchivingDelegate);
  return (DSArchiveServiceUnarchivingDelegate *)WeakRetained;
}

- (void)setUnarchivingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end