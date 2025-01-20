@interface CPLFaceCropChange
+ (id)ckAssetProperties;
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLFaceCropChange

+ (id)ckAssetProperties
{
  if (qword_1002CEA98 != -1) {
    dispatch_once(&qword_1002CEA98, &stru_10027A488);
  }
  v2 = (void *)qword_1002CEAA0;
  return v2;
}

- (void)fillMissingCKAssetProperties:(id)a3 withCKRecord:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CPLFaceCropChange;
  id v7 = a3;
  [(CPLFaceCropChange *)&v10 fillMissingCKAssetProperties:v7 withCKRecord:v6];
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", @"resFaceCropRes", v10.receiver, v10.super_class);

  if (v8)
  {
    v9 = +[CPLFingerprintScheme nonPrivateFingerprintScheme];
    [v6 cplValidateAndWarnIntegrityOfResourceData:v8 withFingerPrintKey:@"resFaceCropFingerprint" andFileSizeKey:@"resFaceCropFileSize" fingerprintScheme:v9];

    [(CPLFaceCropChange *)self setResourceData:v8];
  }
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"personRef";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKReference) initWithRecord:v3 action:0];

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v11 = a3;
  id v4 = self;
  v5 = [v11 objectForKey:@"personRef"];
  id v6 = [v5 recordID];
  id v7 = [v6 recordName];

  [(CPLFaceCropChange *)v4 setPersonIdentifier:v7];
  objc_msgSend(v11, "cpl_objectForKey:validateClass:", @"type", objc_opt_class());
  v8 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8) {
    v8 = &off_100291E90;
  }
  -[CPLFaceCropChange setFaceCropType:](v4, "setFaceCropType:", [v8 integerValue]);

  if (+[CPLPersonChange serverSupportsGraphPeopleHome])
  {
    objc_super v10 = objc_msgSend(v11, "cpl_legacyDecryptedObjectForKey:validateClass:", @"rejectedPersonIdentifier", objc_opt_class());
    [(CPLFaceCropChange *)v4 setRejectedPersonIdentifier:v10];
  }
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  objc_super v10 = [v8 fingerprintContext];
  if (![(CPLFaceCropChange *)v9 hasChangeType:2]) {
    goto LABEL_20;
  }
  if ([(CPLFaceCropChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"personIdentifier")])
  {
    uint64_t v11 = [(CPLFaceCropChange *)v9 personScopedIdentifier];
    if (!v11) {
      sub_1001CE5D4((uint64_t)v9, (uint64_t)a2);
    }
    v12 = (void *)v11;
    [v7 setCKReferenceWithScopedIdentifier:v11 forKey:@"personRef" referenceAction:0];
  }
  if ([(CPLFaceCropChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"resourceData")])
  {
    uint64_t v13 = [(CPLFaceCropChange *)v9 resourceData];
    if (!v13) {
      sub_1001CE6B4((uint64_t)v9, (uint64_t)a2);
    }
    v14 = (void *)v13;
    v15 = +[CPLFingerprintScheme nonPrivateFingerprintScheme];
    id v23 = 0;
    v16 = [v15 fingerPrintForData:v14 error:&v23];
    id v17 = v23;

    if (v16)
    {
      [v7 setObject:v16 forKey:@"resFaceCropFingerprint"];
      v18 = [objc_alloc((Class)CKAsset) initWithAssetContent:v14 itemTypeHint:@"fxd"];
      [v7 setObject:v18 forKey:@"resFaceCropRes"];
      v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 length]);
      [v7 setObject:v19 forKey:@"resFaceCropFileSize"];
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_13:

        goto LABEL_14;
      }
      v18 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to compute fingerprint for faceCrop: %@", buf, 0xCu);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
  if ([(CPLFaceCropChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"faceCropType")])
  {
    v20 = +[NSNumber numberWithInteger:[(CPLFaceCropChange *)v9 faceCropType]];
    [v7 setObject:v20 forKey:@"type"];
  }
  if ([(CPLFaceCropChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"rejectedPersonIdentifier")])
  {
    if (+[CPLPersonChange serverSupportsGraphPeopleHome])
    {
      v21 = [(CPLFaceCropChange *)v9 rejectedPersonIdentifier];

      if (v21)
      {
        v22 = [(CPLFaceCropChange *)v9 rejectedPersonIdentifier];
        [v7 setLegacyEncryptedObject:v22 forKey:@"rejectedPersonIdentifier"];
      }
    }
  }
LABEL_20:
}

@end