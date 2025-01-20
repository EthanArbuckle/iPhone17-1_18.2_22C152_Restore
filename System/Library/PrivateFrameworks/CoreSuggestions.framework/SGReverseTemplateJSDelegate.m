@interface SGReverseTemplateJSDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation SGReverseTemplateJSDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 valueForEntitlement:@"com.apple.private.reversetemplated"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 BOOLValue])
  {
    id v9 = objc_alloc((Class)NSSet);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v9, "initWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    id v16 = objc_alloc((Class)NSSet);
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    id v20 = objc_msgSend(v16, "initWithObjects:", v17, v18, v19, objc_opt_class(), 0);
    v21 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SGReverseTemplateJS];
    [v21 setClasses:v14 forSelector:"shouldDownloadFull:reply:" argumentIndex:0 ofReply:0];
    [v21 setClasses:v14 forSelector:"emailToOutput:reply:" argumentIndex:0 ofReply:0];
    [v21 setClasses:v14 forSelector:"textMessageToOutput:reply:" argumentIndex:0 ofReply:0];
    [v21 setClasses:v14 forSelector:"eventClassificationForEntity:reply:" argumentIndex:0 ofReply:0];
    [v21 setClasses:v14 forSelector:"resolveCandidatesForJSDict:reply:" argumentIndex:0 ofReply:0];
    [v21 setClasses:v14 forSelector:"privacyAwareLogsForMLExtractions:reply:" argumentIndex:0 ofReply:0];
    [v21 setClasses:v14 forSelector:"diffSchemas:withExpectedSchemas:reply:" argumentIndex:0 ofReply:0];
    [v21 setClasses:v14 forSelector:"mergeSchemas:withExpectedSchemas:reply:" argumentIndex:0 ofReply:0];
    [v21 setClasses:v20 forSelector:"parseHTML:reply:" argumentIndex:0 ofReply:0];
    [v6 setExportedInterface:v21];
    v22 = objc_opt_new();
    [v6 setExportedObject:v22];

    [v6 resume];
    BOOL v23 = 1;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

@end