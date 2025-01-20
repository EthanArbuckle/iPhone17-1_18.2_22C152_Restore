@interface SGHtmlEntities
+ (id)decodeEntities:(id)a3;
@end

@implementation SGHtmlEntities

+ (id)decodeEntities:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"<" withString:@"&lt;"];
  v4 = objc_opt_new();
  PushParserCtxt = htmlCreatePushParserCtxt(&htmlEntitiesSAXHandlerStruct, v4, 0, 0, 0, XML_CHAR_ENCODING_UTF8);
  uint64_t v6 = htmlCtxtUseOptions(PushParserCtxt, 2107393);
  v7 = (void *)MEMORY[0x1CB79B230](v6);
  id v8 = v3;
  v9 = (const char *)[v8 UTF8String];
  int v10 = strlen(v9);
  htmlParseChunk(PushParserCtxt, v9, v10, 1);
  MEMORY[0x1CB79B070](PushParserCtxt);

  return v4;
}

@end