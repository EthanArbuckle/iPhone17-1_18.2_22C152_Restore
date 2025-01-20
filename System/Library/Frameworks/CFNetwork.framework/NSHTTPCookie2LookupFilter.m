@interface NSHTTPCookie2LookupFilter
- (BOOL)httpOnly;
- (BOOL)ignoreHTTPOnlyCookie;
- (BOOL)ignoreHostOnlyFlag;
- (BOOL)ignoreSecureFlag;
- (BOOL)isSafe;
- (BOOL)isTopLevelNavigation;
- (BOOL)matchCookie:(id)a3;
- (BOOL)secure;
- (NSDate)newerThanCreationDate;
- (NSDate)newerThanExpirationDate;
- (NSDate)newerThanLastAccess;
- (NSDate)olderThanCreationDate;
- (NSDate)olderThanExpirationDate;
- (NSDate)olderThanLastAccess;
- (NSHTTPCookie2LookupFilter)initWithCookie:(id)a3;
- (NSString)domain;
- (NSString)name;
- (NSString)partition;
- (NSString)path;
- (NSString)value;
- (NSURL)inURL;
- (NSURL)mainDocumentURL;
- (NSURL)siteForCookies;
- (int64_t)_flags;
- (int64_t)sameSite;
- (unint64_t)acceptPolicy;
- (void)setAcceptPolicy:(unint64_t)a3;
- (void)setDomain:(id)a3;
- (void)setHttpOnly:(BOOL)a3;
- (void)setIgnoreHTTPOnlyCookie:(BOOL)a3;
- (void)setIgnoreHostOnlyFlag:(BOOL)a3;
- (void)setIgnoreSecureFlag:(BOOL)a3;
- (void)setInURL:(id)a3;
- (void)setIsSafe:(BOOL)a3;
- (void)setIsTopLevelNavigation:(BOOL)a3;
- (void)setMainDocumentURL:(id)a3;
- (void)setName:(id)a3;
- (void)setNewerThanCreationDate:(id)a3;
- (void)setNewerThanExpirationDate:(id)a3;
- (void)setNewerThanLastAccess:(id)a3;
- (void)setOlderThanCreationDate:(id)a3;
- (void)setOlderThanExpirationDate:(id)a3;
- (void)setOlderThanLastAccess:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPath:(id)a3;
- (void)setSameSite:(int64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSiteForCookies:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NSHTTPCookie2LookupFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siteForCookies, 0);
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_inURL, 0);
  objc_storeStrong((id *)&self->_olderThanLastAccess, 0);
  objc_storeStrong((id *)&self->_olderThanExpirationDate, 0);
  objc_storeStrong((id *)&self->_olderThanCreationDate, 0);
  objc_storeStrong((id *)&self->_newerThanLastAccess, 0);
  objc_storeStrong((id *)&self->_newerThanExpirationDate, 0);
  objc_storeStrong((id *)&self->_newerThanCreationDate, 0);
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAcceptPolicy:(unint64_t)a3
{
  self->_acceptPolicy = a3;
}

- (unint64_t)acceptPolicy
{
  return self->_acceptPolicy;
}

- (void)setIsSafe:(BOOL)a3
{
  self->_isSafe = a3;
}

- (BOOL)isSafe
{
  return self->_isSafe;
}

- (void)setIsTopLevelNavigation:(BOOL)a3
{
  self->_isTopLevelNavigation = a3;
}

- (BOOL)isTopLevelNavigation
{
  return self->_isTopLevelNavigation;
}

- (void)setSiteForCookies:(id)a3
{
}

- (NSURL)siteForCookies
{
  return self->_siteForCookies;
}

- (void)setMainDocumentURL:(id)a3
{
}

- (NSURL)mainDocumentURL
{
  return self->_mainDocumentURL;
}

- (void)setInURL:(id)a3
{
}

- (NSURL)inURL
{
  return self->_inURL;
}

- (void)setIgnoreSecureFlag:(BOOL)a3
{
  self->_ignoreSecureFlag = a3;
}

- (BOOL)ignoreSecureFlag
{
  return self->_ignoreSecureFlag;
}

- (void)setIgnoreHTTPOnlyCookie:(BOOL)a3
{
  self->_ignoreHTTPOnlyCookie = a3;
}

- (BOOL)ignoreHTTPOnlyCookie
{
  return self->_ignoreHTTPOnlyCookie;
}

- (void)setIgnoreHostOnlyFlag:(BOOL)a3
{
  self->_ignoreHostOnlyFlag = a3;
}

- (BOOL)ignoreHostOnlyFlag
{
  return self->_ignoreHostOnlyFlag;
}

- (void)setHttpOnly:(BOOL)a3
{
  self->_httpOnly = a3;
}

- (BOOL)httpOnly
{
  return self->_httpOnly;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (BOOL)secure
{
  return self->_secure;
}

- (void)setOlderThanLastAccess:(id)a3
{
}

- (NSDate)olderThanLastAccess
{
  return self->_olderThanLastAccess;
}

- (void)setOlderThanExpirationDate:(id)a3
{
}

- (NSDate)olderThanExpirationDate
{
  return self->_olderThanExpirationDate;
}

- (void)setOlderThanCreationDate:(id)a3
{
}

- (NSDate)olderThanCreationDate
{
  return self->_olderThanCreationDate;
}

- (void)setNewerThanLastAccess:(id)a3
{
}

- (NSDate)newerThanLastAccess
{
  return self->_newerThanLastAccess;
}

- (void)setNewerThanExpirationDate:(id)a3
{
}

- (NSDate)newerThanExpirationDate
{
  return self->_newerThanExpirationDate;
}

- (void)setNewerThanCreationDate:(id)a3
{
}

- (NSDate)newerThanCreationDate
{
  return self->_newerThanCreationDate;
}

- (void)setSameSite:(int64_t)a3
{
  self->_sameSite = a3;
}

- (int64_t)sameSite
{
  return self->_sameSite;
}

- (void)setPartition:(id)a3
{
}

- (NSString)partition
{
  return self->_partition;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)matchCookie:(id)a3
{
  id v4 = a3;
  v5 = [(NSHTTPCookie2LookupFilter *)self domain];

  if (v5)
  {
    if (![(NSHTTPCookie2LookupFilter *)self ignoreHostOnlyFlag]
      && ([v4 hostOnly] & 1) != 0
      || ([(NSHTTPCookie2LookupFilter *)self domain],
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          int v7 = +[NSHTTPCookieStorageUtils looksLikeIPAddress:]((uint64_t)NSHTTPCookieStorageUtils, v6),
          v6,
          v7))
    {
      v8 = [v4 domain];
      v9 = [(NSHTTPCookie2LookupFilter *)self domain];
      uint64_t v10 = [v8 caseInsensitiveCompare:v9];

      if (v10) {
        goto LABEL_19;
      }
    }
    else
    {
      v11 = [(NSHTTPCookie2LookupFilter *)self domain];
      v12 = [v4 domain];
      char v13 = [v11 hasSuffix:v12];

      if ((v13 & 1) == 0) {
        goto LABEL_19;
      }
    }
  }
  v14 = [(NSHTTPCookie2LookupFilter *)self path];

  if (!v14) {
    goto LABEL_48;
  }
  v15 = [(NSHTTPCookie2LookupFilter *)self path];
  v16 = [v4 path];
  char v17 = [v15 isEqualToString:v16];

  if (v17) {
    goto LABEL_48;
  }
  v18 = [v4 path];
  char v19 = [v18 isEqualToString:@"/"];

  if (v19) {
    goto LABEL_48;
  }
  v20 = [v4 path];
  if ([v20 hasSuffix:@"/"])
  {
    v21 = [v4 path];
  }
  else
  {
    v22 = [v4 path];
    v21 = [v22 stringByAppendingString:@"/"];
  }
  v23 = [(NSHTTPCookie2LookupFilter *)self path];
  char v24 = [v23 hasPrefix:v21];

  if (v24)
  {
LABEL_48:
    v25 = [(NSHTTPCookie2LookupFilter *)self name];
    if (!v25) {
      goto LABEL_17;
    }
    v26 = [(NSHTTPCookie2LookupFilter *)self name];
    v27 = [v4 name];
    char v28 = [v26 isEqualToString:v27];

    if (v28)
    {
LABEL_17:
      v29 = [v4 partition];
      if ([v29 isEqualToString:@"none"])
      {
        v30 = 0;
      }
      else
      {
        v30 = [v4 partition];
      }

      v32 = [(NSHTTPCookie2LookupFilter *)self partition];
      if ([v32 isEqualToString:&stru_1ECFAD558])
      {
        v33 = 0;
      }
      else
      {
        v33 = [(NSHTTPCookie2LookupFilter *)self partition];
      }

      if (v30 && v33 != v30 && ([v33 isEqualToString:v30] & 1) == 0) {
        goto LABEL_42;
      }
      v34 = [(NSHTTPCookie2LookupFilter *)self siteForCookies];

      if (!v34) {
        goto LABEL_34;
      }
      uint64_t v35 = [v4 sameSite];
      if (v35 == 1)
      {
        if ([(NSHTTPCookie2LookupFilter *)self isSafe]
          && [(NSHTTPCookie2LookupFilter *)self isTopLevelNavigation])
        {
          goto LABEL_34;
        }
      }
      else if (v35 != 2)
      {
LABEL_34:
        if (([(NSHTTPCookie2LookupFilter *)self ignoreSecureFlag]
           || [(NSHTTPCookie2LookupFilter *)self secure]
           || ([v4 secure] & 1) == 0)
          && ([(NSHTTPCookie2LookupFilter *)self ignoreHTTPOnlyCookie]
           || ![(NSHTTPCookie2LookupFilter *)self httpOnly]
           || [v4 httpOnly]))
        {
          v39 = [(NSHTTPCookie2LookupFilter *)self newerThanExpirationDate];
          if (v39)
          {
            v40 = [v4 expirationDate];
            v41 = [(NSHTTPCookie2LookupFilter *)self newerThanExpirationDate];
            BOOL v42 = v40 < v41;

            char v31 = !v42;
          }
          else
          {
            char v31 = 1;
          }
          goto LABEL_44;
        }
LABEL_42:
        char v31 = 0;
LABEL_44:

        goto LABEL_45;
      }
      CFURLRef v36 = [(NSHTTPCookie2LookupFilter *)self inURL];
      CFURLRef v37 = [(NSHTTPCookie2LookupFilter *)self siteForCookies];
      char v38 = +[NSHTTPCookieStorageUtils isURLInMainDocumentDomain:withMainDocumentURL:ignoringTLD:]((uint64_t)NSHTTPCookieStorageUtils, v36, v37, 0);

      if ((v38 & 1) == 0) {
        goto LABEL_42;
      }
      goto LABEL_34;
    }
  }
LABEL_19:
  char v31 = 0;
LABEL_45:

  return v31 & 1;
}

- (void)setDomain:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    id v5 = v4;
    v6 = v5;
    if (([v5 hasPrefix:@"."] & 1) == 0)
    {
      uint64_t v7 = [@"." stringByAppendingString:v5];

      v6 = (void *)v7;
    }
    if ([v6 hasSuffix:@"."])
    {
      uint64_t v8 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);

      v6 = (void *)v8;
    }
    v9 = [MEMORY[0x1E4F28B88] URLHostAllowedCharacterSet];
    uint64_t v10 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v9];
    v11 = [v10 lowercaseString];
    domain = self->_domain;
    self->_domain = v11;

    id v4 = v13;
  }
}

- (void)setPath:(id)a3
{
  id v7 = a3;
  id v4 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  id v5 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v4];
  path = self->_path;
  self->_path = v5;
}

- (int64_t)_flags
{
  v3 = [(NSHTTPCookie2LookupFilter *)self name];
  BOOL v4 = v3 != 0;

  id v5 = [(NSHTTPCookie2LookupFilter *)self value];

  if (v5) {
    uint64_t v6 = (2 * v4) | 4;
  }
  else {
    uint64_t v6 = 2 * v4;
  }
  id v7 = [(NSHTTPCookie2LookupFilter *)self domain];

  if (v7) {
    v6 |= 8uLL;
  }
  uint64_t v8 = [(NSHTTPCookie2LookupFilter *)self path];

  if (v8) {
    uint64_t v9 = v6 | 0x10;
  }
  else {
    uint64_t v9 = v6;
  }
  if ([(NSHTTPCookie2LookupFilter *)self sameSite]) {
    uint64_t v10 = v9 | 0x20;
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = [(NSHTTPCookie2LookupFilter *)self partition];

  if (v11) {
    v10 |= 0x40uLL;
  }
  v12 = [(NSHTTPCookie2LookupFilter *)self newerThanCreationDate];

  if (v12) {
    v10 |= 0x80uLL;
  }
  id v13 = [(NSHTTPCookie2LookupFilter *)self newerThanExpirationDate];

  if (v13) {
    v10 |= 0x100uLL;
  }
  v14 = [(NSHTTPCookie2LookupFilter *)self newerThanLastAccess];

  if (v14) {
    v10 |= 0x200uLL;
  }
  v15 = [(NSHTTPCookie2LookupFilter *)self olderThanCreationDate];

  if (v15) {
    v10 |= 0x400uLL;
  }
  v16 = [(NSHTTPCookie2LookupFilter *)self olderThanExpirationDate];

  if (v16) {
    v10 |= 0x800uLL;
  }
  char v17 = [(NSHTTPCookie2LookupFilter *)self olderThanLastAccess];

  if (v17) {
    int64_t v18 = v10 | 0x1000;
  }
  else {
    int64_t v18 = v10;
  }
  if ([(NSHTTPCookie2LookupFilter *)self secure]) {
    v18 |= 0x2000uLL;
  }
  if ([(NSHTTPCookie2LookupFilter *)self httpOnly]) {
    v18 |= 0x4000uLL;
  }
  if ([(NSHTTPCookie2LookupFilter *)self ignoreHostOnlyFlag]) {
    return v18 | 0x8000;
  }
  else {
    return v18;
  }
}

- (NSHTTPCookie2LookupFilter)initWithCookie:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NSHTTPCookie2LookupFilter;
  id v5 = [(NSHTTPCookie2LookupFilter *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 domain];
    domain = v5->_domain;
    v5->_domain = (NSString *)v8;

    uint64_t v10 = [v4 path];
    path = v5->_path;
    v5->_path = (NSString *)v10;

    uint64_t v12 = [v4 value];
    value = v5->_value;
    v5->_value = (NSString *)v12;

    uint64_t v14 = [v4 partition];
    partition = v5->_partition;
    v5->_partition = (NSString *)v14;

    v5->_secure = [v4 secure];
    v5->_httpOnly = [v4 httpOnly];
    v5->_sameSite = [v4 sameSite];
  }

  return v5;
}

@end