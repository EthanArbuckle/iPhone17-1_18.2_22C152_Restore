@interface CTXPCWebsheetInfoResponse
+ (id)allowedClassesForArguments;
- (CTXPCWebsheetInfoResponse)initWithURL:(id)a3 postdata:(id)a4;
- (CTXPCWebsheetInfoResponse)initWithURLString:(id)a3 postdata:(id)a4;
- (CTXPCWebsheetInfoResponse)initWithURLString:(id)a3 postdata:(id)a4 type:(id)a5;
- (NSDictionary)postdata;
- (NSString)type;
- (NSString)urlString;
- (NSURL)url;
@end

@implementation CTXPCWebsheetInfoResponse

- (CTXPCWebsheetInfoResponse)initWithURLString:(id)a3 postdata:(id)a4
{
  return [(CTXPCWebsheetInfoResponse *)self initWithURLString:a3 postdata:a4 type:0];
}

- (CTXPCWebsheetInfoResponse)initWithURLString:(id)a3 postdata:(id)a4 type:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  [v11 setObject:v8 forKeyedSubscript:@"urlString"];
  [v11 setObject:v9 forKeyedSubscript:@"postdata"];
  [v11 setObject:v10 forKeyedSubscript:@"type"];
  v14.receiver = self;
  v14.super_class = (Class)CTXPCWebsheetInfoResponse;
  v12 = [(CTXPCMessage *)&v14 initWithNamedArguments:v11];

  return v12;
}

- (CTXPCWebsheetInfoResponse)initWithURL:(id)a3 postdata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  [v8 setObject:v6 forKeyedSubscript:@"url"];
  [v8 setObject:v7 forKeyedSubscript:@"postdata"];
  v11.receiver = self;
  v11.super_class = (Class)CTXPCWebsheetInfoResponse;
  id v9 = [(CTXPCMessage *)&v11 initWithNamedArguments:v8];

  return v9;
}

- (NSString)urlString
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"urlString"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (NSURL)url
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSDictionary)postdata
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"postdata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)type
{
  v2 = [(CTXPCMessage *)self namedArguments];
  id v3 = [v2 objectForKey:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

+ (id)allowedClassesForArguments
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CTXPCWebsheetInfoResponse;
  v2 = objc_msgSendSuper2(&v6, sel_allowedClassesForArguments);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

@end