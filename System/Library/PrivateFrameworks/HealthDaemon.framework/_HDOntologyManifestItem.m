@interface _HDOntologyManifestItem
+ (id)manifestItemFromLine:(id)a3 error:(id *)a4;
+ (uint64_t)_scanForInteger:(void *)a3 string:(void *)a4 label:(uint64_t)a5 error:;
- (NSString)checksum;
- (NSString)identifier;
- (NSString)locale;
- (NSString)region;
- (NSString)schemaType;
- (NSURL)URL;
- (_HDOntologyManifestItem)init;
- (int64_t)schemaVersion;
- (int64_t)size;
- (int64_t)version;
@end

@implementation _HDOntologyManifestItem

- (_HDOntologyManifestItem)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (id)manifestItemFromLine:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 componentsSeparatedByString:@","];
  if ([v7 count] == 9)
  {
    v8 = [v7 objectAtIndexedSubscript:0];
    int64_t v56 = 0;
    v9 = [v7 objectAtIndexedSubscript:1];
    int v10 = +[_HDOntologyManifestItem _scanForInteger:string:label:error:]((uint64_t)a1, (uint64_t)&v56, v9, @"version", (uint64_t)a4);

    v11 = 0;
    if (v10)
    {
      v12 = [v7 objectAtIndexedSubscript:2];
      int64_t v55 = 0;
      v13 = [v7 objectAtIndexedSubscript:3];
      int v14 = +[_HDOntologyManifestItem _scanForInteger:string:label:error:]((uint64_t)a1, (uint64_t)&v55, v13, @"schemaVersion", (uint64_t)a4);

      v11 = 0;
      if (v14)
      {
        v15 = [v7 objectAtIndexedSubscript:4];
        v16 = [v7 objectAtIndexedSubscript:5];
        if ([&stru_1F1728D60 isEqualToString:v16])
        {

          v16 = 0;
        }
        int64_t v54 = 0;
        v17 = [v7 objectAtIndexedSubscript:6];
        int v18 = +[_HDOntologyManifestItem _scanForInteger:string:label:error:]((uint64_t)a1, (uint64_t)&v54, v17, @"size", (uint64_t)a4);

        v11 = 0;
        if (v18)
        {
          v19 = [v7 objectAtIndexedSubscript:7];
          v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v19];
          if (v20)
          {
            v53 = v19;
            v21 = [v7 objectAtIndexedSubscript:8];
            v11 = [_HDOntologyManifestItem alloc];
            int64_t v43 = v56;
            int64_t v44 = v55;
            int64_t v45 = v54;
            id v22 = v8;
            id v23 = v12;
            v24 = v15;
            id v25 = v23;
            v52 = v24;
            id v48 = v24;
            id v47 = v16;
            v51 = v20;
            id v46 = v20;
            id v26 = v21;
            v49 = v25;
            v50 = v22;
            if (v11
              && (v57.receiver = v11,
                  v57.super_class = (Class)_HDOntologyManifestItem,
                  (v11 = objc_msgSendSuper2(&v57, sel_init)) != 0))
            {
              uint64_t v27 = [v22 copy];
              identifier = v11->_identifier;
              v11->_identifier = (NSString *)v27;

              uint64_t v29 = [v25 copy];
              schemaType = v11->_schemaType;
              v11->_schemaType = (NSString *)v29;

              v11->_schemaVersion = v44;
              v11->_version = v43;
              v31 = v48;
              uint64_t v32 = [v48 copy];
              region = v11->_region;
              v11->_region = (NSString *)v32;

              v34 = v47;
              uint64_t v35 = [v47 copy];
              locale = v11->_locale;
              v11->_locale = (NSString *)v35;

              v37 = v46;
              uint64_t v38 = [v46 copy];
              URL = v11->_URL;
              v11->_URL = (NSURL *)v38;

              uint64_t v40 = [v26 copy];
              checksum = v11->_checksum;
              v11->_checksum = (NSString *)v40;

              v11->_size = v45;
            }
            else
            {
              v34 = v47;
              v31 = v48;
              v37 = v46;
            }

            v15 = v52;
            v19 = v53;
            v20 = v51;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid URL string '%@'", v19);
            v11 = 0;
          }
        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"line '%@' has %ld elements, but expected 9", v6, objc_msgSend(v7, "count"));
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)_scanForInteger:(void *)a3 string:(void *)a4 label:(uint64_t)a5 error:
{
  id v8 = a3;
  id v9 = a4;
  self;
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v8];
  uint64_t v11 = [v10 scanInteger:a2];
  if ((v11 & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"%@ '%@' is not a valid integer", v9, v8);
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)schemaType
{
  return self->_schemaType;
}

- (int64_t)schemaVersion
{
  return self->_schemaVersion;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)region
{
  return self->_region;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)checksum
{
  return self->_checksum;
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checksum, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_schemaType, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end