@interface CalDAVPostStreamTask
- (NSString)filename;
- (NSString)previousScheduleTag;
- (id)additionalHeaderValues;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)lossyAsciiFilename;
- (id)requestBody;
- (id)requestBodyStream;
- (id)responseData;
- (id)utf8PercentEscapedFilename;
- (void)setFilename:(id)a3;
- (void)setPreviousScheduleTag:(id)a3;
@end

@implementation CalDAVPostStreamTask

- (id)lossyAsciiFilename
{
  v2 = [(CalDAVPostStreamTask *)self filename];
  v3 = [v2 dataUsingEncoding:1 allowLossyConversion:1];

  v4 = (void *)[[NSString alloc] initWithData:v3 encoding:1];
  return v4;
}

- (id)utf8PercentEscapedFilename
{
  if (utf8PercentEscapedFilename_onceToken != -1) {
    dispatch_once(&utf8PercentEscapedFilename_onceToken, &__block_literal_global_5);
  }
  v3 = [(CalDAVPostStreamTask *)self filename];
  v4 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:utf8PercentEscapedFilename_legalCharacters];

  return v4;
}

void __50__CalDAVPostStreamTask_utf8PercentEscapedFilename__block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 97, 26);
  objc_msgSend(v0, "addCharactersInRange:", 65, 26);
  objc_msgSend(v0, "addCharactersInRange:", 48, 10);
  v1 = (void *)utf8PercentEscapedFilename_legalCharacters;
  utf8PercentEscapedFilename_legalCharacters = (uint64_t)v0;
}

- (id)additionalHeaderValues
{
  v15.receiver = self;
  v15.super_class = (Class)CalDAVPostStreamTask;
  v3 = [(CoreDAVPostOrPutTask *)&v15 additionalHeaderValues];
  if (![(CoreDAVPostOrPutTask *)self forceToServer])
  {
    v4 = [(CalDAVPostStreamTask *)self previousScheduleTag];
    uint64_t v5 = +[CalDAVUtils headersFromHeaders:v3 replacingPreconditionsWithScheduleTag:v4];

    v3 = (void *)v5;
  }
  v6 = [(CalDAVPostStreamTask *)self filename];

  if (v6)
  {
    v7 = (void *)[v3 mutableCopy];
    v8 = [(CalDAVPostStreamTask *)self filename];
    int v9 = [v8 canBeConvertedToEncoding:1];

    v10 = NSString;
    if (v9)
    {
      v11 = [(CalDAVPostStreamTask *)self filename];
      v12 = [v10 stringWithFormat:@"attachment filename=\"%@\"", v11];;
    }
    else
    {
      v11 = [(CalDAVPostStreamTask *)self lossyAsciiFilename];
      v13 = [(CalDAVPostStreamTask *)self utf8PercentEscapedFilename];
      v12 = [v10 stringWithFormat:@"attachment filename=\"%@\";filename*=utf-8''%@", v11, v13];;
    }
    [v7 setObject:v12 forKey:*MEMORY[0x263F34A50]];
  }
  else
  {
    v7 = v3;
  }
  return v7;
}

- (id)requestBodyStream
{
  v2 = (void *)MEMORY[0x263EFF950];
  v3 = [(CoreDAVPostOrPutTask *)self requestDataPayload];
  v4 = [v2 inputStreamWithData:v3];

  return v4;
}

- (id)requestBody
{
  return 0;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  return objc_alloc_init(MEMORY[0x263F34B58]);
}

- (id)responseData
{
  v3 = [(CalDAVPostStreamTask *)self responseBodyParser];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(CalDAVPostStreamTask *)self responseBodyParser];
    v6 = [v5 octetStreamData];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)previousScheduleTag
{
  return self->_previousScheduleTag;
}

- (void)setPreviousScheduleTag:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_previousScheduleTag, 0);
}

@end