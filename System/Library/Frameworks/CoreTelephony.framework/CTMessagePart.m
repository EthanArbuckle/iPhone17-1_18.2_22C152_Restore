@interface CTMessagePart
- (CTMessagePart)initWithData:(id)a3 contentType:(id)a4;
- (NSData)data;
- (NSString)contentId;
- (NSString)contentLocation;
- (NSString)contentType;
- (id)allContentTypeParameterNames;
- (id)contentTypeParameterWithName:(id)a3;
- (void)addContentTypeParameterWithName:(id)a3 value:(id)a4;
- (void)setContentId:(id)a3;
- (void)setContentLocation:(id)a3;
- (void)setContentType:(id)a3;
- (void)setData:(id)a3;
@end

@implementation CTMessagePart

- (CTMessagePart)initWithData:(id)a3 contentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CTMessagePart;
  v8 = [(CTMessagePart *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    contentType = v8->_contentType;
    v8->_contentType = (NSString *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    contentTypeParams = v8->_contentTypeParams;
    v8->_contentTypeParams = v11;

    uint64_t v13 = [v6 copy];
    data = v8->_data;
    v8->_data = (NSData *)v13;

    contentId = v8->_contentId;
    v8->_contentId = 0;

    contentLocation = v8->_contentLocation;
    v8->_contentLocation = 0;
  }
  return v8;
}

- (id)contentTypeParameterWithName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_contentTypeParams objectForKey:a3];
}

- (void)addContentTypeParameterWithName:(id)a3 value:(id)a4
{
}

- (id)allContentTypeParameterNames
{
  return (id)[(NSMutableDictionary *)self->_contentTypeParams allKeys];
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (NSString)contentLocation
{
  return self->_contentLocation;
}

- (void)setContentLocation:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_contentLocation, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_contentTypeParams, 0);

  objc_storeStrong((id *)&self->_contentType, 0);
}

@end