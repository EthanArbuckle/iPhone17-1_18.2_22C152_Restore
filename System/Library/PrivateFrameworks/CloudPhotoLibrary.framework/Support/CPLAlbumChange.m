@interface CPLAlbumChange
+ (id)ckAssetProperties;
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLAlbumChange

+ (id)ckAssetProperties
{
  if (qword_1002CEA88 != -1) {
    dispatch_once(&qword_1002CEA88, &stru_10027A468);
  }
  v2 = (void *)qword_1002CEA90;
  return v2;
}

- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLAlbumChange;
  [(CPLAlbumChange *)&v12 fillMissingCKAssetProperties:v6 withCKRecord:v7];
  v8 = [v6 objectForKeyedSubscript:@"resProjectDataRes"];
  if (v8)
  {
    v9 = +[CPLFingerprintScheme nonPrivateFingerprintScheme];
    [v7 cplValidateAndWarnIntegrityOfResourceData:v8 withFingerPrintKey:@"resProjectDataFingerprint" andFileSizeKey:@"resProjectDataFileSize" fingerprintScheme:v9];

    [(CPLAlbumChange *)self setProjectData:v8];
  }
  v10 = [v6 objectForKeyedSubscript:@"resProjectPreviewImageDataRes"];
  if (v10)
  {
    v11 = +[CPLFingerprintScheme nonPrivateFingerprintScheme];
    [v7 cplValidateAndWarnIntegrityOfResourceData:v10 withFingerPrintKey:@"resProjectPreviewImageDataFingerprint" andFileSizeKey:@"resProjectPreviewImageDataFileSize" fingerprintScheme:v11];

    [(CPLAlbumChange *)self setProjectPreviewImageData:v10];
  }
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"parentId";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  v3 = [a3 recordID];
  v4 = [v3 recordName];

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v20 = a3;
  v4 = self;
  v5 = [v20 objectForKey:@"parentId"];
  [(CPLAlbumChange *)v4 setParentIdentifier:v5];

  id v6 = objc_msgSend(v20, "cpl_legacyDecryptedObjectForKey:validateClass:", @"albumNameEnc", objc_opt_class());
  [(CPLAlbumChange *)v4 setName:v6];

  objc_msgSend(v20, "cpl_objectForKey:validateClass:", @"position", objc_opt_class());
  id v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7) {
    id v7 = &off_100291E78;
  }
  -[CPLAlbumChange setPosition:](v4, "setPosition:", [v7 integerValue]);

  objc_msgSend(v20, "cpl_objectForKey:validateClass:", @"albumType", objc_opt_class());
  v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9) {
    v9 = &off_100291E90;
  }
  -[CPLAlbumChange setAlbumType:](v4, "setAlbumType:", [v9 unsignedIntegerValue]);

  v11 = objc_msgSend(v20, "cpl_legacyDecryptedObjectForKey:validateClass:", @"importedByBundleIdentifierEnc", objc_opt_class());
  [(CPLAlbumChange *)v4 setImportedByBundleIdentifier:v11];

  objc_super v12 = [v20 objectForKeyedSubscript:@"sortType"];
  v13 = v12;
  if (v12 && [v12 unsignedIntegerValue])
  {
    id v14 = [v13 unsignedIntegerValue];
  }
  else
  {
    v15 = [v20 objectForKeyedSubscript:@"sortTypeExt"];
    v16 = v15;
    if (v15 && [v15 unsignedIntegerValue]) {
      id v14 = [v16 unsignedIntegerValue];
    }
    else {
      id v14 = 0;
    }
  }
  [(CPLAlbumChange *)v4 setAlbumSortType:v14];

  v17 = objc_msgSend(v20, "cpl_objectForKey:validateClass:", @"sortAscending", objc_opt_class());
  v18 = v17;
  if (!v17) {
    v17 = &__kCFBooleanFalse;
  }
  -[CPLAlbumChange setAlbumSortAscending:](v4, "setAlbumSortAscending:", [v17 BOOLValue]);

  v19 = objc_msgSend(v20, "cpl_legacyDecryptedObjectForKey:validateClass:", @"projectDocumentTypeEnc", objc_opt_class());
  [(CPLAlbumChange *)v4 setProjectDocumentType:v19];
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = self;
  v8 = [a4 fingerprintContext];
  if (![(CPLAlbumChange *)v7 hasChangeType:2]) {
    goto LABEL_43;
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"parentIdentifier")])
  {
    v9 = [(CPLAlbumChange *)v7 parentIdentifier];
    [v6 setObject:v9 forKey:@"parentId"];
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"name")])
  {
    v10 = [(CPLAlbumChange *)v7 name];
    [v6 setLegacyEncryptedObject:v10 forKey:@"albumNameEnc"];
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"position")])
  {
    v11 = +[NSNumber numberWithInteger:[(CPLAlbumChange *)v7 position]];
    [v6 setObject:v11 forKey:@"position"];
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"albumType")])
  {
    objc_super v12 = +[NSNumber numberWithUnsignedInteger:[(CPLAlbumChange *)v7 albumType]];
    [v6 setObject:v12 forKey:@"albumType"];
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"importedByBundleIdentifier")])
  {
    v13 = [(CPLAlbumChange *)v7 importedByBundleIdentifier];
    [v6 setLegacyEncryptedObject:v13 forKey:@"importedByBundleIdentifierEnc"];
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"albumSortType")])
  {
    id v14 = [(CPLAlbumChange *)v7 albumSortType];
    id v15 = v14;
    if ((unint64_t)v14 < 6 || v14 == (id)100)
    {
      v16 = +[NSNumber numberWithUnsignedInteger:v14];
      [v6 setObject:v16 forKey:@"sortType"];

      [v6 setObject:&off_100291E90 forKey:@"sortTypeExt"];
    }
    else
    {
      [v6 setObject:&off_100291E90 forKey:@"sortType"];
      v24 = +[NSNumber numberWithUnsignedInteger:v15];
      [v6 setObject:v24 forKey:@"sortTypeExt"];
    }
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"albumSortAscending")])
  {
    v17 = +[NSNumber numberWithBool:[(CPLAlbumChange *)v7 albumSortAscending]];
    [v6 setObject:v17 forKey:@"sortAscending"];
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"projectDocumentType")])
  {
    v18 = [(CPLAlbumChange *)v7 projectDocumentType];
    [v6 setLegacyEncryptedObject:v18 forKey:@"projectDocumentTypeEnc"];
  }
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"projectData")])
  {
    v19 = [(CPLAlbumChange *)v7 projectData];
    if (!v19)
    {
      [v6 setObject:0 forKey:@"resProjectDataFingerprint"];
      [v6 setObject:0 forKey:@"resProjectDataRes"];
      [v6 setObject:0 forKey:@"resProjectDataFileSize"];
LABEL_31:

      goto LABEL_32;
    }
    id v20 = +[CPLFingerprintScheme nonPrivateFingerprintScheme];
    id v33 = 0;
    v21 = [v20 fingerPrintForData:v19 error:&v33];
    id v22 = v33;

    if (v21)
    {
      [v6 setObject:v21 forKey:@"resProjectDataFingerprint"];
      v23 = [objc_alloc((Class)CKAsset) initWithAssetContent:v19 itemTypeHint:@"fxd"];
      [v6 setObject:v23 forKey:@"resProjectDataRes"];
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_30:
        v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v19 length]);
        [v6 setObject:v25 forKey:@"resProjectDataFileSize"];

        goto LABEL_31;
      }
      v23 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to compute fingerprint for projectData: %@", buf, 0xCu);
      }
    }

    goto LABEL_30;
  }
LABEL_32:
  if ([(CPLAlbumChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"projectPreviewImageData")])
  {
    v26 = [(CPLAlbumChange *)v7 projectPreviewImageData];
    if (!v26)
    {
      [v6 setObject:0 forKey:@"resProjectPreviewImageDataFingerprint"];
      [v6 setObject:0 forKey:@"resProjectPreviewImageDataRes"];
      [v6 setObject:0 forKey:@"resProjectPreviewImageDataFileSize"];
LABEL_42:

      goto LABEL_43;
    }
    v27 = +[CPLFingerprintScheme nonPrivateFingerprintScheme];
    id v32 = 0;
    v28 = [v27 fingerPrintForData:v26 error:&v32];
    id v29 = v32;

    if (v28)
    {
      [v6 setObject:v28 forKey:@"resProjectPreviewImageDataFingerprint"];
      v30 = [objc_alloc((Class)CKAsset) initWithAssetContent:v26 itemTypeHint:@"fxd"];
      [v6 setObject:v30 forKey:@"resProjectPreviewImageDataRes"];
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_41:
        v31 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v26 length]);
        [v6 setObject:v31 forKey:@"resProjectPreviewImageDataFileSize"];

        goto LABEL_42;
      }
      v30 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to compute fingerprint for projectPreviewImageData: %@", buf, 0xCu);
      }
    }

    goto LABEL_41;
  }
LABEL_43:
}

@end