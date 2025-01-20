@interface CalDAVPrincipalSearchSupport
+ (id)nameForWellKnownType:(int)a3;
+ (id)namespaceAndNameForWellKnownType:(int)a3;
+ (id)namespaceForWellKnownType:(int)a3;
+ (id)parserMappingsWithServerSupportSet:(id)a3 includeEmail:(BOOL)a4;
+ (id)propertySearchItemForWellKnownType:(int)a3;
+ (id)resultTypeForRecordType:(id)a3;
@end

@implementation CalDAVPrincipalSearchSupport

+ (id)nameForWellKnownType:(int)a3
{
  if ((a3 - 1) > 6)
  {
    v4 = 0;
  }
  else
  {
    v4 = *off_2641EC1F8[a3 - 1];
  }
  return v4;
}

+ (id)namespaceForWellKnownType:(int)a3
{
  if ((a3 - 1) > 6)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_2641EC230 + a3 - 1);
  }
  return v4;
}

+ (id)namespaceAndNameForWellKnownType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(id)objc_opt_class() namespaceForWellKnownType:*(void *)&a3];
  v5 = [(id)objc_opt_class() nameForWellKnownType:v3];
  v6 = 0;
  if (v5 && v4)
  {
    v6 = [NSString CDVStringWithNameSpace:v4 andName:v5];
  }

  return v6;
}

+ (id)propertySearchItemForWellKnownType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(id)objc_opt_class() namespaceForWellKnownType:*(void *)&a3];
  v5 = [(id)objc_opt_class() nameForWellKnownType:v3];
  v6 = (void *)[objc_alloc(MEMORY[0x263F34B90]) initWithSearchPropertyNameSpace:v4 andName:v5];

  return v6;
}

+ (id)resultTypeForRecordType:(id)a3
{
  id v3 = a3;
  id v4 = (void *)recordToResultMapping;
  if (!recordToResultMapping)
  {
    id v5 = objc_alloc(NSDictionary);
    uint64_t v6 = objc_msgSend(v5, "initWithObjectsAndKeys:", CalDAVPrincipalResultType_Person, CalDAVPrincipalRecordType_Users, CalDAVPrincipalResultType_Group, CalDAVPrincipalRecordType_Groups, CalDAVPrincipalResultType_Resource, CalDAVPrincipalRecordType_Resources, CalDAVPrincipalResultType_Room, CalDAVPrincipalRecordType_Locations, 0);
    v7 = (void *)recordToResultMapping;
    recordToResultMapping = v6;

    id v4 = (void *)recordToResultMapping;
  }
  v8 = [v4 objectForKey:v3];
  v9 = v8;
  if (!v8) {
    v8 = CalDAVPrincipalResultType_Unknown;
  }
  v10 = v8;

  return v10;
}

+ (id)parserMappingsWithServerSupportSet:(id)a3 includeEmail:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF9C0] set];
  id v7 = objc_alloc(MEMORY[0x263F34B00]);
  v8 = (void *)[v7 initWithNameSpace:*MEMORY[0x263F34E10] name:*MEMORY[0x263F34ED8] parseClass:objc_opt_class()];
  [v6 addObject:v8];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __80__CalDAVPrincipalSearchSupport_parserMappingsWithServerSupportSet_includeEmail___block_invoke;
  v21[3] = &unk_2641EC1D8;
  id v9 = v5;
  id v22 = v9;
  id v10 = v6;
  id v23 = v10;
  v11 = (void (**)(void, void, void, void))MEMORY[0x216696070](v21);
  uint64_t v12 = objc_opt_class();
  v11[2](v11, 6, v12, 1);
  uint64_t v13 = objc_opt_class();
  v11[2](v11, 5, v13, 1);
  uint64_t v14 = objc_opt_class();
  v11[2](v11, 7, v14, 1);
  if (v4)
  {
    uint64_t v15 = objc_opt_class();
    v11[2](v11, 4, v15, 0);
  }
  uint64_t v16 = objc_opt_class();
  v11[2](v11, 3, v16, 0);
  uint64_t v17 = objc_opt_class();
  v11[2](v11, 1, v17, 0);
  uint64_t v18 = objc_opt_class();
  v11[2](v11, 2, v18, 0);
  id v19 = v10;

  return v19;
}

void __80__CalDAVPrincipalSearchSupport_parserMappingsWithServerSupportSet_includeEmail___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  id v11 = +[CalDAVPrincipalSearchSupport namespaceForWellKnownType:a2];
  v8 = +[CalDAVPrincipalSearchSupport nameForWellKnownType:a2];
  if ((a4 & 1) != 0
    || (id v9 = *(void **)(a1 + 32)) == 0
    || [v9 supportsPropertyTypeWithNameSpace:v11 andName:v8])
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263F34B00]) initWithNameSpace:v11 name:v8 parseClass:a3];
    [*(id *)(a1 + 40) addObject:v10];
  }
}

@end