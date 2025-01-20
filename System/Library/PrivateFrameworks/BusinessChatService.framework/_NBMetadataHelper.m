@interface _NBMetadataHelper
+ (BOOL)hasValue:(id)a3;
+ (id)CCode2CNMap;
+ (id)CN2CCodeMap;
+ (id)countryCodeFromRegionCode:(id)a3;
+ (id)jsonObjectFromZippedDataWithBytes:(char *)a3 compressedLength:(unint64_t)a4 expandedLength:(unint64_t)a5;
+ (id)phoneNumberDataMap;
+ (id)regionCodeFromCountryCode:(id)a3;
- (NSCache)metadataCache;
- (_NBMetadataHelper)init;
- (id)getAllMetadata;
- (id)getMetadataForNonGeographicalRegion:(id)a3;
- (id)getMetadataForRegion:(id)a3;
- (void)setMetadataCache:(id)a3;
@end

@implementation _NBMetadataHelper

- (_NBMetadataHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)_NBMetadataHelper;
  v2 = [(_NBMetadataHelper *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    metadataCache = v2->_metadataCache;
    v2->_metadataCache = v3;
  }
  return v2;
}

+ (id)phoneNumberDataMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39___NBMetadataHelper_phoneNumberDataMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26ACEFC60 != -1) {
    dispatch_once(&qword_26ACEFC60, block);
  }
  v2 = (void *)_MergedGlobals_32;

  return v2;
}

+ (id)CCode2CNMap
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32___NBMetadataHelper_CCode2CNMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_26ACEFC70 != -1) {
    dispatch_once(&qword_26ACEFC70, block);
  }
  v2 = (void *)qword_26ACEFC68;

  return v2;
}

+ (id)CN2CCodeMap
{
  v2 = [a1 phoneNumberDataMap];
  v3 = [v2 objectForKeyedSubscript:@"countryCodeToRegionCodeMap"];

  return v3;
}

- (id)getAllMetadata
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x263EFF000uLL;
  v4 = [MEMORY[0x263EFF960] ISOCountryCodes];
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v6 = [v4 count];
  v7 = v5;
  v8 = self;
  v9 = (void *)[v7 initWithCapacity:v6];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v4;
  uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v35;
    uint64_t v31 = *MEMORY[0x263EFF4D0];
    uint64_t v10 = *MEMORY[0x263EFF500];
    uint64_t v30 = *MEMORY[0x263EFF500];
    v28 = v9;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * v11);
        v13 = objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v12, v31, v28);
        v14 = [*(id *)(v3 + 2400) localeIdentifierFromComponents:v13];
        v15 = [*(id *)(v3 + 2400) currentLocale];
        v16 = [v15 displayNameForKey:v10 value:v14];

        id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v18 = v10;
        v19 = v17;
        if (v16)
        {
          [v17 setObject:v16 forKey:@"name"];
          if (!v12) {
            goto LABEL_9;
          }
LABEL_8:
          [v19 setObject:v12 forKey:@"code"];
          goto LABEL_9;
        }
        unint64_t v21 = v3;
        v22 = v8;
        unint64_t v23 = v21;
        v24 = [*(id *)(v21 + 2400) systemLocale];
        v25 = [v24 displayNameForKey:v18 value:v14];

        if (v25) {
          [v19 setObject:v25 forKey:@"name"];
        }

        v8 = v22;
        unint64_t v3 = v23;
        v9 = v28;
        if (v12) {
          goto LABEL_8;
        }
LABEL_9:
        v20 = [(_NBMetadataHelper *)v8 getMetadataForRegion:v12];
        if (v20) {
          [v19 setObject:v20 forKey:@"metadata"];
        }
        [v9 addObject:v19];

        ++v11;
        uint64_t v10 = v30;
      }
      while (v33 != v11);
      uint64_t v26 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      uint64_t v33 = v26;
    }
    while (v26);
  }

  return v9;
}

+ (id)regionCodeFromCountryCode:(id)a3
{
  id v4 = a3;
  id v5 = [a1 CN2CCodeMap];
  uint64_t v6 = [v4 stringValue];

  v7 = [v5 objectForKeyedSubscript:v6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

+ (id)countryCodeFromRegionCode:(id)a3
{
  id v4 = a3;
  id v5 = [a1 CCode2CNMap];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)getMetadataForRegion:(id)a3
{
  id v4 = StringByTrimming(a3);
  if ([v4 length])
  {
    id v5 = [v4 uppercaseString];

    uint64_t v6 = [(NSCache *)self->_metadataCache objectForKey:v5];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = [(id)objc_opt_class() phoneNumberDataMap];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"countryToMetadata"];

      uint64_t v11 = [v10 objectForKeyedSubscript:v5];
      if (v11)
      {
        id v8 = [[_NBPhoneMetaData alloc] initWithEntry:v11];
        [(NSCache *)self->_metadataCache setObject:v8 forKey:v5];
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
    id v5 = v4;
  }

  return v8;
}

- (id)getMetadataForNonGeographicalRegion:(id)a3
{
  id v4 = [a3 stringValue];
  id v5 = [(_NBMetadataHelper *)self getMetadataForRegion:v4];

  return v5;
}

+ (BOOL)hasValue:(id)a3
{
  unint64_t v3 = StringByTrimming(a3);
  BOOL v4 = [v3 length] != 0;

  return v4;
}

+ (id)jsonObjectFromZippedDataWithBytes:(char *)a3 compressedLength:(unint64_t)a4 expandedLength:(unint64_t)a5
{
  uInt v5 = a4;
  v7 = [MEMORY[0x263EFF990] dataWithLength:a5];
  memset(&strm, 0, sizeof(strm));
  inflateInit2_(&strm, 16, "1.2.12", 112);
  strm.next_in = (Bytef *)a3;
  strm.avail_in = v5;
  id v8 = v7;
  strm.next_out = (Bytef *)[v8 bytes];
  strm.avail_out = [v8 length];
  inflate(&strm, 4);
  inflateEnd(&strm);
  uint64_t v11 = 0;
  v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v11];

  return v9;
}

- (NSCache)metadataCache
{
  return self->_metadataCache;
}

- (void)setMetadataCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end