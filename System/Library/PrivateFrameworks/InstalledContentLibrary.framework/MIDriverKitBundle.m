@interface MIDriverKitBundle
+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6;
- (BOOL)validateBundleMetadataWithError:(id *)a3;
- (MIDriverKitBundle)initWithBundleParentURL:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6;
- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4;
- (id)minimumOSVersion;
@end

@implementation MIDriverKitBundle

- (MIDriverKitBundle)initWithBundleParentURL:(id)a3 parentSubdirectory:(id)a4 bundleName:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  result = (MIDriverKitBundle *)_os_crash();
  __break(1u);
  return result;
}

- (id)minimumOSVersion
{
  v2 = [(MIBundle *)self infoPlistSubset];
  v3 = [v2 objectForKeyedSubscript:@"OSMinimumDriverKitVersion"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)currentOSVersionForValidationUsingPlatform:(unint64_t *)a3 withError:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  bzero(&v16, 0x500uLL);
  if (uname(&v16))
  {
    v6 = __error();
    int v7 = *v6;
    id v9 = _CreateError((uint64_t)"-[MIDriverKitBundle currentOSVersionForValidationUsingPlatform:withError:]", 47, (void *)*MEMORY[0x1E4F28798], *v6, 0, 0, @"uname() failed", v8, v15);
    id v10 = strerror(v7);
    v12 = _CreateAndLogError((uint64_t)"-[MIDriverKitBundle currentOSVersionForValidationUsingPlatform:withError:]", 47, @"MIInstallerErrorDomain", 4, v9, &unk_1F170F458, @"Failed to get DriverKit support version: %s", v11, (uint64_t)v10);

    v13 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v13 = [NSString stringWithUTF8String:v16.release];
    v12 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v13)
  {
    *a4 = v12;
    goto LABEL_10;
  }
LABEL_7:
  if (a3 && v13) {
    *a3 = 1;
  }
LABEL_10:

  return v13;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MIDriverKitBundle;
  v6 = objc_msgSendSuper2(&v8, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a4, a5, a6);
  return v6;
}

- (BOOL)validateBundleMetadataWithError:(id *)a3
{
  id v5 = [(MIBundle *)self parentBundleID];
  v6 = [(MIBundle *)self identifier];
  int v7 = [v5 stringByAppendingString:@"."];
  objc_super v8 = [(MIBundle *)self bundleURL];
  id v9 = [v8 path];

  if ([v6 hasPrefix:v7])
  {
    unint64_t v11 = [v6 length];
    if (v11 > [v7 length])
    {
      v12 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v7, "length"));
      if (![v12 containsString:@"."])
      {
        id v14 = 0;
        BOOL v15 = 1;
        goto LABEL_9;
      }
      _CreateAndLogError((uint64_t)"-[MIDriverKitBundle validateBundleMetadataWithError:]", 89, @"MIInstallerErrorDomain", 177, 0, &unk_1F170F4A8, @"DriverKit extension bundle at \"%@\" with identifier \"%@\" contains a '.' in the portion after the parent app's prefix (prefix: \"%@\" ; dot in: \"%@\").'",
        v13,
        (uint64_t)v9);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (!a3) {
        goto LABEL_5;
      }
LABEL_7:
      id v14 = v14;
      BOOL v15 = 0;
      *a3 = v14;
      goto LABEL_9;
    }
  }
  _CreateAndLogError((uint64_t)"-[MIDriverKitBundle validateBundleMetadataWithError:]", 82, @"MIInstallerErrorDomain", 176, 0, &unk_1F170F480, @"DriverKit extension bundle at \"%@\" with identifier \"%@\" does not have expected identifier prefix \"%@\"", v10, (uint64_t)v9);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (a3) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v15 = 0;
LABEL_9:

  return v15;
}

@end