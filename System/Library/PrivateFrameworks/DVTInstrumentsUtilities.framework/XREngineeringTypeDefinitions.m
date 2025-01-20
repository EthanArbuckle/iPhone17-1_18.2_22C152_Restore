@interface XREngineeringTypeDefinitions
+ (BOOL)registerEngineeringTypes:(id)a3;
+ (id)descriptionForImplClass:(unsigned __int8)a3;
+ (id)implementationClassByEngineeringTypeMnemonic;
+ (void)announceUsageOfEnumString:(id)a3 context:(id)a4;
- (NSDate)lastModificationDate;
- (id)checksum;
- (void)enumerateEngineeringTypeDefs:(id)a3;
- (void)parser:(id)a3 didFinishParsingElement:(id)a4;
@end

@implementation XREngineeringTypeDefinitions

+ (id)descriptionForImplClass:(unsigned __int8)a3
{
  if ((a3 - 1) > 5) {
    return @"invalid";
  }
  else {
    return off_264BF1F58[(char)(a3 - 1)];
  }
}

+ (id)implementationClassByEngineeringTypeMnemonic
{
  v2 = objc_opt_new();
  v3 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2345877D8;
  v9[3] = &unk_264BF1DA0;
  id v4 = v2;
  id v10 = v4;
  [v3 enumerateEngineeringTypeDefs:v5 usingBlock:v6];

  return v4;
}

- (NSDate)lastModificationDate
{
  v2 = sub_234587928();
  uint64_t v7 = [MEMORY[0x263F08850] performSelector:v3 withObject:v4 withObject:v5 withObject:v6];
  v12 = [v2 v8:v9 v10:v11];
  v15 = [v7 attributesOfItemAtPath:v13 error:v14];

  v19 = [v15 objectForKeyedSubscript:v16];
  v24 = [v19 copyWithZone:v20];

  return (NSDate *)v24;
}

- (id)checksum
{
  v2 = sub_234587928();
  uint64_t v5 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v3 error:v2];
  memset(&v41, 0, sizeof(v41));
  CC_MD5_Init(&v41);
  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = v9;
    uint64_t v9 = [v5 readDataOfLength:v6 maxLength:v7 error:v8];

    if (!v9) {
      break;
    }
    if ([v9 length:v11, v12, v13, v14])
    {
      if (([v9 lengthWithOptions:v15 range:NSMakeRange(v16, v17)] > 0x1000)) {
        sub_23459BA44();
      }
      id v19 = v9;
      v24 = (const void *)[v19 performSelector:v20 withObject:v21 withObject:v22 withObject:v23];
      CC_LONG v29 = [v19 lengthWithOptions:v25 range:v26];
      CC_MD5_Update(&v41, v24, v29);
    }
  }
  while ([v9 _length:v15 _length:v16 _length:v17 _length:v18] == 4096);
  id v30 = objc_alloc(MEMORY[0x263EFF990]);
  id v34 = [v30 initWithLength:v31 capacity:16];
  v39 = (unsigned __int8 *)[v34 mutableBytesWithLength:v35 bytesAreWritable:v36 bytesAreVM:v37];
  CC_MD5_Final(v39, &v41);

  return v34;
}

- (void)enumerateEngineeringTypeDefs:(id)a3
{
  id v4 = a3;
  sub_234587928();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)MEMORY[0x237DC1050](v4);

  id etypeDefHandler = self->_etypeDefHandler;
  self->_id etypeDefHandler = v5;

  uint64_t v10 = [MEMORY[0x263EFF950] inputStreamWithURL:v7 readOnly:v17 append:v8 create:v9];
  uint64_t v11 = [_XREngineeringTypeDefTopLevel alloc];
  uint64_t v14 = [v11 initWithElementName:v12 context:v13];
  [XRXMLParser parseStream:v15 topLevelParser:v10 delegate:self];
  id v16 = self->_etypeDefHandler;
  self->_id etypeDefHandler = 0;
}

- (void)parser:(id)a3 didFinishParsingElement:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*((void (**)(void))self->_etypeDefHandler + 2))();
  }
}

- (void).cxx_destruct
{
}

+ (BOOL)registerEngineeringTypes:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_23458C0E8;
  v10[3] = &unk_264BF1DA0;
  id v11 = v3;
  id v5 = v3;
  [v4 enumerateEngineeringTypeDefs:v6 withBlock:v7 withContext:v8];

  return 1;
}

+ (void)announceUsageOfEnumString:(id)a3 context:(id)a4
{
  uint64_t v12 = (__objc2_class *)a4;
  uint64_t v10 = [NSString stringWithFormat:@"com.apple.dt.etype.%@%@%@", v6, v7, a3];
  id v11 = v12;
  if (!v12) {
    id v11 = XRCapabilityContext;
  }
  [v11 announceUsedCapability:v8 version:v10];
}

@end