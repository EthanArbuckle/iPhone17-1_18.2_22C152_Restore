@interface CPLSocialGroupChange
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
+ (void)setRelatedValueOnRecord:(id)a3 fromRelatedRecord:(id)a4;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLSocialGroupChange

+ (id)ckPropertyForRelatedIdentifier
{
  return @"keyAssetIdEnc";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  v3 = [a3 recordID];
  v4 = [v3 recordName];

  return v4;
}

+ (void)setRelatedValueOnRecord:(id)a3 fromRelatedRecord:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    id v7 = [a4 recordID];
    v6 = [v7 recordName];
    objc_msgSend(v5, "cpl_setEncryptedObject:forKey:validateClass:", v6, @"keyAssetIdEnc", objc_opt_class());
  }
}

- (void)fillWithCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"verifiedTypeEnc", objc_opt_class());
  v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (!v6) {
    v6 = &off_100291E90;
  }
  -[CPLSocialGroupChange setVerifiedType:](v5, "setVerifiedType:", (__int16)[v6 integerValue]);

  v8 = objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"customTitleEnc", objc_opt_class());
  [(CPLSocialGroupChange *)v5 setCustomTitle:v8];

  objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"positionEnc", objc_opt_class());
  v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9) {
    v9 = &off_100291E90;
  }
  -[CPLSocialGroupChange setPosition:](v5, "setPosition:", [v9 integerValue]);

  v11 = objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"keyAssetIdEnc", objc_opt_class());
  [(CPLSocialGroupChange *)v5 setKeyAssetIdentifier:v11];

  v12 = objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"personListEnc", objc_opt_class());
  if ([v12 length])
  {
    [(CPLSocialGroupChange *)v5 setPersonsData:v12];
  }
  else if (!_CPLSilentLogging)
  {
    v13 = __CPLGenericOSLogDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to find any personsData for %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = self;
  v8 = [a4 fingerprintContext];
  if (![(CPLSocialGroupChange *)v7 hasChangeType:2]) {
    goto LABEL_26;
  }
  if ([(CPLSocialGroupChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"verifiedType")])
  {
    v9 = +[NSNumber numberWithShort:[(CPLSocialGroupChange *)v7 verifiedType]];
    [v6 setEncryptedObject:v9 forKey:@"verifiedTypeEnc" validateClass:objc_opt_class()];
  }
  if ([(CPLSocialGroupChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"customTitle")])
  {
    v10 = [(CPLSocialGroupChange *)v7 customTitle];
    [v6 setEncryptedObject:v10 forKey:@"customTitleEnc" validateClass:objc_opt_class()];
  }
  if ([(CPLSocialGroupChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"position")])
  {
    v11 = +[NSNumber numberWithUnsignedInteger:[(CPLSocialGroupChange *)v7 position]];
    [v6 setEncryptedObject:v11 forKey:@"positionEnc" validateClass:objc_opt_class()];
  }
  if ([(CPLSocialGroupChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"keyAssetIdentifier")])
  {
    v12 = [(CPLSocialGroupChange *)v7 keyAssetIdentifier];
    if (v12) {
      [v6 setEncryptedObject:v12 forKey:@"keyAssetIdEnc" validateClass:objc_opt_class()];
    }
  }
  v13 = v7;
  if (![&__NSArray0__struct count]) {
    goto LABEL_22;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = [&__NSArray0__struct countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
LABEL_15:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v21 != v16) {
        objc_enumerationMutation(&__NSArray0__struct);
      }
      if ([(CPLSocialGroupChange *)v13 shouldApplyPropertiesWithSelector:NSSelectorFromString(*(NSString **)(*((void *)&v20 + 1) + 8 * v17))])break; {
      if (v15 == (id)++v17)
      }
      {
        id v15 = [&__NSArray0__struct countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v15) {
          goto LABEL_15;
        }
        goto LABEL_21;
      }
    }
LABEL_22:

    [v6 setObject:CPLSocialGroupClientVersion forKey:@"version"];
    goto LABEL_23;
  }
LABEL_21:

LABEL_23:
  if ([(CPLSocialGroupChange *)v13 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"personsData")])
  {
    v18 = [(CPLSocialGroupChange *)v13 personsData];

    if (v18)
    {
      v19 = [(CPLSocialGroupChange *)v13 personsData];
      [v6 setEncryptedObject:v19 forKey:@"personListEnc" validateClass:objc_opt_class()];
    }
  }
LABEL_26:
}

@end